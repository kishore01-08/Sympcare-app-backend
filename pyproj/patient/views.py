from rest_framework.decorators import api_view
from rest_framework.response import Response
from django.core.mail import send_mail
import random

from .models import MedicalReport, PatientUser, OTP, RecentActivity
from .activity_logger import log_activity
from .serializers import PatientRegisterSerializer

from .models import PatientHealthProfile
from .serializers import HealthProfileSerializer
from django.contrib.auth.hashers import make_password, check_password
from .models import PatientUser
from chat.models import ChatHistory


from .models import PatientHealthProfile


@api_view(['POST'])
def patient_register(request):
    serializer = PatientRegisterSerializer(data=request.data)

    if serializer.is_valid():
        user = serializer.save()   # ONLY THIS

        otp_code = str(random.randint(100000, 999999))
        OTP.objects.create(user_email=user.email, code=otp_code, purpose='register')

        send_mail(
            'Patient OTP',
            f'Your OTP is {otp_code}',
            'yourgmail@gmail.com',
            [user.email],
        )

        return Response({"status": "otp_sent"})

    return Response(serializer.errors, status=400)




from django.utils import timezone
from datetime import timedelta

@api_view(['POST'])
def verify_patient_otp(request):
    email = request.data.get('email')
    code = request.data.get('otp')

    try:
        user = PatientUser.objects.get(email=email)
        otp = OTP.objects.filter(user_email=email, code=code).last()

        if not otp:
            return Response({"error": "Invalid OTP"}, status=400)

        # ✅ Check Expiry (5 minutes)
        if otp.is_expired():
            otp.delete()
            return Response({"error": "OTP expired. Please request new OTP."}, status=400)

        # ✅ Generate Patient ID if not exists
        if not user.patient_id:
            import random
            while True:
                patient_id = str(random.randint(100000000, 999999999))
                if not PatientUser.objects.filter(patient_id=patient_id).exists():
                    break
            user.patient_id = patient_id

        user.is_active = True
        user.save()

        otp.delete()

        # Send Patient ID to Email
        send_mail(
            'Your Patient ID',
            f'Registration successful!\n\nYour Patient ID is: {user.patient_id}',
            'yourgmail@gmail.com',
            [user.email],
        )

        return Response({
            "status": "otp_verified",
            "patient_id": user.patient_id
        })

    except PatientUser.DoesNotExist:
        return Response({"error": "User not found"}, status=404)
    
import random
from rest_framework.decorators import api_view
from rest_framework.response import Response
from django.core.mail import send_mail
from .models import PatientUser, OTP


@api_view(['POST'])
def resend_patient_otp(request):
    email = request.data.get('email')

    try:
        user = PatientUser.objects.get(email=email)

        # ❌ Prevent resend if already verified
        if user.is_active:
            return Response({"error": "User already verified"}, status=400)

        # ✅ Delete old OTPs (clean up)
        OTP.objects.filter(user_email=email, purpose='register').delete()

        # ✅ Generate new OTP
        new_otp = str(random.randint(100000, 999999))

        OTP.objects.create(
            user_email=email,
            code=new_otp,
            purpose='register'
        )

        # ✅ Send Email
        send_mail(
            'Your New OTP',
            f'Your new OTP is: {new_otp}',
            'yourgmail@gmail.com',
            [email],
        )

        return Response({"status": "otp_resent"})

    except PatientUser.DoesNotExist:
        return Response({"error": "User not found"}, status=404)

@api_view(['POST'])
def patient_login(request):
    patient_id = request.data.get('patient_id')
    password = request.data.get('password')

    try:
        user = PatientUser.objects.get(patient_id=patient_id)

        if not check_password(password, user.password):
            return Response({"error": "Wrong password"}, status=400)


        # CHECK PROFILE SAFELY
        has_profile = PatientHealthProfile.objects.filter(patient=user).exists()

        if not has_profile:
            return Response({"error": "Complete health profile first"}, status=400)

        request.session['patient_id'] = user.patient_id
        return Response({
            "status": "login_success",
            "patient_id": user.patient_id,
            "full_name": user.full_name
        })

    except PatientUser.DoesNotExist:
        return Response({"error": "User not found"}, status=404)
    
    
@api_view(['POST'])
def create_health_profile(request):
    patient_id = request.session.get('patient_id')
    
    # Fallback: Check request body (for initial profile creation before login)
    if not patient_id:
        patient_id = request.data.get('patient_id')

    if not patient_id:
        return Response({"error": "Login or OTP required"}, status=401)

    try:
        patient = PatientUser.objects.get(patient_id=patient_id)
    except PatientUser.DoesNotExist:
        return Response({"error": "User not found"}, status=404)

    serializer = HealthProfileSerializer(data=request.data)
    if serializer.is_valid():
        serializer.save(patient=patient)
        patient.is_active = True   # activate here
        patient.save()
        return Response({"status": "profile_saved"})

    return Response(serializer.errors, status=400)


@api_view(['POST'])
def get_health_profile(request):
    patient_id = request.session.get('patient_id')

    if not patient_id:
        patient_id = request.data.get('patient_id')

    if not patient_id:
        return Response({"error": "Patient ID required"}, status=400)

    try:
        patient = PatientUser.objects.get(patient_id=patient_id)
        profile = PatientHealthProfile.objects.get(patient=patient)
    except PatientUser.DoesNotExist:
         return Response({"error": "User not found"}, status=404)
    except PatientHealthProfile.DoesNotExist:
        return Response({"error": "Profile not found"}, status=404)

    serializer = HealthProfileSerializer(profile, context={'request': request})
    return Response(serializer.data)

from rest_framework.decorators import api_view, parser_classes
from rest_framework.parsers import MultiPartParser, FormParser
from rest_framework.response import Response

@api_view(['PUT'])
@parser_classes([MultiPartParser, FormParser])
def update_health_profile(request):


    patient_id = request.data.get('patient_id')

    if not patient_id:
        return Response({"error": "Patient ID required"}, status=401)

    try:
        patient = PatientUser.objects.get(patient_id=patient_id)
        profile, created = PatientHealthProfile.objects.get_or_create(patient=patient)
    except PatientUser.DoesNotExist:
        return Response({"error": "Patient not found"}, status=404)

    # 🔥 MANUAL IMAGE UPDATE FIX
    if 'profile_picture' in request.FILES:
        # delete old image if exists
        if profile.profile_picture:
            profile.profile_picture.delete(save=False)

        profile.profile_picture = request.FILES['profile_picture']
        profile.save()

    serializer = HealthProfileSerializer(
        profile,
        data=request.data,
        partial=True,
        context={'request': request}
    )

    if serializer.is_valid():
        updated_profile = serializer.save()
        
        # Keep PatientUser.full_name in sync if full_name changed
        if 'full_name' in request.data:
            patient.full_name = request.data['full_name']
            patient.save()
            
        return Response({
            "status": "profile_updated",
            "data": serializer.data
        })

    return Response(serializer.errors, status=400)


@api_view(['POST'])
def delete_patient(request):
    patient_id = request.data.get('patient_id')

    if not patient_id:
        return Response({"error": "patient_id required"}, status=400)

    try:
        user = PatientUser.objects.get(patient_id=patient_id)
        user.delete()
        return Response({"status": "deleted", "patient_id": patient_id})
    except PatientUser.DoesNotExist:
        return Response({"error": "User not found"}, status=404)


@api_view(['POST'])
def get_patient_account_info(request):
    patient_id = request.session.get('patient_id')
    if not patient_id:
        patient_id = request.data.get('patient_id')

    if not patient_id:
        return Response({"error": "Patient ID required"}, status=400)

    try:
        user = PatientUser.objects.get(patient_id=patient_id)
        return Response({
            "full_name": user.full_name,
            "email": user.email,
            "patient_id": user.patient_id
        })
    except PatientUser.DoesNotExist:
        return Response({"error": "User not found"}, status=404)


@api_view(['POST'])
@parser_classes([MultiPartParser, FormParser])
def upload_report(request):

    patient_id = request.session.get('patient_id') or request.data.get('patient_id')

    if not patient_id:
        return Response({"error": "Patient ID required"}, status=401)

    try:
        patient = PatientUser.objects.get(patient_id=patient_id)
    except PatientUser.DoesNotExist:
        return Response({"error": "Patient not found"}, status=404)

    file = request.FILES.get('file')

    # 🔥 ADD THIS CHECK
    if not file:
        return Response({"error": "No file uploaded"}, status=400)

    report = MedicalReport.objects.create(
        patient=patient,
        file=file
    )

    log_activity(patient, 'report_upload', f"Uploaded Report: {file.name}", report.id)

    return Response({
        "status": "uploaded",
        "file_id": report.id,
        "file_url": request.build_absolute_uri(report.file.url) if report.file else None
    })

@api_view(['GET'])
def list_reports(request):
    patient_id = request.session.get('patient_id') or request.query_params.get('patient_id')

    if not patient_id:
        return Response({"error": "Patient ID required"}, status=401)

    try:
        patient = PatientUser.objects.get(patient_id=patient_id)
    except PatientUser.DoesNotExist:
        return Response({"error": "Patient not found"}, status=404)

    data = []

    reports = MedicalReport.objects.filter(
        patient=patient
    ).order_by('-uploaded_at')

    for r in reports:
        if not r.analysis or r.analysis.strip() == "":
            continue

        import json
        analysis_preview = r.analysis
        triage_val = None
        severity_score_val = 0.0
        try:
            analysis_data = json.loads(r.analysis)
            analysis_preview = analysis_data.get("report", r.analysis)
            triage_val = analysis_data.get("triage")
            severity_score_val = analysis_data.get("severity_score", 0.0)
        except:
            pass

        # Prepend base URL if not already absolute
        file_url_full = r.file.url if r.file else None
        if file_url_full and not file_url_full.startswith('http'):
            file_url_full = request.build_absolute_uri(file_url_full)

        data.append({
            "report_id": r.id,
            "patient_id": patient.patient_id,
            "file_url": file_url_full,
            "analysis": analysis_preview,
            "uploaded_at": r.uploaded_at,
            "type": "File Analysis",
            "triage": triage_val,
            "severity_score": severity_score_val
        })

    return Response(data)
    # 2. Fetch Symptom-based Reports (ChatHistory where no MedicalReport links to it)
    # This covers chats that didn't involve a file upload


from django.http import HttpResponse
from .models import MedicalReport
from .utils import analyze_file


from rest_framework.decorators import api_view
from rest_framework.response import Response

@api_view(['POST'])
def run_analysis(request, report_id):

    report = MedicalReport.objects.filter(id=report_id).first()

    if not report:
        return Response({"error": "Report not found"}, status=404)

    file_path = report.file.path

    result_data = analyze_file(file_path)

    import json
    report.analysis = json.dumps(result_data)
    report.save()

    log_activity(report.patient, 'report_analysis', f"Analyzed Report: {report.file.name}", report.id)

    return Response({
        "status": "success",
        "report_id": report.id,
        "report": result_data.get("report", ""),
    })



#--forgot password--
@api_view(['POST'])
def forgot_password_send_otp(request):
    email = request.data.get('email')

    try:
        PatientUser.objects.get(email=email)
    except PatientUser.DoesNotExist:
        return Response({"error": "User not found"}, status=404)

    otp_code = str(random.randint(100000, 999999))

    OTP.objects.create(
        user_email=email,
        code=otp_code,
        purpose='forgot'
    )

    send_mail(
        'Forgot Password OTP',
        f'Your OTP is {otp_code}',
        'yourgmail@gmail.com',
        [email],
    )

    return Response({"status": "otp_sent"})

@api_view(['POST'])
def forgot_password_verify_otp(request):
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

@api_view(['POST'])
def reset_password(request):
    email = request.data.get('email')
    new_password = request.data.get('new_password')
    confirm_password = request.data.get('confirm_password')

    if new_password != confirm_password:
        return Response({"error": "Passwords do not match"}, status=400)

    try:
        user = PatientUser.objects.get(email=email)
    except PatientUser.DoesNotExist:
        return Response({"error": "User not found"}, status=404)

    user.password = make_password(new_password)
    user.save()

    OTP.objects.filter(user_email=email, purpose='forgot').delete()

    return Response({"status": "password_reset_success"})


@api_view(['GET'])
def get_report_analysis(request, report_id):
    try:
        report = MedicalReport.objects.filter(id=report_id).first()

        if not report:
            return Response({"error": "Report not found"}, status=404)

        if not report.analysis:
            return Response({"error": "Report not analyzed yet"}, status=400)

        import json
        try:
            analysis_data = json.loads(report.analysis)
        except Exception:
            analysis_data = {"report": report.analysis}

        log_activity(report.patient, 'report_view', f"Viewed Analysis: {report.file.name}", report.id)

        file_url_full = report.file.url if report.file else None
        if file_url_full and not file_url_full.startswith('http'):
            file_url_full = request.build_absolute_uri(file_url_full)

        return Response({
            "status": "success",
            "report_id": report.id,
            "report": analysis_data.get("report", ""),
            "triage": analysis_data.get("triage"),
            "severity_score": analysis_data.get("severity_score", 0.0),
            "file_url": file_url_full,
            "uploaded_at": report.uploaded_at
        })

    except Exception as e:
        return Response({"error": str(e)}, status=500)


from django.contrib.auth.hashers import check_password, make_password
from rest_framework.decorators import api_view
from rest_framework.response import Response
from .models import PatientUser

@api_view(['POST'])
def change_password(request):
    patient_id = request.session.get('patient_id')

    if not patient_id:
        patient_id = request.data.get('patient_id')

    if not patient_id:
        return Response({"error": "Login required"}, status=401)

    current_password = request.data.get("current_password")
    new_password = request.data.get("new_password")
    confirm_password = request.data.get("confirm_password")

    if not current_password or not new_password or not confirm_password:
        return Response({"error": "All fields required"}, status=400)

    if new_password != confirm_password:
        return Response({"error": "New passwords do not match"}, status=400)

    try:
        user = PatientUser.objects.get(patient_id=patient_id)
    except PatientUser.DoesNotExist:
        return Response({"error": "User not found"}, status=404)

    # CHECK CURRENT PASSWORD
    if not check_password(current_password, user.password):
        return Response({"error": "Current password incorrect"}, status=400)

    # UPDATE PASSWORD
    user.password = make_password(new_password)
    user.save()

    return Response({"status": "password_changed_success"})


@api_view(['POST', 'GET'])
def list_recent_activity(request):
    patient_id = request.session.get('patient_id') or request.data.get('patient_id') or request.query_params.get('patient_id')

    if not patient_id:
        return Response({"error": "Patient ID required"}, status=401)

    try:
        patient = PatientUser.objects.get(patient_id=patient_id)
        activities = RecentActivity.objects.filter(patient=patient) # Show all for history page
        
        data = []
        for act in activities:
            data.append({
                "type": act.activity_type,
                "title": act.title,
                "item_id": act.item_id,
                "timestamp": act.timestamp
            })
        
        return Response({"activities": data})
    except PatientUser.DoesNotExist:
        return Response({"error": "User not found"}, status=404)

