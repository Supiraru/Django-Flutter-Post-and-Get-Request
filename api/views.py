from rest_framework.generics import ListAPIView, RetrieveAPIView, CreateAPIView, ListCreateAPIView
from .models import Note
from .serializers import noteSerializers
# Create your views here.

class noteView(ListCreateAPIView):
    queryset = Note.objects.all()
    serializer_class = noteSerializers
