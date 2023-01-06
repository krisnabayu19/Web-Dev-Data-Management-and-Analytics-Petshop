from django import forms
from .models import PasswordModel

# Form untuk mengganti password
class PasswordForm(forms.ModelForm):
    class Meta:
        model = PasswordModel
        fields = "__all__"