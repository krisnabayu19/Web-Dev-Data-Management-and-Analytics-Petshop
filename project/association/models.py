from django.db import models

class Barang(models.Model):
    id_barang = models.AutoField(primary_key=True)
    nama_barang = models.CharField(max_length=200, blank=True, null=True)
    jenis_barang = models.CharField(max_length=200, blank=True, null=True)
    kategori_barang = models.CharField(max_length=200, blank=True, null=True)
    harga_barang = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'tb_barang'

class Pelanggan(models.Model):
    id_pelanggan = models.AutoField(primary_key=True)
    nama_pelanggan = models.CharField(max_length=200, blank=True, null=True)
    gender_pelanggan = models.CharField(max_length=200, blank=True, null=True)
    alamat_pelanggan = models.CharField(max_length=200, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'tb_pelanggan'


class Penjualan(models.Model):
    id_penjualan = models.AutoField(primary_key=True)
    id_transaksi = models.CharField(max_length=200, blank=True, null=True)
    id_barang = models.ForeignKey(Barang, models.DO_NOTHING, db_column='id_barang')
    id_pelanggan = models.ForeignKey(Pelanggan, models.DO_NOTHING, db_column='id_pelanggan')
    jumlah_barang = models.IntegerField(blank=True, null=True)
    total = models.IntegerField(blank=True, null=True)
    created_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'tb_penjualan'

class DataAssociationExcel(models.Model):
    id_transaksi = models.CharField(max_length=200, blank=True, null=True)
    nama_barang = models.CharField(max_length=150)
    jumlah_barang = models.IntegerField(blank=True, null=True)
    created_at = models.DateTimeField(blank=True, null=True)
    def __str__(self):
        return self.name


