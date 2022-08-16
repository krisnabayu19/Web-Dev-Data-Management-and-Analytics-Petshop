from django.contrib import admin
from django.urls import path
from myapp import views
from association import views as aviews
from forecasting import views as fviews
 
urlpatterns = [
    path('admin/', admin.site.urls),
    path('', views.home, name='home'),
    path('signin/',views.signin, name='signin'),
    path('signout/',views.signout, name='signout'),
    path('signup/',views.signup, name='signup'),
    path('profile/',views.profile, name='profile'),

    # Data Barang
    path('dataBarang/',views.dataBarang, name='dataBarang'),
    path('tambahBarang/',views.tambahBarang, name='tambahBarang'),
    path('editBarang/<int:id>',views.editBarang),
    path('hapusBarang/<int:id>',views.hapusBarang),

    # Data Supplier
    path('dataSupplier/',views.dataSupplier, name='dataSupplier'),
    path('tambahSupplier/',views.tambahSupplier, name='tambahSupplier'),
    path('editSupplier/<int:id>',views.editSupplier),
    path('hapusSupplier/<int:id>',views.hapusSupplier),

    # Data Pelanggan
    path('dataPelanggan/',views.dataPelanggan, name='dataPelanggan'),
    path('tambahPelanggan/',views.tambahPelanggan, name='tambahPelanggan'),
    path('editPelanggan/<int:id>',views.editPelanggan),
    path('hapusPelanggan/<int:id>',views.hapusPelanggan),

    # Data Pembelian
    path('dataPembelian/',views.dataPembelian, name='dataPembelian'),
    path('tambahPembelian/',views.tambahPembelian, name='tambahPembelian'),
    path('editPembelian/<int:id>',views.editPembelian),
    path('hapusPembelian/<int:id>',views.hapusPembelian),

    # Data Penjualan
    path('dataPenjualan/',views.dataPenjualan, name='dataPenjualan'),
    path('tambahPenjualan/',views.tambahPenjualan, name='tambahPenjualan'),
    path('editPenjualan/<int:id>',views.editPenjualan),
    path('hapusPenjualan/<int:id>',views.hapusPenjualan),

    # Association Rule
    path('associationRule/',aviews.assosiationRule, name='associationRule'),
    path('excelAssociationRule/',aviews.excelAssosiationRule, name='excelAssociationRule'),
    path('predictAssociationRule/',aviews.predictAssociationRule, name='predictAssociationRule'),
 
    # Forecasting Rule
    path('forecastingRule/',fviews.forecastingRule, name='forecastingRule'),
    path('excelForecastingRule/',fviews.excelForecastingRule, name='excelForecastingRule'),
    path('predictForecastingRule/',fviews.predictForecastingRule, name='predictForecastingRule'),

]
