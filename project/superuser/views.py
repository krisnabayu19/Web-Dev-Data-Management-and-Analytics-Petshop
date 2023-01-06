import csv
import io
from pyexpat.errors import messages
from django.http import HttpResponse, HttpResponseRedirect
import numpy
import pandas as pd
from django.shortcuts import render

from unicodedata import name
from unittest import result
from django.shortcuts import render
import pandas as pd
import csv, io
from django.shortcuts import render
from django.contrib import messages
from pymysql import NULL, Timestamp

import statsmodels.api as sm
from datetime import date, datetime
import math
from itertools import groupby
from operator import itemgetter
from django.shortcuts import render, redirect

from authentification.decorators import allowed_superuser
from authentification.views import dataSuperuser
from .models import UserModel,UserDisplayModel
from .forms import UserForm


# Create your views here.
def profileCompany(request):
    return render(request,'profilecompany.html')



@allowed_superuser(allowed_roles=dataSuperuser)
def dataUser(request):
    dataU = UserDisplayModel.objects.all().filter(is_superuser=0)
    countDataA = UserDisplayModel.objects.all().filter(is_staff = 1,is_superuser=0).count()
    countDataE = UserDisplayModel.objects.all().filter(is_staff = 0,is_superuser=0).count()
    data = {
        'dataU':dataU,
        'countDataA':countDataA,
        'countDataE':countDataE,
    }
    return render(request, 'superuser.html',data)

@allowed_superuser(allowed_roles=dataSuperuser)
def editUser(request, id):
    dataU = UserModel.objects.get(id=id)
    current_user = request.user
    if request.method == 'POST':
        form = UserForm(request.POST, instance = dataU)
        if form.is_valid():
            form.save()
            return redirect("/superuser")
        pass
    return render(request,"editsuperuser.html",{'dataU':dataU})
