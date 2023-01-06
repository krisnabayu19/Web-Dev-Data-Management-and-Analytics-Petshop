from django.shortcuts import render, redirect

from admindata.models import Barang, Pembelian, Penjualan,Supplier,Pelanggan

from authentification.decorators import allowed_executive
from .models import UserModel
from .forms import UserForm
from authentification.views import dataUserExecutive
from django.db.models import Sum

from django.shortcuts import render, redirect
from django.contrib.auth.models import User



# Create your views here.
# Fungsi untuk dashboard user executive
@allowed_executive(allowed_roles=dataUserExecutive)
def dashboardExecutive(request):
    context = {}

    dataPenj = Penjualan.objects.filter().values()
    sumDataPenj = Penjualan.objects.aggregate(Sum('total'))
    countDataP = Pelanggan.objects.filter().count()
    countDataB = Barang.objects.filter().count()
    countDataS = Supplier.objects.filter().count()
    countDataPenj = Penjualan.objects.filter().count()
    countDataPemb = Pembelian.objects.filter().count()
    current_user = request.user
    dataU = UserModel.objects.get(id=current_user.id)

    dataMonth = []
    dataTotalPenj = []
    dataJumlahPenj = []
    for i in dataPenj:
        dataMonth.append(str(i['created_at'].date()))
        dataTotalPenj.append(i['total'])
        dataJumlahPenj.append(i['jumlah_barang'])

    data = {
        'sumDataPenj' : sumDataPenj['total__sum'],
        'countDataP':countDataP,
        'countDataB':countDataB,
        'countDataS' :countDataS,
        'countDataPenj' : countDataPenj,
        'countDataPemb' : countDataPemb,
        'dataMonth' : dataMonth,
        'dataTotalPenj' : dataTotalPenj,
        'dataU':dataU,
    }

    context["dataMonth"] = dataMonth
    context["dataTotalPenj"] = dataTotalPenj
    context["dataJumlahPenj"] = dataJumlahPenj
    context["sumDataPenj"] = sumDataPenj['total__sum']
    context["countDataPenj"] = countDataPenj
    context["countDataP"] = countDataP
    context["countDataS"] = countDataS
    context["dataU"] = dataU
    return render(request, 'executive.html',context)

# Fungsi untuk mengganti password user executive
@allowed_executive(allowed_roles=dataUserExecutive)
def changePassword(request):
    current_user = request.user
    strUsername = str(current_user.username)
    if request.method == 'POST':
        newPassword = request.POST['new_password']
        u = User.objects.get(username=strUsername)
        u.set_password(str(newPassword))
        u.save()
        return redirect('/signin')
    return render(request, 'password_change.html')

# Fungsi untuk memperbaharui data profil user executive
@allowed_executive(allowed_roles=dataUserExecutive)
def editProfileExecutive(request):
    current_user = request.user
    dataU = UserModel.objects.get(id=current_user.id)
    data = {
        'dataU' : dataU,
    }
    if request.method == 'POST':
        form = UserForm(request.POST,request.FILES,instance = dataU)
        current_user = request.user
        if form.is_valid():
            form.save()
            return redirect("/executive")
        pass

    return render(request,'editprofileexecutive.html',data)



