import random
from django.db import models

def generate_doctor_id():
    while True:
        doc_id = str(random.randint(100000000, 999999999))  # 9 digits
        if not DoctorUser.objects.filter(doc_id=doc_id).exists():
            return doc_id

class DoctorUser(models.Model):
    doc_id = models.CharField(max_length=9, unique=True, null=True, blank=True)
    full_name = models.CharField(max_length=100)
    phone = models.CharField(max_length=15)
    email = models.EmailField(unique=True)
    password = models.CharField(max_length=255)
    is_active = models.BooleanField(default=False)

    def save(self, *args, **kwargs):
        if not self.doc_id:
            self.doc_id = generate_doctor_id()
        super().save(*args, **kwargs)

    def __str__(self):
        return self.full_name

    
class OTP(models.Model):
    PURPOSE_CHOICES = (
        ('register', 'Register'),
        ('forgot', 'Forgot Password'),
    )

    user_email = models.EmailField()
    code = models.CharField(max_length=6)
    purpose = models.CharField(max_length=20, choices=PURPOSE_CHOICES)
    is_verified = models.BooleanField(default=False)
    created_at = models.DateTimeField(auto_now_add=True)
    is_verified = models.BooleanField(default=False)   # ADD THIS


    def __str__(self):
        return f"{self.user_email} - {self.purpose}"



class DoctorProfile(models.Model):
    doctor = models.OneToOneField(DoctorUser, on_delete=models.CASCADE)
    full_name = models.CharField(max_length=100)
    age = models.IntegerField()
    gender = models.CharField(max_length=10)
    specialization = models.CharField(max_length=100)
    profile_picture = models.ImageField(upload_to='doctor_profiles/', null=True, blank=True)

class DoctorViewedPatient(models.Model):
    doctor = models.ForeignKey(DoctorUser, on_delete=models.CASCADE)
    patient_id = models.CharField(max_length=50)
    patient_name = models.CharField(max_length=100)
    viewed_at = models.DateTimeField(auto_now=True)
    status = models.CharField(max_length=20, default='viewed')

    class Meta:
        unique_together = ('doctor', 'patient_id')
        ordering = ['-viewed_at']

from django.db import models
from django.contrib.auth.models import User


class ChatSession(models.Model):
    user = models.ForeignKey(
    User,
    on_delete=models.CASCADE,
    null=True,
    blank=True
)
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"Session {self.id} - {self.user.username}"


class ChatMessage(models.Model):
    ROLE_CHOICES = (
        ("user", "User"),
        ("model", "Model"),
    )

    session = models.ForeignKey(
        ChatSession,
        on_delete=models.CASCADE,
        related_name="messages"
    )
    role = models.CharField(max_length=10, choices=ROLE_CHOICES)
    content = models.TextField()
    timestamp = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"{self.role}: {self.content[:30]}"