import csv
import io
from pyexpat.errors import messages
from django.http import HttpResponse, HttpResponseRedirect
import numpy
import pandas as pd
from django.shortcuts import render
from .models import Barang, Penjualan, Pelanggan, DataForecast,TestPenjualan

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

from authentification.decorators import allowed_executive
from authentification.views import dataUserArray


# Create your views here.
@allowed_executive(allowed_roles=dataUserArray)
def forecastingRule(request):
    dataB = Barang.objects.all()
    dataPenj = TestPenjualan.objects.all()
    data = {
        'dataB':dataB,
        'dataPenj':dataPenj,
    }
    if request.method == 'POST':

        request.session['id_barang'] = request.POST['id_barang']
        request.session['inputMonthPred'] = request.POST['inputMonthPred']
        
        return HttpResponseRedirect('/predictForecastingRule')
    return render(request, 'forecasting.html',data)

dataArrPredFore = []

@allowed_executive(allowed_roles=dataUserArray)
def predictForecastingRule(request):

    dataArrPredFore.clear()

    idBarang = request.session.get('id_barang')
    monthPred = request.session.get('inputMonthPred')

    intIdBarang= int(idBarang)
    intNum = int(monthPred)

    dataPenjualan = TestPenjualan.objects.filter(id_barang=intIdBarang).values()

    arrayData = []
    for i in dataPenjualan:
        jumlahBarang = i['jumlah_barang']
        monthDate = str(i['created_at'].year)+'-'+str(i['created_at'].month)+'-'+'1'
        dataTemp = [monthDate,jumlahBarang]
        arrayData.append(dataTemp)
    print(arrayData)

    dataGroupPenj = []
    for key,keydata in groupby(arrayData, key=itemgetter(0)):
        dataGroup = sum([d[1] for d in keydata])
        tempD = [key,dataGroup]
        dataGroupPenj.append(tempD)
    df = pd.DataFrame(dataGroupPenj,columns=('Month','Production'))

        # Convert to datetime
    df['Month']=pd.to_datetime(df['Month'])

    # Getting Last Date
    last = df.iloc[-1]
    last_date = last['Month']
    print(last_date)

    # Counting Date to The Future
    date_predict = []
    for i in range(intNum):
        if not date_predict :
            req_date = last_date + pd.DateOffset(months=1)
            date_predict.append(req_date)
        else:
            last_arr = date_predict[-1]
            req_date = last_arr + pd.DateOffset(months=1)
            date_predict.append(req_date)

    # Append New Future Date
    for i in date_predict:
        new_row = {'Month':i, 'Production':0}
        df = df.append(new_row, ignore_index=True)

    df2 = df
    df2.set_index('Month',inplace=True)

    # Set Training Data
    trainData = df2[:103]

    # Implmentation S-ARIMAX Model
    model=sm.tsa.statespace.SARIMAX(trainData['Production'],order=(1, 1, 1),seasonal_order=(1,1,1,intNum))
    results=model.fit()
    df2['Prediction']=results.predict(start=(len(df2)-intNum),end=len(df2),dynamic=True)
    print(df2)

    dataFinal = df2
    dataFinal = dataFinal.reset_index()

    dataFinal['Month']=dataFinal['Month'].astype(str)

    context = {}

    arrayDate = []
    for i in dataFinal['Month'] :
        arrayDate.append(i)


    arrayProduction = []
    arrayPrediction = []
    for y in dataFinal['Production']:
        if y != 0 :
            print('Yes')
            arrayProduction.append(y)
            arrayPrediction.append(y)

        else:
            print('No')

    for x in dataFinal['Prediction']:
        if math.isnan(x):   
            print("No Data")
        else:
            arrayPrediction.append(x)

    context["month_date"] = arrayDate
    context["production_data"] = arrayProduction
    context["prediction_data"] = arrayPrediction
    context["number_of_month_pred"] = intNum

    numTemp = 0
    for dataDate,dataPred in zip(arrayDate,arrayPrediction):
        numTemp = numTemp + 1
        if numTemp <= int(len(arrayDate)-intNum):
            status = 'Production'
            dataStore = {
                'month_date' : dataDate,
                'value' : dataPred,
                'status' : status
            }
            dataArrPredFore.append(dataStore)
        else :
            status = 'Prediction'
            dataStore = {
                'month_date' : dataDate,
                'value' : dataPred,
                'status' : status
            }
            dataArrPredFore.append(dataStore)

    return render(request, 'resultpredictforecasting.html',context)

@allowed_executive(allowed_roles=dataUserArray)
def excelForecastingRule(request):

    dataArrPredFore.clear()


    # declaring template
    template = "forecastingexcel.html"
    dataForecast = DataForecast.objects.all

    # prompt is a context variable that can have different values depending on their context
    prompt = {
        'order': 'Order of the CSV should be name, email, address, phone, profile'
        }

    # GET request returns the value of the data with the specified key.
    if request.method == "GET":
        return render(request, template, prompt)
    csv_file = request.FILES['file']
    print("Dataset File Name : ",csv_file)

    # Get number of month to predict forecasting
    numberP = request.POST['inputMonthPred']
    print("Number of Month to Predict : ",numberP)
    intNum = int(numberP)

    # let's check if it is a csv file
    if not csv_file.name.endswith('.csv'):
        messages.error(request, 'THIS IS NOT A CSV FILE')
    data_set = csv_file.read().decode('UTF-8')

    #Convert into dataframe
    str_data= io.StringIO(data_set)
    df = pd.read_csv(str_data, sep=",")

    # Convert to datetime
    df['Month']=pd.to_datetime(df['Month'])

    # Getting Last Date
    last = df.iloc[-1]
    last_date = last['Month']
    print(last_date)

    # Counting Date to The Future
    date_predict = []
    for i in range(intNum):
        if not date_predict :
            req_date = last_date + pd.DateOffset(months=1)
            date_predict.append(req_date)
        else:
            last_arr = date_predict[-1]
            req_date = last_arr + pd.DateOffset(months=1)
            date_predict.append(req_date)

    # Append New Future Date
    for i in date_predict:
        new_row = {'Month':i, 'Production':0}
        df = df.append(new_row, ignore_index=True)

    df2 = df
    df2.set_index('Month',inplace=True)

    # Set Training Data
    trainData = df2[:103]

    # Implmentation S-ARIMAX Model
    model=sm.tsa.statespace.SARIMAX(trainData['Production'],order=(1, 1, 1),seasonal_order=(1,1,1,intNum))
    results=model.fit()
    df2['Prediction']=results.predict(start=(len(df2)-intNum),end=len(df2),dynamic=True)
    print(df2)

    dataFinal = df2
    dataFinal = dataFinal.reset_index()

    dataFinal['Month']=dataFinal['Month'].astype(str)

    context = {}

    arrayDate = []
    for i in dataFinal['Month'] :
        arrayDate.append(i)


    arrayProduction = []
    arrayPrediction = []
    for y in dataFinal['Production']:
        if y != 0 :
            print('Yes')
            arrayProduction.append(y)
            arrayPrediction.append(y)

        else:
            print('No')

    for x in dataFinal['Prediction']:
        if math.isnan(x):   
            print("No Data")
        else:
            arrayPrediction.append(x)

    context["month_date"] = arrayDate
    context["production_data"] = arrayProduction
    context["prediction_data"] = arrayPrediction
    context["number_of_month_pred"] = intNum

    numTemp = 0
    for dataDate,dataPred in zip(arrayDate,arrayPrediction):
        numTemp = numTemp + 1
        if numTemp <= int(len(arrayDate)-intNum):
            status = 'Production'
            dataStore = {
                'month_date' : dataDate,
                'value' : dataPred,
                'status' : status
            }
            dataArrPredFore.append(dataStore)
        else :
            status = 'Prediction'
            dataStore = {
                'month_date' : dataDate,
                'value' : dataPred,
                'status' : status
            }
            dataArrPredFore.append(dataStore)

    return render(request, 'forecastingexcel.html', context)

@allowed_executive(allowed_roles=dataUserArray)
def export_csv_forecasting(request):
    response = HttpResponse(content_type='text/csv')
    response['Content-Disposition'] = 'attachment; filename=Data-Prediksi-Forecasting'+'-'+str(datetime.now())+'.csv'

    writer = csv.writer(response)
    dataHeader = ['Month Date','Value Data','Status']
    writer.writerow(dataHeader)
    for data in dataArrPredFore:
        writer.writerow([data['month_date'],data['value'],data['status']])
    return response


