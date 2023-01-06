import csv
from datetime import datetime
import io
from os import write
from urllib import response
import pandas as pd
from pyexpat.errors import messages
from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import redirect, render
from .models import Penjualan, DataAssociationExcel
from executive.models import UserModel
from itertools import groupby
from operator import itemgetter
from fpgrowth_py import fpgrowth
from authentification.decorators import allowed_executive
from authentification.views import dataUserExecutive
from io import StringIO
from openpyxl import Workbook


# Fungsi Fp-Growth Library, pada fungsi ini membutuhkan data itemset, nilai minimum support dan nilai minimum confidence
def fpgrowth_func(dataAsso, supp, conf):
  freqItemSet, rules = fpgrowth(dataAsso, minSupRatio=supp, minConf=conf)
  return rules


# Fungsi association rule dengan menggunakan data dari sistem
@allowed_executive(allowed_roles=dataUserExecutive)
def assosiationRule(request):

    # Request semua data penjualan yang kemudian disimpan dalam variabel "dataPenj"
    dataPenj = Penjualan.objects.all()

    # Request id_user yang login
    current_user = request.user

    # Memanggil data user yang login berdasarkan id_user kemudian disimpan dalam variabel "dataU"
    dataU = UserModel.objects.get(id=current_user.id)

    # Menyimpan "dataPenj" dan "dataU" ke dalam variabel "data" untuk dibawa ke view HTML
    data = {
        'dataPenj':dataPenj,
        'dataU':dataU,
    }

    # Kondisi ketika ada method "POST" pada view HTML
    if request.method == 'POST':

        # Request data "inputMinSupp" dan data "inputMinConf" pada view HTML "association.html"
        request.session['inputMinConf'] = request.POST['inputMinConf']
        request.session['inputMinSupp'] = request.POST['inputMinSupp']
        
        # Setelah request data "inputMinSupp" dan data "inputMinConf", data tersebut di redirect ke url "predictAssociationRule"
        return HttpResponseRedirect('/predictAssociationRule')

    # Me-return ke view HTML "association.html" dengan membawa variabel "data"
    return render(request, 'association.html',data)

# Array Data Hasil Association Rule
dataArrPredAsso = []


# Fungsi Operasi Association Rule dengan Input Min. Support dan Min Confidence
@allowed_executive(allowed_roles=dataUserExecutive)
def predictAssociationRule(request):
    # Request id_user yang login
    current_user = request.user

    # Memanggil data user yang login berdasarkan id_user kemudian disimpan dalam variabel "dataU"
    dataU = UserModel.objects.get(id=current_user.id)

    # Request semua data penjualan yang kemudian disimpan dalam variabel "dataPenj"
    dataPenj = Penjualan.objects.all()

    # Membersihkan data hasil association rule sebelumnya, untuk bisa menyimpan hasil data association rule fp-growth yang baru
    dataArrPredAsso.clear()

    # Mengambil data "inputMinSupp" dan data "inputMinConf" dimana sebagai parameter dalam association rule fp-growth
    minConf = request.session.get('inputMinConf')
    minSupp = request.session.get('inputMinSupp')

    # Merubah type data "minConf" dan "minSupp" menjadi type data "float"
    floatMinConf = float(minConf)
    floatMinSupp = float(minSupp)

    # Proses perulangan untuk mengambil data "id_transaksi" dan "nama_barang" dari "dataPenj" untuk disimpan ke dalam array "arrayData"
    arrayData = []
    for i in dataPenj:
        data = [i.id_transaksi,i.id_barang.nama_barang]
        arrayData.append(data)

    # Melakukan formating data itemset sesuai dengan format input metode association rule fp-growth
    dataAsso = []
    for key,keydata in groupby(arrayData, key=itemgetter(0)):
        dataGroup = [d[1] for d in keydata]
        dataAsso.append(dataGroup)

    # Variabel untuk menyimpan semua data, sebelum data di return ke view HTML "resultpredictassociation.html"
    predContext = {}

    # Array untuk menyimpan hasil association rule fp-growth
    pred = []

    # Try Except untuk meng-handle jika dalam proses operasi association rule fp-growth ada yang "error"
    # Contoh nilai minimum support terlalu tinggi atau nilai minimum confidence terlalu tinggi
    try :
        # Melakukan proses association rule fp-growth, dengan memanggil fungsi "fpgrowth_func", kemudian hasilnya disimpan ke dalam variabel "result"
        result = fpgrowth_func(dataAsso, floatMinSupp, floatMinConf)

        # Melakukan proses perulangan dari hasil association rule fp-growth yang bertujuan melakukan formatting data
        for i in result:
            dataProduct = str(i[0]).replace("'",'').replace('{','').replace('}','')
            dataPredict = str(i[1]).replace("'",'').replace('{','').replace('}','')
            valuePredict = i[2]
            print(dataProduct,'->', dataPredict,'=', valuePredict)
            dataPred = {
                'dataProduct' : dataProduct,
                'dataPredict' : dataPredict,
                'minCo nf' : minConf,
                'minSupp' : minSupp,
                'valuePredict' : valuePredict
            }
            pred.append(dataPred)
            dataArrPredAsso.append(dataPred)
    except:
        print("Error Exception")
    
    predContext["pred"] = pred
    predContext["dataU"] = dataU

    # Me-return ke view HTML "resultpredictassociation.html" dengan membawa variabel "predContext"
    return render(request, 'resultpredictassociation.html',predContext)


# Fungsi Association Rule dengan Excel/CSV Data
@allowed_executive(allowed_roles=dataUserExecutive)
def excelAssosiationRule(request):
    # Request id_user yang login
    current_user = request.user

    # Request id_user yang login
    dataU = UserModel.objects.get(id=current_user.id)

    # Membersihkan data hasil association rule sebelumnya, untuk bisa menyimpan hasil data association rule fp-growth yang baru
    dataArrPredAsso.clear()

    # Mendeklarasikan template view HTML
    template = "associationexcel.html"

    # Menyimpan semua data dari excel ke variabel "data"
    data = DataAssociationExcel.objects.all()
    dataD = [0]

    # Menyimpan semua data ke variabel "prompt" sebelum di return ke view HTML "associationexcel.html"
    prompt = {
        'order': 'Order of the CSV should be name, email, address, phone, profile',
        'profiles': data,
        'dataU':dataU,
        'product':dataD
    }

    # GET request returns the value of the data with the specified key.
    if request.method == "GET":
        return render(request, template, prompt)
    data_file = request.FILES['file']
    print("Dataset File Name : ",data_file)

    # Melakukan pengecekan data jika file yang diinputkan berupa format .csv
    # if not data_file.name.endswith('.xlsx'):
    #     messages.error(request, 'THIS IS NOT A XLSX FILE')
    # data_set = csv_file.read().decode('UTF-8')

    # Request data "inputMinSupp" dan data "inputMinConf" dari view HTML
    minConf = request.POST['inputMinConf']
    minSupp = request.POST['inputMinSupp']

    # Merubah type data "minConf" dan "minSupp" menjadi type data "float"
    floatMinConf = float(minConf)
    floatMinSupp = float(minSupp)

    # Merubah format data dari file csv menjadi format dataframe
    # str_data= io.StringIO(data_file)

    # 1. Data Pre-Processing
    # Meng-import dataset dan menggabungkan data excel yang terdiri dari beberapa sheet menjadi satu sheet
    df = pd.concat(pd.read_excel(data_file, sheet_name=None), ignore_index=True)
    print(df)

    # Menyamaratakan case text pada column 'Nama Barang menjadi 'Lower Case'Pada tahap ini yaitu untuk menyamaratakan case text pada column 'Nama Item' menjadi 'Lower Case'
    df['Nama Barang'] = df['Nama Barang'].str.lower()

    # Memilih column mana saja yang diperlukan untuk melakukan association
    df2 = df[['No.Faktur','Nama Barang']]

    # Proses perulangan untuk mengambil data "id_transaksi" dan "nama_barang" dari "df" untuk disimpan ke dalam array "arrayData"
    arrayData = []
    for index,row in df2.iterrows():
        data = [row['No.Faktur'],row['Nama Barang']]
        arrayData.append(data)

    # Melakukan formating data itemset sesuai dengan format input metode association rule fp-growth
    dataAsso = []
    for key,keydata in groupby(arrayData, key=itemgetter(0)):
        dataGroup = [d[1] for d in keydata]
        dataAsso.append(dataGroup)
    
    # 2. Processing Data
    # Variabel untuk menyimpan semua data, sebelum data di return ke view HTML "resultpredictassociation.html"
    predContext = {}
    
    # Array untuk menyimpan hasil association rule fp-growth
    pred = []

    # Try Except untuk meng-handle jika dalam proses operasi association rule fp-growth ada yang "error"
    # Contoh nilai minimum support terlalu tinggi atau nilai minimum confidence terlalu tinggi
    try :
        # Melakukan proses association rule fp-growth, dengan memanggil fungsi "fpgrowth_func", kemudian hasilnya disimpan ke dalam variabel "result"
        result = fpgrowth_func(dataAsso, floatMinSupp, floatMinConf)

        # Melakukan proses perulangan dari hasil association rule fp-growth yang bertujuan melakukan formatting data
        for i in result:
            dataProduct = str(i[0]).replace("'",'').replace('{','').replace('}','')
            dataPredict = str(i[1]).replace("'",'').replace('{','').replace('}','')
            valuePredict = i[2]
            print(dataProduct,'->', dataPredict,'=', valuePredict)
            dataPred = {
                'dataProduct' : dataProduct,
                'dataPredict' : dataPredict,
                'minConf' : minConf,
                'minSupp' : minSupp,
                'valuePredict' : valuePredict
            }
            pred.append(dataPred)
            dataArrPredAsso.append(dataPred)
    except:
        print("Error Exception")

    predContext["pred"] = pred
    predContext["dataU"] = dataU

    # Me-return ke view HTML "associationexcel.html" dengan membawa variabel "predContext"
    return render(request, 'associationexcel.html',predContext)

# Fungsi untuk melakukan export csv dari hasil association rule fp-growth
@allowed_executive(allowed_roles=dataUserExecutive)
def export_csv_association(request):

    # Mendeklarasi response export berupa format .csv
    response = HttpResponse(content_type='text/csv')

    # Melakukan setting untuk nama file yang akan di export
    response['Content-Disposition'] = 'attachment; filename=Data-Prediksi-Association'+'-'+str(datetime.now())+'.csv'

    # Menulis penulidan data ke dalam csv sebelum data csv tersebut di export
    writer = csv.writer(response)
    dataHeader = ['Data Produk Pertama','Data Prediksi Pembelian Produk Kedua','Nilai Probabilitas']
    writer.writerow(dataHeader)
    for data in dataArrPredAsso:
        writer.writerow([data['dataProduct'],data['dataPredict'],data['valuePredict']])

    # Me-return respone berupa auto dwonload csv
    return response