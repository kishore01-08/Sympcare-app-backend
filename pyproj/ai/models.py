from django.db import models
from patient.models import PatientUser

class SymptomSession(models.Model):
    user = models.OneToOneField(PatientUser, on_delete=models.CASCADE)
    symptoms = models.JSONField()
    created_at = models.DateTimeField(auto_now=True)
