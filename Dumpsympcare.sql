-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: dbss
-- ------------------------------------------------------
-- Server version	8.0.44

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ai_symptomsession`
--

DROP TABLE IF EXISTS `ai_symptomsession`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ai_symptomsession` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `symptoms` json NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `ai_symptomsession_user_id_6aa679df_fk_patient_patientuser_id` FOREIGN KEY (`user_id`) REFERENCES `patient_patientuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ai_symptomsession`
--

LOCK TABLES `ai_symptomsession` WRITE;
/*!40000 ALTER TABLE `ai_symptomsession` DISABLE KEYS */;
INSERT INTO `ai_symptomsession` VALUES (4,'[\"fever\", \"ache all over\", \"sharp chest pain\", \"chest tightness\", \"increased heart rate\", \"dizziness\", \"vomiting\"]','2026-03-18 16:26:37.582752',15),(5,'[\"fever\", \"temper problems\", \"hysterical behavior\", \"chest tightness\", \"breathing fast\", \"wheezing\", \"coughing up sputum\", \"headache\", \"dizziness\"]','2026-03-05 06:39:08.879497',16),(6,'[\"fever\", \"feeling ill\", \"sharp chest pain\", \"irregular heartbeat\"]','2026-03-17 06:29:53.740751',23);
/*!40000 ALTER TABLE `ai_symptomsession` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',3,'add_permission'),(6,'Can change permission',3,'change_permission'),(7,'Can delete permission',3,'delete_permission'),(8,'Can view permission',3,'view_permission'),(9,'Can add group',2,'add_group'),(10,'Can change group',2,'change_group'),(11,'Can delete group',2,'delete_group'),(12,'Can view group',2,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add doctor user',8,'add_doctoruser'),(26,'Can change doctor user',8,'change_doctoruser'),(27,'Can delete doctor user',8,'delete_doctoruser'),(28,'Can view doctor user',8,'view_doctoruser'),(29,'Can add otp',9,'add_otp'),(30,'Can change otp',9,'change_otp'),(31,'Can delete otp',9,'delete_otp'),(32,'Can view otp',9,'view_otp'),(33,'Can add doctor profile',7,'add_doctorprofile'),(34,'Can change doctor profile',7,'change_doctorprofile'),(35,'Can delete doctor profile',7,'delete_doctorprofile'),(36,'Can view doctor profile',7,'view_doctorprofile'),(37,'Can add otp',11,'add_otp'),(38,'Can change otp',11,'change_otp'),(39,'Can delete otp',11,'delete_otp'),(40,'Can view otp',11,'view_otp'),(41,'Can add patient user',13,'add_patientuser'),(42,'Can change patient user',13,'change_patientuser'),(43,'Can delete patient user',13,'delete_patientuser'),(44,'Can view patient user',13,'view_patientuser'),(45,'Can add patient health profile',12,'add_patienthealthprofile'),(46,'Can change patient health profile',12,'change_patienthealthprofile'),(47,'Can delete patient health profile',12,'delete_patienthealthprofile'),(48,'Can view patient health profile',12,'view_patienthealthprofile'),(49,'Can add medical report',10,'add_medicalreport'),(50,'Can change medical report',10,'change_medicalreport'),(51,'Can delete medical report',10,'delete_medicalreport'),(52,'Can view medical report',10,'view_medicalreport'),(53,'Can add symptom session',14,'add_symptomsession'),(54,'Can change symptom session',14,'change_symptomsession'),(55,'Can delete symptom session',14,'delete_symptomsession'),(56,'Can view symptom session',14,'view_symptomsession'),(57,'Can add chat history',15,'add_chathistory'),(58,'Can change chat history',15,'change_chathistory'),(59,'Can delete chat history',15,'delete_chathistory'),(60,'Can view chat history',15,'view_chathistory'),(61,'Can add health assessment',16,'add_healthassessment'),(62,'Can change health assessment',16,'change_healthassessment'),(63,'Can delete health assessment',16,'delete_healthassessment'),(64,'Can view health assessment',16,'view_healthassessment'),(65,'Can add doctor viewed patient',17,'add_doctorviewedpatient'),(66,'Can change doctor viewed patient',17,'change_doctorviewedpatient'),(67,'Can delete doctor viewed patient',17,'delete_doctorviewedpatient'),(68,'Can view doctor viewed patient',17,'view_doctorviewedpatient'),(69,'Can add chat session',19,'add_chatsession'),(70,'Can change chat session',19,'change_chatsession'),(71,'Can delete chat session',19,'delete_chatsession'),(72,'Can view chat session',19,'view_chatsession'),(73,'Can add chat message',18,'add_chatmessage'),(74,'Can change chat message',18,'change_chatmessage'),(75,'Can delete chat message',18,'delete_chatmessage'),(76,'Can view chat message',18,'view_chatmessage'),(77,'Can add recent activity',20,'add_recentactivity'),(78,'Can change recent activity',20,'change_recentactivity'),(79,'Can delete recent activity',20,'delete_recentactivity'),(80,'Can view recent activity',20,'view_recentactivity');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
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
-- Table structure for table `chat_chathistory`
--

DROP TABLE IF EXISTS `chat_chathistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat_chathistory` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user` varchar(100) NOT NULL,
  `symptoms` json NOT NULL,
  `answers` json NOT NULL,
  `disease` varchar(200) NOT NULL,
  `triage` int NOT NULL,
  `severity_score` double NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `patient_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_chathistory`
--

LOCK TABLES `chat_chathistory` WRITE;
/*!40000 ALTER TABLE `chat_chathistory` DISABLE KEYS */;
INSERT INTO `chat_chathistory` VALUES (77,'Dwijesh','[\"fever\", \"sweating\", \"anxiety and nervousness\", \"fears and phobias\", \"sharp chest pain\", \"increased heart rate\", \"peripheral edema\", \"fainting\"]','{\"days\": \"6\", \"pain\": \"8\", \"When did these symptoms start?\": \"recently\", \"Are you having trouble sleeping?\": \"yes some times\", \"On a scale of 1–10, how severe is the pain?\": \"8\", \"For how many days have you had these symptoms?\": \"6\", \"Are you experiencing confusion or memory issues?\": \"yes\"}','heart attack',2,0.69,'2026-03-03 05:28:17.338221','989553428'),(78,'Kishore Reddy','[\"weakness\", \"feeling hot\", \"anxiety and nervousness\", \"delusions or hallucinations\", \"low self-esteem\", \"sharp chest pain\", \"burning chest pain\", \"irregular heartbeat\", \"leg swelling\", \"fainting\"]','{\"days\": \"7\", \"pain\": \"8\", \"Do you have stiffness in the morning?\": \"no\", \"Do you have cough with mucus or blood?\": \"Mucus\", \"On a scale of 1–10, how severe is the pain?\": \"8\", \"For how many days have you had these symptoms?\": \"7\", \"Have you had weakness on one side of the body?\": \"yes only one side\"}','panic attack',1,0.71,'2026-03-03 05:30:18.937653','666790781'),(79,'Kishore Reddy','[\"fever\", \"ache all over\", \"depression\", \"fears and phobias\", \"chest tightness\", \"increased heart rate\"]','{\"days\": \"7\", \"pain\": \"7\", \"Are you having trouble sleeping?\": \"yes\", \"Do you have cough with mucus or blood?\": \"mucus\", \"On a scale of 1–10, how severe is the pain?\": \"7\", \"For how many days have you had these symptoms?\": \"7\", \"Are the symptoms affecting your daily activities?\": \"yes\"}','anxiety',2,0.64,'2026-03-03 08:00:10.276018','666790781'),(80,'Kishore Reddy','[\"fever\", \"sweating\", \"depression\", \"excessive anger\", \"drug abuse\", \"sharp chest pain\", \"chest tightness\"]','{\"days\": \"everytime\", \"pain\": \"8\", \"When did these symptoms start?\": \"few days back\", \"How long have you been feeling this way?\": \"everytime\", \"On a scale of 1–10, how severe is the pain?\": \"8\", \"For how many days have you had these symptoms?\": \"5\", \"Are the symptoms getting worse, better, or staying the same?\": \"worse\"}','drug abuse (cocaine)',2,0.56,'2026-03-03 08:01:17.622868','666790781'),(81,'Kishore Reddy','[\"fever\", \"depressive or psychotic symptoms\", \"hysterical behavior\", \"burning chest pain\", \"decreased heart rate\", \"peripheral edema\", \"leg swelling\", \"difficulty breathing\", \"congestion in chest\"]','{\"days\": \"5\", \"pain\": \"8\", \"Is the cough dry or wet?\": \"dry\", \"Any recent weight changes?\": \"yes 5 kg lost\", \"Do you feel chest tightness?\": \"yes sometimes\"}','acute bronchitis',2,0.67,'2026-03-04 04:30:51.659315',NULL),(82,'Kishore Reddy','[\"fever\", \"recent weight loss\", \"depression\", \"increased heart rate\", \"chest tightness\", \"ankle swelling\", \"difficulty breathing\", \"cough\", \"headache\", \"vomiting\"]','{\"days\": \"6 days\", \"pain\": \"9\", \"Is the pain worse with movement?\": \"yes\", \"On a scale of 1–10, how severe is the pain?\": \"9\", \"For how many days have you had these symptoms?\": \"6 days\", \"Are the symptoms affecting your daily activities?\": \"yes\", \"Have you noticed recent weight loss or weight gain?\": \"weight loss\"}','acute bronchospasm',1,0.76,'2026-03-04 07:47:21.342822','666790781'),(83,'Kishore Reddy','[\"fever\", \"nightmares\", \"fears and phobias\", \"burning chest pain\", \"chest tightness\", \"difficulty breathing\", \"abnormal breathing sounds\", \"headache\", \"disturbance of memory\", \"burning abdominal pain\", \"sharp abdominal pain\", \"frequent urination\"]','{\"days\": \"5\", \"pain\": \"9\", \"On a scale of 1–10, how severe is the pain?\": \"9\", \"Do you wake up frequently at night to urinate?\": \"yes\", \"For how many days have you had these symptoms?\": \"5\", \"Have you had weakness on one side of the body?\": \"yes ofcourse\", \"Have you noticed recent weight loss or weight gain?\": \"weight losed\"}','gastritis',1,0.74,'2026-03-04 07:52:57.690251','666790781'),(84,'Kishore Reddy','[\"fever\", \"sweating\", \"burning chest pain\", \"chest tightness\", \"increased heart rate\", \"difficulty breathing\", \"headache\"]','{\"days\": \"6\", \"pain\": \"8\", \"Do you have vision changes?\": \"yes\", \"Do you wheeze while breathing?\": \"yes\", \"On a scale of 1–10, how severe is the pain?\": \"8\", \"For how many days have you had these symptoms?\": \"6\", \"Are you experiencing confusion or memory issues?\": \"yes\"}','heart attack',2,0.69,'2026-03-04 08:02:00.300793','666790781'),(85,'Kishore Reddy','[\"fever\", \"anxiety and nervousness\", \"depressive or psychotic symptoms\", \"hysterical behavior\", \"increased heart rate\", \"poor circulation\", \"hurts to breath\", \"breathing fast\", \"congestion in chest\"]','{\"days\": \"5\", \"pain\": \"8\", \"Do you have fever or chills?\": \"Yes\", \"Have you lost your appetite?\": \"Yes\", \"Do you feel pressure behind your eyes?\": \"Yes\"}','panic disorder',2,0.67,'2026-03-05 04:02:52.602880',NULL),(86,'Dwijesh','[\"fever\", \"flu-like syndrome\", \"sharp chest pain\", \"shortness of breath\", \"difficulty breathing\", \"hurts to breath\", \"headache\", \"dizziness\"]','{\"days\": \"5\", \"pain\": \"8\", \"Is the cough dry or wet?\": \"No\", \"Do you wheeze while breathing?\": \"Yes\", \"Do you feel dizziness or blurred vision?\": \"Yes\"}','acute bronchitis',2,0.67,'2026-03-05 06:37:50.414669',NULL),(87,'Dwijesh','[\"fever\", \"temper problems\", \"hysterical behavior\", \"chest tightness\", \"breathing fast\", \"wheezing\", \"coughing up sputum\", \"headache\", \"dizziness\"]','{\"days\": \"3\", \"pain\": \"5\", \"Do you feel chest tightness?\": \"Unsure\", \"Is the pain continuous or intermittent?\": \"Yes\", \"Are you experiencing difficulty breathing?\": \"Slightly\"}','asthma',2,0.41,'2026-03-05 06:39:22.896905',NULL),(88,'Kishore Reddy','[\"fever\", \"weakness\", \"sharp chest pain\", \"increased heart rate\", \"peripheral edema\", \"shortness of breath\", \"breathing fast\", \"headache\", \"seizures\"]','{\"days\": \"7\", \"pain\": \"8\", \"Do you have vision changes?\": \"yes\", \"Do you wheeze while breathing?\": \"yes\", \"On a scale of 1–10, how severe is the pain?\": \"8\", \"For how many days have you had these symptoms?\": \"7\", \"Are the symptoms affecting your daily activities?\": \"yes\"}','sarcoidosis',1,0.71,'2026-03-06 06:50:49.141565','666790781'),(89,'Kishore Reddy','[\"fever\", \"weakness\", \"anxiety and nervousness\", \"depression\", \"depressive or psychotic symptoms\", \"excessive anger\"]','{\"days\": \"5\", \"pain\": \"8\", \"Is it affecting your sleep?\": \"Yes\", \"Do you have fever or chills?\": \"Yes\", \"Does movement increase the pain?\": \"Slightly\"}','asperger syndrome',2,0.67,'2026-03-09 09:03:12.523936',NULL),(90,'Kishore Reddy','[\"fever\", \"sharp chest pain\", \"increased heart rate\", \"irregular heartbeat\", \"breathing fast\", \"cough\"]','{\"days\": \"6 days\", \"pain\": \"8\", \"Do you feel fatigue or weakness?\": \"yes\", \"Do you feel pressure behind your eyes?\": \"yes slightly\", \"Do you have sensitivity to light or sound?\": \"yes\", \"On a scale of 1–10, how severe is the pain?\": \"8\", \"For how many days have you had these symptoms?\": \"6 days\"}','endocarditis',2,0.69,'2026-03-12 07:15:58.845185',NULL),(91,'Kishore Reddy','[\"fever\", \"anxiety and nervousness\", \"sharp chest pain\", \"increased heart rate\", \"irregular heartbeat\", \"shortness of breath\", \"cough\"]','{\"days\": \"6\", \"pain\": \"8\", \"Any recent weight changes?\": \"no\", \"Do you wheeze while breathing?\": \"yes\", \"Do you feel dizziness or blurred vision?\": \"yes\", \"On a scale of 1–10, how severe is the pain?\": \"8\", \"For how many days have you had these symptoms?\": \"6\"}','anxiety',2,0.69,'2026-03-12 07:20:40.043843',NULL),(92,'Kishore Reddy','[\"fever\", \"cough\", \"vomiting\", \"dizziness\", \"feeling cold\"]','{\"days\": \"6\", \"pain\": \"8\", \"Any recent weight changes?\": \"yes some weight is lost\", \"Do you feel chest tightness?\": \"no\", \"Have you experienced vomiting or nausea?\": \"yes\", \"On a scale of 1–10, how severe is the pain?\": \"8\", \"For how many days have you had these symptoms?\": \"6\"}','hypovolemia',2,0.69,'2026-03-12 07:37:57.710702',NULL),(93,'Kishore Reddy','[\"fever\", \"feeling cold\", \"sharp chest pain\", \"increased heart rate\", \"leg swelling\", \"vomiting\"]','{\"days\": \"6 days\", \"pain\": \"8\", \"Do you feel bloated?\": \"sometimes\", \"Do you feel fatigue or weakness?\": \"slightly\", \"Do you feel dizziness or blurred vision?\": \"yes\", \"On a scale of 1–10, how severe is the pain?\": \"8\", \"For how many days have you had these symptoms?\": \"6 days\"}','acute bronchospasm',2,0.69,'2026-03-12 07:41:38.015033',NULL),(94,'kishore reddy','[\"fever\", \"flu-like syndrome\", \"anxiety and nervousness\", \"obsessions and compulsions\", \"temper problems\", \"burning chest pain\", \"irregular heartbeat\", \"increased heart rate\", \"ankle swelling\", \"poor circulation\"]','{\"days\": \"7\", \"pain\": \"8\", \"Do you wheeze while breathing?\": \"yes\", \"Is there any swelling or stiffness?\": \"yes\", \"Do you feel stressed or anxious often?\": \"yes some times\", \"On a scale of 1–10, how severe is the pain?\": \"8\", \"For how many days have you had these symptoms?\": \"7\"}','obsessive compulsive disorder (ocd)',1,0.71,'2026-03-16 06:43:08.453810',NULL),(95,'kishore reddy','[\"fever\", \"weakness\", \"feeling ill\", \"anxiety and nervousness\", \"sharp chest pain\", \"burning chest pain\", \"irregular heartbeat\", \"increased heart rate\", \"breathing fast\"]','{\"days\": \"6\", \"pain\": \"9\", \"Is it affecting your sleep?\": \"yes\", \"Do you feel pressure behind your eyes?\": \"yes\", \"Are you experiencing difficulty breathing?\": \"yes\", \"On a scale of 1–10, how severe is the pain?\": \"9\", \"For how many days have you had these symptoms?\": \"6\"}','sinus bradycardia',1,0.76,'2026-03-16 07:04:52.924159',NULL),(96,'kishore reddy','[\"fever\", \"chills\", \"feeling ill\", \"sharp chest pain\", \"irregular heartbeat\", \"poor circulation\", \"shortness of breath\", \"cough\"]','{\"days\": \"5\", \"pain\": \"9\", \"Do you have fever or chills?\": \"yes\", \"Do you feel pressure behind your eyes?\": \"yes sometimes\", \"Do you have sensitivity to light or sound?\": \"yes to the light \", \"On a scale of 1–10, how severe is the pain?\": \"9\", \"For how many days have you had these symptoms?\": \"5\"}','sepsis',1,0.74,'2026-03-17 03:04:28.812369',NULL),(97,'Arjun','[\"fever\", \"feeling ill\", \"sharp chest pain\", \"irregular heartbeat\"]','{\"days\": \"3\", \"pain\": \"5\", \"Do you feel chest tightness?\": \"Slightly\", \"Is the pain continuous or intermittent?\": \"Unsure\", \"Are you experiencing difficulty breathing?\": \"Slightly\"}','orthostatic hypotension',2,0.41,'2026-03-17 06:30:23.099974',NULL),(98,'Arjun','[\"depression\"]','{\"q_2\": \"I love you\", \"q_3\": \"I am fever\", \"q_4\": \"have fever\", \"days\": \"I am fever\", \"pain\": \"I am fever\"}','heart contusion',3,0,'2026-03-17 06:41:14.790502',NULL),(99,'Kishore Reddy','[\"fever\", \"sharp chest pain\", \"increased heart rate\", \"peripheral edema\", \"fainting\"]','{}','aortic valve disease',3,0,'2026-03-18 07:27:56.289597',NULL),(100,'Kishore Reddy','[\"fever\", \"flu-like syndrome\", \"sharp chest pain\", \"increased heart rate\", \"leg swelling\"]','{\"days\": \"Uchiha\", \"pain\": \"Tsuchiya\", \"Any recent weight changes?\": \"fifty\", \"Do you have fever or chills?\": \"Uchiha\", \"What is the color of the sputum?\": \"tzimmes\", \"Do you feel weakness in the area?\": \"Yazoo\", \"Does breathing worsen with activity?\": \"TCT\", \"Do you feel dizziness or blurred vision?\": \"Uchiha\", \"On a scale of 1–10, how severe is the pain?\": \"Tsuchiya\", \"For how many days have you had these symptoms?\": \"Uchiha\"}','pulmonary congestion',3,0,'2026-03-18 07:39:22.896426',NULL),(101,'Kishore Reddy','[\"fever\", \"depression\", \"low self-esteem\", \"burning chest pain\", \"chest tightness\", \"ankle swelling\"]','{\"days\": \"7\", \"pain\": \"8\", \"Have you traveled recently?\": \"yes\", \"What is the color of the sputum?\": \"yellow\", \"Do you avoid social interactions?\": \"yes oftentimes \", \"Do you feel weakness in the area?\": \"yes\", \"Do you feel hopeless or worthless?\": \"yes some times\", \"Have you had any recent infections?\": \"no\", \"Is there any swelling or stiffness?\": \"yes\", \"Do you have breathing issues at night?\": \"yes\", \"On a scale of 1–10, how severe is the pain?\": \"8\", \"For how many days have you had these symptoms?\": \"7\"}','coronary atherosclerosis',1,0.71,'2026-03-18 07:40:10.194973',NULL),(102,'Kishore Reddy','[\"fever\", \"feeling cold\", \"chest tightness\", \"leg swelling\", \"difficulty breathing\", \"congestion in chest\"]','{\"days\": \"8\", \"pain\": \"9\", \"appetite\": \"no\", \"weakness\": \"yes\", \"wheezing\": \"yes sometimes\", \"body_aches\": \"no\", \"weight_change\": \"yes some of weight is lost\", \"cough_duration\": \"3 days\", \"chest_tightness\": \"yes\", \"smoking_history\": \"no\"}','hypertensive heart disease',1,0.8,'2026-03-18 08:34:13.392628',NULL),(103,'Kishore Reddy','[\"fever\", \"sweating\", \"anxiety and nervousness\", \"burning chest pain\", \"irregular heartbeat\", \"fainting\"]','{\"days\": \"6\", \"pain\": \"8\", \"stress\": \"yes\", \"appetite\": \"yes\", \"cough_type\": \"dry\", \"energy_levels\": \"yes\", \"sleep_quality\": \"good \", \"weight_change\": \"no\", \"medication_use\": \"yes\", \"hopeless_feeling\": \"yes\", \"headache_duration\": \"20 minutes\"}','heart attack',2,0.69,'2026-03-18 08:58:46.114390',NULL),(104,'Kishore Reddy','[\"feeling cold\", \"chest tightness\", \"poor circulation\", \"eye redness\", \"pain in eye\", \"nosebleed\"]','{\"days\": \"6\", \"pain\": \"8\", \"body_aches\": \"Yes\", \"energy_levels\": \"it is not normal sometimes i loose consiousness\", \"vision_changes\": \"yes sometimes\", \"breath_activity\": \"Yes\", \"smoking_history\": \"Yes\", \"headache_trigger\": \"light or sound\", \"morning_headache\": \"yes ofcourse\", \"headache_duration\": \"1 to 2 hrs\", \"headache_location\": \"side part\"}','peripheral arterial disease',2,0.69,'2026-03-18 16:22:02.643026',NULL),(105,'Kishore Reddy','[\"fever\", \"feeling cold\", \"leg swelling\", \"sharp chest pain\", \"ankle swelling\"]','{\"days\": \"8\", \"pain\": \"9\", \"fatigue\": \"yes\", \"appetite\": \"no\", \"swelling\": \"no\", \"wheezing\": \"no\", \"pain_type\": \"sharp\", \"body_aches\": \"yes\", \"range_motion\": \"yes\", \"sputum_color\": \"yellow \", \"weight_change\": \"yes\"}','pulmonary congestion',1,0.8,'2026-03-18 16:25:00.775474',NULL),(106,'Kishore Reddy','[\"fever\", \"ache all over\", \"sharp chest pain\", \"chest tightness\", \"increased heart rate\", \"dizziness\", \"vomiting\"]','{\"days\": \"5\", \"pain\": \"8\", \"fever_check\": \"yes\", \"appetite_loss\": \"no\", \"energy_levels\": \"low\", \"recent_travel\": \"no not sure\", \"weight_change\": \"no \", \"breath_activity\": \"yes\", \"chest_tightness\": \"yes\", \"night_breathing\": \"no\", \"smoking_history\": \"no\", \"headache_duration\": \"10 to 15 min\", \"vomiting_frequency\": \"yes\"}','acute bronchospasm',2,0.67,'2026-03-18 16:27:40.759516',NULL),(107,'Kishore Reddy','[\"fever\", \"sweating\", \"excessive anger\", \"increased heart rate\", \"shortness of breath\", \"cough\"]','{\"days\": \"8\", \"pain\": \"9\", \"mood_changes\": \"no\", \"pain_pattern\": \"continous\", \"sleep_impact\": \"yes some times\", \"sputum_color\": \"yellow\", \"sleep_quality\": \"not good\", \"medication_use\": \"no iam not taking any medicines\", \"smoking_history\": \"no\", \"headache_duration\": \"30 min\", \"infection_history\": \"yes \"}','mitral valve disease',1,0.8,'2026-03-19 06:26:27.357097',NULL),(108,'Kishore Reddy','[\"fever\", \"sweating\", \"sharp chest pain\", \"palpitations\"]','{\"days\": \"3\", \"pain\": \"3\", \"fatigue\": \"yes\", \"appetite\": \"yes\", \"body_aches\": \"yes\", \"fever_check\": \"no\", \"recent_travel\": \"no\", \"chest_tightness\": \"no\"}','angina',3,0.27,'2026-03-19 09:57:43.621362',NULL);
/*!40000 ALTER TABLE `chat_chathistory` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(14,'ai','symptomsession'),(2,'auth','group'),(3,'auth','permission'),(4,'auth','user'),(15,'chat','chathistory'),(5,'contenttypes','contenttype'),(18,'doctor','chatmessage'),(19,'doctor','chatsession'),(7,'doctor','doctorprofile'),(8,'doctor','doctoruser'),(17,'doctor','doctorviewedpatient'),(9,'doctor','otp'),(16,'health','healthassessment'),(10,'patient','medicalreport'),(11,'patient','otp'),(12,'patient','patienthealthprofile'),(13,'patient','patientuser'),(20,'patient','recentactivity'),(6,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2026-02-17 07:35:20.269607'),(2,'auth','0001_initial','2026-02-17 07:35:20.862583'),(3,'admin','0001_initial','2026-02-17 07:35:21.010710'),(4,'admin','0002_logentry_remove_auto_add','2026-02-17 07:35:21.017709'),(5,'admin','0003_logentry_add_action_flag_choices','2026-02-17 07:35:21.026711'),(6,'patient','0001_initial','2026-02-17 07:35:21.246119'),(7,'ai','0001_initial','2026-02-17 07:35:21.343126'),(8,'contenttypes','0002_remove_content_type_name','2026-02-17 07:35:21.461305'),(9,'auth','0002_alter_permission_name_max_length','2026-02-17 07:35:21.527203'),(10,'auth','0003_alter_user_email_max_length','2026-02-17 07:35:21.550474'),(11,'auth','0004_alter_user_username_opts','2026-02-17 07:35:21.557469'),(12,'auth','0005_alter_user_last_login_null','2026-02-17 07:35:21.619648'),(13,'auth','0006_require_contenttypes_0002','2026-02-17 07:35:21.623650'),(14,'auth','0007_alter_validators_add_error_messages','2026-02-17 07:35:21.633652'),(15,'auth','0008_alter_user_username_max_length','2026-02-17 07:35:21.707895'),(16,'auth','0009_alter_user_last_name_max_length','2026-02-17 07:35:21.784951'),(17,'auth','0010_alter_group_name_max_length','2026-02-17 07:35:21.801955'),(18,'auth','0011_update_proxy_permissions','2026-02-17 07:35:21.814952'),(19,'auth','0012_alter_user_first_name_max_length','2026-02-17 07:35:21.887177'),(20,'chat','0001_initial','2026-02-17 07:35:21.904177'),(21,'doctor','0001_initial','2026-02-17 07:35:22.052825'),(22,'health','0001_initial','2026-02-17 07:35:22.070415'),(23,'sessions','0001_initial','2026-02-17 07:35:22.110082'),(24,'patient','0002_medicalreport_session','2026-02-17 08:55:58.805885'),(25,'patient','0003_alter_patientuser_patient_id','2026-02-20 03:31:25.363959'),(26,'patient','0004_alter_patientuser_patient_id','2026-02-20 03:44:18.778882'),(27,'patient','0005_remove_otp_is_verified_alter_otp_purpose','2026-02-20 03:53:21.425272'),(28,'patient','0006_patienthealthprofile_profile_picture','2026-02-20 07:33:47.030444'),(29,'doctor','0002_alter_doctoruser_doc_id','2026-02-23 07:19:57.577887'),(30,'patient','0007_remove_medicalreport_session','2026-02-25 04:34:09.703795'),(31,'doctor','0003_doctorviewedpatient','2026-02-26 09:21:43.745151'),(32,'doctor','0004_doctorviewedpatient_status','2026-02-27 02:53:23.012287'),(33,'doctor','0005_doctorviewedpatient_symptoms','2026-02-27 03:09:03.203777'),(35,'doctor','0006_remove_doctorviewedpatient_symptoms','2026-02-27 07:03:57.099501'),(36,'doctor','0007_chatsession_chatmessage','2026-02-27 08:05:04.761476'),(37,'doctor','0008_alter_chatmessage_session','2026-02-27 08:24:15.282016'),(38,'doctor','0009_alter_chatsession_user','2026-02-27 08:43:37.649818'),(39,'patient','0008_recentactivity','2026-02-28 08:21:01.596129'),(40,'chat','0002_chathistory_patient_id','2026-03-03 05:17:09.628684'),(41,'doctor','0010_remove_chatsession_user_delete_chatmessage_and_more','2026-03-03 07:58:29.397447');
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
INSERT INTO `django_session` VALUES ('0238reo66jv6i8zwqdg8yy955lo453hs','eyJwYXRpZW50X2lkIjoiNjY0MDEzODIyIn0:1vtLCL:l_mMiSq1ukzFewswrV5Agynn9X10gbnrDdOLB8PAQh8','2026-03-06 07:45:13.545635'),('038kj59so0yznm3iyt82icc1uhf84io3','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vxIKC:e0zF6Tk4kEy0oW_I3PekusCvOhpglxIjEBK0p4L8fjc','2026-03-17 05:29:40.891337'),('0g2kz8c9kcpc4mci9b59a6j9l17jtgnw','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vxHU8:h-CptNt94TC90swXwssbxbYflCiYL47KMuYtaVGOcHM','2026-03-17 04:35:52.202015'),('0loye2k8sawqcl2p7aijqwfhz1zgyxmo','eyJwYXRpZW50X2lkIjoiNjA3MDY2ODM0In0:1vzVfm:RGgq-ndQmRzhxLB9m57__VWr5_5yZtQPj3XJ6_PDkwo','2026-03-23 08:09:06.024983'),('0ongo1ck73ih41j7m2k23s8bkfk5swsk','eyJwYXRpZW50X2lkIjoiOTg5NTUzNDI4In0:1vxIIA:BKvWzfvKjcpbr6aqmini6jX10v6CJwJnUhtbp-dYZ5M','2026-03-17 05:27:34.671445'),('0r0z31jggukw9scrwne8s667c77uhzh8','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vuR6J:dUhxB-3O2Ow_GCPLC7RFhj_gTjTXBHq6g4KODrenz1w','2026-03-09 08:15:31.632137'),('0vnu8llxjaqdm3wu8o8g7cykvt9y7mti','.eJx9k8FuwjAMhl_FyrkHyiTYetllmnbbcYcNVaYxbbSQdEnaUqG--5KUQoWAo5Pfn__YzpHV6AQplwvOMrZardYvi_VzyhJWVOhyUqVQxLIjs_2-dnpvWfbNOsJfRdZ61Y5IClVCoSX3IRYVAUoJuiXjY0618UKhVdSisYCKQ13prUDLNgkTitOBZUufq2xHxoZi5wIZ6ymU2Wre5wE-HQ0J-2vIOk8Olo4s-p8Zm2796ZuGXjcQrMKkAKHABa-G8NXLXV_TiM6V9vQTcFb3FrLCliBoIGoegHa-zWVD942dBKDN2eMDHCkyZZ9LakleWfvQHXS6kTyyOdnCiC2FwMCYBmPaDO_o4C5wqwuBMu-Eq7jBDuVN19hqwWHU-m46MljEcTywXRHy0Klc6gLduBUz8ldFhkDYOJlJC1FL_K7dGsUV51MBgi1Q-nbuIP1plov0KV0kUPneWP_4S5WQPCPHpAuaY3_V3Xc_n0DZo-ohXI87MC4DD0hLMP2VGZg3ZnzwsBmGf7AbLgI:1w2moF:s6aBkfb2B1Jj4VFnR1rYgseLISu9CK0MK0r52Nww1FU','2026-04-01 09:03:23.870675'),('0zqhlz2yljxtvurhgs14z0feqgpsntxg','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vuRkL:0n9izRpMxVqh-n6eUK9_IPx1GMqpy7i48kty1jxi82I','2026-03-09 08:56:53.961080'),('103btpgsm8x8wathxeyepnbkpcls185y','eyJwYXRpZW50X2lkIjoiNjY0MDEzODIyIn0:1vtL7p:kcNs44kXy4NTcdAsb7Hd9WouHzw4btvm-Sz_Kc3oPME','2026-03-06 07:40:33.003114'),('10yvfabvfq4lsqw8vii00f0d7katx4vp','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vvV2v:SlnhTzV1mNaNld8oq8pmLy_f46wXPACTtf0EUNa_OA8','2026-03-12 06:40:25.221135'),('1313er925vdiduuh56czcrshm5za3cjd','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vuj61:cj3A1_rl8SehaLx7b1c_zG0qt9S8tkfYDcgKyPznyzc','2026-03-10 03:28:25.955329'),('13jvyltzjs8lfknxzqnz1ccov090ezl6','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vxd1p:WUzOzURiPNxB0gLLfcQb0eHmMk1bS6GKh5Z0w_iuNnI','2026-03-18 03:36:05.322542'),('14dackavvdqwspcq9ufbnzn40scifyx7','eyJwYXRpZW50X2lkIjoiNjY0MDEzODIyIn0:1vuQFj:RB_ZlttYzp7dL76-MRDu-wi-GEDO7oJ5aewPiwWuWLg','2026-03-09 07:21:11.899486'),('18ebhwhf08cqcmrap20k84tiayzkv2q6','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vw0x6:WhfMx4rWpqinazXbNbUI4D1nIwcYcB0d8KP9HMFHzCk','2026-03-13 16:44:32.294541'),('1cih4qk91p58431bnu6pi9xfp465s5vl','eyJwYXRpZW50X2lkIjoiNjY0MDEzODIyIn0:1vtKmz:gQLILBQEyUAUmSsjrnxU_poRJTgr8oEuxAMaoFZ-HJ0','2026-03-06 07:19:01.926106'),('1fpvthk56b9twmjyqgvagfklxjy0hph3','eyJwYXRpZW50X2lkIjoiNTQxMTU5MjUyIn0:1w0b31:faB9dagPcHyQB_cwcld30FxVp6GpoC4eOluCNSDcM8Q','2026-03-26 08:05:35.685387'),('1hjl2d9vyyakluy7lphgk7ph0wyulrcy','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vy0om:ETwpyUAB5Ut-1Fq8x_H5SqJ_cDBTreT8F0WDUYA2aSU','2026-03-19 05:00:12.683982'),('1jca6emgi2hhsqjzgw907o4c7t57nbdz','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vuja0:EwXRrILv16UuBLzo8a7CzCEJi37s7ZizRWwJptxkAK0','2026-03-10 03:59:24.026562'),('1m9u76daeobsoop9o7yoo0g7tedmxdv2','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vuoLj:dmY-0y7TAg5CeBkGOMjVvdMUhWEsfrbpUzTkiTE2Mig','2026-03-10 09:04:59.172896'),('1xqujl88jw7e6xte4j7c1xrkwnnmta2v','eyJwYXRpZW50X2lkIjoiNTQxMTU5MjUyIn0:1vxI0Z:UDYZHbFTo2zbBNMua1R9TxJ5wsaDgKK8KSjsw7SP_s8','2026-03-17 05:09:23.730025'),('1zzryp2ejie4sqii0y6o9a2aia0eqowy','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vuku1:ZTDy1gAfvGEzUQEyRyS1z7BVd0WWcHlPJvzK4iLFWik','2026-03-10 05:24:09.259669'),('265vzid2x34a9r7nzchv513b8hhsmb8p','eyJwYXRpZW50X2lkIjoiNjY0MDEzODIyIn0:1vtpDK:eSa4SjnNOsYwH6WXTxts30O7wAXmcZCK2TA6BQpDvCk','2026-03-07 15:48:14.992336'),('29n8cnpfksd7b9j1x2df6iyir3sgh918','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vv9Er:siNy6KOwP7HqJG3WXN0EooSpVmkSjxf1HB5SQu5qczY','2026-03-11 07:23:17.583180'),('2nqfmttrbi8yfgqxsmeufy2l1s9k3yab','eyJwYXRpZW50X2lkIjoiNjY0MDEzODIyIn0:1vtqYF:YhavYozN0pPAwPEOxkdMADOmFyiBWbjV-0dnY5k4H8M','2026-03-07 17:13:55.457856'),('2q2gqrbm51nej1s4xsubuoakkhrvgzts','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vxzuF:AN7IgkO9rWFMhpDDMrqcJ4yu_4qwrUNxtZENnqKOM3U','2026-03-19 04:01:47.127068'),('2q47bvfejxad4bwinfmmi5xm7yf0fz4r','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vvVq8:q1gXquVnn4gveVy0PXExGyos79C83lSQREsirATt8D4','2026-03-12 07:31:16.153282'),('2rfc1fhsg98c7e9yh3vb3rd908pkn5m1','eyJwYXRpZW50X2lkIjoiMzY2OTM0OTg3In0:1vzSG9:wW6uan5HpM8avn-9qCW05dWHDxrE2nckCOsE5DOaIoI','2026-03-23 04:30:25.073015'),('2s1mcx18f900yydjy456l52wu21feoj4','eyJwYXRpZW50X2lkIjoiMzY2OTM0OTg3In0:1vyPdz:yx_RQsYPD9dEVWz_UXpVdThmFm8uMK0ouV008vRFrWk','2026-03-20 07:30:43.647105'),('379jv4hcl6qx0yvh6lxjviw3kzn15axz','eyJwYXRpZW50X2lkIjoiNjA3MDY2ODM0In0:1w2jdK:7y-BSPhcS6AqpCGYieKzQvIFuxAdpZ2JGgIGPTIVGkU','2026-04-01 05:39:54.775720'),('3ezlwf2ncrho5o4ru98bihec1ni7bi8i','eyJwYXRpZW50X2lkIjoiOTg5NTUzNDI4In0:1vwE6o:N2BvWek4sCHDdyXzgWPeGZpcTBrRDBf5XV5Ms60dXoQ','2026-03-14 06:47:26.368312'),('3j5u6wt99qxxkglshnomnvrkpbo5h3z1','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vvRtt:Rig6vddFJOFwgJc0fVCRkXJmcG9_7XJXZQKb_RzMQFo','2026-03-12 03:18:53.064510'),('3mapo4kcrt5dyxk8qkpau6xh3t4y8ylz','eyJwYXRpZW50X2lkIjoiNjY0MDEzODIyIn0:1vujEh:PqOfDoelWMPOQhpp9khH2L3Ia2kuEui65nHd7QARDsk','2026-03-10 03:37:23.285268'),('3ndz5zp9t5qtdlhdj4pb8cxzdfu5owmq','eyJwYXRpZW50X2lkIjoiNjY0MDEzODIyIn0:1vtMQM:EQm2NXa-ZuQLwtMXx96uPEa9DuoYoucDa_ZrZ9pmWo0','2026-03-06 09:03:46.847919'),('3ovz9obr0utzgxc76nhz53ffw5lec50o','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vzoGg:xVn9T8SLNhue1dnTuDX4EJifaDOvNVvHZSBbDWgdfnA','2026-03-24 04:00:26.923713'),('3rieoqivoafc29krc2rsnwlccsginxwu','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vuj51:qnu-fUgnYXjqfzVl6cZUg276MGr194KJ_WV2Vly6tF4','2026-03-10 03:27:23.346379'),('3rxwepeoh8l452r9g508soq1w2um58m0','eyJwYXRpZW50X2lkIjoiNjY0MDEzODIyIn0:1vtpUQ:I6JZylEkJ3smIrqLhtm_kT2s1hkuFbUOG6sui4ZvtxU','2026-03-07 16:05:54.503676'),('3saotp2ow305utuxhoxuf3nctqb70s9x','eyJwYXRpZW50X2lkIjoiNjY0MDEzODIyIn0:1vtq8l:bsIYKD4MBNDNXZW3yqUPO9Xdtjxm6vyBzjICqHgCc3I','2026-03-07 16:47:35.486126'),('3t2h3jtsul3x3mog75yf7qnbcn6x2jgw','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vukTb:1hnstpguC77--G9R2j3c7Za-Ky41fgXDaFbO2QWiBn8','2026-03-10 04:56:51.014355'),('3w9n6bnbpavx2zczpvdn8gknd88tpqia','eyJwYXRpZW50X2lkIjoiNTQxMTU5MjUyIn0:1w2N2f:ZTq5ci5jy03SaKdVcSoXQHRoYzbntkQpe0VG4Bn7B80','2026-03-31 05:32:33.143279'),('3yy3s59pnhti841f9kyxodri72wio1e0','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vuS0Y:_6P-5BP1HbZq9pMOk8GVycG_WYXkS9xwmMwWIprWyPU','2026-03-09 09:13:38.285549'),('42xytat3ry3g51q2ut373bsm9f8jfvjt','eyJwYXRpZW50X2lkIjoiNjY0MDEzODIyIn0:1vuM67:jsBO0udHOvJxRbIFGPrhxOZnQi4N0zJ8WZavocmPGDQ','2026-03-09 02:54:59.627566'),('47hs3owyhhisyvsa6uao0z99su87shjj','eyJwYXRpZW50X2lkIjoiNjY0MDEzODIyIn0:1vtprU:93UCrkbCIVrztcuOiLm5j0FZMUEikErp9yEJrgd_rQI','2026-03-07 16:29:44.139067'),('4nzg1no8akgno8s5gyagil9nukjyl4t4','eyJwYXRpZW50X2lkIjoiNTQxMTU5MjUyIn0:1w22AE:HLaOHuOXv0QhN9Cl2G8wFkGrqyGKCUApDUCGr9vYg8M','2026-03-30 07:14:58.762698'),('4pb8xrzmvnaus49aiocjtlf0d24t259i','eyJwYXRpZW50X2lkIjoiNjY0MDEzODIyIn0:1vtpCn:g9fkxewPpeDMIJKZfnPizJAkv_P9VA91lc_xDJBX9Q4','2026-03-07 15:47:41.902171'),('4vkfzknk9w67wr6mqd2xpeu6ykcubbzv','eyJwYXRpZW50X2lkIjoiNjY0MDEzODIyIn0:1vtLn4:Htld9Lxs7PZVHnyuJDGFPPkfDx7HENwJ7U69FGSacg4','2026-03-06 08:23:10.214303'),('4yci9n50r7b2uidi0846s6xg9qte6zq0','eyJwYXRpZW50X2lkIjoiMzA5ODM5NDgyIn0:1vzVmL:RHEOp4wmmW6rsRw-Y8F1DwUVaZ0LqYscbZ0ztLAoSfg','2026-03-23 08:15:53.202125'),('5284qtwlg2qzri7s1brdcbdq2ztzntg4','eyJwYXRpZW50X2lkIjoiNjY0MDEzODIyIn0:1vtKQH:pRAJKxYmbXsz-kbixUjrcoyit_HE2P47tK96aVQSE_I','2026-03-06 06:55:33.677333'),('54avd3ldhudnm26luxf6nir2grc9wuoc','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vvAgV:1SvKNHqGpOA3EUynG0O0o4wCD5npi9ougqnFJsqao5Q','2026-03-11 08:55:55.473214'),('59uue8d2o0e2rtne90hjh8q629deavac','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1w2jdz:m3WAp6pf3D8GyQ3lQsmgZt2bYlCyV8qTB-VIp-M7YJw','2026-04-01 05:40:35.804778'),('5caccuo0fp2ldog1xp9m34bpsl7r51ej','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vzSGQ:2TozCJkmNSbOxcQFh67XX13JUzZxJxYsW-GA_itQ8X4','2026-03-23 04:30:42.120778'),('5cnnow9f33ltlzpk5lb8waya5fy1a20g','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vzS1A:XfP3sb4BRZUsYXdeW50d1PcCsnOY_3-KJu4B3-Cr5Mc','2026-03-23 04:14:56.974706'),('5dcvrwa1jwm2fba31gbrki2kit5ydzuf','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vukEQ:s3QABgy_Lbb5yqHJu3mgQnvlDzq_i145YDFfE7J7I_s','2026-03-10 04:41:10.939507'),('5fzccpvpb3e3u786iw7afuahcqwz5z1o','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vxdJy:C-jVBzVVQnVOFWBmdkZuYYLu7jGVdjAkaCx1xZCKy5k','2026-03-18 03:54:50.733343'),('5jlytmbw9o2umbfa6zmlbgqj9bd43vij','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vzUCS:qVcA_B6FzjDKOQSl5fGfqa-LeqeX99QpkFyx25PwZUM','2026-03-23 06:34:44.746575'),('63khgfjla7hu3j7g1o7v2zygpfljcwmy','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1w0abf:cnyqphr3NUjqp5QcEdexUCPqgWeQZIk6qa0Rch1SzQY','2026-03-26 07:37:19.403214'),('63vmnifkw9uxs75o6fmnbekuj11qcub8','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vzp1V:QDmp7tUsR8BGjGVJ6kPuiZxByh_4KndnBjHgTPY6OMM','2026-03-24 04:48:49.528017'),('64iwwbsc60szlufd84pu79t6qadgdg5n','eyJwYXRpZW50X2lkIjoiNjY0MDEzODIyIn0:1vtM1v:V8190DfK8fNPc85K2PKbJBokeGXsro6FFvAD68RVmFE','2026-03-06 08:38:31.889751'),('64jszfus3g26967af989ce7zh8v40xmm','eyJwYXRpZW50X2lkIjoiNjY0MDEzODIyIn0:1vtLKn:LmRI_DM8ydGdpxFJKOH-5pOunTA0Oic__QheLPyLAHM','2026-03-06 07:53:57.561843'),('6hqvmyxn6z43tjr4jruc1p0178tmb666','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vvTiw:f-VR9VTKBI1qK8NQYeYMZYt0q149Cw9j6ZwoQIWlwBA','2026-03-12 05:15:42.224763'),('6or63y0gvs41gewnpwm7rfi2hl7vsas6','.eJyFlMGOGjEMhl_FypkDdCW2y6WqVFXtqcce2tUonRgm6iSZjZOFEeLda4cBZmCX3hhsf_7z28ledTpZ9KmyRq3Ucrl8fJo_flyomaobnSr0G-tRrfaKetel4Eitfqk1vmLkFNoiV_sN_8RdjUT2FUH7TQlaX0fUhAYa1DFB1Amlpgkxec6FsIY_nJEaaRbyplHPUmVwp1aL-Uxpz_xIpXmL2FUvWbc29azThwSbEExps8Y62eCrxlIKUcI9EnDIobG1LrFMWMrAagdSnfRfFs5ieyhpfEoSdaWRdZ2u0wCi4BCSdSXuuGnFzvAZqQD5v05bX7GNCaPn_-rg2ZOQJZ1PbnTdYGVyLEI4_jAHZ730ckE0jHQXHHU5ZVfVoQ2xSGjbsB3a8PeTOszUS0YSnExjr8rophZdUjj0LWzBEvQhRyhpMKR94rzUd2JNwl1i8gC7NXUK1DxnxkGjTbEwYs07BOcyGpHZw4oPdmZfTWUC_hyP3DrHyMC2v5mT_h9-MsEJ_DuBTaDXRSMzL37cUzse-FQrS6JsDHqQJBiS7rAmi3ItLTUIkgDH_cm8QBAiW8rZznKNT--O63bNbubfBj6xCbzPyJlwqgDsLAWD0Goa88-gi69X2zrp8CUM6yD3H4YUueBD1b15jdd9Av3JD5DsrThTwgKUj2PJu26UizIh_fCsimrdoiAWv_OH-eKBnxho2BmSxwxPjaR4RC5FF7TR_dUWfGVZQnGyoRI-mnC6HIwkFjy8nW8a_Hw4_AMWM-kZ:1w38gn:jwhMLBOmJr9pbbbFkvSW6KuMkWkws2SpJpH4mCVtCyc','2026-04-02 08:25:09.836165'),('6qhjz0m0ubsch3tdsrc3m0a8fwtlplqs','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1w2u0F:TUTllGPOU808tD9mpJHrN1qvJ2jP4JRChIMLBeaL4Bc','2026-04-01 16:44:15.415748'),('6ws4gs1yg0owarxujkpu5pvfwmtf6rgd','eyJwYXRpZW50X2lkIjoiNTYxMDc3ODMwIn0:1vzRsK:nJ1cTc6VDGNOkaeIsLVsRuAq3rr_K5JERqbfuaqyQe4','2026-03-23 04:05:48.096529'),('6ww9n0pb8fltasmtx8e5wby7er54cbam','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vvoaD:lr-W_O57LZ1_VnyewhiZoJvfB1P2rgjFlwdGUbr3vNg','2026-03-13 03:32:05.916451'),('70ylhpm774e7rmbn5yij5cjbfbnpa4pp','eyJwYXRpZW50X2lkIjoiNTQxMTU5MjUyIn0:1w2NgA:h0B8yQJW4kh1STd2EJ9u0VHGxlyc0RNfnWVzwd1n9Dw','2026-03-31 06:13:22.712717'),('747gfeps6u3thfinjyfuivbbnnnqf392','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vzVpz:rWhZY4-nDMDYqAkQtr2z5V2YOusPy5SseLXiQAf9iOo','2026-03-23 08:19:39.110049'),('791tt7zjzgao0kkix879rdepw194l1zp','eyJkb2N0b3JfaWQiOiI1MTYzMDI0NDYifQ:1w2jb4:5oQfRrvnvFhDkDpcG8u7XUcYewbp0bK5ABx-b7Ney70','2026-04-01 05:37:34.335435'),('7dfivx07owh8lag6tnxpaqcm1sgod0tp','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1w0ZTF:N3tTNAxTi2mKtyhD0YPfOlmvYPjOGyNGdV9vfVIr9rw','2026-03-26 06:24:33.579624'),('7e8m5wiirila68ukhe1wklaldytt4zdd','.eJwtjUEKwzAMBL9idO6hZ3-llKIkG9vQKEVS0gTjv8eFnhZmh91KY2Z_QVIRUKxk5_LxdTGKD5qxQ-lGLEeBn4FlCgLd180EZr0ZM8yDl5T9T4oq0vZmDRmsPoC900F75iIpzGxOz-7JhIPi_bduX2g_rK21C8VVM8g:1w2ls4:PTtzESRX5PzPdeTtSjC7lC4BKU-zE_A8-rxb9SskrSw','2026-04-01 08:03:16.279321'),('7mas1hvn05uhqg07nmy9db4rcoj6m9ju','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vujCy:r1EvQOaYhP21BlOStP6WE_LOsu22_ezViDQUSghiao0','2026-03-10 03:35:36.748180'),('7yvjfsvpr818lnep82ofrqideehheqkn','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vw0FV:cxVN5Er1oSuL_lBPOBqnvwfljxYpDZBl_AIQUietec0','2026-03-13 15:59:29.612822'),('804d1pqteeorsfmuj5r0gezi2bqidczn','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vw0AA:m5l8IM0mT6CBUYTfEkKflibXtI5z44616Px8r8_wE6I','2026-03-13 15:53:58.303999'),('80kjn5m6e8oi83p0v56uur84bsnmwtyt','eyJwYXRpZW50X2lkIjoiNjA3MDY2ODM0In0:1vzRpl:zOkKNRwms09bjeIijqXu1Lx4dyAe7acI7Cs7Nckuj74','2026-03-23 04:03:09.354092'),('80wrdfacu3m9b4284dx6eyhwo4252dgi','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vxGYB:jB3--oCDJWI6jF15l1mLkhfd0AnS77wNMgcZy8OYkow','2026-03-17 03:35:59.871378'),('86vibkxw19cin617alcqwuedd92vpw2g','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vzUex:ORmHYzsnkRaQr7z8F_HDBXHaabWBNLvQYMaxOzTU5U4','2026-03-23 07:04:11.930852'),('88zi00m7baqru4xdpi9ajapl96ztcj5k','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vxzGQ:GmXq3pp9kAm2yeH4zCQEuOx8h3aJvhvxmMm-Tx4aT-g','2026-03-19 03:20:38.468726'),('89yvdvjv1fheqcl40e5bsmrsav1sew9m','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1w2gwE:Ez35lXkbDlpQ0kdSigdzj3SO_7D53DVM11m3r4Bo1Q4','2026-04-01 02:47:14.712529'),('8bfmumflmnaa14nnwd82oz9udc9nt0g4','eyJwYXRpZW50X2lkIjoiOTg5NTUzNDI4In0:1vwBOo:czhRp6FQ0BTf9wy9AI3CIWi4ftey_e21zGGp_1dIy5Q','2026-03-14 03:53:50.551718'),('8eb66o5iwau06nor14q5hhm3l2587411','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vvzyE:QTvX7nYvevqkwYqhL1B8MmvIVB572mZn5EoBFcFjCvo','2026-03-13 15:41:38.131359'),('8fgrlxw88n5c1zfpmpcsmhcdzz0ozxm2','.eJyFk8FuwjAMhl_F8rkHGBJsvewyTbvtARiqstZtI0qSNSmsQn33OaGFgqC7Rfbvz38c54hGOEnKJTLDGJfL5epltnqeY4RpKVxCqpCKMD6ibXfG6Z3FeI057almiT0QV6vCH0tRG0hLsg6MkIpDRlRGOhZoZXEToVQZ_WK8ilAorqytx9aU-u6uFnuq2IHSXCmMIScd98WWLAdCw4Tp6XbQhFaJk0XpFFk7hHPuVzSXym-dtYnw4nMo2ItxgV2EPw1TgsF4fcQwg2tHFwmnPjgErW7glKQMTuKqfWWha03fN2ErXdTzzpe5j6o0T4wPNQzCCdZ4Dle4Nx1gpacGEeiaX0NWlZ3A3c7wHjInqvp3PQunHPbzf4jqBd4fb8_2H9zo-R7e12sgaCZA_U6OEJ8KBNhUVOwlh_lX8zSbL-azCEp9AOtnSCAtuJLCQo_YoeiCzkR74-6dL-cpO6Fa8OmT0ZPjzCMtwfChRuCsqcN3wW7TdX-yEjkI:1w3ARW:d6hg9wyf0lrr4Th3nggopwpKZ1vSP9vCgp-MToGjynU','2026-04-02 10:17:30.523536'),('8j62ui53bbbyjk22du1dtkhd1r0pga05','eyJwYXRpZW50X2lkIjoiNjY0MDEzODIyIn0:1vtMBm:Ne-gJGXM53XQU0FS55PYwYoIrvLL3zs_84IAnqS0Q2s','2026-03-06 08:48:42.841377'),('8l7og8rl23l8cmc1wgixwfuk4ja46wvx','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vuola:FzpUuHQAcJQo37HeB7kql0OBoOW0Ls8zGkdDeYg0W7A','2026-03-10 09:31:42.169297'),('8v90l44zrohzvtvvzodvazdqfhl9d7yh','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vuR20:egtlWGS_xRpddyz1noC4BU8g-xRKA2W6HmY-bBEbgG4','2026-03-09 08:11:04.859333'),('8yf4xr172td5cjyxuqgrk3wcueetyq6i','eyJwYXRpZW50X2lkIjoiNjY0MDEzODIyIn0:1vtLee:DBNbyuGmJ4gMRVvgY6oJlOPjdjciBO_GUrECRu2iv6M','2026-03-06 08:14:28.412760'),('8zsi9801eqw1s14143a56qvunirzzc7j','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vzRPy:M8wycVyFedv8YRp_PLCIP7wxxG3Fl7xx6JuZAyCdO4w','2026-03-23 03:36:30.325585'),('90v5nbw5r14n5blun6cn5wllfna38jjs','eyJwYXRpZW50X2lkIjoiOTg5NTUzNDI4In0:1vwCsy:R2iR3QB_nofrraQHx4q_vkucR9GlYImXMWNHGMWo8-s','2026-03-14 05:29:04.312718'),('9236ghyck77ewsot3ol3sxbqw230ei3o','eyJwYXRpZW50X2lkIjoiMzA5ODM5NDgyIn0:1vzVmU:sGVfbjK-F55O5HiSvNv5k6vAo1I4GlwHU3ESsOmQl_8','2026-03-23 08:16:02.127041'),('9408ava00t6435okuyp709ebgm5cyoo8','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vunCZ:KKvI5t3-WW2kyD672g1pe59YV_Akw_jyoqG5HGIqH8s','2026-03-10 07:51:27.591599'),('98aw7ffcv9ju9r92yxes97eh98vq6rtq','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1w0ak9:-zGTXhxzVZ33sDEbOqGaIVN89YtqTL4DEXcHxQhhRhk','2026-03-26 07:46:05.918523'),('9b01j3hw5nncxv5se639hbpkd4ottkft','eyJwYXRpZW50X2lkIjoiNjA3MDY2ODM0In0:1vzRIL:5LrJCC1XH3goXM2GRQXELeLiTFT52RGVRk7vZ60MXns','2026-03-23 03:28:37.749732'),('9b7nkiojxr7c6p581e17vbgw2h0jbxgl','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vyQ1D:rG7Oshh4E0vpFE9oUI4BLQQgFHqY4vKojiiGtdB9HGs','2026-03-20 07:54:43.722704'),('9dl1u5qbtjq564vcbvudrr4qe1a5d5xq','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vxdEs:LKsECb2CSkhfFEw9IritBAm-7kKxwqX-9NFA80Ksckg','2026-03-18 03:49:34.928335'),('9dvjz0gpqpw08q6n6azdg46ziuqxy1r5','eyJwYXRpZW50X2lkIjoiOTg5NTUzNDI4In0:1vwAn4:0OEieD0KT3lYpLHowHXJPSLl3DFYCnbB9Q5X5r0ir9M','2026-03-14 03:14:50.447865'),('9ivg6cbya7l1nra0lcdqmar3fw78ic9n','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vwGDX:lSS7u4ZO71-a_CpMB_swWzKvFOVrnN_qJiNcif-Mjcw','2026-03-14 09:02:31.797077'),('9k7yaz7n5e3g4yb3q9swi0ahfcu4bz2y','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1w2jGX:aqsUPTw61K6FXtxpuuz5zyLPuRyXwjtygdo7-4nIh9s','2026-04-01 05:16:21.299899'),('9ku953qoppdvghcgn1mbeacowudaq6pc','.eJwtjUEKwzAMBL9idO6hZ3-llKIkG9vQKEVS0gTjv8eFnhZmh91KY2Z_QVIRUKxk5_LxdTGKD5qxQ-lGLEeBn4FlCgLd180EZr0ZM8yDl5T9T4oq0vZmDRmsPoC900F75iIpzGxOz-7JhIPi_bduX2g_rK21C8VVM8g:1w2ls4:PTtzESRX5PzPdeTtSjC7lC4BKU-zE_A8-rxb9SskrSw','2026-04-01 08:03:16.277994'),('9omj0dk4inuzlk3dwpdpb5xu25pnrk4g','eyJwYXRpZW50X2lkIjoiNzM2MTcxNjgyIn0:1w2L5B:tghZxfO1bmnMnzbxjV9N13oqYx3o2ATQ93UE5mI7KYg','2026-03-31 03:27:01.529928'),('a1nzw4r9dlhob30kbv327ylx4wamspr5','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vy0jS:CbBf5E-dENVJLg_i-49t-r27rykn9nf0tH15H1dqHkU','2026-03-19 04:54:42.669041'),('a5matgk2xnn2xoe1tu40wloahkhss1ro','eyJwYXRpZW50X2lkIjoiNTQxMTU5MjUyIn0:1w2Kmy:alqSLCqRLoh90TA0ag5eUVAtmYdmefFH8v_w1GB-UEM','2026-03-31 03:08:12.026616'),('a98r5ye0idm5xkmcq9vknpetmm3vjcg8','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vxhev:yT3xaJ2NM2NxbJaDkYbBN5nw1LBSz1AWh1pv7FZQ6jQ','2026-03-18 08:32:45.128979'),('akhxxe2o6b8imy3ssmf7llq9u9f1lhg1','eyJwYXRpZW50X2lkIjoiOTg5NTUzNDI4In0:1vwAf3:bTT3igelCswWkIkU1rQ7thRcM9GVmefyuakJ_ilEHhA','2026-03-14 03:06:33.683786'),('anbuc53h09t0ubalqsquruk7z0i682pt','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vzQcs:IQ5UpF6KfzXHmJMiV8gVEIqD_6WYjybmEtgnmmExuus','2026-03-23 02:45:46.655320'),('araaf2pqjg4rsholjfxrgsuodpd7vlsp','eyJwYXRpZW50X2lkIjoiNTQxMTU5MjUyIn0:1w22pQ:XietEEtAbvfmvq79jvkrk8-r7NZsTF6mb0Asw32soZg','2026-03-30 07:57:32.621683'),('au08m5vkuidadjbor29j1zoy561lmkgv','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vy17o:90JaDWV0wGj1xZmL2_5EvnZ2C16uYs-I809dW6C70ac','2026-03-19 05:19:52.241459'),('avn9wv785aru1r7hiiqibowhyuu39rr0','.eJwtjUEKwzAMBL9idO6hZ3-llKIkG9vQKEVS0gTjv8eFnhZmh91KY2Z_QVIRUKxk5_LxdTGKD5qxQ-lGLEeBn4FlCgLd180EZr0ZM8yDl5T9T4oq0vZmDRmsPoC900F75iIpzGxOz-7JhIPi_bduX2g_rK21C8VVM8g:1w2lu0:eXbUAzyuwkbzgPU7M4aAeyYI2bfvI8f4oqf38VXuSEM','2026-04-01 08:05:16.487578'),('aw18r0lfgxgodazo0i95n1ulkwkk5dr7','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vzV5q:9-nGMNn80ww8h8lbc4nyy6CjcK5tgyDSajRCZXgoaIY','2026-03-23 07:31:58.943239'),('b7gcg5n2m3w5vudru6mkg9073u8dokz3','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vzUtF:RNtMkJFmgb5K8FsXFpDoUn1vH5rNBKlnRQBBC2C0zh8','2026-03-23 07:18:57.265498'),('b8ykehpwfbcbkn8r608z06bq3a9h8y5f','eyJwYXRpZW50X2lkIjoiNjY0MDEzODIyIn0:1vtpdj:ZxPRDriHGtGEvNSBwPIf7cwDGV7VBe6YmG5vsH8p-0o','2026-03-07 16:15:31.017251'),('bc7o1sfiybl57l497k7gj79xfm9d3kzm','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vxGOI:p_37vErF92Og7MRRoHKVRzhM6aLYC-rFQz6gezSuzMU','2026-03-17 03:25:46.516595'),('be9zh8k5bzgsoloomc2md80m8ye914cd','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vxeSL:KFymdsWpIT3idZNN5LcwhZe9xI7i7a0kyoQfnUvw4GU','2026-03-18 05:07:33.161610'),('bekl2kqdr4620sd111g3wlohlhcgyc2t','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vuRUn:mtZe4wzBfyK6XPlBaFLkXn6N6BrXI1Gw81PW_FsvwcQ','2026-03-09 08:40:49.044799'),('bepixmiss2pra4146kaymbsbx72ihhpt','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vultF:aZJiZpwuZAp1FevKMemwNbaW2SIQt5JvHNphWDoARTk','2026-03-10 06:27:25.623758'),('bk31old4sr6xauqaea9d57ntxazd6fc7','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vxHEc:Bqd3zJeZ_3-91BzhfzmK7LQrXck0WyWkrt2PWs3KykI','2026-03-17 04:19:50.961883'),('blj3vxig3t4viudiz9ozc8a1czoc9qur','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vvodz:zJLrLO-ErBR0QCZOQ9vE0GodfTLt7JhYM_GXEswyTno','2026-03-13 03:35:59.916357'),('bmfiudogxbd4uzd9lgmd7gg9ra4xndry','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vy11u:DvZPV28HIGyeMT5ZXBoBxdfMIUM_EZh5ckoOLMhtPrY','2026-03-19 05:13:46.302072'),('bmxvwvdf22yx5notio2wyqk90asa64os','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vvnov:g3Q_HI-lmW8I-xezP5lb7jH6JTPXdlt28hHifPvgjg4','2026-03-13 02:43:13.668334'),('bq2re30zbabte5tt75igqgdetezkyzky','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vw0Ri:kocr3HiboZN-rUu4VrI-SzY5GsmakdZECOHKbENX4Ho','2026-03-13 16:12:06.780117'),('bqvh6nitf359f7z6cb67tvx7cln7u4ux','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vuQqQ:6MqvWxqCqM0el_T1Kqxv7ztyjSRtQYbH1qW56RgIulM','2026-03-09 07:59:06.051048'),('c51gs6zl4o645fo1ywa682wal51ge0zn','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vy0jN:nlobPc73M6aRA8aFzpObxQtXBDqOZk-n23z8yUAuPs8','2026-03-19 04:54:37.348953'),('cah1safxmwq8z3mn1op0yrlb7qiqrq0g','eyJwYXRpZW50X2lkIjoiNjY0MDEzODIyIn0:1vtq4S:GmQy3p32USg3FK_tMNndF9L6ZKNCwfL4EiX74AdrtqU','2026-03-07 16:43:08.124330'),('cbr0vr26slqe02qebkppxin1q041l9t4','eyJwYXRpZW50X2lkIjoiNjY0MDEzODIyIn0:1vtqp3:ucu-Lcsm2_h33ghSgOonQzB2tXzaB9X3YHfxuQo6IpM','2026-03-07 17:31:17.351045'),('cjfvyoud5k084b62dmb9dd0ew3vqjfeh','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1w4aHg:wjfm2N2gS1mxtxiClL_TnxSHZmj4Qh3S6O1rbvcqRZs','2026-04-06 08:05:12.450445'),('ck3m1rc2yjhwzf9wylq7nylczz2di6f0','eyJwYXRpZW50X2lkIjoiMzY2OTM0OTg3In0:1vyRCj:eibrbim0zBFfZPI_orYwrgbGtIekeqLp3lst11NXbro','2026-03-20 09:10:41.575562'),('cwc6ycbkhldinddong3nktr0e02ar46j','eyJwYXRpZW50X2lkIjoiNTQxMTU5MjUyIn0:1w22LO:o_5-5Ay9_do5YKRqF2alc3rN7EiSxFowW_4uZPcohc8','2026-03-30 07:26:30.405067'),('d7qes8fp8gq024f4fui1widvcbhwlbx1','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vuRrk:IeI54wH-iQEjueDFqE0cQRP85msTmow8w0NvGFQnOGY','2026-03-09 09:04:32.920681'),('d92dqfob0f228cwra26i7lm142wcrvl6','eyJwYXRpZW50X2lkIjoiNjY0MDEzODIyIn0:1vtrP4:xK7R5Sy1hpSOqOcau0u37trK0W-NjYi6MhgMO3QarKI','2026-03-07 18:08:30.653605'),('dct1uy9n01c8dh4wjzdgmpk7hxgdmlpr','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vv9RD:d7o6kkKD-wea8SZNmI4MR_AnYj7zqaqagzqMrpHGVmA','2026-03-11 07:36:03.674704'),('dgz4q8qgipp4ynhawn4x37h7qahwti3f','eyJwYXRpZW50X2lkIjoiNjY0MDEzODIyIn0:1vtK9o:fSNQ5tiZfYfqeheL6YnD9E6jVuF-D0uFQEoC-8N2vLY','2026-03-06 06:38:32.349133'),('dibstz0ng8eqyp3rxbtfiitlditld0v7','eyJwYXRpZW50X2lkIjoiNjY0MDEzODIyIn0:1vtqjS:NblbII5Ofvy0PRq39JVHxPjwp9upQuPJOj4ig4lTPLI','2026-03-07 17:25:30.247505'),('dmv8bnhopv2t6v6opj109y4n4lspky6c','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vxH1p:BkZYkoJNz9Dnr20KGIMj8cw1iFGb5xKixKOHUrZ_dYQ','2026-03-17 04:06:37.682493'),('dmv8wp6p69sur73oaspo7ojutr6yssnq','.eJx9VcFu2zAM_RVC5xziDku7XIYBxbDbPmArDNVmYqGy5El0XDfIv4-S7CR2Ex9NPj4-PZLJUTSSFBrKVSm2YrPZPH5bPz5lYiWKSlKOZq8Miu1R-L5uyNZebP-IHR7QMUQWFYLUGmz69pV0DXDQEzRSmcgSPkjtKzLoPUeUKRxKjyVUKB2Bk4QcLtXHhxogB1srUmYvXgK8xHexzR64nfEdOh_UOCyCaHLygJqFGwvGEvjWBa6oL-fWxRvnegycaNDt-1xzSjOF0Lbj6CtLoSqXBamDov6MjrLzi-wxbkIkT1VBYOgcHl7bN_7MK-XJun4M8wPL4FFetvxKZQ0nsjWQhewr1NGfDiMjm232mB4SjG0aJEWYaxubR7bRlXzn8F-LprjIjWZvxZM4rQSnfOgVJnUUcaxTty4QTv3iEPS2hZTkqSSw7r8zkPoGU5OcJZxWA9-1vxO2Zxu5qkAaQWAd74PS2i_QTUczlWc76Gyry8hboi-ceo2CHaQySGVX9ITvdCGfT3imFz2cp8mdnEcDnaIKxoIF3fMluWXFDlHD7AgWKOf7ddfdi2jlPUNAEsTiBfL5lt4llzBAwO5gqFrg_bzmn2aoLSstg9vISBgrABvlbYmgpb9WfiY695jeyYT_h-mHpYWEgoRa8nl6YLcvglOUNm1ELxDeOM5PJgwpvi2QLvUYy-6u7_AzesX02_B8fCE1hulkf9uHdfYlW6-g4hY-HB3yTgCxu6H4ijkWXahL2c-e_pOvNbDUki0N6bQOaS_KQOkRxj-Cm-N6OZ3-A39qL6k:1w37gs:HaDMV5PRmaiBm0_yDJpol9EFERhmGqeRiqt6IssbqE0','2026-04-02 07:21:10.942200'),('dqanyp8ux8q8dvwktqs7rx4c5mbdzeef','eyJwYXRpZW50X2lkIjoiNTQxMTU5MjUyIn0:1w2Ncf:-1HpRhA2bR-6o90OmzGVHQZTbxmDwmerrapBpjpekRw','2026-03-31 06:09:45.332533'),('drmmqxxfrn4zzxtv1lilebpj1ozy4wcr','eyJwYXRpZW50X2lkIjoiNTQxMTU5MjUyIn0:1w22MY:P95IZGZkfb2f6ic5DQWhj9BLyfoy8XsaVE3i8LoH8Z4','2026-03-30 07:27:42.198236'),('dv875gxpkgisu440oznmbw9whjpn3b7u','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1w0EIb:aXY3Rflrt3bQmFOSlP9R8JouTc5L9v1u-4PxMGL3O5c','2026-03-25 07:48:09.043248'),('e1fr1nsq9tkidnwm9jgkppwbeoc91il1','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vv9LO:TuYPU4wCB0lj1WiJ5gmsuR_72hiW4mtUgI5H6i3LuWo','2026-03-11 07:30:02.963944'),('e226p8fdvouxbppcxiqngx7s77wsdcf1','eyJwYXRpZW50X2lkIjoiNjY0MDEzODIyIn0:1vtKiT:grfCCV8fwKIEt7-saYyGJ1GKfaD5RjhIzAv2bTdiXvY','2026-03-06 07:14:21.285806'),('ebttp2vcj4de1hrak98gf8r9ris94r9y','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1w0EHP:1JhR3dE2NEal1R0o8V5aWjNcPYI1jwdhSixPvtWBULQ','2026-03-25 07:46:55.039827'),('eka5dlbt1e11s20y14flwkngx47dco62','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vunYr:qzi-VaNbVvi-oX31t9lUxZrkfLuUisz6URsXz-PHifE','2026-03-10 08:14:29.793634'),('elj2uh63cvd5vcsf25blekgtfzda9xgd','eyJwYXRpZW50X2lkIjoiNjY0MDEzODIyIn0:1vtoTd:FdmnAi-AAH-ldiIEIER6ZapZAvXUfUfDErK0TseDzq4','2026-03-07 15:01:01.337934'),('evmlpcvg279t23jkk4xbqfawiv5kbkkb','eyJwYXRpZW50X2lkIjoiNTQxMTU5MjUyIn0:1w21zr:qjAAWafVbg1kr8c-t61Knq7EpQYj1xw9jkIoDrtLeXo','2026-03-30 07:04:15.580703'),('evrbb99mcbn1rgfitwo38cerbrst745l','eyJwYXRpZW50X2lkIjoiNTQxMTU5MjUyIn0:1w2L08:d15wo5JgCyXdml41br7bv6h0W7ktxC0HA09TFkZ6FwQ','2026-03-31 03:21:48.505169'),('f2sz983r3gkscfbf7zbpv61l1gbmoq6o','eyJwYXRpZW50X2lkIjoiOTg5NTUzNDI4In0:1vwF6W:6pWspJxMLcpUpGX77qmzLULf9hI4FuXNy50OIIOnFXg','2026-03-14 07:51:12.578158'),('f85iwwnbu4z957feix10ph4t8zlrxxhy','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1w0EAH:ZthM8vMQZjdYoL0JFdaVO88B2rI3dkuEjGpBOaNcvzo','2026-03-25 07:39:33.477390'),('f8sjhb1ogq89sl94zvn4leelaehqfqsw','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vzVDe:cQW_PdgWqiCQNeo3O2XaxTesiS6eKAGAcHOMhzk9H6U','2026-03-23 07:40:02.197635'),('faahtys32td83vtnikk7vvyk6j7s0p9v','eyJwYXRpZW50X2lkIjoiOTg5NTUzNDI4In0:1vzVlg:NHM7mscoAHVZorYxY9w0zmyGHLikdoS0aVelK4pLPm4','2026-03-23 08:15:12.800388'),('fgbooib2ijazwvy2vx2yqebi3m62nofp','eyJwYXRpZW50X2lkIjoiNjY0MDEzODIyIn0:1vtLjY:H7vk59iJOegC8XJ0I9KSx2sJqy0lKWfCq3ZfjrCkx8E','2026-03-06 08:19:32.053742'),('fha53u0n4hj7m2xsks8v9wz1lpd84eqf','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vy0s3:71AC8uQs97bMWL7LNfwUJAzEF82id9s_hsT9Gb52dJU','2026-03-19 05:03:35.883927'),('fil34wexem61mhdngw08pa2y72ic9txe','.eJyrVkrJT47PTFGyUnLxdzY0MlbSAYmU5BchCZoABQsSSzJT80ogomZmZuaWBuYWhkq1AHgKEow:1vuR5Z:-P7nCoSTxzEmv7Yu62EHoD9glnnP4qYI83Moo2-VMFY','2026-03-09 08:14:45.001976'),('fk9v0tr2nu08sr38jiwcjputr1kyt3gn','eyJwYXRpZW50X2lkIjoiOTg5NTUzNDI4In0:1vwBHm:bqCx00fYg3p6XoQ8MXrkhX9CufPj8CBhsst3tfP2P_o','2026-03-14 03:46:34.708113'),('fqdbroe820llbcqmk2khi1yyoh2r2i4d','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vzRIf:rY1SQY-zJLVKWUCR-AivpctV-k6VfGlp-xwFM_rfU0A','2026-03-23 03:28:57.704392'),('fu4nbpf1on8lgzytl4jr2avqi1oymp24','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vzV4n:vnZCzGSJb0e60nMFN-Anhg1IJ7UC_qAPDuQVtOGABjk','2026-03-23 07:30:53.240890'),('fw3zo5nyd9409vn2taclsxkwsyq8yjws','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vwEkp:NxGyhivQnxXXFyNzU1RDxFEoHXfVZrU7wiIC8INOcZc','2026-03-14 07:28:47.812299'),('g6bd5j7fgtecdvukd6wclwiw1iyl7zgm','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vzV0w:RAiaXaJis2rb_6wZ018AmgfAjnkr0dGtSgkEC5hD6uk','2026-03-23 07:26:54.709415'),('g8w0foxfwwa2x437o60awgrnk2fs8vc4','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vy434:Yh_EuUMIMSLgH2Om2Kjb1QZkTInpq1IKfdl-Gugj9jc','2026-03-19 08:27:10.089925'),('gcluplqrlxq4egwb3lt9suc1fnfeqirv','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vxz80:6TfakBLAxGF1FC3mPwqh0HzlMfqc2cz3-b9wH4IL_lk','2026-03-19 03:11:56.731600'),('gg6dyu8lkrf5y48ax81vsi56yi6pmook','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vxGxa:EFzR_gDBPmMJbtz0s1WuLgu5Fxzsr2wHi-Es8DR2aQQ','2026-03-17 04:02:14.481197'),('gkv8ff7xqdkofrictfpu83ijqt569ccw','eyJwYXRpZW50X2lkIjoiNDM2MjA2MjE5In0:1w2hcu:dYbWVviLyDyMiuvus264wGtFptyVd1mnPPHjydAyThg','2026-04-01 03:31:20.143383'),('gkxhkurd4l59t711e0bfhja0tx8pj0p6','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vujD8:p_v-NQQdj7AsnMDZPerSx9z2nWJ4vUQLkSEmnB_v3Ic','2026-03-10 03:35:46.287398'),('gmze5od3rtmysfx6nvc6b8tx97uwj2en','eyJwYXRpZW50X2lkIjoiNTQxMTU5MjUyIn0:1w0ax6:4MqmvxLKw79AA75MJ5rs0Y0_n32VQVPt_UDb1GVa-xk','2026-03-26 07:59:28.124619'),('gwwn7utnoxtjn1r38s6l5ah21zz9lnif','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1w0avp:2AdaxdQuIIP-gohXcGE8EA-jr3dwxLACLLNlLZYJxtI','2026-03-26 07:58:09.367606'),('ha3f1ec7ugs4xe6tczei5c7kmbql811s','eyJwYXRpZW50X2lkIjoiOTg5NTUzNDI4In0:1vy17O:Q7tm2PWlevCZMt3LSR-cZJEArt5xnZSmGbzKA1hEzOk','2026-03-19 05:19:26.605061'),('hh09n7vsyej2mmmf0blr415923c0m6bv','eyJwYXRpZW50X2lkIjoiNjA3MDY2ODM0In0:1vzRI9:dHHV9ltM7jLFEtrQRzlj1j3R8HaiRJiXVpz5FO3tz4A','2026-03-23 03:28:25.823066'),('hjs9yym59t3vdtqbbsao3zhci3nr2clx','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vv9dJ:BCkQHFjUhly-2PrXWpgdWet_NROuw0fY1_QJSMPFfzA','2026-03-11 07:48:33.713925'),('hn49f1qhywoewoeelf39t6hmc7n8dltk','eyJwYXRpZW50X2lkIjoiOTg5NTUzNDI4In0:1vwCXU:Inxd-xoxoQn2nD-aDATtHbBwVl_u5hx2cUF1LZgleLU','2026-03-14 05:06:52.728758'),('hpr7qm66qd2cd5lymqx4myrfnrlgczlh','eyJwYXRpZW50X2lkIjoiNjY0MDEzODIyIn0:1vtr6K:4rMe-DRTpw2hmGzExuftBILJ-4o2UreSLX8M2yYdViw','2026-03-07 17:49:08.993889'),('hr7ftvkxd4seuzq4mwt9a6vozlvlxlfg','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vxHpe:oVkE52626JguhDQx-ekhPV7ZLYsuhB77eysk0cPiwjQ','2026-03-17 04:58:06.303355'),('i10fr353xorpwnlmugmjertc73yqo921','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1w0DDG:iR4je_XrGcUB_9kW9pUE84mou1uSAbcMP_T9o6g4Lhc','2026-03-25 06:38:34.930777'),('i4799mznh7llh0ecgpcv3rin1zl2ifxv','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vv9ni:3hjzCYV1k7NtXeZfuv1KZ1oKCimwGgHoThFJvldu60I','2026-03-11 07:59:18.920267'),('i4loqbhtbx970lt5vipvjjs14yfswqby','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vvT42:vmt87qvHKnaMIvm8athqNeUjETMVQLApk28v2vUwZFk','2026-03-12 04:33:26.613502'),('i709dt4hte1wqlo42j9cs4axrfmrhtt3','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vuiRp:n70aurtD8YYh9bHQd9KuUO7ocS50A4y-YTBNvcu4zsE','2026-03-10 02:46:53.416816'),('i939cetrnims4u4kb4r6ab5466kkrn0u','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1w2lJ6:VuNkPr3EKaysY-xWX46Om5Pu4JwEbqLks4ukAV-02Y8','2026-04-01 07:27:08.540847'),('iogfm6hq2mep3i1okv2hwg749g7yt3fg','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vxHbM:Ym16ROM7Yu1g_Ft3EKkcMjM73EakR3mRTDges52f2FU','2026-03-17 04:43:20.844502'),('ipbhtx7mwso8y5xzz2se5w1s8hpnk9x4','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1w2hRp:7oxwoDghKXZEGLgPO_0QdflN3uE2NVyDNwRsYyri-X0','2026-04-01 03:19:53.798735'),('ipoaxpkevh6kznl0jvm3u9knlln9fgai','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1w2lR2:nZzgMblrLlOPggaG3wGwbfDBUtVv6a4AZoquuvQfroA','2026-04-01 07:35:20.394860'),('ir2pq5fngodsw2jhmx2uu0vzm4icigpf','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vxeFV:f3p_g06FrBlCJeLWKcO1cZ0lAJzgGkke1tnFn_qR4Q4','2026-03-18 04:54:17.599100'),('iuddwcr95ihkjxaw14sm55b39mpaz0jv','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vyP0X:vGJR7QewXDBSpBrgsJdCXaePNcKAP9AEjzOuYHDSb4U','2026-03-20 06:49:57.919410'),('iv4lfup5bdv6troi3dai32ete4aqsqbk','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vzVz8:dYTo8esimqtRA_O2pys3FQzjM0g3K2yeYI_P2WxDUMc','2026-03-23 08:29:06.906776'),('iyzct9cq9z7degrfav3swd2g8yo1v4m9','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vujFY:qq9GDmh0O8cEuS-06NxtljoCg9Cw40B7m3u5kHInDbU','2026-03-10 03:38:16.074967'),('j38wr44ght55hl4iliur6p9wqzbbg8wx','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vxGmy:_axmJZ83ttQYyl5LUvg04BEHw7N6Dek8X6jZWPU8Tlg','2026-03-17 03:51:16.636493'),('j7a833t7ldawqc5gy8rbenekki5yaxbl','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vuocs:EJARYA6l5mKH2AEdRzLQVycxxi3GZD1zUBTmcnDPD4k','2026-03-10 09:22:42.153205'),('ja0ixnyexi5aziwgq6j7algy0n8zg5as','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vxJJv:PrdOi-BL5SMwjsL0yTIgNOEIjljgnJoqbDxAM2FIFMk','2026-03-17 06:33:27.455874'),('jdv5b33dp4kcd7nddsdm8inwy3v3ub8d','eyJwYXRpZW50X2lkIjoiNjY0MDEzODIyIn0:1vtK2w:48EUnv4g9dvy3xKLVjWUI6jQytSYlgZHKWjrARURmh0','2026-03-06 06:31:26.968295'),('kcm5lv0kne05nbnd93p9nc95v3w1xsuz','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1w0aL6:iTafcCCDzOYpbX_itWqZ6Z9xZ54TQwR7ANXl9sGOxAY','2026-03-26 07:20:12.233943'),('kg5zhqr37ykbsdil2a6eismmedr4gsdz','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vxhCO:sS_5duLgE9n43w9NVfy-cP4KpiZ5mfE8ec-hVCmxd7E','2026-03-18 08:03:16.730652'),('kj50lkqy6l9iugp86mliqydzcm9tqmjo','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1w2hvP:sfse9AKK_lKt_KUec05gDpkyj750HCenYi2gUjc6AA4','2026-04-01 03:50:27.948302'),('kjsrorwe4ud9togoohvhsjtozt9xhg2t','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vxKfK:QD0xtArJUE8og28SpUwUONsnIVLx7XF36wPPklqr0dI','2026-03-17 07:59:38.590596'),('kofpem4lea10okci4dpn6ostegn44gf7','eyJwYXRpZW50X2lkIjoiNjA3MDY2ODM0In0:1w2jSR:ubGaASDmUGa59VPW9kowBL7SV7Oh98edSaIqSv0ciVA','2026-04-01 05:28:39.171538'),('kt7v3i0hmuyrq9lv4gdut6emgtxc8wuu','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vvAFi:3Lv5ZBv1JPijUjEv_zA0e-SZt-vstCGROgIzlVZCtKI','2026-03-11 08:28:14.699361'),('kuf7st0spj2wvv87ksuero8fgfk1dk20','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vy0oV:fdhOhmU8-c-5gzsexl273g6v5TJBAlxa1aJqypqg9tQ','2026-03-19 04:59:55.741079'),('kxls158km7wcz9fbnhl5qy8qehfmtnm9','eyJwYXRpZW50X2lkIjoiNjY0MDEzODIyIn0:1vtpvp:dEdkXQbxXM9eGA4Ag3KLX0RKh5DnLqj-yRUFtkDv7xM','2026-03-07 16:34:13.479589'),('l1tmx1xi7tno0qo4s2mttg23tdyzxbqe','eyJwYXRpZW50X2lkIjoiNjY0MDEzODIyIn0:1vtqto:fdhzSvBOHtaPxsyzjbEBCSMw1eW5L0dF04OAvA1ReJg','2026-03-07 17:36:12.977108'),('l5lu3imgqajmys7h7yw6eaon2lxz38bb','eyJwYXRpZW50X2lkIjoiNjY0MDEzODIyIn0:1vtqJr:xqPP_AyniLFXSBKakUEpymDQndM7H2i_pUYUhHvD_zA','2026-03-07 16:59:03.330325'),('l6jl1rjffwmhe574r3p5gqq2rfwqlxxx','eyJwYXRpZW50X2lkIjoiNTQxMTU5MjUyIn0:1w0b24:wGAoIkKInMoXMisVUtEt-tggjtSTxC20s7lG5rawjLg','2026-03-26 08:04:36.071469'),('leguwi0wz470576spu3xndthvrl7pi07','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vvW7a:xL4OWXJPCnJ9nhkvTy-f99_9aHQvgnWa7lryJbXxe8c','2026-03-12 07:49:18.592633'),('lfjx5tjfyynewvcmfi58w9q8n8zoz5ha','eyJwYXRpZW50X2lkIjoiNDM2MjA2MjE5In0:1w2O2I:kaKGOlaHabkaFwQOUJ6gQciiAdHaFzJ9ueJi7Vzj4xc','2026-03-31 06:36:14.059853'),('lghwewk4aghf1ztnt8a2ctmhtsj73je5','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vzW6o:md2b9XPbDBF-KIVBsGnSES0D0Tr5nJtep7SrXzS10fw','2026-03-23 08:37:02.250064'),('lp7cgmtiskqfju3zdsieskv3kd7m9nzh','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vvtg7:EP2vSMTOn-LErDIqO_UIqJ7cnHFI5IAH9VuxO0UZHhE','2026-03-13 08:58:31.293578'),('ly31xtzek8pc9a1t00nzih1jhdgzvf83','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vzVrB:DQEuhQW8M-oCqwIruN5-p2g3EiW3RMq2-8b-eD1LIag','2026-03-23 08:20:53.714750'),('m65kpymlic1a6exclnkcxshprake2ubc','eyJwYXRpZW50X2lkIjoiMzA5ODM5NDgyIn0:1vzQoN:IeAuWKZ_VVefwZV_DbHEDqT02t1jLhiNFal7y-Q9Q7U','2026-03-23 02:57:39.565537'),('m74eg2zw47c43fqi5ohu63avux52k2ag','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vxGdQ:dXAbK6gPRJTpT2ibuS1le-AsSgIel8RU99lHEFmfko0','2026-03-17 03:41:24.467337'),('m8ku24ocphgiewm5pm6i13rqafvum7ds','eyJwYXRpZW50X2lkIjoiNjY0MDEzODIyIn0:1vtLAg:aKEuccn5ixHe7mKtBUIvQwdkZ_scORHQx9QKIOg0NYY','2026-03-06 07:43:30.547986'),('meaq09mupz4t7dgd6xwo1ncau7rt770u','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vvA3F:QLgzP2zCnWBQ_t1FErxTxj9FR5UPvuhmEwtwaDL_xq0','2026-03-11 08:15:21.619796'),('mg391l1kr1w79dwyn83kw8gf3nt7g90i','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vzp16:dMx47x350wjKChlZ18SEP7dNxCwt581czbkXw9Zs_rk','2026-03-24 04:48:24.117175'),('mj0gw3h28wob1coxioesok6h27mv5bnf','eyJwYXRpZW50X2lkIjoiNjA3MDY2ODM0In0:1vzVgR:oNs4XRbWgGjnDMU_fU3hFBtykr7P8KMacNObJx2EfoE','2026-03-23 08:09:47.318749'),('msmqw08tygeby77u9usvvd6grl6i2twm','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vvW3J:UH8b4AjapBIDz06gCtYjLJvwJsf8WFX95T8zAi4sN7Y','2026-03-12 07:44:53.094369'),('mw61w85sv7p2lupkldfpa22ct9pa1glk','eyJwYXRpZW50X2lkIjoiOTg5NTUzNDI4In0:1vwCVp:hYYXUf_r1SSVOuAEaa5yOlddbaJRONssbwtA4udBUeo','2026-03-14 05:05:09.662747'),('mwsrsqmdmlrkxgw6ayamnczohh0r45xt','eyJkb2N0b3JfaWQiOiIzMzg3NTg3NjkifQ:1vuQWy:Ot9Naellf926AMwdJjSAlIZnHPtJ6KFb26-YeRT08e4','2026-03-09 07:39:00.596596'),('n61hr6mpc7gxkva0e4ne7atr1n7vx35d','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1w2hek:Q11meVnv7S2d0ZZBoMB9FoohJl8QRSlHP1DTmCGFUAY','2026-04-01 03:33:14.386904'),('ndel7iuvflsjgw2n4rqocx0cxj6zffh5','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vv6tm:g8i8lPzwUDCC5GQ1hVT047n971aCbhYxO7R09Sr_Yeo','2026-03-11 04:53:22.145587'),('nfb20c9icyg3dagdkzg30xwogbbj145t','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vvA3e:26KuILM6Iv0Uo6Dy8cRb4-H7t5HUs39PnjQ0y13pbtg','2026-03-11 08:15:46.165575'),('nj1vexq9rq33zdinxtt242iqzlq0wh1v','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vv5zl:C0AZ8GBcF6x4tLs9J9mNGnkOu1vCGIWBMTUWW0xuzSk','2026-03-11 03:55:29.932564'),('nkog4q2558owrdlcwtvt60m263ku47s2','eyJwYXRpZW50X2lkIjoiNDM2MjA2MjE5In0:1w2gyW:vxDAhAqEuddng0rlil4mdAM5IZAx5IiimB4CwvmTcho','2026-04-01 02:49:36.102823'),('nr93ibkhrr53v6lwoj12raodganrkmyh','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vuo3M:X0-Nh3V2eHf_shMGtbxC_XkItWM6b2QI23BMSeWHLZQ','2026-03-10 08:46:00.397912'),('nrj9aakfza0kqszhhfrn22h3gupuode7','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1w0af7:4L8Vynj9S00ykfl7aYsvbxC2fTI_dfrY3_p6nC9-Lsw','2026-03-26 07:40:53.885235'),('nxec4hih4v8oqr4koh1d92pnvgn1mqzm','eyJwYXRpZW50X2lkIjoiNjY0MDEzODIyIn0:1vtL2J:XOtZV8EEgYRg8YkZCXbcP7qO-lwKHgqrvXjkYlzQt50','2026-03-06 07:34:51.552761'),('o13w6mqka3jc9qkhjxbc7b1trrq5becn','eyJwYXRpZW50X2lkIjoiNjA3MDY2ODM0In0:1vzRnB:c-uKopKIp7ZzL3gG5ppnemaZcB57a2OPpNmMC0lrCb8','2026-03-23 04:00:29.143119'),('o1chabk9j6nt6v6l7ifn6swac9cbw6cl','eyJkb2N0b3JfaWQiOiIxMTU5MDcyMjEifQ:1vujKi:UBCQcVi5NeeUsCRfipqd5ItyTpmGoWqSpgwJCjIt2WM','2026-03-10 03:43:36.476669'),('o6fu3yjrhz2dxfwwe9oxwqa3qxfqjggm','eyJwYXRpZW50X2lkIjoiNjY0MDEzODIyIn0:1vuMhp:kZ1JPOwUb4l62vbdX-o5aGdmwMrJZhsTjbU7yTsglKM','2026-03-09 03:33:57.272254'),('oaevz5uocipv2dvxz787wgejn9i354yk','eyJwYXRpZW50X2lkIjoiNjY0MDEzODIyIn0:1vujF2:c92gHZKC909xbG6mHcF3fYzRz9tgvJdOU-fSqvMP7pQ','2026-03-10 03:37:44.080381'),('oblwmu5kafs07viiew50zwehouo9emlb','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vvXhL:_iyyMFa7RmROI_UmBW1CyndDvzWVy8MYaMZeWyFknt8','2026-03-12 09:30:19.772583'),('oduxa4wrwjkeuwwrmf4v7ijnznwq79tn','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vv5Km:d5wzk7y-X5oS3QckvnoCgUv4eJBDDuJDnRndBzOgttc','2026-03-11 03:13:08.799774'),('ol0yn8a0kr0g2vwf5x81z914mzyhk1q8','eyJwYXRpZW50X2lkIjoiOTg5NTUzNDI4In0:1vwBLB:QWXd3GUTN4xZS3s8OYfKYe-d_zlnO9XseodaJ-6VOf8','2026-03-14 03:50:05.682485'),('olctj9tpm1mho62gn936wuwftupdbcsv','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vzoZg:ELCQ8XjbB4Vg8oOwoFBBvQKrruDfVIjtQrevjKkRdco','2026-03-24 04:20:04.262687'),('oqr05in0yto2q3f00sz8apjqhfq3fw4t','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vxFuf:ClvvHfmopHsURsc9sjS_S6su6fWtg_ZVyIavQRZnRYA','2026-03-17 02:55:09.426930'),('oqrg9147zkfyerp46kz3oc0drfrh2tmf','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vun21:lJDAmpxOQ04DFokdZkQYD0iqEUFipEMGsWbWUyv8FhY','2026-03-10 07:40:33.597249'),('os99hf5b0toa24xg12b0n0xb3izgye58','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vxd3j:cuZ9esmtmrJw62L4Ebp0A_buf30ItZS1mP1LE9ZcBjs','2026-03-18 03:38:03.708348'),('oua6l09iwjlkldp3y4mbawqn5jgvzv53','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vxHfc:7VlxG3in-2HiJM41kc_-PBWiZDvMi62tLL3v2ZLiX_4','2026-03-17 04:47:44.787769'),('p19jklrt76mwml5auu7rmelfiqpa8lkd','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vumOx:t6Uxas96JEBNkGET8oHk3v0D1B3vYm-nPBfZ5KDs4Q0','2026-03-10 07:00:11.911024'),('p2tpro96kiorjvnijrmuitbjct1da6ht','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vuk3i:uR_T83VO5W2reoA2NSRLLi-J5ekQSg7EWu60d0K7IJo','2026-03-10 04:30:06.693460'),('pacblj2pybvofcr56srevi6p08hfv61c','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vvBGW:zcyYonxTiNdw8X7kIjb1qdi1bdySKWUfrVsqWAj4z14','2026-03-11 09:33:08.672412'),('pgsaex0cwmd3h1lkfvmndu31wvqd9nq4','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vvSoE:eNwXjuIS0Pcby4v_erhgIxcsC0QTTjPI1j9C0kUN8RU','2026-03-12 04:17:06.267266'),('psufurouvltbmaq62urn9ny7h1m23fu9','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vzUS0:bITQTB2EGBaX5rPJ0nwG4TeNX4BlK0u-4-dOiVrkU3c','2026-03-23 06:50:48.977179'),('pzt1wymfyvvcogi2eb18vimffa322dwl','eyJwYXRpZW50X2lkIjoiOTg5NTUzNDI4In0:1vxI2L:yreZia3u4wNFO2hMVM5YtjOWeTgydJtuNcxiM9VxDhY','2026-03-17 05:11:13.029290'),('q4ormboln9eibl2f2rh4u8v4nd6iemg4','eyJwYXRpZW50X2lkIjoiNjY0MDEzODIyIn0:1vtKQw:g3pszWCFoaOjK9glz6rSDzMvjXKuCejQA5OtdEh_x50','2026-03-06 06:56:14.198092'),('qcpd9edj811igv22ok61w3p0fj6o711k','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vzo6T:2s3Hc2WnWxd2OHcQICA5v3rewhZWiYavoJjwbrk4z0o','2026-03-24 03:49:53.977597'),('qcyg3z5x3l7toatko2vwkowv0pn3hjpl','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vzQja:6nqA5oMlQy9mlt8glmo6sxqjMwg3HGTvnDbivKHlf6M','2026-03-23 02:52:42.043686'),('qkpe2yl0o31nm6qs2i4904jbgj83quai','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vwEo1:fx1_25jU4geVUYvDInG6Pn1PqKZRg_g3DSQZ-r1y9LQ','2026-03-14 07:32:05.561880'),('r19b2rvjxo195dqeplm2nygfuammuc2l','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vxH7r:QWHC7bxmceNIR4cvzw_3xumv9CN2thw1DnRfrkaj3ko','2026-03-17 04:12:51.691875'),('rh5cv6doc6gpo9unjimvcj3s32wrmwiv','eyJwYXRpZW50X2lkIjoiNjY0MDEzODIyIn0:1vtpnl:T9IkzRDuTzMhvBqMIa0hmFSvTviF3CA8Y_ArxCYJIkk','2026-03-07 16:25:53.582274'),('rnjl962zsedwezt7h6f22xngd5i8l9cf','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vuRdG:typ2VUjPoymFJ3nO5NVQ4K81SbVbPimDu8KhdUxBwBI','2026-03-09 08:49:34.659066'),('rp94dw9n3tybkansunxrs0th68pxsi0i','eyJwYXRpZW50X2lkIjoiNjY0MDEzODIyIn0:1vtLF6:Z3XcRvz7i84bdD8GHNB74NfvRvHQLypuYfL5OtGAx_E','2026-03-06 07:48:04.679461'),('rs0g4d9l7rxlo4ffjalv16bn2pjcld08','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vxKEY:bym3Lv5tJRzlMD1_IsS1aX9Ln2CAEAqHu06IykBt77M','2026-03-17 07:31:58.301587'),('ry3dxjek3iiy9jj5rmfph53r5o99lnk6','eyJwYXRpZW50X2lkIjoiOTg5NTUzNDI4In0:1vxIJX:NVFijWaUwlPILo4cBgIUi-Wp04IEHRYNQyT5noe-lOc','2026-03-17 05:28:59.438534'),('s61wv9d8nzy5tm1v3koicuildkyoayl7','eyJwYXRpZW50X2lkIjoiNjY0MDEzODIyIn0:1vtpVK:qBteeCRoMh0YIsEAQmAdlw0qWSgYi5HlPBB1UREAwcI','2026-03-07 16:06:50.734263'),('scxfai9mjuehogumoifmi430nwdbgujv','eyJwYXRpZW50X2lkIjoiNTQxMTU5MjUyIn0:1w2L5R:0Ss2xW1W1nn1g6FyCfH9VTPfMZVQBX1zmeADqo8fhrQ','2026-03-31 03:27:17.408639'),('sheo7w1drf0ae7lk8c5jv78urpum1lzd','eyJwYXRpZW50X2lkIjoiNjY0MDEzODIyIn0:1vtM1i:oVyiQScDzOAQ2PlqPFxiKyA78op_dCj5gRNI3oSfuqY','2026-03-06 08:38:18.081227'),('sipx16ozvlqre7jaqiyx0xxgv0un8f8m','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vuS3V:3uJtA86K7I_37BIO56ad8MST0olvFPwah5_BJSOR8oQ','2026-03-09 09:16:41.118375'),('sj7t6hxk1hn9arp2kfbxmrmcwjbopgzd','eyJwYXRpZW50X2lkIjoiNjY0MDEzODIyIn0:1vtqBN:iCG1SRYuEvhqCZ8SD49WnFW2vhvCC_PZbCXTYXI3ypw','2026-03-07 16:50:17.242738'),('smksnn9897bo0n7a9et740xft4247z64','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vvruJ:XYgLJxPHqoUrob7neUIDSlkQFYNtwX5h9o5GctrijSM','2026-03-13 07:05:03.755920'),('sp41csvni4gzu33n6a5ord439bkzzmna','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vy2eH:iPF06Q3QwQ8hZIn7NtXDD0D_n3rO295-jQAwoqjmjj4','2026-03-19 06:57:29.205345'),('svq7ay97shrn14we1caepe33ciukgcdm','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vv5Qs:_faD_bnYVRUOHRGKTetncfai2y_te_Bc0c1e3klanCI','2026-03-11 03:19:26.326693'),('sxeg7gd6431hnwb83kyq86d49coa9pk5','eyJkb2N0b3JfaWQiOiI0NjQxMTkyMDkifQ:1vuQSw:2Y-9c_D0fojScjtgG_CJTxJCR3fSa8xIW_ELhUdiowk','2026-03-09 07:34:50.848351'),('sybox4fydl3p4o9nz3zwyx2mst3q9aa4','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vuojV:AZGzlQrmOrlI_8Myt1z808nwkm6Ng0FUwMtfY9tAVvc','2026-03-10 09:29:33.328492'),('tafleeip4eou7vdhpk575v6f8aew2p3r','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vv95Z:cvUm-5biXFJbXuYTeLiYCKW1d2gbe4SoFGown4LxgNg','2026-03-11 07:13:41.730270'),('to4avhsiukp31zt4hj8pk0c721gers4s','eyJwYXRpZW50X2lkIjoiOTg5NTUzNDI4In0:1vwDZy:ur7CN8WZsi_v7bKACDEcT21cDOofOUzfGzRbcI9N_84','2026-03-14 06:13:30.475338'),('tp1xurq77mowo9y625zvx8ua2mrl4vxt','eyJwYXRpZW50X2lkIjoiNDM2MjA2MjE5In0:1w2Nts:03v9_PN2fFGxKYZ1m4ysoQrDeYPO53BwSIdvSzkH_RI','2026-03-31 06:27:32.833306'),('tw6q43ca5osnshedghj7o5lh9r8n6o1n','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vujcg:UrYliEUKmYgSXkM3a6CjY1RAeRwkWVoxV-PNSt09Ym4','2026-03-10 04:02:10.314255'),('ty6lirfl77qduwlm8qmi31c01ndvyae3','eyJwYXRpZW50X2lkIjoiNjY0MDEzODIyIn0:1vtKTn:zuLBRN4gTVX97bPKudkXN2xVnzDst4hBr2n6MFf8nYs','2026-03-06 06:59:11.031846'),('tybstjr9waat6z2kew8taqcml3scnu14','.eJwtjUEKwzAMBL9idO6hZ3-llKIkG9vQKEVS0gTjv8eFnhZmh91KY2Z_QVIRUKxk5_LxdTGKD5qxQ-lGLEeBn4FlCgLd180EZr0ZM8yDl5T9T4oq0vZmDRmsPoC900F75iIpzGxOz-7JhIPi_bduX2g_rK21C8VVM8g:1w2lu0:eXbUAzyuwkbzgPU7M4aAeyYI2bfvI8f4oqf38VXuSEM','2026-04-01 08:05:16.488641'),('u1b6zi3my14zwkaysn6ilhn44xr19dce','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vvVgK:AqkenefuOyMnLNipJgyCyDUAN_ZfEWIa_Ih_flYRS9k','2026-03-12 07:21:08.714555'),('u4sqxhs58e56pgo26ln6462x0gql3wrx','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vxHJ2:kQfbR4EdmnTPEWFo6UuBR9L7jEJWMlsy96fUfwEMRY8','2026-03-17 04:24:24.658043'),('uc55otzhf4qt1nm5agq7o4rgkmjvbspr','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vuonw:stMPHq7-7LHaPpcwvvutO-YsGvbQAQR3haVLL1vOx6s','2026-03-10 09:34:08.983751'),('ug0god498vv94rlfefhapcszpn2hv5ja','eyJwYXRpZW50X2lkIjoiNjY0MDEzODIyIn0:1vtML2:bO2Ta1M3CsMDW15uojXvMEqgn0wIa5wKo8pSkJVryBM','2026-03-06 08:58:16.519319'),('uhph8gj03y3ef9pimyahuzkqf2hns5q8','eyJwYXRpZW50X2lkIjoiNjY0MDEzODIyIn0:1vtK0t:cFNVOfdFmHmBEeeg5KxBcmYqhy4dj10WKbQ_Af8RZAM','2026-03-06 06:29:19.826202'),('ui1rsj9fuvk84yxj8dcarj855tvvbyin','eyJwYXRpZW50X2lkIjoiNjY0MDEzODIyIn0:1vtpd6:gCr4cDsymPlriTb6fMj8LeaxbnV2YWirP7AtTYcps6I','2026-03-07 16:14:52.821768'),('uqzmsip72j72j1omkwqbthg8jiwak2ru','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vzVdx:Su0Z621r3qy1mWt48OExw8FkN5r7oRd-l4XJw9P73ZY','2026-03-23 08:07:13.657896'),('uti0cpkdepcmb30qhudaamxwic0jrj2b','eyJwYXRpZW50X2lkIjoiNTQxMTU5MjUyIn0:1w22J8:m5l1UQTgSDo6rdZRGe0tSGdoiGpYjB9ALO-Gg9rSF5Q','2026-03-30 07:24:10.214855'),('ux5sydsngfq5guh2pcfyrjcnqxtpvr2l','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vw0bY:07QS_d7UNTe-u3Dlmbt0e5isrZYR1-k8Au6rN1dLNk0','2026-03-13 16:22:16.122049'),('uz0fjbcqr5wc2660djrpmy94l3tio960','eyJwYXRpZW50X2lkIjoiNjY0MDEzODIyIn0:1vuQDI:IBtsUh1f3OlpzErAsCPxogFpcFb8yo1oMwYCjVeBJV8','2026-03-09 07:18:40.585475'),('v21yj1ua8r1uta330pdgsiaodujo49hf','eyJwYXRpZW50X2lkIjoiNjY0MDEzODIyIn0:1vtq5T:bX4-Y-mVqgbNg4jQBkYD8b8H1-jxiua8vAEZqIXG870','2026-03-07 16:44:11.502917'),('v6bqysfi6hntcbm6xz55po531578jkrv','eyJwYXRpZW50X2lkIjoiNjA3MDY2ODM0In0:1w2msE:6J5YWlzzYs7_Vj3tQr1I2I22CLcdp68Dqsjrp_uQbBM','2026-04-01 09:07:30.124656'),('v8lqao5b5lzez5vc0m9hrck5fb9pkrm9','eyJwYXRpZW50X2lkIjoiNTQxMTU5MjUyIn0:1w21ea:kjLjJkFogGGVqjn2c-KDYrPjUEZZre-sf_rAgQAT4cw','2026-03-30 06:42:16.099477'),('vcr8npu1i80czusfn6uqydvp5xm2s3qh','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vw0oe:StF35PyrJEFz6WvgafKEFPki1xx2ODhkfeOS0YpkxG4','2026-03-13 16:35:48.754353'),('vmtkryw59zsrhhpq1ne71eh9vt4h53ip','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vunVM:ody5mz4r-U-UDL8kc0kW8TvsKAjhzaa1_l984nCi5V0','2026-03-10 08:10:52.013398'),('vn0dmz1jcr6wl5pldm8cs8clrnig9gso','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vujYO:KHV52D27Eul5S0cgzm2LjZq_MOhrjmsyQforpccnA8U','2026-03-10 03:57:44.454688'),('vnag03evixqmvxvkr3tnbvmw67h87rz6','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vzp2u:lI1W-JhEGMVqEtDZJiFi8NckmZGtCIrYuxZqK_5fPig','2026-03-24 04:50:16.926556'),('vocmpc0ryoukhpnrxbri5qznxfgb18yg','eyJwYXRpZW50X2lkIjoiNjA3MDY2ODM0In0:1vzRPT:JA_hJafqAcF2loHW0ZIhowVus3ew0MsNgiAI3Mu4egQ','2026-03-23 03:35:59.057131'),('vq67nv9xhch7njf7ea7j379ov4aas4oi','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vvSxH:_CjxAXb59OzZXvq0IPgSUVIA702X4xhlVqkgD6kXEFk','2026-03-12 04:26:27.558480'),('vrd4prvphxkhii9rahkmrv98rzm11vbz','eyJwYXRpZW50X2lkIjoiNTQxMTU5MjUyIn0:1w2KU1:7aX-Gr9rG2PzdwX8VKQQpolZz3VxV8FyDeGy8hfa70I','2026-03-31 02:48:37.435610'),('vuls0quei757q4fita6uqh4hu4173bol','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vzp1m:HXHIj56Rvr-r6zfUSgive94lHEikDUKnf4Isywr2Zmo','2026-03-24 04:49:06.145657'),('vuyrja5ytggkrwrk9ddhjc9v733b1llo','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vvzrR:6l1ORlh9E6jE6INl--MQYhxpo8WhqOXYAhsTg_AaaqE','2026-03-13 15:34:37.589842'),('vw9322fs38rq6zgewrzco0dq0ccbk6z6','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vxzim:M8BbSL7XRc4SX3djgMScAQqTjH-pVB8S2D0RLiwmmd4','2026-03-19 03:49:56.557995'),('w36iuvi6thpmljxj9z53vw0u7jafkyze','eyJwYXRpZW50X2lkIjoiOTg5NTUzNDI4In0:1vy19b:sGQWFqjEwOdyUpPnUr5hnvfwqdkp3Ayk-GKT5wa53B4','2026-03-19 05:21:43.941068'),('w7ckxgq2bq81h6hy70b3b9hmxi8vbyxy','eyJwYXRpZW50X2lkIjoiNTQxMTU5MjUyIn0:1w22M7:hIJiD-LDclZ9pKaSEmD1ZXHWYwkM5sVZHZaXXuT8M_Y','2026-03-30 07:27:15.803347'),('w7n4h4a9pghjouzmld3dfvzlc3uursfg','eyJkb2N0b3JfaWQiOiIxMzAyNzUzODYifQ:1vuQL7:DsEqCvDXQm1Hoo-v-sR5p23-_A1zvDNOqk-vBjl7ClQ','2026-03-09 07:26:45.153417'),('wdo8tl24w9epbzk4zcysjceofiim23j3','eyJkb2N0b3JfaWQiOiI1NjgyMDAzOTYifQ:1w2L83:BPZ-gfMabRNt7tLoUSAkX2taUyHcFC8lEuZIcUwD_7Y','2026-03-31 03:29:59.909365'),('wr77ut8juu6vye1p70l2nvoia5emvguc','eyJwYXRpZW50X2lkIjoiNjY0MDEzODIyIn0:1vtMkq:mOt67GeKZsQ9dUJBzHSbvrPF1ENgIB1IkLVyak9UWQs','2026-03-06 09:24:56.371903'),('wuat8dbw0k3rx7icjmq88v12g4u2czgv','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vyPXR:sYUDnZayP3oRNiCs5hwtyvG1BmNPsw4rVZeUTvLm8Ps','2026-03-20 07:23:57.577061'),('wvf9h4hg7t6x0ztnykxhi8gnudx2f29h','eyJwYXRpZW50X2lkIjoiMzA5ODM5NDgyIn0:1vzVfU:B7Wfpfp1X50xEeJFlquS1OosHIuNkc2CkU420RMmgUw','2026-03-23 08:08:48.390112'),('x5laa6y6bxpvjbq59m18ynx99nkupole','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vxGMU:zKiDekN1HpClmScGgWbE27nxHAScfKCkXpumgCEUvXo','2026-03-17 03:23:54.871099'),('x6yu17wcjh5obfbhryuhraaj3xpeykqu','eyJwYXRpZW50X2lkIjoiNTYxMDc3ODMwIn0:1vzRpy:X5TICE8WvThOfACeHvAM4vMCtFvEZ8NXLXEL0RSkhnw','2026-03-23 04:03:22.828068'),('x77gb151w7po30hl8lrbrsaparokfzts','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1w2iXf:j2k6qoIUYXSx_QTFL-h4GcKHm5GCgMkBamip2qg6YQ4','2026-04-01 04:29:59.120308'),('xqcmpey160wrf2qk5759iwfxhvwahjuq','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1w0aG4:MxVwF2tM0yHwbeMXm7NsVxDfrcVIycy84HZ8pUvqBGc','2026-03-26 07:15:00.646635'),('xsa5ixocp9236s7brxh0acpae48bochh','eyJwYXRpZW50X2lkIjoiNjY0MDEzODIyIn0:1vtqYF:YhavYozN0pPAwPEOxkdMADOmFyiBWbjV-0dnY5k4H8M','2026-03-07 17:13:55.550749'),('xtxgnpn6aelexol0a53fzb1n0p2quozf','eyJwYXRpZW50X2lkIjoiNjY0MDEzODIyIn0:1vuMGk:Z_-TjVC9zB6S3dKYvBp3yUf9pWgv5iJisGZw3RnhXZE','2026-03-09 03:05:58.803903'),('xw2ncaw9k4w4pnqvvsl22qmh3zha3chc','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vukde:uR4_SlgGlNXnIK0bpxRw0RoFWyJbnbWcnTFNoljufgY','2026-03-10 05:07:14.435244'),('xwrjax529ax3kb0xqfxsswlz0q8d76mh','eyJwYXRpZW50X2lkIjoiNTQxMTU5MjUyIn0:1w2L98:p9LNG765yEeKFAUxt1j4gpEkyxdursM8HP8vAEvHoUk','2026-03-31 03:31:06.263831'),('y1jdfuftfkrbv3p3t4pvzmi8bmama29l','eyJwYXRpZW50X2lkIjoiOTg5NTUzNDI4In0:1vwB1m:SJzRLOjiF9_Askb8UJ86bjtjuouYiYElRhX2QAlbbvI','2026-03-14 03:30:02.344879'),('y5z0bylu95rjrkaav1afj6ut3e30ei9f','eyJwYXRpZW50X2lkIjoiNTQxMTU5MjUyIn0:1w22PG:Q-hj00SYRpB49Lw3M-fNN61N0fUumD_yK6znwYj7g_c','2026-03-30 07:30:30.785350'),('y6n3tpvwyxa3skgoy4v3x9jo0pwxx2ww','eyJwYXRpZW50X2lkIjoiNTQxMTU5MjUyIn0:1w2Kic:g7cj3ri7eMvk0JVHqWkoBiuuhhnmaQyXoidktzYmdew','2026-03-31 03:03:42.631877'),('y90a67dhjghtkkiz9ogybdvl6k43che1','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1w0BZw:6ooLltYMZYH8s3ZyMF_BESL4Gqgov56u3R1pP7AXeyE','2026-03-25 04:53:52.982658'),('yd9suscteii49us6g5xviidpv7mdqamf','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vujFc:63UE2BWV40Ps0I82pm0t0_C0aICwHHn51ChfBoef1Ko','2026-03-10 03:38:20.804633'),('yf7547yumdwaf0dcfp9t4rjfd6oy24bg','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vwFHS:xt1GepfyaKWFno73a6xHDLQ5tsGn2ljkvhEZKgGxNxE','2026-03-14 08:02:30.058523'),('yhiqet2dk423qcu4jzc4w54bgt68swly','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vw0NA:sxkKVMdU9LvomzbJ6XVoX4BeTku3mQCTGz4cPMB8Cbs','2026-03-13 16:07:24.405053'),('yii2agu00nh1muex16krkoyopxkkzywg','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vuk3S:MzEkEOceJYbIzp6_vliTpVQirCueZDlco3cMm7zIqPA','2026-03-10 04:29:50.493540'),('ywjxn6epp374092lssyzm0484j7oq05f','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vvTDS:4ugFnIMSdDNEa1mMrzL4zDS22sXSUUkqobjKRyaE8hQ','2026-03-12 04:43:10.429217'),('yyepj9s1dbkcj4nkyjszuufdx8t3m11s','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vwAbc:YvQMjubvJQxzYQJEheR2CR6vgJF3cOG3_7WJUqLiRNo','2026-03-14 03:03:00.143120'),('yyuumph0l6wo6qcbnu5w4bnr6ls471ve','eyJwYXRpZW50X2lkIjoiOTg5NTUzNDI4In0:1vwCtK:qsGT9F_PbDsWtK9uh2O-72SJah25RIIh649vzT4rhjQ','2026-03-14 05:29:26.312702'),('zbccnznyf6aewmntwrxmwhj3p8kdg984','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1w3UKG:isGM4ZTzajYD_r2WBdwfTHALzaN9hXsOSn5X68eLg_0','2026-04-03 07:31:20.078019'),('zbrpmovf6emhfe9igzl3xe1knziwvzc0','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vzV4R:k3HxZ56rH2XX-9vwB3OX_B2686zABwFJHpGVxLSFqOs','2026-03-23 07:30:31.927114'),('zdzrmhcuybyo31j5do3khjmk1yf7nn67','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vxHUH:9Ik7qDC-Dk2mySXKseiYDrzDknXdrmN5J3bXKNBbtwM','2026-03-17 04:36:01.662841'),('ze9g8bh222ov9fq5qk54pctw6eowgk9d','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vy0jX:H0btNI7fJzG0urv1DWTw5luWV9MGMylbuav_ZqPx-yM','2026-03-19 04:54:47.567434'),('zkobfpw434c8k763e78vev0vt8njzje4','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vy43u:IM_o6azDGcxygwZXL3hUTS6TYW5u8REIaoLzWuVv9qQ','2026-03-19 08:28:02.281774'),('zretdhls8qay98sw89ja4j6nayhn0sji','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vv8t1:C7UB5vQlvAr_v1zQMhlztwOU9uxh1UP_xu9MKhQFfL8','2026-03-11 07:00:43.028134'),('zt1ydwlfpk86jfdgfi2bm3jm7j7yarkq','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vxd5W:1V9CjMtPWNSfv8nHsITtXaqWVenyT_sVgk70KEX019Y','2026-03-18 03:39:54.083138'),('zwkui3k8qwiy6rz3c6m2fpl2q3i3nvwf','eyJwYXRpZW50X2lkIjoiNjY2NzkwNzgxIn0:1vxyrX:oSv8qtiKQEpa4GYJTcyuqNXF2wyCEGdmc2CenR09DGE','2026-03-19 02:54:55.954706');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor_doctorprofile`
--

DROP TABLE IF EXISTS `doctor_doctorprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor_doctorprofile` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `full_name` varchar(100) NOT NULL,
  `age` int NOT NULL,
  `gender` varchar(10) NOT NULL,
  `specialization` varchar(100) NOT NULL,
  `profile_picture` varchar(100) DEFAULT NULL,
  `doctor_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `doctor_id` (`doctor_id`),
  CONSTRAINT `doctor_doctorprofile_doctor_id_9779cf08_fk_doctor_doctoruser_id` FOREIGN KEY (`doctor_id`) REFERENCES `doctor_doctoruser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor_doctorprofile`
--

LOCK TABLES `doctor_doctorprofile` WRITE;
/*!40000 ALTER TABLE `doctor_doctorprofile` DISABLE KEYS */;
INSERT INTO `doctor_doctorprofile` VALUES (3,'Kishore Reddy',26,'Male','Cardiologist','',7),(4,'Kishore Reddy',39,'Male','Cardiologist','',13),(5,'Kishore',36,'Male','Neurologist','doctor_profiles/doctor_profile_1772099044246.jpg',14),(6,'rahul',36,'Male','Cardiologist','',15),(7,'Vikram',35,'Male','Dermatologist','',17);
/*!40000 ALTER TABLE `doctor_doctorprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor_doctoruser`
--

DROP TABLE IF EXISTS `doctor_doctoruser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor_doctoruser` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `doc_id` varchar(9) DEFAULT NULL,
  `full_name` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `email` varchar(254) NOT NULL,
  `password` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `doc_id` (`doc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor_doctoruser`
--

LOCK TABLES `doctor_doctoruser` WRITE;
/*!40000 ALTER TABLE `doctor_doctoruser` DISABLE KEYS */;
INSERT INTO `doctor_doctoruser` VALUES (7,'DOC124','Kishore Reddy','8989897789','kishore.aug1@gmail.com','pbkdf2_sha256$1200000$N39XvD132fXSsmUrSG3tJP$ncw2CVxrRzNJSd3BVXQ4tMMTiewGHA6ISAMDd0nz1AA=',1),(13,'338758769','Kishore Reddy','7755996633','Kishorekishu266@gmail.com','pbkdf2_sha256$1200000$Qck5OcjzK4XBUVPDBDqsbP$bdkKk/othAeVdwds9lRHYId+K57HLCU7UwiROZ26xyk=',1),(14,'115907221','Kishore','7995939828','Kishore.reddy814@gmail.com','pbkdf2_sha256$1200000$rE0K5cOXRbHCLpn0DrnY7D$kVS2cfpQpi0b7Zso/c4Zqrm3mTNxV2BtT1JN19XpTHI=',1),(15,'568200396','rahul','7675652323','rahul.mn3233@gmail.com','pbkdf2_sha256$1200000$HFe92v54zgslObBk4MOCnZ$7iJpnKtKTmiaYis4/QhXxPOqi0ObK+pBA3rzt5tvKOs=',1),(17,'516302446','Vikram','7666662588','kishore.aug2005@gmail.com','pbkdf2_sha256$1200000$BVBuViECruCCqgCJV3JGYA$3u4r2kFlvfY2F1K05+m7i7XWoq1DMZ+Jn+wHZskuoWM=',1);
/*!40000 ALTER TABLE `doctor_doctoruser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor_doctorviewedpatient`
--

DROP TABLE IF EXISTS `doctor_doctorviewedpatient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor_doctorviewedpatient` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `patient_id` varchar(50) NOT NULL,
  `patient_name` varchar(100) NOT NULL,
  `viewed_at` datetime(6) NOT NULL,
  `doctor_id` bigint NOT NULL,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `doctor_doctorviewedpatient_doctor_id_patient_id_c8356e0d_uniq` (`doctor_id`,`patient_id`),
  CONSTRAINT `doctor_doctorviewedp_doctor_id_903f1827_fk_doctor_do` FOREIGN KEY (`doctor_id`) REFERENCES `doctor_doctoruser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor_doctorviewedpatient`
--

LOCK TABLES `doctor_doctorviewedpatient` WRITE;
/*!40000 ALTER TABLE `doctor_doctorviewedpatient` DISABLE KEYS */;
INSERT INTO `doctor_doctorviewedpatient` VALUES (2,'666790781','Kishore Reddy','2026-03-06 09:12:44.245077',14,'Completed'),(4,'989553428','Dwijesh','2026-03-05 03:49:36.266222',14,'viewed'),(5,'541159252','kishore reddy','2026-03-06 07:51:49.203129',14,'viewed'),(9,'366934987','Chenna Kesava Reddy','2026-03-06 09:12:33.964078',14,'Completed'),(10,'436206219','Patient 436206219','2026-03-18 03:30:53.928064',14,'viewed'),(11,'541159252','Patient 541159252','2026-03-18 05:38:11.448993',17,'viewed'),(12,'666790781','Patient 666790781','2026-03-18 05:38:44.218161',17,'viewed');
/*!40000 ALTER TABLE `doctor_doctorviewedpatient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor_otp`
--

DROP TABLE IF EXISTS `doctor_otp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor_otp` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_email` varchar(254) NOT NULL,
  `code` varchar(6) NOT NULL,
  `purpose` varchar(20) NOT NULL,
  `is_verified` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor_otp`
--

LOCK TABLES `doctor_otp` WRITE;
/*!40000 ALTER TABLE `doctor_otp` DISABLE KEYS */;
INSERT INTO `doctor_otp` VALUES (7,'kishore.aug1@gmail.com','547214','register',0,'2026-02-17 08:28:26.585280'),(9,'Kishorekishu266@gmail.com','269543','register',0,'2026-02-23 07:16:41.131795'),(10,'kishorekishu266@gmail.com','189492','register',0,'2026-02-23 07:24:31.113230'),(11,'Kishorekishu266@gmail.com','945997','register',0,'2026-02-23 07:25:38.655050'),(12,'Kishorekishu266@gmail.com','726847','register',0,'2026-02-23 07:26:27.101769'),(13,'Kishorekishu266@gmail.com','456122','register',0,'2026-02-23 07:34:22.920155'),(14,'Kishorekishu266@gmail.com','487130','register',0,'2026-02-23 07:38:45.013994'),(15,'Kishore.reddy814@gmail.com','542833','register',0,'2026-02-24 03:43:20.001903'),(17,'rahul.mn3233@gmail.com','225350','register',0,'2026-03-17 03:29:36.059594'),(18,'kishore.aug2005@gmail.com','823482','register',0,'2026-03-18 05:30:08.408164'),(19,'kishore.aug2005@gmail.com','969309','register',0,'2026-03-18 05:37:09.664501');
/*!40000 ALTER TABLE `doctor_otp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `health_healthassessment`
--

DROP TABLE IF EXISTS `health_healthassessment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `health_healthassessment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `session_id` int NOT NULL,
  `improvement_percent` int NOT NULL,
  `status` varchar(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `health_healthassessment`
--

LOCK TABLES `health_healthassessment` WRITE;
/*!40000 ALTER TABLE `health_healthassessment` DISABLE KEYS */;
/*!40000 ALTER TABLE `health_healthassessment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_medicalreport`
--

DROP TABLE IF EXISTS `patient_medicalreport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_medicalreport` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `file` varchar(100) NOT NULL,
  `uploaded_at` datetime(6) NOT NULL,
  `analysis` longtext,
  `patient_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `patient_medicalrepor_patient_id_9adccacc_fk_patient_p` (`patient_id`),
  CONSTRAINT `patient_medicalrepor_patient_id_9adccacc_fk_patient_p` FOREIGN KEY (`patient_id`) REFERENCES `patient_patientuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_medicalreport`
--

LOCK TABLES `patient_medicalreport` WRITE;
/*!40000 ALTER TABLE `patient_medicalreport` DISABLE KEYS */;
INSERT INTO `patient_medicalreport` VALUES (37,'reports/upload_DengueReport_Dwijesh_Tatipigari_20260226_083836.pdf','2026-02-28 03:12:17.603753','{\"report\": \"Patient Dwijesh Tatipigari, a 60-year-old male, is **Dengue Positive** with a **Severe** classification and a risk score of 80/100. Key laboratory findings include critically low Platelet Count (25000 /\\u00b5L), low WBC Count (1752 /\\u00b5L), and anemia (Hemoglobin 7.2 g/dL, Hematocrit 21.5 %). The patient has experienced 9 days of fever. Immediate hospitalization, IV fluids, platelet monitoring, and critical care assessment are recommended. A prolonged recovery (14+ days) and hospital stay are expected with continuous follow-up.\", \"triage\": 1, \"severity_score\": 0.8, \"main_disease\": \"Dengue\", \"possible_diseases\": [{\"name\": \"Dengue\", \"probability\": 1.0}]}',16),(40,'reports/blood_report_w0EodwO.pdf','2026-03-05 05:21:57.980277','{\"report\": \"The patient, Mr. T. Kishore Reddy (19 years, Male), presents with largely normal hematological and renal function parameters. Complete blood count shows a hemoglobin of 13.0 gms% (normal for male), normal total WBC count, and normal differential counts. Platelet count is also within the normal range.\\n\\nMinor borderline findings include a slightly low RBC count of 4.39 M/cumm (reference: 4.5-5.5 M/cumm) and PCV of 39.6 Vol% (reference: 40-54 Vol%). However, other red cell indices (MCV, MCH, MCHC) are within normal limits, suggesting these minor deviations are likely within biological variation or represent a very mild, non-specific finding without immediate clinical significance for anemia.\\n\\nRenal function tests, including Blood Urea, Serum Creatinine, and Serum Uric Acid, are all within their respective reference ranges.\", \"triage\": 3, \"severity_score\": 0.05, \"main_disease\": \"No significant abnormalities\", \"possible_diseases\": [{\"name\": \"Mild Anemia (borderline red cell parameters)\", \"probability\": 0.05}]}',16),(44,'reports/upload_blood_report_gINaRx5.pdf','2026-03-12 07:59:38.888290','{\"report\": \"Patient Mr. T. Kishore Reddy, a 19-year-old male, presents with a medical report indicating a very subtle hematological deviation. Key findings include a mildly reduced Red Blood Cell count (4.39 M/cumm; reference range: 4.5 - 5.5 m) and a slightly low Packed Cell Volume (PCV) of 39.6 Vol% (reference range: 40-54). Haemoglobin is at the lower end of the normal range at 13.0 gms% (reference range for male: 13-18). All other Complete Blood Count parameters, including White Blood Cell count, differential count (Neutrophils, Lymphocytes, Eosinophils, Monocytes, Basophils), Platelet Count, MCV, MCH, and MCHC, are within their respective normal reference ranges. Renal Function Test results (Blood Urea, Serum Creatinine, Serum Uric Acid) are entirely within normal limits for his age and sex. The minor reductions in RBC and PCV, with Haemoglobin still within the lower normal range, suggest a very mild, non-specific hematological change, possibly an early stage of mild anemia or individual variation. Further investigation, if clinically indicated, may involve re-evaluation or iron studies.\", \"triage\": 3, \"severity_score\": 0.15, \"main_disease\": \"Mild Anemia (unspecified)\", \"possible_diseases\": [{\"name\": \"Mild Anemia\", \"probability\": 0.6}, {\"name\": \"Early Iron Deficiency Anemia\", \"probability\": 0.3}, {\"name\": \"Normal Physiological Variation\", \"probability\": 0.1}]}',9),(45,'reports/upload_blood_report_cOROtwR.pdf','2026-03-12 08:00:09.922416','{\"report\": \"The medical report for Mr. T. Kishore Reddy, a 19-year-old male, indicates largely normal findings. \\n\\n**Complete Blood Count:**\\n*   Haemoglobin (13.0 gms%) is within the normal range for males (13-18 gms%).\\n*   Total WBC Count (8400 cells/cumm) and Platelet Count (2.25 lakhs/cumm) are normal.\\n*   The Differential Count (Neutrophils, Lymphocytes, Eosinophils, Monocytes, Basophils) is entirely within normal reference ranges.\\n*   **Red Blood Cell (RBC) Count is marginally low at 4.39 M/cumm** (Reference: 4.5-5.5 M/cumm).\\n*   **Packed Cell Volume (PCV) is also marginally low at 39.6 Vol%** (Reference: 40-54 Vol%).\\n*   Red cell indices (MCV, MCH, MCHC) are all within normal limits.\\n\\n**Renal Function Test:**\\n*   Blood Urea (31 mg/dl), Serum Creatinine (1.1 mg/dl), and Serum Uric Acid (5.7 mg/dl) are all within normal limits for a male.\\n\\n**Clinical Impression:**\\nOverall, the report shows a very mild, uncharacterized reduction in Red Blood Cell count and Packed Cell Volume. Given that hemoglobin is normal and red cell indices are also normal, this deviation is minor and likely not clinically significant in the absence of specific symptoms. No other significant abnormalities were noted in the complete blood count or renal function tests.\", \"triage\": 3, \"severity_score\": 0.15, \"main_disease\": \"Mild Anemia (Unspecified)\", \"possible_diseases\": [{\"name\": \"Mild Anemia (Unspecified)\", \"probability\": 0.85}, {\"name\": \"Normal Physiological Variation\", \"probability\": 0.1}, {\"name\": \"Early Nutritional Deficiency\", \"probability\": 0.05}]}',9),(46,'reports/upload_blood_report_oB6pbqH.pdf','2026-03-12 08:05:49.074587','{\"report\": \"### Patient Overview\\nMr. T. Kishore Reddy, a 19-year-old male, underwent a complete blood count (CBC) and renal function test (RFT).\\n\\n### Key Findings\\n*   **Complete Blood Count:**\\n    *   Haemoglobin is 13.0 gms%, which is at the lower end of the normal reference range for males (13-18 gms%).\\n    *   Red Blood Cell (RBC) count is slightly reduced at 4.39 M/cumm (Reference Range: 4.5 - 5.5 M/cumm).\\n    *   Packed Cell Volume (PCV) is slightly reduced at 39.6 Vol% (Reference Range: 40-54 Vol%).\\n    *   Mean Corpuscular Volume (MCV), Mean Corpuscular Haemoglobin (MCH), and Mean Corpuscular Haemoglobin Concentration (MCHC) are all within normal limits, indicating normocytic and normochromic red cells.\\n    *   Total White Blood Cell (WBC) count, differential counts (Neutrophils, Lymphocytes, Eosinophils, Monocytes, Basophils), and Platelet count are all within their respective normal reference ranges.\\n*   **Renal Function Test:**\\n    *   Blood Urea, Serum Creatinine, and Serum Uric Acid are all within normal reference ranges.\\n\\n### Clinical Impression\\nThe report indicates mild, normocytic red cell parameters with a slightly reduced RBC count and PCV, and Haemoglobin at the lower limit of normal for a male. All other hematological parameters and renal function tests are within normal limits. The findings suggest a borderline or very mild normocytic anemia, which may be due to physiological variation or early/mild underlying causes. No urgent or critical abnormalities were detected. Clinical correlation with the referring physician is recommended.\", \"triage\": 3, \"severity_score\": 0.15, \"main_disease\": \"Borderline Anemia (Normocytic)\", \"possible_diseases\": [{\"name\": \"Borderline Anemia (Normocytic)\", \"probability\": 0.6}, {\"name\": \"Physiological Variation\", \"probability\": 0.3}, {\"name\": \"Early Nutritional Deficiency\", \"probability\": 0.1}]}',9),(61,'reports/upload_blood_report_RunabDZ.pdf','2026-03-18 05:09:45.366810','{\"report\": \"### \\ud83e\\uddea Medical Report\\n\\n### \\ud83d\\udc64 Patient Information\\n\\n**Name:** Mr.T. Kishore Reddy \\n\\n**Age:** 19\\n\\n**Gender:** Female\\n\\n### \\ud83d\\udcca Results\\n\\n- \\ud83d\\udfe2 **Hemoglobin**: 13.0 (Normal)\\n- \\ud83d\\udfe2 **Wbc**: 8400.0 (Normal)\\n- \\ud83d\\udfe2 **Rbc**: 4.39 (Normal)\\n- \\ud83d\\udfe2 **Platelet**: 2.25 (Normal)\\n- \\ud83d\\udfe2 **Creatinine**: 1.1 (Normal)\\n- \\ud83d\\udfe2 **Pcv**: 39.6 (Normal)\\n\", \"triage\": 3, \"severity_score\": 0.0, \"main_disease\": \"Normal\", \"possible_diseases\": []}',15),(62,'reports/upload_blood_report_LA9DWif.pdf','2026-03-18 05:16:29.137996','{\"report\": \"### \\ud83e\\uddea Medical Report\\n\\n### \\ud83d\\udc64 Patient Information\\n\\n**Name:** Mr.T. Kishore Reddy \\n\\n**Age:** 19\\n\\n### \\ud83d\\udcca Results\\n\\n- \\ud83d\\udfe2 **Hemoglobin**: 13.0 (Normal)\\n- \\ud83d\\udfe2 **Wbc**: 8400.0 (Normal)\\n- \\ud83d\\udfe2 **Rbc**: 4.39 (Normal)\\n- \\ud83d\\udfe2 **Platelet**: 2.25 (Normal)\\n- \\ud83d\\udfe2 **Creatinine**: 1.1 (Normal)\\n- \\ud83d\\udfe2 **Pcv**: 39.6 (Normal)\\n\", \"triage\": 3, \"severity_score\": 0.0, \"main_disease\": \"Normal\", \"possible_diseases\": []}',15),(63,'reports/upload_blood_report_v18ZDyr.pdf','2026-03-18 05:25:22.696125','{\"report\": \"### \\ud83e\\uddea Medical Report\\n\\n### \\ud83d\\udc64 Patient Information\\n\\n**Name:** Mr.T. Kishore Reddy \\n\\n**Age:** 19\\n\\n### \\ud83d\\udcca Results\\n\\n- \\ud83d\\udfe2 **Hemoglobin**: 13.0 (Normal)\\n- \\ud83d\\udfe2 **Wbc**: 8400.0 (Normal)\\n- \\ud83d\\udfe2 **Rbc**: 4.39 (Normal)\\n- \\ud83d\\udfe2 **Platelet**: 2.25 (Normal)\\n- \\ud83d\\udfe2 **Creatinine**: 1.1 (Normal)\\n- \\ud83d\\udfe2 **Pcv**: 39.6 (Normal)\\n\", \"triage\": 3, \"severity_score\": 0.0, \"main_disease\": \"Normal\", \"possible_diseases\": []}',15),(64,'reports/blood_report_9aer0HT.jpeg','2026-03-18 05:41:00.687551','{\"report\": \"### \\ud83e\\uddea Medical Report\\n\\n### \\ud83d\\udc64 Patient Information\\n\\n**Name:** Mr\\n\\n**Age:** 19\\n\\n### \\ud83d\\udcca Results\\n\\n- \\ud83d\\udd34 **Hemoglobin**: 13.0 (Low)\\n- \\ud83d\\udfe2 **Wbc**: 8400.0 (Normal)\\n- \\ud83d\\udd34 **Rbc**: 4.39 (Low)\\n- \\ud83d\\udfe2 **Platelet**: 2.25 (Normal)\\n- \\ud83d\\udd34 **Creatinine**: 1.4 (High)\\n- \\ud83d\\udd34 **Pcv**: 39.6 (Low)\\n\", \"triage\": 1, \"severity_score\": 0.67, \"main_disease\": \"Abnormal Report\", \"possible_diseases\": [{\"name\": \"Hemoglobin (Low)\", \"probability\": 0.67}, {\"name\": \"Rbc (Low)\", \"probability\": 0.67}, {\"name\": \"Creatinine (High)\", \"probability\": 0.67}, {\"name\": \"Pcv (Low)\", \"probability\": 0.67}]}',15),(65,'reports/upload_blood_report_GvX4G9I.pdf','2026-03-18 09:03:34.039642','{\"patient_info\": {\"name\": \"Mr.T. Kishore Reddy \", \"gender\": \"female\", \"age\": 19}, \"values\": {\"hemoglobin\": 13.0, \"wbc\": 8400.0, \"rbc\": 4.39, \"platelet\": 2.25, \"creatinine\": 1.1, \"pcv\": 39.6}, \"analysis\": {\"hemoglobin\": \"Normal\", \"wbc\": \"Normal\", \"rbc\": \"Normal\", \"platelet\": \"Normal\", \"creatinine\": \"Normal\", \"pcv\": \"Normal\"}}',15),(66,'reports/upload_blood_report_Mr1gNbo.pdf','2026-03-18 09:05:56.005378','{\"report\": \"### \\ud83e\\uddea Medical Report\\n\\n### \\ud83d\\udc64 Patient Information\\n\\n**Name:** Mr.T. Kishore Reddy \\n\\n**Age:** 19\\n\\n### \\ud83d\\udcca Results\\n\\n- \\ud83d\\udfe2 **Hemoglobin**: 13.0 (Normal)\\n- \\ud83d\\udfe2 **Wbc**: 8400.0 (Normal)\\n- \\ud83d\\udfe2 **Rbc**: 4.39 (Normal)\\n- \\ud83d\\udfe2 **Platelet**: 2.25 (Normal)\\n- \\ud83d\\udfe2 **Creatinine**: 1.1 (Normal)\\n- \\ud83d\\udfe2 **Pcv**: 39.6 (Normal)\\n\", \"triage\": 3, \"severity_score\": 0.0, \"main_disease\": \"Normal\", \"possible_diseases\": []}',15),(67,'reports/upload_blood_report_l54Rlwf.pdf','2026-03-18 09:06:18.826408','{\"report\": \"### \\ud83e\\uddea Medical Report\\n\\n### \\ud83d\\udc64 Patient Information\\n\\n**Name:** Mr.T. Kishore Reddy \\n\\n**Age:** 19\\n\\n### \\ud83d\\udcca Results\\n\\n- \\ud83d\\udfe2 **Hemoglobin**: 13.0 (Normal)\\n- \\ud83d\\udfe2 **Wbc**: 8400.0 (Normal)\\n- \\ud83d\\udfe2 **Rbc**: 4.39 (Normal)\\n- \\ud83d\\udfe2 **Platelet**: 2.25 (Normal)\\n- \\ud83d\\udfe2 **Creatinine**: 1.1 (Normal)\\n- \\ud83d\\udfe2 **Pcv**: 39.6 (Normal)\\n\", \"triage\": 3, \"severity_score\": 0.0, \"main_disease\": \"Normal\", \"possible_diseases\": []}',15),(68,'reports/blood_report_4geh7EM.jpeg','2026-03-18 16:32:19.044785','{\"report\": \"### \\ud83e\\uddea Medical Report\\n\\n### \\ud83d\\udc64 Patient Information\\n\\n**Name:** Mr\\n\\n**Age:** 19\\n\\n### \\ud83d\\udcca Results\\n\\n- \\ud83d\\udd34 **Hemoglobin**: 13.0 (Low)\\n- \\ud83d\\udfe2 **Wbc**: 8400.0 (Normal)\\n- \\ud83d\\udd34 **Rbc**: 4.39 (Low)\\n- \\ud83d\\udfe2 **Platelet**: 2.25 (Normal)\\n- \\ud83d\\udd34 **Creatinine**: 1.4 (High)\\n- \\ud83d\\udd34 **Pcv**: 39.6 (Low)\\n\", \"triage\": 1, \"severity_score\": 0.67, \"main_disease\": \"Abnormal Report\", \"possible_diseases\": [{\"name\": \"Hemoglobin (Low)\", \"probability\": 0.67}, {\"name\": \"Rbc (Low)\", \"probability\": 0.67}, {\"name\": \"Creatinine (High)\", \"probability\": 0.67}, {\"name\": \"Pcv (Low)\", \"probability\": 0.67}]}',15),(69,'reports/blood_report_kPhaNzM.jpeg','2026-03-18 16:41:15.635069','{\"report\": \"### \\ud83e\\uddea Medical Report\\n\\n### \\ud83d\\udc64 Patient Information\\n\\n**Name:** Mr\\n\\n**Age:** 19\\n\\n**Gender:** Male\\n\\n### \\ud83d\\udcca Results\\n\\n- \\ud83d\\udd34 **Hemoglobin**: 13.0 (Low)\\n- \\ud83d\\udfe2 **Wbc**: 8400.0 (Normal)\\n- \\ud83d\\udd34 **Rbc**: 4.39 (Low)\\n- \\ud83d\\udfe2 **Platelet**: 2.25 (Normal)\\n- \\ud83d\\udd34 **Creatinine**: 1.4 (High)\\n- \\ud83d\\udd34 **Pcv**: 39.6 (Low)\\n\", \"triage\": 1, \"severity_score\": 0.67, \"main_disease\": \"Abnormal Report\", \"possible_diseases\": [{\"name\": \"Hemoglobin (Low)\", \"probability\": 0.67}, {\"name\": \"Rbc (Low)\", \"probability\": 0.67}, {\"name\": \"Creatinine (High)\", \"probability\": 0.67}, {\"name\": \"Pcv (Low)\", \"probability\": 0.67}]}',15),(70,'reports/blood_report_qdw6Sod.jpeg','2026-03-18 16:43:26.102064','{\"report\": \"### \\ud83e\\uddea Medical Report\\n\\n### \\ud83d\\udc64 Patient Information\\n\\n**Name:** Mr\\n\\n**Age:** 19\\n\\n**Gender:** Male\\n\\n### \\ud83d\\udcca Results\\n\\n- \\ud83d\\udfe2 **Hemoglobin**: 13.0 (Normal)\\n- \\ud83d\\udfe2 **Wbc**: 8400.0 (Normal)\\n- \\ud83d\\udd34 **Rbc**: 4.39 (Low)\\n- \\ud83d\\udfe2 **Platelet**: 2.25 (Normal)\\n- \\ud83d\\udd34 **Creatinine**: 1.4 (High)\\n- \\ud83d\\udd34 **Pcv**: 39.6 (Low)\\n\", \"triage\": 1, \"severity_score\": 0.5, \"main_disease\": \"Abnormal Report\", \"possible_diseases\": [{\"name\": \"Rbc (Low)\", \"probability\": 0.5}, {\"name\": \"Creatinine (High)\", \"probability\": 0.5}, {\"name\": \"Pcv (Low)\", \"probability\": 0.5}]}',15),(71,'reports/upload_blood_report_Wcv5MBY.pdf','2026-03-18 16:44:24.379074','{\"report\": \"### \\ud83e\\uddea Medical Report\\n\\n### \\ud83d\\udc64 Patient Information\\n\\n**Name:** Mr.T. Kishore Reddy \\n\\n**Age:** 19\\n\\n**Gender:** Male\\n\\n### \\ud83d\\udcca Results\\n\\n- \\ud83d\\udfe2 **Hemoglobin**: 13.0 (Normal)\\n- \\ud83d\\udfe2 **Wbc**: 8400.0 (Normal)\\n- \\ud83d\\udd34 **Rbc**: 4.39 (Low)\\n- \\ud83d\\udfe2 **Platelet**: 2.25 (Normal)\\n- \\ud83d\\udfe2 **Creatinine**: 1.1 (Normal)\\n- \\ud83d\\udd34 **Pcv**: 39.6 (Low)\\n\", \"triage\": 2, \"severity_score\": 0.33, \"main_disease\": \"Abnormal Report\", \"possible_diseases\": [{\"name\": \"Rbc (Low)\", \"probability\": 0.33}, {\"name\": \"Pcv (Low)\", \"probability\": 0.33}]}',15),(72,'reports/upload_blood_report_EOKMFOv.pdf','2026-03-19 10:18:03.048563','{\"report\": \"### \\ud83e\\uddea Medical Report\\n\\n### \\ud83d\\udc64 Patient Information\\n\\n**Name:** Mr.T. Kishore Reddy \\n\\n**Age:** 19\\n\\n**Gender:** Male\\n\\n### \\ud83d\\udcca Results\\n\\n- \\ud83d\\udfe2 **Hemoglobin**: 13.0 (Normal)\\n- \\ud83d\\udfe2 **Wbc**: 8400.0 (Normal)\\n- \\ud83d\\udd34 **Rbc**: 4.39 (Low)\\n- \\ud83d\\udfe2 **Platelet**: 2.25 (Normal)\\n- \\ud83d\\udfe2 **Creatinine**: 1.1 (Normal)\\n- \\ud83d\\udd34 **Pcv**: 39.6 (Low)\\n\", \"triage\": 2, \"severity_score\": 0.33, \"main_disease\": \"Abnormal Report\", \"possible_diseases\": [{\"name\": \"Rbc (Low)\", \"probability\": 0.33}, {\"name\": \"Pcv (Low)\", \"probability\": 0.33}]}',15);
/*!40000 ALTER TABLE `patient_medicalreport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_otp`
--

DROP TABLE IF EXISTS `patient_otp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_otp` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_email` varchar(254) NOT NULL,
  `code` varchar(6) NOT NULL,
  `purpose` varchar(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_otp`
--

LOCK TABLES `patient_otp` WRITE;
/*!40000 ALTER TABLE `patient_otp` DISABLE KEYS */;
INSERT INTO `patient_otp` VALUES (1,'kishorekishu266@gmail.com','305019','register','2026-02-17 08:32:37.641822'),(12,'dwijeshtatipi@gmail.com','986567','register','2026-02-23 04:17:23.992796'),(13,'dwijeshtatipi@gmail.com','577156','register','2026-02-23 04:23:48.189704'),(16,'kishore.aug2005@gmail.com','587865','register','2026-02-23 07:56:27.887522'),(25,'kishore.aug2005@gmail.com','793033','forgot','2026-03-09 07:18:20.113286');
/*!40000 ALTER TABLE `patient_otp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_patienthealthprofile`
--

DROP TABLE IF EXISTS `patient_patienthealthprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_patienthealthprofile` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `age` int NOT NULL,
  `gender` varchar(10) NOT NULL,
  `height` double NOT NULL,
  `weight` double NOT NULL,
  `blood_group` varchar(5) NOT NULL,
  `existing_conditions` longtext NOT NULL,
  `patient_id` bigint NOT NULL,
  `profile_picture` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `patient_id` (`patient_id`),
  CONSTRAINT `patient_patienthealt_patient_id_3e5f42ed_fk_patient_p` FOREIGN KEY (`patient_id`) REFERENCES `patient_patientuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_patienthealthprofile`
--

LOCK TABLES `patient_patienthealthprofile` WRITE;
/*!40000 ALTER TABLE `patient_patienthealthprofile` DISABLE KEYS */;
INSERT INTO `patient_patienthealthprofile` VALUES (1,24,'Male',170,65,'O+','Asthma',1,NULL),(6,21,'Male',180,80,'O+','Migraine',15,'profile_pics/profile_1771904384612.jpg'),(7,21,'Male',180,68,'B+','Migraine',16,''),(8,23,'Male',180,88,'B-','',9,''),(9,22,'Male',173,52,'A+','Diabetes, Hypertension',17,''),(14,22,'Male',180,76,'B-','',22,''),(15,24,'Male',180,76,'B+','Heart Disease',23,'');
/*!40000 ALTER TABLE `patient_patienthealthprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_patientuser`
--

DROP TABLE IF EXISTS `patient_patientuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_patientuser` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `patient_id` varchar(9) DEFAULT NULL,
  `full_name` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `email` varchar(254) NOT NULL,
  `password` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `profile_completed` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `patient_id` (`patient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_patientuser`
--

LOCK TABLES `patient_patientuser` WRITE;
/*!40000 ALTER TABLE `patient_patientuser` DISABLE KEYS */;
INSERT INTO `patient_patientuser` VALUES (1,'PAT123','Kishore','9988998899','kishorekishu266@gmail.com','pbkdf2_sha256$1200000$LaoMPiuZQlk9uaHy66rrgS$1esRaKQvFaTRA2Z1Wi55nzBNLdreFZ/bGXd4nmJEtpU=',0,0),(9,'541159252','kishore reddy','7995939828','kishore.reddy814@gmail.com','pbkdf2_sha256$1200000$adix7B3TQBHoNm7wKo3gV3$xU/C0/avOUW7oK4Ga1SxRvEj4esdIuJR3/h6/loarEk=',1,0),(15,'666790781','Kishore Reddy','7995939828','kishore.aug2005@gmail.com','pbkdf2_sha256$1200000$CcbWBWsP9P2iCnxr0zDYzN$jGemPmb61BSNHz4Bb7lXeeY75mZP9F8ctjMh0A3KZCk=',1,0),(16,'989553428','Dwijesh','7572233666','dwijeshtatipigari217@gmail.com','pbkdf2_sha256$1200000$tRhK7n9KOIfzzvXfBZSbRC$x8VgVbT0xVBEiCZOxOtv2Vl69Sqci4JYtJsPJBn4M0Q=',1,0),(17,'366934987','Chenna Kesava Reddy','7075346544','kingsdevil789@gmail.com','pbkdf2_sha256$1200000$Q9t2wN45q0AVBVFLV2mCHV$ozC4e7m2w9WVg1eIv0Fv/h7DegZ1Qheq3CRrNCP+W98=',1,0),(22,'736171682','rahul','7976352644','Rahul.mn3233@gmail.com','pbkdf2_sha256$1200000$zubncaJVU9AR4qkt6FTaHq$wYoCKYRw0jL7eH2syT2qUZ7kMJfLY98qu5rTa9QhiGY=',1,0),(23,'436206219','Arjun','7755993322','kishore08.25.01@gmail.com','pbkdf2_sha256$1200000$tsborpWtuH1aZ520pTRakp$wGxIrAHxbMfe0Z/mMsIkfdXNlAmE1mFlkZDTF8oKPBU=',1,0);
/*!40000 ALTER TABLE `patient_patientuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_recentactivity`
--

DROP TABLE IF EXISTS `patient_recentactivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_recentactivity` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `activity_type` varchar(50) NOT NULL,
  `title` varchar(200) NOT NULL,
  `item_id` varchar(50) DEFAULT NULL,
  `timestamp` datetime(6) NOT NULL,
  `patient_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `patient_recentactivi_patient_id_66524771_fk_patient_p` (`patient_id`),
  CONSTRAINT `patient_recentactivi_patient_id_66524771_fk_patient_p` FOREIGN KEY (`patient_id`) REFERENCES `patient_patientuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_recentactivity`
--

LOCK TABLES `patient_recentactivity` WRITE;
/*!40000 ALTER TABLE `patient_recentactivity` DISABLE KEYS */;
INSERT INTO `patient_recentactivity` VALUES (1,'report_view','Viewed Analysis: reports/blood_report_b8OPxWD.pdf','38','2026-03-05 05:19:58.696683',15),(2,'report_view','Viewed Analysis: reports/upload_surgery_september_2024_lU1QLCS.pdf','36','2026-03-09 06:35:32.386153',15),(3,'report_view','Viewed Analysis: reports/upload_DOC-20260224-WA0004_3eTTz5W..pdf','33','2026-03-05 05:20:46.115950',15),(4,'report_upload','Uploaded Report: blood report.pdf','39','2026-03-04 08:33:00.577944',15),(5,'report_analysis','Analyzed Report: reports/blood_report_6CYhndo.pdf','39','2026-03-04 08:33:11.032323',15),(6,'report_view','Viewed Analysis: reports/blood_report_6CYhndo.pdf','39','2026-03-09 07:48:13.500100',15),(7,'report_view','Viewed Analysis: reports/upload_surgery_september_2024_LNklAuk.pdf','35','2026-03-09 07:04:36.108079',15),(8,'report_view','Viewed Analysis: reports/upload_DengueReport_Dwijesh_Tatipigari_20260226_083836.pdf','37','2026-03-05 05:25:24.800303',16),(9,'report_upload','Uploaded Report: blood report.pdf','40','2026-03-05 05:21:57.985342',16),(10,'report_analysis','Analyzed Report: reports/blood_report_w0EodwO.pdf','40','2026-03-05 05:22:13.911820',16),(11,'report_view','Viewed Analysis: reports/blood_report_w0EodwO.pdf','40','2026-03-05 05:29:34.136007',16),(12,'consultation_view','Viewed Assessment: heart attack','77','2026-03-05 05:29:47.776822',16),(13,'consultation_view','Viewed Assessment: acute bronchitis','86','2026-03-05 06:43:07.499107',16),(14,'consultation_view','Viewed Assessment: asthma','87','2026-03-09 08:15:21.127601',16),(15,'report_view','Viewed Analysis: reports/upload_DOC-20260224-WA0004_aAiWi2h..pdf','27','2026-03-09 06:35:43.947158',15),(16,'report_upload','Uploaded Report: upload_blood report.pdf','41','2026-03-12 07:17:23.703477',15),(17,'report_analysis','Analyzed Report: reports/upload_blood_report.pdf','41','2026-03-12 07:17:35.559001',15),(18,'report_upload','Uploaded Report: upload_blood report.pdf','42','2026-03-12 07:21:01.184881',15),(19,'report_analysis','Analyzed Report: reports/upload_blood_report_MKGY9aY.pdf','42','2026-03-12 07:21:13.622792',15),(20,'report_view','Viewed Analysis: reports/upload_blood_report_MKGY9aY.pdf','42','2026-03-12 07:38:53.508428',15),(21,'report_upload','Uploaded Report: upload_blood report.pdf','43','2026-03-12 07:41:55.096747',15),(22,'report_analysis','Analyzed Report: reports/upload_blood_report_RycSedS.pdf','43','2026-03-12 07:42:06.528644',15),(23,'report_view','Viewed Analysis: reports/upload_blood_report_RycSedS.pdf','43','2026-03-18 04:19:30.168546',15),(24,'report_upload','Uploaded Report: upload_blood report.pdf','44','2026-03-12 07:59:38.901355',9),(25,'report_analysis','Analyzed Report: reports/upload_blood_report_gINaRx5.pdf','44','2026-03-12 07:59:51.935175',9),(26,'report_upload','Uploaded Report: upload_blood report.pdf','45','2026-03-12 08:00:09.928752',9),(27,'report_analysis','Analyzed Report: reports/upload_blood_report_cOROtwR.pdf','45','2026-03-12 08:00:23.242324',9),(28,'report_view','Viewed Analysis: reports/upload_blood_report_cOROtwR.pdf','45','2026-03-17 03:06:01.617704',9),(29,'report_view','Viewed Analysis: reports/upload_blood_report_gINaRx5.pdf','44','2026-03-12 08:04:45.257998',9),(30,'report_upload','Uploaded Report: upload_blood report.pdf','46','2026-03-12 08:05:49.082107',9),(31,'report_analysis','Analyzed Report: reports/upload_blood_report_oB6pbqH.pdf','46','2026-03-12 08:06:04.858261',9),(32,'report_view','Viewed Analysis: reports/upload_blood_report_oB6pbqH.pdf','46','2026-03-18 05:38:14.087702',9),(33,'consultation_view','Viewed Assessment: orthostatic hypotension','97','2026-03-17 06:33:35.196915',23),(34,'report_upload','Uploaded Report: blood report.pdf','47','2026-03-17 09:07:35.370882',15),(35,'report_analysis','Analyzed Report: reports/blood_report_xBvHPTf.pdf','47','2026-03-17 09:19:06.885447',15),(36,'report_upload','Uploaded Report: blood report.pdf','48','2026-03-17 09:15:09.245659',15),(37,'report_analysis','Analyzed Report: reports/blood_report_FeUxpqw.pdf','48','2026-03-17 09:15:42.927173',15),(38,'report_upload','Uploaded Report: blood report.jpeg','49','2026-03-17 09:19:36.527925',15),(39,'report_analysis','Analyzed Report: reports/blood_report_Duk7Q9M.jpeg','49','2026-03-17 17:56:43.223223',15),(40,'report_upload','Uploaded Report: blood report.pdf','50','2026-03-17 17:57:47.220454',15),(41,'report_analysis','Analyzed Report: reports/blood_report_zybeVx3.pdf','50','2026-03-17 17:57:55.579752',15),(42,'report_upload','Uploaded Report: sample report.pdf','51','2026-03-17 18:03:02.519405',15),(43,'report_analysis','Analyzed Report: reports/sample_report.pdf','51','2026-03-18 03:26:45.458900',15),(44,'consultation_view','Viewed Assessment: heart contusion','98','2026-03-18 02:47:02.465694',23),(45,'report_view','Viewed Analysis: reports/blood_report_zybeVx3.pdf','50','2026-03-18 03:25:09.380016',15),(46,'report_view','Viewed Analysis: reports/blood_report_FeUxpqw.pdf','48','2026-03-18 02:48:21.652712',15),(47,'report_view','Viewed Analysis: reports/upload_report_b2DvMmQ.pdf','32','2026-03-18 02:47:51.162221',15),(48,'report_view','Viewed Analysis: reports/blood_report_xBvHPTf.pdf','47','2026-03-18 03:25:50.072858',15),(49,'report_view','Viewed Analysis: reports/sample_report.pdf','51','2026-03-18 04:28:58.579670',15),(50,'report_upload','Uploaded Report: blood report.pdf','52','2026-03-18 03:29:35.303862',15),(51,'report_analysis','Analyzed Report: reports/blood_report_V3WHlZW.pdf','52','2026-03-18 04:29:30.725118',15),(52,'report_view','Viewed Analysis: reports/blood_report_V3WHlZW.pdf','52','2026-03-18 04:24:23.655706',15),(53,'report_upload','Uploaded Report: upload_blood report.pdf','53','2026-03-18 03:31:47.147474',23),(54,'report_analysis','Analyzed Report: reports/upload_blood_report_3DRL44t.pdf','53','2026-03-18 03:31:50.536896',23),(55,'report_upload','Uploaded Report: upload_blood report.pdf','54','2026-03-18 03:33:40.731525',15),(56,'report_analysis','Analyzed Report: reports/upload_blood_report_LKy8rhl.pdf','54','2026-03-18 03:33:40.972509',15),(57,'report_upload','Uploaded Report: upload_blood report.pdf','55','2026-03-18 03:50:51.609071',15),(58,'report_analysis','Analyzed Report: reports/upload_blood_report_fCyX9hZ.pdf','55','2026-03-18 03:50:51.981710',15),(59,'report_upload','Uploaded Report: upload_blood report.pdf','56','2026-03-18 03:52:01.992804',15),(60,'report_analysis','Analyzed Report: reports/upload_blood_report_Fkz2bJw.pdf','56','2026-03-18 03:52:02.141762',15),(61,'report_view','Viewed Analysis: reports/upload_blood_report_Fkz2bJw.pdf','56','2026-03-18 04:13:03.468437',15),(62,'report_view','Viewed Analysis: reports/upload_blood_report_LKy8rhl.pdf','54','2026-03-18 04:13:13.340755',15),(63,'report_upload','Uploaded Report: blood report.pdf','57','2026-03-18 04:33:40.680658',15),(64,'report_analysis','Analyzed Report: reports/blood_report_90ppY6n.pdf','57','2026-03-18 05:07:18.027451',15),(65,'report_view','Viewed Analysis: reports/blood_report_90ppY6n.pdf','57','2026-03-18 04:35:14.461911',15),(66,'report_upload','Uploaded Report: upload_blood report.pdf','58','2026-03-18 04:35:30.514126',15),(67,'report_analysis','Analyzed Report: reports/upload_blood_report_sxGOU5d.pdf','58','2026-03-18 04:35:31.447580',15),(68,'report_view','Viewed Analysis: reports/upload_blood_report_sxGOU5d.pdf','58','2026-03-18 04:37:02.812813',15),(69,'report_upload','Uploaded Report: upload_blood report.pdf','59','2026-03-18 04:38:35.189028',15),(70,'report_analysis','Analyzed Report: reports/upload_blood_report_OSuffMP.pdf','59','2026-03-18 04:38:35.714560',15),(71,'report_upload','Uploaded Report: upload_blood report.pdf','60','2026-03-18 04:56:30.385835',15),(72,'report_analysis','Analyzed Report: reports/upload_blood_report_7ETAGhZ.pdf','60','2026-03-18 04:56:30.725650',15),(73,'report_view','Viewed Analysis: reports/upload_blood_report_7ETAGhZ.pdf','60','2026-03-18 05:08:01.473425',15),(74,'report_upload','Uploaded Report: upload_blood report.pdf','61','2026-03-18 05:09:45.373986',15),(75,'report_analysis','Analyzed Report: reports/upload_blood_report_RunabDZ.pdf','61','2026-03-18 05:09:45.566639',15),(76,'report_view','Viewed Analysis: reports/upload_blood_report_RunabDZ.pdf','61','2026-03-19 06:14:57.883004',15),(77,'report_upload','Uploaded Report: upload_blood report.pdf','62','2026-03-18 05:16:29.173302',15),(78,'report_analysis','Analyzed Report: reports/upload_blood_report_LA9DWif.pdf','62','2026-03-18 05:16:29.436324',15),(79,'report_upload','Uploaded Report: upload_blood report.pdf','63','2026-03-18 05:25:22.738046',15),(80,'report_analysis','Analyzed Report: reports/upload_blood_report_v18ZDyr.pdf','63','2026-03-18 05:25:23.134995',15),(81,'report_view','Viewed Analysis: reports/upload_blood_report_v18ZDyr.pdf','63','2026-03-18 05:38:53.594526',15),(82,'report_upload','Uploaded Report: blood report.jpeg','64','2026-03-18 05:41:00.707395',15),(83,'report_analysis','Analyzed Report: reports/blood_report_9aer0HT.jpeg','64','2026-03-18 05:41:04.390497',15),(84,'report_view','Viewed Analysis: reports/blood_report_9aer0HT.jpeg','64','2026-03-18 08:34:21.592239',15),(85,'report_upload','Uploaded Report: upload_blood report.pdf','65','2026-03-18 09:03:34.050247',15),(86,'report_analysis','Analyzed Report: reports/upload_blood_report_GvX4G9I.pdf','65','2026-03-18 09:03:34.175041',15),(87,'report_upload','Uploaded Report: upload_blood report.pdf','66','2026-03-18 09:05:56.012385',15),(88,'report_analysis','Analyzed Report: reports/upload_blood_report_Mr1gNbo.pdf','66','2026-03-18 09:05:56.110402',15),(89,'report_upload','Uploaded Report: upload_blood report.pdf','67','2026-03-18 09:06:18.831776',15),(90,'report_analysis','Analyzed Report: reports/upload_blood_report_l54Rlwf.pdf','67','2026-03-18 09:06:19.082274',15),(91,'report_view','Viewed Analysis: reports/upload_blood_report_l54Rlwf.pdf','67','2026-03-18 16:31:56.778847',15),(92,'report_upload','Uploaded Report: blood report.jpeg','68','2026-03-18 16:32:19.052309',15),(93,'report_analysis','Analyzed Report: reports/blood_report_4geh7EM.jpeg','68','2026-03-18 16:32:22.220066',15),(94,'report_view','Viewed Analysis: reports/blood_report_4geh7EM.jpeg','68','2026-03-18 16:32:27.633777',15),(95,'report_upload','Uploaded Report: blood report.jpeg','69','2026-03-18 16:41:15.665038',15),(96,'report_analysis','Analyzed Report: reports/blood_report_kPhaNzM.jpeg','69','2026-03-18 16:41:16.613279',15),(97,'report_view','Viewed Analysis: reports/blood_report_kPhaNzM.jpeg','69','2026-03-18 16:41:18.717402',15),(98,'report_upload','Uploaded Report: blood report.jpeg','70','2026-03-18 16:43:26.113311',15),(99,'report_analysis','Analyzed Report: reports/blood_report_qdw6Sod.jpeg','70','2026-03-18 16:43:27.142007',15),(100,'report_view','Viewed Analysis: reports/blood_report_qdw6Sod.jpeg','70','2026-03-18 16:43:29.234880',15),(101,'report_upload','Uploaded Report: upload_blood report.pdf','71','2026-03-18 16:44:24.383775',15),(102,'report_analysis','Analyzed Report: reports/upload_blood_report_Wcv5MBY.pdf','71','2026-03-18 16:44:24.542702',15),(103,'report_view','Viewed Analysis: reports/upload_blood_report_Wcv5MBY.pdf','71','2026-03-19 10:14:13.547435',15),(104,'report_upload','Uploaded Report: upload_blood report.pdf','72','2026-03-19 10:18:03.074419',15),(105,'report_analysis','Analyzed Report: reports/upload_blood_report_EOKMFOv.pdf','72','2026-03-19 10:18:03.687507',15);
/*!40000 ALTER TABLE `patient_recentactivity` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-24  8:43:14
