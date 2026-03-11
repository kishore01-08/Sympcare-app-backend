from django.urls import path

from .views import chat_api, doctor_change_password, doctor_forgot_reset_password, doctor_forgot_send_otp, doctor_forgot_verify_otp, doctor_register, session_detail, verify_otp, doctor_login, patient_overview, save_viewed_patient, list_viewed_patients
from . import views
from .views import create_doctor_profile, get_doctor_profile, delete_doctor, get_doctor_account_info, update_doctor_profile

urlpatterns = [
    path('register/', doctor_register),
    path('verify-otp/', verify_otp),
    path('login/', doctor_login),
    path('patient-overview/', patient_overview),
    path('session-detail/', session_detail),
    path('forgot/send-otp/', doctor_forgot_send_otp),
    path('forgot/verify-otp/', doctor_forgot_verify_otp),
    path('forgot/reset-password/', doctor_forgot_reset_password),
    path('change-password/', doctor_change_password),
    path("doc-chat/", chat_api, name="chat_api"),
    path('profile/create/', create_doctor_profile),
    path('profile/get/', get_doctor_profile),
    path('profile/update/', update_doctor_profile),
    path('delete/', delete_doctor),
    path('account-info/', get_doctor_account_info),
    path('save-viewed-patient/', save_viewed_patient),
    path('list-viewed-patients/', list_viewed_patients),
    path('list-all-patients/', views.list_all_patients),
    path('update-patient-status/', views.update_patient_status),
    path('dashboard-stats/', views.dashboard_stats),

]
