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
from authentification.views import dataUserArray
from .models import UserModel
from .forms import UserForm


# Create your views here.
@allowed_superuser(allowed_roles=dataUserArray)
def dataUser(request):
    dataU = UserModel.objects.all()
    return render(request, 'superuser.html',{'dataU':dataU})

@allowed_superuser(allowed_roles=dataUserArray)
def editUser(request, id):
    dataU = UserModel.objects.get(id=id)
    current_user = request.user
    if request.method == 'POST':
        form = UserForm(request.POST, instance = dataU)
        if form.is_valid():
            form.save()
            return redirect("/superuser")
        pass
    return render(request,"editdatauser.html",{'dataU':dataU})
