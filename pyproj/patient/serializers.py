from rest_framework import serializers
from .models import PatientUser
from .models import PatientHealthProfile
from django.contrib.auth.hashers import make_password
from .models import MedicalReport


from rest_framework import serializers
from .models import PatientHealthProfile

from rest_framework import serializers
from .models import PatientHealthProfile

class HealthProfileSerializer(serializers.ModelSerializer):
    patient_id = serializers.CharField(source='patient.patient_id', read_only=True)
    full_name = serializers.CharField(source='patient.full_name', read_only=True)
    profile_picture = serializers.SerializerMethodField()

    class Meta:
        model = PatientHealthProfile
        fields = [
            'patient_id',
            'full_name',
            'age',
            'gender',
            'height',
            'weight',
            'blood_group',
            'existing_conditions',
            'profile_picture'
        ]

    def get_profile_picture(self, obj):
        request = self.context.get('request')
        if obj.profile_picture:
            if request:
                return request.build_absolute_uri(obj.profile_picture.url)
            return obj.profile_picture.url
        return None

class PatientRegisterSerializer(serializers.ModelSerializer):

    class Meta:
        model = PatientUser
        fields = ['full_name', 'phone', 'email', 'password']

    def create(self, validated_data):
        validated_data['password'] = make_password(validated_data['password'])
        return super().create(validated_data)

class MedicalReportSerializer(serializers.ModelSerializer):
    class Meta:
        model = MedicalReport
        fields = '__all__'
