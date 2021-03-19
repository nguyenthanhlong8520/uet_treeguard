-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: uet_treeguard_master
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `device_messages`
--

DROP TABLE IF EXISTS `device_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `device_messages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `is_stroked` tinyint NOT NULL,
  `is_removed` tinyint NOT NULL,
  `is_fire` tinyint NOT NULL,
  `power` float NOT NULL,
  `time_stamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  CONSTRAINT `mes_dev_fk` FOREIGN KEY (`id`) REFERENCES `devices` (`id_device`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_messages`
--

LOCK TABLES `device_messages` WRITE;
/*!40000 ALTER TABLE `device_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `device_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devices`
--

DROP TABLE IF EXISTS `devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `devices` (
  `id_device` int NOT NULL AUTO_INCREMENT,
  `forest_id` int NOT NULL,
  `device_name` text NOT NULL,
  `latitude` float NOT NULL,
  `longtitude` float NOT NULL,
  `registed_by` int NOT NULL,
  `time_stamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_device`),
  KEY `dev_for_fk_idx` (`forest_id`),
  KEY `dev_forein_userInfor_idx` (`registed_by`),
  CONSTRAINT `dev_for_fk` FOREIGN KEY (`forest_id`) REFERENCES `forest` (`id_Forest`),
  CONSTRAINT `dev_forein_userInfor` FOREIGN KEY (`registed_by`) REFERENCES `user_infor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devices`
--

LOCK TABLES `devices` WRITE;
/*!40000 ALTER TABLE `devices` DISABLE KEYS */;
/*!40000 ALTER TABLE `devices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forest`
--

DROP TABLE IF EXISTS `forest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forest` (
  `id_Forest` int NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `district` text NOT NULL,
  `town` text NOT NULL,
  `province` text NOT NULL,
  `latitude_BL` float NOT NULL,
  `longtitude_BL` float NOT NULL,
  `latitude_TL` float NOT NULL,
  `longtitude_TL` float NOT NULL,
  `latitude_BR` float NOT NULL,
  `longtitude_BR` float NOT NULL,
  `size` float NOT NULL,
  PRIMARY KEY (`id_Forest`),
  UNIQUE KEY `id_Forest_UNIQUE` (`id_Forest`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forest`
--

LOCK TABLES `forest` WRITE;
/*!40000 ALTER TABLE `forest` DISABLE KEYS */;
INSERT INTO `forest` VALUES (1,'Cuc Phuong','abc','de','asd',12,12,12,12313,123123,12311,12312);
/*!40000 ALTER TABLE `forest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(10000) NOT NULL,
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'long','$2b$10$mAafuOxyJipQGqrE43hED.slnPB.oRnWPc1bMZxSyuOGbfAd0u1Li'),(2,'thanhlong','$2b$10$obxUHXjn7jagGsTvDhCL.OfzCIqErBMYlrsNbT33qpIZRXd4zNXJ.');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_infor`
--

DROP TABLE IF EXISTS `user_infor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_infor` (
  `id` int NOT NULL,
  `last_name` text,
  `first_name` text,
  `authority` text,
  `email` varchar(45) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `forest_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `forest_id_pk_userInfor_idx` (`forest_id`),
  CONSTRAINT `forest_id_pk_userInfor` FOREIGN KEY (`forest_id`) REFERENCES `forest` (`id_Forest`),
  CONSTRAINT `user_userInfor` FOREIGN KEY (`id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_infor`
--

LOCK TABLES `user_infor` WRITE;
/*!40000 ALTER TABLE `user_infor` DISABLE KEYS */;
INSERT INTO `user_infor` VALUES (1,'thanhlong','12345','12345','long','123123',1);
/*!40000 ALTER TABLE `user_infor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-20  3:14:14
