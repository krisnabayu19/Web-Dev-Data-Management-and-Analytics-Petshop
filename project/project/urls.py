from django.contrib import admin
from django.urls import path
from admindata import views
from authentification import views as authviews
from superuser import views as sviews
from executive import views as eviews
from association import views as aviews
from forecasting import views as fviews

from django.conf import settings
from django.conf.urls.static import static
 
urlpatterns = [
    path('admin/', admin.site.urls),
    path('',sviews.profileCompany, name='profilecompany'),
    path('signin/',authviews.signin, name='signin'),
    path('signout/',authviews.signout, name='signout'),
    path('signup/',authviews.signup, name='signup'),

    # Access Denied
    path('accessdenied/', authviews.accessdenied, name='accessdenied'),

    # Superuser
    path('superuser/', sviews.dataUser, name='superuser'),
    path('editUser/<int:id>',sviews.editUser),

    # Executive
    path('executive/', eviews.dashboardExecutive, name='dashboardExecutive'),
    path('password-change-executive/', eviews.changePassword, name='changePassword'),
    path('editProfileExecutive/', eviews.editProfileExecutive, name='editProfileExecutive'),

    # Admin
    path('admindashboard/',views.adminDashboard, name='adminDashboard'),
    path('password-change-admin/', views.changePassword, name='changePassword'),
    path('editProfileAdmin/', views.editProfileAdmin, name='editProfileAdmin'),

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
    path('export-csv-pembelian',views.export_data_pembelian_csv,name='export-csv-pembelian'),

    # Data Penjualan
    path('dataPenjualan/',views.dataPenjualan, name='dataPenjualan'),
    path('tambahPenjualan/',views.tambahPenjualan, name='tambahPenjualan'),
    path('editPenjualan/<int:id>',views.editPenjualan),
    path('hapusPenjualan/<int:id>',views.hapusPenjualan),
    path('export-csv-penjualan',views.export_data_penjualan_csv,name='export-csv-penjualan'),

    # Association Rule
    path('associationRule/',aviews.assosiationRule, name='associationRule'),
    path('excelAssociationRule/',aviews.excelAssosiationRule, name='excelAssociationRule'),
    path('predictAssociationRule/',aviews.predictAssociationRule, name='predictAssociationRule'),
    path('export-csv-association/',aviews.export_csv_association, name='export-csv-association'),
 
    # Forecasting Rule
    path('forecastingRule/',fviews.forecastingRule, name='forecastingRule'),
    path('excelForecastingRule/',fviews.excelForecastingRule, name='excelForecastingRule'),
    path('excelPredictForecastingRule/',fviews.excelPredictForecastingRule, name='excelPredictForecastingRule'),
    path('predictForecastingRule/',fviews.predictForecastingRule, name='predictForecastingRule'),
    path('export-csv-forecasting/',fviews.export_csv_forecasting, name='export-csv-forecasting'),


]+ static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)


if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
    
handler404 = 'authentification.views.error_404_view'