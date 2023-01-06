from django.db import models

class Barang(models.Model):
    id_barang = models.AutoField(primary_key=True)
    nama_barang = models.CharField(max_length=200, blank=True, null=True)
    jenis_barang = models.CharField(max_length=200, blank=True, null=True)
    kategori_barang = models.CharField(max_length=200, blank=True, null=True)
    harga_barang = models.IntegerField(blank=True, null=True)
    admin_id = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'tb_barang'

class Supplier(models.Model):
    id_supplier = models.AutoField(primary_key=True)
    nama_supplier = models.CharField(max_length=200, blank=True, null=True)
    jenis_supplier = models.CharField(max_length=200, blank=True, null=True)
    alamat_supplier = models.CharField(max_length=200, blank=True, null=True)
    admin_id = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'tb_supplier'

class Pelanggan(models.Model):
    id_pelanggan = models.AutoField(primary_key=True)
    nama_pelanggan = models.CharField(max_length=200, blank=True, null=True)
    gender_pelanggan = models.CharField(max_length=200, blank=True, null=True)
    alamat_pelanggan = models.CharField(max_length=200, blank=True, null=True)
    admin_id = models.IntegerField(blank=True, null=True)
    
    class Meta:
        managed = False
        db_table = 'tb_pelanggan'

class Pembelian(models.Model):
    id_pembelian = models.AutoField(primary_key=True)
    id_barang = models.ForeignKey(Barang, models.DO_NOTHING, db_column='id_barang')
    id_supplier = models.ForeignKey(Supplier, models.DO_NOTHING, db_column='id_supplier')
    jumlah_barang_pembelian = models.IntegerField(blank=True, null=True)
    total = models.IntegerField(blank=True, null=True)
    created_at = models.DateTimeField(blank=True, null=True)
    expired_at = models.DateTimeField(blank=True, null=True)
    admin_id = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'tb_pembelian'

class Penjualan(models.Model):
    id_penjualan = models.AutoField(primary_key=True)
    id_transaksi = models.CharField(max_length=50, blank=True, null=True)
    id_barang = models.ForeignKey(Barang, models.DO_NOTHING, db_column='id_barang')
    id_pelanggan = models.ForeignKey(Pelanggan, models.DO_NOTHING, db_column='id_pelanggan')
    jumlah_barang = models.IntegerField(blank=True, null=True)
    total = models.IntegerField(blank=True, null=True)
    created_at = models.DateTimeField(blank=True, null=True)
    admin_id = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'tb_penjualan'

class UserModel(models.Model):
    id = models.AutoField(primary_key=True)
    full_name = models.CharField(max_length=200, blank=True, null=True)
    first_name = models.CharField(max_length=200, blank=True, null=True)
    last_name = models.CharField(max_length=200, blank=True, null=True)
    email = models.CharField(max_length=200, blank=True, null=True)
    image = models.ImageField(upload_to='images/', null=True, blank=True)

    class Meta:
        managed = False
        db_table = 'auth_user'
