from rest_framework.decorators import api_view
from rest_framework.response import Response
from .models import ChatHistory
from patient.models import PatientUser
from patient.activity_logger import log_activity


@api_view(['GET'])
def get_history(request):
    patient_id = request.query_params.get('patient_id') or request.session.get('patient_id')
    
    if patient_id:
        try:
            patient = PatientUser.objects.get(patient_id=patient_id)
            history = ChatHistory.objects.filter(user=patient.full_name).order_by('-created_at')
        except PatientUser.DoesNotExist:
            return Response({"error": "Patient not found"}, status=404)
    else:
        # Fallback for admin/doctor views if no ID provided (though usually ID is expected now)
        history = ChatHistory.objects.all().order_by('-created_at')

    data = []
    for h in history:
        data.append({
            "id": h.id,
            "user": h.user,
            "symptoms": h.symptoms,
            "answers": h.answers,
            "disease": h.disease,
            "triage": h.triage,
            "severity_score": h.severity_score,
            "date": h.created_at
        })

    return Response({"history": data})

@api_view(['GET'])
def get_history_detail(request, history_id):
    try:
        h = ChatHistory.objects.get(id=history_id)
        
        # Find patient user for activity logging
        try:
            patient = PatientUser.objects.get(full_name=h.user)
            log_activity(patient, 'consultation_view', f"Viewed Assessment: {h.disease}", h.id)
        except:
            pass

        return Response({
            "id": h.id,
            "user": h.user,
            "symptoms": h.symptoms,
            "answers": h.answers,
            "disease": h.disease,
            "triage": h.triage,
            "severity_score": h.severity_score,
            "date": h.created_at
        })
    except ChatHistory.DoesNotExist:
        return Response({"error": "Symptom report not found"}, status=404)

@api_view(['DELETE'])
def clear_history(request):
    patient_id = request.session.get('patient_id')

    if not patient_id:
        return Response({"error": "Login required"}, status=401)

    try:
        user = PatientUser.objects.get(patient_id=patient_id)

        ChatHistory.objects.filter(user=user.full_name).delete()

        return Response({"status": "history_cleared"})

    except PatientUser.DoesNotExist:
        return Response({"error": "User not found"}, status=404)

@api_view(['POST'])
def start_session(request):
    patient_id = request.data.get('patient_id')
    if not patient_id:
        return Response({"error": "Patient ID required"}, status=400)

    try:
        user = PatientUser.objects.get(patient_id=patient_id)
        
        session = ChatHistory.objects.create(
            user=user.full_name,
            symptoms=[],
            answers={},
            disease="Pending Analysis",
            triage=3,
            severity_score=0.0
        )

        log_activity(user, 'consultation_start', "Started New Consultation", session.id)

        return Response({
            "status": "session_started",
            "session_id": session.id
        })

    except PatientUser.DoesNotExist:
        return Response({"error": "User not found"}, status=404)