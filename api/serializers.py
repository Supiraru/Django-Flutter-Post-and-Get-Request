from rest_framework import serializers

from .models import Note

class noteSerializers (serializers.ModelSerializer):
    class Meta:
        model = Note
        fields = ('id', 'title', 'content')