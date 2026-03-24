from rest_framework.decorators import api_view
from rest_framework.response import Response
import logging

logger = logging.getLogger(__name__)

from ai_engine.vector_builder import predict
from ai_engine.question_engine import ChatEngine
from ai_engine.analysis import calculate_severity, determine_triage
from ai_engine.symptoms import SYMPTOMS
from chat.models import ChatHistory
from patient.models import PatientUser, MedicalReport
from .models import SymptomSession


# ---------------- SYMPTOM LIST ----------------

@api_view(['GET'])
def list_symptoms(request):
    return Response({
        "symptoms": SYMPTOMS
    })


# ---------------- SAVE SYMPTOMS ----------------
@api_view(['POST'])
def save_symptoms(request):
    patient_id = request.session.get('patient_id') or request.data.get('patient_id')

    if not patient_id:
        return Response({"error": "Login required"}, status=401)

    try:
        user = PatientUser.objects.get(patient_id=patient_id)
    except PatientUser.DoesNotExist:
        return Response({"error": "User not found"}, status=404)

    symptoms = request.data.get("symptoms", [])

    SymptomSession.objects.update_or_create(
        user=user,
        defaults={"symptoms": symptoms}
    )

    return Response({"status": "symptoms_saved"})


# ---------------- QUESTIONS API ----------------
@api_view(['POST'])
def get_questions(request):

    patient_id = request.session.get('patient_id') or request.data.get('patient_id')
    if not patient_id:
        return Response({"error": "Login required"}, status=401)

    try:
        user = PatientUser.objects.get(patient_id=patient_id)
    except PatientUser.DoesNotExist:
        return Response({"error": "User not found"}, status=404)

    # Fetch symptoms from request or session
    symptoms = request.data.get("symptoms")
    if not symptoms:
        session = SymptomSession.objects.filter(user=user).last()
        if not session:
            return Response({"error": "No symptoms selected"}, status=400)
        symptoms = session.symptoms

    # ✅ FIX: create engine
    engine = ChatEngine(symptoms)

    # ✅ FIX: return only JSON-safe data
    return Response({
        "questions": [q["question"] for q in engine.questions]
    })

@api_view(['POST'])
def start_chat(request):
    symptoms = request.data.get("symptoms", [])

    engine = ChatEngine(symptoms)

    request.session["chat_engine"] = {
        "symptoms": symptoms,
        "index": 0,
        "answers": {},
        "questions": engine.questions
    }

    first_q = engine.get_current_question()

    return Response({
        "question": first_q["question"]
    })
@api_view(['POST'])
def answer_question(request):

    session_data = request.session.get("chat_engine")

    if not session_data:
        return Response({"error": "Session expired"}, status=400)

    symptoms = session_data["symptoms"]
    index = session_data["index"]
    answers = session_data["answers"]

    engine = ChatEngine(symptoms)
    if "questions" in session_data:
        engine.questions = session_data["questions"]
    engine.current_index = index
    engine.answers = answers

    user_answer = request.data.get("answer")

    result = engine.process_answer(user_answer)

    # ❌ Invalid answer → repeat
    if result["status"] == "repeat":
        return Response({
            "status": "repeat",
            "message": result["message"],
            "question": result["question"]
        })

    # ✅ Next question
    if result["status"] == "next":
        session_data["index"] = engine.current_index
        session_data["answers"] = engine.answers
        request.session["chat_engine"] = session_data

        return Response({
            "status": "next",
            "question": result["question"]
        })

    # ✅ Completed
    if result["status"] == "complete":
        return Response({
            "status": "complete",
            "answers": result["answers"]
        })
# ---------------- FINAL ANALYSIS ----------------
@api_view(['POST'])
def analyze(request):
    try:
        patient_id = request.session.get('patient_id') or request.data.get('patient_id')
        if not patient_id:
            return Response({"error": "Login required"}, status=401)

        try:
            user = PatientUser.objects.get(patient_id=patient_id)
        except PatientUser.DoesNotExist:
            return Response({"error": "User not found"}, status=404)

        # ---- FETCH SAVED SYMPTOMS ----
        symptoms = request.data.get("symptoms")
        if not symptoms:
            session = SymptomSession.objects.filter(user=user).last()
            if not session:
                return Response({"error": "No symptoms found"}, status=400)
            symptoms = session.symptoms
        
        if not symptoms:
            return Response({"error": "Symptom list is empty"}, status=400)

        answers = request.data.get("answers", {})

        # ---- DISEASE PREDICTION ----
        possible_diseases = predict(symptoms)
        
        if not possible_diseases:
            return Response({"error": "AI could not determine potential diseases based on inputs"}, status=200, data={
                "possible_diseases": [],
                "main_disease": "Inconclusive",
                "triage": 3,
                "severity_score": 0.0
            })

        main_disease = possible_diseases[0]["name"]
#triage calculation based on severity score
        severity_score = calculate_severity(answers)
        triage = determine_triage(severity_score)

        ChatHistory.objects.create(
            user=user.full_name,
            symptoms=symptoms,
            answers=answers,
            disease=main_disease,
            triage=triage,
            severity_score=severity_score
        )

        return Response({
            "possible_diseases": possible_diseases,
            "main_disease": main_disease,
            "triage": triage,
            "severity_score": round(severity_score, 2)
        })

    except Exception as e:
        logger.error(f"Error in analyze view: {str(e)}", exc_info=True)
        return Response({
            "error": "An unexpected error occurred during analysis. Please try again.",
            "details": str(e)
        }, status=500)
    