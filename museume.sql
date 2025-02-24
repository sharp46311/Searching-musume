-- MySQL dump 10.13  Distrib 8.0.41, for Linux (x86_64)
--
-- Host: localhost    Database: museume
-- ------------------------------------------------------
-- Server version	8.0.41-0ubuntu0.24.04.1

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
-- Table structure for table `advertisement_advertisement`
--

DROP TABLE IF EXISTS `advertisement_advertisement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `advertisement_advertisement` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `banner_frame` varchar(50) NOT NULL,
  `banner_image` varchar(100) NOT NULL,
  `start_date` datetime(6) NOT NULL,
  `end_date` datetime(6) NOT NULL,
  `add_type` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advertisement_advertisement`
--

LOCK TABLES `advertisement_advertisement` WRITE;
/*!40000 ALTER TABLE `advertisement_advertisement` DISABLE KEYS */;
/*!40000 ALTER TABLE `advertisement_advertisement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artist_class_artistclass`
--

DROP TABLE IF EXISTS `artist_class_artistclass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artist_class_artistclass` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `is_free` tinyint(1) NOT NULL,
  `class_type` varchar(20) NOT NULL,
  `thumbnail` varchar(100) NOT NULL,
  `url` varchar(200) NOT NULL,
  `start_date` datetime(6) DEFAULT NULL,
  `end_date` datetime(6) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `cost` decimal(10,2) DEFAULT NULL,
  `description` longtext,
  `currency` varchar(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artist_class_artistclass`
--

LOCK TABLES `artist_class_artistclass` WRITE;
/*!40000 ALTER TABLE `artist_class_artistclass` DISABLE KEYS */;
INSERT INTO `artist_class_artistclass` VALUES (1,'フリーペイント','絵画',1,'real_time','artist_class_thumbnails/iStock-1215146649.jpg','https://www.youtube.com/watch?v=r9_a5HOwzUg','2025-04-01 03:05:37.000000','2025-04-02 03:05:41.000000','2025-02-05 03:05:48.851981','2025-02-17 02:18:47.612971',NULL,'自由にお絵描き！\r\n\r\n紙と、使いたい道具で自分のオリジナル作品を作ろう！\r\n\r\n定員：4名\r\n用意するもの：紙と使用したい絵の具、クレヨン、粘土などお好きなもの\r\n対象年齢：４歳から６歳','USD'),(3,'KImonoデザイン','ファッション',1,'recorded','artist_class_thumbnails/IMG_4992.jpg','https://url.com','2025-01-16 04:42:33.000000','2025-05-24 04:42:42.000000','2025-02-14 04:44:30.168822','2025-02-17 02:48:49.055455',NULL,'Kimonoを自由な発想でデザインしよう！\r\n\r\n着物を着たことがなくても、裁縫ができなくても大丈夫！\r\nまずは自分が着たいと思う着物をデッサンして楽しもう！\r\n\r\n所要時間：30分\r\n視聴：無料','USD');
/*!40000 ALTER TABLE `artist_class_artistclass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artist_class_artistclass_tags`
--

DROP TABLE IF EXISTS `artist_class_artistclass_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artist_class_artistclass_tags` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `artistclass_id` bigint NOT NULL,
  `tag_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `artist_class_artistclass_artistclass_id_tag_id_a393e118_uniq` (`artistclass_id`,`tag_id`),
  KEY `artist_class_artistclass_tags_tag_id_eaf30179_fk_work_tag_id` (`tag_id`),
  CONSTRAINT `artist_class_artistc_artistclass_id_d65f67c9_fk_artist_cl` FOREIGN KEY (`artistclass_id`) REFERENCES `artist_class_artistclass` (`id`),
  CONSTRAINT `artist_class_artistclass_tags_tag_id_eaf30179_fk_work_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `work_tag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artist_class_artistclass_tags`
--

LOCK TABLES `artist_class_artistclass_tags` WRITE;
/*!40000 ALTER TABLE `artist_class_artistclass_tags` DISABLE KEYS */;
INSERT INTO `artist_class_artistclass_tags` VALUES (1,1,1),(3,3,1);
/*!40000 ALTER TABLE `artist_class_artistclass_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artist_class_memberclasssignup`
--

DROP TABLE IF EXISTS `artist_class_memberclasssignup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artist_class_memberclasssignup` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `signed_up_at` datetime(6) NOT NULL,
  `artist_class_id` bigint NOT NULL,
  `member_id` bigint NOT NULL,
  `attended` tinyint(1) NOT NULL,
  `reminder_sent` tinyint(1) NOT NULL,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `artist_class_memberclass_member_id_artist_class_i_a3a14ab9_uniq` (`member_id`,`artist_class_id`),
  KEY `artist_clas_member__085126_idx` (`member_id`),
  KEY `artist_clas_artist__5b1288_idx` (`artist_class_id`),
  CONSTRAINT `artist_class_memberc_artist_class_id_3f950fd9_fk_artist_cl` FOREIGN KEY (`artist_class_id`) REFERENCES `artist_class_artistclass` (`id`),
  CONSTRAINT `artist_class_memberc_member_id_527bf7c8_fk_member_me` FOREIGN KEY (`member_id`) REFERENCES `member_member` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artist_class_memberclasssignup`
--

LOCK TABLES `artist_class_memberclasssignup` WRITE;
/*!40000 ALTER TABLE `artist_class_memberclasssignup` DISABLE KEYS */;
INSERT INTO `artist_class_memberclasssignup` VALUES (1,'2025-02-05 03:08:15.508695',1,8,0,0,'confirmed'),(2,'2025-02-07 02:24:13.753395',1,15,0,0,'confirmed'),(5,'2025-02-14 04:48:33.556728',1,13,0,0,'confirmed'),(6,'2025-02-14 04:49:17.037317',3,13,0,0,'confirmed');
/*!40000 ALTER TABLE `artist_class_memberclasssignup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artist_class_payment`
--

DROP TABLE IF EXISTS `artist_class_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artist_class_payment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `stripe_payment_intent_id` varchar(255) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` varchar(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `artist_class_id` bigint NOT NULL,
  `member_id` bigint NOT NULL,
  `stripe_payment_intent_secret` longtext,
  PRIMARY KEY (`id`),
  KEY `artist_clas_member__5f1701_idx` (`member_id`),
  KEY `artist_clas_artist__deaaef_idx` (`artist_class_id`),
  KEY `artist_clas_status_aa57c7_idx` (`status`),
  CONSTRAINT `artist_class_payment_artist_class_id_19bc148f_fk_artist_cl` FOREIGN KEY (`artist_class_id`) REFERENCES `artist_class_artistclass` (`id`),
  CONSTRAINT `artist_class_payment_member_id_79b708b5_fk_member_member_id` FOREIGN KEY (`member_id`) REFERENCES `member_member` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artist_class_payment`
--

LOCK TABLES `artist_class_payment` WRITE;
/*!40000 ALTER TABLE `artist_class_payment` DISABLE KEYS */;
INSERT INTO `artist_class_payment` VALUES (4,NULL,0.00,'succeeded','2025-02-14 04:48:33.548139','2025-02-14 04:48:33.548170',1,13,NULL),(5,NULL,0.00,'succeeded','2025-02-14 04:49:17.028865','2025-02-14 04:49:17.028894',3,13,NULL);
/*!40000 ALTER TABLE `artist_class_payment` ENABLE KEYS */;
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
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add Organization',6,'add_organization'),(22,'Can change Organization',6,'change_organization'),(23,'Can delete Organization',6,'delete_organization'),(24,'Can view Organization',6,'view_organization'),(25,'Can add user',7,'add_member'),(26,'Can change user',7,'change_member'),(27,'Can delete user',7,'delete_member'),(28,'Can view user',7,'view_member'),(29,'Can add Member',8,'add_regularmember'),(30,'Can change Member',8,'change_regularmember'),(31,'Can delete Member',8,'delete_regularmember'),(32,'Can view Member',8,'view_regularmember'),(33,'Can add Staff',9,'add_staffmember'),(34,'Can change Staff',9,'change_staffmember'),(35,'Can delete Staff',9,'delete_staffmember'),(36,'Can view Staff',9,'view_staffmember'),(37,'Can add ProfileMember',10,'add_profilemember'),(38,'Can change ProfileMember',10,'change_profilemember'),(39,'Can delete ProfileMember',10,'delete_profilemember'),(40,'Can view ProfileMember',10,'view_profilemember'),(41,'Can add Category',11,'add_category'),(42,'Can change Category',11,'change_category'),(43,'Can delete Category',11,'delete_category'),(44,'Can view Category',11,'view_category'),(45,'Can add Tag',12,'add_tag'),(46,'Can change Tag',12,'change_tag'),(47,'Can delete Tag',12,'delete_tag'),(48,'Can view Tag',12,'view_tag'),(49,'Can add Work',13,'add_work'),(50,'Can change Work',13,'change_work'),(51,'Can delete Work',13,'delete_work'),(52,'Can view Work',13,'view_work'),(53,'Can add Image',14,'add_image'),(54,'Can change Image',14,'change_image'),(55,'Can delete Image',14,'delete_image'),(56,'Can view Image',14,'view_image'),(57,'Can add like',15,'add_like'),(58,'Can change like',15,'change_like'),(59,'Can delete like',15,'delete_like'),(60,'Can view like',15,'view_like'),(61,'Can add Contest',16,'add_contest'),(62,'Can change Contest',16,'change_contest'),(63,'Can delete Contest',16,'delete_contest'),(64,'Can view Contest',16,'view_contest'),(65,'Can add Application',17,'add_contestapplication'),(66,'Can change Application',17,'change_contestapplication'),(67,'Can delete Application',17,'delete_contestapplication'),(68,'Can view Application',17,'view_contestapplication'),(69,'Can add Plan',18,'add_plan'),(70,'Can change Plan',18,'change_plan'),(71,'Can delete Plan',18,'delete_plan'),(72,'Can view Plan',18,'view_plan'),(73,'Can add Subscription',19,'add_subscription'),(74,'Can change Subscription',19,'change_subscription'),(75,'Can delete Subscription',19,'delete_subscription'),(76,'Can view Subscription',19,'view_subscription'),(77,'Can add Artist Class',20,'add_artistclass'),(78,'Can change Artist Class',20,'change_artistclass'),(79,'Can delete Artist Class',20,'delete_artistclass'),(80,'Can view Artist Class',20,'view_artistclass'),(81,'Can add member class signup',21,'add_memberclasssignup'),(82,'Can change member class signup',21,'change_memberclasssignup'),(83,'Can delete member class signup',21,'delete_memberclasssignup'),(84,'Can view member class signup',21,'view_memberclasssignup'),(85,'Can add payment',22,'add_payment'),(86,'Can change payment',22,'change_payment'),(87,'Can delete payment',22,'delete_payment'),(88,'Can view payment',22,'view_payment'),(89,'Can add Advertisement',23,'add_advertisement'),(90,'Can change Advertisement',23,'change_advertisement'),(91,'Can delete Advertisement',23,'delete_advertisement'),(92,'Can view Advertisement',23,'view_advertisement'),(93,'Can add Public NavBar',24,'add_publicnavbar'),(94,'Can change Public NavBar',24,'change_publicnavbar'),(95,'Can delete Public NavBar',24,'delete_publicnavbar'),(96,'Can view Public NavBar',24,'view_publicnavbar'),(97,'Can add Inquiry',25,'add_inquiry'),(98,'Can change Inquiry',25,'change_inquiry'),(99,'Can delete Inquiry',25,'delete_inquiry'),(100,'Can view Inquiry',25,'view_inquiry');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `billing_plan`
--

DROP TABLE IF EXISTS `billing_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `billing_plan` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `stripe_price_id` varchar(255) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `currency` varchar(3) NOT NULL,
  `interval` varchar(10) NOT NULL,
  `features` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billing_plan`
--

LOCK TABLES `billing_plan` WRITE;
/*!40000 ALTER TABLE `billing_plan` DISABLE KEYS */;
/*!40000 ALTER TABLE `billing_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `billing_subscription`
--

DROP TABLE IF EXISTS `billing_subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `billing_subscription` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `stripe_subscription_id` varchar(255) NOT NULL,
  `stripe_customer_id` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `member_id` bigint NOT NULL,
  `plan_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`member_id`),
  KEY `billing_subscription_plan_id_4e20d4ad_fk_billing_plan_id` (`plan_id`),
  CONSTRAINT `billing_subscription_member_id_419095a3_fk_member_member_id` FOREIGN KEY (`member_id`) REFERENCES `member_member` (`id`),
  CONSTRAINT `billing_subscription_plan_id_4e20d4ad_fk_billing_plan_id` FOREIGN KEY (`plan_id`) REFERENCES `billing_plan` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billing_subscription`
--

LOCK TABLES `billing_subscription` WRITE;
/*!40000 ALTER TABLE `billing_subscription` DISABLE KEYS */;
/*!40000 ALTER TABLE `billing_subscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contest_contest`
--

DROP TABLE IF EXISTS `contest_contest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contest_contest` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `explanation` longtext NOT NULL,
  `start_date` datetime(6) NOT NULL,
  `end_date` datetime(6) NOT NULL,
  `thumbnail` varchar(100) DEFAULT NULL,
  `organization_id` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `is_private` tinyint(1) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `award_condition` varchar(10) NOT NULL,
  `eligibility_criteria` longtext NOT NULL,
  `winner_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contest_contest_organization_id_76f8011f_fk_member_or` (`organization_id`),
  KEY `contest_contest_winner_id_dc8a2127_fk_work_work_id` (`winner_id`),
  CONSTRAINT `contest_contest_organization_id_76f8011f_fk_member_or` FOREIGN KEY (`organization_id`) REFERENCES `member_organization` (`id`),
  CONSTRAINT `contest_contest_winner_id_dc8a2127_fk_work_work_id` FOREIGN KEY (`winner_id`) REFERENCES `work_work` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contest_contest`
--

LOCK TABLES `contest_contest` WRITE;
/*!40000 ALTER TABLE `contest_contest` DISABLE KEYS */;
INSERT INTO `contest_contest` VALUES (5,'Kimonoデザインコンテスト','日本文化の一つである「KImono」を自分でアレンジしたデザインで応募しよう！\r\n\r\n私たちACFaは、日本伝統文化の「着物」を「KImono」として世界に広め、日本文化の継承啓蒙と子供達の発想力のサポートをしております。\r\n\r\nKimonoを自分の発想で、デザインをして応募してください。\r\n自由な発想で、Kimonoの良さを海外の方に広めていきましょう！','2025-02-12 15:00:00.000000','2025-04-29 15:00:00.000000','thumbnails/konntesuto.jpg',7,'2025-02-14 04:11:15.631964',0,'2025-02-14 04:15:55.734274','admin','形式：ご自身が考えた着物のデッサンや絵を投稿して応募してください。\r\n\r\n\r\n応募可能数は、お一人様１作品となります。\r\n年齢制限はございません。\r\n作品はオリジナルの作品に限ります。\r\n\r\n受賞者は当団体WEBにて発表させていただきます。また受賞者のみ直接メールさせていただきます。\r\n受賞作品は５月にNYで行われる当団体のファッションショーでプリントアウトしたものを、掲載させていただきます。\r\n\r\nhttps://www.acf-a.org',NULL);
/*!40000 ALTER TABLE `contest_contest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contest_contestapplication`
--

DROP TABLE IF EXISTS `contest_contestapplication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contest_contestapplication` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `submission_date` datetime(6) NOT NULL,
  `description` longtext,
  `contest_id` bigint NOT NULL,
  `member_id` bigint NOT NULL,
  `work_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `contest_contestapplication_contest_id_work_id_7321caa3_uniq` (`contest_id`,`work_id`),
  KEY `contest_contestappli_member_id_dbdbcb09_fk_member_me` (`member_id`),
  KEY `contest_contestapplication_work_id_9ef2933b_fk_work_work_id` (`work_id`),
  CONSTRAINT `contest_contestappli_contest_id_846121c5_fk_contest_c` FOREIGN KEY (`contest_id`) REFERENCES `contest_contest` (`id`),
  CONSTRAINT `contest_contestappli_member_id_dbdbcb09_fk_member_me` FOREIGN KEY (`member_id`) REFERENCES `member_member` (`id`),
  CONSTRAINT `contest_contestapplication_work_id_9ef2933b_fk_work_work_id` FOREIGN KEY (`work_id`) REFERENCES `work_work` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contest_contestapplication`
--

LOCK TABLES `contest_contestapplication` WRITE;
/*!40000 ALTER TABLE `contest_contestapplication` DISABLE KEYS */;
INSERT INTO `contest_contestapplication` VALUES (4,'2025-02-14 04:21:59.855308',NULL,5,27,39);
/*!40000 ALTER TABLE `contest_contestapplication` ENABLE KEYS */;
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
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_member_member_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_member_member_id` FOREIGN KEY (`user_id`) REFERENCES `member_member` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2025-02-05 01:38:32.279252','1','株式会社miitaso - 6F8A7Z',1,'[{\"added\": {}}]',6,1),(2,'2025-02-05 01:40:29.872748','2','株式会社ElasticTech - ZZT9GW',1,'[{\"added\": {}}]',6,1),(3,'2025-02-05 01:46:32.180970','1','その他アート',1,'[{\"added\": {}}]',11,1),(4,'2025-02-05 01:46:39.517105','2','料理',1,'[{\"added\": {}}]',11,1),(5,'2025-02-05 01:47:07.783729','2','料理',3,'',11,1),(6,'2025-02-05 01:47:07.783778','1','その他アート',3,'',11,1),(7,'2025-02-05 01:47:20.653088','3','絵画',1,'[{\"added\": {}}]',11,1),(8,'2025-02-05 01:47:25.765964','4','彫刻',1,'[{\"added\": {}}]',11,1),(9,'2025-02-05 01:47:30.373623','5','衣装',1,'[{\"added\": {}}]',11,1),(10,'2025-02-05 01:47:34.771659','6','ファッション',1,'[{\"added\": {}}]',11,1),(11,'2025-02-05 01:47:39.255296','7','クラフト',1,'[{\"added\": {}}]',11,1),(12,'2025-02-05 01:47:43.994446','8','写真',1,'[{\"added\": {}}]',11,1),(13,'2025-02-05 03:05:48.856253','1','お絵描きレッスン',1,'[{\"added\": {}}]',20,1),(14,'2025-02-05 03:06:42.374753','1','初心者歓迎',1,'[{\"added\": {}}]',12,1),(15,'2025-02-05 03:06:45.821093','1','お絵描きレッスン',2,'[{\"changed\": {\"fields\": [\"Tags\"]}}]',20,1),(16,'2025-02-05 03:07:59.692370','1','お絵描きレッスン',2,'[]',20,1),(17,'2025-02-05 04:04:53.076657','1','2025年春のコンテスト (株式会社miitaso)',1,'[{\"added\": {}}]',16,1),(18,'2025-02-05 06:04:08.833553','1','株式会社miitaso - 6F8A7Z',3,'',6,1),(19,'2025-02-06 02:59:09.296218','15','moiz',2,'[{\"changed\": {\"fields\": [\"Parent Account\"]}}]',10,1),(20,'2025-02-06 08:34:06.742452','3','テスト会社 - VY7JKA',1,'[{\"added\": {}}]',6,1),(21,'2025-02-06 08:40:46.696390','4','作品',1,'[{\"added\": {}}]',13,17),(22,'2025-02-10 04:43:06.437583','2','株式会社ElasticTech - ZZT9GW',2,'[{\"changed\": {\"fields\": [\"Username\", \"Address\", \"City\", \"Country\"]}}]',6,1),(23,'2025-02-10 06:20:54.955778','2','テストコンテスト (株式会社ElasticTech)',1,'[{\"added\": {}}]',16,1),(24,'2025-02-10 07:15:16.135588','2','テストクラス',1,'[{\"added\": {}}]',20,1),(25,'2025-02-10 07:16:11.395698','2','テストクラス',2,'[{\"changed\": {\"fields\": [\"Url\"]}}]',20,1),(26,'2025-02-10 23:27:06.877695','5','moiz organization - 6T4AMQ',1,'[{\"added\": {}}]',6,1),(27,'2025-02-13 04:44:54.228180','27','',3,'',13,1),(28,'2025-02-13 04:46:45.609938','9','',3,'',13,1),(29,'2025-02-13 13:47:53.396310','5','moiz organization - 6T4AMQ',3,'',6,1),(30,'2025-02-13 13:48:49.860912','25','mirza.moiz65@gmail.com',3,'',9,1),(31,'2025-02-13 13:49:43.501060','6','moiz sample org - 2TTH2B',1,'[{\"added\": {}}]',6,1),(32,'2025-02-13 14:38:25.936736','3','テストコンテスト名 (株式会社ElasticTech)',1,'[{\"added\": {}}]',16,1),(33,'2025-02-13 14:47:11.134077','3','テストコンテスト名 (株式会社ElasticTech)',2,'[{\"changed\": {\"fields\": [\"Start date\", \"End date\", \"Winner\"]}}]',16,1),(34,'2025-02-13 14:50:28.412898','4','あ (株式会社ElasticTech)',1,'[{\"added\": {}}]',16,1),(35,'2025-02-14 03:52:03.084093','7','ACFa - LTPY9N',1,'[{\"added\": {}}]',6,1),(36,'2025-02-14 04:11:15.633371','5','Kimonoデザインコンテスト (ACFa)',1,'[{\"added\": {}}]',16,1),(37,'2025-02-14 04:13:11.167658','5','Kimonoデザインコンテスト (ACFa)',2,'[{\"changed\": {\"fields\": [\"Explanation\", \"Eligible criteria\"]}}]',16,1),(38,'2025-02-14 04:13:54.865145','5','Kimonoデザインコンテスト (ACFa)',2,'[{\"changed\": {\"fields\": [\"Thumbnail\"]}}]',16,1),(39,'2025-02-14 04:14:38.017218','4','あ (株式会社ElasticTech)',3,'',16,1),(40,'2025-02-14 04:14:38.017264','3','テストコンテスト名 (株式会社ElasticTech)',3,'',16,1),(41,'2025-02-14 04:14:38.017288','2','テストコンテスト (株式会社ElasticTech)',3,'',16,1),(42,'2025-02-14 04:15:55.735789','5','Kimonoデザインコンテスト (ACFa)',2,'[{\"changed\": {\"fields\": [\"Start date\"]}}]',16,1),(43,'2025-02-14 04:44:30.172248','3','KImonoデザイン',1,'[{\"added\": {}}]',20,1),(44,'2025-02-14 04:48:12.605652','1','フリーペイント',2,'[{\"changed\": {\"fields\": [\"Name\", \"Class type\", \"Thumbnail\", \"Url\", \"Start date\", \"End date\", \"Description\"]}}]',20,1),(45,'2025-02-14 04:48:21.514691','2','テストクラス',3,'',20,1),(46,'2025-02-14 04:49:36.330206','3','KImonoデザイン',2,'[{\"changed\": {\"fields\": [\"Start date\"]}}]',20,1),(47,'2025-02-14 04:57:38.963506','3','KImonoデザイン',2,'[{\"changed\": {\"fields\": [\"Url\"]}}]',20,1),(48,'2025-02-14 04:58:43.218032','3','KImonoデザイン',2,'[{\"changed\": {\"fields\": [\"Url\", \"Description\"]}}]',20,1),(49,'2025-02-17 02:18:47.616544','1','フリーペイント',2,'[{\"changed\": {\"fields\": [\"Url\"]}}]',20,1),(50,'2025-02-17 02:48:49.060019','3','KImonoデザイン',2,'[{\"changed\": {\"fields\": [\"Url\"]}}]',20,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(23,'advertisement','advertisement'),(20,'artist_class','artistclass'),(21,'artist_class','memberclasssignup'),(22,'artist_class','payment'),(3,'auth','group'),(2,'auth','permission'),(18,'billing','plan'),(19,'billing','subscription'),(4,'contenttypes','contenttype'),(16,'contest','contest'),(17,'contest','contestapplication'),(25,'inquiry','inquiry'),(7,'member','member'),(6,'member','organization'),(10,'member','profilemember'),(8,'member','regularmember'),(9,'member','staffmember'),(24,'public_site','publicnavbar'),(5,'sessions','session'),(11,'work','category'),(14,'work','image'),(15,'work','like'),(12,'work','tag'),(13,'work','work');
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
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-02-04 00:52:30.240575'),(2,'contenttypes','0002_remove_content_type_name','2025-02-04 00:52:30.437882'),(3,'auth','0001_initial','2025-02-04 00:52:31.270242'),(4,'auth','0002_alter_permission_name_max_length','2025-02-04 00:52:31.442893'),(5,'auth','0003_alter_user_email_max_length','2025-02-04 00:52:31.452317'),(6,'auth','0004_alter_user_username_opts','2025-02-04 00:52:31.460005'),(7,'auth','0005_alter_user_last_login_null','2025-02-04 00:52:31.467588'),(8,'auth','0006_require_contenttypes_0002','2025-02-04 00:52:31.470729'),(9,'auth','0007_alter_validators_add_error_messages','2025-02-04 00:52:31.477895'),(10,'auth','0008_alter_user_username_max_length','2025-02-04 00:52:31.485435'),(11,'auth','0009_alter_user_last_name_max_length','2025-02-04 00:52:31.492751'),(12,'auth','0010_alter_group_name_max_length','2025-02-04 00:52:31.535303'),(13,'auth','0011_update_proxy_permissions','2025-02-04 00:52:31.544045'),(14,'auth','0012_alter_user_first_name_max_length','2025-02-04 00:52:31.551404'),(15,'member','0001_initial','2025-02-04 00:52:33.334992'),(16,'admin','0001_initial','2025-02-04 00:52:33.642921'),(17,'admin','0002_logentry_remove_auto_add','2025-02-04 00:52:33.656524'),(18,'admin','0003_logentry_add_action_flag_choices','2025-02-04 00:52:33.669767'),(19,'advertisement','0001_initial','2025-02-04 00:52:33.731815'),(20,'advertisement','0002_advertisement_add_type','2025-02-04 00:52:33.843636'),(21,'advertisement','0003_alter_advertisement_options_and_more','2025-02-04 00:52:33.856653'),(22,'work','0001_initial','2025-02-04 00:52:35.139434'),(23,'work','0002_remove_work_likes_like','2025-02-04 00:52:35.472735'),(24,'work','0003_work_is_approved','2025-02-04 00:52:35.652169'),(25,'work','0004_alter_work_options','2025-02-04 00:52:35.669239'),(26,'work','0005_alter_category_options_alter_image_options_and_more','2025-02-04 00:52:35.901146'),(27,'artist_class','0001_initial','2025-02-04 00:52:35.929917'),(28,'artist_class','0002_memberclasssignup','2025-02-04 00:52:36.310764'),(29,'artist_class','0003_rename_youtube_url_artistclass_url_and_more','2025-02-04 00:52:36.430331'),(30,'artist_class','0004_memberclasssignup_attended_and_more','2025-02-04 00:52:36.921520'),(31,'artist_class','0005_remove_artistclass_tag_artistclass_tags','2025-02-04 00:52:37.335122'),(32,'artist_class','0006_artistclass_cost_payment','2025-02-04 00:52:38.008844'),(33,'artist_class','0007_alter_artistclass_options','2025-02-04 00:52:38.020449'),(34,'artist_class','0008_alter_artistclass_options_alter_artistclass_category_and_more','2025-02-04 00:52:38.119878'),(35,'billing','0001_initial','2025-02-04 00:52:38.318605'),(36,'billing','0002_plan_credits_subscription_plan','2025-02-04 00:52:38.547862'),(37,'billing','0003_rename_user_subscription_member_remove_plan_credits','2025-02-04 00:52:38.905630'),(38,'billing','0004_alter_plan_options_alter_subscription_options_and_more','2025-02-04 00:52:39.048786'),(39,'member','0002_alter_member_options_and_more','2025-02-04 00:52:39.187054'),(40,'member','0003_remove_member_admin_role_remove_member_is_verified_and_more','2025-02-04 00:52:40.018691'),(41,'member','0004_member_address','2025-02-04 00:52:40.135326'),(42,'member','0005_remove_member_organization_member_is_published_and_more','2025-02-04 00:52:41.025518'),(43,'member','0006_remove_member_shared_users_member_shared_users','2025-02-04 00:52:41.539058'),(44,'member','0007_organization_organization_profile_picture','2025-02-04 00:52:41.642838'),(45,'member','0008_rename_organization_profile_picture_organization_organization_icon','2025-02-04 00:52:41.808877'),(46,'member','0009_alter_member_email','2025-02-04 00:52:41.866067'),(47,'member','0010_member_organization_organizationbranch','2025-02-04 00:52:42.238780'),(48,'member','0011_organization_email_organization_staff_name','2025-02-04 00:52:42.528241'),(49,'member','0012_regularmember_staffmember','2025-02-04 00:52:42.534683'),(50,'member','0013_member_branch','2025-02-04 00:52:42.741544'),(51,'contest','0001_initial','2025-02-04 00:52:42.944343'),(52,'contest','0002_contest_created_at_contest_is_private_and_more','2025-02-04 00:52:43.317666'),(53,'contest','0003_contest_award_condition_contest_eligibility_criteria','2025-02-04 00:52:43.530090'),(54,'contest','0004_contestapplication','2025-02-04 00:52:44.044884'),(55,'contest','0005_contest_branch','2025-02-04 00:52:44.231797'),(56,'contest','0006_alter_contest_branch','2025-02-04 00:52:44.260226'),(57,'contest','0007_contest_winner','2025-02-04 00:52:44.420214'),(58,'contest','0008_remove_contest_branch','2025-02-04 00:52:44.542371'),(59,'member','0014_remove_member_branch_delete_organizationbranch','2025-02-04 00:52:44.832651'),(60,'member','0015_organization_parent','2025-02-04 00:52:45.013985'),(61,'member','0016_alter_organization_options_alter_member_address_and_more','2025-02-04 00:52:45.524912'),(62,'contest','0009_alter_contest_options','2025-02-04 00:52:45.542911'),(63,'contest','0010_alter_contest_options_and_more','2025-02-04 00:52:45.829182'),(64,'inquiry','0001_initial','2025-02-04 00:52:45.854151'),(65,'inquiry','0002_alter_inquiry_options_alter_inquiry_created_at_and_more','2025-02-04 00:52:45.867054'),(66,'member','0017_remove_organization_organization_type_and_more','2025-02-04 00:52:46.435632'),(67,'member','0018_profilemember','2025-02-04 00:52:46.440976'),(68,'public_site','0001_initial','2025-02-04 00:52:46.463742'),(69,'public_site','0002_alter_publicnavbar_options_and_more','2025-02-04 00:52:46.475290'),(70,'sessions','0001_initial','2025-02-04 00:52:46.562735'),(71,'artist_class','0009_artistclass_description','2025-02-05 06:05:25.914829'),(72,'member','0019_organization_city_organization_country_and_more','2025-02-05 06:05:26.307735'),(73,'member','0020_organization_custom_email_address_and_more','2025-02-05 06:05:26.412894'),(74,'work','0006_alter_work_title','2025-02-10 05:31:20.656552'),(75,'artist_class','0010_payment_stripe_payment_intent_secret','2025-02-11 01:20:24.138829'),(76,'artist_class','0011_artistclass_currency','2025-02-11 01:20:24.224309'),(77,'billing','0005_alter_plan_currency','2025-02-11 01:20:24.232230'),(78,'artist_class','0012_alter_artistclass_thumbnail_alter_artistclass_url','2025-02-17 02:49:09.938922');
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
INSERT INTO `django_session` VALUES ('0b5bfa5he5m0lj73jmlelkglulvahtvj','.eJxVjMEOwiAQRP-FsyFbhBU8eu83kGUBqRqalPZk_Hdp0oNe5jDvzbyFp20tfmtp8VMUVzGI028XiJ-p7iA-qN5nyXNdlynIXZEHbXKcY3rdDvfvoFArfQ3BAFnWOiuNSEyAnJxFoDMRcLKKhp5gLypHtJQRQ7edcdogGiM-X-fWN6M:1tf7J8:ODW5bpJ1SNcWamKb7S6SEAx7m7iMgPBteec8wmorT4M','2025-02-18 01:00:54.528259'),('4brpq5m9637kjm6hm602xb7tq5kvidq5','.eJxVjMEOwiAQRP-FsyFbhBU8eu83kGUBqRqalPZk_Hdp0oNe5jDvzbyFp20tfmtp8VMUVzGI028XiJ-p7iA-qN5nyXNdlynIXZEHbXKcY3rdDvfvoFArfQ3BAFnWOiuNSEyAnJxFoDMRcLKKhp5gLypHtJQRQ7edcdogGiM-X-fWN6M:1tfUOJ:KVBgXnNdGXVBUE24XoE-fy1fl0UrKaqHJfixCTnc9s8','2025-02-19 01:39:47.870175'),('cel8vlwjowmvf16gcqf993i17i2xi40n','.eJxVjMEOwiAQRP-FsyFbhBU8eu83kGUBqRqalPZk_Hdp0oNe5jDvzbyFp20tfmtp8VMUVzGI028XiJ-p7iA-qN5nyXNdlynIXZEHbXKcY3rdDvfvoFArfQ3BAFnWOiuNSEyAnJxFoDMRcLKKhp5gLypHtJQRQ7edcdogGiM-X-fWN6M:1tfVWH:1GV_JQCYS1znn93FRCCzUMxQVNX2AV3Xd_oTXGJTTqI','2025-02-19 02:52:05.139407'),('drelqj435570g63pm8dzr7qq84jsxsf1','.eJxVjMEOwiAQRP-FsyFbhBU8eu83kGUBqRqalPZk_Hdp0oNe5jDvzbyFp20tfmtp8VMUVzGI028XiJ-p7iA-qN5nyXNdlynIXZEHbXKcY3rdDvfvoFArfQ3BAFnWOiuNSEyAnJxFoDMRcLKKhp5gLypHtJQRQ7edcdogGiM-X-fWN6M:1timbc:_72q48hd8WjxXxlOY8MMXoLefBvXfcnsjaOHut9VofQ','2025-02-28 03:43:08.168781'),('rv3qsdtb2b112krcdtetu4og463sqild','.eJxVjMEOwiAQRP-FsyFbhBU8eu83kGUBqRqalPZk_Hdp0oNe5jDvzbyFp20tfmtp8VMUVzGI028XiJ-p7iA-qN5nyXNdlynIXZEHbXKcY3rdDvfvoFArfQ3BAFnWOiuNSEyAnJxFoDMRcLKKhp5gLypHtJQRQ7edcdogGiM-X-fWN6M:1tiR55:bkfZw8urHPu6Yocm-MHJZe7dC1UZwPD8MXiMBr9FROo','2025-02-27 04:44:07.008663'),('w1df5o0n6ysvsiik7h1uggdz4dimfgo9','.eJxVjMEOwiAQRP-FsyFbhBU8eu83kGUBqRqalPZk_Hdp0oNe5jDvzbyFp20tfmtp8VMUVzGI028XiJ-p7iA-qN5nyXNdlynIXZEHbXKcY3rdDvfvoFArfQ3BAFnWOiuNSEyAnJxFoDMRcLKKhp5gLypHtJQRQ7edcdogGiM-X-fWN6M:1tk2fo:RMubzqPctqgC6ih_Qhp8XUV_wv6b15wqe07w40zGXkk','2025-03-03 15:04:40.365137');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inquiry_inquiry`
--

DROP TABLE IF EXISTS `inquiry_inquiry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inquiry_inquiry` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_email` varchar(254) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `inquiry_message` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inquiry_inquiry`
--

LOCK TABLES `inquiry_inquiry` WRITE;
/*!40000 ALTER TABLE `inquiry_inquiry` DISABLE KEYS */;
INSERT INTO `inquiry_inquiry` VALUES (1,'','','n','22222222222','2025-02-05 04:53:31.565835'),(2,'','','asd','123qweasdadw','2025-02-10 06:13:31.716874'),(3,'kosaku.tsubata.japan@gmail.com','','Jsjajsnsnns','Nsjzjsznsnz','2025-02-10 14:08:24.869558'),(4,'kenchan@museume.com','','らまらまらまらま','やまらまらまらまらまらたらたらた','2025-02-10 14:13:20.371313'),(5,'kenchan@museume.com','','らまらまらまらま','やまらまらまらまらまらたらたらた','2025-02-10 14:13:31.239673'),(6,'kenchan@museume.com','','らまりみら','ゃらまらまらまらまはまはまらま','2025-02-10 14:13:42.882237'),(7,'kenchan@museume.com','','やまらまらま','ららまらまらみらまらまら','2025-02-10 14:13:56.210378'),(8,'kenchan@museume.com','','らまらまらまららまら','らまらまらまらまらまらまらまらまら','2025-02-10 14:14:21.167229'),(9,'solaha07@gmail.com','','test','testtyynaoshnnnnnnnn;an','2025-02-13 00:52:44.663292'),(10,'','','nagoyerahia','sniowhaoieaijaonsgfeoshois','2025-02-13 00:53:19.154115'),(11,'mirza.moiz65@gmail.com','admin','test','test is test','2025-02-16 23:14:16.452828'),(12,'mirza.moiz65@gmail.com','admin','test','test is test','2025-02-16 23:16:02.619264');
/*!40000 ALTER TABLE `inquiry_inquiry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_member`
--

DROP TABLE IF EXISTS `member_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_member` (
  `id` bigint NOT NULL AUTO_INCREMENT,
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
  `date_of_birth` date DEFAULT NULL,
  `profile_picture` varchar(100) DEFAULT NULL,
  `parent_id` bigint DEFAULT NULL,
  `role` varchar(50) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL,
  `organization_id` bigint DEFAULT NULL,
  `is_approved` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `member_member_email_c06f8d2b_uniq` (`email`),
  KEY `member_member_parent_id_70c6d482_fk_member_member_id` (`parent_id`),
  KEY `member_member_organization_id_e8856dc9_fk_member_organization_id` (`organization_id`),
  CONSTRAINT `member_member_organization_id_e8856dc9_fk_member_organization_id` FOREIGN KEY (`organization_id`) REFERENCES `member_organization` (`id`),
  CONSTRAINT `member_member_parent_id_70c6d482_fk_member_member_id` FOREIGN KEY (`parent_id`) REFERENCES `member_member` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_member`
--

LOCK TABLES `member_member` WRITE;
/*!40000 ALTER TABLE `member_member` DISABLE KEYS */;
INSERT INTO `member_member` VALUES (1,'pbkdf2_sha256$870000$Gq4gyp9jZ7wJLMihDx61br$A/qO3amATfHMuJu0qPsFEgC9F5qWGm0VqsMRVx7m23Y=','2025-02-17 15:04:40.359833',1,'admin','','','admin@admin.com',1,1,'2025-02-04 00:53:19.242329',NULL,'',NULL,'protector',NULL,0,NULL,0),(2,'pbkdf2_sha256$870000$67zvYDSz9qIPdgWxin6yHb$KbfPLwUllRnF+MTXGWKf8NUA6j8HyGDJ5D6Mztbx2rQ=','2025-02-05 01:39:10.830176',0,'kkokkokko2345@yahoo.co.jp','津端','','kkokkokko2345@yahoo.co.jp',1,1,'2025-02-05 01:38:28.709062',NULL,'',NULL,'company_admin',NULL,0,NULL,0),(3,'pbkdf2_sha256$870000$IEyUsQrVJwzgJGHYalglYI$/nDFt4A+SCVXm6+IHZCyq/mtGnL519fwpTK4X8XWOhs=','2025-02-10 07:01:43.219603',0,'kofskey@ymail.ne.jp','田中健介','','kofskey@ymail.ne.jp',1,1,'2025-02-05 01:40:26.211448',NULL,'',NULL,'company_admin',NULL,0,2,0),(4,'pbkdf2_sha256$870000$5UULOyFMStLIinz2AWz2Jm$uVzmq4rxa/cQHowxRk/fhc2d8ACDY4OKevTzSPWHa2w=',NULL,0,'kosaku.tsubata@gmail.com','','','kosaku.tsubata@gmail.com',0,1,'2025-02-05 01:41:07.656392',NULL,'',NULL,'protector',NULL,0,NULL,0),(5,'pbkdf2_sha256$870000$c5KFVAuHvdg9n8Ivp1eMGj$3odVwuFeCe+p/pgB6TauxdVZccev84oqDL/LkiKdERI=',NULL,0,'Kofsaku','','','Kofsaku@museume.com',0,1,'2025-02-05 01:42:50.608039','1994-02-07','profile_pics/スクリーンショット_2025-02-05_10_Uyl6bHm.42.43.png',4,'child','東京都',0,NULL,0),(6,'pbkdf2_sha256$870000$Uskj56PwCLTFJtisi6bQl5$lvAMO6D+j9TGTtGYLZKJ2cxaKKAUvju9xvvnZMFQTTA=',NULL,0,'Sacchan','','','Sacchan@museume.com',0,1,'2025-02-05 02:41:14.519462','1991-06-13','profile_pics/スクリーンショット_2025-02-05_11_4VuAp05.41.06.png',4,'child','北海道',0,NULL,0),(7,'pbkdf2_sha256$870000$2z2A83WN8lrJnG3iS3dLob$KVz7t9OvXqTWoEeqeFGlTqmEp+dRbeUS/45h4Oy+8ww=',NULL,0,'kosaku.tsubata.japan@gmail.com','','','kosaku.tsubata.japan@gmail.com',0,1,'2025-02-05 02:43:25.307354',NULL,'',NULL,'protector',NULL,0,NULL,0),(8,'pbkdf2_sha256$870000$oUce6g9ICGVM6on74Faa8K$vpbSv0tyB1Hgbwmxg5G+mS5W6W2mtMPeks3eJNjKUEU=',NULL,0,'kenchan','','','kenchan@museume.com',0,1,'2025-02-05 02:45:52.205317','2011-08-03','profile_pics/スクリーンショット_2025-02-05_11_Jas3WmC.45.45.png',7,'child',NULL,0,NULL,0),(9,'pbkdf2_sha256$870000$pFmH8Pn2crVjNmYrp7EtWv$AY37xdhQkBlZXzWdjhv0WF1SM4diAnhm/W6jQq1QRMk=',NULL,0,'chikuwa_md@yahoo.co.jp','','','chikuwa_md@yahoo.co.jp',0,0,'2025-02-05 03:59:01.973384',NULL,'',NULL,'protector',NULL,0,NULL,0),(10,'pbkdf2_sha256$870000$R9LLc2uO2D7y18whJpNKpC$uut7vgVKKclaogWGiCa2TUviGm0dGVUYSxwdYasGyqE=',NULL,0,'solaha07@gmail.com','','','solaha07@gmail.com',0,1,'2025-02-05 04:59:15.632167',NULL,'',NULL,'protector',NULL,0,NULL,0),(11,'pbkdf2_sha256$870000$OLpirYoWAMTpuVPfUaGXPp$3YiED1tpr5oroRLMfAivb9bSPOmAYtpnHzAi+OrgJTE=',NULL,0,'kosaku.tsubata@tolico.com','','','kosaku.tsubata@tolico.com',0,1,'2025-02-05 05:07:51.163808',NULL,'',NULL,'protector',NULL,0,NULL,0),(12,'pbkdf2_sha256$870000$Ltw8zpLXEIOVuIQEt5X4MK$wYSx/jw2dPqIwcIrVMlTSQLMAlnAUT5fG/gimb2UFzU=',NULL,0,'chikuwa_md@yahoo.co.jpa','','','chikuwa_md@yahoo.co.jpa',0,0,'2025-02-05 05:13:03.651809',NULL,'',NULL,'protector',NULL,0,NULL,0),(13,'pbkdf2_sha256$870000$1i8ZuqflqkTx4NP2Km5Ihh$cQeG1+JvMDNcl2NbHdPfnVQTjv6uTjrwKHdWMYqviYc=',NULL,0,'Sena','','','Sena@museume.com',0,1,'2025-02-05 05:48:16.707113','2017-07-11','profile_pics/IMG_05877DCF08B1-1_jI9dv57.jpeg',10,'child','東京都',0,NULL,0),(14,'pbkdf2_sha256$870000$tc6j51JxD7FeSslwwNAtcI$d/OV6nJUATYaqUTuqwvQ0emJrsUvM+kew54MTBZ74rM=',NULL,0,'mirzamoiz65@gmail.com','','','mirzamoiz65@gmail.com',0,1,'2025-02-05 06:13:17.314824',NULL,'',NULL,'protector',NULL,0,NULL,0),(15,'pbkdf2_sha256$870000$9k9FW7yWd4oO0vCo9WVD2v$KKmOx/ZkQ8E0Knygxu9wBmcgnkf3/ofuFHb6Bb+tcnk=',NULL,0,'moiz','','','moiz@museume.com',0,1,'2025-02-05 06:14:19.704490','2025-02-06','',14,'child','秋田県',0,NULL,0),(16,'pbkdf2_sha256$870000$mnCtPDsnW8ejZ0x326XfY6$z7jXcOamPA1QYDYU0IoftIAeecF5d6h1zXN6Y4adlq8=',NULL,0,'ignitemotivationfire@gmail.com','','','ignitemotivationfire@gmail.com',0,1,'2025-02-06 03:45:40.811159',NULL,'',NULL,'protector',NULL,0,NULL,0),(17,'pbkdf2_sha256$870000$DC8AVOmX6CIuBBFQgX5yJb$A+FWnBFgBkl+uha+mOYvfWrKorub/FOEJ2o11sOboPQ=','2025-02-06 08:35:34.133225',0,'kosaku.tsubata@miitaso.com','スタッフ名','','kosaku.tsubata@miitaso.com',1,1,'2025-02-06 08:34:04.180851',NULL,'',NULL,'company_admin',NULL,0,3,0),(18,'pbkdf2_sha256$870000$OW17gckIKC3251vRnZUl1L$WbgEgRoP22ekFHJmo/7WDgGn2foGdHvycN/05EA3RC8=',NULL,0,'test','','','test@museume.com',0,1,'2025-02-06 08:37:11.018492','2011-08-31','',16,'child',NULL,0,NULL,0),(19,'pbkdf2_sha256$870000$jZe7SMAnpBPR1L8P80UZ7O$kC7aek6wV+C0CXBwGxWY/6ibR710ou00z/+S+9a0YhQ=',NULL,0,'sadfas','','','sadfas@museume.com',0,1,'2025-02-06 15:31:56.297719','2024-10-02','',16,'child','秋田県',0,NULL,0),(20,'pbkdf2_sha256$870000$DLXWthF3sqcb2cTqNuKtAz$LmM5DAhK/SLirZ4CuxNME/MuqfxcJ6b9DqKqgd9a5m4=',NULL,0,'asdfas','','','asdfas@museume.com',0,1,'2025-02-07 02:47:11.044738','2024-10-30','',7,'child','栃木県',0,NULL,0),(21,'pbkdf2_sha256$870000$tyYsy26ce0RWqF5KPu7EVC$Jnezz4Y88YGDAATdTNaknqCMBNLiHQrYCj0jXMRqcUs=',NULL,0,'asdfasdf','','','asdfasdf@museume.com',0,1,'2025-02-07 02:51:24.124168','2025-02-12','',7,'child','千葉県',0,NULL,0),(22,'pbkdf2_sha256$870000$ch6FdWZ1plSppY7i3QdVp4$5rxm62BWUgDvf5mYg0Z5qBlghwjazsnGobCO0EUe0pU=',NULL,0,'81.ari.y@gmail.com','','','81.ari.y@gmail.com',0,1,'2025-02-10 05:46:26.483102',NULL,'',NULL,'protector',NULL,0,NULL,0),(23,'pbkdf2_sha256$870000$qtZLETkDIME9Gfgk0IFgco$KMf5nrjgCls5Kh7h3/QKdJ6cdLI3RAuvCW2KMmOVeXA=',NULL,0,'Ay','','','Ay@museume.com',0,1,'2025-02-10 05:48:53.799135','1970-08-26','profile_pics/2233_2_MOliNiv.png',22,'child','東京都',0,NULL,0),(24,'pbkdf2_sha256$870000$6QdkTNJEi2oXbXxZNPmCZv$q3lTjgkLS2I75RrWvaMGfZ9Xrgj8w/hEBYcV+eZUSg4=',NULL,0,'asdfa','','','asdfa@museume.com',0,1,'2025-02-10 06:16:07.488519','2024-05-07','',3,'child','宮城県',0,NULL,0),(26,'pbkdf2_sha256$870000$8Cq4WmSBwxUTYwtldaDwNC$SPdAe/4jCFcrJ7ZY9K3eeeGXGQFKCRRZKGU0L/Tk9zg=',NULL,0,'lkmnsonoad','','','lkmnsonoad@museume.com',0,1,'2025-02-13 03:34:41.260094','2014-02-13','',1,'child','宮城県',0,NULL,0),(27,'pbkdf2_sha256$870000$BGWKqEKOmAigXAQhq4QOOJ$aqpFt4fhHIgF2nRqhSL+zH2PK/Aiup+Dmdsu5Os+BCk=',NULL,0,'Sora','','','Sora@museume.com',0,1,'2025-02-13 03:58:00.937464','2014-07-11','profile_pics/IMG_1902_NwDBADQ.jpg',10,'child','アメリカ合衆国 (United States)',0,NULL,0),(28,'pbkdf2_sha256$870000$4bbAZbgF1C8Q0RkqHodDcg$sATGFNTduqvEtPdQQD3eM5JDE3UlNXdUPBUVeVQksws=','2025-02-13 13:50:22.582602',0,'mirza.moiz65@gmail.com','admin','','mirza.moiz65@gmail.com',1,1,'2025-02-13 13:49:40.158843',NULL,'',NULL,'company_admin',NULL,0,6,0),(29,'pbkdf2_sha256$870000$SEbSOLsr02L7BQIoos3tsE$FX1XGbY/Vkv4gqvjjzjdXHlxuYxtKEqMfpuqALe9adQ=',NULL,0,'naoh@seso-j.com','Yui','','naoh@seso-j.com',1,1,'2025-02-14 03:52:00.003375',NULL,'',NULL,'company_admin',NULL,0,7,0);
/*!40000 ALTER TABLE `member_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_member_groups`
--

DROP TABLE IF EXISTS `member_member_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_member_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `member_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `member_member_groups_member_id_group_id_5e086b6e_uniq` (`member_id`,`group_id`),
  KEY `member_member_groups_group_id_f303e195_fk_auth_group_id` (`group_id`),
  CONSTRAINT `member_member_groups_group_id_f303e195_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `member_member_groups_member_id_87866934_fk_member_member_id` FOREIGN KEY (`member_id`) REFERENCES `member_member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_member_groups`
--

LOCK TABLES `member_member_groups` WRITE;
/*!40000 ALTER TABLE `member_member_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `member_member_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_member_organizations`
--

DROP TABLE IF EXISTS `member_member_organizations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_member_organizations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `member_id` bigint NOT NULL,
  `organization_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `member_member_organizati_member_id_organization_i_8819a505_uniq` (`member_id`,`organization_id`),
  KEY `member_member_organi_organization_id_74e9edf2_fk_member_or` (`organization_id`),
  CONSTRAINT `member_member_organi_member_id_88fbeb21_fk_member_me` FOREIGN KEY (`member_id`) REFERENCES `member_member` (`id`),
  CONSTRAINT `member_member_organi_organization_id_74e9edf2_fk_member_or` FOREIGN KEY (`organization_id`) REFERENCES `member_organization` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_member_organizations`
--

LOCK TABLES `member_member_organizations` WRITE;
/*!40000 ALTER TABLE `member_member_organizations` DISABLE KEYS */;
INSERT INTO `member_member_organizations` VALUES (3,8,2),(2,18,3);
/*!40000 ALTER TABLE `member_member_organizations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_member_shared_users`
--

DROP TABLE IF EXISTS `member_member_shared_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_member_shared_users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `from_member_id` bigint NOT NULL,
  `to_member_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `member_member_shared_use_from_member_id_to_member_c31c6ec3_uniq` (`from_member_id`,`to_member_id`),
  KEY `member_member_shared_to_member_id_cb82eda0_fk_member_me` (`to_member_id`),
  CONSTRAINT `member_member_shared_from_member_id_a24eb527_fk_member_me` FOREIGN KEY (`from_member_id`) REFERENCES `member_member` (`id`),
  CONSTRAINT `member_member_shared_to_member_id_cb82eda0_fk_member_me` FOREIGN KEY (`to_member_id`) REFERENCES `member_member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_member_shared_users`
--

LOCK TABLES `member_member_shared_users` WRITE;
/*!40000 ALTER TABLE `member_member_shared_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `member_member_shared_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_member_user_permissions`
--

DROP TABLE IF EXISTS `member_member_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_member_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `member_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `member_member_user_permi_member_id_permission_id_862ec18e_uniq` (`member_id`,`permission_id`),
  KEY `member_member_user_p_permission_id_740bffc2_fk_auth_perm` (`permission_id`),
  CONSTRAINT `member_member_user_p_member_id_6821d637_fk_member_me` FOREIGN KEY (`member_id`) REFERENCES `member_member` (`id`),
  CONSTRAINT `member_member_user_p_permission_id_740bffc2_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_member_user_permissions`
--

LOCK TABLES `member_member_user_permissions` WRITE;
/*!40000 ALTER TABLE `member_member_user_permissions` DISABLE KEYS */;
INSERT INTO `member_member_user_permissions` VALUES (6,2,22),(5,2,24),(2,2,34),(1,2,36),(4,2,38),(3,2,40),(10,2,50),(9,2,52),(8,2,62),(7,2,64),(16,3,22),(15,3,24),(12,3,34),(11,3,36),(14,3,38),(13,3,40),(20,3,50),(19,3,52),(18,3,62),(17,3,64),(26,17,22),(25,17,24),(22,17,34),(21,17,36),(24,17,38),(23,17,40),(30,17,50),(29,17,52),(28,17,62),(27,17,64),(46,28,22),(45,28,24),(42,28,34),(41,28,36),(44,28,38),(43,28,40),(50,28,50),(49,28,52),(48,28,62),(47,28,64),(56,29,22),(55,29,24),(52,29,34),(51,29,36),(54,29,38),(53,29,40),(60,29,50),(59,29,52),(58,29,62),(57,29,64);
/*!40000 ALTER TABLE `member_member_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_organization`
--

DROP TABLE IF EXISTS `member_organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_organization` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `address` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `organization_icon` varchar(100) DEFAULT NULL,
  `email` varchar(254) NOT NULL,
  `staff_name` varchar(255) NOT NULL,
  `parent_id` bigint DEFAULT NULL,
  `organization_code` varchar(6) NOT NULL,
  `city` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `custom_email_address` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `member_organization_username_3fc5d2c0_uniq` (`username`),
  KEY `member_organization_parent_id_0c6851bc_fk_member_organization_id` (`parent_id`),
  CONSTRAINT `member_organization_parent_id_0c6851bc_fk_member_organization_id` FOREIGN KEY (`parent_id`) REFERENCES `member_organization` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_organization`
--

LOCK TABLES `member_organization` WRITE;
/*!40000 ALTER TABLE `member_organization` DISABLE KEYS */;
INSERT INTO `member_organization` VALUES (2,'株式会社ElasticTech','address','2025-02-05 01:40:26.210149','2025-02-10 04:43:06.436084','','kofskey@ymail.ne.jp','田中健介',NULL,'ZZT9GW','city','japan','elastic',NULL),(3,'テスト会社','住所','2025-02-06 08:34:04.179458','2025-02-06 08:34:06.198251','','kosaku.tsubata@miitaso.com','スタッフ名',NULL,'VY7JKA','東京','日本','test_org','test_org@museume.art'),(6,'moiz sample org','fsd','2025-02-13 13:49:40.157450','2025-02-13 13:49:42.688018','','mirza.moiz65@gmail.com','admin',NULL,'2TTH2B','faisalabad','Pakistan','moizsampleorg','moizsampleorg@museume.art'),(7,'ACFa','Japan','2025-02-14 03:52:00.001779','2025-02-14 03:52:02.584800','','naoh@seso-j.com','Yui',NULL,'LTPY9N','Tokyo','Japan','ACFa','acfa@museume.art');
/*!40000 ALTER TABLE `member_organization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `public_site_publicnavbar`
--

DROP TABLE IF EXISTS `public_site_publicnavbar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `public_site_publicnavbar` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `url` varchar(100) NOT NULL,
  `navbar_type` varchar(10) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `public_site_publicnavbar`
--

LOCK TABLES `public_site_publicnavbar` WRITE;
/*!40000 ALTER TABLE `public_site_publicnavbar` DISABLE KEYS */;
/*!40000 ALTER TABLE `public_site_publicnavbar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work_category`
--

DROP TABLE IF EXISTS `work_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `work_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_category`
--

LOCK TABLES `work_category` WRITE;
/*!40000 ALTER TABLE `work_category` DISABLE KEYS */;
INSERT INTO `work_category` VALUES (7,'クラフト'),(6,'ファッション'),(8,'写真'),(4,'彫刻'),(3,'絵画'),(5,'衣装');
/*!40000 ALTER TABLE `work_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work_image`
--

DROP TABLE IF EXISTS `work_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `work_image` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image` varchar(100) NOT NULL,
  `hash` varchar(64) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `work_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hash` (`hash`),
  KEY `work_image_work_id_7dea5dfd_fk_work_work_id` (`work_id`),
  CONSTRAINT `work_image_work_id_7dea5dfd_fk_work_work_id` FOREIGN KEY (`work_id`) REFERENCES `work_work` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_image`
--

LOCK TABLES `work_image` WRITE;
/*!40000 ALTER TABLE `work_image` DISABLE KEYS */;
INSERT INTO `work_image` VALUES (1,'works/スクリーンショット_2025-02-05_10.44.51.png','c3a95d95c075b2c216550afeae9502abbbfa71b4430daa7955144409b16e5be3','2025-02-05 02:39:22.271577','2025-02-05 02:39:22.271616',1),(2,'works/スクリーンショット_2025-02-05_11.42.20.png','7fca8cea51f3f92601d1edfb4f6d28339564e96237d664575cda690f0c92a8a3','2025-02-05 02:42:53.879486','2025-02-05 02:42:53.879518',2),(3,'works/スクリーンショット_2025-02-05_12.15.29.png','6bbf80297b237690dd9008b44cce3263a12c91205bf25d980d661587833bf336','2025-02-05 03:15:52.916128','2025-02-05 03:15:52.916160',3),(4,'works/スクリーンショット_2025-02-05_14.08.56.png','a4db995c056563d1c3ab746c932fba52fe0da41f9b3d2ab95955a5d5fc0f301d','2025-02-06 08:40:46.692271','2025-02-06 08:40:46.692298',4),(5,'works/スクリーンショット_2025-02-10_15.45.37.png','d41219062008e8628ef01532f744187734b7760e7c4fd718953ea851c2d74a04','2025-02-10 07:01:29.266215','2025-02-10 07:01:29.266248',5),(6,'works/IMG_2481.jpeg','60e953c4ed6f8dbc01e871c174243dc4021a733573195f7630f004becd43054e','2025-02-10 14:15:45.894935','2025-02-10 14:15:45.894971',6),(8,'works/IMG_2480.jpeg','180daa5ee1b8fb4ecc31f91dfa960b66b9d41e32238475fb734015ccc52e8c46','2025-02-10 14:16:47.735139','2025-02-10 14:16:47.735185',8),(14,'works/スクリーンショット_2025-02-13_12.35.17.png','bd5a2c6200072bc715975eeca93093a6b24f7cd1e58df5186d4d2efa830b037d','2025-02-13 03:35:25.573951','2025-02-13 03:35:25.573988',10),(16,'works/スクリーンショット_2025-02-13_12.37.31.png','dfa6bb92411ccc3ac3c3a9d4905af39350a428221cb766d04374f0ab01daaea9','2025-02-13 03:37:48.701611','2025-02-13 03:37:48.701643',12),(17,'works/IMG_5921.jpeg','2e5e7831187fb00bae6042c34b88d187dc99a921f70ce36443272a74d66c8cd5','2025-02-13 03:49:36.525602','2025-02-13 03:49:36.525640',13),(18,'works/IMG_5922.jpeg','ddd7962b73b39c20b6681dbc58837dd76b183fa3f14205ca063e9b54f33219ab','2025-02-13 03:49:56.665598','2025-02-13 03:49:56.665633',14),(19,'works/IMG_5923.jpeg','c1ca5a112c071d0cf11a006e1315291352d7309b4563c18d832b103ac3e20935','2025-02-13 03:50:15.989861','2025-02-13 03:50:15.989896',15),(20,'works/IMG_5925_3LcKUnm.jpeg','1541384050824e071756d069322807192a8a073839b23edf8b069ba56095a44a','2025-02-13 03:50:31.010212','2025-02-13 03:50:31.010248',16),(26,'works/スクリーンショット_2025-02-13_13.33.59.png','c30cf7b3222265bb5740af072d2ba4ee682ab641a1592e4cf8f88b69c7ca0bcd','2025-02-13 04:34:04.441373','2025-02-13 04:34:04.441406',22),(30,'works/スクリーンショット_2025-02-13_13.34.42.png','74237c61b80c62a1f8eb629e085a2a8753e7bd60c22adec5308b17e915fc7aec','2025-02-13 04:34:48.222918','2025-02-13 04:34:48.222957',26),(32,'works/スクリーンショット_2025-02-13_13.35.22.png','25fb315f0d3d5613aa22e701076cfddc38090db24d4c48be7236ec10e2782938','2025-02-13 04:35:29.672459','2025-02-13 04:35:29.672505',28),(33,'works/スクリーンショット_2025-02-13_13.35.43.png','86d71738b81a2a8c6d3cd9dcefc2d19fb6108ea287a599d3c3b48059a1e38821','2025-02-13 04:35:47.561580','2025-02-13 04:35:47.561611',29),(34,'works/スクリーンショット_2025-02-13_13.39.16.png','6a1c2734f6065c3bca1434df15175b1c58fa6afbabf4c851f9114b1454acdbeb','2025-02-13 04:39:21.832386','2025-02-13 04:39:21.832416',30),(36,'works/S__1630213_0.jpg','009c56dd04f60f751e668b531ce6c9d2d7630b6a0934d80ef22b2216baf697d3','2025-02-13 04:41:23.424490','2025-02-13 04:41:23.424524',32),(37,'works/S__1630215_0.jpg','09937de6cf160862bcf236505b5258056a655566f3259fdad38428b58ee250c8','2025-02-13 04:41:30.008405','2025-02-13 04:41:30.008437',33),(38,'works/S__1630216_0.jpg','7a0e280a781a61ca986608fcd9a63cc8396310f8b6eaab739b47e27143fd5338','2025-02-13 04:41:36.574976','2025-02-13 04:41:36.575008',34),(39,'works/S__1630217_0.jpg','3e78ea7c52f293427da344b9cc80183d17b8b0fce583dd4c6653d0b78aa54f7c','2025-02-13 04:41:43.998371','2025-02-13 04:41:43.998405',35),(40,'works/S__1630218_0.jpg','799ec0d5a90b155a91e97438b6c578d56dfa5ec25ce0bf88b3d4790deb3ffa3f','2025-02-13 04:41:53.085432','2025-02-13 04:41:53.085465',36),(41,'works/S__1630220_0.jpg','478b75df9c8817c054029e62da2488f9c18396fcd359b33aaec37da5d6aa42a7','2025-02-13 04:42:00.827089','2025-02-13 04:42:00.827122',37),(42,'works/S__1630222_0.jpg','eff2f484c2a89f1e0690265df8c2de6b1596cf2f2572a3a68566e19f82873460','2025-02-13 04:42:07.877947','2025-02-13 04:42:07.877979',38),(43,'works/Howto1.png','9c70bc626fbc3c527edac23b66b97ea74bb9b57778e1b93d288147eb8e3b401a','2025-02-14 04:21:59.772800','2025-02-14 04:21:59.772832',39),(44,'works/Screenshot_2025-02-10_at_9.09.02AM.png','8f85943d8457add0a5ad03113239a120d2df96dcd3500fdbcb45609af022559a','2025-02-16 23:18:24.769314','2025-02-16 23:18:24.769352',40);
/*!40000 ALTER TABLE `work_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work_like`
--

DROP TABLE IF EXISTS `work_like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `work_like` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `liked_at` datetime(6) NOT NULL,
  `member_id` bigint NOT NULL,
  `work_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `work_like_member_id_work_id_314d677b_uniq` (`member_id`,`work_id`),
  KEY `work_like_work_id_6473aaff_fk_work_work_id` (`work_id`),
  CONSTRAINT `work_like_member_id_160a59a3_fk_member_member_id` FOREIGN KEY (`member_id`) REFERENCES `member_member` (`id`),
  CONSTRAINT `work_like_work_id_6473aaff_fk_work_work_id` FOREIGN KEY (`work_id`) REFERENCES `work_work` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_like`
--

LOCK TABLES `work_like` WRITE;
/*!40000 ALTER TABLE `work_like` DISABLE KEYS */;
INSERT INTO `work_like` VALUES (1,'2025-02-05 02:46:19.444057',8,1),(3,'2025-02-07 02:23:51.201186',15,4);
/*!40000 ALTER TABLE `work_like` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work_tag`
--

DROP TABLE IF EXISTS `work_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `work_tag` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_tag`
--

LOCK TABLES `work_tag` WRITE;
/*!40000 ALTER TABLE `work_tag` DISABLE KEYS */;
INSERT INTO `work_tag` VALUES (1,'初心者歓迎');
/*!40000 ALTER TABLE `work_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work_work`
--

DROP TABLE IF EXISTS `work_work`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `work_work` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `description` longtext,
  `is_public` tinyint(1) NOT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `public_visibility` varchar(50) NOT NULL,
  `category_id` bigint DEFAULT NULL,
  `member_id` bigint NOT NULL,
  `is_approved` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `work_work_category_id_79a3af68_fk_work_category_id` (`category_id`),
  KEY `work_work_member_id_c5a76efa_fk_member_member_id` (`member_id`),
  CONSTRAINT `work_work_category_id_79a3af68_fk_work_category_id` FOREIGN KEY (`category_id`) REFERENCES `work_category` (`id`),
  CONSTRAINT `work_work_member_id_c5a76efa_fk_member_member_id` FOREIGN KEY (`member_id`) REFERENCES `member_member` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_work`
--

LOCK TABLES `work_work` WRITE;
/*!40000 ALTER TABLE `work_work` DISABLE KEYS */;
INSERT INTO `work_work` VALUES (1,'森の絵','散歩中の森が素敵だったので描きました。',1,NULL,'2025-02-05 02:39:22.259942','2025-02-05 02:39:22.259980','public',3,5,0),(2,'夜の絵','素敵な夜だった',0,NULL,'2025-02-05 02:42:53.869299','2025-02-05 02:42:53.869347','public',3,6,0),(3,'夜の絵','素敵な夜',1,NULL,'2025-02-05 03:15:52.906960','2025-02-05 03:15:52.906994','public',3,8,0),(4,'作品','説明',1,NULL,'2025-02-06 08:40:46.689831','2025-02-06 08:40:46.693076','public',NULL,18,0),(5,'テスト','あ',0,NULL,'2025-02-10 07:01:29.257116','2025-02-10 07:01:29.257148','public',NULL,8,0),(6,'','',0,NULL,'2025-02-10 14:15:45.876787','2025-02-10 14:15:45.876827','public',NULL,8,0),(7,'','',0,NULL,'2025-02-10 14:16:29.636291','2025-02-10 14:16:29.636327','public',NULL,8,0),(8,'','',0,NULL,'2025-02-10 14:16:47.712963','2025-02-10 14:16:47.713007','public',NULL,8,0),(10,'','',0,NULL,'2025-02-13 03:35:25.566199','2025-02-13 03:35:25.566238','public',NULL,1,0),(11,'','',0,NULL,'2025-02-13 03:36:19.980431','2025-02-13 03:36:19.980462','public',NULL,5,0),(12,'','',0,NULL,'2025-02-13 03:37:48.692422','2025-02-13 03:37:48.692462','public',NULL,5,0),(13,'','',0,NULL,'2025-02-13 03:49:36.507619','2025-02-13 03:49:36.507660','public',NULL,13,0),(14,'','',0,NULL,'2025-02-13 03:49:56.648531','2025-02-13 03:49:56.648570','public',NULL,13,0),(15,'','',0,NULL,'2025-02-13 03:50:15.973368','2025-02-13 03:50:15.973409','public',NULL,13,0),(16,'','',0,NULL,'2025-02-13 03:50:30.993772','2025-02-13 03:50:30.993809','public',NULL,13,0),(17,'','',0,NULL,'2025-02-13 03:50:47.476418','2025-02-13 03:50:47.476456','public',NULL,13,0),(18,'','',0,NULL,'2025-02-13 03:50:53.375401','2025-02-13 03:50:53.375437','public',NULL,13,0),(19,'','',0,NULL,'2025-02-13 03:51:16.639184','2025-02-13 03:51:16.639223','public',NULL,13,0),(20,'','',0,NULL,'2025-02-13 03:51:38.472452','2025-02-13 03:51:38.472508','public',NULL,13,0),(21,'','',0,NULL,'2025-02-13 04:08:20.032329','2025-02-13 04:08:20.032367','public',NULL,13,0),(22,'','',0,NULL,'2025-02-13 04:34:04.432894','2025-02-13 04:34:04.432932','public',NULL,5,0),(23,'','',0,NULL,'2025-02-13 04:34:17.307051','2025-02-13 04:34:17.307087','public',NULL,5,0),(24,'','',0,NULL,'2025-02-13 04:34:23.752933','2025-02-13 04:34:23.752967','public',NULL,5,0),(25,'','',0,NULL,'2025-02-13 04:34:33.892596','2025-02-13 04:34:33.892630','public',NULL,5,0),(26,'','',0,NULL,'2025-02-13 04:34:48.214348','2025-02-13 04:34:48.214380','public',NULL,5,0),(28,'','',0,NULL,'2025-02-13 04:35:29.663456','2025-02-13 04:35:29.663502','public',NULL,5,0),(29,'','',0,NULL,'2025-02-13 04:35:47.553509','2025-02-13 04:35:47.553542','public',NULL,5,0),(30,'','',0,NULL,'2025-02-13 04:39:21.824573','2025-02-13 04:39:21.824609','public',NULL,5,0),(31,'','',0,NULL,'2025-02-13 04:41:07.637323','2025-02-13 04:41:07.637365','public',NULL,13,0),(32,'','',0,NULL,'2025-02-13 04:41:23.415409','2025-02-13 04:41:23.415443','public',NULL,5,0),(33,'','',0,NULL,'2025-02-13 04:41:29.999381','2025-02-13 04:41:29.999412','public',NULL,5,0),(34,'','',0,NULL,'2025-02-13 04:41:36.565443','2025-02-13 04:41:36.565492','public',NULL,5,0),(35,'','',0,NULL,'2025-02-13 04:41:43.988877','2025-02-13 04:41:43.988913','public',NULL,5,0),(36,'','',0,NULL,'2025-02-13 04:41:53.076696','2025-02-13 04:41:53.076732','public',NULL,5,0),(37,'','',0,NULL,'2025-02-13 04:42:00.818170','2025-02-13 04:42:00.818222','public',NULL,5,0),(38,'','',0,NULL,'2025-02-13 04:42:07.868514','2025-02-13 04:42:07.868549','public',NULL,5,0),(39,'１１','１',0,NULL,'2025-02-14 04:21:59.760740','2025-02-14 04:21:59.760775','public',NULL,27,0),(40,'test','awsswq',0,NULL,'2025-02-16 23:18:24.757093','2025-02-16 23:18:24.757132','public',NULL,15,0),(41,'wd2','',0,NULL,'2025-02-16 23:22:34.140014','2025-02-16 23:22:34.140052','public',NULL,15,0);
/*!40000 ALTER TABLE `work_work` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work_work_tags`
--

DROP TABLE IF EXISTS `work_work_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `work_work_tags` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `work_id` bigint NOT NULL,
  `tag_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `work_work_tags_work_id_tag_id_43a88c80_uniq` (`work_id`,`tag_id`),
  KEY `work_work_tags_tag_id_a0948df8_fk_work_tag_id` (`tag_id`),
  CONSTRAINT `work_work_tags_tag_id_a0948df8_fk_work_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `work_tag` (`id`),
  CONSTRAINT `work_work_tags_work_id_987a3c52_fk_work_work_id` FOREIGN KEY (`work_id`) REFERENCES `work_work` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_work_tags`
--

LOCK TABLES `work_work_tags` WRITE;
/*!40000 ALTER TABLE `work_work_tags` DISABLE KEYS */;
INSERT INTO `work_work_tags` VALUES (1,4,1);
/*!40000 ALTER TABLE `work_work_tags` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-18  7:29:14
