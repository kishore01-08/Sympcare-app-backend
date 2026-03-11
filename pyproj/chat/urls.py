from django.urls import path

from .views import clear_history, get_history, start_session, get_history_detail

urlpatterns = [
    path('history/', get_history),
    path('history/<int:history_id>/', get_history_detail),
    path('clear-history/', clear_history),
    path('start-session/', start_session),
]

