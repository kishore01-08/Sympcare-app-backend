from django.urls import path
from .views import get_questions, analyze, list_symptoms, save_symptoms, start_chat, answer_question

urlpatterns = [
    path('symptoms/', list_symptoms),
    path('questions/', get_questions),
    path('analyze/', analyze),
    path('save-symptoms/', save_symptoms),
    path('start_chat/', start_chat),
    path('answer_question/', answer_question),
]
