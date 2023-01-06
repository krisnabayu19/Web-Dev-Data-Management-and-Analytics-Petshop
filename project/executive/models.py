from django.db import models

# Model untuk memanggil data pada temporary table auth_user
class UserModel(models.Model):
    
    # Data yang diambil pada tabel "auth_user" yaitu data "id", "fullname", "first_name", "last_name", "email", dan "image"
    id = models.AutoField(primary_key=True)
    full_name = models.CharField(max_length=200, blank=True, null=True)
    first_name = models.CharField(max_length=200, blank=True, null=True)
    last_name = models.CharField(max_length=200, blank=True, null=True)
    email = models.CharField(max_length=200, blank=True, null=True)
    image = models.ImageField(upload_to='images/', null=True, blank=True)

    class Meta:
        managed = False
        db_table = 'auth_user'
