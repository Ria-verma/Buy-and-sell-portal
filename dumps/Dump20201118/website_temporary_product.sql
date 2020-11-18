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
-- Table structure for table `temporary_product`
--

DROP TABLE IF EXISTS `temporary_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `temporary_product` (
  `rid` int NOT NULL AUTO_INCREMENT,
  `vid` int NOT NULL,
  `pname` varchar(45) NOT NULL,
  `price` varchar(45) DEFAULT NULL,
  `pdetails` varchar(45) DEFAULT NULL,
  `disprice` varchar(45) DEFAULT NULL,
  `category` varchar(45) DEFAULT NULL,
  `stock` varchar(45) DEFAULT NULL,
  `datetime` datetime NOT NULL,
  PRIMARY KEY (`rid`),
  KEY `fk_temporary_product_1_idx` (`vid`),
  CONSTRAINT `fk_temporary_product_1` FOREIGN KEY (`vid`) REFERENCES `seller` (`vid`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temporary_product`
--

LOCK TABLES `temporary_product` WRITE;
/*!40000 ALTER TABLE `temporary_product` DISABLE KEYS */;
INSERT INTO `temporary_product` VALUES (1,1,'Abc','foifejfoiewj','fjdfoijd','fjewfi','pantry','3','2020-11-15 17:36:52'),(2,1,'Abc','foifejfoiewj','fjdfoijd','fjewfi','pantry','3','2020-11-15 17:37:16'),(3,1,'Abc','foifejfoiewj','fjdfoijd','fjewfi','pantry','3','2020-11-15 17:37:50'),(4,1,'Abc','foifejfoiewj','fjdfoijd','fjewfi','pantry','3','2020-11-15 17:41:25'),(5,1,'Abc','foifejfoiewj','fjdfoijd','fjewfi','pantry','3','2020-11-15 17:42:55'),(6,1,'Abc','foifejfoiewj','fjdfoijd','fjewfi','pantry','3','2020-11-15 17:43:06'),(7,1,'bfdb','fdgrdb','vsdb','rsbfdb','pantry','2','2020-11-15 22:10:24'),(8,1,'bfdb','fdgrdb','vsdb','rsbfdb','pantry','2','2020-11-15 22:14:27'),(9,1,'bfdb','fdgrdb','vsdb','rsbfdb','pantry','2','2020-11-15 22:14:32'),(10,1,'bfdb','fdgrdb','vsdb','rsbfdb','pantry','2','2020-11-15 22:24:35'),(11,1,'bfdb','fdgrdb','vsdb','rsbfdb','pantry','2','2020-11-15 22:24:39'),(12,1,'bfdb','fdgrdb','vsdb','rsbfdb','pantry','2','2020-11-15 22:27:20'),(13,1,'bfdb','fdgrdb','vsdb','rsbfdb','pantry','2','2020-11-15 22:27:24'),(14,1,'bfdb','fdgrdb','vsdb','rsbfdb','pantry','2','2020-11-15 22:27:54'),(15,1,'bfdb','fdgrdb','vsdb','rsbfdb','pantry','2','2020-11-15 22:28:11'),(16,1,'bfdb','fdgrdb','vsdb','rsbfdb','pantry','2','2020-11-15 22:28:49'),(17,1,'bfdb','fdgrdb','vsdb','rsbfdb','pantry','2','2020-11-15 22:29:04'),(18,1,'bfdb','fdgrdb','vsdb','rsbfdb','pantry','2','2020-11-15 22:30:36'),(19,1,'bfdb','fdgrdb','vsdb','rsbfdb','pantry','2','2020-11-15 22:30:48'),(20,1,'bfdb','fdgrdb','vsdb','rsbfdb','pantry','2','2020-11-15 22:35:13'),(21,1,'bfdb','fdgrdb','vsdb','rsbfdb','pantry','2','2020-11-15 22:37:11'),(22,1,'bfdb','fdgrdb','vsdb','rsbfdb','pantry','2','2020-11-15 22:37:32'),(23,1,'bfdb','fdgrdb','vsdb','rsbfdb','pantry','2','2020-11-15 22:37:48'),(24,1,'bfdb','fdgrdb','vsdb','rsbfdb','pantry','2','2020-11-15 22:39:30'),(25,1,'bfdb','fdgrdb','vsdb','rsbfdb','pantry','2','2020-11-15 22:41:00'),(26,1,'Abc','3446','abcdef','233','clothing','4','2020-11-16 22:15:47'),(27,1,'Abc','3446','abcdef','233','clothing','4','2020-11-16 22:16:48'),(28,1,'Abc','3446','abcdef','233','clothing','4','2020-11-16 22:16:56'),(29,1,'Abc','3446','abcdef','233','clothing','4','2020-11-16 22:23:39'),(30,1,'Abc','3446','abcdef','233','clothing','4','2020-11-16 22:23:57'),(31,1,'Abc','3446','abcdef','233','clothing','4','2020-11-16 22:24:39'),(32,1,'Abc','3446','abcdef','233','clothing','4','2020-11-16 22:32:17'),(33,1,'Abc','3446','abcdef','233','clothing','4','2020-11-16 22:34:19'),(34,1,'Abc','3446','sdbfd','233','pantry','-16','2020-11-17 16:27:22'),(35,1,'Abc','3446','sdbfd','233','pantry','-16','2020-11-17 16:28:34'),(36,1,'Abc','3446','sdbfd','233','pantry','-16','2020-11-17 16:28:50'),(37,1,'Abc','3446','sdbfd','233','pantry','-16','2020-11-17 16:33:27'),(38,1,'Abc','3446','sdbfd','233','pantry','-16','2020-11-17 16:36:38'),(39,1,'Abc','3446','sdbfd','233','pantry','-16','2020-11-17 16:37:54');
/*!40000 ALTER TABLE `temporary_product` ENABLE KEYS */;
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
