from django import forms
from .models import PasswordModel

class PasswordForm(forms.ModelForm):
    class Meta:
        model = PasswordModel
        fields = "__all__"