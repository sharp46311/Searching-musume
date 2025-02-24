from rest_framework import serializers
from .models import ArtistClass, MemberClassSignup

class ArtistClassSerializer(serializers.ModelSerializer):
    class Meta:
        model = ArtistClass
        fields = [
            'id', 'name', 'category', 'tags', 'is_free', 'class_type',
            'thumbnail', 'url', 'start_date', 'end_date', 'cost',
        ]

class MemberClassSignupSerializer(serializers.ModelSerializer):
    class Meta:
        model = MemberClassSignup
        fields = [
            'id', 'member', 'artist_class', 'signed_up_at',
        ]

class VideoUrlRequestSerializer(serializers.Serializer):
    email = serializers.EmailField()