from django.db import models

# Model untuk memanggil data pada auth_user
class UserModel(models.Model):

    # Data yang diambil pada tabel "auth_user" yaitu data "id", "username", "fullname", "is_superuser", "is_staff", "is_active", dan "verified"
    id = models.AutoField(primary_key=True)
    username = models.CharField(max_length=200, blank=True, null=True)
    full_name = models.CharField(max_length=200, blank=True, null=True)
    is_superuser = models.IntegerField(blank=True, null=True)
    is_staff = models.IntegerField(blank=True, null=True)
    is_active = models.IntegerField(blank=True, null=True)
    verified = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'auth_user'

# Model untuk memanggil data id dan password pada auth_user
class PasswordModel(models.Model):

    # Data yang diambil pada tabel "auth_user" yaitu data "id" dan "password"
    id = models.AutoField(primary_key=True)
    password = models.CharField(max_length=128, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'auth_user'