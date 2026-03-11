from rest_framework.decorators import api_view
from rest_framework.response import Response
from chat.models import ChatHistory
from patient.models import PatientUser


@api_view(['GET'])
def list_sessions(request):

    patient_id = request.session.get('patient_id')

    if not patient_id:
        return Response({"error": "Login required"}, status=401)

    user = PatientUser.objects.get(patient_id=patient_id)

    chats = ChatHistory.objects.filter(user=user.full_name).order_by('-created_at')

    data = []

    for c in chats:
        data.append({
            "session_id": c.id,
            "disease": c.disease,
            "timestamp": c.created_at
        })

    return Response(data)


@api_view(['GET'])
def health_questions(request):

    session_id = request.session.get('selected_session')

    if not session_id:
        return Response({"error": "No session selected"}, status=400)

    chat = ChatHistory.objects.get(id=session_id)

    disease = chat.disease.lower()

    if "fever" in disease:
        questions = [
            "Do you still have fever?",
            "Is body pain reduced?",
            "Energy levels improved?",
            "Sleeping better?",
            "Appetite normal?"
        ]
    else:
        questions = [
            "Pain reduced?",
            "Energy improved?",
            "Sleeping better?",
            "Symptoms reduced?",
            "Feeling normal?"
        ]

    return Response({
        "disease": disease,
        "questions": questions
    })



from .models import HealthAssessment

@api_view(['POST'])
def submit_assessment(request):

    session_id = request.session.get('selected_session')

    if not session_id:
        return Response({"error": "No session selected"}, status=400)

    answers = request.data.get("answers", [])

    total = sum(answers)
    max_score = len(answers) * 5
    percent = int((total / max_score) * 100)

    if percent >= 70:
        status = "Improved"
    elif percent >= 40:
        status = "Stable"
    else:
        status = "Consult Doctor Immediately"

    HealthAssessment.objects.create(
        session_id=session_id,
        improvement_percent=percent,
        status=status
    )

    return Response({
        "improvement_percent": percent,
        "status": status
    })

@api_view(['POST'])
def select_session(request):

    session_id = request.data.get("session_id")

    if not session_id:
        return Response({"error": "Session ID required"}, status=400)

    request.session['selected_session'] = session_id

    return Response({"status": "session_selected"})
