-- MySQL dump 10.13  Distrib 8.0.37, for Linux (x86_64)
--
-- Host: localhost    Database: STOCK_DATA
-- ------------------------------------------------------
-- Server version	8.0.37-0ubuntu0.23.10.2

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
-- Table structure for table `account_emailaddress`
--

DROP TABLE IF EXISTS `account_emailaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_emailaddress` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_emailaddress_user_id_email_987c8728_uniq` (`user_id`,`email`),
  KEY `account_emailaddress_email_03be32b2` (`email`),
  CONSTRAINT `account_emailaddress_user_id_2c513194_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_emailaddress`
--

LOCK TABLES `account_emailaddress` WRITE;
/*!40000 ALTER TABLE `account_emailaddress` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_emailaddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_emailconfirmation`
--

DROP TABLE IF EXISTS `account_emailconfirmation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_emailconfirmation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `sent` datetime(6) DEFAULT NULL,
  `key` varchar(64) NOT NULL,
  `email_address_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`),
  KEY `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` (`email_address_id`),
  CONSTRAINT `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` FOREIGN KEY (`email_address_id`) REFERENCES `account_emailaddress` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_emailconfirmation`
--

LOCK TABLES `account_emailconfirmation` WRITE;
/*!40000 ALTER TABLE `account_emailconfirmation` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_emailconfirmation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alerts`
--

DROP TABLE IF EXISTS `alerts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alerts` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ticker` varchar(10) NOT NULL,
  `current_price` double NOT NULL,
  `email` varchar(254) NOT NULL,
  `threshold` double NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `alerts_user_id_761eb1a6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `alerts_user_id_761eb1a6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alerts`
--

LOCK TABLES `alerts` WRITE;
/*!40000 ALTER TABLE `alerts` DISABLE KEYS */;
/*!40000 ALTER TABLE `alerts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_stock`
--

DROP TABLE IF EXISTS `api_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_stock` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ticker` varchar(10) NOT NULL,
  `close_price` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `api_stock_ticker_c7b0c6_idx` (`ticker`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_stock`
--

LOCK TABLES `api_stock` WRITE;
/*!40000 ALTER TABLE `api_stock` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_stock` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add daily closing price',7,'add_dailyclosingprice'),(26,'Can change daily closing price',7,'change_dailyclosingprice'),(27,'Can delete daily closing price',7,'delete_dailyclosingprice'),(28,'Can view daily closing price',7,'view_dailyclosingprice'),(29,'Can add price change percentage',8,'add_pricechangepercentage'),(30,'Can change price change percentage',8,'change_pricechangepercentage'),(31,'Can delete price change percentage',8,'delete_pricechangepercentage'),(32,'Can view price change percentage',8,'view_pricechangepercentage'),(33,'Can add top gainers losers',9,'add_topgainerslosers'),(34,'Can change top gainers losers',9,'change_topgainerslosers'),(35,'Can delete top gainers losers',9,'delete_topgainerslosers'),(36,'Can view top gainers losers',9,'view_topgainerslosers'),(37,'Can add stock',7,'add_stock'),(38,'Can change stock',7,'change_stock'),(39,'Can delete stock',7,'delete_stock'),(40,'Can view stock',7,'view_stock'),(41,'Can add daily closing price',10,'add_dailyclosingprice'),(42,'Can change daily closing price',10,'change_dailyclosingprice'),(43,'Can delete daily closing price',10,'delete_dailyclosingprice'),(44,'Can view daily closing price',10,'view_dailyclosingprice'),(45,'Can add blacklisted token',11,'add_blacklistedtoken'),(46,'Can change blacklisted token',11,'change_blacklistedtoken'),(47,'Can delete blacklisted token',11,'delete_blacklistedtoken'),(48,'Can view blacklisted token',11,'view_blacklistedtoken'),(49,'Can add outstanding token',12,'add_outstandingtoken'),(50,'Can change outstanding token',12,'change_outstandingtoken'),(51,'Can delete outstanding token',12,'delete_outstandingtoken'),(52,'Can view outstanding token',12,'view_outstandingtoken'),(53,'Can add custom user',13,'add_customuser'),(54,'Can change custom user',13,'change_customuser'),(55,'Can delete custom user',13,'delete_customuser'),(56,'Can view custom user',13,'view_customuser'),(57,'Can add todays data',14,'add_todaysdata'),(58,'Can change todays data',14,'change_todaysdata'),(59,'Can delete todays data',14,'delete_todaysdata'),(60,'Can view todays data',14,'view_todaysdata'),(61,'Can add site',15,'add_site'),(62,'Can change site',15,'change_site'),(63,'Can delete site',15,'delete_site'),(64,'Can view site',15,'view_site'),(65,'Can add email address',16,'add_emailaddress'),(66,'Can change email address',16,'change_emailaddress'),(67,'Can delete email address',16,'delete_emailaddress'),(68,'Can view email address',16,'view_emailaddress'),(69,'Can add email confirmation',17,'add_emailconfirmation'),(70,'Can change email confirmation',17,'change_emailconfirmation'),(71,'Can delete email confirmation',17,'delete_emailconfirmation'),(72,'Can view email confirmation',17,'view_emailconfirmation'),(73,'Can add social account',18,'add_socialaccount'),(74,'Can change social account',18,'change_socialaccount'),(75,'Can delete social account',18,'delete_socialaccount'),(76,'Can view social account',18,'view_socialaccount'),(77,'Can add social application',19,'add_socialapp'),(78,'Can change social application',19,'change_socialapp'),(79,'Can delete social application',19,'delete_socialapp'),(80,'Can view social application',19,'view_socialapp'),(81,'Can add social application token',20,'add_socialtoken'),(82,'Can change social application token',20,'change_socialtoken'),(83,'Can delete social application token',20,'delete_socialtoken'),(84,'Can view social application token',20,'view_socialtoken'),(85,'Can add Token',21,'add_token'),(86,'Can change Token',21,'change_token'),(87,'Can delete Token',21,'delete_token'),(88,'Can view Token',21,'view_token'),(89,'Can add token',22,'add_tokenproxy'),(90,'Can change token',22,'change_tokenproxy'),(91,'Can delete token',22,'delete_tokenproxy'),(92,'Can view token',22,'view_tokenproxy'),(93,'Can add custom user',23,'add_customuser'),(94,'Can change custom user',23,'change_customuser'),(95,'Can delete custom user',23,'delete_customuser'),(96,'Can view custom user',23,'view_customuser'),(97,'Can add alert',24,'add_alert'),(98,'Can change alert',24,'change_alert'),(99,'Can delete alert',24,'delete_alert'),(100,'Can view alert',24,'view_alert');
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
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$600000$2JlbaZe9sitxnFwLLTYth8$12vhDJzD2rFekhVG9Gm+M0R2G7QUsmgP5V+/5I5KRTk=','2024-08-02 17:28:43.580919',1,'admin','','','',1,1,'2024-07-27 07:20:59.110432'),(2,'pbkdf2_sha256$600000$vleILmoEfCcw0PUjVm5DeW$xTNLImG3xO5gD//Ai4YiB4GnD3nrh1BoGioCTjvNSiA=','2024-08-02 17:22:23.302637',0,'nishant','','','',0,1,'2024-07-30 12:42:46.724664'),(3,'pbkdf2_sha256$600000$msck2Y2M4lyyK8P8J8gOob$Q5JewbKlTDu8lY8sPTYHvnCquBXHKddnS+ySkATFSrE=','2024-07-30 21:29:21.905038',0,'testuser','','','',0,1,'2024-07-30 21:09:37.923908');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authtoken_token`
--

DROP TABLE IF EXISTS `authtoken_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authtoken_token`
--

LOCK TABLES `authtoken_token` WRITE;
/*!40000 ALTER TABLE `authtoken_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `authtoken_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `daily_closing_price`
--

DROP TABLE IF EXISTS `daily_closing_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `daily_closing_price` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ticker` varchar(10) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `close` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1987 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daily_closing_price`
--

LOCK TABLES `daily_closing_price` WRITE;
/*!40000 ALTER TABLE `daily_closing_price` DISABLE KEYS */;
INSERT INTO `daily_closing_price` VALUES (1967,'AAPL','2024-08-02',223.54),(1968,'MSFT','2024-08-02',405.73),(1969,'GOOGL','2024-08-02',165.31),(1970,'AMZN','2024-08-02',165.3),(1971,'TSLA','2024-08-02',206.71),(1972,'META','2024-08-02',486.91),(1973,'NVDA','2024-08-02',104.94),(1974,'NFLX','2024-08-02',613.82),(1975,'ADBE','2024-08-02',521.85),(1976,'INTC','2024-08-02',21.1641),(1977,'PYPL','2024-08-02',61.97),(1978,'CSCO','2024-08-02',46.415),(1979,'PEP','2024-08-02',177.62),(1980,'AVGO','2024-08-02',142.3),(1981,'COST','2024-08-02',817.94),(1982,'TM','2024-08-02',172.33),(1983,'NKE','2024-08-02',73.455),(1984,'V','2024-08-02',264.895),(1985,'MA','2024-08-02',460.78),(1986,'JPM','2024-08-02',198.15);
/*!40000 ALTER TABLE `daily_closing_price` ENABLE KEYS */;
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
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (16,'account','emailaddress'),(17,'account','emailconfirmation'),(1,'admin','logentry'),(24,'api','alert'),(13,'api','customuser'),(10,'api','dailyclosingprice'),(8,'api','pricechangepercentage'),(7,'api','stock'),(14,'api','todaysdata'),(9,'api','topgainerslosers'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(21,'authtoken','token'),(22,'authtoken','tokenproxy'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(15,'sites','site'),(18,'socialaccount','socialaccount'),(19,'socialaccount','socialapp'),(20,'socialaccount','socialtoken'),(11,'token_blacklist','blacklistedtoken'),(12,'token_blacklist','outstandingtoken'),(23,'user_management','customuser');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-07-27 07:20:24.994396'),(2,'auth','0001_initial','2024-07-27 07:20:26.124257'),(3,'admin','0001_initial','2024-07-27 07:20:26.286166'),(4,'admin','0002_logentry_remove_auto_add','2024-07-27 07:20:26.296259'),(5,'admin','0003_logentry_add_action_flag_choices','2024-07-27 07:20:26.307214'),(6,'contenttypes','0002_remove_content_type_name','2024-07-27 07:20:26.385102'),(7,'auth','0002_alter_permission_name_max_length','2024-07-27 07:20:26.448140'),(8,'auth','0003_alter_user_email_max_length','2024-07-27 07:20:26.485558'),(9,'auth','0004_alter_user_username_opts','2024-07-27 07:20:26.495739'),(10,'auth','0005_alter_user_last_login_null','2024-07-27 07:20:26.568373'),(11,'auth','0006_require_contenttypes_0002','2024-07-27 07:20:26.572564'),(12,'auth','0007_alter_validators_add_error_messages','2024-07-27 07:20:26.582749'),(13,'auth','0008_alter_user_username_max_length','2024-07-27 07:20:26.659741'),(14,'auth','0009_alter_user_last_name_max_length','2024-07-27 07:20:26.719456'),(15,'auth','0010_alter_group_name_max_length','2024-07-27 07:20:26.745399'),(16,'auth','0011_update_proxy_permissions','2024-07-27 07:20:26.757700'),(17,'auth','0012_alter_user_first_name_max_length','2024-07-27 07:20:26.819711'),(18,'sessions','0001_initial','2024-07-27 07:20:26.875856'),(19,'api','0001_initial','2024-07-27 20:14:45.567027'),(20,'api','0002_rename_dailyclosingprice_stock_and_more','2024-07-27 20:56:13.444735'),(21,'api','0003_alter_stock_options_rename_close_stock_close_price_and_more','2024-07-27 20:59:09.700090'),(22,'api','0004_alter_stock_options','2024-07-27 21:02:46.620160'),(23,'token_blacklist','0001_initial','2024-07-29 08:56:12.156338'),(24,'token_blacklist','0002_outstandingtoken_jti_hex','2024-07-29 08:56:12.214575'),(25,'token_blacklist','0003_auto_20171017_2007','2024-07-29 08:56:12.235403'),(26,'token_blacklist','0004_auto_20171017_2013','2024-07-29 08:56:12.378978'),(27,'token_blacklist','0005_remove_outstandingtoken_jti','2024-07-29 08:56:12.451801'),(28,'token_blacklist','0006_auto_20171017_2113','2024-07-29 08:56:12.495031'),(29,'token_blacklist','0007_auto_20171017_2214','2024-07-29 08:56:12.793877'),(30,'token_blacklist','0008_migrate_to_bigautofield','2024-07-29 08:56:13.097521'),(31,'token_blacklist','0010_fix_migrate_to_bigautofield','2024-07-29 08:56:13.117833'),(32,'token_blacklist','0011_linearizes_history','2024-07-29 08:56:13.122424'),(33,'token_blacklist','0012_alter_outstandingtoken_user','2024-07-29 08:56:13.135227'),(34,'account','0001_initial','2024-07-30 10:31:49.992140'),(35,'account','0002_email_max_length','2024-07-30 10:31:50.151605'),(36,'account','0003_alter_emailaddress_create_unique_verified_email','2024-07-30 10:31:50.318726'),(37,'account','0004_alter_emailaddress_drop_unique_email','2024-07-30 10:31:50.418301'),(38,'account','0005_emailaddress_idx_upper_email','2024-07-30 10:31:50.469025'),(39,'account','0006_emailaddress_lower','2024-07-30 10:31:50.505279'),(40,'account','0007_emailaddress_idx_email','2024-07-30 10:31:50.597811'),(41,'account','0008_emailaddress_unique_primary_email_fixup','2024-07-30 10:31:50.623477'),(42,'account','0009_emailaddress_unique_primary_email','2024-07-30 10:31:50.643085'),(43,'authtoken','0001_initial','2024-07-30 10:31:50.783780'),(44,'authtoken','0002_auto_20160226_1747','2024-07-30 10:31:50.848877'),(45,'authtoken','0003_tokenproxy','2024-07-30 10:31:50.856367'),(46,'sites','0001_initial','2024-07-30 10:31:50.897171'),(47,'sites','0002_alter_domain_unique','2024-07-30 10:31:50.935707'),(48,'socialaccount','0001_initial','2024-07-30 10:31:51.613215'),(49,'socialaccount','0002_token_max_lengths','2024-07-30 10:31:51.713438'),(50,'socialaccount','0003_extra_data_default_dict','2024-07-30 10:31:51.733436'),(51,'socialaccount','0004_app_provider_id_settings','2024-07-30 10:31:52.351308'),(52,'socialaccount','0005_socialtoken_nullable_app','2024-07-30 10:31:52.569523'),(53,'socialaccount','0006_alter_socialaccount_extra_data','2024-07-30 10:31:52.781110'),(54,'api','0002_alert_alert_alerts_user_id_f39345_idx','2024-07-31 17:46:50.934638'),(55,'api','0003_remove_alert_alerts_user_id_f39345_idx_and_more','2024-07-31 18:34:10.384109'),(56,'api','0004_delete_alert','2024-07-31 18:40:10.612594'),(57,'api','0002_alert','2024-07-31 19:26:06.772175'),(58,'api','0003_rename_current_price_alert_current_value','2024-08-01 09:24:35.882813'),(59,'api','0003_remove_alert_user','2024-08-01 10:16:21.213062');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0zeoo6btmn0f9gtcqh143csd5qi4z2cd','.eJxVjEEOwiAQRe_C2hCZCgWX7j0DGWYGqRpISrsy3l2bdKHb_977LxVxXUpcu8xxYnVWRh1-t4T0kLoBvmO9NU2tLvOU9KbonXZ9bSzPy-7-HRTs5Vs7yyNBIJGBBwAQtGPKwaCRDBYJPLsAwafghsyUiR3bU7JWjmLEk3p_APyFONI:1sZS4A:DWt7gMLjndUr-H1TtQ7E_r29ViKrW8GJ0c7hlPHHAK4','2024-08-15 09:25:46.336212'),('1cxagml9vhh39fi4ai6retm1hc0vth3b','.eJxVjEEOwiAQRe_C2hCZCgWX7j0DGWYGqRpISrsy3l2bdKHb_977LxVxXUpcu8xxYnVWRh1-t4T0kLoBvmO9NU2tLvOU9KbonXZ9bSzPy-7-HRTs5Vs7yyNBIJGBBwAQtGPKwaCRDBYJPLsAwafghsyUiR3bU7JWjmLEk3p_APyFONI:1sZ4LU:w0COX7IVY3cwMX0lUHXCSeUVYY5zaEUjWIzBZq2R2fw','2024-08-14 08:06:04.394907'),('1g5zuyj8ipq7zuez74drgwpzpir52ciw','.eJxVjEEOwiAQRe_C2hCZCgWX7j0DGWYGqRpISrsy3l2bdKHb_977LxVxXUpcu8xxYnVWRh1-t4T0kLoBvmO9NU2tLvOU9KbonXZ9bSzPy-7-HRTs5Vs7yyNBIJGBBwAQtGPKwaCRDBYJPLsAwafghsyUiR3bU7JWjmLEk3p_APyFONI:1sZ8RK:tbVuV2o9Ksa_Wgo_NgVZ6qv-32Qoxpnjy7c5WjPRnvo','2024-08-14 12:28:22.621133'),('2mypq3sa5voi0gltb4vsay5ff85714d8','.eJxVjEEOwiAQRe_C2hCZCgWX7j0DGWYGqRpISrsy3l2bdKHb_977LxVxXUpcu8xxYnVWRh1-t4T0kLoBvmO9NU2tLvOU9KbonXZ9bSzPy-7-HRTs5Vs7yyNBIJGBBwAQtGPKwaCRDBYJPLsAwafghsyUiR3bU7JWjmLEk3p_APyFONI:1sYsT2:Y0_em5Kizs50UUL20oMnpefxWfeqHNqIcoPeJaN5jl0','2024-08-13 19:25:04.950694'),('34lm38pryx6ysost9jzzloml4iaofvqk','.eJxVjEEOwiAQRe_C2hCZCgWX7j0DGWYGqRpISrsy3l2bdKHb_977LxVxXUpcu8xxYnVWRh1-t4T0kLoBvmO9NU2tLvOU9KbonXZ9bSzPy-7-HRTs5Vs7yyNBIJGBBwAQtGPKwaCRDBYJPLsAwafghsyUiR3bU7JWjmLEk3p_APyFONI:1sYsaI:0WSw-Ee0q5Dj5N87hYzymtdn0iWAzOQean6-W7ZRWxs','2024-08-13 19:32:34.765807'),('3eyj98qbfh1zfc83nhij04u38xvnrkv4','.eJxVjEEOwiAQRe_C2hCZCgWX7j0DGWYGqRpISrsy3l2bdKHb_977LxVxXUpcu8xxYnVWRh1-t4T0kLoBvmO9NU2tLvOU9KbonXZ9bSzPy-7-HRTs5Vs7yyNBIJGBBwAQtGPKwaCRDBYJPLsAwafghsyUiR3bU7JWjmLEk3p_APyFONI:1sZ8ju:7k7n13Ag48US2ANSGnHsQFPwtc8y9LcM33lM-8bOKfM','2024-08-14 12:47:34.891688'),('455gxxqzfs88pmnbaikjlkvtjvbf761u','.eJxVjEEOwiAQRe_C2hCZCgWX7j0DGWYGqRpISrsy3l2bdKHb_977LxVxXUpcu8xxYnVWRh1-t4T0kLoBvmO9NU2tLvOU9KbonXZ9bSzPy-7-HRTs5Vs7yyNBIJGBBwAQtGPKwaCRDBYJPLsAwafghsyUiR3bU7JWjmLEk3p_APyFONI:1sZDUr:LzOGUntchjPOoffTMFeMm92PfnL8yAhTirxfKu7G0NM','2024-08-14 17:52:21.437263'),('4dsochg4yk11wnce41ovd35ll3r3tezc','.eJxVjEEOwiAQRe_C2hCZCgWX7j0DGWYGqRpISrsy3l2bdKHb_977LxVxXUpcu8xxYnVWRh1-t4T0kLoBvmO9NU2tLvOU9KbonXZ9bSzPy-7-HRTs5Vs7yyNBIJGBBwAQtGPKwaCRDBYJPLsAwafghsyUiR3bU7JWjmLEk3p_APyFONI:1sZw55:aCYVdUT2wDX8temyAEKmjymCOsW3YNUOoshk2IiRXec','2024-08-16 17:28:43.585166'),('4zb3i4v0d8je4621cjclz2vtlfvvhkoy','.eJxVjEEOwiAQRe_C2hCZCgWX7j0DGWYGqRpISrsy3l2bdKHb_977LxVxXUpcu8xxYnVWRh1-t4T0kLoBvmO9NU2tLvOU9KbonXZ9bSzPy-7-HRTs5Vs7yyNBIJGBBwAQtGPKwaCRDBYJPLsAwafghsyUiR3bU7JWjmLEk3p_APyFONI:1sYugF:bTQbSJ0exIcLTiAYUsLiMi4ynYvAMwbIMArkGNU9dfg','2024-08-13 21:46:51.857868'),('59gtn7qauq3p3w6qf87xp07ks2o8a64w','.eJxVjEEOwiAQRe_C2hCZCgWX7j0DGWYGqRpISrsy3l2bdKHb_977LxVxXUpcu8xxYnVWRh1-t4T0kLoBvmO9NU2tLvOU9KbonXZ9bSzPy-7-HRTs5Vs7yyNBIJGBBwAQtGPKwaCRDBYJPLsAwafghsyUiR3bU7JWjmLEk3p_APyFONI:1sZ2hd:z-Ci3jMoyS4jYaKEg7NsjENfOsIBEOcWCorMLSB05l8','2024-08-14 06:20:49.791438'),('5a0j0r8udqp5pcnfed0yhu7hwo4vx4yt','.eJxVjEEOwiAQRe_C2hCZCgWX7j0DGWYGqRpISrsy3l2bdKHb_977LxVxXUpcu8xxYnVWRh1-t4T0kLoBvmO9NU2tLvOU9KbonXZ9bSzPy-7-HRTs5Vs7yyNBIJGBBwAQtGPKwaCRDBYJPLsAwafghsyUiR3bU7JWjmLEk3p_APyFONI:1sYsDH:r07s3lHLHzKYTBrbK2IdiieCNk53ZvH0veQNnK5Kk4M','2024-08-13 19:08:47.653626'),('5qybi30nj08ta8tti3qxaohiaf2buth2','.eJxVjEEOwiAQRe_C2hCZCgWX7j0DGWYGqRpISrsy3l2bdKHb_977LxVxXUpcu8xxYnVWRh1-t4T0kLoBvmO9NU2tLvOU9KbonXZ9bSzPy-7-HRTs5Vs7yyNBIJGBBwAQtGPKwaCRDBYJPLsAwafghsyUiR3bU7JWjmLEk3p_APyFONI:1sZ2Bp:c3Tf89xZLCu6IF4WuwQnrV9x39lCLuN71hrKdZJtD7o','2024-08-14 05:47:57.628553'),('6deyyax0n4v4d0ybzm2h74av33q7avvj','.eJxVjEEOwiAQRe_C2hCZCgWX7j0DGWYGqRpISrsy3l2bdKHb_977LxVxXUpcu8xxYnVWRh1-t4T0kLoBvmO9NU2tLvOU9KbonXZ9bSzPy-7-HRTs5Vs7yyNBIJGBBwAQtGPKwaCRDBYJPLsAwafghsyUiR3bU7JWjmLEk3p_APyFONI:1sYulX:37eiKKu38Uk02o4LMYqL2cjdxiCnY5Dsr6z1ENWjy28','2024-08-13 21:52:19.597880'),('6xu4b0801i3wwb1fhe0yn20v5n9pdvvm','.eJxVjEEOwiAQRe_C2hCZCgWX7j0DGWYGqRpISrsy3l2bdKHb_977LxVxXUpcu8xxYnVWRh1-t4T0kLoBvmO9NU2tLvOU9KbonXZ9bSzPy-7-HRTs5Vs7yyNBIJGBBwAQtGPKwaCRDBYJPLsAwafghsyUiR3bU7JWjmLEk3p_APyFONI:1sZ9RT:sYZNdnsxHR_OqK7aS0-TjedVXCV302jlmGo8s2HOxAc','2024-08-14 13:32:35.755234'),('6z3wpgpnk0euryimfk8t9th9tximkfub','.eJxVjEEOwiAQRe_C2hCZCgWX7j0DGWYGqRpISrsy3l2bdKHb_977LxVxXUpcu8xxYnVWRh1-t4T0kLoBvmO9NU2tLvOU9KbonXZ9bSzPy-7-HRTs5Vs7yyNBIJGBBwAQtGPKwaCRDBYJPLsAwafghsyUiR3bU7JWjmLEk3p_APyFONI:1sYm7j:hOrVnnrAU3Yz10Qt9xtHz8aKoFC0glSgWvWfcRXgY2Q','2024-08-13 12:38:39.430215'),('7cz9rg6fqwmyyqxjdyv7j5ro7kb6bdwy','.eJxVjEEOwiAQRe_C2hCZCgWX7j0DGWYGqRpISrsy3l2bdKHb_977LxVxXUpcu8xxYnVWRh1-t4T0kLoBvmO9NU2tLvOU9KbonXZ9bSzPy-7-HRTs5Vs7yyNBIJGBBwAQtGPKwaCRDBYJPLsAwafghsyUiR3bU7JWjmLEk3p_APyFONI:1sZvww:n6JBneIK01fd-XtJphpUBO07867ysjUhPTCXsVwPRbU','2024-08-16 17:20:18.335598'),('8c1vcvaxyxtr0tzbz9txoupq7kt0no93','.eJxVjEEOwiAQRe_C2hCZCgWX7j0DGWYGqRpISrsy3l2bdKHb_977LxVxXUpcu8xxYnVWRh1-t4T0kLoBvmO9NU2tLvOU9KbonXZ9bSzPy-7-HRTs5Vs7yyNBIJGBBwAQtGPKwaCRDBYJPLsAwafghsyUiR3bU7JWjmLEk3p_APyFONI:1sYsyj:hdQP-sv3PWdHL3yA9efPeR9IxWc_DG2vYNUTAUzynbM','2024-08-13 19:57:49.407519'),('8iyut64fk2r1qrczfws6iowd99fprc27','.eJxVjDsOwjAQBe_iGln2-pOEkp4zWOvdNQkgR4qTCnF3iJQC2jcz76USbuuYtiZLmlidFajT75aRHlJ3wHest1nTXNdlynpX9EGbvs4sz8vh_h2M2MZvjcH6QgJOKBjvBurQUwGbBQy6UMQMUKjvgYwl38UQOXN2PQNyiQ7V-wPzADh8:1sYsxI:WxnIKIfG-mj137VV7Be1Mg0ViSPrpvAHV2GyxmfA5g4','2024-08-13 19:56:20.994270'),('8xe4ko08jiz2wfvj9dpl703zux9u0743','.eJxVjEEOwiAQRe_C2hCZCgWX7j0DGWYGqRpISrsy3l2bdKHb_977LxVxXUpcu8xxYnVWRh1-t4T0kLoBvmO9NU2tLvOU9KbonXZ9bSzPy-7-HRTs5Vs7yyNBIJGBBwAQtGPKwaCRDBYJPLsAwafghsyUiR3bU7JWjmLEk3p_APyFONI:1sZvws:ExxTS5QCuFOp-mOkGVfJ2Yt4LXribmSceyWjn8xVo0E','2024-08-16 17:20:14.267316'),('98d1vq54wadvmv2whwese710hw7amqeq','.eJxVjEEOwiAQRe_C2hCZCgWX7j0DGWYGqRpISrsy3l2bdKHb_977LxVxXUpcu8xxYnVWRh1-t4T0kLoBvmO9NU2tLvOU9KbonXZ9bSzPy-7-HRTs5Vs7yyNBIJGBBwAQtGPKwaCRDBYJPLsAwafghsyUiR3bU7JWjmLEk3p_APyFONI:1sYsoL:mA9Pk_gr3t1orxbxZ3KS4fVj9J3z7GlWnOey84ZlTgE','2024-08-13 19:47:05.311158'),('c8vnmuirpamqljf5gd17u1tztmq4u6ye','.eJxVjDsOwjAQBe_iGln2-pOEkp4zWOvdNQkgR4qTCnF3iJQC2jcz76USbuuYtiZLmlidFajT75aRHlJ3wHest1nTXNdlynpX9EGbvs4sz8vh_h2M2MZvjcH6QgJOKBjvBurQUwGbBQy6UMQMUKjvgYwl38UQOXN2PQNyiQ7V-wPzADh8:1sYsS8:S8BmLobmNxxgXeHecNISdj8Tq-NNuhqR7zLd6hHL_wg','2024-08-13 19:24:08.925265'),('cct22opiff4ylg42a27jsoz3faq1yy7b','.eJxVjEEOwiAQRe_C2hCZCgWX7j0DGWYGqRpISrsy3l2bdKHb_977LxVxXUpcu8xxYnVWRh1-t4T0kLoBvmO9NU2tLvOU9KbonXZ9bSzPy-7-HRTs5Vs7yyNBIJGBBwAQtGPKwaCRDBYJPLsAwafghsyUiR3bU7JWjmLEk3p_APyFONI:1sYsDG:bOTxSuq9ZPFcw8g5se_2GdC3l2aRNHJVineooqNPlBg','2024-08-13 19:08:46.700307'),('dfzksvydcxa00pkf1bgt48g0ph0jbp3t','.eJxVjEEOwiAQRe_C2hCZCgWX7j0DGWYGqRpISrsy3l2bdKHb_977LxVxXUpcu8xxYnVWRh1-t4T0kLoBvmO9NU2tLvOU9KbonXZ9bSzPy-7-HRTs5Vs7yyNBIJGBBwAQtGPKwaCRDBYJPLsAwafghsyUiR3bU7JWjmLEk3p_APyFONI:1sYssX:V3YdvruKa0r4o728UYCChy48kdcrTEdxJJLk6vm3GCs','2024-08-13 19:51:25.708274'),('dovxejqu2ywy459fkbc5upywu43yhiny','.eJxVjEEOwiAQRe_C2hCZCgWX7j0DGWYGqRpISrsy3l2bdKHb_977LxVxXUpcu8xxYnVWRh1-t4T0kLoBvmO9NU2tLvOU9KbonXZ9bSzPy-7-HRTs5Vs7yyNBIJGBBwAQtGPKwaCRDBYJPLsAwafghsyUiR3bU7JWjmLEk3p_APyFONI:1sYtN9:N-16G9BDkrwZGLVhBvU5NTK492kyjuUmnOY5Gn8Y-Vc','2024-08-13 20:23:03.680208'),('ehxt8aiworw5muaml4787g7q56pjjemn','.eJxVjEEOwiAQRe_C2hCZCgWX7j0DGWYGqRpISrsy3l2bdKHb_977LxVxXUpcu8xxYnVWRh1-t4T0kLoBvmO9NU2tLvOU9KbonXZ9bSzPy-7-HRTs5Vs7yyNBIJGBBwAQtGPKwaCRDBYJPLsAwafghsyUiR3bU7JWjmLEk3p_APyFONI:1sZ6zj:DZ50cSWs0SRBocnwpLPaHEN9qyPTmg91YM1S2CICLeM','2024-08-14 10:55:47.604554'),('hg16efpkaib3joiljsn53qcck2d2v9ww','.eJxVjEEOwiAQRe_C2hCZCgWX7j0DGWYGqRpISrsy3l2bdKHb_977LxVxXUpcu8xxYnVWRh1-t4T0kLoBvmO9NU2tLvOU9KbonXZ9bSzPy-7-HRTs5Vs7yyNBIJGBBwAQtGPKwaCRDBYJPLsAwafghsyUiR3bU7JWjmLEk3p_APyFONI:1sYsQT:gqhKl6pnBGZPgBtWNF3I2FmIn5YzzZzP8ZFdz9tybt8','2024-08-13 19:22:25.315182'),('hjkfecs2uwqj9av7f6zsapm2c9mh6z4w','.eJxVjEEOwiAQRe_C2hCZCgWX7j0DGWYGqRpISrsy3l2bdKHb_977LxVxXUpcu8xxYnVWRh1-t4T0kLoBvmO9NU2tLvOU9KbonXZ9bSzPy-7-HRTs5Vs7yyNBIJGBBwAQtGPKwaCRDBYJPLsAwafghsyUiR3bU7JWjmLEk3p_APyFONI:1sYtqo:Nof7b0_dGGfd4nQViFHDva5yIvGzNQBYlo5ZwWXqXbI','2024-08-13 20:53:42.311676'),('htaavo8h8k1ihisur95ev1xy3ju0kg8y','.eJxVjEEOwiAQRe_C2hCZCgWX7j0DGWYGqRpISrsy3l2bdKHb_977LxVxXUpcu8xxYnVWRh1-t4T0kLoBvmO9NU2tLvOU9KbonXZ9bSzPy-7-HRTs5Vs7yyNBIJGBBwAQtGPKwaCRDBYJPLsAwafghsyUiR3bU7JWjmLEk3p_APyFONI:1sYtN6:coXg3BO69E9RaZl2IKx2LhSpMmHfcL57NI_Vt1LAvbc','2024-08-13 20:23:00.795651'),('iuqasujcfpic23o191939do67wkdegal','.eJxVjEEOwiAQRe_C2hCZCgWX7j0DGWYGqRpISrsy3l2bdKHb_977LxVxXUpcu8xxYnVWRh1-t4T0kLoBvmO9NU2tLvOU9KbonXZ9bSzPy-7-HRTs5Vs7yyNBIJGBBwAQtGPKwaCRDBYJPLsAwafghsyUiR3bU7JWjmLEk3p_APyFONI:1sZ5lX:k3FHahGM0f5mBBiyRAi43R42YDDdiFd4UwMJjrLjyR4','2024-08-14 09:37:03.284438'),('iyvri5a09v3d2388ucz8lat59gik91ef','.eJxVjEEOwiAQRe_C2hCZCgWX7j0DGWYGqRpISrsy3l2bdKHb_977LxVxXUpcu8xxYnVWRh1-t4T0kLoBvmO9NU2tLvOU9KbonXZ9bSzPy-7-HRTs5Vs7yyNBIJGBBwAQtGPKwaCRDBYJPLsAwafghsyUiR3bU7JWjmLEk3p_APyFONI:1sYtN9:N-16G9BDkrwZGLVhBvU5NTK492kyjuUmnOY5Gn8Y-Vc','2024-08-13 20:23:03.568157'),('jhlcfyl5j8k8lem298os8ikb6wt6fgrg','.eJxVjEEOwiAQRe_C2hCZCgWX7j0DGWYGqRpISrsy3l2bdKHb_977LxVxXUpcu8xxYnVWRh1-t4T0kLoBvmO9NU2tLvOU9KbonXZ9bSzPy-7-HRTs5Vs7yyNBIJGBBwAQtGPKwaCRDBYJPLsAwafghsyUiR3bU7JWjmLEk3p_APyFONI:1sZExs:0SUxmiy5CBNj9_pcxBnYAkwVPZQpN13_ZsZ0h6XvDSw','2024-08-14 19:26:24.580829'),('jufrq63mtt1d391j35ebsr4x49ea09b9','.eJxVjDsOwjAQBe_iGln2-pOEkp4zWOvdNQkgR4qTCnF3iJQC2jcz76USbuuYtiZLmlidFajT75aRHlJ3wHest1nTXNdlynpX9EGbvs4sz8vh_h2M2MZvjcH6QgJOKBjvBurQUwGbBQy6UMQMUKjvgYwl38UQOXN2PQNyiQ7V-wPzADh8:1sYmC1:8iorbObtTaqTujnSg774yINZD9LZyQsc31CUp8x1K3w','2024-08-13 12:43:05.993206'),('jur62h2p5fbdblsax887bmkyxnr1vwb2','.eJxVjDsOwjAQBe_iGln2-pOEkp4zWOvdNQkgR4qTCnF3iJQC2jcz76USbuuYtiZLmlidFajT75aRHlJ3wHest1nTXNdlynpX9EGbvs4sz8vh_h2M2MZvjcH6QgJOKBjvBurQUwGbBQy6UMQMUKjvgYwl38UQOXN2PQNyiQ7V-wPzADh8:1sZQYF:SBy1ANNtXolyZ13MLgqg16muQ8uMGa7gX6-PI2ZxqGg','2024-08-15 07:48:43.139494'),('k588s0348ggwy4tahco5a9vd8w6ixb3k','.eJxVjEEOwiAQRe_C2hCZCgWX7j0DGWYGqRpISrsy3l2bdKHb_977LxVxXUpcu8xxYnVWRh1-t4T0kLoBvmO9NU2tLvOU9KbonXZ9bSzPy-7-HRTs5Vs7yyNBIJGBBwAQtGPKwaCRDBYJPLsAwafghsyUiR3bU7JWjmLEk3p_APyFONI:1sYtN9:N-16G9BDkrwZGLVhBvU5NTK492kyjuUmnOY5Gn8Y-Vc','2024-08-13 20:23:03.569558'),('ke3akn01he3vud1biueenq0w6q6dba33','.eJxVjDsOwjAQBe_iGln2-pOEkp4zWOvdNQkgR4qTCnF3iJQC2jcz76USbuuYtiZLmlidFajT75aRHlJ3wHest1nTXNdlynpX9EGbvs4sz8vh_h2M2MZvjcH6QgJOKBjvBurQUwGbBQy6UMQMUKjvgYwl38UQOXN2PQNyiQ7V-wPzADh8:1sYuK7:H2z8GaOy2X43qRwLkndKt2HkO8bZrqSwxC3FCooH1Ps','2024-08-13 21:23:59.138670'),('l0jkzbc9acfgghnpx5pisaij82ehvblm','.eJxVjEEOwiAQRe_C2hCZCgWX7j0DGWYGqRpISrsy3l2bdKHb_977LxVxXUpcu8xxYnVWRh1-t4T0kLoBvmO9NU2tLvOU9KbonXZ9bSzPy-7-HRTs5Vs7yyNBIJGBBwAQtGPKwaCRDBYJPLsAwafghsyUiR3bU7JWjmLEk3p_APyFONI:1sYtN6:coXg3BO69E9RaZl2IKx2LhSpMmHfcL57NI_Vt1LAvbc','2024-08-13 20:23:00.172687'),('l4jxas6lm0mtea4er9hf97whea6paiq3','.eJxVjDsOwjAQBe_iGln2-pOEkp4zWOvdNQkgR4qTCnF3iJQC2jcz76USbuuYtiZLmlidFajT75aRHlJ3wHest1nTXNdlynpX9EGbvs4sz8vh_h2M2MZvjcH6QgJOKBjvBurQUwGbBQy6UMQMUKjvgYwl38UQOXN2PQNyiQ7V-wPzADh8:1sZEcr:PmL9x6mr-anRhzn7pmloY1PPu-RMkXZcxjzyMAre1q0','2024-08-14 19:04:41.961867'),('lvcnwbg2y3h78oos9u0rotm36eyemp7d','.eJxVjDsOwjAQBe_iGln2-pOEkp4zWOvdNQkgR4qTCnF3iJQC2jcz76USbuuYtiZLmlidFajT75aRHlJ3wHest1nTXNdlynpX9EGbvs4sz8vh_h2M2MZvjcH6QgJOKBjvBurQUwGbBQy6UMQMUKjvgYwl38UQOXN2PQNyiQ7V-wPzADh8:1sZvyx:fCvpu5qwOmMe9fMr2MvS5NYXf5b7rpyq09ARWzv9jzQ','2024-08-16 17:22:23.512692'),('lx8bt8zn8aw9ihuaqdhev6psmjk39wz6','.eJxVjDsOwjAQBe_iGln-J6ak5wzWrneDA8iR4qRC3B0spYD2zcx7iQT7VtLeeE0zibOw4vS7IeQH1w7oDvW2yLzUbZ1RdkUetMnrQvy8HO7fQYFWeu0MBKOVRzTWKW2JlcowKQMeox_jwGPWdgpfkhnJgEMdQ8bBRkMYxfsD1ss35A:1sYuPJ:FLyYcAPgYqTZqdoelE_XVSE0Cf58wCaIjnWkjzKxh88','2024-08-13 21:29:21.908897'),('m1y2ebh8aahkn5d89ct9fuez79gfgbbx','.eJxVjEEOwiAQRe_C2hCZCgWX7j0DGWYGqRpISrsy3l2bdKHb_977LxVxXUpcu8xxYnVWRh1-t4T0kLoBvmO9NU2tLvOU9KbonXZ9bSzPy-7-HRTs5Vs7yyNBIJGBBwAQtGPKwaCRDBYJPLsAwafghsyUiR3bU7JWjmLEk3p_APyFONI:1sYuN0:ryjnw2A1RK1ll7qaOQyMFH65SOd3miIpnlsALkEPguM','2024-08-13 21:26:58.831415'),('mtrdfiml8gt1cjf74uxtks4ybabu065m','.eJxVjEEOwiAQRe_C2hCZCgWX7j0DGWYGqRpISrsy3l2bdKHb_977LxVxXUpcu8xxYnVWRh1-t4T0kLoBvmO9NU2tLvOU9KbonXZ9bSzPy-7-HRTs5Vs7yyNBIJGBBwAQtGPKwaCRDBYJPLsAwafghsyUiR3bU7JWjmLEk3p_APyFONI:1sYtN9:N-16G9BDkrwZGLVhBvU5NTK492kyjuUmnOY5Gn8Y-Vc','2024-08-13 20:23:03.601440'),('n85sdtojaosr4j1a6jhpw8bmto8lunhm','.eJxVjEEOwiAQRe_C2hCZCgWX7j0DGWYGqRpISrsy3l2bdKHb_977LxVxXUpcu8xxYnVWRh1-t4T0kLoBvmO9NU2tLvOU9KbonXZ9bSzPy-7-HRTs5Vs7yyNBIJGBBwAQtGPKwaCRDBYJPLsAwafghsyUiR3bU7JWjmLEk3p_APyFONI:1sZE9l:J5cbqv4SuNV5Hzgw12s2OwF2t9rhRzBGEDJgIdJ6Qw8','2024-08-14 18:34:37.797152'),('na9jlcveq7vxzn40ak3dtg9p4ct3zo2v','.eJxVjEEOwiAQRe_C2hCZCgWX7j0DGWYGqRpISrsy3l2bdKHb_977LxVxXUpcu8xxYnVWRh1-t4T0kLoBvmO9NU2tLvOU9KbonXZ9bSzPy-7-HRTs5Vs7yyNBIJGBBwAQtGPKwaCRDBYJPLsAwafghsyUiR3bU7JWjmLEk3p_APyFONI:1sYtOZ:ZIrsb_xrDe9Er69S33iP3YmRgm25Cz1zhcP3HgSJjBs','2024-08-13 20:24:31.288994'),('o4l2o76aaf3hn1u4lnurx4m9egn79l12','.eJxVjEEOwiAQRe_C2hCZCgWX7j0DGWYGqRpISrsy3l2bdKHb_977LxVxXUpcu8xxYnVWRh1-t4T0kLoBvmO9NU2tLvOU9KbonXZ9bSzPy-7-HRTs5Vs7yyNBIJGBBwAQtGPKwaCRDBYJPLsAwafghsyUiR3bU7JWjmLEk3p_APyFONI:1sYm8Z:pPMmSErTyTbXEQD3UFnVjDHxmkHYxCv99N3BARtaa1M','2024-08-13 12:39:31.212049'),('pioz1z2um7opq89g0e9d0e4963faxy0x','.eJxVjEEOwiAQRe_C2hCZCgWX7j0DGWYGqRpISrsy3l2bdKHb_977LxVxXUpcu8xxYnVWRh1-t4T0kLoBvmO9NU2tLvOU9KbonXZ9bSzPy-7-HRTs5Vs7yyNBIJGBBwAQtGPKwaCRDBYJPLsAwafghsyUiR3bU7JWjmLEk3p_APyFONI:1sXbkg:CibYOMKzsTiTc6n74adEQCsy48HbqyY_VhI9RxvOqRQ','2024-08-10 07:22:02.766019'),('pvmy3gokocc3q8yqxobgv899douqfoth','.eJxVjEEOwiAQRe_C2hCZCgWX7j0DGWYGqRpISrsy3l2bdKHb_977LxVxXUpcu8xxYnVWRh1-t4T0kLoBvmO9NU2tLvOU9KbonXZ9bSzPy-7-HRTs5Vs7yyNBIJGBBwAQtGPKwaCRDBYJPLsAwafghsyUiR3bU7JWjmLEk3p_APyFONI:1sYr7C:NZ9XhAsvMgeHY9qGzuFfFtykmKc2DywfpWvnMvnDX_Y','2024-08-13 17:58:26.029952'),('pz4fwddks1mbsqdhv90rm8l4j0gsp1hl','.eJxVjEEOwiAQRe_C2hCZCgWX7j0DGWYGqRpISrsy3l2bdKHb_977LxVxXUpcu8xxYnVWRh1-t4T0kLoBvmO9NU2tLvOU9KbonXZ9bSzPy-7-HRTs5Vs7yyNBIJGBBwAQtGPKwaCRDBYJPLsAwafghsyUiR3bU7JWjmLEk3p_APyFONI:1sZlsQ:__s__nXXs_Sx1b1jzchitPZ_uLBfPIVIxUU47m4vR9U','2024-08-16 06:34:58.031759'),('qyk9v2zjs77tfy0ggwrw9u9hydgaa0fd','.eJxVjDsOwjAQBe_iGln2-pOEkp4zWOvdNQkgR4qTCnF3iJQC2jcz76USbuuYtiZLmlidFajT75aRHlJ3wHest1nTXNdlynpX9EGbvs4sz8vh_h2M2MZvjcH6QgJOKBjvBurQUwGbBQy6UMQMUKjvgYwl38UQOXN2PQNyiQ7V-wPzADh8:1sZSvr:6spC0x1UA2lRxpqXq2Y_jtdgtimVQx-sk6HRWnL4k_o','2024-08-15 10:21:15.635876'),('r1il9yoa6d5srw94a0xc509kei8p6nu6','.eJxVjEEOwiAQRe_C2hCZCgWX7j0DGWYGqRpISrsy3l2bdKHb_977LxVxXUpcu8xxYnVWRh1-t4T0kLoBvmO9NU2tLvOU9KbonXZ9bSzPy-7-HRTs5Vs7yyNBIJGBBwAQtGPKwaCRDBYJPLsAwafghsyUiR3bU7JWjmLEk3p_APyFONI:1sYsoI:j9-qgnwHeU_U5s8MRjc9f_0UR9e9PpzkjdrBkzFyYeM','2024-08-13 19:47:02.020024'),('tw5ug4nvyp1tn2kaszrb0x7x7bm2tmym','.eJxVjDsOwjAQBe_iGln-J6ak5wzWrneDA8iR4qRC3B0spYD2zcx7iQT7VtLeeE0zibOw4vS7IeQH1w7oDvW2yLzUbZ1RdkUetMnrQvy8HO7fQYFWeu0MBKOVRzTWKW2JlcowKQMeox_jwGPWdgpfkhnJgEMdQ8bBRkMYxfsD1ss35A:1sYu6R:EEdBxmiTH3wVHoDNPG8ORW78-ncTecQbABrMrJE6iBE','2024-08-13 21:09:51.575668'),('u7h8p3ielv57u2i38b7lnayq6o3uaw64','.eJxVjEEOwiAQRe_C2hCZCgWX7j0DGWYGqRpISrsy3l2bdKHb_977LxVxXUpcu8xxYnVWRh1-t4T0kLoBvmO9NU2tLvOU9KbonXZ9bSzPy-7-HRTs5Vs7yyNBIJGBBwAQtGPKwaCRDBYJPLsAwafghsyUiR3bU7JWjmLEk3p_APyFONI:1sZTyN:Zl2v8tHIGc-0oWZSNgBTZf8DEP2ibxyJctuMAs8Rz-s','2024-08-15 11:27:55.032585'),('ub75fy0rlw6fo6c31er1difb3jmafnhd','.eJxVjDsOwjAQBe_iGln2-pOEkp4zWOvdNQkgR4qTCnF3iJQC2jcz76USbuuYtiZLmlidFajT75aRHlJ3wHest1nTXNdlynpX9EGbvs4sz8vh_h2M2MZvjcH6QgJOKBjvBurQUwGbBQy6UMQMUKjvgYwl38UQOXN2PQNyiQ7V-wPzADh8:1sYr6D:fmV0baEFWehHWh3jmDe1xFzZDfC52FnYhlOASvv1mWc','2024-08-13 17:57:25.963301'),('usplqj37kren1aeyxzh73e7pi5hi67dw','.eJxVjEEOwiAQRe_C2hCZCgWX7j0DGWYGqRpISrsy3l2bdKHb_977LxVxXUpcu8xxYnVWRh1-t4T0kLoBvmO9NU2tLvOU9KbonXZ9bSzPy-7-HRTs5Vs7yyNBIJGBBwAQtGPKwaCRDBYJPLsAwafghsyUiR3bU7JWjmLEk3p_APyFONI:1sZEGr:01IQhd4exMowKm0wOUHSaCRjoeQnwXactwVfHFUGyAY','2024-08-14 18:41:57.828664'),('v6gvlfbcxj7b1xv26msccv7umq7bhz6u','.eJxVjEEOwiAQRe_C2hCZCgWX7j0DGWYGqRpISrsy3l2bdKHb_977LxVxXUpcu8xxYnVWRh1-t4T0kLoBvmO9NU2tLvOU9KbonXZ9bSzPy-7-HRTs5Vs7yyNBIJGBBwAQtGPKwaCRDBYJPLsAwafghsyUiR3bU7JWjmLEk3p_APyFONI:1sYuMf:53hT8txwOqi9xuN_koyaKAOAMqV4I8_MCthVE8rAVMg','2024-08-13 21:26:37.862408'),('vdou4k5da7envatgoixowwg4yhn24w3s','.eJxVjEEOwiAQRe_C2hCZCgWX7j0DGWYGqRpISrsy3l2bdKHb_977LxVxXUpcu8xxYnVWRh1-t4T0kLoBvmO9NU2tLvOU9KbonXZ9bSzPy-7-HRTs5Vs7yyNBIJGBBwAQtGPKwaCRDBYJPLsAwafghsyUiR3bU7JWjmLEk3p_APyFONI:1sYm7h:eL2fltPDn0aWyUnh5X9Y-LnVyW7FCyX9ARRm-okrif8','2024-08-13 12:38:37.733044'),('vge4nyua181055pntcfhil2mw4xdh3bg','.eJxVjEEOwiAQRe_C2hCZCgWX7j0DGWYGqRpISrsy3l2bdKHb_977LxVxXUpcu8xxYnVWRh1-t4T0kLoBvmO9NU2tLvOU9KbonXZ9bSzPy-7-HRTs5Vs7yyNBIJGBBwAQtGPKwaCRDBYJPLsAwafghsyUiR3bU7JWjmLEk3p_APyFONI:1sYn1I:UXwDs3ewO8R7r8LZNK7gLPUBvHhEpUysC7cXezjnZ0A','2024-08-13 13:36:04.676170'),('w6b56lunr75puq39vjo97h4vl9q67ao3','.eJxVjEEOwiAQRe_C2hCZCgWX7j0DGWYGqRpISrsy3l2bdKHb_977LxVxXUpcu8xxYnVWRh1-t4T0kLoBvmO9NU2tLvOU9KbonXZ9bSzPy-7-HRTs5Vs7yyNBIJGBBwAQtGPKwaCRDBYJPLsAwafghsyUiR3bU7JWjmLEk3p_APyFONI:1sZVsf:gGaoQW-Brp0dPAKGMNWZhm0FZ8AJGX_C9VkYykKCLUw','2024-08-15 13:30:09.238694'),('w8uc59jbi6hseftu33uxdvtle1ukg0uy','.eJxVjDsOwjAQBe_iGln2-pOEkp4zWOvdNQkgR4qTCnF3iJQC2jcz76USbuuYtiZLmlidFajT75aRHlJ3wHest1nTXNdlynpX9EGbvs4sz8vh_h2M2MZvjcH6QgJOKBjvBurQUwGbBQy6UMQMUKjvgYwl38UQOXN2PQNyiQ7V-wPzADh8:1sYr6D:fmV0baEFWehHWh3jmDe1xFzZDfC52FnYhlOASvv1mWc','2024-08-13 17:57:25.958090'),('y2ghy4aiix4xusgri3mv00861xbkvpsz','.eJxVjDsOwjAQBe_iGln2-pOEkp4zWOvdNQkgR4qTCnF3iJQC2jcz76USbuuYtiZLmlidFajT75aRHlJ3wHest1nTXNdlynpX9EGbvs4sz8vh_h2M2MZvjcH6QgJOKBjvBurQUwGbBQy6UMQMUKjvgYwl38UQOXN2PQNyiQ7V-wPzADh8:1sYsof:ARjuvXY8a5z4sh5es84zwCvjFfnW-QeqqK3XwnnGPu0','2024-08-13 19:47:25.293609'),('yfquyit291rskkmtg842vpat9xixjq0r','.eJxVjEEOwiAQRe_C2hCZCgWX7j0DGWYGqRpISrsy3l2bdKHb_977LxVxXUpcu8xxYnVWRh1-t4T0kLoBvmO9NU2tLvOU9KbonXZ9bSzPy-7-HRTs5Vs7yyNBIJGBBwAQtGPKwaCRDBYJPLsAwafghsyUiR3bU7JWjmLEk3p_APyFONI:1sZFMP:6HVs8gYfN8zT-AK5WHF3H3tfoQ0Gb3P1tDST4KxZpBQ','2024-08-14 19:51:45.579754'),('yn9rwgmz54mpqf1erogrzldmlb0uuycr','.eJxVjEEOwiAQRe_C2hCZCgWX7j0DGWYGqRpISrsy3l2bdKHb_977LxVxXUpcu8xxYnVWRh1-t4T0kLoBvmO9NU2tLvOU9KbonXZ9bSzPy-7-HRTs5Vs7yyNBIJGBBwAQtGPKwaCRDBYJPLsAwafghsyUiR3bU7JWjmLEk3p_APyFONI:1sZRrg:gsqCr28u5_nqSpwGFJx270WJZMHXg3c33DEuchaqzcM','2024-08-15 09:12:52.925950'),('z2odk2zo6497vsj96ofedubitdw8ckfk','.eJxVjEEOwiAQRe_C2hCZCgWX7j0DGWYGqRpISrsy3l2bdKHb_977LxVxXUpcu8xxYnVWRh1-t4T0kLoBvmO9NU2tLvOU9KbonXZ9bSzPy-7-HRTs5Vs7yyNBIJGBBwAQtGPKwaCRDBYJPLsAwafghsyUiR3bU7JWjmLEk3p_APyFONI:1sZDVR:5OwdSkQGn_MOE2yTlLA2RbDczIVB_3YFNGy5-8RPNi8','2024-08-14 17:52:57.301166');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_site` (
  `id` int NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
-- Table structure for table `price_change_percentage`
--

DROP TABLE IF EXISTS `price_change_percentage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `price_change_percentage` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ticker` varchar(10) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `change_period` enum('24_hours','30_days','1_year') DEFAULT NULL,
  `percentage_change` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=661 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `price_change_percentage`
--

LOCK TABLES `price_change_percentage` WRITE;
/*!40000 ALTER TABLE `price_change_percentage` DISABLE KEYS */;
INSERT INTO `price_change_percentage` VALUES (601,'AAPL','2024-08-02','24_hours',2.37223),(602,'ADBE','2024-08-02','24_hours',-4.49479),(603,'AMZN','2024-08-02','24_hours',-10.1972),(604,'AVGO','2024-08-02','24_hours',-3.21045),(605,'COST','2024-08-02','24_hours',0.128536),(606,'CSCO','2024-08-02','24_hours',-2.0574),(607,'GOOGL','2024-08-02','24_hours',-3.19161),(608,'INTC','2024-08-02','24_hours',-27.146),(609,'JPM','2024-08-02','24_hours',-4.71725),(610,'MA','2024-08-02','24_hours',-0.352501),(611,'META','2024-08-02','24_hours',-2.17583),(612,'MSFT','2024-08-02','24_hours',-2.7283),(613,'NFLX','2024-08-02','24_hours',-1.76522),(614,'NKE','2024-08-02','24_hours',-0.534868),(615,'NVDA','2024-08-02','24_hours',-3.9099),(616,'PEP','2024-08-02','24_hours',1.52035),(617,'PYPL','2024-08-02','24_hours',-5.11407),(618,'TM','2024-08-02','24_hours',-3.76389),(619,'TSLA','2024-08-02','24_hours',-4.68044),(620,'V','2024-08-02','24_hours',-0.3892),(621,'AAPL','2024-08-02','30_days',1.48454),(622,'ADBE','2024-08-02','30_days',-8.07807),(623,'AMZN','2024-08-02','30_days',-17.35),(624,'AVGO','2024-08-02','30_days',-14.1468),(625,'COST','2024-08-02','30_days',-4.68433),(626,'CSCO','2024-08-02','30_days',-0.988515),(627,'GOOGL','2024-08-02','30_days',-10.759),(628,'INTC','2024-08-02','30_days',-31.8825),(629,'JPM','2024-08-02','30_days',-4.58833),(630,'MA','2024-08-02','30_days',3.78115),(631,'META','2024-08-02','30_days',-4.43376),(632,'MSFT','2024-08-02','30_days',-11.6596),(633,'NFLX','2024-08-02','30_days',-9.67657),(634,'NKE','2024-08-02','30_days',-3.39953),(635,'NVDA','2024-08-02','30_days',-14.4534),(636,'PEP','2024-08-02','30_days',8.58296),(637,'PYPL','2024-08-02','30_days',5.08733),(638,'TM','2024-08-02','30_days',-16.4299),(639,'TSLA','2024-08-02','30_days',-10.6158),(640,'V','2024-08-02','30_days',-1.24334),(641,'AAPL','2024-08-02','1_year',1.48454),(642,'ADBE','2024-08-02','1_year',-8.07807),(643,'AMZN','2024-08-02','1_year',-17.35),(644,'AVGO','2024-08-02','1_year',-14.1468),(645,'COST','2024-08-02','1_year',-4.68433),(646,'CSCO','2024-08-02','1_year',-0.988515),(647,'GOOGL','2024-08-02','1_year',-10.759),(648,'INTC','2024-08-02','1_year',-31.8825),(649,'JPM','2024-08-02','1_year',-4.58833),(650,'MA','2024-08-02','1_year',3.78115),(651,'META','2024-08-02','1_year',-4.43376),(652,'MSFT','2024-08-02','1_year',-11.6596),(653,'NFLX','2024-08-02','1_year',-9.67657),(654,'NKE','2024-08-02','1_year',-3.39953),(655,'NVDA','2024-08-02','1_year',-14.4534),(656,'PEP','2024-08-02','1_year',8.58296),(657,'PYPL','2024-08-02','1_year',5.08733),(658,'TM','2024-08-02','1_year',-16.4299),(659,'TSLA','2024-08-02','1_year',-10.6158),(660,'V','2024-08-02','1_year',-1.24334);
/*!40000 ALTER TABLE `price_change_percentage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialaccount`
--

DROP TABLE IF EXISTS `socialaccount_socialaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socialaccount_socialaccount` (
  `id` int NOT NULL AUTO_INCREMENT,
  `provider` varchar(200) NOT NULL,
  `uid` varchar(191) NOT NULL,
  `last_login` datetime(6) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `extra_data` json NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialaccount_provider_uid_fc810c6e_uniq` (`provider`,`uid`),
  KEY `socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id` (`user_id`),
  CONSTRAINT `socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socialaccount_socialapp` (
  `id` int NOT NULL AUTO_INCREMENT,
  `provider` varchar(30) NOT NULL,
  `name` varchar(40) NOT NULL,
  `client_id` varchar(191) NOT NULL,
  `secret` varchar(191) NOT NULL,
  `key` varchar(191) NOT NULL,
  `provider_id` varchar(200) NOT NULL,
  `settings` json NOT NULL DEFAULT (_utf8mb3'{}'),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socialaccount_socialapp_sites` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `socialapp_id` int NOT NULL,
  `site_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialapp_sites_socialapp_id_site_id_71a9a768_uniq` (`socialapp_id`,`site_id`),
  KEY `socialaccount_socialapp_sites_site_id_2579dee5_fk_django_site_id` (`site_id`),
  CONSTRAINT `socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc` FOREIGN KEY (`socialapp_id`) REFERENCES `socialaccount_socialapp` (`id`),
  CONSTRAINT `socialaccount_socialapp_sites_site_id_2579dee5_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socialaccount_socialtoken` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` longtext NOT NULL,
  `token_secret` longtext NOT NULL,
  `expires_at` datetime(6) DEFAULT NULL,
  `account_id` int NOT NULL,
  `app_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq` (`app_id`,`account_id`),
  KEY `socialaccount_social_account_id_951f210e_fk_socialacc` (`account_id`),
  CONSTRAINT `socialaccount_social_account_id_951f210e_fk_socialacc` FOREIGN KEY (`account_id`) REFERENCES `socialaccount_socialaccount` (`id`),
  CONSTRAINT `socialaccount_social_app_id_636a42d7_fk_socialacc` FOREIGN KEY (`app_id`) REFERENCES `socialaccount_socialapp` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialtoken`
--

LOCK TABLES `socialaccount_socialtoken` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialtoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stocks`
--

DROP TABLE IF EXISTS `stocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stocks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ticker` varchar(10) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `open` float DEFAULT NULL,
  `high` float DEFAULT NULL,
  `low` float DEFAULT NULL,
  `close` float DEFAULT NULL,
  `volume` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=521 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stocks`
--

LOCK TABLES `stocks` WRITE;
/*!40000 ALTER TABLE `stocks` DISABLE KEYS */;
INSERT INTO `stocks` VALUES (1,'AAPL','2024-07-02',216.15,220.38,215.1,220.27,58046200),(2,'AAPL','2024-07-03',220,221.55,219.03,221.55,37369800),(3,'AAPL','2024-07-05',221.65,226.45,221.65,226.34,60412400),(4,'AAPL','2024-07-08',227.09,227.85,223.25,227.82,59085900),(5,'AAPL','2024-07-09',227.93,229.4,226.37,228.68,48076100),(6,'AAPL','2024-07-10',229.3,233.08,229.25,232.98,62627700),(7,'AAPL','2024-07-11',231.39,232.39,225.77,227.57,64710600),(8,'AAPL','2024-07-12',228.92,232.64,228.68,230.54,53046500),(9,'AAPL','2024-07-15',236.48,237.23,233.09,234.4,62631300),(10,'AAPL','2024-07-16',235,236.27,232.33,234.82,43234300),(11,'AAPL','2024-07-17',229.45,231.46,226.64,228.88,57345900),(12,'AAPL','2024-07-18',230.28,230.44,222.27,224.18,66034600),(13,'AAPL','2024-07-19',224.82,226.8,223.28,224.31,49151500),(14,'AAPL','2024-07-22',227.01,227.78,223.09,223.96,48201800),(15,'AAPL','2024-07-23',224.37,226.94,222.68,225.01,39960300),(16,'AAPL','2024-07-24',224,224.8,217.13,218.54,61777600),(17,'AAPL','2024-07-25',218.93,220.85,214.62,217.49,51391200),(18,'AAPL','2024-07-26',218.7,219.49,216.01,217.96,41601300),(19,'AAPL','2024-07-29',216.96,219.3,215.75,218.24,36311800),(20,'AAPL','2024-07-30',219.19,220.33,216.12,218.8,41643800),(21,'AAPL','2024-07-31',221.44,223.82,220.63,222.08,50036300),(23,'MSFT','2024-07-02',453.2,459.59,453.11,459.28,13979800),(24,'MSFT','2024-07-03',458.19,461.02,457.88,460.77,9932800),(25,'MSFT','2024-07-05',459.61,468.35,458.97,467.56,16000300),(26,'MSFT','2024-07-08',466.55,467.7,464.46,466.24,12962300),(27,'MSFT','2024-07-09',467,467.33,458,459.54,17207200),(28,'MSFT','2024-07-10',461.22,466.46,458.86,466.25,18196100),(29,'MSFT','2024-07-11',462.98,464.78,451.55,454.7,23111200),(30,'MSFT','2024-07-12',454.33,456.36,450.65,453.55,16324300),(31,'MSFT','2024-07-15',453.3,457.26,451.43,453.96,14429400),(32,'MSFT','2024-07-16',454.22,454.3,446.66,449.52,17175700),(33,'MSFT','2024-07-17',442.59,444.85,439.18,443.52,21778000),(34,'MSFT','2024-07-18',444.34,444.65,434.4,440.37,20794800),(35,'MSFT','2024-07-19',433.1,441.14,432,437.11,20940400),(36,'MSFT','2024-07-22',441.79,444.6,438.91,442.94,15808800),(37,'MSFT','2024-07-23',443.9,448.39,443.1,444.85,13107100),(38,'MSFT','2024-07-24',440.45,441.48,427.59,428.9,26805800),(39,'MSFT','2024-07-25',428.8,429.8,417.51,418.4,29943800),(40,'MSFT','2024-07-26',418.2,428.92,417.27,425.27,23583800),(41,'MSFT','2024-07-29',431.58,432.15,424.7,426.73,15125800),(42,'MSFT','2024-07-30',427.72,429.05,417.36,422.92,32687600),(43,'MSFT','2024-07-31',420.5,421.78,412.21,418.35,42891400),(45,'GOOGL','2024-07-02',182.05,185.57,181.56,185.24,17372500),(46,'GOOGL','2024-07-03',184.85,186.09,184,185.82,10242100),(47,'GOOGL','2024-07-05',185.86,190.86,185.8,190.6,20967500),(48,'GOOGL','2024-07-08',189.9,190.17,187.78,189.03,21035900),(49,'GOOGL','2024-07-09',190.31,191.36,188.72,188.98,15121400),(50,'GOOGL','2024-07-10',189.15,191.75,189.03,191.18,15952500),(51,'GOOGL','2024-07-11',189.85,190.86,185.08,185.57,25625800),(52,'GOOGL','2024-07-12',185.08,187.11,184.49,185.07,22898400),(53,'GOOGL','2024-07-15',184.92,188.24,184.92,186.53,16474000),(54,'GOOGL','2024-07-16',187.36,188.68,183.37,183.92,18290700),(55,'GOOGL','2024-07-17',182.97,183.55,179.9,181.02,20734100),(56,'GOOGL','2024-07-18',181.93,182.5,176.47,177.69,25315700),(57,'GOOGL','2024-07-19',178.88,180.29,177.13,177.66,18881900),(58,'GOOGL','2024-07-22',180.59,182.7,180.23,181.67,24100300),(59,'GOOGL','2024-07-23',182.05,183.61,181.54,181.79,36352700),(60,'GOOGL','2024-07-24',173.6,176.19,171.82,172.63,49585200),(61,'GOOGL','2024-07-25',172.52,173.42,167.19,167.28,44852000),(62,'GOOGL','2024-07-26',167.15,168.09,164.06,167,41336900),(63,'GOOGL','2024-07-29',168.83,170.43,167.99,169.53,20293800),(64,'GOOGL','2024-07-30',170.24,171.23,168.44,170.29,18959700),(65,'GOOGL','2024-07-31',173.24,174.25,170.01,171.54,25729100),(67,'AMZN','2024-07-02',197.28,200.43,195.93,200,45600000),(68,'AMZN','2024-07-03',199.94,200.03,196.76,197.59,31597900),(69,'AMZN','2024-07-05',198.65,200.55,198.17,200,39858900),(70,'AMZN','2024-07-08',200.04,201.2,197.96,199.29,34767300),(71,'AMZN','2024-07-09',199.4,200.57,199.05,199.34,32700100),(72,'AMZN','2024-07-10',200,200.11,197.69,199.79,32883800),(73,'AMZN','2024-07-11',200.09,200.27,192.86,195.05,44565000),(74,'AMZN','2024-07-12',194.8,196.47,193.83,194.49,30598500),(75,'AMZN','2024-07-15',194.56,196.19,190.83,192.72,40683200),(76,'AMZN','2024-07-16',195.59,196.62,192.24,193.02,33994700),(77,'AMZN','2024-07-17',191.35,191.58,185.99,187.93,48076100),(78,'AMZN','2024-07-18',189.59,189.68,181.45,183.75,51043600),(79,'AMZN','2024-07-19',181.14,184.93,180.11,183.13,43081800),(80,'AMZN','2024-07-22',185,185.06,182.48,182.55,39931900),(81,'AMZN','2024-07-23',184.1,189.39,183.56,186.41,47537700),(82,'AMZN','2024-07-24',183.2,185.45,180.41,180.83,41532400),(83,'AMZN','2024-07-25',182.91,183.9,176.8,179.85,44464200),(84,'AMZN','2024-07-26',180.39,183.19,180.24,182.5,29506000),(85,'AMZN','2024-07-29',183.84,184.75,182.38,183.2,33270100),(86,'AMZN','2024-07-30',184.72,185.86,179.38,181.71,39508600),(87,'AMZN','2024-07-31',185.05,187.94,184.46,186.98,41667300),(89,'TSLA','2024-07-02',218.89,231.3,218.06,231.26,205047900),(90,'TSLA','2024-07-03',234.56,248.35,234.25,246.39,166561500),(91,'TSLA','2024-07-05',249.81,252.37,242.46,251.52,154501200),(92,'TSLA','2024-07-08',247.71,259.44,244.57,252.94,157219600),(93,'TSLA','2024-07-09',251,265.61,250.3,262.33,160210900),(94,'TSLA','2024-07-10',262.8,267.59,257.86,263.26,128519400),(95,'TSLA','2024-07-11',263.3,271,239.65,241.03,221707300),(96,'TSLA','2024-07-12',235.8,251.84,233.09,248.23,155955800),(97,'TSLA','2024-07-15',255.97,265.6,251.73,252.64,146912900),(98,'TSLA','2024-07-16',255.31,258.62,245.8,256.56,126332500),(99,'TSLA','2024-07-17',252.73,258.47,246.18,248.5,115584800),(100,'TSLA','2024-07-18',251.09,257.14,247.2,249.23,110869000),(101,'TSLA','2024-07-19',247.79,249.44,236.83,239.2,87403900),(102,'TSLA','2024-07-22',244.21,253.21,243.75,251.51,101225400),(103,'TSLA','2024-07-23',253.6,255.76,245.63,246.38,111928200),(104,'TSLA','2024-07-24',225.42,225.99,214.71,215.99,167942900),(105,'TSLA','2024-07-25',216.8,226,216.23,220.25,100636500),(106,'TSLA','2024-07-26',221.19,222.28,215.33,219.8,94604100),(107,'TSLA','2024-07-29',224.9,234.27,224.7,232.1,129201800),(108,'TSLA','2024-07-30',232.25,232.41,220,222.62,100560300),(109,'TSLA','2024-07-31',227.9,234.68,226.79,232.07,67497000),(111,'META','2024-07-02',500.76,510.5,499.45,509.5,7739500),(112,'META','2024-07-03',506.37,511.28,506.02,509.96,6005600),(113,'META','2024-07-05',511.6,540.87,511.6,539.91,21354100),(114,'META','2024-07-08',542.35,542.81,526.65,529.32,14917500),(115,'META','2024-07-09',533.75,537.48,528.19,530,8753200),(116,'META','2024-07-10',530.79,538.88,528.36,534.69,10983300),(117,'META','2024-07-11',530.89,535.46,508.37,512.7,16458300),(118,'META','2024-07-12',497.76,508.09,494.23,498.87,19750500),(119,'META','2024-07-15',498.63,506.68,493.37,496.16,12539200),(120,'META','2024-07-16',501.5,503.95,485.79,489.79,14075800),(121,'META','2024-07-17',479.17,479.17,459.12,461.99,28076600),(122,'META','2024-07-18',475,479.24,464.54,475.85,19267200),(123,'META','2024-07-19',476.06,486.71,475.71,476.79,15149400),(124,'META','2024-07-22',486.58,492.06,483.9,487.4,12023100),(125,'META','2024-07-23',489.84,495.22,487.72,488.69,9455500),(126,'META','2024-07-24',472.31,476.3,460.58,461.27,17649700),(127,'META','2024-07-25',463.26,463.55,442.65,453.41,18240500),(128,'META','2024-07-26',464.2,469.77,459.42,465.7,14222400),(129,'META','2024-07-29',469.88,473.96,465.02,465.71,11339600),(130,'META','2024-07-30',467,472.73,456.7,463.19,11390400),(131,'META','2024-07-31',471.02,476.5,466.75,474.83,24285800),(133,'NVDA','2024-07-02',121.13,123.41,121.03,122.67,218374000),(134,'NVDA','2024-07-03',121.66,128.28,121.36,128.28,215749000),(135,'NVDA','2024-07-05',127.38,128.85,125.68,125.83,214176700),(136,'NVDA','2024-07-08',127.49,130.77,127.04,128.2,237677300),(137,'NVDA','2024-07-09',130.35,133.82,128.65,131.38,285366600),(138,'NVDA','2024-07-10',134.03,135.1,132.42,134.91,248978600),(139,'NVDA','2024-07-11',135.75,136.15,127.05,127.4,374782700),(140,'NVDA','2024-07-12',128.26,131.92,127.22,129.24,252680500),(141,'NVDA','2024-07-15',130.56,131.39,127.18,128.44,208326200),(142,'NVDA','2024-07-16',128.44,129.04,124.58,126.36,214769500),(143,'NVDA','2024-07-17',121.35,121.85,116.72,117.99,390086200),(144,'NVDA','2024-07-18',121.85,122.4,116.56,121.09,320979500),(145,'NVDA','2024-07-19',120.35,121.6,117.37,117.93,217223800),(146,'NVDA','2024-07-22',120.35,124.07,119.86,123.54,258068900),(147,'NVDA','2024-07-23',122.78,124.69,122.1,122.59,173911000),(148,'NVDA','2024-07-24',119.17,119.95,113.44,114.25,327776900),(149,'NVDA','2024-07-25',113.04,116.63,106.3,112.28,460067000),(150,'NVDA','2024-07-26',116.19,116.2,111.58,113.06,293399100),(151,'NVDA','2024-07-29',113.69,116.28,111.3,111.59,248152100),(152,'NVDA','2024-07-30',111.52,111.99,102.54,103.73,486833300),(153,'NVDA','2024-07-31',112.9,118.34,110.88,117.02,473174200),(155,'NFLX','2024-07-02',673.54,681.74,670.07,679.58,2411400),(156,'NFLX','2024-07-03',677.48,683.75,675.5,682.51,1403500),(157,'NFLX','2024-07-05',682.51,697.49,677.23,690.65,2659100),(158,'NFLX','2024-07-08',687,688.86,681.49,685.74,1930800),(159,'NFLX','2024-07-09',690,695.27,684.72,685.74,2596100),(160,'NFLX','2024-07-10',685.02,687.22,673.16,677.65,2651900),(161,'NFLX','2024-07-11',672.49,672.49,647.44,652.75,5106600),(162,'NFLX','2024-07-12',652.75,655.92,643.71,647.6,3355200),(163,'NFLX','2024-07-15',647.5,667.54,646.63,656.45,3208800),(164,'NFLX','2024-07-16',661.8,663.68,649.13,656.32,2685700),(165,'NFLX','2024-07-17',650,650.45,639.47,647.46,4017300),(166,'NFLX','2024-07-18',656.6,657.04,639.17,643.04,7575800),(167,'NFLX','2024-07-19',660.64,678.97,629.12,633.34,9815600),(168,'NFLX','2024-07-22',639.5,656.29,632.6,647.5,5219100),(169,'NFLX','2024-07-23',647.5,649.91,641,642.76,2463600),(170,'NFLX','2024-07-24',635.74,652.42,632.67,635.99,4888200),(171,'NFLX','2024-07-25',641,649.98,621.7,634.09,4554500),(172,'NFLX','2024-07-26',645,646.99,629.77,631.37,3120700),(173,'NFLX','2024-07-29',634.61,634.61,623.93,626.96,2400500),(174,'NFLX','2024-07-30',630.17,634.69,617,622.58,3496600),(175,'NFLX','2024-07-31',626.57,633.6,622.58,628.35,3134900),(177,'ADBE','2024-07-02',560,570.14,560,567.71,3054500),(178,'ADBE','2024-07-03',564.29,571.83,564,570.15,1664400),(179,'ADBE','2024-07-05',570.91,580.55,568.92,578.34,2808600),(180,'ADBE','2024-07-08',573.18,576.75,563.92,575.4,3007400),(181,'ADBE','2024-07-09',573.05,575.01,562.46,566.02,2167600),(182,'ADBE','2024-07-10',564.71,566.93,558.21,564.55,2368400),(183,'ADBE','2024-07-11',564,572.62,557.09,557.63,3189200),(184,'ADBE','2024-07-12',555.1,562.49,552.32,559.05,2014000),(185,'ADBE','2024-07-15',560.23,568.23,560.23,565.71,1887800),(186,'ADBE','2024-07-16',564.6,570.1,562.08,566.54,1539900),(187,'ADBE','2024-07-17',563.93,565,556.46,563.09,2316300),(188,'ADBE','2024-07-18',564.18,564.26,556.07,556.85,2184700),(189,'ADBE','2024-07-19',557.05,561.09,548.96,551,2601900),(190,'ADBE','2024-07-22',558.65,560.19,552.71,554.82,2391700),(191,'ADBE','2024-07-23',556.49,557.25,544.44,546.01,2363900),(192,'ADBE','2024-07-24',543.8,544.71,530.35,531.04,2630100),(193,'ADBE','2024-07-25',536.8,542.28,527.59,532.15,2136500),(194,'ADBE','2024-07-26',535.35,545.5,533.33,542.44,2090000),(195,'ADBE','2024-07-29',544.3,544.3,535.19,536.61,1590600),(196,'ADBE','2024-07-30',541.85,543.67,530.95,538.71,1566900),(197,'ADBE','2024-07-31',547.05,555.55,543.77,551.65,2776000),(199,'INTC','2024-07-02',30.86,31.31,30.59,31.07,35999300),(200,'INTC','2024-07-03',31.12,31.34,30.91,31.23,24065700),(201,'INTC','2024-07-05',31.4,32.34,31.31,32.02,45309400),(202,'INTC','2024-07-08',33.03,34.09,32.82,33.99,82315900),(203,'INTC','2024-07-09',35.02,35.22,33.72,34.59,97546900),(204,'INTC','2024-07-10',34.44,34.97,34.13,34.87,52256200),(205,'INTC','2024-07-11',35.03,35.15,33.31,33.5,55213700),(206,'INTC','2024-07-12',33.77,35.48,33.77,34.49,62792600),(207,'INTC','2024-07-15',34.7,35.23,34.31,34.46,39847900),(208,'INTC','2024-07-16',34.36,34.45,33.84,34.34,28409900),(209,'INTC','2024-07-17',36.08,37.16,34.4,34.46,112304200),(210,'INTC','2024-07-18',34.96,36.3,34.53,34.87,84188600),(211,'INTC','2024-07-19',34.57,34.58,32.85,32.98,69628700),(212,'INTC','2024-07-22',33.28,33.41,32.76,33.37,48503700),(213,'INTC','2024-07-23',32.96,33.23,32.83,32.95,29466400),(214,'INTC','2024-07-24',32.53,32.8,31.66,31.7,62216700),(215,'INTC','2024-07-25',31.37,31.99,30.95,31.1,49774000),(216,'INTC','2024-07-26',31.43,31.56,31.02,31.35,38352500),(217,'INTC','2024-07-29',31.42,31.47,30.79,30.83,32342200),(218,'INTC','2024-07-30',30.85,30.91,30.01,30.13,48256600),(219,'INTC','2024-07-31',30.54,30.87,30.28,30.74,56110600),(221,'PYPL','2024-07-02',58.78,59.27,58.32,58.97,13231600),(222,'PYPL','2024-07-03',59.03,60.01,58.895,59.64,6908300),(223,'PYPL','2024-07-05',59.38,60.16,58.83,59.76,12243800),(224,'PYPL','2024-07-08',59.72,60.03,58.63,59.09,10320400),(225,'PYPL','2024-07-09',58.9,59.7,58.42,59,8473600),(226,'PYPL','2024-07-10',59.09,59.31,58.2,58.9,7697100),(227,'PYPL','2024-07-11',59.55,60.93,59.43,59.99,13082000),(228,'PYPL','2024-07-12',60.39,60.52,59.78,60.27,8166200),(229,'PYPL','2024-07-15',60.25,61.02,59.82,60.47,9443000),(230,'PYPL','2024-07-16',60.8,62.02,60.68,61.81,9198800),(231,'PYPL','2024-07-17',61.11,61.84,60.655,61.24,8322100),(232,'PYPL','2024-07-18',60.55,61.33,59.94,60,9102000),(233,'PYPL','2024-07-19',59.81,59.83,58.75,59.33,9352900),(234,'PYPL','2024-07-22',59.9,60.79,59.52,60.77,7489500),(235,'PYPL','2024-07-23',60.72,60.95,59.69,59.71,7572000),(236,'PYPL','2024-07-24',59.55,59.66,57.98,58.07,11801700),(237,'PYPL','2024-07-25',58.16,58.65,57.2,57.22,12515700),(238,'PYPL','2024-07-26',57.6,58.31,56.97,58.29,11323400),(239,'PYPL','2024-07-29',58.5,59.1,58.07,58.94,12346800),(240,'PYPL','2024-07-30',62.775,65.06,62.43,64,44232800),(241,'PYPL','2024-07-31',65,66.99,64.17,65.78,25825900),(243,'CSCO','2024-07-02',46.9974,47.3841,46.5611,46.8784,19794200),(244,'CSCO','2024-07-03',46.7495,47.1163,46.6404,46.69,8118300),(245,'CSCO','2024-07-05',46.43,46.76,46.31,46.65,14692600),(246,'CSCO','2024-07-08',46.35,46.78,45.95,46.06,19320900),(247,'CSCO','2024-07-09',46,46.1,45.65,45.8,17343400),(248,'CSCO','2024-07-10',46.06,46.29,45.83,46.27,18737300),(249,'CSCO','2024-07-11',46.18,46.91,46.18,46.76,19741200),(250,'CSCO','2024-07-12',46.78,47.86,46.65,47.38,20936100),(251,'CSCO','2024-07-15',47.41,47.49,46.79,47.4,15925900),(252,'CSCO','2024-07-16',47.45,47.97,47.22,47.42,17037300),(253,'CSCO','2024-07-17',47.46,48.74,47.35,48.52,26638700),(254,'CSCO','2024-07-18',48.15,48.64,47.98,48.04,18462500),(255,'CSCO','2024-07-19',48.09,48.1,47.14,47.32,18289200),(256,'CSCO','2024-07-22',47.32,47.38,46.77,46.82,19899400),(257,'CSCO','2024-07-23',46.75,46.78,46.34,46.36,16372000),(258,'CSCO','2024-07-24',46.54,47.04,46.24,46.85,25318200),(259,'CSCO','2024-07-25',47.37,48.19,47.06,47.24,20631200),(260,'CSCO','2024-07-26',47.32,48.01,47.24,47.88,16104900),(261,'CSCO','2024-07-29',47.82,48.21,47.44,47.99,11475700),(262,'CSCO','2024-07-30',48.19,48.55,47.89,48.14,20166000),(263,'CSCO','2024-07-31',48.41,48.77,48.24,48.45,19953600),(265,'PEP','2024-07-02',163.5,164.47,162.32,163.58,4650800),(266,'PEP','2024-07-03',162.92,164.13,161.96,162.6,2879600),(267,'PEP','2024-07-05',162.64,164.52,162.47,164.39,4208200),(268,'PEP','2024-07-08',163.06,163.75,161.92,162.12,5268800),(269,'PEP','2024-07-09',162.19,162.56,161.5,161.9,5801200),(270,'PEP','2024-07-10',161.84,163.77,160.66,163.59,7372300),(271,'PEP','2024-07-11',159.1,164.89,158.03,163.95,10258600),(272,'PEP','2024-07-12',164.96,168.03,164.96,166.38,6677000),(273,'PEP','2024-07-15',166.01,166.3,163.65,163.86,4551800),(274,'PEP','2024-07-16',163.41,165.04,162.84,164.76,4461700),(275,'PEP','2024-07-17',166.04,170.07,165.89,169.89,7671000),(276,'PEP','2024-07-18',168.71,172.67,168.39,170.37,6228600),(277,'PEP','2024-07-19',170.28,170.49,168.47,169.36,5332800),(278,'PEP','2024-07-22',169.26,169.71,167.35,167.66,5308400),(279,'PEP','2024-07-23',167.79,168.36,166.18,166.28,3344300),(280,'PEP','2024-07-24',166.28,168.67,164.95,168.17,5867000),(281,'PEP','2024-07-25',169.49,173.49,168.86,171.02,6270900),(282,'PEP','2024-07-26',170.73,172.76,170.73,172.75,5746300),(283,'PEP','2024-07-29',172.29,173.49,170.85,173.21,4152700),(284,'PEP','2024-07-30',172.69,173.45,171.55,173.18,4994600),(285,'PEP','2024-07-31',173.92,174.69,172.26,172.67,6245600),(287,'AVGO','2024-07-02',164.08,165.92,162.2,165.748,32539000),(288,'AVGO','2024-07-03',167,172.922,166.446,172.922,39954000),(289,'AVGO','2024-07-05',175.556,176.547,169.6,170.331,45240000),(290,'AVGO','2024-07-08',170.5,175.69,170.5,174.586,36398000),(291,'AVGO','2024-07-09',175.656,177.098,170.556,173.331,37802000),(292,'AVGO','2024-07-10',174.6,176.649,172.636,174.469,41074000),(293,'AVGO','2024-07-11',176.466,176.487,166.85,170.595,51026000),(294,'AVGO','2024-07-12',171.103,172.591,169.131,170.067,30453000),(295,'AVGO','2024-07-15',170,173.51,169.26,171.42,22999200),(296,'AVGO','2024-07-16',172.4,172.81,166.4,169.38,22244900),(297,'AVGO','2024-07-17',162.31,162.84,155.61,155.98,43343400),(298,'AVGO','2024-07-18',158.89,161.51,153.9,160.52,37973500),(299,'AVGO','2024-07-19',161.84,163.95,157.12,157.35,26309500),(300,'AVGO','2024-07-22',160.23,162.99,157.9,161.06,28813300),(301,'AVGO','2024-07-23',160.4,165.33,159.9,163.77,21570200),(302,'AVGO','2024-07-24',160.35,161.41,151.1,151.34,37162600),(303,'AVGO','2024-07-25',151.26,153.55,145.52,149.26,30872100),(304,'AVGO','2024-07-26',153.5,153.58,149.92,151.63,20839900),(305,'AVGO','2024-07-29',152.02,155,149.15,150.22,16625800),(306,'AVGO','2024-07-30',153.28,153.47,143.35,143.52,31102300),(307,'AVGO','2024-07-31',151.47,161.33,151,160.68,45827500),(309,'COST','2024-07-02',844.488,859.137,841.881,858.138,1377900),(310,'COST','2024-07-03',853.784,862.292,853.784,861.434,814400),(311,'COST','2024-07-05',863.331,885.679,857.499,884.411,2620700),(312,'COST','2024-07-08',885.529,886.688,876.412,879.588,1611300),(313,'COST','2024-07-09',882.593,895.395,881.715,885.589,1356800),(314,'COST','2024-07-10',886.138,889.004,879.448,883.053,1755800),(315,'COST','2024-07-11',889.494,889.494,845.317,845.386,6021100),(316,'COST','2024-07-12',848.682,848.792,837.188,841.702,3288400),(317,'COST','2024-07-15',845.656,856.68,843.469,847.523,2064000),(318,'COST','2024-07-16',846.595,850.03,840.144,849.561,1687600),(319,'COST','2024-07-17',846.804,848.742,841.452,845.077,1783100),(320,'COST','2024-07-18',848.222,854.084,823.937,838.177,2338500),(321,'COST','2024-07-19',835.321,847.673,834.372,836.938,1984400),(322,'COST','2024-07-22',844.548,848.382,837.408,846.215,1920200),(323,'COST','2024-07-23',847.693,853.365,844.378,850.899,1744100),(324,'COST','2024-07-24',843.399,844.797,828.321,829.639,2511300),(325,'COST','2024-07-25',834.602,835.461,813.122,814.79,2183700),(326,'COST','2024-07-26',818,822.28,809.01,817.6,1441500),(327,'COST','2024-07-29',822.56,823.74,814.09,815.56,1320400),(328,'COST','2024-07-30',818,822,803.28,810.03,2017200),(329,'COST','2024-07-31',820.42,825.48,811.27,822,2135000),(331,'TM','2024-07-02',205,206.21,204.75,206.21,259300),(332,'TM','2024-07-03',205.87,206.31,205.17,206.25,212300),(333,'TM','2024-07-05',206.29,206.55,205.09,206.45,190500),(334,'TM','2024-07-08',204.72,205.67,204.3,204.94,200500),(335,'TM','2024-07-09',203,203.19,201.67,201.67,230600),(336,'TM','2024-07-10',204.63,206.18,203.78,205.88,209100),(337,'TM','2024-07-11',205.31,205.65,203.73,203.73,246300),(338,'TM','2024-07-12',206.53,208.86,206.03,207.59,218200),(339,'TM','2024-07-15',208.18,208.21,206.76,206.91,207800),(340,'TM','2024-07-16',206.23,206.81,205.68,206.6,206000),(341,'TM','2024-07-17',204.73,205.15,203.31,204.39,266300),(342,'TM','2024-07-18',201.93,202.22,199.54,199.85,292900),(343,'TM','2024-07-19',199.28,199.28,197.03,197.15,236400),(344,'TM','2024-07-22',198.7,200.15,198.12,200.14,315500),(345,'TM','2024-07-23',200.18,201.33,200.03,200.79,283800),(346,'TM','2024-07-24',199.79,199.79,197.08,197.2,211400),(347,'TM','2024-07-25',197.43,197.43,193.73,195.25,212100),(348,'TM','2024-07-26',190.74,192.84,190.51,192.52,317100),(349,'TM','2024-07-29',193,193.2,191.81,192.48,205900),(350,'TM','2024-07-30',194.96,195.48,192.27,193.11,284200),(351,'TM','2024-07-31',194.18,194.89,192.9,193.55,372300),(353,'NKE','2024-07-02',76.82,76.94,75.39,76.04,26183400),(354,'NKE','2024-07-03',75.5,75.92,75.02,75.24,15952000),(355,'NKE','2024-07-05',75.36,76.09,74.78,75.43,19603700),(356,'NKE','2024-07-08',75.41,75.49,73,73.05,29905000),(357,'NKE','2024-07-09',73.3,74.14,72.38,72.46,23445500),(358,'NKE','2024-07-10',72.26,72.64,71.67,72.54,21378200),(359,'NKE','2024-07-11',72.7,73.75,72.29,73.39,15876700),(360,'NKE','2024-07-12',73.57,74.05,73.17,73.42,14527500),(361,'NKE','2024-07-15',73,73.01,71.24,71.31,20775800),(362,'NKE','2024-07-16',71.51,72.96,71.51,72.81,20980700),(363,'NKE','2024-07-17',72.53,73.34,72.5,73.07,11161600),(364,'NKE','2024-07-18',72.97,73.93,72.35,72.38,14440100),(365,'NKE','2024-07-19',72.3,72.82,71.85,72.7,11913300),(366,'NKE','2024-07-22',73.12,75.34,73.07,74.86,19385500),(367,'NKE','2024-07-23',74.63,75.04,73.24,73.4,11041800),(368,'NKE','2024-07-24',73.25,73.39,71.08,71.09,18563300),(369,'NKE','2024-07-25',71.53,72.43,70.91,71.41,13855400),(370,'NKE','2024-07-26',72,72.78,71.87,72.56,8892000),(371,'NKE','2024-07-29',72.5,73.87,72.2,73.55,10471800),(372,'NKE','2024-07-30',73.69,74.49,73.46,74.32,8515700),(373,'NKE','2024-07-31',74.5,75.43,73.92,74.86,14632900),(375,'V','2024-07-02',263.24,268.23,262.4,268.23,8697800),(376,'V','2024-07-03',269.07,269.75,268.15,268.99,5017800),(377,'V','2024-07-05',269,270.55,268.24,270.36,7986400),(378,'V','2024-07-08',270.25,271.44,265.97,266.4,8561100),(379,'V','2024-07-09',267,267.55,263.92,265.44,6431300),(380,'V','2024-07-10',259.12,263.48,258.51,263,9635500),(381,'V','2024-07-11',262.13,263.63,260.76,262.55,8803600),(382,'V','2024-07-12',264.34,267.4,263.66,265.74,6627800),(383,'V','2024-07-15',265.67,269.24,265.25,268.45,6845200),(384,'V','2024-07-16',268.52,270.21,267.37,269.25,7869900),(385,'V','2024-07-17',268.44,272.91,268.24,272.7,5324700),(386,'V','2024-07-18',272.29,273.62,268.56,269.15,5550800),(387,'V','2024-07-19',270.32,270.95,264.31,265.46,6839900),(388,'V','2024-07-22',267.23,268.4,265.02,267.71,5313600),(389,'V','2024-07-23',267.53,267.7,263.86,264.79,8109200),(390,'V','2024-07-24',256.07,257.2,253.13,254.17,13065900),(391,'V','2024-07-25',255.39,258.22,252.7,253.74,8573300),(392,'V','2024-07-26',255.59,261.2,255.59,259.46,7062200),(393,'V','2024-07-29',260.32,262.71,258.58,261.6,6068100),(394,'V','2024-07-30',263.23,264.3,261.01,263.1,5941800),(395,'V','2024-07-31',264.54,266.36,264.25,265.67,7642500),(397,'MA','2024-07-02',434.357,444.102,434.357,443.992,2061300),(398,'MA','2024-07-03',444.661,448.625,443.623,447.517,3192400),(399,'MA','2024-07-05',446.449,449.285,443.623,448.825,2220700),(400,'MA','2024-07-08',448.616,449.944,444.342,445.58,1802700),(401,'MA','2024-07-09',446.65,447.58,442.79,444.7,1608400),(402,'MA','2024-07-10',434.61,437.41,429.05,433.64,4760900),(403,'MA','2024-07-11',432,437.77,430.11,436.42,4032600),(404,'MA','2024-07-12',437.4,442.23,437.32,440.11,2645600),(405,'MA','2024-07-15',440.33,444.4,438.74,444,1727700),(406,'MA','2024-07-16',446.94,447.16,439.7,443.53,2846600),(407,'MA','2024-07-17',442.4,451.52,442.06,451.16,2925000),(408,'MA','2024-07-18',448.75,455.43,447.48,448.72,3339900),(409,'MA','2024-07-19',451.22,451.24,443.57,443.69,2121700),(410,'MA','2024-07-22',445.41,448.85,443.25,447.94,2111700),(411,'MA','2024-07-23',448.05,448.74,441.11,441.72,2385500),(412,'MA','2024-07-24',434,435.86,428.86,432.45,3764800),(413,'MA','2024-07-25',433.94,437.7,429.56,429.6,2384300),(414,'MA','2024-07-26',432.28,440.78,432.11,438.18,2039600),(415,'MA','2024-07-29',438.8,442.92,435.42,441.3,2248600),(416,'MA','2024-07-30',443.77,448.73,443.01,447.45,2266900),(417,'MA','2024-07-31',462,474,457.54,463.71,4313600),(419,'JPM','2024-07-02',204.159,207.709,203.642,207.679,7802900),(420,'JPM','2024-07-03',208.395,209.221,206.506,207.54,5560900),(421,'JPM','2024-07-05',206.99,207.37,204.52,204.79,8093100),(422,'JPM','2024-07-08',205.04,206.9,203.97,205.17,8707000),(423,'JPM','2024-07-09',205.63,209.76,205.45,207.63,9058900),(424,'JPM','2024-07-10',206.14,207.97,205.58,207.8,8328500),(425,'JPM','2024-07-11',206.21,208.1,205.38,207.45,10658100),(426,'JPM','2024-07-12',204,207.45,202.1,204.94,15443400),(427,'JPM','2024-07-15',207.19,211.61,206.72,210.05,10719700),(428,'JPM','2024-07-16',210,213.74,208.08,213.62,11557000),(429,'JPM','2024-07-17',213.8,217.56,213.27,216.87,11572500),(430,'JPM','2024-07-18',215.63,216.64,209.24,209.98,12415100),(431,'JPM','2024-07-19',211.2,212.35,208.92,209.78,8095900),(432,'JPM','2024-07-22',210.46,212.17,209.71,210.28,7663200),(433,'JPM','2024-07-23',211.02,211.48,209.35,210.33,5557300),(434,'JPM','2024-07-24',209.55,212.03,208.07,208.59,7119000),(435,'JPM','2024-07-25',208.65,210.19,208.05,208.67,6403800),(436,'JPM','2024-07-26',209.24,213.16,208.62,212.24,8027800),(437,'JPM','2024-07-29',212.65,213.61,210.55,210.85,6533600),(438,'JPM','2024-07-30',213.23,215.79,212.96,215.19,8850700),(439,'JPM','2024-07-31',214.78,216.39,212.67,212.8,9071600),(461,'AAPL','2024-08-01',224.37,224.48,217.02,218.36,61877900),(462,'MSFT','2024-08-01',420.79,427.46,413.09,417.11,30229100),(463,'GOOGL','2024-08-01',170.25,174.05,168.88,170.76,24469700),(464,'AMZN','2024-08-01',189.29,190.6,181.87,184.07,67815400),(465,'TSLA','2024-08-01',227.69,231.87,214.33,216.86,83613400),(466,'META','2024-08-01',521,527.17,492.1,497.74,43010600),(467,'NVDA','2024-08-01',117.53,120.16,106.81,109.21,519247300),(468,'NFLX','2024-08-01',629.25,646.71,617.61,624.85,3714100),(469,'ADBE','2024-08-01',549.99,561.98,540.24,546.41,2072100),(470,'INTC','2024-08-01',30.43,30.71,28.89,29.05,104451100),(471,'PYPL','2024-08-01',65.78,67.3,65.02,65.31,19052500),(472,'CSCO','2024-08-01',48.62,48.72,47.2,47.39,18772500),(473,'PEP','2024-08-01',172.53,175.56,172.5,174.96,5976200),(474,'AVGO','2024-08-01',157.5,158.91,146.17,147.02,40204100),(475,'COST','2024-08-01',818.55,824.17,809.68,816.89,1854800),(476,'TM','2024-08-01',181.57,184.68,178.57,179.07,816300),(477,'NKE','2024-08-01',74.7,74.79,73.26,73.85,9544900),(478,'V','2024-08-01',266.33,267,264.18,265.93,7257200),(479,'MA','2024-08-01',465.46,467.5,459.19,462.41,2588900),(480,'JPM','2024-08-01',213.2,213.83,206.38,207.96,10900800),(501,'AAPL','2024-08-02',219.15,225.6,217.71,223.54,63603065),(502,'MSFT','2024-08-02',412.745,415,404.34,405.73,15823371),(503,'GOOGL','2024-08-02',166.56,168.51,164.67,165.31,16432393),(504,'AMZN','2024-08-02',166.665,168.77,160.55,165.3,100150286),(505,'TSLA','2024-08-02',214.835,216.13,205.8,206.71,58659424),(506,'META','2024-08-02',488.93,501.145,476.15,486.91,16214446),(507,'NVDA','2024-08-02',103.87,108.72,101.37,104.94,348354136),(508,'NFLX','2024-08-02',621,625.27,608.35,613.82,1727517),(509,'ADBE','2024-08-02',535.78,536.84,519.765,521.85,1322415),(510,'INTC','2024-08-02',21.94,21.98,20.42,21.1641,226275191),(511,'PYPL','2024-08-02',64,64.01,60.96,61.97,14233161),(512,'CSCO','2024-08-02',48.62,47.75,46.395,46.415,9390081),(513,'PEP','2024-08-02',178.84,179.95,173.84,177.62,3377183),(514,'AVGO','2024-08-02',141.72,145.35,139.6,142.3,19008529),(515,'COST','2024-08-02',815.77,830.1,805.01,817.94,1151725),(516,'TM','2024-08-02',173.72,173.89,171.51,172.33,440254),(517,'NKE','2024-08-02',72.83,73.6698,71.93,73.455,6485528),(518,'V','2024-08-02',263.83,267.96,262.88,264.895,3841777),(519,'MA','2024-08-02',460.22,466.75,458.615,460.78,2353283),(520,'JPM','2024-08-02',203.88,204.63,197.74,198.15,9460172);
/*!40000 ALTER TABLE `stocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `todays_data`
--

DROP TABLE IF EXISTS `todays_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `todays_data` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ticker` varchar(10) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `open` float DEFAULT NULL,
  `high` float DEFAULT NULL,
  `low` float DEFAULT NULL,
  `close` float DEFAULT NULL,
  `volume` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1987 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `todays_data`
--

LOCK TABLES `todays_data` WRITE;
/*!40000 ALTER TABLE `todays_data` DISABLE KEYS */;
INSERT INTO `todays_data` VALUES (1967,'AAPL','2024-08-02',219.15,225.6,217.71,223.54,63603065),(1968,'MSFT','2024-08-02',412.745,415,404.34,405.73,15823371),(1969,'GOOGL','2024-08-02',166.56,168.51,164.67,165.31,16432393),(1970,'AMZN','2024-08-02',166.665,168.77,160.55,165.3,100150286),(1971,'TSLA','2024-08-02',214.835,216.13,205.8,206.71,58659424),(1972,'META','2024-08-02',488.93,501.145,476.15,486.91,16214446),(1973,'NVDA','2024-08-02',103.87,108.72,101.37,104.94,348354136),(1974,'NFLX','2024-08-02',621,625.27,608.35,613.82,1727517),(1975,'ADBE','2024-08-02',535.78,536.84,519.765,521.85,1322415),(1976,'INTC','2024-08-02',21.94,21.98,20.42,21.1641,226275191),(1977,'PYPL','2024-08-02',64,64.01,60.96,61.97,14233161),(1978,'CSCO','2024-08-02',48.62,47.75,46.395,46.415,9390081),(1979,'PEP','2024-08-02',178.84,179.95,173.84,177.62,3377183),(1980,'AVGO','2024-08-02',141.72,145.35,139.6,142.3,19008529),(1981,'COST','2024-08-02',815.77,830.1,805.01,817.94,1151725),(1982,'TM','2024-08-02',173.72,173.89,171.51,172.33,440254),(1983,'NKE','2024-08-02',72.83,73.6698,71.93,73.455,6485528),(1984,'V','2024-08-02',263.83,267.96,262.88,264.895,3841777),(1985,'MA','2024-08-02',460.22,466.75,458.615,460.78,2353283),(1986,'JPM','2024-08-02',203.88,204.63,197.74,198.15,9460172);
/*!40000 ALTER TABLE `todays_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token_blacklist_blacklistedtoken`
--

DROP TABLE IF EXISTS `token_blacklist_blacklistedtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `token_blacklist_blacklistedtoken` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `blacklisted_at` datetime(6) NOT NULL,
  `token_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token_id` (`token_id`),
  CONSTRAINT `token_blacklist_blacklistedtoken_token_id_3cc7fe56_fk` FOREIGN KEY (`token_id`) REFERENCES `token_blacklist_outstandingtoken` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token_blacklist_blacklistedtoken`
--

LOCK TABLES `token_blacklist_blacklistedtoken` WRITE;
/*!40000 ALTER TABLE `token_blacklist_blacklistedtoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `token_blacklist_blacklistedtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token_blacklist_outstandingtoken`
--

DROP TABLE IF EXISTS `token_blacklist_outstandingtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `token_blacklist_outstandingtoken` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `token` longtext NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `expires_at` datetime(6) NOT NULL,
  `user_id` int DEFAULT NULL,
  `jti` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token_blacklist_outstandingtoken_jti_hex_d9bdf6f7_uniq` (`jti`),
  KEY `token_blacklist_outs_user_id_83bc629a_fk_auth_user` (`user_id`),
  CONSTRAINT `token_blacklist_outs_user_id_83bc629a_fk_auth_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token_blacklist_outstandingtoken`
--

LOCK TABLES `token_blacklist_outstandingtoken` WRITE;
/*!40000 ALTER TABLE `token_blacklist_outstandingtoken` DISABLE KEYS */;
INSERT INTO `token_blacklist_outstandingtoken` VALUES (1,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcyMjMzMDI2NiwiaWF0IjoxNzIyMjQzODY2LCJqdGkiOiJlZWMxNDQwMDQ5ZTE0ZDUwOWJkYzBlYTU0YThhNjZhMSIsInVzZXJfaWQiOjF9.-9gnC6U8FHHOUIa7T4oLlroCXMuYQlo-qcRMdfAg4u0','2024-07-29 09:04:26.652299','2024-07-30 09:04:26.000000',1,'eec1440049e14d509bdc0ea54a8a66a1'),(2,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcyMjMzMDQ1NywiaWF0IjoxNzIyMjQ0MDU3LCJqdGkiOiI3MzExZGYyNWFjNDI0NWQ4OGJkNzNhMjEyYzEwZDcwZiIsInVzZXJfaWQiOjF9.ANG8fClYL_ONUGGnR6w3fzU7FZzBHvjtSX0HpLV99YI','2024-07-29 09:07:37.876104','2024-07-30 09:07:37.000000',1,'7311df25ac4245d88bd73a212c10d70f');
/*!40000 ALTER TABLE `token_blacklist_outstandingtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `top_gainers_losers`
--

DROP TABLE IF EXISTS `top_gainers_losers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `top_gainers_losers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ticker` varchar(10) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `gainers_or_losers` enum('Gainers','Losers') DEFAULT NULL,
  `percentage_change` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `top_gainers_losers`
--

LOCK TABLES `top_gainers_losers` WRITE;
/*!40000 ALTER TABLE `top_gainers_losers` DISABLE KEYS */;
INSERT INTO `top_gainers_losers` VALUES (91,'PEP','2024-08-02','Gainers',8.58296),(92,'PYPL','2024-08-02','Gainers',5.08733),(93,'MA','2024-08-02','Gainers',3.78115),(94,'AAPL','2024-08-02','Gainers',1.48454),(95,'CSCO','2024-08-02','Gainers',-0.988515),(96,'AVGO','2024-08-02','Losers',-14.1468),(97,'NVDA','2024-08-02','Losers',-14.4534),(98,'TM','2024-08-02','Losers',-16.4299),(99,'AMZN','2024-08-02','Losers',-17.35),(100,'INTC','2024-08-02','Losers',-31.8825);
/*!40000 ALTER TABLE `top_gainers_losers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-03 11:48:44
