from django import forms
from .models import Barang,Pelanggan,Supplier,Pelanggan,Pembelian,Penjualan,UserModel

class UserForm(forms.ModelForm):
    class Meta:
        model = UserModel
        fields = ['id','full_name','first_name','last_name','email','image']

class BarangForm(forms.ModelForm):
    class Meta:
        model = Barang
        fields = "__all__"

class SupplierForm(forms.ModelForm):
    class Meta:
        model = Supplier
        fields = "__all__"

class PelangganForm(forms.ModelForm):
    class Meta:
        model = Pelanggan
        fields = "__all__"

class PembelianForm(forms.ModelForm):
    class Meta:
        model = Pembelian
        fields = "__all__"

class PenjualanForm(forms.ModelForm):
    class Meta:
        model = Penjualan
        fields = "__all__"
