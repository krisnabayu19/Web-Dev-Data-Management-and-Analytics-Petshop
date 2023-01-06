from django.db import models

# Model untuk memanggil data pada tb_barang
class Barang(models.Model):

    # Data yang diambil pada tabel "tb_barang" yaitu data "id_barang", "nama_barang", "jenis_barang", "kategori_barang" dan "harga_barang"
    id_barang = models.AutoField(primary_key=True)
    nama_barang = models.CharField(max_length=200, blank=True, null=True)
    jenis_barang = models.CharField(max_length=200, blank=True, null=True)
    kategori_barang = models.CharField(max_length=200, blank=True, null=True)
    harga_barang = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'tb_barang'

# Model untuk memanggil data pada tb_pelanggan
class Pelanggan(models.Model):

    # Data yang diambil pada tabel "tb_pelanggan" yaitu data "id_pelanggan", "nama_pelanggan", "gender_pelanggan", dan "alamat_pelanggan"
    id_pelanggan = models.AutoField(primary_key=True)
    nama_pelanggan = models.CharField(max_length=200, blank=True, null=True)
    gender_pelanggan = models.CharField(max_length=200, blank=True, null=True)
    alamat_pelanggan = models.CharField(max_length=200, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'tb_pelanggan'

# Model untuk memanggil data pada tb_penjualan
class Penjualan(models.Model):

    # Data yang diambil pada tabel "tb_penjualan" yaitu data "id_penjualan", id_transaksi", "id_barang", "id_pelanggan", "jumlah_barang", "total" dan "created_at"
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

# Model untuk memanggil data pada temporary table DataAssociationExcels
class DataAssociationExcel(models.Model):

    # Data yang diambil pada tabel "temporary" yaitu data "id_transaksi", "nama_barang", "jumlah_barang" dan "created_at"
    id_transaksi = models.CharField(max_length=200, blank=True, null=True)
    nama_barang = models.CharField(max_length=150)
    jumlah_barang = models.IntegerField(blank=True, null=True)
    created_at = models.DateTimeField(blank=True, null=True)
    def __str__(self):
        return self.name


