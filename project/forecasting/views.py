import csv
import io
from pyexpat.errors import messages
from django.http import HttpResponse, HttpResponseRedirect
import numpy
import pandas as pd
from django.shortcuts import render
from .models import Barang, Penjualan, Pelanggan, DataForecast,TestPenjualan
from executive.models import UserModel
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
from authentification.views import dataUserExecutive

from sklearn.linear_model import LinearRegression
from sklearn.ensemble import RandomForestRegressor
import numpy as np

from sklearn.metrics import mean_squared_error
from math import sqrt
from sklearn.metrics import mean_absolute_error


# Fungsi forecastingrule dengan data dari sistem
@allowed_executive(allowed_roles=dataUserExecutive)
def forecastingRule(request):

    # Request semua data barang yang kemudian disimpan dalam variabel "dataB"
    dataB = Barang.objects.all()

    # Request semua data penjualan yang kemudian disimpan dalam variabel "dataPenj"
    dataPenj = TestPenjualan.objects.all()

    # Request id_user yang login
    current_user = request.user

    # Memanggil data user yang login berdasarkan id_user kemudian disimpan dalam variabel "dataU"
    dataU = UserModel.objects.get(id=current_user.id)

    # Menyimpan "dataB", "dataPenj" dan "dataU" ke dalam variabel "data" untuk dibawa ke view HTML
    data = {
        'dataB':dataB,
        'dataPenj':dataPenj,
        'dataU':dataU,
    }

    # Kondisi jika ada method "POST" pada view HTML
    if request.method == 'POST':

        # Request data 'id_barang' dan data 'inputMonthPred'
        request.session['id_barang'] = request.POST['id_barang']
        request.session['inputMonthPred'] = request.POST['inputMonthPred']

        # Setelah request data "id_barang" dan data "inputMonthPred", data tersebut di redirect ke url "predictForecastingRule"
        return HttpResponseRedirect('/predictForecastingRule')

    # Me-return ke view HTML "forecasting.html" dengan membawa variabel "data"
    return render(request, 'forecasting.html',data)

dataArrPredFore = []

# Fungsi Operasi Forecasting Rule dengan Input Data "id_barang" dan Data "inputMonthPred"
@allowed_executive(allowed_roles=dataUserExecutive)
def predictForecastingRule(request):
    current_user = request.user
    dataU = UserModel.objects.get(id=current_user.id)

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
    context["dataU"] = dataU

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


# Fungsi Forecasting Rule dengan Excel/CSV Data
@allowed_executive(allowed_roles=dataUserExecutive)
def excelForecastingRule(request):
    current_user = request.user
    dataU = UserModel.objects.get(id=current_user.id)
    dataD = [0]

    # Membersihkan data prekdisi forecasting yang tersimpan dalam array sebelumnya
    dataArrPredFore.clear()

    # Mendeklarasikan template HTML yang digunakan
    template = "forecastingexcel.html"
    dataForecast = DataForecast.objects.all

    # Menyimpan data user pada variable "prompt"
    prompt = {
        'order': 'Order of the CSV should be name, email, address, phone, profile',
        'dataU' : dataU,
        'month_date': dataD
        }

    # Kondisi jika ada method "GET" dalam view HTML, akan me-return template HTML dan variabel 'prompt"
    if request.method == "GET":
        return render(request, template, prompt)

    if request.method == "POST":
        # Me-request file csv yang diinputkan oleh user, dan disimpan pada variabel "csv_file"
        data_file = request.FILES['file']
        print("Dataset File Name : ",data_file)

        # 1. Data Pre-processing
        # Meng-import dataset dan menggabungkan data excel yang terdiri dari beberapa sheet menjadi satu sheet
        df = pd.concat(pd.read_excel(data_file, sheet_name=None), ignore_index=True)
        print(df)

        # Menyamaratakan case text pada column 'Nama Item' menjadi 'Lower Case'Pada tahap ini yaitu untuk menyamaratakan case text pada column 'Nama Item' menjadi 'Lower Case'
        df['Nama Item'] = df['Nama Item'].str.lower()
        df['Month Date']=df['Month Date'].astype(str)

        df_unique_prod = df[['Nama Item']]
        df_unique_prod = df_unique_prod['Nama Item'].unique()
        data_unique = []
        for i in df_unique_prod :
            data_unique.append(i)
        df_unique_prod=pd.DataFrame(data_unique, columns=['Nama Item']) 

        dataXlsx = df.to_json()
        dataProdUnique = df_unique_prod.to_json()

        request.session['data_file'] = dataXlsx
        request.session['data_unique_prod'] = dataProdUnique

        return HttpResponseRedirect('/excelPredictForecastingRule')

        # Implmentation S-ARIMAX Model
        # model=sm.tsa.statespace.SARIMAX(trainData['Production'],order=(1, 1, 1),seasonal_order=(1,1,1,intNum))
        # results=model.fit()
        # df2['Prediction']=results.predict(start=(len(df2)-intNum),end=len(df2),dynamic=True)
        # print(df2)

        # dataFinal = df2
        # dataFinal = dataFinal.reset_index()

        # dataFinal['Month']=dataFinal['Month'].astype(str)

        # context = {}
        # arrayDate = []
        # for i in dataFinal['Month'] :
        #     arrayDate.append(i)

        # arrayProduction = []
        # arrayPrediction = []
        # for y in dataFinal['Production']:
        #     if y != 0 :
        #         print('Yes')
        #         arrayProduction.append(y)
        #         arrayPrediction.append(y)

        #     else:
        #         print('No')

        # for x in dataFinal['Prediction']:
        #     if math.isnan(x):   
        #         print("No Data")
        #     else:
        #         arrayPrediction.append(x)

        # context["month_date"] = arrayDate
        # context["production_data"] = arrayProduction
        # context["prediction_data"] = arrayPrediction
        # context["number_of_month_pred"] = intNum
        # context["dataU"] = dataU

        # numTemp = 0
        # for dataDate,dataPred in zip(arrayDate,arrayPrediction):
        #     numTemp = numTemp + 1
        #     if numTemp <= int(len(arrayDate)-intNum):
        #         status = 'Production'
        #         dataStore = {
        #             'month_date' : dataDate,
        #             'value' : dataPred,
        #             'status' : status
        #         }
        #         dataArrPredFore.append(dataStore)
        #     else :
        #         status = 'Prediction'
        #         dataStore = {
        #             'month_date' : dataDate,
        #             'value' : dataPred,
        #             'status' : status
        #         }
        #         dataArrPredFore.append(dataStore)

    return render(request, 'forecastingexcel.html')

@allowed_executive(allowed_roles=dataUserExecutive)
def excelPredictForecastingRule(request):
    current_user = request.user
    dataU = UserModel.objects.get(id=current_user.id)
    dataD = [0]

    template = "excelresultpredictforecasting.html"
    result_prod = request.session.get('data_unique_prod')
    df_prod = pd.read_json(result_prod)

    uniProdArray = []
    for index,row in df_prod.iterrows():
        uniProdArray.append(row['Nama Item'])

    # Menyimpan data user pada variable "prompt"
    prompt = {
        'order': 'Order of the CSV should be name, email, address, phone, profile',
        'dataU' : dataU,
        'month_date': dataD,
        'uni_prod': uniProdArray
        }

    # Kondisi jika ada method "GET" dalam view HTML, akan me-return template HTML dan variabel 'prompt"
    if request.method == "GET":
        return render(request, template, prompt)

    context = {}

    # Merubah format variabel "numberP" menjadi format integer
    intNum = request.POST['inputMonthPred']
    intNum = int(intNum)
    # intNum = 12

    # Menentukan nama type product yang akan dilakukan forecasting
    productName = request.POST['product_type']
    productName = str(productName)

    result = request.session.get('data_file')
    df = pd.read_json(result)


    df['Month Date'] = pd.to_datetime(df['Month Date'])
    df['Month Date']=df['Month Date'].dt.to_period('M')

    # Melakukan filtering data berdasarkan nama type product yang ditentukan
    df_1 = df[df['Nama Item'] == productName ]

    # Memilih column mana saja yang diperlukan untuk melakukan forecasting
    df_2 = df_1[['Month Date','Qty']]

    # Melakukan grouping data per bulan dan menjumlahkan 'Qty'
    df_3 = df_2.groupby('Month Date').sum().reset_index()


    # 2. Data Processing
    # Mengkonversi format column "Month Date" menjadi format "datetime"
    df_3['Month Date']= df_3['Month Date'].dt.year.astype('str') + '-' +  df_3['Month Date'].dt.month.astype('str') + '-1'
    df_3['Month Date']= pd.to_datetime(df_3['Month Date'])

    # Mendapatkan tanggal/date terakhir dari data yang diinputkan oleh user
    last = df_3.iloc[-1]
    last_date = last['Month Date']

    # 2.1 Evaluation
    ev_data = df_3
    print("ev :", ev_data)

    ev_train = ev_data
    ev_test = ev_data[-9:]

    ev_train['Qty_LastMonth']=ev_train['Qty'].shift(+1)
    ev_train['Qty_2ndLastMonth']=ev_train['Qty'].shift(+2)
    ev_train['Qty_3rdLastMonth']=ev_train['Qty'].shift(+3)
    ev_train=ev_train.dropna()
    print("final",ev_train)

    ev_lin_model=LinearRegression()
    model=RandomForestRegressor(n_estimators=100,max_features=3, random_state=1)
    ev_x1,ev_x2,ev_x3,ev_y=ev_train['Qty_LastMonth'],ev_train['Qty_2ndLastMonth'],ev_train['Qty_3rdLastMonth'],ev_train['Qty']
    ev_x1,ev_x2,ev_x3,ev_y=np.array(ev_x1),np.array(ev_x2),np.array(ev_x3),np.array(ev_y)
    ev_x1,ev_x2,ev_x3,ev_y=ev_x1.reshape(-1,1),ev_x2.reshape(-1,1),ev_x3.reshape(-1,1),ev_y.reshape(-1,1)
    ev_final_x=np.concatenate((ev_x1,ev_x2,ev_x3),axis=1)
    print(ev_final_x)

    ev_X_train,ev_X_test,ev_y_train,ev_y_test=ev_final_x[:-9],ev_final_x[-9:],ev_y[:-9],ev_y[-9:]
    model.fit(ev_X_train,ev_y_train)
    ev_lin_model.fit(ev_X_train,ev_y_train)

    ev_lin_pred=ev_lin_model.predict(ev_X_test)
    ev_test = ev_test.rename(columns={'Qty': 'Production'}).reset_index()
    ev_df_month = ev_test[['Month Date']]
    ev_df_production = ev_test[['Production']]
    ev_df_prediction = pd.DataFrame(ev_lin_pred, columns = ['Prediction'])

    df_check = pd.concat([ev_df_month, ev_df_production,ev_df_prediction], axis=1, join='inner')
    df_norm = (df_check-df_check.min())/(df_check.max()-df_check.min())

    mae = mean_absolute_error(df_norm['Production'],df_norm['Prediction'])
    mae = mae*100
    difference_array = np.subtract(df_norm['Production'],df_norm['Prediction'])
    squared_array = np.square(difference_array)
    mse = squared_array.mean()
    mse = mse*100
    rmse=sqrt(mean_squared_error(df_norm['Production'],df_norm['Prediction']))
    rmse = rmse*100

    evArrayMonth = []
    evArrayProd = []
    evArrayPred = []
    for index, row in df_check.iterrows():
        evArrayMonth.append(str(row['Month Date']))
        evArrayProd.append(str(row['Production']))
        evArrayPred.append(str(row['Prediction']))

    # 2.2 Prediction on The Future
    # Perulangan untuk menambah deretan bulan sesuai dengan jumlah bulan yang akan diprediksi
    date_predict = []
    for i in range(intNum):
        if not date_predict :
            req_date = last_date + pd.DateOffset(months=1)
            date_predict.append(req_date)
        else:
            last_arr = date_predict[-1]
            req_date = last_arr + pd.DateOffset(months=1)
            date_predict.append(req_date)

    # Perulangan untuk menggabungkan data bulan yang ingin diprediksi dengan data training
    for i in date_predict:
        new_row = {'Month Date':i, 'Qty':0}
        df_3 = df_3.append(new_row, ignore_index=True)

    # Indexing dataframe menggunakan monthdate
    df_4 = df_3
    df_4.set_index('Month Date',inplace=True)
    print("test",df_4)

    # Membuat dataframe baru untuk menyimpan data training
    trainData = df_4[:int(-1*intNum)]
    print("test2",trainData)
    
    # Membuat dataframe baru untuk menyimpan data testing
    intTestData = int(-1*intNum)
    testData = df_4[int(-1*intNum):]

    # Implement Linear Regression
    trainData['Qty_LastMonth']=trainData['Qty'].shift(+1)
    trainData['Qty_2ndLastMonth']=trainData['Qty'].shift(+2)
    trainData['Qty_3rdLastMonth']=trainData['Qty'].shift(+3)
    trainData=trainData.dropna()
    print(trainData)

    # Melakukan penambahan data pada dataframe yaitu data 1 bulan kebelakang, 2 bulan kebelakang, dan 3 bulan kebelakang
    lin_model=LinearRegression()
    model=RandomForestRegressor(n_estimators=100,max_features=3, random_state=1)
    x1,x2,x3,y=trainData['Qty_LastMonth'],trainData['Qty_2ndLastMonth'],trainData['Qty_3rdLastMonth'],trainData['Qty']
    x1,x2,x3,y=np.array(x1),np.array(x2),np.array(x3),np.array(y)
    x1,x2,x3,y=x1.reshape(-1,1),x2.reshape(-1,1),x3.reshape(-1,1),y.reshape(-1,1)
    final_x=np.concatenate((x1,x2,x3),axis=1)
    print(final_x)

    # Fitting model berdasarkan data training
    X_train,X_test,y_train,y_test=final_x[:intTestData],final_x[intTestData:],y[:intTestData],y[intTestData:]
    model.fit(X_train,y_train)
    lin_model.fit(X_train,y_train)

    # Melakukan prediksi terhadap data forecast
    lin_pred=lin_model.predict(X_test)
    print(lin_pred)

    # Membuat dataframe baru khusus untuk month date testing data
    df_month = testData.reset_index('Month Date')
    df_month_final = df_month['Month Date']
    
    dataForecast = []
    for i,y in zip(df_month_final, lin_pred):
        tempD = {
            'Month Date':i,
            'Qty':int(y),
            'Status':'Prediction'
        }
        dataForecast.append(tempD)
    dataPred = pd.DataFrame(dataForecast)

    dataProd = trainData[['Qty']]
    dataProd['Status'] = 'Production'
    dataProd = dataProd.reset_index('Month Date')
    print(dataPred)
    print(dataProd)

    arrayDate = []
    arrayProduction = []
    arrayPrediction = []
    for index, row in dataProd.iterrows():
        arrayDate.append(str(row['Month Date']))
    for index, row in dataPred.iterrows():
        arrayDate.append(str(row['Month Date']))

    for index, row in dataProd.iterrows():
        arrayProduction.append(row['Qty'])
        arrayPrediction.append(row['Qty'])
    for index, row in dataPred.iterrows():
        arrayPrediction.append(row['Qty'])

    for index, row in dataProd.iterrows():
        dataStore = {
            'month_date' : row['Month Date'],
            'value' : row['Qty'],
            'status' : row['Status']
        }
        dataArrPredFore.append(dataStore)
    for index, row in dataPred.iterrows():
        dataStore = {
            'month_date' : row['Month Date'],
            'value' : row['Qty'],
            'status' : row['Status']
        }
        dataArrPredFore.append(dataStore)

    context["dataU"] = dataU
    context["month_date"] = dataD

    context["uni_prod"] = uniProdArray
    context["month_date"] = arrayDate
    context["production_data"] = arrayProduction
    context["prediction_data"] = arrayPrediction
    context["ev_month_date"] = evArrayMonth
    context["ev_production_data"] = evArrayProd
    context["ev_prediction_data"] = evArrayPred
    context["mse"] = mse
    context["rmse"] = rmse
    context["mae"] = mae
    context["productName"] = productName

    return render(request, 'excelresultpredictforecasting.html',context)

@allowed_executive(allowed_roles=dataUserExecutive)
def export_csv_forecasting(request):
    response = HttpResponse(content_type='text/csv')
    response['Content-Disposition'] = 'attachment; filename=Data-Prediksi-Forecasting'+'-'+str(datetime.now())+'.csv'

    writer = csv.writer(response)
    dataHeader = ['Month Date','Value Data','Status']
    writer.writerow(dataHeader)
    for data in dataArrPredFore:
        writer.writerow([data['month_date'],data['value'],data['status']])
    return response