from rest_framework.decorators import api_view
from rest_framework.response import Response
import random
from django.core.mail import send_mail
from .models import OTP, DoctorUser
from .serializers import DoctorRegisterSerializer
from patient.models import MedicalReport, PatientUser, PatientHealthProfile
from ai.models import SymptomSession
from chat.models import ChatHistory
from .models import DoctorUser, DoctorProfile, DoctorViewedPatient
from .serializers import DoctorProfileSerializer


@api_view(['POST'])
def doctor_register(request):
    serializer = DoctorRegisterSerializer(data=request.data)
    if serializer.is_valid():
        user = serializer.save(is_active=False)

        otp_code = str(random.randint(100000, 999999))
        OTP.objects.create(
            user_email=user.email,
            code=otp_code,
            purpose='register'
        )

        send_mail(
            'Your OTP Code',
            f'Your OTP is {otp_code}',
            'yourgmail@gmail.com',
            [user.email],
        )

        return Response({"status": "otp_sent"})
    
    return Response(serializer.errors, status=400)

@api_view(['POST'])
def verify_otp(request):
    email = request.data.get("email")
    code = request.data.get("otp")

    otp = OTP.objects.filter(
        user_email=email,
        code=code,
        purpose="register"
    ).last()

    if not otp:
        return Response({"error": "Invalid OTP"}, status=400)

    doctor = DoctorUser.objects.get(email=email)

    doctor.is_active = True
    doctor.save()

    # IMPORTANT ⭐
    request.session['doctor_id'] = doctor.doc_id

    return Response({
        "status": "otp_verified",
        "doctor": doctor.doc_id
    })



from .serializers import DoctorLoginSerializer

@api_view(['POST'])
def doctor_login(request):
    serializer = DoctorLoginSerializer(data=request.data)

    if serializer.is_valid():
        user = serializer.validated_data['user']

        return Response({
            "status": "login_success",
            "doctor": user.doc_id,
            "full_name": user.full_name
        })

    return Response(serializer.errors, status=400)



@api_view(['POST'])
def patient_overview(request):
    patient_id = request.data.get("patient_id")

    try:
        doc_id = request.data.get("doc_id") or request.session.get("doctor_id")
        patient = PatientUser.objects.get(patient_id=patient_id)
        profile = PatientHealthProfile.objects.filter(patient=patient).first()
        
        # Get doctor-specific status for this patient
        status = 'viewed'
        if doc_id:
            try:
                doctor = DoctorUser.objects.get(doc_id=doc_id)
                viewed = DoctorViewedPatient.objects.get(doctor=doctor, patient_id=patient_id)
                status = viewed.status
            except (DoctorUser.DoesNotExist, DoctorViewedPatient.DoesNotExist):
                pass

        chats = ChatHistory.objects.filter(
            user=patient.full_name
        ).order_by('-created_at')

        history = []
        for c in chats:
            history.append({
                "session_id": c.id,
                "disease": c.disease,
                "triage": c.triage,
                "date": c.created_at
            })

        return Response({
            "patient_name": patient.full_name,
            "phone": patient.phone,
            "email": patient.email,
            "status": status,

            "profile": {
                "age": profile.age if profile else None,
                "height": profile.height if profile else None,
                "gender": profile.gender if profile else None,
                "weight": profile.weight if profile else None,
                "blood_group": profile.blood_group if profile else None,
                "conditions": profile.existing_conditions if profile else None,
                "profile_picture": request.build_absolute_uri(profile.profile_picture.url) if profile and profile.profile_picture else None,
            },

            "history": history
        })

    except PatientUser.DoesNotExist:
        return Response({"error": "Patient not found"}, status=404)


@api_view(['POST'])
def session_detail(request):
    session_id = request.data.get("session_id")

    try:
        chat = ChatHistory.objects.get(id=session_id)

        report = MedicalReport.objects.filter(
            session=chat
        ).order_by('-uploaded_at').first()

        return Response({
            "symptoms": chat.symptoms,
            "possible_diseases": chat.disease,
            "triage": chat.triage,
            "severity_score": chat.severity_score,
            "date": chat.created_at,

            "ai_analysis": report.analysis if report else None,
            "file_url": request.build_absolute_uri(report.file.url) if report and report.file else None
        })

    except ChatHistory.DoesNotExist:
        return Response({"error": "Session not found"}, status=404)




@api_view(['POST'])
def doctor_forgot_send_otp(request):
    email = request.data.get('email')

    if not email:
        return Response({"error": "Email required"}, status=400)

    try:
        DoctorUser.objects.get(email=email)
    except DoctorUser.DoesNotExist:
        return Response({"error": "Doctor not found"}, status=404)

    otp_code = str(random.randint(100000, 999999))

    OTP.objects.create(
        user_email=email,
        code=otp_code,
        purpose='forgot'
    )

    send_mail(
        'Doctor Password OTP',
        f'Your OTP is {otp_code}',
        'yourgmail@gmail.com',
        [email],
    )

    return Response({"status": "otp_sent"})

@api_view(['POST'])
def doctor_forgot_verify_otp(request):
    email = request.data.get('email')
    code = request.data.get('otp')

    otp = OTP.objects.filter(
        user_email=email,
        code=code,
        purpose='forgot'
    ).last()

    if not otp:
        return Response({"error": "Invalid OTP"}, status=400)

    return Response({"status": "otp_verified"})



from django.contrib.auth.hashers import make_password

@api_view(['POST'])
def doctor_forgot_reset_password(request):
    email = request.data.get('email')
    
    if not email:
        email = request.session.get('forgot_doctor_email')

    if not email:
        return Response({"error": "Email required"}, status=400)

    otp_code = request.data.get('otp')
    new_password = request.data.get('new_password')
    confirm_password = request.data.get('confirm_password')

    if new_password != confirm_password:
        return Response({"error": "Passwords do not match"}, status=400)

    otp = OTP.objects.filter(
        user_email=email,
        code=otp_code,
        purpose='forgot'
    ).last()

    if not otp:
        return Response({"error": "Invalid OTP"}, status=400)

    user = DoctorUser.objects.get(email=email)
    user.password = make_password(new_password)
    user.save()

    OTP.objects.filter(user_email=email, purpose='forgot').delete()
    request.session.pop('forgot_doctor_email', None)

    return Response({"status": "password_reset_success"})




from django.contrib.auth.hashers import check_password, make_password

@api_view(['POST'])
def doctor_change_password(request):
    doc_id = request.session.get('doc_id')

    if not doc_id:
        doc_id = request.data.get('doc_id')

    if not doc_id:
        return Response({"error": "Login required"}, status=401)

    current_password = request.data.get("current_password")
    new_password = request.data.get("new_password")
    confirm_password = request.data.get("confirm_password")

    if new_password != confirm_password:
        return Response({"error": "Passwords do not match"}, status=400)

    try:
        doctor = DoctorUser.objects.get(doc_id=doc_id)
    except DoctorUser.DoesNotExist:
        return Response({"error": "Doctor not found"}, status=404)

    if not check_password(current_password, doctor.password):
        return Response({"error": "Current password incorrect"}, status=400)

    doctor.password = make_password(new_password)
    doctor.save()

    return Response({"status": "password_changed_success"})


from .models import DoctorProfile
from .serializers import DoctorProfileSerializer

@api_view(['POST'])
def create_doctor_profile(request):
    doctor_id = request.session.get('doctor_id')
    if not doctor_id:
        doctor_id = request.data.get('doc_id')

    if not doctor_id:
        return Response({"error": "Doctor ID required (verify OTP first)"}, status=401)

    try:
        doctor = DoctorUser.objects.get(doc_id=doctor_id)
    except DoctorUser.DoesNotExist:
        return Response({"error": "Doctor not found"}, status=404)

    serializer = DoctorProfileSerializer(data=request.data)

    if serializer.is_valid():
        serializer.save(doctor=doctor)
        return Response({"status": "profile_created"})

    return Response(serializer.errors, status=400)


@api_view(['POST'])
def get_doctor_profile(request):
    doc_id = request.data.get('doc_id')
    if not doc_id:
        doc_id = request.session.get('doc_id')

    if not doc_id:
        return Response({"error": "Login required"}, status=401)

    try:
        doctor = DoctorUser.objects.get(doc_id=doc_id)
        profile = DoctorProfile.objects.get(doctor=doctor)
    except DoctorProfile.DoesNotExist:
        return Response({"error": "Profile not found"}, status=404)

    serializer = DoctorProfileSerializer(profile, context={'request': request})
    return Response(serializer.data)


@api_view(['PUT'])
def update_doctor_profile(request):
    doc_id = request.data.get('doc_id')
    if not doc_id:
        doc_id = request.session.get('doc_id')

    if not doc_id:
        return Response({"error": "Login required"}, status=401)

    try:
        doctor = DoctorUser.objects.get(doc_id=doc_id)
        profile = DoctorProfile.objects.get(doctor=doctor)
    except (DoctorUser.DoesNotExist, DoctorProfile.DoesNotExist):
        return Response({"error": "Profile not found"}, status=404)

    # Use serializer for partial update
    serializer = DoctorProfileSerializer(profile, data=request.data, partial=True, context={'request': request})
    if serializer.is_valid():
        updated_profile = serializer.save()
        
        # Keep DoctorUser.full_name in sync if profile full_name changed
        if 'full_name' in request.data:
            doctor.full_name = updated_profile.full_name
            doctor.save()
            
        return Response({"status": "profile_updated", "data": serializer.data})
    
    return Response(serializer.errors, status=400)


@api_view(['POST'])
def delete_doctor(request):
    doc_id = request.data.get('doc_id')

    if not doc_id:
        return Response({"error": "doc_id required"}, status=400)

    try:
        user = DoctorUser.objects.get(doc_id=doc_id)
        user.delete()
        return Response({"status": "deleted", "doc_id": doc_id})
    except DoctorUser.DoesNotExist:
        return Response({"error": "Doctor not found"}, status=404)


@api_view(['POST'])
def get_doctor_account_info(request):
    doc_id = request.session.get('doc_id')
    if not doc_id:
        doc_id = request.data.get('doc_id')

    if not doc_id:
        return Response({"error": "Doctor ID required"}, status=400)

    try:
        user = DoctorUser.objects.get(doc_id=doc_id)
        return Response({
            "full_name": user.full_name,
            "email": user.email,
            "doc_id": user.doc_id
        })
    except DoctorUser.DoesNotExist:
        return Response({"error": "Doctor not found"}, status=404)

@api_view(['POST'])
def save_viewed_patient(request):
    doc_id = request.data.get('doc_id')
    patient_id = request.data.get('patient_id')
    patient_name = request.data.get('patient_name')
    status = request.data.get('status', 'viewed')

    if not all([doc_id, patient_id, patient_name]):
        return Response({"error": "doc_id, patient_id, and patient_name are required"}, status=400)

    try:
        doctor = DoctorUser.objects.get(doc_id=doc_id)
        defaults = {'patient_name': patient_name, 'status': status}

        viewed_patient, created = DoctorViewedPatient.objects.update_or_create(
            doctor=doctor,
            patient_id=patient_id,
            defaults=defaults
        )
        return Response({"status": "success", "viewed_at": viewed_patient.viewed_at})
    except DoctorUser.DoesNotExist:
        return Response({"error": "Doctor not found"}, status=404)

@api_view(['POST'])
def list_viewed_patients(request):
    doc_id = request.data.get('doc_id')

    if not doc_id:
        return Response({"error": "doc_id required"}, status=400)

    try:
        doctor = DoctorUser.objects.get(doc_id=doc_id)
        viewed_patients = DoctorViewedPatient.objects.filter(doctor=doctor).order_by('-viewed_at')
        
        data = []
        for vp in viewed_patients:
            profile = PatientHealthProfile.objects.filter(patient__patient_id=vp.patient_id).first()
            data.append({
                "patient_id": vp.patient_id,
                "patient_name": vp.patient_name,
                "viewed_at": vp.viewed_at,
                "status": vp.status,
                "profile_picture": request.build_absolute_uri(profile.profile_picture.url) if profile and profile.profile_picture else None
            })
        
        return Response(data)
    except DoctorUser.DoesNotExist:
        return Response({"error": "Doctor not found"}, status=404)


@api_view(['POST'])
def update_patient_status(request):
    doc_id = request.data.get('doc_id')
    patient_id = request.data.get('patient_id')
    status = request.data.get('status')

    if not all([doc_id, patient_id, status]):
        # Also try to get doc_id from session if not provided
        doc_id = doc_id or request.session.get('doc_id')
        if not all([doc_id, patient_id, status]):
            return Response({"error": "doc_id, patient_id, and status are required"}, status=400)

    try:
        doctor = DoctorUser.objects.get(doc_id=doc_id)
        viewed_patient = DoctorViewedPatient.objects.get(doctor=doctor, patient_id=patient_id)
        viewed_patient.status = status
        viewed_patient.save()
        return Response({"status": "success", "new_status": viewed_patient.status})
    except (DoctorUser.DoesNotExist, DoctorViewedPatient.DoesNotExist):
        return Response({"error": "Record not found"}, status=404)


@api_view(['POST'])
def dashboard_stats(request):
    doc_id = request.data.get('doc_id')
    if not doc_id:
        doc_id = request.session.get('doc_id')

    if not doc_id:
        return Response({"error": "doc_id required"}, status=400)

    try:
        doctor = DoctorUser.objects.get(doc_id=doc_id)
        finalized_count = DoctorViewedPatient.objects.filter(doctor=doctor, status='COMPLETED').count()
        pending_count = DoctorViewedPatient.objects.filter(doctor=doctor).exclude(status='COMPLETED').count()

        return Response({
            "finalized_count": finalized_count,
            "pending_count": pending_count
        })
    except DoctorUser.DoesNotExist:
        return Response({"error": "Doctor not found"}, status=404)


from .models import ChatSession
from rest_framework import status



@api_view(['GET'])
def list_all_patients(request):
    try:
        patients = PatientUser.objects.all().order_by('full_name')
        data = []
        for p in patients:
            profile = PatientHealthProfile.objects.filter(patient=p).first()
            data.append({
                "patient_id": p.patient_id,
                "full_name": p.full_name,
                "email": p.email,
                "profile_picture": request.build_absolute_uri(profile.profile_picture.url) if profile and profile.profile_picture else None,
            })
        return Response(data)
    except Exception as e:
        return Response({"error": str(e)}, status=500)

@api_view(["POST"])
def chat_api(request):
    message = request.data.get("message")
    session_id = request.data.get("session_id")

    if session_id:
        session = ChatSession.objects.get(id=session_id)
    else:
        session = ChatSession.objects.create()   # no user

    reply = chat_with_gemini(session, message)

    return Response({
        "reply": reply,
        "session_id": session.id
    })