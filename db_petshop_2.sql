-- MySQL dump 10.13  Distrib 8.0.30, for macos12 (x86_64)
--
-- Host: localhost    Database: db_petshop
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `full_name` varchar(150) DEFAULT NULL,
  `first_name` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `last_name` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `email` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `role` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `image` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (2,'pbkdf2_sha256$390000$Pz3KOFjYXeJIQ58WOctqry$G3g0RX7/f0f3p69nT9NH0SGuElqTGJUfJx2Y7G+GSdY=','2023-01-06 03:55:48.721732',0,'bayukrisna_1999','Bayu Krisna','Bayu','Krisna','krisnabayu1999@gmail.com',0,'executive',1,1,'2022-07-15 07:31:16.853528','images/profile-4.png'),(5,'pbkdf2_sha256$216000$Cq76R27HoSWF$ieac5PTEPxqzDak6eqSKK85mnOuI4s3gPsQ806Kq+oQ=','2022-09-20 11:33:10.501199',0,'minirustini','Kadek Mini Rustini',NULL,NULL,'minirustini1212@gmail.com',0,'executive',1,1,'2022-08-18 04:15:18.314612',NULL),(8,'pbkdf2_sha256$390000$eQ9QcLe68aaIEPgAKG9vWa$GTq2iBQgqWmycrlBauFpnSRFLuXQjcjiDCKTfiMjrSE=','2023-01-06 05:01:39.272920',0,'dwik','Dwik Cahya','Dwik','Cahya','dwikcahya@gmail.com',0,'admin',1,1,'2022-08-29 13:01:57.689359','images/profile-1_QnCCVov.png'),(9,'pbkdf2_sha256$390000$01067s9gb2FcsEabFtRFoh$QmX5+Te2TamITqcQ6TtkqZfYo1WhSoXYCOC5+u1yL+s=','2023-01-06 04:30:38.797971',1,'superadmintest',NULL,'','','',0,'superuser',1,1,'2022-09-18 12:32:07.939283',NULL);
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2022-07-15 06:23:45.001816'),(2,'auth','0001_initial','2022-07-15 06:23:46.204602'),(3,'admin','0001_initial','2022-07-15 06:23:54.259076'),(4,'admin','0002_logentry_remove_auto_add','2022-07-15 06:23:55.054952'),(5,'admin','0003_logentry_add_action_flag_choices','2022-07-15 06:23:55.089857'),(6,'contenttypes','0002_remove_content_type_name','2022-07-15 06:23:55.739121'),(7,'auth','0002_alter_permission_name_max_length','2022-07-15 06:23:56.705538'),(8,'auth','0003_alter_user_email_max_length','2022-07-15 06:23:57.432596'),(9,'auth','0004_alter_user_username_opts','2022-07-15 06:23:57.482462'),(10,'auth','0005_alter_user_last_login_null','2022-07-15 06:23:57.754735'),(11,'auth','0006_require_contenttypes_0002','2022-07-15 06:23:57.810585'),(12,'auth','0007_alter_validators_add_error_messages','2022-07-15 06:23:57.881396'),(13,'auth','0008_alter_user_username_max_length','2022-07-15 06:23:59.965825'),(14,'auth','0009_alter_user_last_name_max_length','2022-07-15 06:24:00.728786'),(15,'auth','0010_alter_group_name_max_length','2022-07-15 06:24:01.206513'),(16,'auth','0011_update_proxy_permissions','2022-07-15 06:24:01.277322'),(17,'auth','0012_alter_user_first_name_max_length','2022-07-15 06:24:01.866746'),(18,'sessions','0001_initial','2022-07-15 06:24:02.086161');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('xkr9yrpl7eqvn2vyaswl6nbo05z83j5z','.eJxVjEEOwiAQRe_C2pACTgGX7nsGMp0ZpGpoUtqV8e7apAvd_vfef6mE21rS1mRJE6uLCur0u41ID6k74DvW26xprusyjXpX9EGbHmaW5_Vw_w4KtvKtiTuIJGiBfCBvrXHQQSDwjh1bcDnaiH3mECUDnMGw79FHNGglo1HvD9qEN7U:1pDerL:EA4mvA_3vR_cAi-lf9qw-2OUcf6NGvJVe90jb5Qy8So','2023-01-20 05:01:39.275073');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_barang`
--

DROP TABLE IF EXISTS `tb_barang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_barang` (
  `id_barang` int NOT NULL AUTO_INCREMENT,
  `nama_barang` varchar(255) DEFAULT NULL,
  `jenis_barang` varchar(255) DEFAULT NULL,
  `kategori_barang` varchar(255) DEFAULT NULL,
  `harga_barang` int DEFAULT NULL,
  `admin_id` int DEFAULT NULL,
  PRIMARY KEY (`id_barang`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_barang`
--

LOCK TABLES `tb_barang` WRITE;
/*!40000 ALTER TABLE `tb_barang` DISABLE KEYS */;
INSERT INTO `tb_barang` VALUES (1,'eggs','jenisbarang1','kategoribarang1',100000,2),(2,'bacon','jenisbarang2','kategoribarang2',200000,2),(3,'soap','jenisbarang3','kategoribarang3',300000,2),(4,'apple','jenisbarang4','kategoribarang4',400000,2),(5,'banana','jenisbarang5','kategoribarang5',500000,2);
/*!40000 ALTER TABLE `tb_barang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_pelanggan`
--

DROP TABLE IF EXISTS `tb_pelanggan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_pelanggan` (
  `id_pelanggan` int NOT NULL AUTO_INCREMENT,
  `nama_pelanggan` varchar(255) DEFAULT NULL,
  `gender_pelanggan` varchar(255) DEFAULT NULL,
  `alamat_pelanggan` varchar(255) DEFAULT NULL,
  `admin_id` int DEFAULT NULL,
  PRIMARY KEY (`id_pelanggan`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_pelanggan`
--

LOCK TABLES `tb_pelanggan` WRITE;
/*!40000 ALTER TABLE `tb_pelanggan` DISABLE KEYS */;
INSERT INTO `tb_pelanggan` VALUES (1,'pelanggan1','L','kerobokan',2),(2,'pelanggan2','P','canggu',2),(3,'pelanggan3','L','kuta',2);
/*!40000 ALTER TABLE `tb_pelanggan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_pembelian`
--

DROP TABLE IF EXISTS `tb_pembelian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_pembelian` (
  `id_pembelian` int NOT NULL AUTO_INCREMENT,
  `id_barang` int DEFAULT NULL,
  `id_supplier` int DEFAULT NULL,
  `jumlah_barang_pembelian` int DEFAULT NULL,
  `total` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `expired_at` datetime DEFAULT NULL,
  `status_expired` enum('0','1') DEFAULT NULL,
  `admin_id` int DEFAULT NULL,
  PRIMARY KEY (`id_pembelian`),
  KEY `id_barang` (`id_barang`),
  KEY `id_supplier` (`id_supplier`),
  CONSTRAINT `tb_pembelian_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `tb_barang` (`id_barang`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `tb_pembelian_ibfk_2` FOREIGN KEY (`id_supplier`) REFERENCES `tb_supplier` (`id_supplier`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_pembelian`
--

LOCK TABLES `tb_pembelian` WRITE;
/*!40000 ALTER TABLE `tb_pembelian` DISABLE KEYS */;
INSERT INTO `tb_pembelian` VALUES (1,1,1,10,1000000,'2022-08-25 15:40:00','2023-08-25 15:40:00',NULL,2),(2,2,2,20,4000000,'2022-08-25 15:40:00','2023-08-25 15:40:00',NULL,2),(3,3,3,30,9000000,'2022-08-25 15:41:00','2023-08-25 15:41:00',NULL,2),(4,4,4,40,16000000,'2022-08-25 15:41:00','2023-08-25 15:41:00',NULL,2),(5,5,5,50,25000000,'2022-08-25 15:42:00','2023-08-25 15:42:00',NULL,2);
/*!40000 ALTER TABLE `tb_pembelian` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_penjualan`
--

DROP TABLE IF EXISTS `tb_penjualan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_penjualan` (
  `id_penjualan` int NOT NULL AUTO_INCREMENT,
  `id_transaksi` varchar(255) DEFAULT NULL,
  `id_barang` int DEFAULT NULL,
  `id_pelanggan` int DEFAULT NULL,
  `jumlah_barang` int DEFAULT NULL,
  `total` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `admin_id` int DEFAULT NULL,
  PRIMARY KEY (`id_penjualan`),
  KEY `tb_penjualan_ibfk_2` (`id_pelanggan`),
  KEY `id_barang` (`id_barang`),
  CONSTRAINT `tb_penjualan_ibfk_2` FOREIGN KEY (`id_pelanggan`) REFERENCES `tb_pelanggan` (`id_pelanggan`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `tb_penjualan_ibfk_3` FOREIGN KEY (`id_barang`) REFERENCES `tb_barang` (`id_barang`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_penjualan`
--

LOCK TABLES `tb_penjualan` WRITE;
/*!40000 ALTER TABLE `tb_penjualan` DISABLE KEYS */;
INSERT INTO `tb_penjualan` VALUES (1,'trnsk_1',1,1,1,100000,'2022-08-25 15:44:00',2),(2,'trnsk_1',2,1,5,200000,'2022-08-25 15:44:00',2),(3,'trnsk_1',3,1,4,300000,'2022-08-25 15:45:00',2),(4,'trnsk_2',1,2,7,100000,'2022-08-25 15:45:00',2),(5,'trnsk_2',2,2,9,200000,'2022-08-25 15:45:00',2),(6,'trnsk_2',4,2,10,400000,'2022-08-25 15:46:00',2),(7,'trnsk_3',3,3,50,300000,'2022-08-25 15:46:00',2),(8,'trnsk_3',2,3,85,200000,'2022-08-25 15:47:00',2),(9,'trnsk_3',4,3,90,36000000,'2022-08-25 15:47:00',8);
/*!40000 ALTER TABLE `tb_penjualan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_supplier`
--

DROP TABLE IF EXISTS `tb_supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_supplier` (
  `id_supplier` int NOT NULL AUTO_INCREMENT,
  `nama_supplier` varchar(255) DEFAULT NULL,
  `jenis_supplier` varchar(255) DEFAULT NULL,
  `alamat_supplier` varchar(255) DEFAULT NULL,
  `admin_id` int DEFAULT NULL,
  PRIMARY KEY (`id_supplier`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_supplier`
--

LOCK TABLES `tb_supplier` WRITE;
/*!40000 ALTER TABLE `tb_supplier` DISABLE KEYS */;
INSERT INTO `tb_supplier` VALUES (1,'supplier1','jenissupplier1','alamatsupplier1',2),(2,'supplier2','jenissupplier2','alamatsupplier2',2),(3,'supplier3','jenissupplier3','alamatsupplier3',2),(4,'supplier4','jenissupplier4','alamatsupplier4',2),(5,'supplier5','jenissupplier5','alamatsupplier5',2);
/*!40000 ALTER TABLE `tb_supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_test_penjualan`
--

DROP TABLE IF EXISTS `tb_test_penjualan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_test_penjualan` (
  `id_penjualan` int NOT NULL AUTO_INCREMENT,
  `id_transaksi` varchar(10) DEFAULT NULL,
  `id_barang` int DEFAULT NULL,
  `id_pelanggan` int DEFAULT NULL,
  `jumlah_barang` int DEFAULT NULL,
  `harga_barang` int DEFAULT NULL,
  `total` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id_penjualan`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_test_penjualan`
--

LOCK TABLES `tb_test_penjualan` WRITE;
/*!40000 ALTER TABLE `tb_test_penjualan` DISABLE KEYS */;
INSERT INTO `tb_test_penjualan` VALUES (1,'trnsk_1',1,1,2815,100000,281500000,'2016-01-01 00:00:00'),(2,'trnsk_2',1,1,2672,100000,267200000,'2016-02-01 00:00:00'),(3,'trnsk_3',1,1,2755,100000,275500000,'2016-03-01 00:00:00'),(4,'trnsk_4',1,1,2721,100000,272100000,'2016-04-01 00:00:00'),(5,'trnsk_5',1,1,2946,100000,294600000,'2016-05-01 00:00:00'),(6,'trnsk_6',1,1,3036,100000,303600000,'2016-06-01 00:00:00'),(7,'trnsk_7',1,1,2282,100000,228200000,'2016-07-01 00:00:00'),(8,'trnsk_8',1,1,2212,100000,221200000,'2016-08-01 00:00:00'),(9,'trnsk_9',1,1,2922,100000,292200000,'2016-09-01 00:00:00'),(10,'trnsk_10',1,1,4301,100000,430100000,'2016-10-01 00:00:00'),(11,'trnsk_11',1,1,5764,100000,576400000,'2016-11-01 00:00:00'),(12,'trnsk_12',1,1,7312,100000,731200000,'2016-12-01 00:00:00'),(13,'trnsk_13',1,1,2541,100000,254100000,'2017-01-01 00:00:00'),(14,'trnsk_14',1,1,2475,100000,247500000,'2017-02-01 00:00:00'),(15,'trnsk_15',1,1,3031,100000,303100000,'2017-03-01 00:00:00'),(16,'trnsk_16',1,1,3266,100000,326600000,'2017-04-01 00:00:00'),(17,'trnsk_17',1,1,3776,100000,377600000,'2017-05-01 00:00:00'),(18,'trnsk_18',1,1,3230,100000,323000000,'2017-06-01 00:00:00'),(19,'trnsk_19',1,1,3028,100000,302800000,'2017-07-01 00:00:00'),(20,'trnsk_20',1,1,1759,100000,175900000,'2017-08-01 00:00:00'),(21,'trnsk_21',1,1,3595,100000,359500000,'2017-09-01 00:00:00'),(22,'trnsk_22',1,1,4474,100000,447400000,'2017-10-01 00:00:00'),(23,'trnsk_23',1,1,6838,100000,683800000,'2017-11-01 00:00:00'),(24,'trnsk_24',1,1,8357,100000,835700000,'2017-12-01 00:00:00'),(25,'trnsk_25',1,1,3113,100000,311300000,'2018-01-01 00:00:00'),(26,'trnsk_26',1,1,3006,100000,300600000,'2018-02-01 00:00:00'),(27,'trnsk_27',1,1,4047,100000,404700000,'2018-03-01 00:00:00'),(28,'trnsk_28',1,1,3523,100000,352300000,'2018-04-01 00:00:00'),(29,'trnsk_29',1,1,3937,100000,393700000,'2018-05-01 00:00:00'),(30,'trnsk_30',1,1,3986,100000,398600000,'2018-06-01 00:00:00'),(31,'trnsk_31',1,1,3260,100000,326000000,'2018-07-01 00:00:00'),(32,'trnsk_32',1,1,1573,100000,157300000,'2018-08-01 00:00:00'),(33,'trnsk_33',1,1,3528,100000,352800000,'2018-09-01 00:00:00'),(34,'trnsk_34',1,1,5211,100000,521100000,'2018-10-01 00:00:00'),(35,'trnsk_35',1,1,7614,100000,761400000,'2018-11-01 00:00:00'),(36,'trnsk_36',1,1,9254,100000,925400000,'2018-12-01 00:00:00'),(37,'trnsk_37',1,1,5375,100000,537500000,'2019-01-01 00:00:00'),(38,'trnsk_38',1,1,3088,100000,308800000,'2019-02-01 00:00:00'),(39,'trnsk_39',1,1,3718,100000,371800000,'2019-03-01 00:00:00'),(40,'trnsk_40',1,1,4514,100000,451400000,'2019-04-01 00:00:00'),(41,'trnsk_41',1,1,4520,100000,452000000,'2019-05-01 00:00:00'),(42,'trnsk_42',1,1,4539,100000,453900000,'2019-06-01 00:00:00'),(43,'trnsk_43',1,1,3663,100000,366300000,'2019-07-01 00:00:00'),(44,'trnsk_44',1,1,1643,100000,164300000,'2019-08-01 00:00:00'),(45,'trnsk_45',1,1,4739,100000,473900000,'2019-09-01 00:00:00'),(46,'trnsk_46',1,1,5428,100000,542800000,'2019-10-01 00:00:00'),(47,'trnsk_47',1,1,8314,100000,831400000,'2019-11-01 00:00:00'),(48,'trnsk_48',1,1,10651,100000,1065100000,'2019-12-01 00:00:00'),(49,'trnsk_49',1,1,3633,100000,363300000,'2020-01-01 00:00:00'),(50,'trnsk_50',1,1,4292,100000,429200000,'2020-02-01 00:00:00'),(51,'trnsk_51',1,1,4154,100000,415400000,'2020-03-01 00:00:00'),(52,'trnsk_52',1,1,4121,100000,412100000,'2020-04-01 00:00:00'),(53,'trnsk_53',1,1,4647,100000,464700000,'2020-05-01 00:00:00'),(54,'trnsk_54',1,1,4753,100000,475300000,'2020-06-01 00:00:00'),(55,'trnsk_55',1,1,3965,100000,396500000,'2020-07-01 00:00:00'),(56,'trnsk_56',1,1,1723,100000,172300000,'2020-08-01 00:00:00'),(57,'trnsk_57',1,1,5048,100000,504800000,'2020-09-01 00:00:00'),(58,'trnsk_58',1,1,6922,100000,692200000,'2020-10-01 00:00:00'),(59,'trnsk_59',1,1,9858,100000,985800000,'2020-11-01 00:00:00'),(60,'trnsk_60',1,1,11331,100000,1133100000,'2020-12-01 00:00:00'),(61,'trnsk_61',1,1,4016,100000,401600000,'2021-01-01 00:00:00'),(62,'trnsk_62',1,1,3957,100000,395700000,'2021-02-01 00:00:00'),(63,'trnsk_63',1,1,4510,100000,451000000,'2021-03-01 00:00:00'),(64,'trnsk_64',1,1,4276,100000,427600000,'2021-04-01 00:00:00'),(65,'trnsk_65',1,1,4968,100000,496800000,'2021-05-01 00:00:00'),(66,'trnsk_66',1,1,4677,100000,467700000,'2021-06-01 00:00:00'),(67,'trnsk_67',1,1,3523,100000,352300000,'2021-07-01 00:00:00'),(68,'trnsk_68',1,1,1821,100000,182100000,'2021-08-01 00:00:00'),(69,'trnsk_69',1,1,5222,100000,522200000,'2021-09-01 00:00:00'),(70,'trnsk_70',1,1,6872,100000,687200000,'2021-10-01 00:00:00'),(71,'trnsk_71',1,1,10803,100000,1080300000,'2021-11-01 00:00:00'),(72,'trnsk_72',1,1,13916,100000,1391600000,'2021-12-01 00:00:00');
/*!40000 ALTER TABLE `tb_test_penjualan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'db_petshop'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-06 15:13:20
