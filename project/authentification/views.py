from ast import Str
import csv
from email import message
from fileinput import filename
from django.http import HttpResponse
from django.shortcuts import render, redirect
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth import authenticate, login
from django.contrib.auth.forms import AuthenticationForm
from django.contrib.auth import logout
from django.shortcuts import HttpResponseRedirect
from django.core.cache import cache
from django.views.decorators.cache import cache_control
from .models import UserModel
from django.contrib import messages
from django.contrib.auth import update_session_auth_hash

def error_404_view(request,exception):
    return render(request,'pagenotfound.html')

# Array untuk menyimpan data "role" untuk di proses pada "decorators.py"
dataSuperuser = []
dataUserExecutive = []
dataUserAdmin = []

# Fungsi untuk melakukan registrasti akun
def signup(request):
    if request.user.is_authenticated:
        return redirect('/')

    # Kondisi ketika ada method "POST", maka akan langsung memanggil form "UserCreationForm" kemudian disimpan ke dalam variabel "form"
    if request.method == 'POST':
        form = UserCreationForm(request.POST)

        # Kondisi ketika inputan dari user valid, maka data akan disimpan ke dalam database serta langsung redirect ke view HTML "/signin"
        if form.is_valid():
            form.save()
            return redirect('/signin')

        # Konsisi ketika inputan user tidak valid, maka akan menampilkan pesan "Error SignUp! Please Check your Username or Password", dan akan tetap pada halaman "signup.html"
        else:
            messages.info(request, 'Error SignUp! Please Check your Username or Password')
            return render(request, 'signup.html', {'form': form})
    else:
        form = UserCreationForm()
        return render(request, 'signup.html', {'form': form})

# Fungsi Access Denied
def accessdenied(request):
    return render(request, 'accessdenied.html')

# Fungsi untuk login user
def signin(request):
    if request.user.is_authenticated:
        return render(request, 'login.html')

    # Kondisi jika ada method "POST" pada view HTML
    if request.method == 'POST':

        # Request data username dan password
        username_ = request.POST['username']
        password_ = request.POST['password']

        # Mengambil data "verified", "is_staff", dan "is_superuser" berdasarkan data "username" ketika login, yang kemudian disimpan ke dalam variabel "dataU"
        dataU = UserModel.objects.filter(username=username_).values('verified','is_staff','is_superuser')
        
        # Array untuk menyimpan data role
        arrDataR = []

        # Array untuk menyimpan data verified
        arrDataV = []

        # Melakukan proses perulangan untuk mengecek status user yang login apakah "superuser", atau "staff"
        for i in dataU:
            if i['is_superuser'] == 1 and i['is_staff'] == 0:
                arrDataR.append('superuser')
                arrDataV.append(str(i['verified']))
            elif i['is_superuser'] == 0 and i['is_staff'] == 0:
                arrDataR.append('executive')
                arrDataV.append(str(i['verified']))
            else :
                arrDataR.append('admin')
                arrDataV.append(str(i['verified']))

        # Merubah data role dari bentuk array ke bentuk variabel 
        dataR = ''.join(arrDataR)

        # Merubah data verified dari bentuk array ke bentuk variabel 
        dataV = ''.join(arrDataV)

        # Kondisi untuk mengecek user yang login apakah sudah ter-verifikasi atau belum ter-verifikasi
        if dataV == '' or dataV == "0":

            # Jika belum ter-verifikasi akan memunculkan pesan "Error Signin! Account Unverified by Admin" dan akan tetap pada halaman "login.html"
            form = AuthenticationForm(request.POST)
            messages.info(request, 'Error Signin! Account Unverified by Admin')
            return render(request, 'login.html', {'form': form})
        else: 

            # Jika sudah ter-verifikasi akan langsung mengarah ke halaman "dashboard" sesuai dengan role user
            user = authenticate(request, username=username_, password=password_)

            # Jika user tidak "None", is_superuser == 1 dan dataR berisikan data "superuser", maka akan redirect ke URL "/superuser"
            if user is not None and user.is_superuser ==1 and dataR in ['superuser']:
                login(request, user)
                dataSuperuser.append('Superuser')
                return redirect('/superuser')

            # Jika user tidak "None", is_staff == 1 dan dataR berisikan data "executive", maka akan redirect ke URL "/executive"
            elif user is not None and user.is_staff == 0 and dataR in ['executive']:
                login(request, user)
                dataUserExecutive.append('Executive')
                return redirect('/executive')

            # Jika user tidak "None", is_staff == 1 dan dataR berisikan data "admin", maka akan redirect ke URL "/admindashboard"
            elif user is not None and user.is_staff == 1 and dataR in ['admin']:
                dataUserAdmin.append('Admin')
                login(request, user)
                return redirect('/admindashboard')

            # Selain itu akan tetap pada halaman 'login.html'
            else:
                form = AuthenticationForm(request.POST)
                messages.info(request, 'Error Signin! Please Check your Password')
                return render(request, 'login.html', {'form': form})
    else:
        form = AuthenticationForm()
        return render(request, 'login.html', {'form': form})

# Fungsi untuk keluar dari akun user, dan menghapus session user yang tersimpan pada database
@cache_control(no_cache=True, must_revalidate=True)  
def signout(request):
    logout(request)
    request.session.flush()
    return redirect('/signin')

