-- MySQL dump 10.13  Distrib 8.0.22, for Linux (x86_64)
--
-- Host: localhost    Database: website
-- ------------------------------------------------------
-- Server version	8.0.22-0ubuntu0.20.04.2

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
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification` (
  `id` int NOT NULL AUTO_INCREMENT,
  `person1_id` int NOT NULL,
  `pname` varchar(45) NOT NULL,
  `content` varchar(45) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_notification_1_idx` (`person1_id`),
  CONSTRAINT `fk_notification_1` FOREIGN KEY (`person1_id`) REFERENCES `seller` (`vid`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
INSERT INTO `notification` VALUES (1,1,'Abc','Pending','2020-11-15 17:37:50'),(2,1,'Abc','Pending','2020-11-15 17:41:25'),(3,1,'Abc','Pending','2020-11-15 17:42:55'),(4,1,'Abc','Pending','2020-11-15 17:43:06'),(5,1,'bfdb','Pending','2020-11-15 22:10:24'),(6,1,'bfdb','Pending','2020-11-15 22:14:27'),(7,1,'bfdb','Pending','2020-11-15 22:14:32'),(8,1,'bfdb','Pending','2020-11-15 22:24:35'),(9,1,'bfdb','Pending','2020-11-15 22:24:39'),(10,1,'bfdb','Pending','2020-11-15 22:27:20'),(11,1,'bfdb','Pending','2020-11-15 22:27:24'),(12,1,'bfdb','Pending','2020-11-15 22:27:54'),(13,1,'bfdb','Pending','2020-11-15 22:28:11'),(14,1,'bfdb','Pending','2020-11-15 22:28:49'),(15,1,'bfdb','Pending','2020-11-15 22:29:04'),(16,1,'bfdb','Pending','2020-11-15 22:30:36'),(17,1,'bfdb','Pending','2020-11-15 22:30:48'),(18,1,'bfdb','Pending','2020-11-15 22:35:13'),(19,1,'bfdb','Pending','2020-11-15 22:37:11'),(20,1,'bfdb','Pending','2020-11-15 22:37:32'),(21,1,'bfdb','Pending','2020-11-15 22:37:48'),(22,1,'bfdb','Pending','2020-11-15 22:39:30'),(23,1,'bfdb','Pending','2020-11-15 22:41:00'),(24,1,'Abc','Pending','2020-11-16 22:15:47'),(25,1,'Abc','Pending','2020-11-16 22:16:48'),(26,1,'Abc','Pending','2020-11-16 22:16:56'),(27,1,'Abc','Pending','2020-11-16 22:23:39'),(28,1,'Abc','Pending','2020-11-16 22:23:57'),(29,1,'Abc','Pending','2020-11-16 22:24:39'),(30,1,'Abc','Pending','2020-11-16 22:32:17'),(31,1,'Abc','Pending','2020-11-16 22:34:19'),(32,1,'Abc','Pending','2020-11-17 16:27:22'),(33,1,'Abc','Pending','2020-11-17 16:28:34'),(34,1,'Abc','Pending','2020-11-17 16:28:50'),(35,1,'Abc','Pending','2020-11-17 16:33:27'),(36,1,'Abc','Pending','2020-11-17 16:36:38'),(37,1,'Abc','Pending','2020-11-17 16:37:54');
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-18 12:13:42
