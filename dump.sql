-- MySQL dump 10.13  Distrib 5.5.40, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: recipes
-- ------------------------------------------------------
-- Server version	5.5.40-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account_emailaddress`
--

DROP TABLE IF EXISTS `account_emailaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_emailaddress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `email` varchar(75) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `account_emailaddress_6340c63c` (`user_id`),
  CONSTRAINT `user_id_refs_id_4aacde5e` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_emailaddress`
--

LOCK TABLES `account_emailaddress` WRITE;
/*!40000 ALTER TABLE `account_emailaddress` DISABLE KEYS */;
INSERT INTO `account_emailaddress` VALUES (3,6,'tavotevs@gmail.com',0,1),(4,7,'karolis@gmail.com',0,1),(5,8,'nesamone@gmail.com',0,1),(6,9,'gretaduxe@gmail.com',0,1),(7,10,'wtf@wtf.com',0,1);
/*!40000 ALTER TABLE `account_emailaddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_emailconfirmation`
--

DROP TABLE IF EXISTS `account_emailconfirmation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_emailconfirmation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email_address_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `sent` datetime DEFAULT NULL,
  `key` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`),
  KEY `account_emailconfirmation_a659cab3` (`email_address_id`),
  CONSTRAINT `email_address_id_refs_id_6ea1eea3` FOREIGN KEY (`email_address_id`) REFERENCES `account_emailaddress` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_emailconfirmation`
--

LOCK TABLES `account_emailconfirmation` WRITE;
/*!40000 ALTER TABLE `account_emailconfirmation` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_emailconfirmation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_5f412f9a` (`group_id`),
  KEY `auth_group_permissions_83d7f98b` (`permission_id`),
  CONSTRAINT `group_id_refs_id_f4b32aac` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `permission_id_refs_id_6ba0f519` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_37ef4eb4` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_d043b34a` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add site',1,'add_site'),(2,'Can change site',1,'change_site'),(3,'Can delete site',1,'delete_site'),(4,'Can add email address',2,'add_emailaddress'),(5,'Can change email address',2,'change_emailaddress'),(6,'Can delete email address',2,'delete_emailaddress'),(7,'Can add email confirmation',3,'add_emailconfirmation'),(8,'Can change email confirmation',3,'change_emailconfirmation'),(9,'Can delete email confirmation',3,'delete_emailconfirmation'),(10,'Can add log entry',4,'add_logentry'),(11,'Can change log entry',4,'change_logentry'),(12,'Can delete log entry',4,'delete_logentry'),(13,'Can add permission',5,'add_permission'),(14,'Can change permission',5,'change_permission'),(15,'Can delete permission',5,'delete_permission'),(16,'Can add group',6,'add_group'),(17,'Can change group',6,'change_group'),(18,'Can delete group',6,'delete_group'),(19,'Can add user',7,'add_user'),(20,'Can change user',7,'change_user'),(21,'Can delete user',7,'delete_user'),(22,'Can add content type',8,'add_contenttype'),(23,'Can change content type',8,'change_contenttype'),(24,'Can delete content type',8,'delete_contenttype'),(25,'Can add session',9,'add_session'),(26,'Can change session',9,'change_session'),(27,'Can delete session',9,'delete_session'),(28,'Can add migration history',10,'add_migrationhistory'),(29,'Can change migration history',10,'change_migrationhistory'),(30,'Can delete migration history',10,'delete_migrationhistory'),(31,'Can add social application',11,'add_socialapp'),(32,'Can change social application',11,'change_socialapp'),(33,'Can delete social application',11,'delete_socialapp'),(34,'Can add social account',12,'add_socialaccount'),(35,'Can change social account',12,'change_socialaccount'),(36,'Can delete social account',12,'delete_socialaccount'),(37,'Can add social application token',13,'add_socialtoken'),(38,'Can change social application token',13,'change_socialtoken'),(39,'Can delete social application token',13,'delete_socialtoken'),(43,'Can add recipe',15,'add_recipe'),(44,'Can change recipe',15,'change_recipe'),(45,'Can delete recipe',15,'delete_recipe'),(55,'Can add measurement',19,'add_measurement'),(56,'Can change measurement',19,'change_measurement'),(57,'Can delete measurement',19,'delete_measurement'),(58,'Can add product',20,'add_product'),(59,'Can change product',20,'change_product'),(60,'Can delete product',20,'delete_product'),(61,'Can add product measurement',21,'add_productmeasurement'),(62,'Can change product measurement',21,'change_productmeasurement'),(63,'Can delete product measurement',21,'delete_productmeasurement'),(64,'Can add kv store',22,'add_kvstore'),(65,'Can change kv store',22,'change_kvstore'),(66,'Can delete kv store',22,'delete_kvstore'),(67,'Can add fridge',23,'add_fridge'),(68,'Can change fridge',23,'change_fridge'),(69,'Can delete fridge',23,'delete_fridge'),(70,'Can add ingridient',24,'add_ingridient'),(71,'Can change ingridient',24,'change_ingridient'),(72,'Can delete ingridient',24,'delete_ingridient'),(73,'Can add menu',25,'add_menu'),(74,'Can change menu',25,'change_menu'),(75,'Can delete menu',25,'delete_menu'),(76,'Can add rating',26,'add_rating'),(77,'Can change rating',26,'change_rating'),(78,'Can delete rating',26,'delete_rating'),(79,'Can add menu item',27,'add_menuitem'),(80,'Can change menu item',27,'change_menuitem'),(81,'Can delete menu item',27,'delete_menuitem'),(82,'Can add account',28,'add_account'),(83,'Can change account',28,'change_account'),(84,'Can delete account',28,'delete_account'),(85,'Can add t shirt',29,'add_tshirt'),(86,'Can change t shirt',29,'change_tshirt'),(87,'Can delete t shirt',29,'delete_tshirt'),(88,'Can add output files',30,'add_outputfiles'),(89,'Can change output files',30,'change_outputfiles'),(90,'Can delete output files',30,'delete_outputfiles'),(91,'Can add tag',31,'add_tag'),(92,'Can change tag',31,'change_tag'),(93,'Can delete tag',31,'delete_tag'),(94,'Can add barcode',32,'add_barcode'),(95,'Can change barcode',32,'change_barcode'),(96,'Can delete barcode',32,'delete_barcode'),(97,'Can add barcode file',33,'add_barcodefile'),(98,'Can change barcode file',33,'change_barcodefile'),(99,'Can delete barcode file',33,'delete_barcodefile');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (5,'pbkdf2_sha256$12000$7Fc55wXCDOVd$dnEAB8xRv3+8syIbKjDAmtx19DdN+s/FvqZ5H6+9Q8Y=','2015-01-05 18:08:36',1,'marijus','','','marijus.merkevicius@gmail.com',1,1,'2014-12-05 12:22:27'),(6,'pbkdf2_sha256$12000$T6cMowHKIULv$QX4cgjO+hmbbqkLiWb0A1ppYLtriROOOopl9/AmXbKE=','2014-12-05 12:25:16',0,'gaidys','','','tavotevs@gmail.com',0,1,'2014-12-05 12:25:15'),(7,'pbkdf2_sha256$12000$t4l9Yj909if2$eSaDGB/9WyfnLalvKVO5ut6LwozU60o7PhCUrcdcR2M=','2014-12-05 13:51:37',0,'karolis','','','karolis@gmail.com',0,1,'2014-12-05 13:51:37'),(8,'pbkdf2_sha256$12000$gutiGPTDZyZF$ncgolAGoScqp0C1WyTVX5WDMNWeCUJsnbOyY/+O/ywg=','2014-12-05 13:53:14',0,'nesamone','','','nesamone@gmail.com',0,1,'2014-12-05 13:53:13'),(9,'pbkdf2_sha256$12000$zwcFuO5bt5YA$cIuPYk8jDBksPrI6SFe19iujxzv/NURWj0qul0IgDM0=','2014-12-07 13:53:29',0,'greta','','','gretaduxe@gmail.com',0,1,'2014-12-07 13:53:15'),(10,'pbkdf2_sha256$12000$18JYUNJ6vIpZ$s3AZoForOP8hJnkORa2i52XzQxzfAsXZaLiil10PJL4=','2014-12-17 03:37:15',0,'wtf','','','wtf@wtf.com',0,1,'2014-12-17 03:37:14');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_6340c63c` (`user_id`),
  KEY `auth_user_groups_5f412f9a` (`group_id`),
  CONSTRAINT `group_id_refs_id_274b862c` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `user_id_refs_id_40c41112` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_6340c63c` (`user_id`),
  KEY `auth_user_user_permissions_83d7f98b` (`permission_id`),
  CONSTRAINT `permission_id_refs_id_35d9ac25` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `user_id_refs_id_4dc23c39` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_6340c63c` (`user_id`),
  KEY `django_admin_log_37ef4eb4` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_93d2d1f8` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `user_id_refs_id_c0d12874` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (3,'2014-12-07 15:18:52',5,20,'1','Miltai',2,'Changed photo.'),(4,'2014-12-07 19:40:15',5,20,'4','another tet',3,''),(5,'2014-12-07 19:40:15',5,20,'3','hahaha',3,''),(6,'2014-12-07 19:40:15',5,20,'2','te',3,''),(7,'2014-12-07 19:40:15',5,20,'1','Miltai',3,''),(8,'2014-12-09 16:25:05',5,20,'10','test',3,''),(9,'2014-12-09 16:25:05',5,20,'9','test',3,''),(10,'2014-12-09 16:25:05',5,20,'8','test',3,''),(11,'2014-12-09 16:25:05',5,20,'7','test',3,''),(12,'2014-12-09 16:25:05',5,20,'6','test',3,''),(13,'2014-12-09 16:25:06',5,20,'5','test',3,''),(14,'2014-12-09 16:25:27',5,20,'11','Kiaušiniai',2,'Changed title and description.'),(15,'2014-12-09 16:26:07',5,20,'12','Pomidorai',2,'Changed title and description.'),(16,'2014-12-09 18:17:30',5,20,'14','Agurkai',2,'Changed description.'),(17,'2014-12-09 18:18:56',5,20,'29','Burokeliai',2,'Changed description.'),(18,'2014-12-09 18:33:44',5,20,'14','Agurkai',2,'Changed description.'),(20,'2014-12-12 04:12:02',5,15,'3','gaidy nx',3,''),(21,'2014-12-12 04:12:03',5,15,'2','test',3,''),(22,'2014-12-12 04:12:03',5,15,'1','sadsa',3,''),(23,'2014-12-12 07:12:08',5,15,'9','Kiausiniene',3,''),(24,'2014-12-12 07:12:08',5,15,'8','adasdsadasasdasd',3,''),(25,'2014-12-12 07:12:08',5,15,'7','adasdsadasasdasd',3,''),(26,'2014-12-12 07:12:08',5,15,'6','ahah',3,''),(27,'2014-12-12 07:12:08',5,15,'5','testuou',3,''),(28,'2014-12-12 07:12:09',5,15,'4','nu ar veiks gaidy ?',3,''),(29,'2014-12-12 07:34:27',5,15,'23','asdasd',3,''),(30,'2014-12-12 07:34:27',5,15,'13','asdasd',3,''),(31,'2014-12-12 07:34:28',5,15,'10','asdasd',3,''),(32,'2014-12-12 12:37:11',5,15,'24','test',2,'Changed photo2 and photo3.'),(33,'2014-12-13 23:53:43',5,20,'30','Kiaušiniene',1,''),(34,'2014-12-14 01:13:40',5,15,'24','testasdas',2,'Changed title.'),(35,'2014-12-14 01:14:03',5,15,'24','Kiausiniene',2,'Changed title and description.'),(36,'2014-12-14 22:36:05',5,15,'24','Kiausiniene',3,''),(37,'2014-12-16 02:16:40',5,15,'25','Vieno kasnio sumustiniai',2,'Changed photo2 and photo3.'),(38,'2014-12-17 04:09:58',5,20,'12','Pomidorai',2,'Changed description.'),(39,'2014-12-18 15:04:46',5,15,'31','Lietiniai blynai',3,''),(40,'2014-12-18 15:04:46',5,15,'30','Sriuba',3,''),(41,'2014-12-18 15:04:47',5,15,'29','Avizine kose',3,''),(42,'2014-12-18 15:04:47',5,15,'28','Virti kiausiniai su majonezu',3,''),(43,'2014-12-18 15:04:47',5,15,'25','Vieno kasnio sumustiniai',3,''),(44,'2014-12-18 15:42:18',5,15,'1','radasda',3,'');
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'site','sites','site'),(2,'email address','account','emailaddress'),(3,'email confirmation','account','emailconfirmation'),(4,'log entry','admin','logentry'),(5,'permission','auth','permission'),(6,'group','auth','group'),(7,'user','auth','user'),(8,'content type','contenttypes','contenttype'),(9,'session','sessions','session'),(10,'migration history','south','migrationhistory'),(11,'social application','socialaccount','socialapp'),(12,'social account','socialaccount','socialaccount'),(13,'social application token','socialaccount','socialtoken'),(15,'recipe','recipes','recipe'),(19,'measurement','recipes','measurement'),(20,'product','recipes','product'),(21,'product measurement','recipes','productmeasurement'),(22,'kv store','thumbnail','kvstore'),(23,'fridge','recipes','fridge'),(24,'ingridient','recipes','ingridient'),(25,'menu','recipes','menu'),(26,'rating','recipes','rating'),(27,'menu item','recipes','menuitem'),(28,'account','tshirts','account'),(29,'t shirt','tshirts','tshirt'),(30,'output files','tshirts','outputfiles'),(31,'tag','tshirts','tag'),(32,'barcode','tshirts','barcode'),(33,'barcode file','tshirts','barcodefile');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_b7b81f0c` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('02oqjj3inl8exft4iwsp0ecjods1w7al','ZjUwMDk0YTY2NDJiODMzOWE2OTcxYWU2NTBjYmI0ZDc3ZDQwMjc4Zjp7fQ==','2014-12-19 12:28:30'),('a781mmuc297i5698zeagpp9eek99ir30','YjVkMjBhMDE5YWM0OTBkYjQ4OTBiNGNlNDE5MDg0ZmIxMWYxZTljNzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NX0=','2015-01-06 05:23:04'),('eotor74r7fwtntf8kadhjykvqymlzmaq','YzU2ZTMwOGQ2ZGE0ZTY1ZmI5MjE1MWE3ZmVkMmZmOTg0YTBjYjY4YTp7Il9zZXNzaW9uX2V4cGlyeSI6MTgxNDQwMCwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjo1fQ==','2015-01-09 05:46:11'),('f6s4hke1xht5bbdc1yn22jvjrc5pcuha','YzU2ZTMwOGQ2ZGE0ZTY1ZmI5MjE1MWE3ZmVkMmZmOTg0YTBjYjY4YTp7Il9zZXNzaW9uX2V4cGlyeSI6MTgxNDQwMCwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjo1fQ==','2015-01-26 18:08:37'),('heuy0lbimwt1t1j7moib47j2oqjnlfe1','OTAzZTlkMWMyOGIzMmE0N2E3MTI5M2QwMTI4ZGVmZGIyZTgzNTRmMTp7Il9hdXRoX3VzZXJfaWQiOjUsIl9tZXNzYWdlcyI6IltbXCJfX2pzb25fbWVzc2FnZVwiLDAsMjUsXCJZb3UgaGF2ZSBzaWduZWQgb3V0LlwiXSxbXCJfX2pzb25fbWVzc2FnZVwiLDAsMjUsXCJTdWNjZXNzZnVsbHkgc2lnbmVkIGluIGFzIG1hcmlqdXMuXCJdLFtcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcIlN1Y2Nlc3NmdWxseSBkZWxldGVkIDQgcHJvZHVjdHMuXCJdLFtcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcIlN1Y2Nlc3NmdWxseSBkZWxldGVkIDYgcHJvZHVjdHMuXCJdLFtcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcIlRoZSBwcm9kdWN0IFxcXCJLaWF1XFx1MDE2MWluaWFpXFxcIiB3YXMgY2hhbmdlZCBzdWNjZXNzZnVsbHkuXCJdLFtcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcIlRoZSBwcm9kdWN0IFxcXCJQb21pZG9yYWlcXFwiIHdhcyBjaGFuZ2VkIHN1Y2Nlc3NmdWxseS5cIl0sW1wiX19qc29uX21lc3NhZ2VcIiwwLDI1LFwiVGhlIHByb2R1Y3QgXFxcIkFndXJrYWlcXFwiIHdhcyBjaGFuZ2VkIHN1Y2Nlc3NmdWxseS5cIl0sW1wiX19qc29uX21lc3NhZ2VcIiwwLDI1LFwiVGhlIHByb2R1Y3QgXFxcIkJ1cm9rZWxpYWlcXFwiIHdhcyBjaGFuZ2VkIHN1Y2Nlc3NmdWxseS5cIl0sW1wiX19qc29uX21lc3NhZ2VcIiwwLDI1LFwiVGhlIHByb2R1Y3QgXFxcIkFndXJrYWlcXFwiIHdhcyBjaGFuZ2VkIHN1Y2Nlc3NmdWxseS5cIl1dIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfc2Vzc2lvbl9leHBpcnkiOjB9','2014-12-23 18:33:45'),('i9gjizor57ojyz9tpxj61xghgvfcyorz','ZjUwMDk0YTY2NDJiODMzOWE2OTcxYWU2NTBjYmI0ZDc3ZDQwMjc4Zjp7fQ==','2014-12-31 02:51:11'),('tbvcolsffq6rrp8zuzzof338xeqgvj1l','ZjUwMDk0YTY2NDJiODMzOWE2OTcxYWU2NTBjYmI0ZDc3ZDQwMjc4Zjp7fQ==','2015-01-01 11:59:44');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'example.com','example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipes_fridge`
--

DROP TABLE IF EXISTS `recipes_fridge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipes_fridge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `recipes_fridge_6340c63c` (`user_id`),
  CONSTRAINT `user_id_refs_id_127e2ebe` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipes_fridge`
--

LOCK TABLES `recipes_fridge` WRITE;
/*!40000 ALTER TABLE `recipes_fridge` DISABLE KEYS */;
INSERT INTO `recipes_fridge` VALUES (1,5),(2,6),(3,7),(4,8),(5,9),(6,10);
/*!40000 ALTER TABLE `recipes_fridge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipes_fridge_products`
--

DROP TABLE IF EXISTS `recipes_fridge_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipes_fridge_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fridge_id` int(11) NOT NULL,
  `productmeasurement_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `recipes_fridge_products_fridge_id_7f4a55816074d5e1_uniq` (`fridge_id`,`productmeasurement_id`),
  KEY `recipes_fridge_products_5b09db49` (`fridge_id`),
  KEY `recipes_fridge_products_28cae2fa` (`productmeasurement_id`),
  CONSTRAINT `fridge_id_refs_id_862fb592` FOREIGN KEY (`fridge_id`) REFERENCES `recipes_fridge` (`id`),
  CONSTRAINT `productmeasurement_id_refs_id_a9d3dde5` FOREIGN KEY (`productmeasurement_id`) REFERENCES `recipes_productmeasurement` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipes_fridge_products`
--

LOCK TABLES `recipes_fridge_products` WRITE;
/*!40000 ALTER TABLE `recipes_fridge_products` DISABLE KEYS */;
INSERT INTO `recipes_fridge_products` VALUES (16,1,16),(18,1,18),(19,1,19),(21,1,21);
/*!40000 ALTER TABLE `recipes_fridge_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipes_ingridient`
--

DROP TABLE IF EXISTS `recipes_ingridient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipes_ingridient` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `measurement_id` int(11) NOT NULL,
  `value` double NOT NULL,
  `recipe_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `recipes_ingridient_7f1b40ad` (`product_id`),
  KEY `recipes_ingridient_a25c0389` (`measurement_id`),
  KEY `recipes_ingridient_fba12377` (`recipe_id`),
  CONSTRAINT `measurement_id_refs_id_2e82d956` FOREIGN KEY (`measurement_id`) REFERENCES `recipes_measurement` (`id`),
  CONSTRAINT `product_id_refs_id_8a045d8a` FOREIGN KEY (`product_id`) REFERENCES `recipes_product` (`id`),
  CONSTRAINT `recipe_id_refs_id_49812994` FOREIGN KEY (`recipe_id`) REFERENCES `recipes_recipe` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipes_ingridient`
--

LOCK TABLES `recipes_ingridient` WRITE;
/*!40000 ALTER TABLE `recipes_ingridient` DISABLE KEYS */;
INSERT INTO `recipes_ingridient` VALUES (2,11,2,2,2),(3,11,2,1,3),(4,11,2,1,4),(5,27,1,0.5,4),(6,17,2,1,5),(7,11,2,2,5),(8,24,2,2,5),(9,28,2,0.5,6),(10,21,2,1,6),(11,14,3,500,6);
/*!40000 ALTER TABLE `recipes_ingridient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipes_measurement`
--

DROP TABLE IF EXISTS `recipes_measurement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipes_measurement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 NOT NULL,
  `short_title` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipes_measurement`
--

LOCK TABLES `recipes_measurement` WRITE;
/*!40000 ALTER TABLE `recipes_measurement` DISABLE KEYS */;
INSERT INTO `recipes_measurement` VALUES (1,'Kilogramai','kg'),(2,'Vienetai','vnt'),(3,'Gramai','gr');
/*!40000 ALTER TABLE `recipes_measurement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipes_menu`
--

DROP TABLE IF EXISTS `recipes_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipes_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `recipes_menu_6340c63c` (`user_id`),
  CONSTRAINT `user_id_refs_id_d0b6f22e` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipes_menu`
--

LOCK TABLES `recipes_menu` WRITE;
/*!40000 ALTER TABLE `recipes_menu` DISABLE KEYS */;
INSERT INTO `recipes_menu` VALUES (1,5),(2,6),(3,7),(4,8),(5,9),(6,10);
/*!40000 ALTER TABLE `recipes_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipes_menuitem`
--

DROP TABLE IF EXISTS `recipes_menuitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipes_menuitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `recipe_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `portions` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `recipes_menuitem_fba12377` (`recipe_id`),
  KEY `recipes_menuitem_08fd5523` (`menu_id`),
  CONSTRAINT `menu_id_refs_id_4aae7cd6` FOREIGN KEY (`menu_id`) REFERENCES `recipes_menu` (`id`),
  CONSTRAINT `recipe_id_refs_id_8117c548` FOREIGN KEY (`recipe_id`) REFERENCES `recipes_recipe` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipes_menuitem`
--

LOCK TABLES `recipes_menuitem` WRITE;
/*!40000 ALTER TABLE `recipes_menuitem` DISABLE KEYS */;
INSERT INTO `recipes_menuitem` VALUES (4,2,1,'2014-12-19',4),(5,3,1,'2014-12-18',2),(6,5,1,'2014-12-30',2),(7,4,1,'2014-12-23',1);
/*!40000 ALTER TABLE `recipes_menuitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipes_product`
--

DROP TABLE IF EXISTS `recipes_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipes_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 NOT NULL,
  `photo` varchar(100),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipes_product`
--

LOCK TABLES `recipes_product` WRITE;
/*!40000 ALTER TABLE `recipes_product` DISABLE KEYS */;
INSERT INTO `recipes_product` VALUES (11,'Kiaušiniai','Juos deda vištos','products/Zadama-kad-kiausiniai-pries-Velykas-nebrangs_articlethumb580.jpg'),(12,'Pomidorai','Sveiki ir sultingiSveiki ir sultingiSveiki ir sultingiSveiki ir sultingiSveiki ir sultingiSveiki ir sultingiSveiki ir sultingi','products/Bright_red_tomato_and_cross_section02.jpg'),(14,'Agurkai','Zole, bet ne zole, su ','products/agurkai_1.jpg'),(17,'Svogunas','Dailus ir sveikas','products/svogunas_2.jpg'),(18,'Pekino kopustas','Traskus ir zali','products/Pekino_kopustai_Sprinkin.jpg'),(19,'Paprika','Geltona, raudona ar zalia','products/pic_peppers1.jpg'),(20,'Prieskoniai','Ivairus prieskoniai','products/Peppercorns1.JPG'),(21,'Morkos','Sviezios, tik is mociutes darzo!','products/Carrot1.jpg'),(22,'Bulves','ka tik po bulviakasio','products/article-2389853-0B262DC000000578-428_634x351.jpg'),(23,'Cesnakas','cesnis','products/Cesnakas-e1352281677922-300x214.jpg'),(24,'Brokolis','mmm, mano megstamiausias','products/Broccoli.jpg'),(25,'Baklazanas','Visai kaip melyne po bomzo akim','products/Baklazanai_Eggplanat-297x300.jpg'),(26,'Kiauliena','fu','products/ebd8a7832e366facdc471f89490079d8.jpg'),(27,'Farsas','Nesvarbu, kokia gyvuno, svarbu mesa','products/557_ee22d897ec9a9b4493b3b9a30acd256f.jpg'),(28,'Avokadas','mmm','products/avokadas2.jpg'),(29,'Burokeliai','Raudonas ir sultingas','products/burokeliai-63005838.jpg'),(30,'Kiaušiniene','wtf nx kiaušinis','products/96.jpg'),(32,'Baklažanai','ėęūųįūėęųį','products/Baklazanai_Eggplanat-297x300_2.jpg');
/*!40000 ALTER TABLE `recipes_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipes_productmeasurement`
--

DROP TABLE IF EXISTS `recipes_productmeasurement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipes_productmeasurement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `measurement_id` int(11) NOT NULL,
  `value` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `recipes_productmeasurement_7f1b40ad` (`product_id`),
  KEY `recipes_productmeasurement_a25c0389` (`measurement_id`),
  CONSTRAINT `measurement_id_refs_id_b201919c` FOREIGN KEY (`measurement_id`) REFERENCES `recipes_measurement` (`id`),
  CONSTRAINT `product_id_refs_id_5f200596` FOREIGN KEY (`product_id`) REFERENCES `recipes_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipes_productmeasurement`
--

LOCK TABLES `recipes_productmeasurement` WRITE;
/*!40000 ALTER TABLE `recipes_productmeasurement` DISABLE KEYS */;
INSERT INTO `recipes_productmeasurement` VALUES (16,24,2,10),(18,11,2,9),(19,17,2,2),(21,20,3,-100);
/*!40000 ALTER TABLE `recipes_productmeasurement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipes_rating`
--

DROP TABLE IF EXISTS `recipes_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipes_rating` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `recipe_id` int(11) NOT NULL,
  `rating` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `recipes_rating_6340c63c` (`user_id`),
  KEY `recipes_rating_fba12377` (`recipe_id`),
  CONSTRAINT `recipe_id_refs_id_05692e40` FOREIGN KEY (`recipe_id`) REFERENCES `recipes_recipe` (`id`),
  CONSTRAINT `user_id_refs_id_7a3cf94d` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipes_rating`
--

LOCK TABLES `recipes_rating` WRITE;
/*!40000 ALTER TABLE `recipes_rating` DISABLE KEYS */;
INSERT INTO `recipes_rating` VALUES (2,5,2,10),(3,5,3,10),(4,5,4,2);
/*!40000 ALTER TABLE `recipes_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipes_recipe`
--

DROP TABLE IF EXISTS `recipes_recipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipes_recipe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 NOT NULL,
  `photo1` varchar(100) NOT NULL,
  `photo2` varchar(100),
  `photo3` varchar(100),
  `user_id` int(11),
  `slug` varchar(50) NOT NULL,
  `date` datetime,
  `overall_rating` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `recipes_recipe_6340c63c` (`user_id`),
  CONSTRAINT `user_id_refs_id_fc3c2cc3` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipes_recipe`
--

LOCK TABLES `recipes_recipe` WRITE;
/*!40000 ALTER TABLE `recipes_recipe` DISABLE KEYS */;
INSERT INTO `recipes_recipe` VALUES (2,'Lietiniai Blynai','skanus lietiniai blynai su uogiene','images/006fad31c2e09a8106db01108f41d7ecaa40f499_3.jpg','','',5,'lietiniai-blynai','2014-12-18 19:37:57',10),(3,'Vieno kasnio sumustiniai','Skanus greitai paruosiami sumustiniai','images/vieno-kasnio-sumustiniai_1.jpg','','',5,'vieno-kasnio-sumustiniai','2014-12-18 15:48:36',10),(4,'Avizine kose','Skani avizine kose','images/avizine-kose-5900_4_1.jpg','','',5,'avizine-kose','2015-01-05 18:09:47',2),(5,'Kiausiniene','Skani greitai paruosiama kiausiniene','images/96_8.jpg','','',5,'kiausiniene','2014-12-18 15:46:09',0),(6,'Trinta pievagrybiu sriuba','Silta ir skanu','images/sriuba-507c069bf33c0_1.jpg','','',5,'trinta-pievagrybiu-sriuba','2014-12-18 15:47:21',0);
/*!40000 ALTER TABLE `recipes_recipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialaccount`
--

DROP TABLE IF EXISTS `socialaccount_socialaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socialaccount_socialaccount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `last_login` datetime NOT NULL,
  `date_joined` datetime NOT NULL,
  `provider` varchar(30) NOT NULL,
  `uid` varchar(255) NOT NULL,
  `extra_data` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialaccount_uid_5ac8b4eb459472be_uniq` (`uid`,`provider`),
  KEY `socialaccount_socialaccount_6340c63c` (`user_id`),
  CONSTRAINT `user_id_refs_id_b4f0248b` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialaccount`
--

LOCK TABLES `socialaccount_socialaccount` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialaccount` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialaccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialapp`
--

DROP TABLE IF EXISTS `socialaccount_socialapp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socialaccount_socialapp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider` varchar(30) NOT NULL,
  `name` varchar(40) NOT NULL,
  `key` varchar(100) NOT NULL,
  `secret` varchar(100) NOT NULL,
  `client_id` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialapp`
--

LOCK TABLES `socialaccount_socialapp` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialapp` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialapp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialapp_sites`
--

DROP TABLE IF EXISTS `socialaccount_socialapp_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socialaccount_socialapp_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `socialapp_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialapp_sites_socialapp_id_711547c3e6a002b_uniq` (`socialapp_id`,`site_id`),
  KEY `socialaccount_socialapp_sites_f2973cd1` (`socialapp_id`),
  KEY `socialaccount_socialapp_sites_99732b5c` (`site_id`),
  CONSTRAINT `site_id_refs_id_05d6147e` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`),
  CONSTRAINT `socialapp_id_refs_id_e7a43014` FOREIGN KEY (`socialapp_id`) REFERENCES `socialaccount_socialapp` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialapp_sites`
--

LOCK TABLES `socialaccount_socialapp_sites` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialapp_sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialapp_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialtoken`
--

DROP TABLE IF EXISTS `socialaccount_socialtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socialaccount_socialtoken` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `token` longtext NOT NULL,
  `token_secret` longtext NOT NULL,
  `expires_at` datetime,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialtoken_app_id_697928748c2e1968_uniq` (`app_id`,`account_id`),
  KEY `socialaccount_socialtoken_60fc113e` (`app_id`),
  KEY `socialaccount_socialtoken_93025c2f` (`account_id`),
  CONSTRAINT `account_id_refs_id_1337a128` FOREIGN KEY (`account_id`) REFERENCES `socialaccount_socialaccount` (`id`),
  CONSTRAINT `app_id_refs_id_edac8a54` FOREIGN KEY (`app_id`) REFERENCES `socialaccount_socialapp` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialtoken`
--

LOCK TABLES `socialaccount_socialtoken` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialtoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `south_migrationhistory`
--

DROP TABLE IF EXISTS `south_migrationhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `south_migrationhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_name` varchar(255) NOT NULL,
  `migration` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `south_migrationhistory`
--

LOCK TABLES `south_migrationhistory` WRITE;
/*!40000 ALTER TABLE `south_migrationhistory` DISABLE KEYS */;
INSERT INTO `south_migrationhistory` VALUES (1,'socialaccount','0001_initial','2014-12-05 12:04:00'),(2,'socialaccount','0002_genericmodels','2014-12-05 12:04:06'),(3,'socialaccount','0003_auto__add_unique_socialaccount_uid_provider','2014-12-05 12:04:07'),(4,'socialaccount','0004_add_sites','2014-12-05 12:04:09'),(5,'socialaccount','0005_set_sites','2014-12-05 12:04:09'),(6,'socialaccount','0006_auto__del_field_socialapp_site','2014-12-05 12:04:10'),(7,'socialaccount','0007_auto__add_field_socialapp_client_id','2014-12-05 12:04:11'),(8,'socialaccount','0008_client_id','2014-12-05 12:04:11'),(9,'socialaccount','0009_auto__add_field_socialtoken_expires_at','2014-12-05 12:04:12'),(10,'socialaccount','0010_auto__chg_field_socialtoken_token','2014-12-05 12:04:12'),(11,'socialaccount','0011_auto__chg_field_socialtoken_token','2014-12-05 12:04:13'),(12,'socialaccount','0012_auto__chg_field_socialtoken_token_secret','2014-12-05 12:04:13'),(13,'recipes','0001_initial','2014-12-05 15:01:30'),(14,'recipes','0002_auto__add_ingridient','2014-12-05 15:07:55'),(15,'recipes','0003_auto__del_field_recipe_ingridients','2014-12-05 15:13:47'),(16,'recipes','0004_auto__add_measurment__add_ingridientmeasurement','2014-12-07 13:29:36'),(17,'recipes','0005_auto','2014-12-07 13:31:45'),(18,'recipes','0006_auto','2014-12-07 13:32:22'),(19,'recipes','0007_auto__del_measurment__del_ingridientmeasurement__del_ingridient__add_p','2014-12-07 14:16:53'),(20,'recipes','0008_auto__add_field_product_description__add_field_product_photo','2014-12-07 15:16:33'),(21,'recipes','0009_auto__chg_field_product_photo__chg_field_recipe_photo2__chg_field_reci','2014-12-07 19:39:14'),(22,'recipes','0010_auto__add_fridge','2014-12-07 23:26:40'),(23,'recipes','0011_auto__add_ingridient','2014-12-10 03:45:45'),(24,'recipes','0012_auto__del_field_recipe_visability','2014-12-12 03:39:42'),(25,'recipes','0013_auto__chg_field_recipe_photo2__chg_field_recipe_photo3','2014-12-12 03:49:46'),(26,'recipes','0014_auto__add_field_recipe_user','2014-12-12 07:13:01'),(27,'recipes','0015_auto__add_field_recipe_slug','2014-12-12 07:15:37'),(28,'recipes','0016_auto__add_menu','2014-12-14 02:05:06'),(29,'recipes','0017_auto__add_rating','2014-12-16 08:43:35'),(30,'recipes','0018_auto__add_field_recipe_date','2014-12-17 03:47:51'),(31,'recipes','0019_auto__add_field_recipe_overall_rating','2014-12-17 05:37:38'),(32,'recipes','0020_auto__del_category__del_field_recipe_category','2014-12-18 15:06:11'),(33,'recipes','0021_auto__add_menuitem','2014-12-18 17:38:36'),(34,'tshirts','0001_initial','2014-12-23 05:22:25'),(35,'tshirts','0002_auto__del_field_tshirt_real_image_men__del_field_tshirt_real_image_bag','2014-12-23 05:22:27'),(36,'tshirts','0003_auto__del_field_tshirt_old_men_image__del_field_tshirt_old_sku__del_fi','2014-12-23 05:22:28'),(37,'tshirts','0004_auto__add_field_tshirt_shopify__add_field_tshirt_shopify_id','2014-12-23 05:22:30');
/*!40000 ALTER TABLE `south_migrationhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thumbnail_kvstore`
--

DROP TABLE IF EXISTS `thumbnail_kvstore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `thumbnail_kvstore` (
  `key` varchar(200) NOT NULL,
  `value` longtext NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thumbnail_kvstore`
--

LOCK TABLES `thumbnail_kvstore` WRITE;
/*!40000 ALTER TABLE `thumbnail_kvstore` DISABLE KEYS */;
INSERT INTO `thumbnail_kvstore` VALUES ('sorl-thumbnail||image||038fbc6d53c0b43f201358db180203dd','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/c5/ca/c5cac979034a2eb2edbdc710c81acf3d.jpg\", \"size\": [300, 300]}'),('sorl-thumbnail||image||0d5639425a4cf51b5207f7f57bcd5ed9','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/d3/80/d38039629a1640e89d2aa7d56305115a.jpg\", \"size\": [300, 300]}'),('sorl-thumbnail||image||1d42d5c55292d4cd3e9406691761b225','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/9a/b2/9ab29d54938a2818feb024c59ef88bef.jpg\", \"size\": [150, 150]}'),('sorl-thumbnail||image||1e0ee6879fe3f23afaaab666901d5920','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/08/b3/08b3270971c6163e611523c169d6cd2f.jpg\", \"size\": [300, 300]}'),('sorl-thumbnail||image||1ff4e02317b48284d23f51bfb1dd3705','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"images/vieno-kasnio-sumustiniai.jpg\", \"size\": [700, 500]}'),('sorl-thumbnail||image||213b4b542b27b45d1a3325610a7349ae','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"products/miltai-60317601_2.jpg\", \"size\": [899, 600]}'),('sorl-thumbnail||image||21c920e5070142cac2fefef93894b331','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/55/e4/55e43d987b9977bdb7b9c2c92a71149a.jpg\", \"size\": [300, 300]}'),('sorl-thumbnail||image||2591ba42479a87fd60b98e0c3d6ed857','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"images/006fad31c2e09a8106db01108f41d7ecaa40f499_2.jpg\", \"size\": [900, 598]}'),('sorl-thumbnail||image||2fe64c4a5d26b12d006f1de32b12db8f','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/52/d8/52d8e17f61e9b41c1bd6981230293597.jpg\", \"size\": [300, 300]}'),('sorl-thumbnail||image||32cadd3b7ed9b3e765c958a6c24614da','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/e6/fd/e6fd596cf9830190dc86257f012a1e8e.jpg\", \"size\": [300, 300]}'),('sorl-thumbnail||image||362f1fab558e2f473030a0f84aaba149','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/66/77/66773a17dbe2bb9b917d17de322d2856.jpg\", \"size\": [300, 300]}'),('sorl-thumbnail||image||365e97d7b052261833d090aae2bc1ae5','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"products/96.jpg\", \"size\": [552, 414]}'),('sorl-thumbnail||image||3a2198fd1b9d4eadb1777b6e34b5460c','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"products/Peppercorns1.JPG\", \"size\": [432, 383]}'),('sorl-thumbnail||image||3ac4e501e74cc289fe32902d9f057ac1','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/cd/57/cd57d3aacbdf351f12b7a93c919edc41.jpg\", \"size\": [300, 300]}'),('sorl-thumbnail||image||3d2b03bcaca9629f195f6bae6e5cad31','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"images/Cesnakas-e1352281677922-300x214.jpg\", \"size\": [300, 214]}'),('sorl-thumbnail||image||43cd71d3c70bf18e089b971ce6abc4bf','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/f3/e6/f3e6ee6e60523641e1ab1af8c8cd7b84.jpg\", \"size\": [300, 300]}'),('sorl-thumbnail||image||4735ce21c8f08502b80502434acc9452','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"images/sriuba-507c069bf33c0_1.jpg\", \"size\": [680, 452]}'),('sorl-thumbnail||image||47ac83e956d02a357ef9c3fd4b734da9','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"products/burokeliai-63005838.jpg\", \"size\": [899, 602]}'),('sorl-thumbnail||image||49f995ec1e95a2ad6b8052888d348249','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"products/pic_peppers1.jpg\", \"size\": [304, 265]}'),('sorl-thumbnail||image||4a07bc4647caaef3babb309b1a024dea','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/1e/80/1e806abfb67cc5242dccaa73330ba83c.jpg\", \"size\": [400, 400]}'),('sorl-thumbnail||image||4bb90b8a9d8c13b26eafe121c5454a21','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/82/53/8253f6a500ef54fbf80dd0ff2d7ff03d.jpg\", \"size\": [300, 300]}'),('sorl-thumbnail||image||4c22bc66ce421da4d1d36ba1fa2a3aaa','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"images/sriuba-507c069bf33c0.jpg\", \"size\": [680, 452]}'),('sorl-thumbnail||image||530107621acb94c3abb15d593198200a','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"images/avokadas2.jpg\", \"size\": [300, 225]}'),('sorl-thumbnail||image||559cdedb4915c802621baf8750443642','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"products/557_ee22d897ec9a9b4493b3b9a30acd256f.jpg\", \"size\": [800, 627]}'),('sorl-thumbnail||image||56a8e7fda494541d6f3482d9c4a6da33','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/57/07/5707bbf9cfd63c2334ff1d5d3c0fa0e3.jpg\", \"size\": [300, 300]}'),('sorl-thumbnail||image||579b2d72dd768864dbd949c0ad4787b4','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"products/agurkai_1.jpg\", \"size\": [350, 435]}'),('sorl-thumbnail||image||5989d4f8d50f3de3c1853cb2b21ad13b','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"products/Carrot1.jpg\", \"size\": [550, 360]}'),('sorl-thumbnail||image||5af4031a8de7863b907d8810a297b15e','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"products/svogunas_2.jpg\", \"size\": [640, 480]}'),('sorl-thumbnail||image||5ea276559783e1b7c8ea75f430a46e63','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/14/cb/14cb35e8b6dae90fee9399ed467ded40.jpg\", \"size\": [300, 300]}'),('sorl-thumbnail||image||60fa3d89ba80093e01dda38de84bdfa0','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"products/Baklazanai_Eggplanat-297x300_2.jpg\", \"size\": [297, 300]}'),('sorl-thumbnail||image||6530bcb7cb6c29bdd99e76a0db296b26','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/2a/be/2abe62ed6ffde6a83e60b23f1333e954.jpg\", \"size\": [300, 300]}'),('sorl-thumbnail||image||73afa7641e6a2389e19d183b147eb977','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/ee/8d/ee8df00141dcb108f17ed87899a2c68b.jpg\", \"size\": [300, 300]}'),('sorl-thumbnail||image||7af14dc75513b008a621883789eb007a','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"images/Bright_red_tomato_and_cross_section02.jpg\", \"size\": [1600, 1067]}'),('sorl-thumbnail||image||7dc31d2061a7ea967445f222d10c8795','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/24/64/2464917a1017f1832bb3e283d50663f9.jpg\", \"size\": [300, 300]}'),('sorl-thumbnail||image||834bacb6f8c57408e9497d7e5feb5568','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"products/Zadama-kad-kiausiniai-pries-Velykas-nebrangs_articlethumb580.jpg\", \"size\": [580, 386]}'),('sorl-thumbnail||image||8a5e08d106b5664b567b83d244298cf1','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"products/Baklazanai_Eggplanat-297x300.jpg\", \"size\": [297, 300]}'),('sorl-thumbnail||image||952e577925debfa0ff2aeab02d3c2645','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/1d/95/1d9542dbd1674641e90dce9f16a667b8.jpg\", \"size\": [300, 300]}'),('sorl-thumbnail||image||95855ae6b69214706a8680c7d1a47bcc','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/e4/1f/e41fce0cbd31fb89ffb0a301a8ea44b9.jpg\", \"size\": [300, 300]}'),('sorl-thumbnail||image||9bc4c4b167f6c5952f8aa7355914a89d','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/25/cb/25cbb05f46434ee8c6958bbf6f5b0f7d.jpg\", \"size\": [300, 300]}'),('sorl-thumbnail||image||a0fa855a28f39557aa794face8a1f6cf','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/20/56/2056882fde8a0733e1148f46881d490b.jpg\", \"size\": [300, 300]}'),('sorl-thumbnail||image||a242996a055692d999cdc960e4449f2b','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/7f/fb/7ffb5a918fc3fbebe4e5c25ad455a92c.jpg\", \"size\": [300, 300]}'),('sorl-thumbnail||image||a873f18da03e3d4cd56300ff6ad829fe','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"images/avizine-kose-5900_4_1.jpg\", \"size\": [535, 385]}'),('sorl-thumbnail||image||abaf9c7ea4c43c8bfbf13afd9908b8aa','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"images/96_7.jpg\", \"size\": [552, 414]}'),('sorl-thumbnail||image||aedab05d9ebf0e4cc7d0182d735e8fb6','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"images/Carrot1_8.jpg\", \"size\": [550, 360]}'),('sorl-thumbnail||image||afaefb195955d307f14ed4c4253bffd4','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/b8/b4/b8b4d7097b2742aa1ba37683d3e1bd10.jpg\", \"size\": [100, 100]}'),('sorl-thumbnail||image||b4dec110aaa462c3689745bdd74aa63d','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/99/0f/990f9d70dcbbbb51c8b3a94435c96a61.jpg\", \"size\": [300, 300]}'),('sorl-thumbnail||image||b50f4e6da3cf85c0207ba2d88b75ad7c','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/58/46/5846a86217add8ada1a11e5f17640439.jpg\", \"size\": [300, 300]}'),('sorl-thumbnail||image||b57903817ffb2d7c3bbbc9d292eb005f','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"products/article-2389853-0B262DC000000578-428_634x351.jpg\", \"size\": [634, 351]}'),('sorl-thumbnail||image||b6b8d2fcae56257c17f6b0214fdbbca4','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/09/27/0927ea4f4cf40fbefb7af56af1954322.jpg\", \"size\": [300, 300]}'),('sorl-thumbnail||image||b7f9e2f0fa4074b8c86a8dd88922b6a5','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/76/0c/760c207721ad666b12cf5a8fb2219d38.jpg\", \"size\": [300, 300]}'),('sorl-thumbnail||image||b8b118390fc185f78b00bcedf7924ffe','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/02/cb/02cb5a3fcb5ff1c4691d2a529cae2aac.jpg\", \"size\": [300, 300]}'),('sorl-thumbnail||image||ca189f30fe143dfa406c598960c70a20','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"products/Bright_red_tomato_and_cross_section02.jpg\", \"size\": [1600, 1067]}'),('sorl-thumbnail||image||cbd3609bf6f623612e2446dc7883a491','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/21/da/21da4b28094b4f701ba0eef037a7249c.jpg\", \"size\": [300, 300]}'),('sorl-thumbnail||image||ccedcad5b278dc3f3065b9c136fc4537','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"images/006fad31c2e09a8106db01108f41d7ecaa40f499.jpg\", \"size\": [900, 598]}'),('sorl-thumbnail||image||d3c1268883eb686ed27376d5130a62db','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"products/Cesnakas-e1352281677922-300x214.jpg\", \"size\": [300, 214]}'),('sorl-thumbnail||image||d5576d0f64d2f38eb29879e4a4a48765','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/6a/68/6a68247b060c154447117b839cd2b675.jpg\", \"size\": [600, 600]}'),('sorl-thumbnail||image||d757236bcc787c010d9e91ef435ed7c7','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"products/avokadas2.jpg\", \"size\": [300, 225]}'),('sorl-thumbnail||image||d8889aff9a43e524f98856b32f2d236b','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/14/d8/14d841b8aa4d1526a074676040b80cfe.jpg\", \"size\": [500, 500]}'),('sorl-thumbnail||image||d8d2161a746fc12d59e39fb7506fb00b','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/d7/15/d7151f58de99e75b8a5bcb8edda58e40.jpg\", \"size\": [300, 300]}'),('sorl-thumbnail||image||d97b9df65bf3a671ea98091a55665c08','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/a3/5c/a35c919388e6b7dc15de10e2d2951a38.jpg\", \"size\": [300, 300]}'),('sorl-thumbnail||image||da5723bbd2eff440e47309282b9f4b56','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"products/ebd8a7832e366facdc471f89490079d8.jpg\", \"size\": [300, 300]}'),('sorl-thumbnail||image||dbb90d694ecbf18b824c7ed97916f523','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"images/006fad31c2e09a8106db01108f41d7ecaa40f499_3.jpg\", \"size\": [900, 598]}'),('sorl-thumbnail||image||dfb8d960bbe7832ef6ae0df1c21eaffb','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/81/84/818405c65213314ce3eb7c04efc63f2f.jpg\", \"size\": [300, 300]}'),('sorl-thumbnail||image||e25047a4230951a67e2bacab713f90ac','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/90/7c/907cd458b0cde66c7611584689359e2e.jpg\", \"size\": [150, 150]}'),('sorl-thumbnail||image||e5ae9fd35b7d495da67919de42599f4c','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"images/96_8.jpg\", \"size\": [552, 414]}'),('sorl-thumbnail||image||e727bae3bfb1f62b5a8dc2ad66bcfca4','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/43/97/439791497f857eefeb2e6aa6e1f7ed22.jpg\", \"size\": [300, 300]}'),('sorl-thumbnail||image||e9e616951354ca0228a7c0858fccc299','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/40/52/40522e7bb0a95e934e593c9066ae4389.jpg\", \"size\": [300, 300]}'),('sorl-thumbnail||image||eb25c53b58b4dbd5e61fbc2d0a2b1b42','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"images/wtf.jpg\", \"size\": [640, 480]}'),('sorl-thumbnail||image||ec066b4d26e29e531e0009cdc0a9c69d','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"products/Broccoli.jpg\", \"size\": [2221, 1666]}'),('sorl-thumbnail||image||ef55ee5728e1d057fe2ad73c91a424b6','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"products/Pekino_kopustai_Sprinkin.jpg\", \"size\": [350, 423]}'),('sorl-thumbnail||image||f3e9f984abede88095d3af2837dc5e55','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"images/vieno-kasnio-sumustiniai_1.jpg\", \"size\": [700, 500]}'),('sorl-thumbnail||image||f4c9a540dda9558f367299c38d74f2be','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/85/11/85113e06c41bac45c8119e57f2460b7e.jpg\", \"size\": [300, 300]}'),('sorl-thumbnail||image||f7247f024e8bce6ffcafb6519ee221b8','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/32/a9/32a969f6c0d65ece6651a96eb984c4a8.jpg\", \"size\": [300, 300]}'),('sorl-thumbnail||image||fb56b2bc89cdecd7f90e09c498cc151e','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"images/avizine-kose-5900_4.jpg\", \"size\": [535, 385]}'),('sorl-thumbnail||thumbnails||1ff4e02317b48284d23f51bfb1dd3705','[\"56a8e7fda494541d6f3482d9c4a6da33\"]'),('sorl-thumbnail||thumbnails||213b4b542b27b45d1a3325610a7349ae','[\"afaefb195955d307f14ed4c4253bffd4\", \"32cadd3b7ed9b3e765c958a6c24614da\"]'),('sorl-thumbnail||thumbnails||2591ba42479a87fd60b98e0c3d6ed857','[\"b4dec110aaa462c3689745bdd74aa63d\"]'),('sorl-thumbnail||thumbnails||365e97d7b052261833d090aae2bc1ae5','[\"95855ae6b69214706a8680c7d1a47bcc\"]'),('sorl-thumbnail||thumbnails||3a2198fd1b9d4eadb1777b6e34b5460c','[\"d8d2161a746fc12d59e39fb7506fb00b\"]'),('sorl-thumbnail||thumbnails||3d2b03bcaca9629f195f6bae6e5cad31','[\"3ac4e501e74cc289fe32902d9f057ac1\"]'),('sorl-thumbnail||thumbnails||4735ce21c8f08502b80502434acc9452','[\"4bb90b8a9d8c13b26eafe121c5454a21\"]'),('sorl-thumbnail||thumbnails||47ac83e956d02a357ef9c3fd4b734da9','[\"0d5639425a4cf51b5207f7f57bcd5ed9\"]'),('sorl-thumbnail||thumbnails||49f995ec1e95a2ad6b8052888d348249','[\"b50f4e6da3cf85c0207ba2d88b75ad7c\"]'),('sorl-thumbnail||thumbnails||4c22bc66ce421da4d1d36ba1fa2a3aaa','[\"43cd71d3c70bf18e089b971ce6abc4bf\"]'),('sorl-thumbnail||thumbnails||530107621acb94c3abb15d593198200a','[\"1d42d5c55292d4cd3e9406691761b225\"]'),('sorl-thumbnail||thumbnails||559cdedb4915c802621baf8750443642','[\"a0fa855a28f39557aa794face8a1f6cf\"]'),('sorl-thumbnail||thumbnails||579b2d72dd768864dbd949c0ad4787b4','[\"362f1fab558e2f473030a0f84aaba149\"]'),('sorl-thumbnail||thumbnails||5989d4f8d50f3de3c1853cb2b21ad13b','[\"7dc31d2061a7ea967445f222d10c8795\"]'),('sorl-thumbnail||thumbnails||5af4031a8de7863b907d8810a297b15e','[\"a242996a055692d999cdc960e4449f2b\"]'),('sorl-thumbnail||thumbnails||60fa3d89ba80093e01dda38de84bdfa0','[\"038fbc6d53c0b43f201358db180203dd\"]'),('sorl-thumbnail||thumbnails||7af14dc75513b008a621883789eb007a','[\"952e577925debfa0ff2aeab02d3c2645\"]'),('sorl-thumbnail||thumbnails||834bacb6f8c57408e9497d7e5feb5568','[\"73afa7641e6a2389e19d183b147eb977\"]'),('sorl-thumbnail||thumbnails||8a5e08d106b5664b567b83d244298cf1','[\"e727bae3bfb1f62b5a8dc2ad66bcfca4\"]'),('sorl-thumbnail||thumbnails||a873f18da03e3d4cd56300ff6ad829fe','[\"1e0ee6879fe3f23afaaab666901d5920\"]'),('sorl-thumbnail||thumbnails||abaf9c7ea4c43c8bfbf13afd9908b8aa','[\"d8889aff9a43e524f98856b32f2d236b\", \"4a07bc4647caaef3babb309b1a024dea\", \"d5576d0f64d2f38eb29879e4a4a48765\", \"e9e616951354ca0228a7c0858fccc299\"]'),('sorl-thumbnail||thumbnails||aedab05d9ebf0e4cc7d0182d735e8fb6','[\"e25047a4230951a67e2bacab713f90ac\"]'),('sorl-thumbnail||thumbnails||b57903817ffb2d7c3bbbc9d292eb005f','[\"6530bcb7cb6c29bdd99e76a0db296b26\"]'),('sorl-thumbnail||thumbnails||ca189f30fe143dfa406c598960c70a20','[\"9bc4c4b167f6c5952f8aa7355914a89d\"]'),('sorl-thumbnail||thumbnails||ccedcad5b278dc3f3065b9c136fc4537','[\"b7f9e2f0fa4074b8c86a8dd88922b6a5\"]'),('sorl-thumbnail||thumbnails||d3c1268883eb686ed27376d5130a62db','[\"5ea276559783e1b7c8ea75f430a46e63\"]'),('sorl-thumbnail||thumbnails||d757236bcc787c010d9e91ef435ed7c7','[\"d97b9df65bf3a671ea98091a55665c08\"]'),('sorl-thumbnail||thumbnails||da5723bbd2eff440e47309282b9f4b56','[\"f7247f024e8bce6ffcafb6519ee221b8\"]'),('sorl-thumbnail||thumbnails||dbb90d694ecbf18b824c7ed97916f523','[\"f4c9a540dda9558f367299c38d74f2be\"]'),('sorl-thumbnail||thumbnails||e5ae9fd35b7d495da67919de42599f4c','[\"dfb8d960bbe7832ef6ae0df1c21eaffb\"]'),('sorl-thumbnail||thumbnails||eb25c53b58b4dbd5e61fbc2d0a2b1b42','[\"21c920e5070142cac2fefef93894b331\"]'),('sorl-thumbnail||thumbnails||ec066b4d26e29e531e0009cdc0a9c69d','[\"2fe64c4a5d26b12d006f1de32b12db8f\"]'),('sorl-thumbnail||thumbnails||ef55ee5728e1d057fe2ad73c91a424b6','[\"b8b118390fc185f78b00bcedf7924ffe\"]'),('sorl-thumbnail||thumbnails||f3e9f984abede88095d3af2837dc5e55','[\"b6b8d2fcae56257c17f6b0214fdbbca4\"]'),('sorl-thumbnail||thumbnails||fb56b2bc89cdecd7f90e09c498cc151e','[\"cbd3609bf6f623612e2446dc7883a491\"]');
/*!40000 ALTER TABLE `thumbnail_kvstore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tshirts_account`
--

DROP TABLE IF EXISTS `tshirts_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tshirts_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tshirts_account`
--

LOCK TABLES `tshirts_account` WRITE;
/*!40000 ALTER TABLE `tshirts_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `tshirts_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tshirts_barcode`
--

DROP TABLE IF EXISTS `tshirts_barcode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tshirts_barcode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `barcode` varchar(16) NOT NULL,
  `status` varchar(1) NOT NULL,
  `tshirt_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `barcode` (`barcode`),
  KEY `tshirts_barcode_b1dfd5ae` (`tshirt_id`),
  CONSTRAINT `tshirt_id_refs_id_f9206b6a` FOREIGN KEY (`tshirt_id`) REFERENCES `tshirts_tshirt` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tshirts_barcode`
--

LOCK TABLES `tshirts_barcode` WRITE;
/*!40000 ALTER TABLE `tshirts_barcode` DISABLE KEYS */;
/*!40000 ALTER TABLE `tshirts_barcode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tshirts_barcodefile`
--

DROP TABLE IF EXISTS `tshirts_barcodefile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tshirts_barcodefile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `barcode_file` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tshirts_barcodefile`
--

LOCK TABLES `tshirts_barcodefile` WRITE;
/*!40000 ALTER TABLE `tshirts_barcodefile` DISABLE KEYS */;
/*!40000 ALTER TABLE `tshirts_barcodefile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tshirts_outputfiles`
--

DROP TABLE IF EXISTS `tshirts_outputfiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tshirts_outputfiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `output_men` varchar(100) NOT NULL,
  `output_women` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tshirts_outputfiles`
--

LOCK TABLES `tshirts_outputfiles` WRITE;
/*!40000 ALTER TABLE `tshirts_outputfiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `tshirts_outputfiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tshirts_tag`
--

DROP TABLE IF EXISTS `tshirts_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tshirts_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag` varchar(50) NOT NULL,
  `count` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tag` (`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tshirts_tag`
--

LOCK TABLES `tshirts_tag` WRITE;
/*!40000 ALTER TABLE `tshirts_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `tshirts_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tshirts_tshirt`
--

DROP TABLE IF EXISTS `tshirts_tshirt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tshirts_tshirt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) DEFAULT NULL,
  `sku` varchar(20) DEFAULT NULL,
  `title` varchar(150) NOT NULL,
  `search_tag_1` varchar(50) NOT NULL,
  `search_tag_2` varchar(50) NOT NULL,
  `search_tag_3` varchar(50) NOT NULL,
  `design` varchar(100) DEFAULT NULL,
  `image_men` varchar(300) DEFAULT NULL,
  `image_women` varchar(300) DEFAULT NULL,
  `image_bag` varchar(300) DEFAULT NULL,
  `image_gray_men` varchar(300) DEFAULT NULL,
  `image_gray_women` varchar(300) DEFAULT NULL,
  `image_crew_neck` varchar(300) DEFAULT NULL,
  `designer_id` int(11) NOT NULL,
  `status` varchar(1) NOT NULL,
  `rejection_message` longtext,
  `datetime` datetime NOT NULL,
  `generated` tinyint(1) NOT NULL,
  `shopify` tinyint(1) NOT NULL,
  `shopify_id` varchar(20),
  PRIMARY KEY (`id`),
  UNIQUE KEY `sku` (`sku`),
  KEY `tshirts_tshirt_93025c2f` (`account_id`),
  KEY `tshirts_tshirt_f7b82556` (`designer_id`),
  CONSTRAINT `account_id_refs_id_bc4e8cd1` FOREIGN KEY (`account_id`) REFERENCES `tshirts_account` (`id`),
  CONSTRAINT `designer_id_refs_id_39dbdf94` FOREIGN KEY (`designer_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tshirts_tshirt`
--

LOCK TABLES `tshirts_tshirt` WRITE;
/*!40000 ALTER TABLE `tshirts_tshirt` DISABLE KEYS */;
/*!40000 ALTER TABLE `tshirts_tshirt` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-01-05 20:28:46
