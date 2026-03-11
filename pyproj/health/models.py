from django.db import models

class HealthAssessment(models.Model):
    session_id = models.IntegerField()
    improvement_percent = models.IntegerField()
    status = models.CharField(max_length=20)
    created_at = models.DateTimeField(auto_now_add=True)
