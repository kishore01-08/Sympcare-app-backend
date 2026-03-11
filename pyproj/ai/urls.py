from django.urls import path
from .views import get_questions, analyze, list_symptoms, save_symptoms

urlpatterns = [
    path('symptoms/', list_symptoms),
    path('questions/', get_questions),
    path('analyze/', analyze),
    path('save-symptoms/', save_symptoms),
    ]
