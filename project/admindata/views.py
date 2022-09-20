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

from .models import Barang, Pembelian, Penjualan,Supplier,Pelanggan,UserModel
from datetime import datetime
from .forms import BarangForm,SupplierForm,PelangganForm,PembelianForm,PenjualanForm,UserForm
import pandas as pd

from authentification.decorators import allowed_admin, allowed_executive
from django.contrib.auth.decorators import login_required
from django.db.models import Sum
from authentification.views import dataUserArray
from django.contrib.auth.models import User


@allowed_admin(allowed_roles=dataUserArray)
def adminDashboard(request):
    return render(request, 'dashboardadmin.html')


# CRUD Data Barang
@allowed_admin(allowed_roles=dataUserArray)
def dataBarang(request):
    dataB= Barang.objects.all()
    return render(request, 'Barang/barang.html',{'dataB':dataB})


@allowed_admin(allowed_roles=dataUserArray)
def tambahBarang(request):
    if request.method == 'POST':
        form = BarangForm(request.POST)
        current_user = request.user
        if form.is_valid():
            obj = form.save(commit=False)
            obj.admin_id = current_user.id
            obj.save()
            return redirect("/dataBarang")
        pass
    return render(request, 'Barang/tambahbarang.html')


@allowed_admin(allowed_roles=dataUserArray)
def editBarang(request, id):
    dataB = Barang.objects.get(id_barang=id)
    current_user = request.user
    if request.method == 'POST':
        form = BarangForm(request.POST, instance = dataB)
        if form.is_valid():
            obj = form.save(commit=False)
            obj.admin_id = current_user.id
            obj.save()
            return redirect("/dataBarang")
        pass
    return render(request,"Barang/editbarang.html",{'dataB':dataB})


@allowed_admin(allowed_roles=dataUserArray)
def hapusBarang(request, id):
    dataB = Barang.objects.get(id_barang=id)
    dataB.delete()
    return redirect("/dataBarang")

# CRUD Supplier
@allowed_admin(allowed_roles=dataUserArray)
def dataSupplier(request):
    dataS= Supplier.objects.all()
    return render(request, 'Supplier/supplier.html',{'dataS':dataS})

@allowed_admin(allowed_roles=dataUserArray)
def tambahSupplier(request):
    if request.method == 'POST':
        form = SupplierForm(request.POST)
        current_user = request.user
        if form.is_valid():
            obj = form.save(commit=False)
            obj.admin_id = current_user.id
            obj.save()
            return redirect("/dataSupplier")
        pass
    return render(request, 'Supplier/tambahsupplier.html')

@allowed_admin(allowed_roles=dataUserArray)
def editSupplier(request, id):
    dataS = Supplier.objects.get(id_supplier=id)
    current_user = request.user
    if request.method == 'POST':
        form = SupplierForm(request.POST, instance = dataS)
        if form.is_valid():
            obj = form.save(commit=False)
            obj.admin_id = current_user.id
            obj.save()
            return redirect("/dataSupplier")
        pass
    return render(request,"Supplier/editsupplier.html",{'dataS':dataS})

@allowed_admin(allowed_roles=dataUserArray)
def hapusSupplier(request, id):
    dataS = Supplier.objects.get(id_supplier=id)
    dataS.delete()
    return redirect("/dataSupplier")

# CRUD Pelanggan
@allowed_admin(allowed_roles=dataUserArray)
def dataPelanggan(request):
    dataP= Pelanggan.objects.all()
    return render(request, 'Pelanggan/pelanggan.html',{'dataP':dataP})

@allowed_admin(allowed_roles=dataUserArray)
def tambahPelanggan(request):
    if request.method == 'POST':
        form = PelangganForm(request.POST)
        current_user = request.user
        if form.is_valid():
            obj = form.save(commit=False)
            obj.admin_id = current_user.id
            obj.save()
            return redirect("/dataPelanggan")
        pass
    return render(request, 'Pelanggan/tambahpelanggan.html')

@allowed_admin(allowed_roles=dataUserArray)
def editPelanggan(request, id):
    dataP = Pelanggan.objects.get(id_pelanggan=id)
    if request.method == 'POST':
        form = PelangganForm(request.POST, instance = dataP)
        current_user = request.user
        if form.is_valid():
            obj = form.save(commit=False)
            obj.admin_id = current_user.id
            obj.save()
            return redirect("/dataPelanggan")
        pass
    return render(request,"Pelanggan/editpelanggan.html",{'dataP':dataP})

@allowed_admin(allowed_roles=dataUserArray)
def hapusPelanggan(request, id):
    dataP = Pelanggan.objects.get(id_pelanggan=id)
    dataP.delete()
    return redirect("/dataPelanggan")


# CRUD Pembelian Barang
@allowed_admin(allowed_roles=dataUserArray)
def dataPembelian(request):
    dataPemb = Pembelian.objects.all()
    return render(request, 'Pembelian/pembelian.html',{'dataPemb':dataPemb})

@allowed_admin(allowed_roles=dataUserArray)
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
        current_user = request.user
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
            obj.admin_id = current_user.id

            obj.save()
            return redirect("/dataPembelian")
        pass
    return render(request, 'Pembelian/tambahpembelian.html',data)

@allowed_admin(allowed_roles=dataUserArray)
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
        current_user = request.user
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
            obj.admin_id = current_user.id
            obj.save()

            return redirect("/dataPembelian")
        pass
    return render(request,"Pembelian/editpembelian.html",data)

@allowed_admin(allowed_roles=dataUserArray)
def hapusPembelian(request, id):
    dataPemb = Pembelian.objects.get(id_pembelian=id)
    dataPemb.delete()
    return redirect("/dataPembelian")

def export_data_pembelian_csv(request):
    response = HttpResponse(content_type='text/csv')
    response['Content-Disposition'] = 'attachment; filename=Data-Pembelian'+'-'+str(datetime.now())+'.csv'

    writer = csv.writer(response)
    dataHeader = ['Tanggal Pembelian','Tanggal Kadaluarsa','Nama Barang','Nama Pelanggan','Harga Barang','Jumlah Barang','Total']
    writer.writerow(dataHeader)

    dataPemb = Pembelian.objects.all()

    for data in dataPemb :
        writer.writerow([data.created_at,
                        data.expired_at, 
                        data.id_barang.nama_barang, 
                        data.id_supplier.nama_supplier,
                        data.id_barang.harga_barang,
                        data.jumlah_barang_pembelian,
                        data.total])
    return response


# CRUD Penjualan
@allowed_admin(allowed_roles=dataUserArray)
def dataPenjualan(request):
    dataPenj = Penjualan.objects.all()
    return render(request, 'Penjualan/penjualan.html',{'dataPenj':dataPenj})

@allowed_admin(allowed_roles=dataUserArray)
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
        current_user = request.user
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
                obj.admin_id = current_user.id
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

@allowed_admin(allowed_roles=dataUserArray)
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
        current_user = request.user
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
            obj.admin_id = current_user.id
            obj.save()

            return redirect("/dataPenjualan")
        pass
    return render(request,"Penjualan/editpenjualan.html",data)

@allowed_admin(allowed_roles=dataUserArray)
def hapusPenjualan(request, id):
    dataPenj = Penjualan.objects.get(id_penjualan=id)
    dataPenj.delete()
    return redirect("/dataPenjualan")

def export_data_penjualan_csv(request):
    response = HttpResponse(content_type='text/csv')
    response['Content-Disposition'] = 'attachment; filename=Data-Penjualan'+'-'+str(datetime.now())+'.csv'

    writer = csv.writer(response)
    dataHeader = ['Tanggal','Id. Transaksi','Nama Barang','Nama Pelanggan','Harga Barang','Jumlah Barang','Total']
    writer.writerow(dataHeader)

    dataPenj = Penjualan.objects.all()

    for data in dataPenj :
        writer.writerow([data.created_at,
                        data.id_transaksi,  
                        data.id_barang.nama_barang, 
                        data.id_pelanggan.nama_pelanggan,
                        data.id_barang.harga_barang,
                        data.jumlah_barang,
                        data.total])
    return response


@allowed_admin(allowed_roles=dataUserArray)
def changePassword(request):
    current_user = request.user
    strUsername = str(current_user.username)
    if request.method == 'POST':
        newPassword = request.POST['new_password']
        u = User.objects.get(username=strUsername)
        u.set_password(str(newPassword))
        u.save()
        return redirect('/admindashboard')
    return render(request, 'password_change.html')

@allowed_admin(allowed_roles=dataUserArray)
def editProfileAdmin(request):
    current_user = request.user
    dataU = UserModel.objects.get(id=current_user.id)
    data = {
        'dataU' : dataU,
    }
    if request.method == 'POST':
        form = UserForm(request.POST, instance = dataU)
        current_user = request.user
        if form.is_valid():
            form.save()
            return redirect("/admindashboard")
        pass

    return render(request,'editprofileadmin.html',data)


@cache_control(no_cache=True, must_revalidate=True)  
def signout(request):
    logout(request)
    return redirect('/signin')
