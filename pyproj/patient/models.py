
import random
from django.db import models
from django.utils import timezone
from datetime import timedelta

class OTP(models.Model):
    user_email = models.EmailField()
    code = models.CharField(max_length=6)
    purpose = models.CharField(max_length=20)
    created_at = models.DateTimeField(auto_now_add=True)

    def is_expired(self):
        return timezone.now() > self.created_at + timedelta(minutes=5)




def generate_patient_id():
    while True:
        patient_id = str(random.randint(100000000, 999999999))  # 9 digits
        if not PatientUser.objects.filter(patient_id=patient_id).exists():
            return patient_id


class PatientUser(models.Model):
    patient_id = models.CharField(max_length=9, unique=True, null=True, blank=True)
    full_name = models.CharField(max_length=100)
    phone = models.CharField(max_length=15)
    email = models.EmailField(unique=True)
    password = models.CharField(max_length=255)
    is_active = models.BooleanField(default=False)
    profile_completed = models.BooleanField(default=False)

    def save(self, *args, **kwargs):
        if not self.patient_id:
            self.patient_id = generate_patient_id()
        super().save(*args, **kwargs)

class PatientHealthProfile(models.Model):
    patient = models.OneToOneField(PatientUser, on_delete=models.CASCADE)
    age = models.IntegerField()
    gender = models.CharField(max_length=10)
    height = models.FloatField()   # in cm
    weight = models.FloatField()   # in kg
    blood_group = models.CharField(max_length=5)
    existing_conditions = models.TextField(blank=True)
    profile_picture = models.ImageField(upload_to='profile_pics/', null=True, blank=True)

    def __str__(self):
        return self.patient.full_name
    
from chat.models import ChatHistory

class MedicalReport(models.Model):
    patient = models.ForeignKey(PatientUser, on_delete=models.CASCADE)
    file = models.FileField(upload_to='reports/')
    analysis = models.TextField(null=True, blank=True)
    uploaded_at = models.DateTimeField(auto_now_add=True)

class RecentActivity(models.Model):
    patient = models.ForeignKey(PatientUser, on_delete=models.CASCADE)
    activity_type = models.CharField(max_length=50) # 'report_view', 'consultation_view', 'report_upload', 'consultation_start'
    title = models.CharField(max_length=200)
    item_id = models.CharField(max_length=50, null=True, blank=True)
    timestamp = models.DateTimeField(auto_now=True)

    class Meta:
        ordering = ['-timestamp']

    

