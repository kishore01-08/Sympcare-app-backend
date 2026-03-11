from django.db import models
from django.contrib.auth.models import User

class ChatHistory(models.Model):
    user = models.CharField(max_length=100)
    symptoms = models.JSONField()
    answers = models.JSONField()
    disease = models.CharField(max_length=200)
    triage = models.IntegerField()
    severity_score = models.FloatField()
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"{self.user} - {self.disease}"
