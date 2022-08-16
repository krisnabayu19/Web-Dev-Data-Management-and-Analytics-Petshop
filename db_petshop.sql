/*
SQLyog Ultimate v12.4.3 (64 bit)
MySQL - 10.1.31-MariaDB : Database - db_petshop
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `auth_group` */

LOCK TABLES `auth_group` WRITE;

UNLOCK TABLES;

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `auth_group_permissions` */

LOCK TABLES `auth_group_permissions` WRITE;

UNLOCK TABLES;

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

/*Data for the table `auth_permission` */

LOCK TABLES `auth_permission` WRITE;

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values (1,'Can add log entry',1,'add_logentry');
insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values (2,'Can change log entry',1,'change_logentry');
insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values (3,'Can delete log entry',1,'delete_logentry');
insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values (4,'Can view log entry',1,'view_logentry');
insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values (5,'Can add permission',2,'add_permission');
insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values (6,'Can change permission',2,'change_permission');
insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values (7,'Can delete permission',2,'delete_permission');
insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values (8,'Can view permission',2,'view_permission');
insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values (9,'Can add group',3,'add_group');
insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values (10,'Can change group',3,'change_group');
insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values (11,'Can delete group',3,'delete_group');
insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values (12,'Can view group',3,'view_group');
insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values (13,'Can add user',4,'add_user');
insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values (14,'Can change user',4,'change_user');
insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values (15,'Can delete user',4,'delete_user');
insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values (16,'Can view user',4,'view_user');
insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values (17,'Can add content type',5,'add_contenttype');
insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values (18,'Can change content type',5,'change_contenttype');
insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values (19,'Can delete content type',5,'delete_contenttype');
insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values (20,'Can view content type',5,'view_contenttype');
insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values (21,'Can add session',6,'add_session');
insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values (22,'Can change session',6,'change_session');
insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values (23,'Can delete session',6,'delete_session');
insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values (24,'Can view session',6,'view_session');

UNLOCK TABLES;

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `auth_user` */

LOCK TABLES `auth_user` WRITE;

insert  into `auth_user`(`id`,`password`,`last_login`,`is_superuser`,`username`,`first_name`,`last_name`,`email`,`is_staff`,`is_active`,`date_joined`) values (1,'pbkdf2_sha256$216000$KunDNNj1F8pq$KTq2I4cMt/Y6Pk5rwIpc77uN5SPIRCkkOEAZOSFAH6c=','2022-07-30 09:33:19.578431',0,'krisnabayu_1999','','','',0,1,'2022-07-15 06:26:55.358041');
insert  into `auth_user`(`id`,`password`,`last_login`,`is_superuser`,`username`,`first_name`,`last_name`,`email`,`is_staff`,`is_active`,`date_joined`) values (2,'pbkdf2_sha256$216000$JTsXEGo19qoo$NuIgJ/ZzZKbwoFIC1xWREKJ5fCqq0DZIV4IpGh/qIIo=','2022-08-16 06:26:32.527136',0,'bayukrisna_1999','','','',0,1,'2022-07-15 07:31:16.853528');
insert  into `auth_user`(`id`,`password`,`last_login`,`is_superuser`,`username`,`first_name`,`last_name`,`email`,`is_staff`,`is_active`,`date_joined`) values (3,'pbkdf2_sha256$216000$uXgZBbXsqgz5$hHqRxXZ4HOb5E7nvCgIvzuO3qLwjgVc8XPJKtA0ny1Q=','2022-07-27 09:04:52.700160',0,'minirustini12','','','',0,1,'2022-07-27 09:04:48.690890');
insert  into `auth_user`(`id`,`password`,`last_login`,`is_superuser`,`username`,`first_name`,`last_name`,`email`,`is_staff`,`is_active`,`date_joined`) values (4,'pbkdf2_sha256$216000$Kt6Jf7oJ1mUK$UT/h2E0nB5Lr40Vqh8vj2sTWRPdlZwNGrlcT553IdPo=','2022-07-27 14:00:43.577997',0,'minirustini','','','',0,1,'2022-07-27 14:00:26.169554');

UNLOCK TABLES;

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `auth_user_groups` */

LOCK TABLES `auth_user_groups` WRITE;

UNLOCK TABLES;

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `auth_user_user_permissions` */

LOCK TABLES `auth_user_user_permissions` WRITE;

UNLOCK TABLES;

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `django_admin_log` */

LOCK TABLES `django_admin_log` WRITE;

UNLOCK TABLES;

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `django_content_type` */

LOCK TABLES `django_content_type` WRITE;

insert  into `django_content_type`(`id`,`app_label`,`model`) values (1,'admin','logentry');
insert  into `django_content_type`(`id`,`app_label`,`model`) values (3,'auth','group');
insert  into `django_content_type`(`id`,`app_label`,`model`) values (2,'auth','permission');
insert  into `django_content_type`(`id`,`app_label`,`model`) values (4,'auth','user');
insert  into `django_content_type`(`id`,`app_label`,`model`) values (5,'contenttypes','contenttype');
insert  into `django_content_type`(`id`,`app_label`,`model`) values (6,'sessions','session');

UNLOCK TABLES;

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

/*Data for the table `django_migrations` */

LOCK TABLES `django_migrations` WRITE;

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values (1,'contenttypes','0001_initial','2022-07-15 06:23:45.001816');
insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values (2,'auth','0001_initial','2022-07-15 06:23:46.204602');
insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values (3,'admin','0001_initial','2022-07-15 06:23:54.259076');
insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values (4,'admin','0002_logentry_remove_auto_add','2022-07-15 06:23:55.054952');
insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values (5,'admin','0003_logentry_add_action_flag_choices','2022-07-15 06:23:55.089857');
insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values (6,'contenttypes','0002_remove_content_type_name','2022-07-15 06:23:55.739121');
insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values (7,'auth','0002_alter_permission_name_max_length','2022-07-15 06:23:56.705538');
insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values (8,'auth','0003_alter_user_email_max_length','2022-07-15 06:23:57.432596');
insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values (9,'auth','0004_alter_user_username_opts','2022-07-15 06:23:57.482462');
insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values (10,'auth','0005_alter_user_last_login_null','2022-07-15 06:23:57.754735');
insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values (11,'auth','0006_require_contenttypes_0002','2022-07-15 06:23:57.810585');
insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values (12,'auth','0007_alter_validators_add_error_messages','2022-07-15 06:23:57.881396');
insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values (13,'auth','0008_alter_user_username_max_length','2022-07-15 06:23:59.965825');
insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values (14,'auth','0009_alter_user_last_name_max_length','2022-07-15 06:24:00.728786');
insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values (15,'auth','0010_alter_group_name_max_length','2022-07-15 06:24:01.206513');
insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values (16,'auth','0011_update_proxy_permissions','2022-07-15 06:24:01.277322');
insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values (17,'auth','0012_alter_user_first_name_max_length','2022-07-15 06:24:01.866746');
insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values (18,'sessions','0001_initial','2022-07-15 06:24:02.086161');

UNLOCK TABLES;

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `django_session` */

LOCK TABLES `django_session` WRITE;

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('1jdkkgre69qa2jtgjval7x7hlh0hnxa7','.eJxVjEEOwiAQRe_C2hCggQ4u3XsGMswMUjVtUtpV490NSRe6_e-9f6iE-1bT3mRNE6urcuryu2Wkl8wd8BPnx6Jpmbd1yror-qRN3xeW9-10_w4qttprAHIkFg04Fh5sDITBURg9WiJbMGeAAH4wA6PJKMGLKW6MsSADqc8X_l04vQ:1oMMvk:KGBo-tfV5TA_Gm4pmNMe9iR78uBEP4kwEqYzUU1X698','2022-08-26 05:09:56.979079');
insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('37tujb253hhzkdaz0d0cr7rd6hai4w7t','.eJxVjEEOwiAQRe_C2hCggQ4u3XsGMswMUjVtUtpV490NSRe6_e-9f6iE-1bT3mRNE6urcuryu2Wkl8wd8BPnx6Jpmbd1yror-qRN3xeW9-10_w4qttprAHIkFg04Fh5sDITBURg9WiJbMGeAAH4wA6PJKMGLKW6MsSADqc8X_l04vQ:1oNSnt:5HloeLdvZaqBCm7qu-uMmy8MlO3my4UJfQuvYWYO5ME','2022-08-29 05:38:21.155805');
insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('b5dqjni17i24pk04ujc4aj8w8aj4mfcg','.eJxVjEEOwiAQRe_C2hCggQ4u3XsGMswMUjVtUtpV490NSRe6_e-9f6iE-1bT3mRNE6urcuryu2Wkl8wd8BPnx6Jpmbd1yror-qRN3xeW9-10_w4qttprAHIkFg04Fh5sDITBURg9WiJbMGeAAH4wA6PJKMGLKW6MsSADqc8X_l04vQ:1oMeRy:RisNotRIXZw_6qle00pwAlCI4FvEJP8Lo11MGW74UaI','2022-08-26 23:52:22.361239');
insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('fj576lwa2e3pxvgqh41fvxqvup4r9p1u','.eJxVjDsOwjAQBe_iGln-fyjpOYO1a29wANlSnFSIu0OkFNC-mXkvlmBba9oGLWku7MwkO_1uCPlBbQflDu3Wee5tXWbku8IPOvi1F3peDvfvoMKo31pYr8CQm7A4FC5i9EKSyphB6QgUlNGFcvDaWNJSGUQkkhCsjHHSgr0_6SU39w:1oHiqV:tdLop3KxihwLEvCcG_mr6JqX0rvgPuwORLO41R24FFw','2022-08-13 09:33:19.644256');
insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('hm2r5tioi2pwt83y0fl7lfycrqpwp9kp','.eJxVjEEOwiAQRe_C2hCggQ4u3XsGMswMUjVtUtpV490NSRe6_e-9f6iE-1bT3mRNE6urcuryu2Wkl8wd8BPnx6Jpmbd1yror-qRN3xeW9-10_w4qttprAHIkFg04Fh5sDITBURg9WiJbMGeAAH4wA6PJKMGLKW6MsSADqc8X_l04vQ:1oNXeX:0n2Ghn4iai3DjH1kbfvZSVPlajQWgf-OHKodujytFjM','2022-08-29 10:49:01.962255');
insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('hx3qpxmz6dlcw9zm9ihpf3e6z2zzontd','.eJxVjDsOwjAQBe_iGln-fyjpOYO1a29wANlSnFSIu0OkFNC-mXkvlmBba9oGLWku7MwkO_1uCPlBbQflDu3Wee5tXWbku8IPOvi1F3peDvfvoMKo31pYr8CQm7A4FC5i9EKSyphB6QgUlNGFcvDaWNJSGUQkkhCsjHHSgr0_6SU39w:1oGd5d:1p9aaVTaAnZIkpnFbppgaXprg-fTprMZNdsnA06h154','2022-08-10 09:12:25.508767');
insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('j6l9u2cpoygv5b44rwts0yt8y19j7ig5','.eJxVjjEOwjAMRe-SGUVJqqYuI3slblA5tksKKEVpOyHuTiJ1gNH-_z-9txpx3-K4r5LHmdVZOXX6_QWkh6Qa8B3TbdG0pC3PQdeKPtJVDwvL83J0_wAR11jXAORILBpwLNzY3hN6R75r0RLZCUMA8NA2pmE0AcW3YibX9f2EDFSgMxebXCQKztY7vfZtKDrxmqUaWqc-X09SRIU:1oNq2e:QW534yYG1b_RjQS2hxDZWZ6-nJlLE_RligE_nf19s5o','2022-08-30 06:27:08.443947');
insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('je9wlkmappb84q4kqto77dak2zh5weqz','.eJxVjEEOwiAQRe_C2hCggQ4u3XsGMswMUjVtUtpV490NSRe6_e-9f6iE-1bT3mRNE6urcuryu2Wkl8wd8BPnx6Jpmbd1yror-qRN3xeW9-10_w4qttprAHIkFg04Fh5sDITBURg9WiJbMGeAAH4wA6PJKMGLKW6MsSADqc8X_l04vQ:1oMM1F:yK4KmACFR19NbBmg-h1z1UJc1rJD351m2R2TtY7IMbI','2022-08-26 04:11:33.828084');
insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('qmo7e7ev8t0ugi8vzrgdyfmoe7qsq1pe','.eJxVjEEOwiAQRe_C2hCggQ4u3XsGMswMUjVtUtpV490NSRe6_e-9f6iE-1bT3mRNE6urcuryu2Wkl8wd8BPnx6Jpmbd1yror-qRN3xeW9-10_w4qttprAHIkFg04Fh5sDITBURg9WiJbMGeAAH4wA6PJKMGLKW6MsSADqc8X_l04vQ:1oMM74:M_jMorRazGWuPcEjktToMMrYBEJEwLJkLw7dR_lR9pw','2022-08-26 04:17:34.595750');
insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('t1k10lkhl2sgczj02lq2ctbde165848j','.eJxVjEEOwiAQRe_C2hCggQ4u3XsGMswMUjVtUtpV490NSRe6_e-9f6iE-1bT3mRNE6urcuryu2Wkl8wd8BPnx6Jpmbd1yror-qRN3xeW9-10_w4qttprAHIkFg04Fh5sDITBURg9WiJbMGeAAH4wA6PJKMGLKW6MsSADqc8X_l04vQ:1oMROb:Z0FYYHSC_dVqMNTdRgczax0AFLtLXGetZ3gXrlrpN0s','2022-08-26 09:56:01.517886');
insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('upas5z152uu1xuy25cbpr4pz4skpvho4','.eJxVjEEOwiAQRe_C2hCggQ4u3XsGMswMUjVtUtpV490NSRe6_e-9f6iE-1bT3mRNE6urcuryu2Wkl8wd8BPnx6Jpmbd1yror-qRN3xeW9-10_w4qttprAHIkFg04Fh5sDITBURg9WiJbMGeAAH4wA6PJKMGLKW6MsSADqc8X_l04vQ:1oNY2k:mj5QPIatIJpUrpNpGMPCyt8L8A8WwhLSrkvn-uQMHFI','2022-08-29 11:14:02.113744');
insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('w6jt9y49s3l12lax56zahltln7ufpdww','.eJxVjDsOwjAQBe_iGln-fyjpOYO1a29wANlSnFSIu0OkFNC-mXkvlmBba9oGLWku7MwkO_1uCPlBbQflDu3Wee5tXWbku8IPOvi1F3peDvfvoMKo31pYr8CQm7A4FC5i9EKSyphB6QgUlNGFcvDaWNJSGUQkkhCsjHHSgr0_6SU39w:1oGvmc:2WvoTieRDGyEQNFZXh_IV899Rt-tdtqg_EBMQOBT0bU','2022-08-11 05:10:02.698123');

UNLOCK TABLES;

/*Table structure for table `tb_barang` */

DROP TABLE IF EXISTS `tb_barang`;

CREATE TABLE `tb_barang` (
  `id_barang` int(11) NOT NULL AUTO_INCREMENT,
  `nama_barang` varchar(255) DEFAULT NULL,
  `jenis_barang` varchar(255) DEFAULT NULL,
  `kategori_barang` varchar(255) DEFAULT NULL,
  `harga_barang` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_barang`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `tb_barang` */

LOCK TABLES `tb_barang` WRITE;

insert  into `tb_barang`(`id_barang`,`nama_barang`,`jenis_barang`,`kategori_barang`,`harga_barang`) values (1,'Eggs','jenisbarang1','kategoribarang1',100000);
insert  into `tb_barang`(`id_barang`,`nama_barang`,`jenis_barang`,`kategori_barang`,`harga_barang`) values (2,'Bacon','jenisbarang2','kategoribarang2',200000);
insert  into `tb_barang`(`id_barang`,`nama_barang`,`jenis_barang`,`kategori_barang`,`harga_barang`) values (3,'Soup','jenisbarang3','kategoribarang3',300000);
insert  into `tb_barang`(`id_barang`,`nama_barang`,`jenis_barang`,`kategori_barang`,`harga_barang`) values (4,'Apple','jenisbarang4','kategoribarang4',400000);
insert  into `tb_barang`(`id_barang`,`nama_barang`,`jenis_barang`,`kategori_barang`,`harga_barang`) values (5,'Banana','jenisbarang5','kategoribarang5',500000);

UNLOCK TABLES;

/*Table structure for table `tb_pelanggan` */

DROP TABLE IF EXISTS `tb_pelanggan`;

CREATE TABLE `tb_pelanggan` (
  `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT,
  `nama_pelanggan` varchar(255) DEFAULT NULL,
  `gender_pelanggan` varchar(255) DEFAULT NULL,
  `alamat_pelanggan` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_pelanggan`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `tb_pelanggan` */

LOCK TABLES `tb_pelanggan` WRITE;

insert  into `tb_pelanggan`(`id_pelanggan`,`nama_pelanggan`,`gender_pelanggan`,`alamat_pelanggan`) values (1,'pelanggan1','L','kerobokan');
insert  into `tb_pelanggan`(`id_pelanggan`,`nama_pelanggan`,`gender_pelanggan`,`alamat_pelanggan`) values (2,'pelanggan2','P','canggu');
insert  into `tb_pelanggan`(`id_pelanggan`,`nama_pelanggan`,`gender_pelanggan`,`alamat_pelanggan`) values (4,'pelanggan3','L','kuta');

UNLOCK TABLES;

/*Table structure for table `tb_pembelian` */

DROP TABLE IF EXISTS `tb_pembelian`;

CREATE TABLE `tb_pembelian` (
  `id_pembelian` int(11) NOT NULL AUTO_INCREMENT,
  `id_barang` int(11) DEFAULT NULL,
  `id_supplier` int(11) DEFAULT NULL,
  `jumlah_barang_pembelian` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `expired_at` datetime DEFAULT NULL,
  `status_expired` enum('0','1') DEFAULT NULL,
  PRIMARY KEY (`id_pembelian`),
  KEY `id_barang` (`id_barang`),
  KEY `id_supplier` (`id_supplier`),
  CONSTRAINT `tb_pembelian_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `tb_barang` (`id_barang`),
  CONSTRAINT `tb_pembelian_ibfk_2` FOREIGN KEY (`id_supplier`) REFERENCES `tb_supplier` (`id_supplier`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `tb_pembelian` */

LOCK TABLES `tb_pembelian` WRITE;

insert  into `tb_pembelian`(`id_pembelian`,`id_barang`,`id_supplier`,`jumlah_barang_pembelian`,`total`,`created_at`,`expired_at`,`status_expired`) values (1,1,1,20,2000000,'2022-08-13 15:25:00','2023-08-13 15:25:00',NULL);
insert  into `tb_pembelian`(`id_pembelian`,`id_barang`,`id_supplier`,`jumlah_barang_pembelian`,`total`,`created_at`,`expired_at`,`status_expired`) values (2,2,2,40,8000000,'2022-08-13 15:25:00','2023-08-13 15:25:00',NULL);
insert  into `tb_pembelian`(`id_pembelian`,`id_barang`,`id_supplier`,`jumlah_barang_pembelian`,`total`,`created_at`,`expired_at`,`status_expired`) values (3,3,4,25,7500000,'2022-08-13 15:26:00','2023-08-13 15:26:00',NULL);
insert  into `tb_pembelian`(`id_pembelian`,`id_barang`,`id_supplier`,`jumlah_barang_pembelian`,`total`,`created_at`,`expired_at`,`status_expired`) values (4,4,1,45,18000000,'2022-08-13 15:26:00','2023-08-13 15:26:00',NULL);
insert  into `tb_pembelian`(`id_pembelian`,`id_barang`,`id_supplier`,`jumlah_barang_pembelian`,`total`,`created_at`,`expired_at`,`status_expired`) values (5,5,2,55,27500000,'2022-08-13 15:27:00','2023-08-13 15:27:00',NULL);

UNLOCK TABLES;

/*Table structure for table `tb_penjualan` */

DROP TABLE IF EXISTS `tb_penjualan`;

CREATE TABLE `tb_penjualan` (
  `id_penjualan` int(11) NOT NULL AUTO_INCREMENT,
  `id_transaksi` varchar(255) DEFAULT NULL,
  `id_barang` int(11) DEFAULT NULL,
  `id_pelanggan` int(11) DEFAULT NULL,
  `jumlah_barang` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id_penjualan`),
  KEY `id_barang` (`id_barang`),
  KEY `id_pelanggan` (`id_pelanggan`),
  CONSTRAINT `tb_penjualan_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `tb_barang` (`id_barang`),
  CONSTRAINT `tb_penjualan_ibfk_2` FOREIGN KEY (`id_pelanggan`) REFERENCES `tb_pelanggan` (`id_pelanggan`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

/*Data for the table `tb_penjualan` */

LOCK TABLES `tb_penjualan` WRITE;

insert  into `tb_penjualan`(`id_penjualan`,`id_transaksi`,`id_barang`,`id_pelanggan`,`jumlah_barang`,`total`,`created_at`) values (1,'trnsk_1',1,1,1,100000,'2022-08-13 12:38:00');
insert  into `tb_penjualan`(`id_penjualan`,`id_transaksi`,`id_barang`,`id_pelanggan`,`jumlah_barang`,`total`,`created_at`) values (2,'trnsk_1',2,1,1,200000,'2022-08-13 12:38:00');
insert  into `tb_penjualan`(`id_penjualan`,`id_transaksi`,`id_barang`,`id_pelanggan`,`jumlah_barang`,`total`,`created_at`) values (3,'trnsk_1',3,1,1,300000,'2022-08-13 12:38:00');
insert  into `tb_penjualan`(`id_penjualan`,`id_transaksi`,`id_barang`,`id_pelanggan`,`jumlah_barang`,`total`,`created_at`) values (4,'trnsk_2',1,2,1,100000,'2022-08-13 12:39:00');
insert  into `tb_penjualan`(`id_penjualan`,`id_transaksi`,`id_barang`,`id_pelanggan`,`jumlah_barang`,`total`,`created_at`) values (5,'trnsk_2',2,2,1,200000,'2022-08-13 12:39:00');
insert  into `tb_penjualan`(`id_penjualan`,`id_transaksi`,`id_barang`,`id_pelanggan`,`jumlah_barang`,`total`,`created_at`) values (6,'trnsk_2',4,2,1,400000,'2022-08-13 12:39:00');
insert  into `tb_penjualan`(`id_penjualan`,`id_transaksi`,`id_barang`,`id_pelanggan`,`jumlah_barang`,`total`,`created_at`) values (7,'trnsk_3',3,4,1,300000,'2022-08-13 12:40:00');
insert  into `tb_penjualan`(`id_penjualan`,`id_transaksi`,`id_barang`,`id_pelanggan`,`jumlah_barang`,`total`,`created_at`) values (8,'trnsk_3',2,4,1,200000,'2022-08-13 12:40:00');
insert  into `tb_penjualan`(`id_penjualan`,`id_transaksi`,`id_barang`,`id_pelanggan`,`jumlah_barang`,`total`,`created_at`) values (9,'trnsk_3',5,4,1,500000,'2022-08-13 12:40:00');

UNLOCK TABLES;

/*Table structure for table `tb_supplier` */

DROP TABLE IF EXISTS `tb_supplier`;

CREATE TABLE `tb_supplier` (
  `id_supplier` int(11) NOT NULL AUTO_INCREMENT,
  `nama_supplier` varchar(255) DEFAULT NULL,
  `jenis_supplier` varchar(255) DEFAULT NULL,
  `alamat_supplier` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_supplier`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `tb_supplier` */

LOCK TABLES `tb_supplier` WRITE;

insert  into `tb_supplier`(`id_supplier`,`nama_supplier`,`jenis_supplier`,`alamat_supplier`) values (1,'supplier1','jenissupplier1','alamatsupplier1');
insert  into `tb_supplier`(`id_supplier`,`nama_supplier`,`jenis_supplier`,`alamat_supplier`) values (2,'supplier2','jenissupplier2','alamatsupplier2');
insert  into `tb_supplier`(`id_supplier`,`nama_supplier`,`jenis_supplier`,`alamat_supplier`) values (4,'supplier3','jenissupplier3','alamatsupplier3');

UNLOCK TABLES;

/*Table structure for table `tb_test_penjualan` */

DROP TABLE IF EXISTS `tb_test_penjualan`;

CREATE TABLE `tb_test_penjualan` (
  `id_penjualan` int(11) NOT NULL AUTO_INCREMENT,
  `id_transaksi` varchar(10) DEFAULT NULL,
  `id_barang` int(11) DEFAULT NULL,
  `id_pelanggan` int(11) DEFAULT NULL,
  `jumlah_barang` int(11) DEFAULT NULL,
  `harga_barang` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id_penjualan`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=latin1;

/*Data for the table `tb_test_penjualan` */

LOCK TABLES `tb_test_penjualan` WRITE;

insert  into `tb_test_penjualan`(`id_penjualan`,`id_transaksi`,`id_barang`,`id_pelanggan`,`jumlah_barang`,`harga_barang`,`total`,`created_at`) values (1,'trnsk_1',1,1,2815,100000,281500000,'2016-01-01 00:00:00');
insert  into `tb_test_penjualan`(`id_penjualan`,`id_transaksi`,`id_barang`,`id_pelanggan`,`jumlah_barang`,`harga_barang`,`total`,`created_at`) values (2,'trnsk_2',1,1,2672,100000,267200000,'2016-02-01 00:00:00');
insert  into `tb_test_penjualan`(`id_penjualan`,`id_transaksi`,`id_barang`,`id_pelanggan`,`jumlah_barang`,`harga_barang`,`total`,`created_at`) values (3,'trnsk_3',1,1,2755,100000,275500000,'2016-03-01 00:00:00');
insert  into `tb_test_penjualan`(`id_penjualan`,`id_transaksi`,`id_barang`,`id_pelanggan`,`jumlah_barang`,`harga_barang`,`total`,`created_at`) values (4,'trnsk_4',1,1,2721,100000,272100000,'2016-04-01 00:00:00');
insert  into `tb_test_penjualan`(`id_penjualan`,`id_transaksi`,`id_barang`,`id_pelanggan`,`jumlah_barang`,`harga_barang`,`total`,`created_at`) values (5,'trnsk_5',1,1,2946,100000,294600000,'2016-05-01 00:00:00');
insert  into `tb_test_penjualan`(`id_penjualan`,`id_transaksi`,`id_barang`,`id_pelanggan`,`jumlah_barang`,`harga_barang`,`total`,`created_at`) values (6,'trnsk_6',1,1,3036,100000,303600000,'2016-06-01 00:00:00');
insert  into `tb_test_penjualan`(`id_penjualan`,`id_transaksi`,`id_barang`,`id_pelanggan`,`jumlah_barang`,`harga_barang`,`total`,`created_at`) values (7,'trnsk_7',1,1,2282,100000,228200000,'2016-07-01 00:00:00');
insert  into `tb_test_penjualan`(`id_penjualan`,`id_transaksi`,`id_barang`,`id_pelanggan`,`jumlah_barang`,`harga_barang`,`total`,`created_at`) values (8,'trnsk_8',1,1,2212,100000,221200000,'2016-08-01 00:00:00');
insert  into `tb_test_penjualan`(`id_penjualan`,`id_transaksi`,`id_barang`,`id_pelanggan`,`jumlah_barang`,`harga_barang`,`total`,`created_at`) values (9,'trnsk_9',1,1,2922,100000,292200000,'2016-09-01 00:00:00');
insert  into `tb_test_penjualan`(`id_penjualan`,`id_transaksi`,`id_barang`,`id_pelanggan`,`jumlah_barang`,`harga_barang`,`total`,`created_at`) values (10,'trnsk_10',1,1,4301,100000,430100000,'2016-10-01 00:00:00');
insert  into `tb_test_penjualan`(`id_penjualan`,`id_transaksi`,`id_barang`,`id_pelanggan`,`jumlah_barang`,`harga_barang`,`total`,`created_at`) values (11,'trnsk_11',1,1,5764,100000,576400000,'2016-11-01 00:00:00');
insert  into `tb_test_penjualan`(`id_penjualan`,`id_transaksi`,`id_barang`,`id_pelanggan`,`jumlah_barang`,`harga_barang`,`total`,`created_at`) values (12,'trnsk_12',1,1,7312,100000,731200000,'2016-12-01 00:00:00');
insert  into `tb_test_penjualan`(`id_penjualan`,`id_transaksi`,`id_barang`,`id_pelanggan`,`jumlah_barang`,`harga_barang`,`total`,`created_at`) values (13,'trnsk_13',1,1,2541,100000,254100000,'2017-01-01 00:00:00');
insert  into `tb_test_penjualan`(`id_penjualan`,`id_transaksi`,`id_barang`,`id_pelanggan`,`jumlah_barang`,`harga_barang`,`total`,`created_at`) values (14,'trnsk_14',1,1,2475,100000,247500000,'2017-02-01 00:00:00');
insert  into `tb_test_penjualan`(`id_penjualan`,`id_transaksi`,`id_barang`,`id_pelanggan`,`jumlah_barang`,`harga_barang`,`total`,`created_at`) values (15,'trnsk_15',1,1,3031,100000,303100000,'2017-03-01 00:00:00');
insert  into `tb_test_penjualan`(`id_penjualan`,`id_transaksi`,`id_barang`,`id_pelanggan`,`jumlah_barang`,`harga_barang`,`total`,`created_at`) values (16,'trnsk_16',1,1,3266,100000,326600000,'2017-04-01 00:00:00');
insert  into `tb_test_penjualan`(`id_penjualan`,`id_transaksi`,`id_barang`,`id_pelanggan`,`jumlah_barang`,`harga_barang`,`total`,`created_at`) values (17,'trnsk_17',1,1,3776,100000,377600000,'2017-05-01 00:00:00');
insert  into `tb_test_penjualan`(`id_penjualan`,`id_transaksi`,`id_barang`,`id_pelanggan`,`jumlah_barang`,`harga_barang`,`total`,`created_at`) values (18,'trnsk_18',1,1,3230,100000,323000000,'2017-06-01 00:00:00');
insert  into `tb_test_penjualan`(`id_penjualan`,`id_transaksi`,`id_barang`,`id_pelanggan`,`jumlah_barang`,`harga_barang`,`total`,`created_at`) values (19,'trnsk_19',1,1,3028,100000,302800000,'2017-07-01 00:00:00');
insert  into `tb_test_penjualan`(`id_penjualan`,`id_transaksi`,`id_barang`,`id_pelanggan`,`jumlah_barang`,`harga_barang`,`total`,`created_at`) values (20,'trnsk_20',1,1,1759,100000,175900000,'2017-08-01 00:00:00');
insert  into `tb_test_penjualan`(`id_penjualan`,`id_transaksi`,`id_barang`,`id_pelanggan`,`jumlah_barang`,`harga_barang`,`total`,`created_at`) values (21,'trnsk_21',1,1,3595,100000,359500000,'2017-09-01 00:00:00');
insert  into `tb_test_penjualan`(`id_penjualan`,`id_transaksi`,`id_barang`,`id_pelanggan`,`jumlah_barang`,`harga_barang`,`total`,`created_at`) values (22,'trnsk_22',1,1,4474,100000,447400000,'2017-10-01 00:00:00');
insert  into `tb_test_penjualan`(`id_penjualan`,`id_transaksi`,`id_barang`,`id_pelanggan`,`jumlah_barang`,`harga_barang`,`total`,`created_at`) values (23,'trnsk_23',1,1,6838,100000,683800000,'2017-11-01 00:00:00');
insert  into `tb_test_penjualan`(`id_penjualan`,`id_transaksi`,`id_barang`,`id_pelanggan`,`jumlah_barang`,`harga_barang`,`total`,`created_at`) values (24,'trnsk_24',1,1,8357,100000,835700000,'2017-12-01 00:00:00');
insert  into `tb_test_penjualan`(`id_penjualan`,`id_transaksi`,`id_barang`,`id_pelanggan`,`jumlah_barang`,`harga_barang`,`total`,`created_at`) values (25,'trnsk_25',1,1,3113,100000,311300000,'2018-01-01 00:00:00');
insert  into `tb_test_penjualan`(`id_penjualan`,`id_transaksi`,`id_barang`,`id_pelanggan`,`jumlah_barang`,`harga_barang`,`total`,`created_at`) values (26,'trnsk_26',1,1,3006,100000,300600000,'2018-02-01 00:00:00');
insert  into `tb_test_penjualan`(`id_penjualan`,`id_transaksi`,`id_barang`,`id_pelanggan`,`jumlah_barang`,`harga_barang`,`total`,`created_at`) values (27,'trnsk_27',1,1,4047,100000,404700000,'2018-03-01 00:00:00');
insert  into `tb_test_penjualan`(`id_penjualan`,`id_transaksi`,`id_barang`,`id_pelanggan`,`jumlah_barang`,`harga_barang`,`total`,`created_at`) values (28,'trnsk_28',1,1,3523,100000,352300000,'2018-04-01 00:00:00');
insert  into `tb_test_penjualan`(`id_penjualan`,`id_transaksi`,`id_barang`,`id_pelanggan`,`jumlah_barang`,`harga_barang`,`total`,`created_at`) values (29,'trnsk_29',1,1,3937,100000,393700000,'2018-05-01 00:00:00');
insert  into `tb_test_penjualan`(`id_penjualan`,`id_transaksi`,`id_barang`,`id_pelanggan`,`jumlah_barang`,`harga_barang`,`total`,`created_at`) values (30,'trnsk_30',1,1,3986,100000,398600000,'2018-06-01 00:00:00');
insert  into `tb_test_penjualan`(`id_penjualan`,`id_transaksi`,`id_barang`,`id_pelanggan`,`jumlah_barang`,`harga_barang`,`total`,`created_at`) values (31,'trnsk_31',1,1,3260,100000,326000000,'2018-07-01 00:00:00');
insert  into `tb_test_penjualan`(`id_penjualan`,`id_transaksi`,`id_barang`,`id_pelanggan`,`jumlah_barang`,`harga_barang`,`total`,`created_at`) values (32,'trnsk_32',1,1,1573,100000,157300000,'2018-08-01 00:00:00');
insert  into `tb_test_penjualan`(`id_penjualan`,`id_transaksi`,`id_barang`,`id_pelanggan`,`jumlah_barang`,`harga_barang`,`total`,`created_at`) values (33,'trnsk_33',1,1,3528,100000,352800000,'2018-09-01 00:00:00');
insert  into `tb_test_penjualan`(`id_penjualan`,`id_transaksi`,`id_barang`,`id_pelanggan`,`jumlah_barang`,`harga_barang`,`total`,`created_at`) values (34,'trnsk_34',1,1,5211,100000,521100000,'2018-10-01 00:00:00');
insert  into `tb_test_penjualan`(`id_penjualan`,`id_transaksi`,`id_barang`,`id_pelanggan`,`jumlah_barang`,`harga_barang`,`total`,`created_at`) values (35,'trnsk_35',1,1,7614,100000,761400000,'2018-11-01 00:00:00');
insert  into `tb_test_penjualan`(`id_penjualan`,`id_transaksi`,`id_barang`,`id_pelanggan`,`jumlah_barang`,`harga_barang`,`total`,`created_at`) values (36,'trnsk_36',1,1,9254,100000,925400000,'2018-12-01 00:00:00');
insert  into `tb_test_penjualan`(`id_penjualan`,`id_transaksi`,`id_barang`,`id_pelanggan`,`jumlah_barang`,`harga_barang`,`total`,`created_at`) values (37,'trnsk_37',1,1,5375,100000,537500000,'2019-01-01 00:00:00');
insert  into `tb_test_penjualan`(`id_penjualan`,`id_transaksi`,`id_barang`,`id_pelanggan`,`jumlah_barang`,`harga_barang`,`total`,`created_at`) values (38,'trnsk_38',1,1,3088,100000,308800000,'2019-02-01 00:00:00');
insert  into `tb_test_penjualan`(`id_penjualan`,`id_transaksi`,`id_barang`,`id_pelanggan`,`jumlah_barang`,`harga_barang`,`total`,`created_at`) values (39,'trnsk_39',1,1,3718,100000,371800000,'2019-03-01 00:00:00');
insert  into `tb_test_penjualan`(`id_penjualan`,`id_transaksi`,`id_barang`,`id_pelanggan`,`jumlah_barang`,`harga_barang`,`total`,`created_at`) values (40,'trnsk_40',1,1,4514,100000,451400000,'2019-04-01 00:00:00');
insert  into `tb_test_penjualan`(`id_penjualan`,`id_transaksi`,`id_barang`,`id_pelanggan`,`jumlah_barang`,`harga_barang`,`total`,`created_at`) values (41,'trnsk_41',1,1,4520,100000,452000000,'2019-05-01 00:00:00');
insert  into `tb_test_penjualan`(`id_penjualan`,`id_transaksi`,`id_barang`,`id_pelanggan`,`jumlah_barang`,`harga_barang`,`total`,`created_at`) values (42,'trnsk_42',1,1,4539,100000,453900000,'2019-06-01 00:00:00');
insert  into `tb_test_penjualan`(`id_penjualan`,`id_transaksi`,`id_barang`,`id_pelanggan`,`jumlah_barang`,`harga_barang`,`total`,`created_at`) values (43,'trnsk_43',1,1,3663,100000,366300000,'2019-07-01 00:00:00');
insert  into `tb_test_penjualan`(`id_penjualan`,`id_transaksi`,`id_barang`,`id_pelanggan`,`jumlah_barang`,`harga_barang`,`total`,`created_at`) values (44,'trnsk_44',1,1,1643,100000,164300000,'2019-08-01 00:00:00');
insert  into `tb_test_penjualan`(`id_penjualan`,`id_transaksi`,`id_barang`,`id_pelanggan`,`jumlah_barang`,`harga_barang`,`total`,`created_at`) values (45,'trnsk_45',1,1,4739,100000,473900000,'2019-09-01 00:00:00');
insert  into `tb_test_penjualan`(`id_penjualan`,`id_transaksi`,`id_barang`,`id_pelanggan`,`jumlah_barang`,`harga_barang`,`total`,`created_at`) values (46,'trnsk_46',1,1,5428,100000,542800000,'2019-10-01 00:00:00');
insert  into `tb_test_penjualan`(`id_penjualan`,`id_transaksi`,`id_barang`,`id_pelanggan`,`jumlah_barang`,`harga_barang`,`total`,`created_at`) values (47,'trnsk_47',1,1,8314,100000,831400000,'2019-11-01 00:00:00');
insert  into `tb_test_penjualan`(`id_penjualan`,`id_transaksi`,`id_barang`,`id_pelanggan`,`jumlah_barang`,`harga_barang`,`total`,`created_at`) values (48,'trnsk_48',1,1,10651,100000,1065100000,'2019-12-01 00:00:00');
insert  into `tb_test_penjualan`(`id_penjualan`,`id_transaksi`,`id_barang`,`id_pelanggan`,`jumlah_barang`,`harga_barang`,`total`,`created_at`) values (49,'trnsk_49',1,1,3633,100000,363300000,'2020-01-01 00:00:00');
insert  into `tb_test_penjualan`(`id_penjualan`,`id_transaksi`,`id_barang`,`id_pelanggan`,`jumlah_barang`,`harga_barang`,`total`,`created_at`) values (50,'trnsk_50',1,1,4292,100000,429200000,'2020-02-01 00:00:00');
insert  into `tb_test_penjualan`(`id_penjualan`,`id_transaksi`,`id_barang`,`id_pelanggan`,`jumlah_barang`,`harga_barang`,`total`,`created_at`) values (51,'trnsk_51',1,1,4154,100000,415400000,'2020-03-01 00:00:00');
insert  into `tb_test_penjualan`(`id_penjualan`,`id_transaksi`,`id_barang`,`id_pelanggan`,`jumlah_barang`,`harga_barang`,`total`,`created_at`) values (52,'trnsk_52',1,1,4121,100000,412100000,'2020-04-01 00:00:00');
insert  into `tb_test_penjualan`(`id_penjualan`,`id_transaksi`,`id_barang`,`id_pelanggan`,`jumlah_barang`,`harga_barang`,`total`,`created_at`) values (53,'trnsk_53',1,1,4647,100000,464700000,'2020-05-01 00:00:00');
insert  into `tb_test_penjualan`(`id_penjualan`,`id_transaksi`,`id_barang`,`id_pelanggan`,`jumlah_barang`,`harga_barang`,`total`,`created_at`) values (54,'trnsk_54',1,1,4753,100000,475300000,'2020-06-01 00:00:00');
insert  into `tb_test_penjualan`(`id_penjualan`,`id_transaksi`,`id_barang`,`id_pelanggan`,`jumlah_barang`,`harga_barang`,`total`,`created_at`) values (55,'trnsk_55',1,1,3965,100000,396500000,'2020-07-01 00:00:00');
insert  into `tb_test_penjualan`(`id_penjualan`,`id_transaksi`,`id_barang`,`id_pelanggan`,`jumlah_barang`,`harga_barang`,`total`,`created_at`) values (56,'trnsk_56',1,1,1723,100000,172300000,'2020-08-01 00:00:00');
insert  into `tb_test_penjualan`(`id_penjualan`,`id_transaksi`,`id_barang`,`id_pelanggan`,`jumlah_barang`,`harga_barang`,`total`,`created_at`) values (57,'trnsk_57',1,1,5048,100000,504800000,'2020-09-01 00:00:00');
insert  into `tb_test_penjualan`(`id_penjualan`,`id_transaksi`,`id_barang`,`id_pelanggan`,`jumlah_barang`,`harga_barang`,`total`,`created_at`) values (58,'trnsk_58',1,1,6922,100000,692200000,'2020-10-01 00:00:00');
insert  into `tb_test_penjualan`(`id_penjualan`,`id_transaksi`,`id_barang`,`id_pelanggan`,`jumlah_barang`,`harga_barang`,`total`,`created_at`) values (59,'trnsk_59',1,1,9858,100000,985800000,'2020-11-01 00:00:00');
insert  into `tb_test_penjualan`(`id_penjualan`,`id_transaksi`,`id_barang`,`id_pelanggan`,`jumlah_barang`,`harga_barang`,`total`,`created_at`) values (60,'trnsk_60',1,1,11331,100000,1133100000,'2020-12-01 00:00:00');
insert  into `tb_test_penjualan`(`id_penjualan`,`id_transaksi`,`id_barang`,`id_pelanggan`,`jumlah_barang`,`harga_barang`,`total`,`created_at`) values (61,'trnsk_61',1,1,4016,100000,401600000,'2021-01-01 00:00:00');
insert  into `tb_test_penjualan`(`id_penjualan`,`id_transaksi`,`id_barang`,`id_pelanggan`,`jumlah_barang`,`harga_barang`,`total`,`created_at`) values (62,'trnsk_62',1,1,3957,100000,395700000,'2021-02-01 00:00:00');
insert  into `tb_test_penjualan`(`id_penjualan`,`id_transaksi`,`id_barang`,`id_pelanggan`,`jumlah_barang`,`harga_barang`,`total`,`created_at`) values (63,'trnsk_63',1,1,4510,100000,451000000,'2021-03-01 00:00:00');
insert  into `tb_test_penjualan`(`id_penjualan`,`id_transaksi`,`id_barang`,`id_pelanggan`,`jumlah_barang`,`harga_barang`,`total`,`created_at`) values (64,'trnsk_64',1,1,4276,100000,427600000,'2021-04-01 00:00:00');
insert  into `tb_test_penjualan`(`id_penjualan`,`id_transaksi`,`id_barang`,`id_pelanggan`,`jumlah_barang`,`harga_barang`,`total`,`created_at`) values (65,'trnsk_65',1,1,4968,100000,496800000,'2021-05-01 00:00:00');
insert  into `tb_test_penjualan`(`id_penjualan`,`id_transaksi`,`id_barang`,`id_pelanggan`,`jumlah_barang`,`harga_barang`,`total`,`created_at`) values (66,'trnsk_66',1,1,4677,100000,467700000,'2021-06-01 00:00:00');
insert  into `tb_test_penjualan`(`id_penjualan`,`id_transaksi`,`id_barang`,`id_pelanggan`,`jumlah_barang`,`harga_barang`,`total`,`created_at`) values (67,'trnsk_67',1,1,3523,100000,352300000,'2021-07-01 00:00:00');
insert  into `tb_test_penjualan`(`id_penjualan`,`id_transaksi`,`id_barang`,`id_pelanggan`,`jumlah_barang`,`harga_barang`,`total`,`created_at`) values (68,'trnsk_68',1,1,1821,100000,182100000,'2021-08-01 00:00:00');
insert  into `tb_test_penjualan`(`id_penjualan`,`id_transaksi`,`id_barang`,`id_pelanggan`,`jumlah_barang`,`harga_barang`,`total`,`created_at`) values (69,'trnsk_69',1,1,5222,100000,522200000,'2021-09-01 00:00:00');
insert  into `tb_test_penjualan`(`id_penjualan`,`id_transaksi`,`id_barang`,`id_pelanggan`,`jumlah_barang`,`harga_barang`,`total`,`created_at`) values (70,'trnsk_70',1,1,6872,100000,687200000,'2021-10-01 00:00:00');
insert  into `tb_test_penjualan`(`id_penjualan`,`id_transaksi`,`id_barang`,`id_pelanggan`,`jumlah_barang`,`harga_barang`,`total`,`created_at`) values (71,'trnsk_71',1,1,10803,100000,1080300000,'2021-11-01 00:00:00');
insert  into `tb_test_penjualan`(`id_penjualan`,`id_transaksi`,`id_barang`,`id_pelanggan`,`jumlah_barang`,`harga_barang`,`total`,`created_at`) values (72,'trnsk_72',1,1,13916,100000,1391600000,'2021-12-01 00:00:00');

UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
