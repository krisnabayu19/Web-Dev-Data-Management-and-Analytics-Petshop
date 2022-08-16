import csv
import io
import ast
import json
import pandas as pd
from pyexpat.errors import messages
from django.http import HttpResponseRedirect
from django.shortcuts import redirect, render
from .models import Barang, Penjualan, Pelanggan, DataAssociationExcel
from itertools import groupby
from operator import itemgetter
from fpgrowth_py import fpgrowth

# Create your views here.
def assosiationRule(request):
    dataPenj = Penjualan.objects.all()
    if request.method == 'POST':

        request.session['inputMinConf'] = request.POST['inputMinConf']
        request.session['inputMinSupp'] = request.POST['inputMinSupp']
        
        return HttpResponseRedirect('/predictAssociationRule')
    return render(request, 'association.html',{'dataPenj':dataPenj})

def predictAssociationRule(request):
    minConf = request.session.get('inputMinConf')
    minSupp = request.session.get('inputMinSupp')

    floatMinConf = float(minConf)
    floatMinSupp = float(minSupp)

    dataPenj = Penjualan.objects.all()
    arrayData = []
    for i in dataPenj:
        data = [i.id_transaksi,i.id_barang.nama_barang]
        arrayData.append(data)

    dataAsso = []
    for key,keydata in groupby(arrayData, key=itemgetter(0)):
        dataGroup = [d[1] for d in keydata]
        dataAsso.append(dataGroup)
    
    freqItemSet, rules = fpgrowth(dataAsso, minSupRatio=floatMinSupp, minConf=floatMinConf)

    predContext = {}
    pred = []

    for i in rules:
        dataProduct = str(i[0]).replace("'",'').replace('{','').replace('}','')
        dataPredict = str(i[1]).replace("'",'').replace('{','').replace('}','')
        valuePredict = i[2]
        print(dataProduct,'->', dataPredict,'=', valuePredict)
        dataPred = {
            'dataProduct' : dataProduct,
            'dataPredict' : dataPredict,
            'valuePredict' : valuePredict
        }
        pred.append(dataPred)
    predContext["pred"] = pred
    return render(request, 'resultpredictassociation.html',predContext)


def excelAssosiationRule(request):

    # declaring template
    template = "associationexcel.html"
    data = DataAssociationExcel.objects.all()

    # prompt is a context variable that can have different values depending on their context
    prompt = {
        'order': 'Order of the CSV should be name, email, address, phone, profile',
        'profiles': data
    }

    # GET request returns the value of the data with the specified key.
    if request.method == "GET":
        return render(request, template, prompt)
    csv_file = request.FILES['file']
    print("Dataset File Name : ",csv_file)


    # let's check if it is a csv file
    if not csv_file.name.endswith('.csv'):
        messages.error(request, 'THIS IS NOT A CSV FILE')
    data_set = csv_file.read().decode('UTF-8')

    minConf = request.POST['inputMinConf']
    minSupp = request.POST['inputMinSupp']


    floatMinConf = float(minConf)
    floatMinSupp = float(minSupp)

    #Convert into dataframe
    str_data= io.StringIO(data_set)
    df = pd.read_csv(str_data, sep=",")
    print(df)

    arrayData = []
    for index, row in df.iterrows():
        data = [row['id_transaksi'], row['nama_barang']]
        arrayData.append(data)

        dataAsso = []
    for key,keydata in groupby(arrayData, key=itemgetter(0)):
        dataGroup = [d[1] for d in keydata]
        dataAsso.append(dataGroup)
    
    freqItemSet, rules = fpgrowth(dataAsso, minSupRatio=floatMinSupp, minConf=floatMinConf)

    predContext = {}
    pred = []

    for i in rules:
        dataProduct = str(i[0]).replace("'",'').replace('{','').replace('}','')
        dataPredict = str(i[1]).replace("'",'').replace('{','').replace('}','')
        valuePredict = i[2]
        print(dataProduct,'->', dataPredict,'=', valuePredict)
        dataPred = {
            'dataProduct' : dataProduct,
            'dataPredict' : dataPredict,
            'valuePredict' : valuePredict
        }
        pred.append(dataPred)
    predContext["pred"] = pred
    return render(request, 'associationexcel.html',predContext)