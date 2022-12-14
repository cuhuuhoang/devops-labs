-- MySQL dump 10.13  Distrib 8.0.31, for Linux (x86_64)
--
-- Host: localhost    Database: airflow
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `ab_permission`
--

DROP TABLE IF EXISTS `ab_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ab_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ab_permission_name_uq` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ab_permission`
--

LOCK TABLES `ab_permission` WRITE;
/*!40000 ALTER TABLE `ab_permission` DISABLE KEYS */;
INSERT INTO `ab_permission` VALUES (3,'can_create'),(4,'can_delete'),(1,'can_edit'),(2,'can_read'),(6,'clear'),(5,'menu_access'),(7,'set_failed'),(8,'set_retry'),(9,'set_running'),(10,'set_skipped'),(11,'set_success');
/*!40000 ALTER TABLE `ab_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ab_permission_view`
--

DROP TABLE IF EXISTS `ab_permission_view`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ab_permission_view` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permission_id` int DEFAULT NULL,
  `view_menu_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ab_permission_view_permission_id_view_menu_id_uq` (`permission_id`,`view_menu_id`),
  KEY `ab_permission_view_view_menu_id_fkey` (`view_menu_id`),
  CONSTRAINT `ab_permission_view_permission_id_fkey` FOREIGN KEY (`permission_id`) REFERENCES `ab_permission` (`id`),
  CONSTRAINT `ab_permission_view_view_menu_id_fkey` FOREIGN KEY (`view_menu_id`) REFERENCES `ab_view_menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ab_permission_view`
--

LOCK TABLES `ab_permission_view` WRITE;
/*!40000 ALTER TABLE `ab_permission_view` DISABLE KEYS */;
INSERT INTO `ab_permission_view` VALUES (1,1,4),(3,1,5),(5,1,6),(9,1,8),(15,1,11),(28,1,23),(38,1,27),(44,1,29),(61,1,33),(72,1,37),(85,1,42),(98,1,51),(99,1,52),(102,1,53),(105,1,54),(110,1,55),(111,1,56),(2,2,4),(4,2,5),(6,2,6),(8,2,8),(14,2,11),(18,2,13),(20,2,15),(22,2,17),(24,2,19),(27,2,23),(32,2,25),(34,2,26),(37,2,27),(43,2,29),(53,2,30),(55,2,31),(57,2,32),(60,2,33),(64,2,34),(66,2,35),(68,2,36),(71,2,37),(76,2,38),(91,2,40),(84,2,42),(87,2,43),(88,2,46),(89,2,47),(90,2,48),(92,2,49),(93,2,50),(94,2,51),(95,2,52),(100,2,53),(103,2,54),(106,2,55),(107,2,56),(7,3,8),(13,3,11),(26,3,23),(36,3,27),(42,3,29),(59,3,33),(70,3,37),(75,3,38),(10,4,8),(16,4,11),(29,4,23),(39,4,27),(45,4,29),(62,4,33),(73,4,37),(77,4,38),(86,4,42),(96,4,51),(97,4,52),(101,4,53),(104,4,54),(108,4,55),(109,4,56),(11,5,9),(12,5,10),(17,5,12),(19,5,14),(21,5,16),(23,5,18),(25,5,20),(30,5,23),(31,5,24),(33,5,25),(35,5,26),(40,5,27),(41,5,28),(46,5,29),(54,5,30),(56,5,31),(58,5,32),(63,5,33),(65,5,34),(67,5,35),(69,5,36),(74,5,37),(78,5,38),(79,5,40),(80,5,42),(81,5,43),(82,5,44),(83,5,45),(47,6,29),(48,7,29),(49,8,29),(50,9,29),(51,10,29),(52,11,29);
/*!40000 ALTER TABLE `ab_permission_view` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ab_permission_view_role`
--

DROP TABLE IF EXISTS `ab_permission_view_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ab_permission_view_role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permission_view_id` int DEFAULT NULL,
  `role_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ab_permission_view_role_permission_view_id_role_id_uq` (`permission_view_id`,`role_id`),
  KEY `ab_permission_view_role_role_id_fkey` (`role_id`),
  CONSTRAINT `ab_permission_view_role_permission_view_id_fkey` FOREIGN KEY (`permission_view_id`) REFERENCES `ab_permission_view` (`id`),
  CONSTRAINT `ab_permission_view_role_role_id_fkey` FOREIGN KEY (`role_id`) REFERENCES `ab_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=224 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ab_permission_view_role`
--

LOCK TABLES `ab_permission_view_role` WRITE;
/*!40000 ALTER TABLE `ab_permission_view_role` DISABLE KEYS */;
INSERT INTO `ab_permission_view_role` VALUES (1,1,1),(2,2,1),(3,3,1),(94,3,3),(125,3,4),(164,3,5),(4,4,1),(93,4,3),(124,4,4),(163,4,5),(5,5,1),(96,5,3),(127,5,4),(166,5,5),(6,6,1),(95,6,3),(126,6,4),(165,6,5),(7,7,1),(8,8,1),(9,9,1),(10,10,1),(11,11,1),(12,12,1),(13,13,1),(14,14,1),(15,15,1),(16,16,1),(17,17,1),(18,18,1),(19,19,1),(20,20,1),(21,21,1),(22,22,1),(23,23,1),(24,24,1),(25,25,1),(26,26,1),(151,26,4),(190,26,5),(27,27,1),(88,27,3),(119,27,4),(158,27,5),(28,28,1),(152,28,4),(191,28,5),(29,29,1),(153,29,4),(192,29,5),(30,30,1),(106,30,3),(137,30,4),(176,30,5),(31,31,1),(103,31,3),(134,31,4),(173,31,5),(32,32,1),(92,32,3),(123,32,4),(162,32,5),(33,33,1),(110,33,3),(141,33,4),(180,33,5),(34,34,1),(84,34,3),(115,34,4),(154,34,5),(35,35,1),(111,35,3),(142,35,4),(181,35,5),(36,36,1),(209,36,5),(37,37,1),(210,37,5),(38,38,1),(211,38,5),(39,39,1),(212,39,5),(40,40,1),(198,40,5),(41,41,1),(194,41,5),(42,42,1),(148,42,4),(187,42,5),(43,43,1),(99,43,3),(130,43,4),(169,43,5),(44,44,1),(149,44,4),(188,44,5),(45,45,1),(150,45,4),(189,45,5),(46,46,1),(114,46,3),(145,46,4),(184,46,5),(47,47,1),(48,48,1),(49,49,1),(50,50,1),(51,51,1),(52,52,1),(53,53,1),(54,54,1),(55,55,1),(56,56,1),(57,57,1),(193,57,5),(58,58,1),(195,58,5),(59,59,1),(200,59,5),(60,60,1),(201,60,5),(61,61,1),(202,61,5),(62,62,1),(203,62,5),(63,63,1),(196,63,5),(64,64,1),(98,64,3),(129,64,4),(168,64,5),(65,65,1),(113,65,3),(144,65,4),(183,65,5),(66,66,1),(97,66,3),(128,66,4),(167,66,5),(67,67,1),(112,67,3),(143,67,4),(182,67,5),(68,68,1),(208,68,5),(69,69,1),(70,70,1),(204,70,5),(71,71,1),(205,71,5),(72,72,1),(206,72,5),(73,73,1),(207,73,5),(74,74,1),(197,74,5),(75,75,1),(76,76,1),(101,76,3),(132,76,4),(171,76,5),(77,77,1),(213,77,5),(78,78,1),(199,78,5),(79,79,1),(105,79,3),(136,79,4),(175,79,5),(80,80,1),(104,80,3),(135,80,4),(174,80,5),(81,81,1),(107,81,3),(138,81,4),(177,81,5),(82,82,1),(108,82,3),(139,82,4),(178,82,5),(83,83,1),(109,83,3),(140,83,4),(179,83,5),(214,84,1),(85,84,3),(116,84,4),(155,84,5),(222,85,1),(146,85,4),(185,85,5),(223,86,1),(147,86,4),(186,86,5),(217,87,1),(89,87,3),(120,87,4),(159,87,5),(218,88,1),(90,88,3),(121,88,4),(160,88,5),(216,89,1),(87,89,3),(118,89,4),(157,89,5),(219,90,1),(91,90,3),(122,90,4),(161,90,5),(215,91,1),(86,91,3),(117,91,4),(156,91,5),(220,92,1),(100,92,3),(131,92,4),(170,92,5),(221,93,1),(102,93,3),(133,93,4),(172,93,5);
/*!40000 ALTER TABLE `ab_permission_view_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ab_register_user`
--

DROP TABLE IF EXISTS `ab_register_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ab_register_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(64) NOT NULL,
  `last_name` varchar(64) NOT NULL,
  `username` varchar(256) NOT NULL,
  `password` varchar(256) DEFAULT NULL,
  `email` varchar(256) NOT NULL,
  `registration_date` datetime DEFAULT NULL,
  `registration_hash` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ab_register_user_username_uq` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ab_register_user`
--

LOCK TABLES `ab_register_user` WRITE;
/*!40000 ALTER TABLE `ab_register_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `ab_register_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ab_role`
--

DROP TABLE IF EXISTS `ab_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ab_role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ab_role_name_uq` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ab_role`
--

LOCK TABLES `ab_role` WRITE;
/*!40000 ALTER TABLE `ab_role` DISABLE KEYS */;
INSERT INTO `ab_role` VALUES (1,'Admin'),(5,'Op'),(2,'Public'),(4,'User'),(3,'Viewer');
/*!40000 ALTER TABLE `ab_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ab_user`
--

DROP TABLE IF EXISTS `ab_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ab_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(64) NOT NULL,
  `last_name` varchar(64) NOT NULL,
  `username` varchar(256) NOT NULL,
  `password` varchar(256) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `email` varchar(256) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `login_count` int DEFAULT NULL,
  `fail_login_count` int DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `changed_on` datetime DEFAULT NULL,
  `created_by_fk` int DEFAULT NULL,
  `changed_by_fk` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ab_user_username_uq` (`username`),
  UNIQUE KEY `ab_user_email_uq` (`email`),
  KEY `ab_user_created_by_fk_fkey` (`created_by_fk`),
  KEY `ab_user_changed_by_fk_fkey` (`changed_by_fk`),
  CONSTRAINT `ab_user_changed_by_fk_fkey` FOREIGN KEY (`changed_by_fk`) REFERENCES `ab_user` (`id`),
  CONSTRAINT `ab_user_created_by_fk_fkey` FOREIGN KEY (`created_by_fk`) REFERENCES `ab_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ab_user`
--

LOCK TABLES `ab_user` WRITE;
/*!40000 ALTER TABLE `ab_user` DISABLE KEYS */;
INSERT INTO `ab_user` VALUES (1,'Airflow','Admin','airflow','pbkdf2:sha256:260000$Pl0AXW6EJkwrVjIo$2f16f8f2301448c3cb7afd144284ae9ef33e8c58b3aec8c66790aee4e1c47278',1,'airflowadmin@example.com',NULL,NULL,NULL,'2022-12-13 12:04:07','2022-12-13 12:04:07',NULL,NULL);
/*!40000 ALTER TABLE `ab_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ab_user_role`
--

DROP TABLE IF EXISTS `ab_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ab_user_role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `role_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ab_user_role_user_id_role_id_uq` (`user_id`,`role_id`),
  KEY `ab_user_role_role_id_fkey` (`role_id`),
  CONSTRAINT `ab_user_role_role_id_fkey` FOREIGN KEY (`role_id`) REFERENCES `ab_role` (`id`),
  CONSTRAINT `ab_user_role_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `ab_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ab_user_role`
--

LOCK TABLES `ab_user_role` WRITE;
/*!40000 ALTER TABLE `ab_user_role` DISABLE KEYS */;
INSERT INTO `ab_user_role` VALUES (1,1,1);
/*!40000 ALTER TABLE `ab_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ab_view_menu`
--

DROP TABLE IF EXISTS `ab_view_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ab_view_menu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ab_view_menu_name_uq` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ab_view_menu`
--

LOCK TABLES `ab_view_menu` WRITE;
/*!40000 ALTER TABLE `ab_view_menu` DISABLE KEYS */;
INSERT INTO `ab_view_menu` VALUES (16,'Actions'),(28,'Admin'),(22,'Airflow'),(26,'Audit Logs'),(7,'AuthDBView'),(21,'AutocompleteView'),(24,'Browse'),(32,'Configurations'),(33,'Connections'),(47,'DAG Code'),(40,'DAG Dependencies'),(23,'DAG Runs'),(48,'DAG Warnings'),(55,'DAG:dataset_consumer'),(51,'DAG:dataset_producer'),(54,'DAG:group_dag'),(52,'DAG:parallel_dag'),(56,'DAG:user_processing'),(53,'DAG:xcom_dag'),(39,'DagDependenciesView'),(42,'DAGs'),(43,'Datasets'),(45,'Docs'),(44,'Documentation'),(46,'ImportError'),(1,'IndexView'),(25,'Jobs'),(12,'List Roles'),(9,'List Users'),(3,'LocaleView'),(5,'My Password'),(6,'My Profile'),(4,'Passwords'),(20,'Permission Pairs'),(19,'Permission Views'),(15,'Permissions'),(35,'Plugins'),(37,'Pools'),(36,'Providers'),(41,'RedocView'),(18,'Resources'),(11,'Roles'),(10,'Security'),(34,'SLA Misses'),(29,'Task Instances'),(49,'Task Logs'),(30,'Task Reschedules'),(31,'Triggers'),(13,'User Stats Chart'),(14,'User\'s Statistics'),(8,'Users'),(2,'UtilView'),(27,'Variables'),(17,'View Menus'),(50,'Website'),(38,'XComs');
/*!40000 ALTER TABLE `ab_view_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alembic_version`
--

DROP TABLE IF EXISTS `alembic_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alembic_version` (
  `version_num` varchar(32) NOT NULL,
  PRIMARY KEY (`version_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alembic_version`
--

LOCK TABLES `alembic_version` WRITE;
/*!40000 ALTER TABLE `alembic_version` DISABLE KEYS */;
INSERT INTO `alembic_version` VALUES ('b0d31815b5a6');
/*!40000 ALTER TABLE `alembic_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `callback_request`
--

DROP TABLE IF EXISTS `callback_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `callback_request` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_at` timestamp(6) NOT NULL,
  `priority_weight` int NOT NULL,
  `callback_data` json NOT NULL,
  `callback_type` varchar(20) NOT NULL,
  `processor_subdir` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `callback_request`
--

LOCK TABLES `callback_request` WRITE;
/*!40000 ALTER TABLE `callback_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `callback_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `celery_taskmeta`
--

DROP TABLE IF EXISTS `celery_taskmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `celery_taskmeta` (
  `id` int NOT NULL AUTO_INCREMENT,
  `task_id` varchar(155) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `result` blob,
  `date_done` datetime DEFAULT NULL,
  `traceback` text,
  `name` varchar(155) DEFAULT NULL,
  `args` blob,
  `kwargs` blob,
  `worker` varchar(155) DEFAULT NULL,
  `retries` int DEFAULT NULL,
  `queue` varchar(155) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `task_id` (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `celery_taskmeta`
--

LOCK TABLES `celery_taskmeta` WRITE;
/*!40000 ALTER TABLE `celery_taskmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `celery_taskmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `celery_tasksetmeta`
--

DROP TABLE IF EXISTS `celery_tasksetmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `celery_tasksetmeta` (
  `id` int NOT NULL AUTO_INCREMENT,
  `taskset_id` varchar(155) DEFAULT NULL,
  `result` blob,
  `date_done` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `taskset_id` (`taskset_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `celery_tasksetmeta`
--

LOCK TABLES `celery_tasksetmeta` WRITE;
/*!40000 ALTER TABLE `celery_tasksetmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `celery_tasksetmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `connection`
--

DROP TABLE IF EXISTS `connection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `connection` (
  `id` int NOT NULL AUTO_INCREMENT,
  `conn_id` varchar(250) NOT NULL,
  `conn_type` varchar(500) NOT NULL,
  `description` text,
  `host` varchar(500) DEFAULT NULL,
  `schema` varchar(500) DEFAULT NULL,
  `login` varchar(500) DEFAULT NULL,
  `password` varchar(5000) DEFAULT NULL,
  `port` int DEFAULT NULL,
  `is_encrypted` tinyint(1) DEFAULT NULL,
  `is_extra_encrypted` tinyint(1) DEFAULT NULL,
  `extra` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `connection_conn_id_uq` (`conn_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `connection`
--

LOCK TABLES `connection` WRITE;
/*!40000 ALTER TABLE `connection` DISABLE KEYS */;
/*!40000 ALTER TABLE `connection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dag`
--

DROP TABLE IF EXISTS `dag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dag` (
  `dag_id` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `root_dag_id` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `is_paused` tinyint(1) DEFAULT NULL,
  `is_subdag` tinyint(1) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `last_parsed_time` timestamp(6) NULL DEFAULT NULL,
  `last_pickled` timestamp(6) NULL DEFAULT NULL,
  `last_expired` timestamp(6) NULL DEFAULT NULL,
  `scheduler_lock` tinyint(1) DEFAULT NULL,
  `pickle_id` int DEFAULT NULL,
  `fileloc` varchar(2000) DEFAULT NULL,
  `processor_subdir` varchar(2000) DEFAULT NULL,
  `owners` varchar(2000) DEFAULT NULL,
  `description` text,
  `default_view` varchar(25) DEFAULT NULL,
  `schedule_interval` text,
  `timetable_description` varchar(1000) DEFAULT NULL,
  `max_active_tasks` int NOT NULL,
  `max_active_runs` int DEFAULT NULL,
  `has_task_concurrency_limits` tinyint(1) NOT NULL,
  `has_import_errors` tinyint(1) DEFAULT '0',
  `next_dagrun` timestamp(6) NULL DEFAULT NULL,
  `next_dagrun_data_interval_start` timestamp(6) NULL DEFAULT NULL,
  `next_dagrun_data_interval_end` timestamp(6) NULL DEFAULT NULL,
  `next_dagrun_create_after` timestamp(6) NULL DEFAULT NULL,
  PRIMARY KEY (`dag_id`),
  KEY `idx_root_dag_id` (`root_dag_id`),
  KEY `idx_next_dagrun_create_after` (`next_dagrun_create_after`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dag`
--

LOCK TABLES `dag` WRITE;
/*!40000 ALTER TABLE `dag` DISABLE KEYS */;
INSERT INTO `dag` VALUES ('dataset_consumer',NULL,1,0,1,'2022-12-13 12:07:38.489277',NULL,NULL,NULL,NULL,'/opt/airflow/dags/dataset_consumer.py','/opt/airflow/dags','airflow',NULL,'grid','\"Dataset\"','Triggered by datasets',16,16,0,0,NULL,NULL,NULL,NULL),('dataset_producer',NULL,1,0,1,'2022-12-13 12:07:42.108576',NULL,NULL,NULL,NULL,'/opt/airflow/dags/dataset_producer.py','/opt/airflow/dags','airflow',NULL,'grid','\"@daily\"','At 00:00',16,16,0,0,'2022-12-12 00:00:00.000000','2022-12-12 00:00:00.000000','2022-12-13 00:00:00.000000','2022-12-13 00:00:00.000000'),('group_dag',NULL,1,0,1,'2022-12-13 12:07:13.322461',NULL,NULL,NULL,NULL,'/opt/airflow/dags/group_dag.py','/opt/airflow/dags','airflow',NULL,'grid','\"@daily\"','At 00:00',16,16,0,0,'2022-12-12 00:00:00.000000','2022-12-12 00:00:00.000000','2022-12-13 00:00:00.000000','2022-12-13 00:00:00.000000'),('parallel_dag',NULL,1,0,1,'2022-12-13 12:07:40.826419',NULL,NULL,NULL,NULL,'/opt/airflow/dags/parallel_dag.py','/opt/airflow/dags','airflow',NULL,'grid','\"@daily\"','At 00:00',16,16,0,0,'2022-12-12 00:00:00.000000','2022-12-12 00:00:00.000000','2022-12-13 00:00:00.000000','2022-12-13 00:00:00.000000'),('user_processing',NULL,1,0,1,'2022-12-13 12:07:14.213793',NULL,NULL,NULL,NULL,'/opt/airflow/dags/user_processing.py','/opt/airflow/dags','airflow',NULL,'grid','\"@daily\"','At 00:00',16,16,0,0,'2022-12-12 00:00:00.000000','2022-12-12 00:00:00.000000','2022-12-13 00:00:00.000000','2022-12-13 00:00:00.000000'),('xcom_dag',NULL,1,0,1,'2022-12-13 12:07:42.956092',NULL,NULL,NULL,NULL,'/opt/airflow/dags/xcom_dag.py','/opt/airflow/dags','airflow',NULL,'grid','\"@daily\"','At 00:00',16,16,0,0,'2022-12-12 00:00:00.000000','2022-12-12 00:00:00.000000','2022-12-13 00:00:00.000000','2022-12-13 00:00:00.000000');
/*!40000 ALTER TABLE `dag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dag_code`
--

DROP TABLE IF EXISTS `dag_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dag_code` (
  `fileloc_hash` bigint NOT NULL,
  `fileloc` varchar(2000) NOT NULL,
  `last_updated` timestamp(6) NOT NULL,
  `source_code` mediumtext NOT NULL,
  PRIMARY KEY (`fileloc_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dag_code`
--

LOCK TABLES `dag_code` WRITE;
/*!40000 ALTER TABLE `dag_code` DISABLE KEYS */;
INSERT INTO `dag_code` VALUES (8600024995146893,'/opt/airflow/dags/group_dag.py','2022-12-13 12:05:59.839003','from airflow import DAG\nfrom airflow.operators.bash import BashOperator\nfrom groups.group_transforms import transform_tasks\nfrom groups.group_downloads import download_tasks\n\nfrom datetime import datetime\n\nwith DAG(\'group_dag\', start_date=datetime(2022, 1, 1),\n         schedule_interval=\'@daily\', catchup=False) as dag:\n\n    downloads = download_tasks()\n\n    check_files = BashOperator(\n        task_id=\'check_files\',\n        bash_command=\'sleep 1\'\n    )\n\n    transforms = transform_tasks()\n\n    downloads >> check_files >> transforms\n'),(17727342586276218,'/opt/airflow/dags/dataset_producer.py','2022-12-13 12:05:48.680250','from airflow import DAG, Dataset\nfrom airflow.decorators import task\n\nfrom datetime import datetime\n\nmy_file = Dataset(\'/tmp/my_file\')\nmy_file_2 = Dataset(\'/tmp/my_file_2\')\n\nwith DAG(\n    dag_id=\'dataset_producer\',\n    schedule=\'@daily\',\n    start_date=datetime(2022, 1, 1),\n    catchup=False\n):\n    @task(outlets=[my_file])\n    def update_dataset():\n        with open(my_file.uri, \"a+\") as f:\n            f.write(\"producer update 1\")\n\n    @task(outlets=[my_file_2])\n    def update_dataset_2():\n        with open(my_file_2.uri, \"a+\") as f:\n            f.write(\"producer update 2\")\n\n    update_dataset()\n    update_dataset_2()\n'),(28812735238900524,'/opt/airflow/dags/dataset_consumer.py','2022-12-13 12:06:35.345728','from airflow import DAG, Dataset\nfrom airflow.decorators import task\n\nfrom datetime import datetime\n\nmy_file = Dataset(\'/tmp/my_file\')\nmy_file_2 = Dataset(\'/tmp/my_file_2\')\n\nwith DAG(\n    dag_id=\'dataset_consumer\',\n    schedule=[my_file, my_file_2],\n    start_date=datetime(2022, 1, 1),\n    catchup=False\n):\n\n    @task\n    def read_dataset():\n        with open(my_file.uri, \"r\") as f:\n            print(f.read())\n        with open(my_file_2.uri, \"r\") as f:\n            print(f.read())\n\n    read_dataset()\n'),(29819705783870123,'/opt/airflow/dags/user_processing.py','2022-12-13 12:06:35.606268','from airflow import DAG\nfrom airflow.providers.mysql.operators.mysql import MySqlOperator\nfrom airflow.providers.http.sensors.http import HttpSensor\nfrom airflow.providers.http.operators.http import SimpleHttpOperator\nfrom airflow.operators.python import PythonOperator\nfrom airflow.providers.mysql.hooks.mysql import MySqlHook\n\nimport json\nfrom pandas import json_normalize\nfrom datetime import datetime\n\n\ndef _process_user(ti):\n    user = ti.xcom_pull(task_ids=\'extract_user\')\n    user = user[\'results\'][0]\n    processed_user = json_normalize({\n        \'firstname\': user[\'name\'][\'first\'],\n        \'lastname\': user[\'name\'][\'last\'],\n        \'country\': user[\'location\'][\'country\'],\n        \'username\': user[\'login\'][\'username\'],\n        \'password\': user[\'login\'][\'password\'],\n        \'email\': user[\'email\']\n    })\n    processed_user.to_csv(\'/tmp/processed_user.csv\', index=None, header=False, sep=\'\\t\')\n\n\ndef _store_user(ti):\n    hook = MySqlHook(mysql_conn_id=\'mysql\')\n    hook.bulk_load(\n        table=\'users\',\n        tmp_file=\'/tmp/processed_user.csv\'\n    )\n\n\nwith DAG(\'user_processing\', start_date=datetime(2022, 1, 1),\n         schedule_interval=\'@daily\', catchup=False) as dag:\n\n    create_table = MySqlOperator(\n        task_id=\'create_table\',\n        mysql_conn_id=\'mysql\',\n        sql=\'\'\'\n            CREATE TABLE IF NOT EXISTS users (\n                firstname TEXT NOT NULL,\n                lastname TEXT NOT NULL,\n                country TEXT NOT NULL,\n                username TEXT NOT NULL,\n                password TEXT NOT NULL,\n                email TEXT NOT NULL\n            );\n        \'\'\'\n    )\n\n    set_local_infile = MySqlOperator(\n        task_id=\'set_local_infile\',\n        mysql_conn_id=\'mysql_admin\',\n        sql=\'\'\'\n                SET GLOBAL local_infile=1;\n            \'\'\'\n    )\n\n    is_api_available = HttpSensor(\n        task_id=\'is_api_available\',\n        http_conn_id=\'user_api\',\n        endpoint=\'api/\'\n    )\n\n    extract_user = SimpleHttpOperator(\n        task_id=\'extract_user\',\n        http_conn_id=\'user_api\',\n        endpoint=\'api/\',\n        method=\'GET\',\n        response_filter=lambda response: json.loads(response.text),\n        log_response=True\n    )\n\n    process_user = PythonOperator(\n        task_id=\'process_user\',\n        python_callable=_process_user\n    )\n\n    store_user = PythonOperator(\n        task_id=\'store_user\',\n        python_callable=_store_user\n    )\n\ncreate_table >> extract_user >> process_user >> store_user\nis_api_available >> extract_user\nset_local_infile >> extract_user\n'),(66300423262467701,'/opt/airflow/dags/parallel_dag.py','2022-12-13 12:05:48.889338','from airflow import DAG\nfrom airflow.operators.bash import BashOperator\n\nfrom datetime import datetime\n\nwith DAG(\'parallel_dag\', start_date=datetime(2022, 1, 1),\n         schedule_interval=\'@daily\', catchup=False) as dag:\n    extract_a = BashOperator(\n        task_id=\'extract_a\',\n        bash_command=\'sleep 1\'\n    )\n\n    extract_b = BashOperator(\n        task_id=\'extract_b\',\n        bash_command=\'sleep 1\'\n    )\n\n    load_a = BashOperator(\n        task_id=\'load_a\',\n        bash_command=\'sleep 1\'\n    )\n\n    load_b = BashOperator(\n        task_id=\'load_b\',\n        bash_command=\'sleep 1\'\n    )\n\n    transform = BashOperator(\n        task_id=\'transform\',\n        queue=\'high_cpu\',\n        bash_command=\'sleep 1\'\n    )\n\n    extract_a >> load_a\n    extract_b >> load_b\n    [load_a, load_b] >> transform\n'),(70752591694202599,'/opt/airflow/dags/xcom_dag.py','2022-12-13 12:05:53.617911','from airflow import DAG\nfrom airflow.operators.python import PythonOperator, BranchPythonOperator\nfrom airflow.operators.bash import BashOperator\n\nfrom datetime import datetime\n\n\ndef _t1(ti):\n    ti.xcom_push(key=\'my_key\', value=41)\n\n\ndef _t2(ti):\n    print(ti.xcom_pull(key=\'my_key\', task_ids=\'t1\'))\n\n\ndef _branch(ti):\n    value = ti.xcom_pull(key=\'my_key\', task_ids=\'t1\')\n    if value > 41:\n        return \'t2\'\n    return \'t3\'\n\n\nwith DAG(\"xcom_dag\", start_date=datetime(2022, 1, 1),\n         schedule_interval=\'@daily\', catchup=False) as dag:\n    t1 = PythonOperator(\n        task_id=\'t1\',\n        python_callable=_t1\n    )\n\n    switcher = BranchPythonOperator(\n        task_id=\'switcher\',\n        python_callable=_branch\n    )\n\n    t2 = PythonOperator(\n        task_id=\'t2\',\n        python_callable=_t2\n    )\n\n    t3 = BashOperator(\n        task_id=\'t3\',\n        bash_command=\"echo \'\'\"\n    )\n\n    t4 = BashOperator(\n        task_id=\'t4\',\n        bash_command=\"echo \'\'\",\n        trigger_rule=\'none_failed_min_one_success\'\n    )\n\n    t1 >> switcher >> [t2, t3] >> t4\n');
/*!40000 ALTER TABLE `dag_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dag_owner_attributes`
--

DROP TABLE IF EXISTS `dag_owner_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dag_owner_attributes` (
  `dag_id` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `owner` varchar(500) NOT NULL,
  `link` varchar(500) NOT NULL,
  PRIMARY KEY (`dag_id`,`owner`),
  CONSTRAINT `dag.dag_id` FOREIGN KEY (`dag_id`) REFERENCES `dag` (`dag_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dag_owner_attributes`
--

LOCK TABLES `dag_owner_attributes` WRITE;
/*!40000 ALTER TABLE `dag_owner_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `dag_owner_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dag_pickle`
--

DROP TABLE IF EXISTS `dag_pickle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dag_pickle` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pickle` blob,
  `created_dttm` timestamp(6) NULL DEFAULT NULL,
  `pickle_hash` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dag_pickle`
--

LOCK TABLES `dag_pickle` WRITE;
/*!40000 ALTER TABLE `dag_pickle` DISABLE KEYS */;
/*!40000 ALTER TABLE `dag_pickle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dag_run`
--

DROP TABLE IF EXISTS `dag_run`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dag_run` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dag_id` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `queued_at` timestamp(6) NULL DEFAULT NULL,
  `execution_date` timestamp(6) NOT NULL,
  `start_date` timestamp(6) NULL DEFAULT NULL,
  `end_date` timestamp(6) NULL DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `run_id` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `creating_job_id` int DEFAULT NULL,
  `external_trigger` tinyint(1) DEFAULT NULL,
  `run_type` varchar(50) NOT NULL,
  `conf` blob,
  `data_interval_start` timestamp(6) NULL DEFAULT NULL,
  `data_interval_end` timestamp(6) NULL DEFAULT NULL,
  `last_scheduling_decision` timestamp(6) NULL DEFAULT NULL,
  `dag_hash` varchar(32) DEFAULT NULL,
  `log_template_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dag_run_dag_id_execution_date_key` (`dag_id`,`execution_date`),
  UNIQUE KEY `dag_run_dag_id_run_id_key` (`dag_id`,`run_id`),
  KEY `task_instance_log_template_id_fkey` (`log_template_id`),
  KEY `idx_dag_run_running_dags` (`state`,`dag_id`),
  KEY `idx_last_scheduling_decision` (`last_scheduling_decision`),
  KEY `idx_dag_run_dag_id` (`dag_id`),
  KEY `dag_id_state` (`dag_id`,`state`),
  KEY `idx_dag_run_queued_dags` (`state`,`dag_id`),
  CONSTRAINT `task_instance_log_template_id_fkey` FOREIGN KEY (`log_template_id`) REFERENCES `log_template` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dag_run`
--

LOCK TABLES `dag_run` WRITE;
/*!40000 ALTER TABLE `dag_run` DISABLE KEYS */;
/*!40000 ALTER TABLE `dag_run` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dag_schedule_dataset_reference`
--

DROP TABLE IF EXISTS `dag_schedule_dataset_reference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dag_schedule_dataset_reference` (
  `dataset_id` int NOT NULL,
  `dag_id` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `created_at` timestamp(6) NOT NULL,
  `updated_at` timestamp(6) NOT NULL,
  PRIMARY KEY (`dataset_id`,`dag_id`),
  KEY `dsdr_dag_id_fkey` (`dag_id`),
  CONSTRAINT `dsdr_dag_id_fkey` FOREIGN KEY (`dag_id`) REFERENCES `dag` (`dag_id`) ON DELETE CASCADE,
  CONSTRAINT `dsdr_dataset_fkey` FOREIGN KEY (`dataset_id`) REFERENCES `dataset` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dag_schedule_dataset_reference`
--

LOCK TABLES `dag_schedule_dataset_reference` WRITE;
/*!40000 ALTER TABLE `dag_schedule_dataset_reference` DISABLE KEYS */;
INSERT INTO `dag_schedule_dataset_reference` VALUES (1,'dataset_consumer','2022-12-13 12:06:35.659762','2022-12-13 12:06:35.659805'),(2,'dataset_consumer','2022-12-13 12:06:35.659826','2022-12-13 12:06:35.659845');
/*!40000 ALTER TABLE `dag_schedule_dataset_reference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dag_tag`
--

DROP TABLE IF EXISTS `dag_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dag_tag` (
  `name` varchar(100) NOT NULL,
  `dag_id` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`name`,`dag_id`),
  KEY `dag_tag_dag_id_fkey` (`dag_id`),
  CONSTRAINT `dag_tag_dag_id_fkey` FOREIGN KEY (`dag_id`) REFERENCES `dag` (`dag_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dag_tag`
--

LOCK TABLES `dag_tag` WRITE;
/*!40000 ALTER TABLE `dag_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `dag_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dag_warning`
--

DROP TABLE IF EXISTS `dag_warning`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dag_warning` (
  `dag_id` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `warning_type` varchar(50) NOT NULL,
  `message` text NOT NULL,
  `timestamp` timestamp(6) NOT NULL,
  PRIMARY KEY (`dag_id`,`warning_type`),
  CONSTRAINT `dcw_dag_id_fkey` FOREIGN KEY (`dag_id`) REFERENCES `dag` (`dag_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dag_warning`
--

LOCK TABLES `dag_warning` WRITE;
/*!40000 ALTER TABLE `dag_warning` DISABLE KEYS */;
/*!40000 ALTER TABLE `dag_warning` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dagrun_dataset_event`
--

DROP TABLE IF EXISTS `dagrun_dataset_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dagrun_dataset_event` (
  `dag_run_id` int NOT NULL,
  `event_id` int NOT NULL,
  PRIMARY KEY (`dag_run_id`,`event_id`),
  KEY `idx_dagrun_dataset_events_dag_run_id` (`dag_run_id`),
  KEY `idx_dagrun_dataset_events_event_id` (`event_id`),
  CONSTRAINT `dagrun_dataset_event_dag_run_id_fkey` FOREIGN KEY (`dag_run_id`) REFERENCES `dag_run` (`id`) ON DELETE CASCADE,
  CONSTRAINT `dagrun_dataset_event_event_id_fkey` FOREIGN KEY (`event_id`) REFERENCES `dataset_event` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dagrun_dataset_event`
--

LOCK TABLES `dagrun_dataset_event` WRITE;
/*!40000 ALTER TABLE `dagrun_dataset_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `dagrun_dataset_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dataset`
--

DROP TABLE IF EXISTS `dataset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dataset` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uri` varchar(3000) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `extra` json NOT NULL,
  `created_at` timestamp(6) NOT NULL,
  `updated_at` timestamp(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_uri_unique` (`uri`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dataset`
--

LOCK TABLES `dataset` WRITE;
/*!40000 ALTER TABLE `dataset` DISABLE KEYS */;
INSERT INTO `dataset` VALUES (1,'/tmp/my_file','{}','2022-12-13 12:05:48.759026','2022-12-13 12:05:48.759064'),(2,'/tmp/my_file_2','{}','2022-12-13 12:05:48.765014','2022-12-13 12:05:48.765050');
/*!40000 ALTER TABLE `dataset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dataset_dag_run_queue`
--

DROP TABLE IF EXISTS `dataset_dag_run_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dataset_dag_run_queue` (
  `dataset_id` int NOT NULL,
  `target_dag_id` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `created_at` timestamp(6) NOT NULL,
  PRIMARY KEY (`dataset_id`,`target_dag_id`),
  KEY `ddrq_dag_fkey` (`target_dag_id`),
  CONSTRAINT `ddrq_dag_fkey` FOREIGN KEY (`target_dag_id`) REFERENCES `dag` (`dag_id`) ON DELETE CASCADE,
  CONSTRAINT `ddrq_dataset_fkey` FOREIGN KEY (`dataset_id`) REFERENCES `dataset` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dataset_dag_run_queue`
--

LOCK TABLES `dataset_dag_run_queue` WRITE;
/*!40000 ALTER TABLE `dataset_dag_run_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `dataset_dag_run_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dataset_event`
--

DROP TABLE IF EXISTS `dataset_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dataset_event` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dataset_id` int NOT NULL,
  `extra` json NOT NULL,
  `source_task_id` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `source_dag_id` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `source_run_id` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `source_map_index` int DEFAULT '-1',
  `timestamp` timestamp(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_dataset_id_timestamp` (`dataset_id`,`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dataset_event`
--

LOCK TABLES `dataset_event` WRITE;
/*!40000 ALTER TABLE `dataset_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `dataset_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `import_error`
--

DROP TABLE IF EXISTS `import_error`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `import_error` (
  `id` int NOT NULL AUTO_INCREMENT,
  `timestamp` timestamp(6) NULL DEFAULT NULL,
  `filename` varchar(1024) DEFAULT NULL,
  `stacktrace` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `import_error`
--

LOCK TABLES `import_error` WRITE;
/*!40000 ALTER TABLE `import_error` DISABLE KEYS */;
/*!40000 ALTER TABLE `import_error` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dag_id` varchar(250) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  `job_type` varchar(30) DEFAULT NULL,
  `start_date` timestamp(6) NULL DEFAULT NULL,
  `end_date` timestamp(6) NULL DEFAULT NULL,
  `latest_heartbeat` timestamp(6) NULL DEFAULT NULL,
  `executor_class` varchar(500) DEFAULT NULL,
  `hostname` varchar(500) DEFAULT NULL,
  `unixname` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_job_dag_id` (`dag_id`),
  KEY `idx_job_state_heartbeat` (`state`,`latest_heartbeat`),
  KEY `job_type_heart` (`job_type`,`latest_heartbeat`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
INSERT INTO `job` VALUES (1,NULL,'running','TriggererJob','2022-12-13 12:05:29.866770',NULL,'2022-12-13 12:07:34.473148','CeleryExecutor','5b18c729e6be','airflow'),(2,NULL,'running','SchedulerJob','2022-12-13 12:05:41.370220',NULL,'2022-12-13 12:07:33.652639','CeleryExecutor','b0da5319d50e','airflow');
/*!40000 ALTER TABLE `job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dttm` timestamp(6) NULL DEFAULT NULL,
  `dag_id` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `task_id` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `map_index` int DEFAULT NULL,
  `event` varchar(30) DEFAULT NULL,
  `execution_date` timestamp(6) NULL DEFAULT NULL,
  `owner` varchar(500) DEFAULT NULL,
  `extra` text,
  PRIMARY KEY (`id`),
  KEY `idx_log_dag` (`dag_id`),
  KEY `idx_log_event` (`event`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
INSERT INTO `log` VALUES (1,'2022-12-13 12:02:21.446029',NULL,NULL,NULL,'cli_users_create',NULL,'root','{\"host_name\": \"f1a7bfb59447\", \"full_command\": \"[\'/home/airflow/.local/bin/airflow\', \'users\', \'create\', \'--username\', \'airflow\', \'--firstname\', \'Airflow\', \'--lastname\', \'Admin\', \'--email\', \'airflowadmin@example.com\', \'--role\', \'Admin\', \'--password\', \'********\']\"}'),(2,'2022-12-13 12:04:29.848941',NULL,NULL,NULL,'cli_check',NULL,'airflow','{\"host_name\": \"1a06a5cc12eb\", \"full_command\": \"[\'/home/airflow/.local/bin/airflow\', \'db\', \'check\']\"}'),(3,'2022-12-13 12:04:31.673910',NULL,NULL,NULL,'cli_check',NULL,'airflow','{\"host_name\": \"b0da5319d50e\", \"full_command\": \"[\'/home/airflow/.local/bin/airflow\', \'db\', \'check\']\"}'),(4,'2022-12-13 12:04:32.452831',NULL,NULL,NULL,'cli_check',NULL,'airflow','{\"host_name\": \"930b2151faec\", \"full_command\": \"[\'/home/airflow/.local/bin/airflow\', \'db\', \'check\']\"}'),(5,'2022-12-13 12:04:33.157699',NULL,NULL,NULL,'cli_check',NULL,'airflow','{\"host_name\": \"5b18c729e6be\", \"full_command\": \"[\'/home/airflow/.local/bin/airflow\', \'db\', \'check\']\"}'),(6,'2022-12-13 12:04:33.286646',NULL,NULL,NULL,'cli_check',NULL,'airflow','{\"host_name\": \"74bd8b0d349a\", \"full_command\": \"[\'/home/airflow/.local/bin/airflow\', \'db\', \'check\']\"}'),(7,'2022-12-13 12:04:34.660344',NULL,NULL,NULL,'cli_webserver',NULL,'airflow','{\"host_name\": \"1a06a5cc12eb\", \"full_command\": \"[\'/home/airflow/.local/bin/airflow\', \'webserver\']\"}'),(8,'2022-12-13 12:04:47.257961',NULL,NULL,NULL,'cli_triggerer',NULL,'airflow','{\"host_name\": \"5b18c729e6be\", \"full_command\": \"[\'/home/airflow/.local/bin/airflow\', \'triggerer\']\"}'),(9,'2022-12-13 12:05:00.189213',NULL,NULL,NULL,'cli_flower',NULL,'airflow','{\"host_name\": \"74bd8b0d349a\", \"full_command\": \"[\'/home/airflow/.local/bin/airflow\', \'celery\', \'flower\']\"}'),(10,'2022-12-13 12:05:08.126931',NULL,NULL,NULL,'cli_scheduler',NULL,'airflow','{\"host_name\": \"b0da5319d50e\", \"full_command\": \"[\'/home/airflow/.local/bin/airflow\', \'scheduler\']\"}'),(11,'2022-12-13 12:05:22.012608',NULL,NULL,NULL,'cli_worker',NULL,'airflow','{\"host_name\": \"930b2151faec\", \"full_command\": \"[\'/home/airflow/.local/bin/airflow\', \'celery\', \'worker\']\"}');
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_template`
--

DROP TABLE IF EXISTS `log_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_template` (
  `id` int NOT NULL AUTO_INCREMENT,
  `filename` text NOT NULL,
  `elasticsearch_id` text NOT NULL,
  `created_at` timestamp(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_template`
--

LOCK TABLES `log_template` WRITE;
/*!40000 ALTER TABLE `log_template` DISABLE KEYS */;
INSERT INTO `log_template` VALUES (1,'{{ ti.dag_id }}/{{ ti.task_id }}/{{ ts }}/{{ try_number }}.log','{dag_id}-{task_id}-{execution_date}-{try_number}','2022-12-13 12:02:17.035868'),(2,'dag_id={{ ti.dag_id }}/run_id={{ ti.run_id }}/task_id={{ ti.task_id }}/{% if ti.map_index >= 0 %}map_index={{ ti.map_index }}/{% endif %}attempt={{ try_number }}.log','{dag_id}-{task_id}-{run_id}-{map_index}-{try_number}','2022-12-13 12:02:17.045267');
/*!40000 ALTER TABLE `log_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rendered_task_instance_fields`
--

DROP TABLE IF EXISTS `rendered_task_instance_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rendered_task_instance_fields` (
  `dag_id` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `task_id` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `run_id` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `map_index` int NOT NULL DEFAULT '-1',
  `rendered_fields` json NOT NULL,
  `k8s_pod_yaml` json DEFAULT NULL,
  PRIMARY KEY (`dag_id`,`task_id`,`run_id`,`map_index`),
  CONSTRAINT `rtif_ti_fkey` FOREIGN KEY (`dag_id`, `task_id`, `run_id`, `map_index`) REFERENCES `task_instance` (`dag_id`, `task_id`, `run_id`, `map_index`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rendered_task_instance_fields`
--

LOCK TABLES `rendered_task_instance_fields` WRITE;
/*!40000 ALTER TABLE `rendered_task_instance_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `rendered_task_instance_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `serialized_dag`
--

DROP TABLE IF EXISTS `serialized_dag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `serialized_dag` (
  `dag_id` varchar(250) NOT NULL,
  `fileloc` varchar(2000) NOT NULL,
  `fileloc_hash` bigint NOT NULL,
  `data` json DEFAULT NULL,
  `data_compressed` blob,
  `last_updated` timestamp(6) NOT NULL,
  `dag_hash` varchar(32) NOT NULL,
  `processor_subdir` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`dag_id`),
  KEY `idx_fileloc_hash` (`fileloc_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serialized_dag`
--

LOCK TABLES `serialized_dag` WRITE;
/*!40000 ALTER TABLE `serialized_dag` DISABLE KEYS */;
INSERT INTO `serialized_dag` VALUES ('dataset_consumer','/opt/airflow/dags/dataset_consumer.py',28812735238900524,'{\"dag\": {\"tasks\": [{\"pool\": \"default_pool\", \"op_args\": [], \"task_id\": \"read_dataset\", \"ui_color\": \"#ffefeb\", \"_is_empty\": false, \"op_kwargs\": {}, \"_task_type\": \"_PythonDecoratedOperator\", \"ui_fgcolor\": \"#000\", \"_task_module\": \"airflow.decorators.python\", \"template_ext\": [], \"_operator_name\": \"@task\", \"template_fields\": [\"templates_dict\", \"op_args\", \"op_kwargs\"], \"downstream_task_ids\": [], \"template_fields_renderers\": {\"op_args\": \"py\", \"op_kwargs\": \"py\", \"templates_dict\": \"json\"}}], \"params\": {}, \"_dag_id\": \"dataset_consumer\", \"catchup\": false, \"fileloc\": \"/opt/airflow/dags/dataset_consumer.py\", \"timezone\": \"UTC\", \"edge_info\": {}, \"timetable\": {\"__var\": {}, \"__type\": \"airflow.timetables.simple.DatasetTriggeredTimetable\"}, \"start_date\": 1640995200.0, \"_task_group\": {\"tooltip\": \"\", \"children\": {\"read_dataset\": [\"operator\", \"read_dataset\"]}, \"ui_color\": \"CornflowerBlue\", \"_group_id\": null, \"ui_fgcolor\": \"#000\", \"prefix_group_id\": true, \"upstream_task_ids\": [], \"upstream_group_ids\": [], \"downstream_task_ids\": [], \"downstream_group_ids\": []}, \"dag_dependencies\": [{\"source\": \"dataset\", \"target\": \"dataset_consumer\", \"dependency_id\": \"/tmp/my_file\", \"dependency_type\": \"dataset\"}, {\"source\": \"dataset\", \"target\": \"dataset_consumer\", \"dependency_id\": \"/tmp/my_file_2\", \"dependency_type\": \"dataset\"}], \"dataset_triggers\": [{\"__var\": {\"uri\": \"/tmp/my_file\", \"extra\": null}, \"__type\": \"dataset\"}, {\"__var\": {\"uri\": \"/tmp/my_file_2\", \"extra\": null}, \"__type\": \"dataset\"}], \"_processor_dags_folder\": \"/opt/airflow/dags\"}, \"__version\": 1}',NULL,'2022-12-13 12:06:01.485461','d1bcc01307aec37f186b7a9b50c5baf6',NULL),('dataset_producer','/opt/airflow/dags/dataset_producer.py',17727342586276218,'{\"dag\": {\"tasks\": [{\"pool\": \"default_pool\", \"op_args\": [], \"outlets\": [{\"__var\": {\"uri\": \"/tmp/my_file\", \"extra\": null}, \"__type\": \"dataset\"}], \"task_id\": \"update_dataset\", \"ui_color\": \"#ffefeb\", \"_is_empty\": false, \"op_kwargs\": {}, \"_task_type\": \"_PythonDecoratedOperator\", \"ui_fgcolor\": \"#000\", \"_task_module\": \"airflow.decorators.python\", \"template_ext\": [], \"_operator_name\": \"@task\", \"template_fields\": [\"templates_dict\", \"op_args\", \"op_kwargs\"], \"downstream_task_ids\": [], \"template_fields_renderers\": {\"op_args\": \"py\", \"op_kwargs\": \"py\", \"templates_dict\": \"json\"}}, {\"pool\": \"default_pool\", \"op_args\": [], \"outlets\": [{\"__var\": {\"uri\": \"/tmp/my_file_2\", \"extra\": null}, \"__type\": \"dataset\"}], \"task_id\": \"update_dataset_2\", \"ui_color\": \"#ffefeb\", \"_is_empty\": false, \"op_kwargs\": {}, \"_task_type\": \"_PythonDecoratedOperator\", \"ui_fgcolor\": \"#000\", \"_task_module\": \"airflow.decorators.python\", \"template_ext\": [], \"_operator_name\": \"@task\", \"template_fields\": [\"templates_dict\", \"op_args\", \"op_kwargs\"], \"downstream_task_ids\": [], \"template_fields_renderers\": {\"op_args\": \"py\", \"op_kwargs\": \"py\", \"templates_dict\": \"json\"}}], \"params\": {}, \"_dag_id\": \"dataset_producer\", \"catchup\": false, \"fileloc\": \"/opt/airflow/dags/dataset_producer.py\", \"timezone\": \"UTC\", \"edge_info\": {}, \"start_date\": 1640995200.0, \"_task_group\": {\"tooltip\": \"\", \"children\": {\"update_dataset\": [\"operator\", \"update_dataset\"], \"update_dataset_2\": [\"operator\", \"update_dataset_2\"]}, \"ui_color\": \"CornflowerBlue\", \"_group_id\": null, \"ui_fgcolor\": \"#000\", \"prefix_group_id\": true, \"upstream_task_ids\": [], \"upstream_group_ids\": [], \"downstream_task_ids\": [], \"downstream_group_ids\": []}, \"dag_dependencies\": [{\"source\": \"dataset_producer\", \"target\": \"dataset\", \"dependency_id\": \"/tmp/my_file_2\", \"dependency_type\": \"dataset\"}, {\"source\": \"dataset_producer\", \"target\": \"dataset\", \"dependency_id\": \"/tmp/my_file\", \"dependency_type\": \"dataset\"}], \"dataset_triggers\": [], \"schedule_interval\": \"@daily\", \"_processor_dags_folder\": \"/opt/airflow/dags\"}, \"__version\": 1}',NULL,'2022-12-13 12:05:45.072086','1c659e701aa77c6c381e630d354f95cd',NULL),('group_dag','/opt/airflow/dags/group_dag.py',8600024995146893,'{\"dag\": {\"tasks\": [{\"pool\": \"default_pool\", \"task_id\": \"downloads.download_a\", \"ui_color\": \"#f0ede4\", \"_is_empty\": false, \"_task_type\": \"BashOperator\", \"ui_fgcolor\": \"#000\", \"_task_module\": \"airflow.operators.bash\", \"bash_command\": \"sleep 1\", \"template_ext\": [\".sh\", \".bash\"], \"template_fields\": [\"bash_command\", \"env\"], \"downstream_task_ids\": [\"check_files\"], \"template_fields_renderers\": {\"env\": \"json\", \"bash_command\": \"bash\"}}, {\"pool\": \"default_pool\", \"task_id\": \"downloads.download_b\", \"ui_color\": \"#f0ede4\", \"_is_empty\": false, \"_task_type\": \"BashOperator\", \"ui_fgcolor\": \"#000\", \"_task_module\": \"airflow.operators.bash\", \"bash_command\": \"sleep 1\", \"template_ext\": [\".sh\", \".bash\"], \"template_fields\": [\"bash_command\", \"env\"], \"downstream_task_ids\": [\"check_files\"], \"template_fields_renderers\": {\"env\": \"json\", \"bash_command\": \"bash\"}}, {\"pool\": \"default_pool\", \"task_id\": \"downloads.download_c\", \"ui_color\": \"#f0ede4\", \"_is_empty\": false, \"_task_type\": \"BashOperator\", \"ui_fgcolor\": \"#000\", \"_task_module\": \"airflow.operators.bash\", \"bash_command\": \"sleep 1\", \"template_ext\": [\".sh\", \".bash\"], \"template_fields\": [\"bash_command\", \"env\"], \"downstream_task_ids\": [\"check_files\"], \"template_fields_renderers\": {\"env\": \"json\", \"bash_command\": \"bash\"}}, {\"pool\": \"default_pool\", \"task_id\": \"check_files\", \"ui_color\": \"#f0ede4\", \"_is_empty\": false, \"_task_type\": \"BashOperator\", \"ui_fgcolor\": \"#000\", \"_task_module\": \"airflow.operators.bash\", \"bash_command\": \"sleep 1\", \"template_ext\": [\".sh\", \".bash\"], \"template_fields\": [\"bash_command\", \"env\"], \"downstream_task_ids\": [\"transforms.transform_a\", \"transforms.transform_b\", \"transforms.transform_c\"], \"template_fields_renderers\": {\"env\": \"json\", \"bash_command\": \"bash\"}}, {\"pool\": \"default_pool\", \"task_id\": \"transforms.transform_a\", \"ui_color\": \"#f0ede4\", \"_is_empty\": false, \"_task_type\": \"BashOperator\", \"ui_fgcolor\": \"#000\", \"_task_module\": \"airflow.operators.bash\", \"bash_command\": \"sleep 1\", \"template_ext\": [\".sh\", \".bash\"], \"template_fields\": [\"bash_command\", \"env\"], \"downstream_task_ids\": [], \"template_fields_renderers\": {\"env\": \"json\", \"bash_command\": \"bash\"}}, {\"pool\": \"default_pool\", \"task_id\": \"transforms.transform_b\", \"ui_color\": \"#f0ede4\", \"_is_empty\": false, \"_task_type\": \"BashOperator\", \"ui_fgcolor\": \"#000\", \"_task_module\": \"airflow.operators.bash\", \"bash_command\": \"sleep 1\", \"template_ext\": [\".sh\", \".bash\"], \"template_fields\": [\"bash_command\", \"env\"], \"downstream_task_ids\": [], \"template_fields_renderers\": {\"env\": \"json\", \"bash_command\": \"bash\"}}, {\"pool\": \"default_pool\", \"task_id\": \"transforms.transform_c\", \"ui_color\": \"#f0ede4\", \"_is_empty\": false, \"_task_type\": \"BashOperator\", \"ui_fgcolor\": \"#000\", \"_task_module\": \"airflow.operators.bash\", \"bash_command\": \"sleep 1\", \"template_ext\": [\".sh\", \".bash\"], \"template_fields\": [\"bash_command\", \"env\"], \"downstream_task_ids\": [], \"template_fields_renderers\": {\"env\": \"json\", \"bash_command\": \"bash\"}}], \"params\": {}, \"_dag_id\": \"group_dag\", \"catchup\": false, \"fileloc\": \"/opt/airflow/dags/group_dag.py\", \"timezone\": \"UTC\", \"edge_info\": {}, \"start_date\": 1640995200.0, \"_task_group\": {\"tooltip\": \"\", \"children\": {\"downloads\": [\"taskgroup\", {\"tooltip\": \"Download tasks\", \"children\": {\"downloads.download_a\": [\"operator\", \"downloads.download_a\"], \"downloads.download_b\": [\"operator\", \"downloads.download_b\"], \"downloads.download_c\": [\"operator\", \"downloads.download_c\"]}, \"ui_color\": \"CornflowerBlue\", \"_group_id\": \"downloads\", \"ui_fgcolor\": \"#000\", \"prefix_group_id\": true, \"upstream_task_ids\": [], \"upstream_group_ids\": [], \"downstream_task_ids\": [\"check_files\"], \"downstream_group_ids\": []}], \"transforms\": [\"taskgroup\", {\"tooltip\": \"Transform tasks\", \"children\": {\"transforms.transform_a\": [\"operator\", \"transforms.transform_a\"], \"transforms.transform_b\": [\"operator\", \"transforms.transform_b\"], \"transforms.transform_c\": [\"operator\", \"transforms.transform_c\"]}, \"ui_color\": \"CornflowerBlue\", \"_group_id\": \"transforms\", \"ui_fgcolor\": \"#000\", \"prefix_group_id\": true, \"upstream_task_ids\": [\"check_files\"], \"upstream_group_ids\": [], \"downstream_task_ids\": [], \"downstream_group_ids\": []}], \"check_files\": [\"operator\", \"check_files\"]}, \"ui_color\": \"CornflowerBlue\", \"_group_id\": null, \"ui_fgcolor\": \"#000\", \"prefix_group_id\": true, \"upstream_task_ids\": [], \"upstream_group_ids\": [], \"downstream_task_ids\": [], \"downstream_group_ids\": []}, \"dag_dependencies\": [], \"dataset_triggers\": [], \"schedule_interval\": \"@daily\", \"_processor_dags_folder\": \"/opt/airflow/dags\"}, \"__version\": 1}',NULL,'2022-12-13 12:05:55.582292','b6b05a734671ea30d8da46076022b2b1',NULL),('parallel_dag','/opt/airflow/dags/parallel_dag.py',66300423262467701,'{\"dag\": {\"tasks\": [{\"pool\": \"default_pool\", \"task_id\": \"extract_a\", \"ui_color\": \"#f0ede4\", \"_is_empty\": false, \"_task_type\": \"BashOperator\", \"ui_fgcolor\": \"#000\", \"_task_module\": \"airflow.operators.bash\", \"bash_command\": \"sleep 1\", \"template_ext\": [\".sh\", \".bash\"], \"template_fields\": [\"bash_command\", \"env\"], \"downstream_task_ids\": [\"load_a\"], \"template_fields_renderers\": {\"env\": \"json\", \"bash_command\": \"bash\"}}, {\"pool\": \"default_pool\", \"task_id\": \"extract_b\", \"ui_color\": \"#f0ede4\", \"_is_empty\": false, \"_task_type\": \"BashOperator\", \"ui_fgcolor\": \"#000\", \"_task_module\": \"airflow.operators.bash\", \"bash_command\": \"sleep 1\", \"template_ext\": [\".sh\", \".bash\"], \"template_fields\": [\"bash_command\", \"env\"], \"downstream_task_ids\": [\"load_b\"], \"template_fields_renderers\": {\"env\": \"json\", \"bash_command\": \"bash\"}}, {\"pool\": \"default_pool\", \"task_id\": \"load_a\", \"ui_color\": \"#f0ede4\", \"_is_empty\": false, \"_task_type\": \"BashOperator\", \"ui_fgcolor\": \"#000\", \"_task_module\": \"airflow.operators.bash\", \"bash_command\": \"sleep 1\", \"template_ext\": [\".sh\", \".bash\"], \"template_fields\": [\"bash_command\", \"env\"], \"downstream_task_ids\": [\"transform\"], \"template_fields_renderers\": {\"env\": \"json\", \"bash_command\": \"bash\"}}, {\"pool\": \"default_pool\", \"task_id\": \"load_b\", \"ui_color\": \"#f0ede4\", \"_is_empty\": false, \"_task_type\": \"BashOperator\", \"ui_fgcolor\": \"#000\", \"_task_module\": \"airflow.operators.bash\", \"bash_command\": \"sleep 1\", \"template_ext\": [\".sh\", \".bash\"], \"template_fields\": [\"bash_command\", \"env\"], \"downstream_task_ids\": [\"transform\"], \"template_fields_renderers\": {\"env\": \"json\", \"bash_command\": \"bash\"}}, {\"pool\": \"default_pool\", \"queue\": \"high_cpu\", \"task_id\": \"transform\", \"ui_color\": \"#f0ede4\", \"_is_empty\": false, \"_task_type\": \"BashOperator\", \"ui_fgcolor\": \"#000\", \"_task_module\": \"airflow.operators.bash\", \"bash_command\": \"sleep 1\", \"template_ext\": [\".sh\", \".bash\"], \"template_fields\": [\"bash_command\", \"env\"], \"downstream_task_ids\": [], \"template_fields_renderers\": {\"env\": \"json\", \"bash_command\": \"bash\"}}], \"params\": {}, \"_dag_id\": \"parallel_dag\", \"catchup\": false, \"fileloc\": \"/opt/airflow/dags/parallel_dag.py\", \"timezone\": \"UTC\", \"edge_info\": {}, \"start_date\": 1640995200.0, \"_task_group\": {\"tooltip\": \"\", \"children\": {\"load_a\": [\"operator\", \"load_a\"], \"load_b\": [\"operator\", \"load_b\"], \"extract_a\": [\"operator\", \"extract_a\"], \"extract_b\": [\"operator\", \"extract_b\"], \"transform\": [\"operator\", \"transform\"]}, \"ui_color\": \"CornflowerBlue\", \"_group_id\": null, \"ui_fgcolor\": \"#000\", \"prefix_group_id\": true, \"upstream_task_ids\": [], \"upstream_group_ids\": [], \"downstream_task_ids\": [], \"downstream_group_ids\": []}, \"dag_dependencies\": [], \"dataset_triggers\": [], \"schedule_interval\": \"@daily\", \"_processor_dags_folder\": \"/opt/airflow/dags\"}, \"__version\": 1}',NULL,'2022-12-13 12:05:45.125500','129a10a57045f267b5e61ebb69119141',NULL),('user_processing','/opt/airflow/dags/user_processing.py',29819705783870123,'{\"dag\": {\"tasks\": [{\"sql\": \"\\n            CREATE TABLE IF NOT EXISTS users (\\n                firstname TEXT NOT NULL,\\n                lastname TEXT NOT NULL,\\n                country TEXT NOT NULL,\\n                username TEXT NOT NULL,\\n                password TEXT NOT NULL,\\n                email TEXT NOT NULL\\n            );\\n        \", \"pool\": \"default_pool\", \"task_id\": \"create_table\", \"ui_color\": \"#ededed\", \"_is_empty\": false, \"_task_type\": \"MySqlOperator\", \"ui_fgcolor\": \"#000\", \"_task_module\": \"airflow.providers.mysql.operators.mysql\", \"template_ext\": [\".sql\", \".json\"], \"template_fields\": [\"sql\", \"parameters\"], \"downstream_task_ids\": [\"extract_user\"], \"template_fields_renderers\": {\"sql\": \"mysql\", \"parameters\": \"json\"}}, {\"sql\": \"\\n                SET GLOBAL local_infile=1;\\n            \", \"pool\": \"default_pool\", \"task_id\": \"set_local_infile\", \"ui_color\": \"#ededed\", \"_is_empty\": false, \"_task_type\": \"MySqlOperator\", \"ui_fgcolor\": \"#000\", \"_task_module\": \"airflow.providers.mysql.operators.mysql\", \"template_ext\": [\".sql\", \".json\"], \"template_fields\": [\"sql\", \"parameters\"], \"downstream_task_ids\": [\"extract_user\"], \"template_fields_renderers\": {\"sql\": \"mysql\", \"parameters\": \"json\"}}, {\"deps\": [\"airflow.ti_deps.deps.not_in_retry_period_dep.NotInRetryPeriodDep\", \"airflow.ti_deps.deps.not_previously_skipped_dep.NotPreviouslySkippedDep\", \"airflow.ti_deps.deps.prev_dagrun_dep.PrevDagrunDep\", \"airflow.ti_deps.deps.ready_to_reschedule.ReadyToRescheduleDep\", \"airflow.ti_deps.deps.trigger_rule_dep.TriggerRuleDep\"], \"pool\": \"default_pool\", \"headers\": {}, \"task_id\": \"is_api_available\", \"endpoint\": \"api/\", \"ui_color\": \"#e6f1f2\", \"_is_empty\": false, \"_task_type\": \"HttpSensor\", \"reschedule\": false, \"ui_fgcolor\": \"#000\", \"_task_module\": \"airflow.providers.http.sensors.http\", \"template_ext\": [], \"request_params\": {}, \"template_fields\": [\"endpoint\", \"request_params\", \"headers\"], \"downstream_task_ids\": [\"extract_user\"], \"template_fields_renderers\": {}}, {\"data\": {}, \"pool\": \"default_pool\", \"headers\": {}, \"task_id\": \"extract_user\", \"endpoint\": \"api/\", \"ui_color\": \"#f4a460\", \"_is_empty\": false, \"_task_type\": \"SimpleHttpOperator\", \"ui_fgcolor\": \"#000\", \"_task_module\": \"airflow.providers.http.operators.http\", \"template_ext\": [], \"template_fields\": [\"endpoint\", \"data\", \"headers\"], \"downstream_task_ids\": [\"process_user\"], \"template_fields_renderers\": {\"data\": \"py\", \"headers\": \"json\"}}, {\"pool\": \"default_pool\", \"op_args\": [], \"task_id\": \"process_user\", \"ui_color\": \"#ffefeb\", \"_is_empty\": false, \"op_kwargs\": {}, \"_task_type\": \"PythonOperator\", \"ui_fgcolor\": \"#000\", \"_task_module\": \"airflow.operators.python\", \"template_ext\": [], \"template_fields\": [\"templates_dict\", \"op_args\", \"op_kwargs\"], \"downstream_task_ids\": [\"store_user\"], \"template_fields_renderers\": {\"op_args\": \"py\", \"op_kwargs\": \"py\", \"templates_dict\": \"json\"}}, {\"pool\": \"default_pool\", \"op_args\": [], \"task_id\": \"store_user\", \"ui_color\": \"#ffefeb\", \"_is_empty\": false, \"op_kwargs\": {}, \"_task_type\": \"PythonOperator\", \"ui_fgcolor\": \"#000\", \"_task_module\": \"airflow.operators.python\", \"template_ext\": [], \"template_fields\": [\"templates_dict\", \"op_args\", \"op_kwargs\"], \"downstream_task_ids\": [], \"template_fields_renderers\": {\"op_args\": \"py\", \"op_kwargs\": \"py\", \"templates_dict\": \"json\"}}], \"params\": {}, \"_dag_id\": \"user_processing\", \"catchup\": false, \"fileloc\": \"/opt/airflow/dags/user_processing.py\", \"timezone\": \"UTC\", \"edge_info\": {}, \"start_date\": 1640995200.0, \"_task_group\": {\"tooltip\": \"\", \"children\": {\"store_user\": [\"operator\", \"store_user\"], \"create_table\": [\"operator\", \"create_table\"], \"extract_user\": [\"operator\", \"extract_user\"], \"process_user\": [\"operator\", \"process_user\"], \"is_api_available\": [\"operator\", \"is_api_available\"], \"set_local_infile\": [\"operator\", \"set_local_infile\"]}, \"ui_color\": \"CornflowerBlue\", \"_group_id\": null, \"ui_fgcolor\": \"#000\", \"prefix_group_id\": true, \"upstream_task_ids\": [], \"upstream_group_ids\": [], \"downstream_task_ids\": [], \"downstream_group_ids\": []}, \"dag_dependencies\": [], \"dataset_triggers\": [], \"schedule_interval\": \"@daily\", \"_processor_dags_folder\": \"/opt/airflow/dags\"}, \"__version\": 1}',NULL,'2022-12-13 12:06:02.857004','62c6b3e087724b96cfe0bb0e530476bf',NULL),('xcom_dag','/opt/airflow/dags/xcom_dag.py',70752591694202599,'{\"dag\": {\"tasks\": [{\"pool\": \"default_pool\", \"op_args\": [], \"task_id\": \"t1\", \"ui_color\": \"#ffefeb\", \"_is_empty\": false, \"op_kwargs\": {}, \"_task_type\": \"PythonOperator\", \"ui_fgcolor\": \"#000\", \"_task_module\": \"airflow.operators.python\", \"template_ext\": [], \"template_fields\": [\"templates_dict\", \"op_args\", \"op_kwargs\"], \"downstream_task_ids\": [\"switcher\"], \"template_fields_renderers\": {\"op_args\": \"py\", \"op_kwargs\": \"py\", \"templates_dict\": \"json\"}}, {\"pool\": \"default_pool\", \"op_args\": [], \"task_id\": \"switcher\", \"ui_color\": \"#ffefeb\", \"_is_empty\": false, \"op_kwargs\": {}, \"_task_type\": \"BranchPythonOperator\", \"ui_fgcolor\": \"#000\", \"_task_module\": \"airflow.operators.python\", \"template_ext\": [], \"template_fields\": [\"templates_dict\", \"op_args\", \"op_kwargs\"], \"downstream_task_ids\": [\"t2\", \"t3\"], \"template_fields_renderers\": {\"op_args\": \"py\", \"op_kwargs\": \"py\", \"templates_dict\": \"json\"}}, {\"pool\": \"default_pool\", \"op_args\": [], \"task_id\": \"t2\", \"ui_color\": \"#ffefeb\", \"_is_empty\": false, \"op_kwargs\": {}, \"_task_type\": \"PythonOperator\", \"ui_fgcolor\": \"#000\", \"_task_module\": \"airflow.operators.python\", \"template_ext\": [], \"template_fields\": [\"templates_dict\", \"op_args\", \"op_kwargs\"], \"downstream_task_ids\": [\"t4\"], \"template_fields_renderers\": {\"op_args\": \"py\", \"op_kwargs\": \"py\", \"templates_dict\": \"json\"}}, {\"pool\": \"default_pool\", \"task_id\": \"t3\", \"ui_color\": \"#f0ede4\", \"_is_empty\": false, \"_task_type\": \"BashOperator\", \"ui_fgcolor\": \"#000\", \"_task_module\": \"airflow.operators.bash\", \"bash_command\": \"echo \'\'\", \"template_ext\": [\".sh\", \".bash\"], \"template_fields\": [\"bash_command\", \"env\"], \"downstream_task_ids\": [\"t4\"], \"template_fields_renderers\": {\"env\": \"json\", \"bash_command\": \"bash\"}}, {\"pool\": \"default_pool\", \"task_id\": \"t4\", \"ui_color\": \"#f0ede4\", \"_is_empty\": false, \"_task_type\": \"BashOperator\", \"ui_fgcolor\": \"#000\", \"_task_module\": \"airflow.operators.bash\", \"bash_command\": \"echo \'\'\", \"template_ext\": [\".sh\", \".bash\"], \"trigger_rule\": \"none_failed_min_one_success\", \"template_fields\": [\"bash_command\", \"env\"], \"downstream_task_ids\": [], \"template_fields_renderers\": {\"env\": \"json\", \"bash_command\": \"bash\"}}], \"params\": {}, \"_dag_id\": \"xcom_dag\", \"catchup\": false, \"fileloc\": \"/opt/airflow/dags/xcom_dag.py\", \"timezone\": \"UTC\", \"edge_info\": {}, \"start_date\": 1640995200.0, \"_task_group\": {\"tooltip\": \"\", \"children\": {\"t1\": [\"operator\", \"t1\"], \"t2\": [\"operator\", \"t2\"], \"t3\": [\"operator\", \"t3\"], \"t4\": [\"operator\", \"t4\"], \"switcher\": [\"operator\", \"switcher\"]}, \"ui_color\": \"CornflowerBlue\", \"_group_id\": null, \"ui_fgcolor\": \"#000\", \"prefix_group_id\": true, \"upstream_task_ids\": [], \"upstream_group_ids\": [], \"downstream_task_ids\": [], \"downstream_group_ids\": []}, \"dag_dependencies\": [], \"dataset_triggers\": [], \"schedule_interval\": \"@daily\", \"_processor_dags_folder\": \"/opt/airflow/dags\"}, \"__version\": 1}',NULL,'2022-12-13 12:05:49.780747','8734ab52c2db559722bbaac9392e7a2e',NULL);
/*!40000 ALTER TABLE `serialized_dag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session`
--

DROP TABLE IF EXISTS `session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `session` (
  `id` int NOT NULL AUTO_INCREMENT,
  `session_id` varchar(255) DEFAULT NULL,
  `data` blob,
  `expiry` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session`
--

LOCK TABLES `session` WRITE;
/*!40000 ALTER TABLE `session` DISABLE KEYS */;
/*!40000 ALTER TABLE `session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sla_miss`
--

DROP TABLE IF EXISTS `sla_miss`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sla_miss` (
  `task_id` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `dag_id` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `execution_date` timestamp(6) NOT NULL,
  `email_sent` tinyint(1) DEFAULT NULL,
  `timestamp` timestamp(6) NULL DEFAULT NULL,
  `description` text,
  `notification_sent` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`task_id`,`dag_id`,`execution_date`),
  KEY `sm_dag` (`dag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sla_miss`
--

LOCK TABLES `sla_miss` WRITE;
/*!40000 ALTER TABLE `sla_miss` DISABLE KEYS */;
/*!40000 ALTER TABLE `sla_miss` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slot_pool`
--

DROP TABLE IF EXISTS `slot_pool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slot_pool` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pool` varchar(256) DEFAULT NULL,
  `slots` int DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slot_pool_pool_uq` (`pool`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slot_pool`
--

LOCK TABLES `slot_pool` WRITE;
/*!40000 ALTER TABLE `slot_pool` DISABLE KEYS */;
INSERT INTO `slot_pool` VALUES (1,'default_pool',128,'Default pool');
/*!40000 ALTER TABLE `slot_pool` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_fail`
--

DROP TABLE IF EXISTS `task_fail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task_fail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `task_id` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `dag_id` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `run_id` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `map_index` int NOT NULL DEFAULT '-1',
  `start_date` timestamp(6) NULL DEFAULT NULL,
  `end_date` timestamp(6) NULL DEFAULT NULL,
  `duration` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_task_fail_task_instance` (`dag_id`,`task_id`,`run_id`,`map_index`),
  CONSTRAINT `task_fail_ti_fkey` FOREIGN KEY (`dag_id`, `task_id`, `run_id`, `map_index`) REFERENCES `task_instance` (`dag_id`, `task_id`, `run_id`, `map_index`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_fail`
--

LOCK TABLES `task_fail` WRITE;
/*!40000 ALTER TABLE `task_fail` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_fail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_instance`
--

DROP TABLE IF EXISTS `task_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task_instance` (
  `task_id` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `dag_id` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `run_id` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `map_index` int NOT NULL DEFAULT '-1',
  `start_date` timestamp(6) NULL DEFAULT NULL,
  `end_date` timestamp(6) NULL DEFAULT NULL,
  `duration` float DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  `try_number` int DEFAULT NULL,
  `max_tries` int DEFAULT '-1',
  `hostname` varchar(1000) DEFAULT NULL,
  `unixname` varchar(1000) DEFAULT NULL,
  `job_id` int DEFAULT NULL,
  `pool` varchar(256) NOT NULL,
  `pool_slots` int NOT NULL,
  `queue` varchar(256) DEFAULT NULL,
  `priority_weight` int DEFAULT NULL,
  `operator` varchar(1000) DEFAULT NULL,
  `queued_dttm` timestamp(6) NULL DEFAULT NULL,
  `queued_by_job_id` int DEFAULT NULL,
  `pid` int DEFAULT NULL,
  `executor_config` blob,
  `external_executor_id` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `trigger_id` int DEFAULT NULL,
  `trigger_timeout` datetime DEFAULT NULL,
  `next_method` varchar(1000) DEFAULT NULL,
  `next_kwargs` json DEFAULT NULL,
  PRIMARY KEY (`dag_id`,`task_id`,`run_id`,`map_index`),
  KEY `ti_pool` (`pool`,`state`,`priority_weight`),
  KEY `ti_job_id` (`job_id`),
  KEY `ti_state` (`state`),
  KEY `ti_trigger_id` (`trigger_id`),
  KEY `ti_state_lkp` (`dag_id`,`task_id`,`run_id`,`state`),
  KEY `ti_dag_state` (`dag_id`,`state`),
  KEY `ti_dag_run` (`dag_id`,`run_id`),
  CONSTRAINT `task_instance_dag_run_fkey` FOREIGN KEY (`dag_id`, `run_id`) REFERENCES `dag_run` (`dag_id`, `run_id`) ON DELETE CASCADE,
  CONSTRAINT `task_instance_trigger_id_fkey` FOREIGN KEY (`trigger_id`) REFERENCES `trigger` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_instance`
--

LOCK TABLES `task_instance` WRITE;
/*!40000 ALTER TABLE `task_instance` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_instance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_map`
--

DROP TABLE IF EXISTS `task_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task_map` (
  `dag_id` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `task_id` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `run_id` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `map_index` int NOT NULL,
  `length` int NOT NULL,
  `keys` json DEFAULT NULL,
  PRIMARY KEY (`dag_id`,`task_id`,`run_id`,`map_index`),
  CONSTRAINT `task_map_task_instance_fkey` FOREIGN KEY (`dag_id`, `task_id`, `run_id`, `map_index`) REFERENCES `task_instance` (`dag_id`, `task_id`, `run_id`, `map_index`) ON DELETE CASCADE,
  CONSTRAINT `ck_task_map_task_map_length_not_negative` CHECK ((`length` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_map`
--

LOCK TABLES `task_map` WRITE;
/*!40000 ALTER TABLE `task_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_outlet_dataset_reference`
--

DROP TABLE IF EXISTS `task_outlet_dataset_reference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task_outlet_dataset_reference` (
  `dataset_id` int NOT NULL,
  `dag_id` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `task_id` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `created_at` timestamp(6) NOT NULL,
  `updated_at` timestamp(6) NOT NULL,
  PRIMARY KEY (`dataset_id`,`dag_id`,`task_id`),
  KEY `todr_dag_id_fkey` (`dag_id`),
  CONSTRAINT `todr_dag_id_fkey` FOREIGN KEY (`dag_id`) REFERENCES `dag` (`dag_id`) ON DELETE CASCADE,
  CONSTRAINT `todr_dataset_fkey` FOREIGN KEY (`dataset_id`) REFERENCES `dataset` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_outlet_dataset_reference`
--

LOCK TABLES `task_outlet_dataset_reference` WRITE;
/*!40000 ALTER TABLE `task_outlet_dataset_reference` DISABLE KEYS */;
INSERT INTO `task_outlet_dataset_reference` VALUES (1,'dataset_producer','update_dataset','2022-12-13 12:05:48.778579','2022-12-13 12:05:48.778636'),(2,'dataset_producer','update_dataset_2','2022-12-13 12:05:48.780960','2022-12-13 12:05:48.780994');
/*!40000 ALTER TABLE `task_outlet_dataset_reference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_reschedule`
--

DROP TABLE IF EXISTS `task_reschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task_reschedule` (
  `id` int NOT NULL AUTO_INCREMENT,
  `task_id` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `dag_id` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `run_id` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `map_index` int NOT NULL DEFAULT '-1',
  `try_number` int NOT NULL,
  `start_date` timestamp(6) NOT NULL,
  `end_date` timestamp(6) NOT NULL,
  `duration` int NOT NULL,
  `reschedule_date` timestamp(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_task_reschedule_dag_task_run` (`dag_id`,`task_id`,`run_id`,`map_index`),
  KEY `idx_task_reschedule_dag_run` (`dag_id`,`run_id`),
  CONSTRAINT `task_reschedule_dr_fkey` FOREIGN KEY (`dag_id`, `run_id`) REFERENCES `dag_run` (`dag_id`, `run_id`) ON DELETE CASCADE,
  CONSTRAINT `task_reschedule_ti_fkey` FOREIGN KEY (`dag_id`, `task_id`, `run_id`, `map_index`) REFERENCES `task_instance` (`dag_id`, `task_id`, `run_id`, `map_index`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_reschedule`
--

LOCK TABLES `task_reschedule` WRITE;
/*!40000 ALTER TABLE `task_reschedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_reschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trigger`
--

DROP TABLE IF EXISTS `trigger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trigger` (
  `id` int NOT NULL AUTO_INCREMENT,
  `classpath` varchar(1000) NOT NULL,
  `kwargs` json NOT NULL,
  `created_date` timestamp(6) NOT NULL,
  `triggerer_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trigger`
--

LOCK TABLES `trigger` WRITE;
/*!40000 ALTER TABLE `trigger` DISABLE KEYS */;
/*!40000 ALTER TABLE `trigger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variable`
--

DROP TABLE IF EXISTS `variable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `variable` (
  `id` int NOT NULL AUTO_INCREMENT,
  `key` varchar(250) DEFAULT NULL,
  `val` mediumtext,
  `description` text,
  `is_encrypted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `variable_key_uq` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variable`
--

LOCK TABLES `variable` WRITE;
/*!40000 ALTER TABLE `variable` DISABLE KEYS */;
/*!40000 ALTER TABLE `variable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xcom`
--

DROP TABLE IF EXISTS `xcom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `xcom` (
  `dag_run_id` int NOT NULL,
  `task_id` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `map_index` int NOT NULL DEFAULT '-1',
  `key` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `dag_id` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `run_id` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `value` blob,
  `timestamp` timestamp(6) NOT NULL,
  PRIMARY KEY (`dag_run_id`,`task_id`,`map_index`,`key`),
  KEY `idx_xcom_task_instance` (`dag_id`,`task_id`,`run_id`,`map_index`),
  KEY `idx_xcom_key` (`key`),
  CONSTRAINT `xcom_task_instance_fkey` FOREIGN KEY (`dag_id`, `task_id`, `run_id`, `map_index`) REFERENCES `task_instance` (`dag_id`, `task_id`, `run_id`, `map_index`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xcom`
--

LOCK TABLES `xcom` WRITE;
/*!40000 ALTER TABLE `xcom` DISABLE KEYS */;
/*!40000 ALTER TABLE `xcom` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-13 12:07:45
