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
  `device_id` int NOT NULL,
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
INSERT INTO `device_messages` VALUES (1,1,1,11,22,1,'2021-03-03 18:28:35');
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
  `maintenence` binary(1) NOT NULL,
  PRIMARY KEY (`id_device`),
  KEY `dev_for_fk_idx` (`forest_id`),
  KEY `user_dev_fk_idx` (`registed_by`),
  CONSTRAINT `dev_for_fk` FOREIGN KEY (`forest_id`) REFERENCES `forest` (`id_Forest`),
  CONSTRAINT `user_dev_fk` FOREIGN KEY (`registed_by`) REFERENCES `user_infor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devices`
--

LOCK TABLES `devices` WRITE;
/*!40000 ALTER TABLE `devices` DISABLE KEYS */;
INSERT INTO `devices` VALUES (1,1,'kekee ',11,22,1,'2021-03-03 18:20:14',_binary '1'),(2,1,'kekee ',11,22,1,'2021-03-03 18:20:14',_binary '1'),(3,1,'kekee ',11,22,1,'2021-03-03 18:20:28',_binary '1'),(4,1,'kekee ',11,22,1,'2021-03-03 18:20:28',_binary '1'),(5,1,'kekee ',11,22,1,'2021-03-03 18:21:01',_binary '1');
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
INSERT INTO `forest` VALUES (1,'long','aasd','asdsa','adsad',12,13,1,1,1,1,123123),(2,'asd','123','12asd','123asd',2,2,2,2,2,2,2),(3,'AA','312ASE','ASD','QE2',3,3,3,3,3,3,3),(4,'NTL','long8520','hai duong','hainduong',1,2,3,4,5,6,7),(5,'NTL','long8520','hai duong','hainduong',1,2,3,4,5,6,7),(6,'NTL','long8520','hai duong','hainduong',1,2,3,4,5,6,7),(7,'NTL','long8520','hai duong','hainduong',1,2,3,4,5,6,7),(8,'NTL','long8520','hai duong','hainduong',1,2,3,4,5,6,7),(9,'NTL','long8520','hai duong','hainduong',1,2,3,4,5,6,7),(10,'Vươnf Quốc Gia Ba Vì','Ba Vì','Ba vì','Hà Nội',11,22,33,43,53,62,73),(11,'Vươnf Quốc Gia Ba Vì','Ba Vì','Ba vì','Hà Nội',11,22,33,43,53,62,73);
/*!40000 ALTER TABLE `forest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_infor`
--

DROP TABLE IF EXISTS `user_infor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_infor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `last_name` text,
  `first_name` text,
  `authority` tinyint DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `username` varchar(1000) NOT NULL,
  `password` varchar(1000) NOT NULL,
  `forest_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_forest_fk_idx` (`forest_id`),
  CONSTRAINT `user_forest_fk` FOREIGN KEY (`forest_id`) REFERENCES `forest` (`id_Forest`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_infor`
--

LOCK TABLES `user_infor` WRITE;
/*!40000 ALTER TABLE `user_infor` DISABLE KEYS */;
INSERT INTO `user_infor` VALUES (1,'long','long',1,'long','123123','long','long',1),(2,'long','long',2,'long','12345','long1','long',2),(3,NULL,NULL,NULL,NULL,NULL,'long','$2b$10$NOemO03dxXfu0NNq5fi3pOLQvUmPfdqews8WdfnfDFIo19e9K48x6',1),(4,NULL,NULL,NULL,NULL,NULL,'NTL','$2b$10$aoDrHAqkcIorasOG5jvab.AhOwNTomnIj4FX1FRddeMIBAumraHC.',1);
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

-- Dump completed on 2021-03-14  2:30:06
