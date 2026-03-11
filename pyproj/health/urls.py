from django.urls import path
from .views import list_sessions, health_questions, select_session, submit_assessment

urlpatterns = [
    path('sessions/', list_sessions),
    path('select-session/', select_session),
    path('questions/', health_questions),
    path('submit/', submit_assessment),
]