from django.urls import path

from .views import noteView

urlpatterns = [
    path('', noteView.as_view()),
]