from rest_framework import serializers
from .models import DoctorUser
from django.contrib.auth.hashers import make_password

class DoctorRegisterSerializer(serializers.ModelSerializer):
    password = serializers.CharField(write_only=True)

    class Meta:
        model = DoctorUser
        fields = ['doc_id', 'full_name', 'phone', 'email', 'password']
        read_only_fields = ['doc_id']

    def create(self, validated_data):
        validated_data['password'] = make_password(validated_data['password'])
        return DoctorUser.objects.create(**validated_data)

    
from rest_framework import serializers
from .models import DoctorUser, DoctorProfile, DoctorViewedPatient
from django.contrib.auth.hashers import check_password

from .models import DoctorUser, DoctorProfile
from django.contrib.auth.hashers import check_password

class DoctorLoginSerializer(serializers.Serializer):
    doc_id = serializers.CharField()
    password = serializers.CharField()

    def validate(self, data):
        doc_id = data.get("doc_id")
        password = data.get("password")

        try:
            user = DoctorUser.objects.get(doc_id=doc_id)
        except DoctorUser.DoesNotExist:
            raise serializers.ValidationError("Invalid Doctor ID")

        if not check_password(password, user.password):
            raise serializers.ValidationError("Wrong Password")

        if not user.is_active:
            raise serializers.ValidationError("Verify OTP first")

        # NEW CHECK ⭐
        has_profile = DoctorProfile.objects.filter(doctor=user).exists()

        if not has_profile:
            raise serializers.ValidationError("Complete profile first")

        data["user"] = user
        return data


from rest_framework import serializers
from .models import DoctorProfile

class DoctorProfileSerializer(serializers.ModelSerializer):
    profile_picture = serializers.SerializerMethodField()

    fullName = serializers.CharField(source='full_name', read_only=True)
    profilePicture = serializers.SerializerMethodField()

    class Meta:
        model = DoctorProfile
        fields = ['full_name', 'fullName', 'age', 'gender', 'specialization', 'profile_picture', 'profilePicture']

    def get_profile_picture(self, obj):
        request = self.context.get('request')
        if obj.profile_picture:
            # If request is available, build absolute URI
            if request:
                return request.build_absolute_uri(obj.profile_picture.url)
            # Fallback if request context is missing
            return obj.profile_picture.url
        return None

    def get_profilePicture(self, obj):
        return self.get_profile_picture(obj)
class ViewedPatientSerializer(serializers.ModelSerializer):
    class Meta:
        model = DoctorViewedPatient
        fields = ['patient_id', 'patient_name', 'viewed_at', 'status', 'symptoms']

