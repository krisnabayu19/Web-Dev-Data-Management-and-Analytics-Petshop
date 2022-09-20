from django.db import models

class UserModel(models.Model):
    id = models.AutoField(primary_key=True)
    username = models.CharField(max_length=200, blank=True, null=True)
    full_name = models.CharField(max_length=200, blank=True, null=True)
    role = models.CharField(max_length=200, blank=True, null=True)
    is_active = models.IntegerField(blank=True, null=True)
    verified = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'auth_user'

class PasswordModel(models.Model):
    id = models.AutoField(primary_key=True)
    password = models.CharField(max_length=128, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'auth_user'