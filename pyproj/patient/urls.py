from django.urls import path
from django.conf import settings
from django.conf.urls.static import static
from .views import create_health_profile, delete_patient, forgot_password_verify_otp, resend_patient_otp
from .views import forgot_password_send_otp, get_health_profile, list_reports, get_patient_account_info
from .views import patient_login, patient_register, update_health_profile, upload_report, reset_password
from .views import run_analysis, verify_patient_otp
from .views import get_report_analysis, change_password, list_recent_activity

urlpatterns = [
    path('register/', patient_register),
    path('verify-otp/', verify_patient_otp),
    path('resend-otp/', resend_patient_otp),
    path('login/', patient_login),
    path('health/create/', create_health_profile),
    path('health/get/', get_health_profile),
    path('health/update/', update_health_profile),
    path('delete/', delete_patient),
    path('account-info/', get_patient_account_info),
    path('upload-report/', upload_report),
    path('reports/', list_reports),
    path("reports/<int:report_id>/analyze/", run_analysis),
    path("reports/<int:report_id>/", get_report_analysis),
    path('forgot/send-otp/', forgot_password_send_otp),
    path('forgot/verify-otp/', forgot_password_verify_otp),
    path('forgot/reset-password/', reset_password),
    path('change-password/', change_password),
    path('recent-activity/', list_recent_activity),
]
if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)