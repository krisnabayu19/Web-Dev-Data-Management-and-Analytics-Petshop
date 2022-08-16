import csv
from django.shortcuts import render, redirect
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth import authenticate, login
from django.contrib.auth.forms import AuthenticationForm
from django.contrib.auth import logout
from django.shortcuts import HttpResponseRedirect
from django.core.cache import cache
from django.views.decorators.cache import cache_control

from .models import Barang, Pembelian, Penjualan,Supplier,Pelanggan
from datetime import datetime
from .forms import BarangForm,SupplierForm,PelangganForm,PembelianForm,PenjualanForm
import pandas as pd
  

  
def signup(request):
    if request.user.is_authenticated:
        return redirect('/')
    if request.method == 'POST':
        form = UserCreationForm(request.POST)
        if form.is_valid():
            form.save()
            username = form.cleaned_data.get('username')
            password = form.cleaned_data.get('password1')
            user = authenticate(username=username, password=password)
            login(request, user)
            return redirect('/')
        else:
            return render(request, 'signup.html', {'form': form})
    else:
        form = UserCreationForm()
        return render(request, 'signup.html', {'form': form})
   
def home(request): 
    return render(request, 'home.html')
   
  
def signin(request):
    if request.user.is_authenticated:
        return render(request, 'home.html')
    if request.method == 'POST':
        username = request.POST['username']
        password = request.POST['password']
        user = authenticate(request, username=username, password=password)
        if user is not None:
            login(request, user)
            return redirect('/')
        else:
            msg = 'Error Login'
            form = AuthenticationForm(request.POST)
            return render(request, 'login.html', {'form': form, 'msg': msg})
    else:
        form = AuthenticationForm()
        return render(request, 'login.html', {'form': form})
  
def profile(request): 
    return render(request, 'profile.html')


# CRUD Data Barang
def dataBarang(request):
    dataB= Barang.objects.all()
    return render(request, 'Barang/barang.html',{'dataB':dataB})

def tambahBarang(request):
    if request.method == 'POST':
        form = BarangForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect("/dataBarang")
        pass
    return render(request, 'Barang/tambahbarang.html')

def editBarang(request, id):
    dataB = Barang.objects.get(id_barang=id)
    if request.method == 'POST':
        form = BarangForm(request.POST, instance = dataB)
        if form.is_valid():
            form.save()
            return redirect("/dataBarang")
        pass
    return render(request,"Barang/editbarang.html",{'dataB':dataB})

def hapusBarang(request, id):
    dataB = Barang.objects.get(id_barang=id)
    dataB.delete()
    return redirect("/dataBarang")


# CRUD Supplier
def dataSupplier(request):
    dataS= Supplier.objects.all()
    return render(request, 'Supplier/supplier.html',{'dataS':dataS})

def tambahSupplier(request):
    if request.method == 'POST':
        form = SupplierForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect("/dataSupplier")
        pass
    return render(request, 'Supplier/tambahsupplier.html')

def editSupplier(request, id):
    dataS = Supplier.objects.get(id_supplier=id)
    if request.method == 'POST':
        form = SupplierForm(request.POST, instance = dataS)
        if form.is_valid():
            form.save()
            return redirect("/dataSupplier")
        pass
    return render(request,"Supplier/editsupplier.html",{'dataS':dataS})

def hapusSupplier(request, id):
    dataS = Supplier.objects.get(id_supplier=id)
    dataS.delete()
    return redirect("/dataSupplier")


# CRUD Pelanggan
def dataPelanggan(request):
    dataP= Pelanggan.objects.all()
    return render(request, 'Pelanggan/pelanggan.html',{'dataP':dataP})

def tambahPelanggan(request):
    if request.method == 'POST':
        form = PelangganForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect("/dataPelanggan")
        pass
    return render(request, 'Pelanggan/tambahpelanggan.html')

def editPelanggan(request, id):
    dataP = Pelanggan.objects.get(id_pelanggan=id)
    if request.method == 'POST':
        form = PelangganForm(request.POST, instance = dataP)
        if form.is_valid():
            form.save()
            return redirect("/dataPelanggan")
        pass
    return render(request,"Pelanggan/editpelanggan.html",{'dataP':dataP})

def hapusPelanggan(request, id):
    dataP = Pelanggan.objects.get(id_pelanggan=id)
    dataP.delete()
    return redirect("/dataPelanggan")


# CRUD Pembelian Barang
def dataPembelian(request):
    dataPemb = Pembelian.objects.all()
    return render(request, 'Pembelian/pembelian.html',{'dataPemb':dataPemb})

def tambahPembelian(request):
    dataB = Barang.objects.all()
    dataS = Supplier.objects.all()
    dataHarga = Barang.objects.values_list('harga_barang')
    data = {
        'dataB':dataB,
        'dataS':dataS,
    }
    if request.method == 'POST':
        form = PembelianForm(request.POST)
        if form.is_valid():

            idBarang = form.cleaned_data['id_barang']
            strIdBarang = str(idBarang)
            strIdBarang1 =  strIdBarang.split()
            idBarang = strIdBarang1[-1]
            idBarang2 = idBarang.replace('(','').replace(')','')
            idBarangFix = int(idBarang2)

            jumlah = form.cleaned_data['jumlah_barang_pembelian']
            obj = form.save(commit=False)
            dataHarga1 = dataHarga.get(id_barang=idBarangFix)
            hargaBarang = int(dataHarga1[0])
            obj.total = jumlah * hargaBarang

            obj.save()
            return redirect("/dataPembelian")
        pass
    return render(request, 'Pembelian/tambahpembelian.html',data)

def editPembelian(request, id):
    dataB = Barang.objects.all()
    dataS = Supplier.objects.all()
    dataPemb = Pembelian.objects.get(id_pembelian=id)
    dataHarga = Barang.objects.values_list('harga_barang')
    data = {
        'dataB':dataB,
        'dataS':dataS,
        'dataPemb' : dataPemb,

    }

    if request.method == 'POST':
        form = PembelianForm(request.POST, instance = dataPemb)
        if form.is_valid():
            idBarang = form.cleaned_data['id_barang']
            strIdBarang = str(idBarang)
            strIdBarang1 =  strIdBarang.split()
            idBarang = strIdBarang1[-1]
            idBarang2 = idBarang.replace('(','').replace(')','')
            idBarangFix = int(idBarang2)

            jumlah = form.cleaned_data['jumlah_barang_pembelian']
            obj = form.save(commit=False)
            dataHarga1 = dataHarga.get(id_barang=idBarangFix)
            hargaBarang = int(dataHarga1[0])
            obj.total = jumlah * hargaBarang

            obj.save()

            return redirect("/dataPembelian")
        pass
    return render(request,"Pembelian/editpembelian.html",data)

def hapusPembelian(request, id):
    dataPemb = Pembelian.objects.get(id_pembelian=id)
    dataPemb.delete()
    return redirect("/dataPembelian")


# CRUD Penjualan
def dataPenjualan(request):
    dataPenj = Penjualan.objects.all()
    return render(request, 'Penjualan/penjualan.html',{'dataPenj':dataPenj})

def tambahPenjualan(request):
    dataB = Barang.objects.all()
    dataP = Pelanggan.objects.all()
    dataHarga = Barang.objects.values_list('harga_barang')
    numLastTransaksi = 0
    with open('D:\Data-Mining-Project-Dwik\project\last-data-transaksi.csv', 'r', encoding='utf-8') as last_transaksi:
        for i in last_transaksi:
            numLastTransaksi = numLastTransaksi + int(i)
    data = {
        'dataB':dataB,
        'dataP':dataP,
        'dataLastTransac':numLastTransaksi,
    }
    if request.method == 'POST':
        form = PenjualanForm(request.POST)
        jenis_transaksi = request.POST['jenis_transaksi']
        if form.is_valid():
            if jenis_transaksi == 'Transaksi Sama' :
                strLastTransaksi = str(numLastTransaksi)
                id_transaksi = str('trnsk_'+strLastTransaksi)

                idBarang = form.cleaned_data['id_barang']
                strIdBarang = str(idBarang)
                strIdBarang1 =  strIdBarang.split()
                idBarang = strIdBarang1[-1]
                idBarang2 = idBarang.replace('(','').replace(')','')
                idBarangFix = int(idBarang2)

                jumlah = form.cleaned_data['jumlah_barang']
                obj = form.save(commit=False)
                dataHarga1 = dataHarga.get(id_barang=idBarangFix)
                hargaBarang = int(dataHarga1[0])
                obj.total = jumlah * hargaBarang
                obj.id_transaksi = id_transaksi
                obj.save()

                return redirect("/dataPenjualan")
            else :
                numLastTransaksi = numLastTransaksi + 1
                strLastTransaksi = str(numLastTransaksi)
                id_transaksi = str('trnsk_'+strLastTransaksi)
                with open('last-data-transaksi.csv', 'w', encoding='UTF8', newline='') as f:
                    writer = csv.writer(f)
                    writer.writerow(strLastTransaksi)

                idBarang = form.cleaned_data['id_barang']
                strIdBarang = str(idBarang)
                strIdBarang1 =  strIdBarang.split()
                idBarang = strIdBarang1[-1]
                idBarang2 = idBarang.replace('(','').replace(')','')
                idBarangFix = int(idBarang2)

                jumlah = form.cleaned_data['jumlah_barang']
                obj = form.save(commit=False)
                dataHarga1 = dataHarga.get(id_barang=idBarangFix)
                hargaBarang = int(dataHarga1[0])
                obj.total = jumlah * hargaBarang
                obj.id_transaksi = id_transaksi
                obj.save()

                return redirect("/dataPenjualan")
        pass
    return render(request, 'Penjualan/tambahpenjualan.html',data)

def editPenjualan(request, id):
    dataB = Barang.objects.all()
    dataP = Pelanggan.objects.all()
    dataPenj = Penjualan.objects.get(id_penjualan=id)
    dataHarga = Barang.objects.values_list('harga_barang')
    data = {
        'dataB':dataB,
        'dataP':dataP,
        'dataPenj' : dataPenj,

    }
    if request.method == 'POST':
        form = PenjualanForm(request.POST, instance = dataPenj)
        if form.is_valid():

            idBarang = form.cleaned_data['id_barang']
            strIdBarang = str(idBarang)
            strIdBarang1 =  strIdBarang.split()
            idBarang = strIdBarang1[-1]
            idBarang2 = idBarang.replace('(','').replace(')','')
            idBarangFix = int(idBarang2)

            jumlah = form.cleaned_data['jumlah_barang']
            obj = form.save(commit=False)
            dataHarga1 = dataHarga.get(id_barang=idBarangFix)
            hargaBarang = int(dataHarga1[0])
            obj.total = jumlah * hargaBarang
            obj.save()

            return redirect("/dataPenjualan")
        pass
    return render(request,"Penjualan/editpenjualan.html",data)

def hapusPenjualan(request, id):
    dataPenj = Penjualan.objects.get(id_penjualan=id)
    dataPenj.delete()
    return redirect("/dataPenjualan")


@cache_control(no_cache=True, must_revalidate=True)  
def signout(request):
    logout(request)
    return redirect('/signin')
