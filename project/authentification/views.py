from ast import Str
import csv
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


dataUserArray = []
print(dataUserArray)
def signup(request):
    if request.user.is_authenticated:
        return redirect('/')
    if request.method == 'POST':
        form = UserCreationForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('/signin')
        else:
            messages.info(request, 'Error SignUp! Please Check your Username or Password')
            return render(request, 'signup.html', {'form': form})
    else:
        form = UserCreationForm()
        return render(request, 'signup.html', {'form': form})



# Access Denied
def accessdenied(request):
    return render(request, 'accessdenied.html')
 
def signin(request):
    if request.user.is_authenticated:
        return render(request, 'home.html')
    if request.method == 'POST':
        # dataR = UserModel.objects.all()
        username_ = request.POST['username']
        password_ = request.POST['password']
        dataU = UserModel.objects.filter(username=username_).values('role','verified')
        
        arrDataR = []
        arrDataV = []
        for i in dataU:
            arrDataR.append(str(i['role']))
            arrDataV.append(str(i['verified']))
        dataR = ''.join(arrDataR)
        dataV = ''.join(arrDataV)
        print(dataV)

        # Verify Check
        if dataV == '' or dataV == "0":
            form = AuthenticationForm(request.POST)
            messages.info(request, 'Error Signin! Account Unverified by Admin')
            return render(request, 'login.html', {'form': form})
        else:         
            user = authenticate(request, username=username_, password=password_)
            if user is not None and user.is_superuser and dataR in ['superuser']:
                login(request, user)
                dataUserArray.append('Superuser')
                return redirect('/superuser')
            elif user is not None and user.is_staff and dataR in ['executive']:
                login(request, user)
                dataUserArray.append('Executive')
                return redirect('/executive')
            elif user is not None and user.is_staff and dataR in ['admin']:
                dataUserArray.append('Admin')
                login(request, user)
                return redirect('/admindashboard')

            elif user is not None and user.is_staff and dataR in ['bendahara']:
                dataUserArray.append('Bendahara')
                login(request, user)
                return redirect('/bendahara')
            elif user is not None and user.is_staff and dataR in ['anggota']:
                dataUserArray.append('Anggota')
                login(request, user)
                return redirect('/anggota')
            else:
                form = AuthenticationForm(request.POST)
                messages.info(request, 'Error Signin! Please Check your Password')
                return render(request, 'login.html', {'form': form})
    else:
        form = AuthenticationForm()
        return render(request, 'login.html', {'form': form})

 
def profile(request): 
    return render(request, 'profile.html')

@cache_control(no_cache=True, must_revalidate=True)  
def signout(request):
    logout(request)
    return redirect('/signin')

