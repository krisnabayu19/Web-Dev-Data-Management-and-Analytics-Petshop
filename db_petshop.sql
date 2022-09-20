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
  `full_name` varchar(150) DEFAULT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `role` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `auth_user` */

LOCK TABLES `auth_user` WRITE;

insert  into `auth_user`(`id`,`password`,`last_login`,`is_superuser`,`username`,`full_name`,`first_name`,`last_name`,`email`,`is_staff`,`role`,`is_active`,`verified`,`date_joined`) values (2,'pbkdf2_sha256$216000$JTsXEGo19qoo$NuIgJ/ZzZKbwoFIC1xWREKJ5fCqq0DZIV4IpGh/qIIo=','2022-08-30 06:14:37.465022',0,'bayukrisna_1999',NULL,'krisna','bayu','krisnabayu1999@gmail.com',1,'admin',1,1,'2022-07-15 07:31:16.853528');
insert  into `auth_user`(`id`,`password`,`last_login`,`is_superuser`,`username`,`full_name`,`first_name`,`last_name`,`email`,`is_staff`,`role`,`is_active`,`verified`,`date_joined`) values (5,'pbkdf2_sha256$216000$Cq76R27HoSWF$ieac5PTEPxqzDak6eqSKK85mnOuI4s3gPsQ806Kq+oQ=','2022-09-20 11:33:10.501199',0,'minirustini','Kadek Mini Rustini','mini','rustini','minirustini1212@gmail.com',1,'executive',1,1,'2022-08-18 04:15:18.314612');
insert  into `auth_user`(`id`,`password`,`last_login`,`is_superuser`,`username`,`full_name`,`first_name`,`last_name`,`email`,`is_staff`,`role`,`is_active`,`verified`,`date_joined`) values (8,'pbkdf2_sha256$216000$Y9SnsF53T3p3$G2l8TRF6gmo/ckyq6SaOMPu87IaMvaxTFySnhTQum5A=','2022-09-19 12:19:10.807477',0,'dwik','Dwik Krisna','Dwik','Krisna','dwikkrisna@gmail.com',1,'admin',1,1,'2022-08-29 13:01:57.689359');
insert  into `auth_user`(`id`,`password`,`last_login`,`is_superuser`,`username`,`full_name`,`first_name`,`last_name`,`email`,`is_staff`,`role`,`is_active`,`verified`,`date_joined`) values (9,'pbkdf2_sha256$216000$LBbLJ5krBLt6$04UC++Sf8AVKe/3+hLnRkMiAGGxkwypcxkQB07f4qSE=','2022-09-18 15:07:47.442277',1,'superadmintest',NULL,'','','',0,'superuser',1,1,'2022-09-18 12:32:07.939283');

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

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('0pjs7ktec0p66x1pguetyjjs9tuym050','.eJxVjEEOwiAQRe_C2pDK0AFcuu8ZyMBMpWpoUtqV8e7apAvd_vfef6lI21ri1mSJE6uLQnX63RLlh9Qd8J3qbdZ5rusyJb0r-qBNDzPL83q4fweFWvnWgqELYCylc86QrOlGY30PySAwgEGC0ToKgsSZQdj5JCLescHe2azeH9lpOAg:1oSdxT:tvi7JXlMJVDB30qUvIXqDkv-oEIkPaOqDnztd1l6XvQ','2022-09-12 12:33:39.547173');
insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('0tslk2a0f184w5vx77p6ed76dpk2yngi','.eJxVjEsOAiEQBe_C2hAQ6AaX7ucMhIbGGTWQzGdlvLtOMgvdvqp6LxHTto5xW3iOUxEX4cTpd6OUH9x2UO6p3brMva3zRHJX5EEXOfTCz-vh_h2MaRm_dSBQwJjd2WElNkFhVZ5Yk1dg0ADVErQrqIFCZVQmEBXnmRCsBSveH9wJN5Q:1oTJyc:7KYFVj9Rsdisuv9G617y3vL6LvSQyHhCbYuVE_hpI8Q','2022-09-14 09:25:38.639022');
insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('0vt5bfqtr06cncclolls623juleu5hnd','.eJxVjEEOwiAQRe_C2hCggQ4u3XsGMswMUjVtUtpV490NSRe6_e-9f6iE-1bT3mRNE6urcuryu2Wkl8wd8BPnx6Jpmbd1yror-qRN3xeW9-10_w4qttprAHIkFg04Fh5sDITBURg9WiJbMGeAAH4wA6PJKMGLKW6MsSADqc8X_l04vQ:1oRTEs:YqXKYlUGfqTYeH-UKgNT7oF62pruGfNbfMVAXfFF3yg','2022-09-09 06:54:46.842963');
insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('1jdkkgre69qa2jtgjval7x7hlh0hnxa7','.eJxVjEEOwiAQRe_C2hCggQ4u3XsGMswMUjVtUtpV490NSRe6_e-9f6iE-1bT3mRNE6urcuryu2Wkl8wd8BPnx6Jpmbd1yror-qRN3xeW9-10_w4qttprAHIkFg04Fh5sDITBURg9WiJbMGeAAH4wA6PJKMGLKW6MsSADqc8X_l04vQ:1oMMvk:KGBo-tfV5TA_Gm4pmNMe9iR78uBEP4kwEqYzUU1X698','2022-08-26 05:09:56.979079');
insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('25px23jrd2kqxglsv36xovho1h967j0p','e30:1oOfcH:Kc6xTE5hynG3TZ7_f1LOO4zBvDVlWnv5lHl-7oXTMYA','2022-09-01 13:31:21.719345');
insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('2gfrmg9qg572otidjz02i3zuo0gmnja8','.eJxVjEsOAiEQBe_C2hAQ6AaX7ucMhIbGGTWQzGdlvLtOMgvdvqp6LxHTto5xW3iOUxEX4cTpd6OUH9x2UO6p3brMva3zRHJX5EEXOfTCz-vh_h2MaRm_dSBQwJjd2WElNkFhVZ5Yk1dg0ADVErQrqIFCZVQmEBXnmRCsBSveH9wJN5Q:1oaCGu:JsWplrvS9X9cu6ry_1jDxYQBsanpWXyQh-zffSBnMj0','2022-10-03 08:36:56.387198');
insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('2ib3ztxeqvrsvvr3a7fq7nw7kb5tpv44','.eJxVjEsOAiEQBe_C2hAQ6AaX7ucMhIbGGTWQzGdlvLtOMgvdvqp6LxHTto5xW3iOUxEX4cTpd6OUH9x2UO6p3brMva3zRHJX5EEXOfTCz-vh_h2MaRm_dSBQwJjd2WElNkFhVZ5Yk1dg0ADVErQrqIFCZVQmEBXnmRCsBSveH9wJN5Q:1oaBj6:QKIK0sjbNj4l3TGBbkpmDXziJOa6eD7RCecVLAtyD4s','2022-10-03 08:02:00.091298');
insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('2m829sr59p76thyw9vwrmlsjqzio6x9x','.eJxVjDkOwjAUBe_iGllx_L1R0nOG6C82DiBHylIh7g6RUkD7Zua91IDbWodtyfMwijqrqE6_GyE_ctuB3LHdJs1TW-eR9K7ogy76Okl-Xg7376DiUr91wew82xI7MLbvCwAJR5uRSwRilxhdIJMDEAqYBCEmYSrgU2ejF_X-AAPHOHY:1oaFgj:WV2ogwBRNi0P89WTA3cVa4n3YQch96pMINLutzq8AJw','2022-10-03 12:15:49.101404');
insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('2nz0aj5wrlvpru5nty0op006x5278p2h','.eJxVjEsOAiEQBe_C2hAQ6AaX7ucMhIbGGTWQzGdlvLtOMgvdvqp6LxHTto5xW3iOUxEX4cTpd6OUH9x2UO6p3brMva3zRHJX5EEXOfTCz-vh_h2MaRm_dSBQwJjd2WElNkFhVZ5Yk1dg0ADVErQrqIFCZVQmEBXnmRCsBSveH9wJN5Q:1oaAtt:e3SpbleDd8fbpqkNpiJbc86Eqbo_aX2cL98VBquB82E','2022-10-03 07:09:05.506549');
insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('2q7sxj6tdklf5a1897w0w4mnldw4hwjl','.eJxVjDsOwyAQBe9CHSFg-YiU6XMGtMASnEQgGbuycvfYkoukfTPzNhZwXWpYB81hyuzKPLv8bhHTi9oB8hPbo_PU2zJPkR8KP-ng957pfTvdv4OKo-41JlBoQIrkdLFS2eyLt46SKpSLQIhgRLRKajBaU3akDAI6qXTBHbPPF-Q8N7o:1oZthE:pPvavy_TyWmzy6VHN3tpaJQPkQUhwNBgT_jaboXEOrA','2022-10-02 12:46:52.092160');
insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('37tujb253hhzkdaz0d0cr7rd6hai4w7t','.eJxVjEEOwiAQRe_C2hCggQ4u3XsGMswMUjVtUtpV490NSRe6_e-9f6iE-1bT3mRNE6urcuryu2Wkl8wd8BPnx6Jpmbd1yror-qRN3xeW9-10_w4qttprAHIkFg04Fh5sDITBURg9WiJbMGeAAH4wA6PJKMGLKW6MsSADqc8X_l04vQ:1oNSnt:5HloeLdvZaqBCm7qu-uMmy8MlO3my4UJfQuvYWYO5ME','2022-08-29 05:38:21.155805');
insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('404uy65lxk8okvqfdjyzilokephwthp8','.eJxVjEEOwiAQRe_C2pBKhym4dN8zEAYGqRpISrsy3l1JutDtf-_9l3B-37LbG69uieIitDj9buTDg0sH8e7LrcpQy7YuJLsiD9rkXCM_r4f7d5B9y71OEyaK42g1MXpgGAjshAbNmQdICpVGY7wCBWG0CAngy8ikSIBA4v0B2bM3Og:1oaFIf:2hS7USaR9AtwAfoYnQQrwnZPM2UD2gs_YrO6pjs0bHw','2022-10-03 11:50:57.469794');
insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('40vf5ldyetn97oqxnrmo34squyrf4tf8','.eJxVjDsOwyAQBe9CHSFg-YiU6XMGtMASnEQgGbuycvfYkoukfTPzNhZwXWpYB81hyuzKPLv8bhHTi9oB8hPbo_PU2zJPkR8KP-ng957pfTvdv4OKo-41JlBoQIrkdLFS2eyLt46SKpSLQIhgRLRKajBaU3akDAI6qXTBHbPPF-Q8N7o:1oZtij:tc2N6hOSCsUB43MagIIas_--KOqPGtyuKMFkQdpQMZ4','2022-10-02 12:48:25.473256');
insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('4mi2jxsa2sp6dhog1camye22bu0sadz1','.eJxVjEsOAiEQBe_C2hAQ6AaX7ucMhIbGGTWQzGdlvLtOMgvdvqp6LxHTto5xW3iOUxEX4cTpd6OUH9x2UO6p3brMva3zRHJX5EEXOfTCz-vh_h2MaRm_dSBQwJjd2WElNkFhVZ5Yk1dg0ADVErQrqIFCZVQmEBXnmRCsBSveH9wJN5Q:1oaAiN:vL5AmH-leHo8SLDyj9NZlyYU-t3JIK07-LG5J9TGCCQ','2022-10-03 06:57:11.856837');
insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('4mlwgrqn7lwlgdqt81gh9exxawyxrpxj','.eJxVjEsOAiEQBe_C2hAQ6AaX7ucMhIbGGTWQzGdlvLtOMgvdvqp6LxHTto5xW3iOUxEX4cTpd6OUH9x2UO6p3brMva3zRHJX5EEXOfTCz-vh_h2MaRm_dSBQwJjd2WElNkFhVZ5Yk1dg0ADVErQrqIFCZVQmEBXnmRCsBSveH9wJN5Q:1oTJmH:cQB4VviV3m6H3lbpDiB6amwKU7KNac_RTHvi6_TLlmE','2022-09-14 09:12:53.340849');
insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('5e8k4vye603h4qbwer9g540rr7ow07i8','.eJxVjEEOgjAQRe_StWmKpTPUpa5ZeQDSoVOpmpYAXRnvLiQscPve_-8jOleWoSszT1304iKMOB0Zuf7FaRP-6dIjyz6nZYokt4nc7Szb7Pl93bd_gcHNw_q2BAoYe3M2GIi1VRhUQ1xRo0CjBgreVsZjBWQDo9KWyJuGCaGuoV6jMY1laWO65RTWopLmAO9lHHf4_QEUQ0Rs:1oZvfe:nUDGEG-tunj4uETG4EppE9nbdPdNAIUmNYMWeLjI834','2022-10-02 14:53:22.106117');
insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('5j9igylk6lskblkpcmyew7dl4rn0fdis','.eJxVjEEOwiAQRe_C2pDK0AFcuu8ZyMBMpWpoUtqV8e7apAvd_vfef6lI21ri1mSJE6uLQnX63RLlh9Qd8J3qbdZ5rusyJb0r-qBNDzPL83q4fweFWvnWgqELYCylc86QrOlGY30PySAwgEGC0ToKgsSZQdj5JCLescHe2azeH9lpOAg:1oSeCP:LGkequgCTjj-Gbd2_vsa54DU2mMVG9Fqrn6SUIPdvVI','2022-09-12 12:49:05.466493');
insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('5nz98nb0s2g3g1hum2pasaggc6e9tpj7','.eJxVjMsOwiAQRf-FtSEMKS-X7v0GwsyAVA0kpV0Z_12bdKHbe865LxHTtta4jbzEmcVZGHH63TDRI7cd8D21W5fU27rMKHdFHnTIa-f8vBzu30FNo35rUiZpp6HYAAwKORiNeQIAKl5BdkjBapN8oRICofWFVXFhmlhlRCPeH981ODU:1oaEXU:E3HtaHg3NkaqmfPdT_FrSRPks4DzG7NR36J0cRh0sJE','2022-10-03 11:02:12.320369');
insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('7jkpfh3roek0x2d0q8sg4dfyk74kncg0','.eJxVjDkOwjAUBe_iGllx_L1R0nOG6C82DiBHylIh7g6RUkD7Zua91IDbWodtyfMwijqrqE6_GyE_ctuB3LHdJs1TW-eR9K7ogy76Okl-Xg7376DiUr91wew82xI7MLbvCwAJR5uRSwRilxhdIJMDEAqYBCEmYSrgU2ejF_X-AAPHOHY:1oZvGr:zKlDtDcFK_CjfqCI-x-m5su9RxERRhjuQEq_Fru39JU','2022-10-02 14:27:45.005627');
insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('91l676izezptmxzyd5xp7gjxym3nuisw','.eJxVjEEOgjAQRe_StWloK8PA0r1naKbTQapSDC0r490NCQvd_vf-eytPW538VmT1KapBWXX63QLxQ_IO4p3ybdG85LqmoHdFH7To6xLleTncv8BEZdrfiGxZDDVoo0RnemACy9C1ZJjNSCEgAraucZGaQAKtNKPt-n6kiLxHi5SSluxTTtXXNEupNL-8GgyAsbZHbDUAOnf-fAFgIEbr:1oQLmP:wFnlCGszWfBA3AHIEIZtJjNH21gJlK98tsti3g1xT_4','2022-09-06 04:44:45.680307');
insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('920se5j4zotmy4l3sg3m65mb91w5z4eq','.eJxVjEsOAiEQBe_C2hAQ6AaX7ucMhIbGGTWQzGdlvLtOMgvdvqp6LxHTto5xW3iOUxEX4cTpd6OUH9x2UO6p3brMva3zRHJX5EEXOfTCz-vh_h2MaRm_dSBQwJjd2WElNkFhVZ5Yk1dg0ADVErQrqIFCZVQmEBXnmRCsBSveH9wJN5Q:1oSwie:Vq-zRgJQ5dPJyGd1vk1i-mHAxDU2_CvBT1H3X-pu-Uw','2022-09-13 08:35:36.945957');
insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('9behtjz363bwfa0ytv4w8dl14u24hdxy','.eJxVjEEOwiAQRe_C2pDK0AFcuu8ZyMBMpWpoUtqV8e7apAvd_vfef6lI21ri1mSJE6uLQnX63RLlh9Qd8J3qbdZ5rusyJb0r-qBNDzPL83q4fweFWvnWgqELYCylc86QrOlGY30PySAwgEGC0ToKgsSZQdj5JCLescHe2azeH9lpOAg:1oSe4O:JMcETO0h1zde6j_CJxnOHjx6NJhIas2_Y5wgNNdSCoA','2022-09-12 12:40:48.497883');
insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('9shf5exacjkubbqx9g04o1g356c4tl23','.eJxVjEsOAiEQBe_C2hAQ6AaX7ucMhIbGGTWQzGdlvLtOMgvdvqp6LxHTto5xW3iOUxEX4cTpd6OUH9x2UO6p3brMva3zRHJX5EEXOfTCz-vh_h2MaRm_dSBQwJjd2WElNkFhVZ5Yk1dg0ADVErQrqIFCZVQmEBXnmRCsBSveH9wJN5Q:1oaCku:-EHeT2NEdMafuaQnBWdBT6bzKKG1paby_-uunv-F-54','2022-10-03 09:07:56.993642');
insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('abd9uqtw57mx7d7fugynv37hno33cm9b','.eJxVjEsOAiEQBe_C2hAQ6AaX7ucMhIbGGTWQzGdlvLtOMgvdvqp6LxHTto5xW3iOUxEX4cTpd6OUH9x2UO6p3brMva3zRHJX5EEXOfTCz-vh_h2MaRm_dSBQwJjd2WElNkFhVZ5Yk1dg0ADVErQrqIFCZVQmEBXnmRCsBSveH9wJN5Q:1oTJdp:m558WV3m9me21-IoeooO_NFLFw5AVd9mCpmMqiXyT3Q','2022-09-14 09:04:09.197792');
insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('afmzlrg20wx6wf296fbruqnaqv1ic1ol','.eJxVjEsOAiEQBe_C2hAQ6AaX7ucMhIbGGTWQzGdlvLtOMgvdvqp6LxHTto5xW3iOUxEX4cTpd6OUH9x2UO6p3brMva3zRHJX5EEXOfTCz-vh_h2MaRm_dSBQwJjd2WElNkFhVZ5Yk1dg0ADVErQrqIFCZVQmEBXnmRCsBSveH9wJN5Q:1oTGYD:vIXRIUKNguxdCGwlT8c0FwQBwE3O3WDmduuIu0ut2cw','2022-09-14 05:46:09.961439');
insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('ajsc8ul17m0gn6y7xm74wph81b0j8253','.eJxVjDkOwjAUBe_iGllx_L1R0nOG6C82DiBHylIh7g6RUkD7Zua91IDbWodtyfMwijqrqE6_GyE_ctuB3LHdJs1TW-eR9K7ogy76Okl-Xg7376DiUr91wew82xI7MLbvCwAJR5uRSwRilxhdIJMDEAqYBCEmYSrgU2ejF_X-AAPHOHY:1oZvHJ:BOVwPhR1NJdi2a1FsRxsIAzSd8LW8MVVh3D_o44HXl4','2022-10-02 14:28:13.140427');
insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('b5dqjni17i24pk04ujc4aj8w8aj4mfcg','.eJxVjEEOwiAQRe_C2hCggQ4u3XsGMswMUjVtUtpV490NSRe6_e-9f6iE-1bT3mRNE6urcuryu2Wkl8wd8BPnx6Jpmbd1yror-qRN3xeW9-10_w4qttprAHIkFg04Fh5sDITBURg9WiJbMGeAAH4wA6PJKMGLKW6MsSADqc8X_l04vQ:1oMeRy:RisNotRIXZw_6qle00pwAlCI4FvEJP8Lo11MGW74UaI','2022-08-26 23:52:22.361239');
insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('c039ly2nsllsqxg2krud4f59x4h966nj','.eJxVjDkOwjAUBe_iGllx_L1R0nOG6C82DiBHylIh7g6RUkD7Zua91IDbWodtyfMwijqrqE6_GyE_ctuB3LHdJs1TW-eR9K7ogy76Okl-Xg7376DiUr91wew82xI7MLbvCwAJR5uRSwRilxhdIJMDEAqYBCEmYSrgU2ejF_X-AAPHOHY:1oZvB2:TgROxjmYhTpVJS3AQvm1ZTbNFJbT4L8Co4IDPWMYK98','2022-10-02 14:21:44.474699');
insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('c2exf0h3wguxqmxncnbyph8p22b1ivev','.eJxVjEsOAiEQBe_C2hAQ6AaX7ucMhIbGGTWQzGdlvLtOMgvdvqp6LxHTto5xW3iOUxEX4cTpd6OUH9x2UO6p3brMva3zRHJX5EEXOfTCz-vh_h2MaRm_dSBQwJjd2WElNkFhVZ5Yk1dg0ADVErQrqIFCZVQmEBXnmRCsBSveH9wJN5Q:1oZuEx:Mcx6O9hleU7i7mjPGCic4dFbS9nGI4R_cnUBFublgVE','2022-10-02 13:21:43.753628');
insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('cg9lzao57mxn2g76mnrpplfqql04s8k1','.eJxVjMsOwiAQRf-FtSEMKS-X7v0GwsyAVA0kpV0Z_12bdKHbe865LxHTtta4jbzEmcVZGHH63TDRI7cd8D21W5fU27rMKHdFHnTIa-f8vBzu30FNo35rUiZpp6HYAAwKORiNeQIAKl5BdkjBapN8oRICofWFVXFhmlhlRCPeH981ODU:1oaEbU:WvbL6IBN654oB_nk0YXJyq_N9KSmLTWhCJ-FMGHQWik','2022-10-03 11:06:20.354303');
insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('dsxtzxvzxv6uye1uivkegjxm8wkeh2pl','.eJxVjEsOAiEQBe_C2hAQ6AaX7ucMhIbGGTWQzGdlvLtOMgvdvqp6LxHTto5xW3iOUxEX4cTpd6OUH9x2UO6p3brMva3zRHJX5EEXOfTCz-vh_h2MaRm_dSBQwJjd2WElNkFhVZ5Yk1dg0ADVErQrqIFCZVQmEBXnmRCsBSveH9wJN5Q:1oQ1p2:VlWm4pODTWXNMsn75AR5UDWd1QKEFlnWgKtSlRqabbU','2022-09-05 07:26:08.200108');
insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('e9wy43e6qjhrf9opnylgt6s5i764aw5s','.eJxVjEsOAiEQBe_C2hAQ6AaX7ucMhIbGGTWQzGdlvLtOMgvdvqp6LxHTto5xW3iOUxEX4cTpd6OUH9x2UO6p3brMva3zRHJX5EEXOfTCz-vh_h2MaRm_dSBQwJjd2WElNkFhVZ5Yk1dg0ADVErQrqIFCZVQmEBXnmRCsBSveH9wJN5Q:1oaCKX:w2CIHapAy3UhvizfQrh-wmFLIuXVzWfhV6iHTjR9qYo','2022-10-03 08:40:41.361585');
insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('ebgog4v8jrm8umrr41fubk0iqlgeh7q4','.eJxVjEsOAiEQBe_C2hAQ6AaX7ucMhIbGGTWQzGdlvLtOMgvdvqp6LxHTto5xW3iOUxEX4cTpd6OUH9x2UO6p3brMva3zRHJX5EEXOfTCz-vh_h2MaRm_dSBQwJjd2WElNkFhVZ5Yk1dg0ADVErQrqIFCZVQmEBXnmRCsBSveH9wJN5Q:1oTGZt:bOcUf0-520dQ93uAt-RuvxhzJ6SkURYMYa7cV-7Xusw','2022-09-14 05:47:53.226963');
insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('ebrc7owtlbami1q9mwjabjepaioy8myc','.eJxVjDkOwjAUBe_iGllx_L1R0nOG6C82DiBHylIh7g6RUkD7Zua91IDbWodtyfMwijqrqE6_GyE_ctuB3LHdJs1TW-eR9K7ogy76Okl-Xg7376DiUr91wew82xI7MLbvCwAJR5uRSwRilxhdIJMDEAqYBCEmYSrgU2ejF_X-AAPHOHY:1oZvDe:GTXgc2V2PR1-S9HXq1ZLCY27Zm_O_1-g_Ch-qrHKd00','2022-10-02 14:24:26.553064');
insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('ehpl7o70f4xqa7v9fp81mo782x7evocv','.eJxVjEsOAiEQBe_C2hAQ6AaX7ucMhIbGGTWQzGdlvLtOMgvdvqp6LxHTto5xW3iOUxEX4cTpd6OUH9x2UO6p3brMva3zRHJX5EEXOfTCz-vh_h2MaRm_dSBQwJjd2WElNkFhVZ5Yk1dg0ADVErQrqIFCZVQmEBXnmRCsBSveH9wJN5Q:1oTJph:d_PbRcEDNibu1lmhwX8I7EC_4n8_AbqTi-zxK2Tx5b8','2022-09-14 09:16:25.527309');
insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('eqpz9fe0f5kvxfkjheahw81xri2g2u68','.eJxVjEsOAiEQBe_C2hAQ6AaX7ucMhIbGGTWQzGdlvLtOMgvdvqp6LxHTto5xW3iOUxEX4cTpd6OUH9x2UO6p3brMva3zRHJX5EEXOfTCz-vh_h2MaRm_dSBQwJjd2WElNkFhVZ5Yk1dg0ADVErQrqIFCZVQmEBXnmRCsBSveH9wJN5Q:1oaCew:7bFcitHmuLoGT7laVnm-lV6DHyAvspDoKJiV8VhQLrs','2022-10-03 09:01:46.626382');
insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('fe5vqqqor8el4kosronkdmbzyxnbhj2k','.eJxVjEsOAiEQBe_C2hAQ6AaX7ucMhIbGGTWQzGdlvLtOMgvdvqp6LxHTto5xW3iOUxEX4cTpd6OUH9x2UO6p3brMva3zRHJX5EEXOfTCz-vh_h2MaRm_dSBQwJjd2WElNkFhVZ5Yk1dg0ADVErQrqIFCZVQmEBXnmRCsBSveH9wJN5Q:1oaBcf:HYJG9DQiEm-akmdFQdVHSEQNSniAdsIuBUQbc_nxvtk','2022-10-03 07:55:21.920025');
insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('fj576lwa2e3pxvgqh41fvxqvup4r9p1u','.eJxVjDsOwjAQBe_iGln-fyjpOYO1a29wANlSnFSIu0OkFNC-mXkvlmBba9oGLWku7MwkO_1uCPlBbQflDu3Wee5tXWbku8IPOvi1F3peDvfvoMKo31pYr8CQm7A4FC5i9EKSyphB6QgUlNGFcvDaWNJSGUQkkhCsjHHSgr0_6SU39w:1oHiqV:tdLop3KxihwLEvCcG_mr6JqX0rvgPuwORLO41R24FFw','2022-08-13 09:33:19.644256');
insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('go5uha0owkmxu3wugv0j74db0ihunmsv','.eJxVjDkOwjAUBe_iGllx_L1R0nOG6C82DiBHylIh7g6RUkD7Zua91IDbWodtyfMwijqrqE6_GyE_ctuB3LHdJs1TW-eR9K7ogy76Okl-Xg7376DiUr91wew82xI7MLbvCwAJR5uRSwRilxhdIJMDEAqYBCEmYSrgU2ejF_X-AAPHOHY:1oaFTv:ezuFAvM3Homn97PzU7mRBZB49Nxq1itx8MnUuyUK6Fo','2022-10-03 12:02:35.192899');
insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('hm2r5tioi2pwt83y0fl7lfycrqpwp9kp','.eJxVjEEOwiAQRe_C2hCggQ4u3XsGMswMUjVtUtpV490NSRe6_e-9f6iE-1bT3mRNE6urcuryu2Wkl8wd8BPnx6Jpmbd1yror-qRN3xeW9-10_w4qttprAHIkFg04Fh5sDITBURg9WiJbMGeAAH4wA6PJKMGLKW6MsSADqc8X_l04vQ:1oNXeX:0n2Ghn4iai3DjH1kbfvZSVPlajQWgf-OHKodujytFjM','2022-08-29 10:49:01.962255');
insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('hma09gihed9bs1namcj031tvmvur17r8','.eJxVjEsOAiEQBe_C2hAQ6AaX7ucMhIbGGTWQzGdlvLtOMgvdvqp6LxHTto5xW3iOUxEX4cTpd6OUH9x2UO6p3brMva3zRHJX5EEXOfTCz-vh_h2MaRm_dSBQwJjd2WElNkFhVZ5Yk1dg0ADVErQrqIFCZVQmEBXnmRCsBSveH9wJN5Q:1oZwPZ:JYFm6X_TeE1majXuFy6zxT6baifyQE13kWzTCYGFSCE','2022-10-02 15:40:49.545057');
insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('hrkm5po4ysys1mhhypfnk2364nu4epwy','.eJxVjEsOAiEQBe_C2hAQ6AaX7ucMhIbGGTWQzGdlvLtOMgvdvqp6LxHTto5xW3iOUxEX4cTpd6OUH9x2UO6p3brMva3zRHJX5EEXOfTCz-vh_h2MaRm_dSBQwJjd2WElNkFhVZ5Yk1dg0ADVErQrqIFCZVQmEBXnmRCsBSveH9wJN5Q:1oTcZw:GWuWoJYuTz43GTu4mpBsy2t_Es3AKcjuaqOrSYTTU4M','2022-09-15 05:17:24.993259');
insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('hshncfqh5i5evf4q7nercnknj907ha6n','.eJxVjEsOAiEQBe_C2hAQ6AaX7ucMhIbGGTWQzGdlvLtOMgvdvqp6LxHTto5xW3iOUxEX4cTpd6OUH9x2UO6p3brMva3zRHJX5EEXOfTCz-vh_h2MaRm_dSBQwJjd2WElNkFhVZ5Yk1dg0ADVErQrqIFCZVQmEBXnmRCsBSveH9wJN5Q:1oZvjt:DNHKapN9A-PgZjYlS_mWeRFCfToYM4XUCbiSa621trA','2022-10-02 14:57:45.922505');
insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('hu6oiqzrohy96lk6pc906aw2dttggyha','.eJxVjDkOwjAUBe_iGllx_L1R0nOG6C82DiBHylIh7g6RUkD7Zua91IDbWodtyfMwijqrqE6_GyE_ctuB3LHdJs1TW-eR9K7ogy76Okl-Xg7376DiUr91wew82xI7MLbvCwAJR5uRSwRilxhdIJMDEAqYBCEmYSrgU2ejF_X-AAPHOHY:1oaFfG:irYx5dYN1W27T9Yhy3fzaONIlZSvkHh0cfld9Y7F5d8','2022-10-03 12:14:18.294117');
insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('hx3qpxmz6dlcw9zm9ihpf3e6z2zzontd','.eJxVjDsOwjAQBe_iGln-fyjpOYO1a29wANlSnFSIu0OkFNC-mXkvlmBba9oGLWku7MwkO_1uCPlBbQflDu3Wee5tXWbku8IPOvi1F3peDvfvoMKo31pYr8CQm7A4FC5i9EKSyphB6QgUlNGFcvDaWNJSGUQkkhCsjHHSgr0_6SU39w:1oGd5d:1p9aaVTaAnZIkpnFbppgaXprg-fTprMZNdsnA06h154','2022-08-10 09:12:25.508767');
insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('ig1mm2wo95bwvsqww3kw84kwkawe6ux9','.eJxVjEsOAiEQBe_C2hAQ6AaX7ucMhIbGGTWQzGdlvLtOMgvdvqp6LxHTto5xW3iOUxEX4cTpd6OUH9x2UO6p3brMva3zRHJX5EEXOfTCz-vh_h2MaRm_dSBQwJjd2WElNkFhVZ5Yk1dg0ADVErQrqIFCZVQmEBXnmRCsBSveH9wJN5Q:1oaBkr:Aebwdg1_0tK6C2Xe4gP2r52Bcs2ysXspq-LCSRBiA3E','2022-10-03 08:03:49.885847');
insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('ii24ri5isemdnrf529bs28m3ryzvsxld','.eJxVjEsOAiEQBe_C2hAQ6AaX7ucMhIbGGTWQzGdlvLtOMgvdvqp6LxHTto5xW3iOUxEX4cTpd6OUH9x2UO6p3brMva3zRHJX5EEXOfTCz-vh_h2MaRm_dSBQwJjd2WElNkFhVZ5Yk1dg0ADVErQrqIFCZVQmEBXnmRCsBSveH9wJN5Q:1oaCWQ:usYk7Fk8yRv-NRUN-RSuBr9QzTka5TMCzkc_7GCVYSk','2022-10-03 08:52:58.623523');
insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('ilpfx2d41tae4a91uhboglexpl3s152c','.eJxVjEsOAiEQBe_C2hAQ6AaX7ucMhIbGGTWQzGdlvLtOMgvdvqp6LxHTto5xW3iOUxEX4cTpd6OUH9x2UO6p3brMva3zRHJX5EEXOfTCz-vh_h2MaRm_dSBQwJjd2WElNkFhVZ5Yk1dg0ADVErQrqIFCZVQmEBXnmRCsBSveH9wJN5Q:1oaCiH:K3pDU5UMl8WYUE9P0bfC2acvHkUGXHrdPzIxXCw_XcY','2022-10-03 09:05:13.960271');
insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('imgvhyt17zfhb6rz32plg0iduksdhk5l','.eJxVjDkOwjAUBe_iGllx_L1R0nOG6C82DiBHylIh7g6RUkD7Zua91IDbWodtyfMwijqrqE6_GyE_ctuB3LHdJs1TW-eR9K7ogy76Okl-Xg7376DiUr91wew82xI7MLbvCwAJR5uRSwRilxhdIJMDEAqYBCEmYSrgU2ejF_X-AAPHOHY:1oZvMK:Qrk20dDYTwd9ZQOT0WaAMtDX_pXjU4dt8li9iOzygI0','2022-10-02 14:33:24.855072');
insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('je9wlkmappb84q4kqto77dak2zh5weqz','.eJxVjEEOwiAQRe_C2hCggQ4u3XsGMswMUjVtUtpV490NSRe6_e-9f6iE-1bT3mRNE6urcuryu2Wkl8wd8BPnx6Jpmbd1yror-qRN3xeW9-10_w4qttprAHIkFg04Fh5sDITBURg9WiJbMGeAAH4wA6PJKMGLKW6MsSADqc8X_l04vQ:1oMM1F:yK4KmACFR19NbBmg-h1z1UJc1rJD351m2R2TtY7IMbI','2022-08-26 04:11:33.828084');
insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('jgf9vj14uw2f7l65vnega185dpv7p61q','.eJxVjEEOwiAQRe_C2pBKhym4dN8zEAYGqRpISrsy3l1JutDtf-_9l3B-37LbG69uieIitDj9buTDg0sH8e7LrcpQy7YuJLsiD9rkXCM_r4f7d5B9y71OEyaK42g1MXpgGAjshAbNmQdICpVGY7wCBWG0CAngy8ikSIBA4v0B2bM3Og:1oaF95:AtLfpUPS7H7vWixH6NiHa4UqX12Lt1gPc4oN_9eUe6Y','2022-10-03 11:41:03.029770');
insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('juwr703ut8zqbjbahje0bf1ma1xdqzh2','.eJxVjEsOAiEQBe_C2hAQ6AaX7ucMhIbGGTWQzGdlvLtOMgvdvqp6LxHTto5xW3iOUxEX4cTpd6OUH9x2UO6p3brMva3zRHJX5EEXOfTCz-vh_h2MaRm_dSBQwJjd2WElNkFhVZ5Yk1dg0ADVErQrqIFCZVQmEBXnmRCsBSveH9wJN5Q:1oTGPG:lUhcbGTa3ufvH0t83Sb4snnZbts29pO9v-9k0ing4mI','2022-09-14 05:36:54.186951');
insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('kttirqll22tiue6dgjgmmc2zqlx170pq','.eJxVjEEOwiAQRe_C2pBKhym4dN8zEAYGqRpISrsy3l1JutDtf-_9l3B-37LbG69uieIitDj9buTDg0sH8e7LrcpQy7YuJLsiD9rkXCM_r4f7d5B9y71OEyaK42g1MXpgGAjshAbNmQdICpVGY7wCBWG0CAngy8ikSIBA4v0B2bM3Og:1oaEnU:ZfA5nzGHTrxLHSWhy2wk9_rpTjhFwAbYt5Q8gG0-wBc','2022-10-03 11:18:44.419297');
insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('nkla4kx3teit8r37x520kmztpcl81qq7','.eJxVjEsOAiEQBe_C2hAQ6AaX7ucMhIbGGTWQzGdlvLtOMgvdvqp6LxHTto5xW3iOUxEX4cTpd6OUH9x2UO6p3brMva3zRHJX5EEXOfTCz-vh_h2MaRm_dSBQwJjd2WElNkFhVZ5Yk1dg0ADVErQrqIFCZVQmEBXnmRCsBSveH9wJN5Q:1oaBhE:do3O_Q-zs-nOOLnpzg3TFDzo5vRmZjmaxBNIP1E9NOA','2022-10-03 08:00:04.563630');
insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('of8fkczig7weh1yofpzbrqt08i1g0kud','.eJxVjEsOAiEQBe_C2hAQ6AaX7ucMhIbGGTWQzGdlvLtOMgvdvqp6LxHTto5xW3iOUxEX4cTpd6OUH9x2UO6p3brMva3zRHJX5EEXOfTCz-vh_h2MaRm_dSBQwJjd2WElNkFhVZ5Yk1dg0ADVErQrqIFCZVQmEBXnmRCsBSveH9wJN5Q:1oaCAG:j6qpxzdfrREzIvG58xx6gItUru-v91ucMwYGAr5n6Cs','2022-10-03 08:30:04.172242');
insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('pkqxmcm5psi1pp5ccebplo2qbe0hoytm','.eJxVjEEOwiAQRe_C2pBKhym4dN8zEAYGqRpISrsy3l1JutDtf-_9l3B-37LbG69uieIitDj9buTDg0sH8e7LrcpQy7YuJLsiD9rkXCM_r4f7d5B9y71OEyaK42g1MXpgGAjshAbNmQdICpVGY7wCBWG0CAngy8ikSIBA4v0B2bM3Og:1oaF7V:YpiG4Ro5M2eQmxLdZKDTYiR6zkRhg9CZIWyf0Ny2ZR4','2022-10-03 11:39:25.021357');
insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('pyavj984i58au67rl4va06vnhbqo0q9g','.eJxVjEsOAiEQBe_C2hAQ6AaX7ucMhIbGGTWQzGdlvLtOMgvdvqp6LxHTto5xW3iOUxEX4cTpd6OUH9x2UO6p3brMva3zRHJX5EEXOfTCz-vh_h2MaRm_dSBQwJjd2WElNkFhVZ5Yk1dg0ADVErQrqIFCZVQmEBXnmRCsBSveH9wJN5Q:1oaBmu:7NPujYkTbto-_GDw7LmIcZSXuSTUBDUeWTtosa0jHUo','2022-10-03 08:05:56.371768');
insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('q2bdtzdmlw9ll437zurzjxioqrdtueuj','.eJxVjEsOAiEQBe_C2hAQ6AaX7ucMhIbGGTWQzGdlvLtOMgvdvqp6LxHTto5xW3iOUxEX4cTpd6OUH9x2UO6p3brMva3zRHJX5EEXOfTCz-vh_h2MaRm_dSBQwJjd2WElNkFhVZ5Yk1dg0ADVErQrqIFCZVQmEBXnmRCsBSveH9wJN5Q:1oTGT7:fHNpetJcYP5qCLRMx7iGSncy13FfXAM-yNb5bXzwlDk','2022-09-14 05:40:53.996002');
insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('qbcy5m676jyr06v7bxitdtdpyf9cncna','.eJxVjEsOwiAUAO_C2hCg_J5L9z0DeY-PVA1NSrsy3t2QdKHbmcm8WcBjr-HoeQtLYlfm2eWXEcZnbkOkB7b7yuPa9m0hPhJ-2s7nNeXX7Wz_BhV7HdvJJCjaeA85S6msQBQqCaOs1HYCktE5mcgI7ZUhIQUA2KKc1YUQHPt8AbERNmI:1oaFjy:oEyM74tOL4UkvwwEo2SlAgmQaNDpwlaYd9vgLCm90Co','2022-10-03 12:19:10.846373');
insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('qlnb9x6ro59vf54loimokob6qmmuvupu','.eJxVjEEOwiAQRe_C2pBKhym4dN8zEAYGqRpISrsy3l1JutDtf-_9l3B-37LbG69uieIitDj9buTDg0sH8e7LrcpQy7YuJLsiD9rkXCM_r4f7d5B9y71OEyaK42g1MXpgGAjshAbNmQdICpVGY7wCBWG0CAngy8ikSIBA4v0B2bM3Og:1oabV0:5fO-aURdULjEZ8ESxndG6nS3ojNfMb7BDJVdVT6Le70','2022-10-04 11:33:10.557049');
insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('qmo7e7ev8t0ugi8vzrgdyfmoe7qsq1pe','.eJxVjEEOwiAQRe_C2hCggQ4u3XsGMswMUjVtUtpV490NSRe6_e-9f6iE-1bT3mRNE6urcuryu2Wkl8wd8BPnx6Jpmbd1yror-qRN3xeW9-10_w4qttprAHIkFg04Fh5sDITBURg9WiJbMGeAAH4wA6PJKMGLKW6MsSADqc8X_l04vQ:1oMM74:M_jMorRazGWuPcEjktToMMrYBEJEwLJkLw7dR_lR9pw','2022-08-26 04:17:34.595750');
insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('quk46tz62c4x7tf72xw91a254vauovjc','.eJxVjEsOAiEQBe_C2hAQ6AaX7ucMhIbGGTWQzGdlvLtOMgvdvqp6LxHTto5xW3iOUxEX4cTpd6OUH9x2UO6p3brMva3zRHJX5EEXOfTCz-vh_h2MaRm_dSBQwJjd2WElNkFhVZ5Yk1dg0ADVErQrqIFCZVQmEBXnmRCsBSveH9wJN5Q:1oTGJ9:Ss1m08kVpI0qEglNdV-FGOksQIKZq6ETiYzJE-Xxnwo','2022-09-14 05:30:35.974977');
insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('rpez9si9f1pe9rji9bua79qm9wjz8ck3','.eJxVjEsOAiEQBe_C2hAQ6AaX7ucMhIbGGTWQzGdlvLtOMgvdvqp6LxHTto5xW3iOUxEX4cTpd6OUH9x2UO6p3brMva3zRHJX5EEXOfTCz-vh_h2MaRm_dSBQwJjd2WElNkFhVZ5Yk1dg0ADVErQrqIFCZVQmEBXnmRCsBSveH9wJN5Q:1oTJx4:xbte3GN5uKMM_aB80OLp75tqgE9DfKaz8wvNAlnNfLI','2022-09-14 09:24:02.099240');
insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('s1kwxe6j9pstp0f55j1am8p12bpj85x3','.eJxVjEsOAiEQBe_C2hAQ6AaX7ucMhIbGGTWQzGdlvLtOMgvdvqp6LxHTto5xW3iOUxEX4cTpd6OUH9x2UO6p3brMva3zRHJX5EEXOfTCz-vh_h2MaRm_dSBQwJjd2WElNkFhVZ5Yk1dg0ADVErQrqIFCZVQmEBXnmRCsBSveH9wJN5Q:1oZtPQ:XYIS1bCSNkc7jnqgmvsp-gueglKupc9pVTXSSaWXf5I','2022-10-02 12:28:28.646746');
insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('t1k10lkhl2sgczj02lq2ctbde165848j','.eJxVjEEOwiAQRe_C2hCggQ4u3XsGMswMUjVtUtpV490NSRe6_e-9f6iE-1bT3mRNE6urcuryu2Wkl8wd8BPnx6Jpmbd1yror-qRN3xeW9-10_w4qttprAHIkFg04Fh5sDITBURg9WiJbMGeAAH4wA6PJKMGLKW6MsSADqc8X_l04vQ:1oMROb:Z0FYYHSC_dVqMNTdRgczax0AFLtLXGetZ3gXrlrpN0s','2022-08-26 09:56:01.517886');
insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('t1l3zw027gns32vm80aclpoqnkvghfaz','.eJxVjEsOAiEQBe_C2hAQ6AaX7ucMhIbGGTWQzGdlvLtOMgvdvqp6LxHTto5xW3iOUxEX4cTpd6OUH9x2UO6p3brMva3zRHJX5EEXOfTCz-vh_h2MaRm_dSBQwJjd2WElNkFhVZ5Yk1dg0ADVErQrqIFCZVQmEBXnmRCsBSveH9wJN5Q:1oaCUr:6aaSO_-DY5vsR2BgcxZ88yYaww-ZuTY7Me4DkKmu90o','2022-10-03 08:51:21.945928');
insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('tot2uklqy30h0oq0bzpscscnlt46lfix','.eJxVjEsOAiEQBe_C2hAQ6AaX7ucMhIbGGTWQzGdlvLtOMgvdvqp6LxHTto5xW3iOUxEX4cTpd6OUH9x2UO6p3brMva3zRHJX5EEXOfTCz-vh_h2MaRm_dSBQwJjd2WElNkFhVZ5Yk1dg0ADVErQrqIFCZVQmEBXnmRCsBSveH9wJN5Q:1oZu1l:gEJ3TVRRhmKoc748ms6OwlPQarbl-zmak1LdP8ODDu8','2022-10-02 13:08:05.663623');
insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('u4w809y1h273eg96kx60jf0rjud1d04b','.eJxVjDkOwjAUBe_iGllx_L1R0nOG6C82DiBHylIh7g6RUkD7Zua91IDbWodtyfMwijqrqE6_GyE_ctuB3LHdJs1TW-eR9K7ogy76Okl-Xg7376DiUr91wew82xI7MLbvCwAJR5uRSwRilxhdIJMDEAqYBCEmYSrgU2ejF_X-AAPHOHY:1oZvNf:D0o8H4xmFW2eNZzB1eUnZKNxj_6_d-QFCqV1lEFv5bs','2022-10-02 14:34:47.898113');
insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('u57y0tsk9gcydni2ptxifuj28141kubd','.eJxVjEsOAiEQBe_C2hAQ6AaX7ucMhIbGGTWQzGdlvLtOMgvdvqp6LxHTto5xW3iOUxEX4cTpd6OUH9x2UO6p3brMva3zRHJX5EEXOfTCz-vh_h2MaRm_dSBQwJjd2WElNkFhVZ5Yk1dg0ADVErQrqIFCZVQmEBXnmRCsBSveH9wJN5Q:1oTGc7:The_3ScTLrUKBYrpG3atzfRQUXdQGEaVnw8XWUrYtmc','2022-09-14 05:50:11.334121');
insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('udpvur5r43pfchedqj456okazbflxdey','.eJxVjEsOAiEQBe_C2hAQ6AaX7ucMhIbGGTWQzGdlvLtOMgvdvqp6LxHTto5xW3iOUxEX4cTpd6OUH9x2UO6p3brMva3zRHJX5EEXOfTCz-vh_h2MaRm_dSBQwJjd2WElNkFhVZ5Yk1dg0ADVErQrqIFCZVQmEBXnmRCsBSveH9wJN5Q:1oaB7F:5KhhzzIGnzp9CNAo71LH5ioBnVLPuN4TvpM8lXVa7UE','2022-10-03 07:22:53.622242');
insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('uiwckmn40e9y7dfzw5auod6rp40sxqfd','.eJxVjDkOwjAUBe_iGllx_L1R0nOG6C82DiBHylIh7g6RUkD7Zua91IDbWodtyfMwijqrqE6_GyE_ctuB3LHdJs1TW-eR9K7ogy76Okl-Xg7376DiUr91wew82xI7MLbvCwAJR5uRSwRilxhdIJMDEAqYBCEmYSrgU2ejF_X-AAPHOHY:1oZvEd:x9zOKuLbJR7sgqbJFM-ffSfl84wto-peHaJEq8efskc','2022-10-02 14:25:27.176025');
insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('upas5z152uu1xuy25cbpr4pz4skpvho4','.eJxVjEEOwiAQRe_C2hCggQ4u3XsGMswMUjVtUtpV490NSRe6_e-9f6iE-1bT3mRNE6urcuryu2Wkl8wd8BPnx6Jpmbd1yror-qRN3xeW9-10_w4qttprAHIkFg04Fh5sDITBURg9WiJbMGeAAH4wA6PJKMGLKW6MsSADqc8X_l04vQ:1oNY2k:mj5QPIatIJpUrpNpGMPCyt8L8A8WwhLSrkvn-uQMHFI','2022-08-29 11:14:02.113744');
insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('w3182qa8rtoxpywea7kabh193gochqfo','.eJxVjEsOAiEQBe_C2hAQ6AaX7ucMhIbGGTWQzGdlvLtOMgvdvqp6LxHTto5xW3iOUxEX4cTpd6OUH9x2UO6p3brMva3zRHJX5EEXOfTCz-vh_h2MaRm_dSBQwJjd2WElNkFhVZ5Yk1dg0ADVErQrqIFCZVQmEBXnmRCsBSveH9wJN5Q:1oaCZ2:1vDx7PXwcjUJ4pFbPgbf1AqwAn_1zFEu3zlQj1YlJIU','2022-10-03 08:55:40.894928');
insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('w6jt9y49s3l12lax56zahltln7ufpdww','.eJxVjDsOwjAQBe_iGln-fyjpOYO1a29wANlSnFSIu0OkFNC-mXkvlmBba9oGLWku7MwkO_1uCPlBbQflDu3Wee5tXWbku8IPOvi1F3peDvfvoMKo31pYr8CQm7A4FC5i9EKSyphB6QgUlNGFcvDaWNJSGUQkkhCsjHHSgr0_6SU39w:1oGvmc:2WvoTieRDGyEQNFZXh_IV899Rt-tdtqg_EBMQOBT0bU','2022-08-11 05:10:02.698123');
insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('xlldh46tng9j45lxf3pkauza35ljnddp','.eJxVjEEOgjAQRe_StWmKpTPUpa5ZeQDSoVOpmpYAXRnvLiQscPve_-8jOleWoSszT1304iKMOB0Zuf7FaRP-6dIjyz6nZYokt4nc7Szb7Pl93bd_gcHNw_q2BAoYe3M2GIi1VRhUQ1xRo0CjBgreVsZjBWQDo9KWyJuGCaGuoV6jMY1laWO65RTWopLmAO9lHHf4_QEUQ0Rs:1oTgx2:wgEOcTc_5ATrRWrXNF9URy7eYyiZ1BBRuuRDyB-ofng','2022-09-15 09:57:32.487099');
insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('yawjia27rrpbw5g1q6v2ncwmi0bmkedp','.eJxVjEsOAiEQBe_C2hAQ6AaX7ucMhIbGGTWQzGdlvLtOMgvdvqp6LxHTto5xW3iOUxEX4cTpd6OUH9x2UO6p3brMva3zRHJX5EEXOfTCz-vh_h2MaRm_dSBQwJjd2WElNkFhVZ5Yk1dg0ADVErQrqIFCZVQmEBXnmRCsBSveH9wJN5Q:1oaCjU:m9kuK0m0fVkQrSz0TNfQY1O93LimmIfHseHg9jeIDuE','2022-10-03 09:06:28.471347');
insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('yo73gsxjly9ba98ti0d5wxfrhgprev90','.eJxVjEsOAiEQBe_C2hAQ6AaX7ucMhIbGGTWQzGdlvLtOMgvdvqp6LxHTto5xW3iOUxEX4cTpd6OUH9x2UO6p3brMva3zRHJX5EEXOfTCz-vh_h2MaRm_dSBQwJjd2WElNkFhVZ5Yk1dg0ADVErQrqIFCZVQmEBXnmRCsBSveH9wJN5Q:1oaBgB:Mmeexg2NyoMRvzbXxp-U-YE_V7fqkcOCS2fMa0FhBW8','2022-10-03 07:58:59.565862');
insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('yot9c5yi9bqbh3tandc9an4r66a26xzi','.eJxVjEsOAiEQBe_C2hAQ6AaX7ucMhIbGGTWQzGdlvLtOMgvdvqp6LxHTto5xW3iOUxEX4cTpd6OUH9x2UO6p3brMva3zRHJX5EEXOfTCz-vh_h2MaRm_dSBQwJjd2WElNkFhVZ5Yk1dg0ADVErQrqIFCZVQmEBXnmRCsBSveH9wJN5Q:1oaCEC:bPd2o7UERiY5V8yXMZPnvEmFobRHEfFRDf80Ji--WcY','2022-10-03 08:34:08.027889');
insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('z3l99rdtisl01v17yf87c7e2bqjiv8sv','.eJxVjEsOAiEQBe_C2hAQ6AaX7ucMhIbGGTWQzGdlvLtOMgvdvqp6LxHTto5xW3iOUxEX4cTpd6OUH9x2UO6p3brMva3zRHJX5EEXOfTCz-vh_h2MaRm_dSBQwJjd2WElNkFhVZ5Yk1dg0ADVErQrqIFCZVQmEBXnmRCsBSveH9wJN5Q:1oTJjG:qmiVv3zX1A6Eunj0Ro9OS4aTsxKbxElYLMvPb_CqT9M','2022-09-14 09:09:46.085704');

UNLOCK TABLES;

/*Table structure for table `tb_barang` */

DROP TABLE IF EXISTS `tb_barang`;

CREATE TABLE `tb_barang` (
  `id_barang` int(11) NOT NULL AUTO_INCREMENT,
  `nama_barang` varchar(255) DEFAULT NULL,
  `jenis_barang` varchar(255) DEFAULT NULL,
  `kategori_barang` varchar(255) DEFAULT NULL,
  `harga_barang` int(11) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_barang`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `tb_barang` */

LOCK TABLES `tb_barang` WRITE;

insert  into `tb_barang`(`id_barang`,`nama_barang`,`jenis_barang`,`kategori_barang`,`harga_barang`,`admin_id`) values (1,'eggs','jenisbarang1','kategoribarang1',100000,2);
insert  into `tb_barang`(`id_barang`,`nama_barang`,`jenis_barang`,`kategori_barang`,`harga_barang`,`admin_id`) values (2,'bacon','jenisbarang2','kategoribarang2',200000,2);
insert  into `tb_barang`(`id_barang`,`nama_barang`,`jenis_barang`,`kategori_barang`,`harga_barang`,`admin_id`) values (3,'soap','jenisbarang3','kategoribarang3',300000,2);
insert  into `tb_barang`(`id_barang`,`nama_barang`,`jenis_barang`,`kategori_barang`,`harga_barang`,`admin_id`) values (4,'apple','jenisbarang4','kategoribarang4',400000,2);
insert  into `tb_barang`(`id_barang`,`nama_barang`,`jenis_barang`,`kategori_barang`,`harga_barang`,`admin_id`) values (5,'banana','jenisbarang5','kategoribarang5',500000,2);

UNLOCK TABLES;

/*Table structure for table `tb_pelanggan` */

DROP TABLE IF EXISTS `tb_pelanggan`;

CREATE TABLE `tb_pelanggan` (
  `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT,
  `nama_pelanggan` varchar(255) DEFAULT NULL,
  `gender_pelanggan` varchar(255) DEFAULT NULL,
  `alamat_pelanggan` varchar(255) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_pelanggan`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `tb_pelanggan` */

LOCK TABLES `tb_pelanggan` WRITE;

insert  into `tb_pelanggan`(`id_pelanggan`,`nama_pelanggan`,`gender_pelanggan`,`alamat_pelanggan`,`admin_id`) values (1,'pelanggan1','L','kerobokan',2);
insert  into `tb_pelanggan`(`id_pelanggan`,`nama_pelanggan`,`gender_pelanggan`,`alamat_pelanggan`,`admin_id`) values (2,'pelanggan2','P','canggu',2);
insert  into `tb_pelanggan`(`id_pelanggan`,`nama_pelanggan`,`gender_pelanggan`,`alamat_pelanggan`,`admin_id`) values (3,'pelanggan3','L','kuta',2);

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
  `admin_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_pembelian`),
  KEY `id_barang` (`id_barang`),
  KEY `id_supplier` (`id_supplier`),
  CONSTRAINT `tb_pembelian_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `tb_barang` (`id_barang`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `tb_pembelian_ibfk_2` FOREIGN KEY (`id_supplier`) REFERENCES `tb_supplier` (`id_supplier`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `tb_pembelian` */

LOCK TABLES `tb_pembelian` WRITE;

insert  into `tb_pembelian`(`id_pembelian`,`id_barang`,`id_supplier`,`jumlah_barang_pembelian`,`total`,`created_at`,`expired_at`,`status_expired`,`admin_id`) values (1,1,1,10,1000000,'2022-08-25 15:40:00','2023-08-25 15:40:00',NULL,2);
insert  into `tb_pembelian`(`id_pembelian`,`id_barang`,`id_supplier`,`jumlah_barang_pembelian`,`total`,`created_at`,`expired_at`,`status_expired`,`admin_id`) values (2,2,2,20,4000000,'2022-08-25 15:40:00','2023-08-25 15:40:00',NULL,2);
insert  into `tb_pembelian`(`id_pembelian`,`id_barang`,`id_supplier`,`jumlah_barang_pembelian`,`total`,`created_at`,`expired_at`,`status_expired`,`admin_id`) values (3,3,3,30,9000000,'2022-08-25 15:41:00','2023-08-25 15:41:00',NULL,2);
insert  into `tb_pembelian`(`id_pembelian`,`id_barang`,`id_supplier`,`jumlah_barang_pembelian`,`total`,`created_at`,`expired_at`,`status_expired`,`admin_id`) values (4,4,4,40,16000000,'2022-08-25 15:41:00','2023-08-25 15:41:00',NULL,2);
insert  into `tb_pembelian`(`id_pembelian`,`id_barang`,`id_supplier`,`jumlah_barang_pembelian`,`total`,`created_at`,`expired_at`,`status_expired`,`admin_id`) values (5,5,5,50,25000000,'2022-08-25 15:42:00','2023-08-25 15:42:00',NULL,2);

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
  `admin_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_penjualan`),
  KEY `tb_penjualan_ibfk_2` (`id_pelanggan`),
  KEY `id_barang` (`id_barang`),
  CONSTRAINT `tb_penjualan_ibfk_2` FOREIGN KEY (`id_pelanggan`) REFERENCES `tb_pelanggan` (`id_pelanggan`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `tb_penjualan_ibfk_3` FOREIGN KEY (`id_barang`) REFERENCES `tb_barang` (`id_barang`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `tb_penjualan` */

LOCK TABLES `tb_penjualan` WRITE;

insert  into `tb_penjualan`(`id_penjualan`,`id_transaksi`,`id_barang`,`id_pelanggan`,`jumlah_barang`,`total`,`created_at`,`admin_id`) values (1,'trnsk_1',1,1,1,100000,'2022-08-25 15:44:00',2);
insert  into `tb_penjualan`(`id_penjualan`,`id_transaksi`,`id_barang`,`id_pelanggan`,`jumlah_barang`,`total`,`created_at`,`admin_id`) values (2,'trnsk_1',2,1,5,200000,'2022-08-25 15:44:00',2);
insert  into `tb_penjualan`(`id_penjualan`,`id_transaksi`,`id_barang`,`id_pelanggan`,`jumlah_barang`,`total`,`created_at`,`admin_id`) values (3,'trnsk_1',3,1,4,300000,'2022-08-25 15:45:00',2);
insert  into `tb_penjualan`(`id_penjualan`,`id_transaksi`,`id_barang`,`id_pelanggan`,`jumlah_barang`,`total`,`created_at`,`admin_id`) values (4,'trnsk_2',1,2,7,100000,'2022-08-25 15:45:00',2);
insert  into `tb_penjualan`(`id_penjualan`,`id_transaksi`,`id_barang`,`id_pelanggan`,`jumlah_barang`,`total`,`created_at`,`admin_id`) values (5,'trnsk_2',2,2,9,200000,'2022-08-25 15:45:00',2);
insert  into `tb_penjualan`(`id_penjualan`,`id_transaksi`,`id_barang`,`id_pelanggan`,`jumlah_barang`,`total`,`created_at`,`admin_id`) values (6,'trnsk_2',4,2,10,400000,'2022-08-25 15:46:00',2);
insert  into `tb_penjualan`(`id_penjualan`,`id_transaksi`,`id_barang`,`id_pelanggan`,`jumlah_barang`,`total`,`created_at`,`admin_id`) values (7,'trnsk_3',3,3,50,300000,'2022-08-25 15:46:00',2);
insert  into `tb_penjualan`(`id_penjualan`,`id_transaksi`,`id_barang`,`id_pelanggan`,`jumlah_barang`,`total`,`created_at`,`admin_id`) values (8,'trnsk_3',2,3,85,200000,'2022-08-25 15:47:00',2);
insert  into `tb_penjualan`(`id_penjualan`,`id_transaksi`,`id_barang`,`id_pelanggan`,`jumlah_barang`,`total`,`created_at`,`admin_id`) values (9,'trnsk_3',4,3,90,500000,'2022-08-25 15:47:00',2);

UNLOCK TABLES;

/*Table structure for table `tb_supplier` */

DROP TABLE IF EXISTS `tb_supplier`;

CREATE TABLE `tb_supplier` (
  `id_supplier` int(11) NOT NULL AUTO_INCREMENT,
  `nama_supplier` varchar(255) DEFAULT NULL,
  `jenis_supplier` varchar(255) DEFAULT NULL,
  `alamat_supplier` varchar(255) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_supplier`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `tb_supplier` */

LOCK TABLES `tb_supplier` WRITE;

insert  into `tb_supplier`(`id_supplier`,`nama_supplier`,`jenis_supplier`,`alamat_supplier`,`admin_id`) values (1,'supplier1','jenissupplier1','alamatsupplier1',2);
insert  into `tb_supplier`(`id_supplier`,`nama_supplier`,`jenis_supplier`,`alamat_supplier`,`admin_id`) values (2,'supplier2','jenissupplier2','alamatsupplier2',2);
insert  into `tb_supplier`(`id_supplier`,`nama_supplier`,`jenis_supplier`,`alamat_supplier`,`admin_id`) values (3,'supplier3','jenissupplier3','alamatsupplier3',2);
insert  into `tb_supplier`(`id_supplier`,`nama_supplier`,`jenis_supplier`,`alamat_supplier`,`admin_id`) values (4,'supplier4','jenissupplier4','alamatsupplier4',2);
insert  into `tb_supplier`(`id_supplier`,`nama_supplier`,`jenis_supplier`,`alamat_supplier`,`admin_id`) values (5,'supplier5','jenissupplier5','alamatsupplier5',2);

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
