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
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_details` (
  `did` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `company` varchar(100) DEFAULT NULL,
  `number` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `add1` varchar(100) NOT NULL,
  `add2` varchar(100) DEFAULT NULL,
  `city` varchar(100) NOT NULL,
  `District` varchar(100) DEFAULT NULL,
  `Postcode` varchar(100) DEFAULT NULL,
  `order_notes` varchar(100) DEFAULT NULL,
  `payment_method` varchar(45) NOT NULL,
  `datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`did`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` VALUES (3,'Ria','','','09798118004','','Room no. 610 A ,Devi Ahilya Hall of residence ,','Indian Institute of Technology Indore','INDORE','','453552','','cash',NULL),(4,'Ria','','','09798118004','','Room no. 610 A ,Devi Ahilya Hall of residence ,','Indian Institute of Technology Indore','INDORE','','453552','','cash',NULL),(5,'Ria','Verma','','09798118004','','Room no. 610 A ,Devi Ahilya Hall of residence ,','Indian Institute of Technology Indore','INDORE','','453552','','cash',NULL),(6,'Ria','','','09798118004','','Opposite- D/136, Dela Toli, Harmu Housing Colony, Harmu','','Ranchi','','834002','','cash','2020-11-15 01:20:56'),(7,'Ria','','','09798118004','','Opposite- D/136, Dela Toli, Harmu Housing Colony, Harmu','','Ranchi','','834002','','cash','2020-11-15 01:25:11'),(8,'Ria','','','09798118004','','Room no. 610 A ,Devi Ahilya Hall of residence ,','Indian Institute of Technology Indore','INDORE','','453552','','cash','2020-11-15 07:01:41'),(9,'Ria','','','09798118004','','Room no. 610 A ,Devi Ahilya Hall of residence ,','Indian Institute of Technology Indore','INDORE','','453552','','cash','2020-11-15 07:02:53'),(10,'Ria','','','09798118004','','Room no. 610 A ,Devi Ahilya Hall of residence ,','Indian Institute of Technology Indore','INDORE','','453552','','cash','2020-11-15 07:08:01'),(11,'Ria','','','09798118004','','Opposite- D/136, Dela Toli, Harmu Housing Colony, Harmu','','Ranchi','','834002','','cash','2020-11-15 09:31:51'),(12,'Ria','','','09798118004','','Room no. 610 A ,Devi Ahilya Hall of residence ,','Indian Institute of Technology Indore','INDORE','','453552','','cash','2020-11-15 09:33:53'),(13,'Ria','','','09798118004','','Opposite- D/136, Dela Toli, Harmu Housing Colony, Harmu','','Ranchi','','834002','','cash','2020-11-15 09:43:54'),(14,'Ria','Verma','','09798118004','cse190001051@iiti.ac.in','Opposite- D/136, Dela Toli, Harmu Housing Colony, Harmu','Indian Institute of Technology Indore','Ranchi','Simrol','834002','Happy Birthday to me!','cash','2020-11-15 15:35:50'),(15,'','','','','','','','','','','','cash','2020-11-15 17:15:58'),(16,'','','','','','','','','','','','cash','2020-11-16 08:02:52'),(17,'','','','','','','','','','','','cash','2020-11-16 08:04:15'),(18,'','','','','','','','','','','','cash','2020-11-16 08:04:21'),(19,'','','','','','','','','','','','cash','2020-11-16 08:04:42'),(20,'','','','','','','','','','','','cash','2020-11-16 08:10:30'),(21,'Ria','Verma','Company','09798118004','cse190001051@iiti.ac.in','Room no. 610 A ,Devi Ahilya Hall of residence ,','Indian Institute of Technology Indore','INDORE','Simrol','453552','','checkpayment','2020-11-16 08:51:53'),(22,'Ria','Verma','Company','09798118004','cse190001051@iiti.ac.in','Room no. 610 A ,Devi Ahilya Hall of residence ,','Indian Institute of Technology Indore','INDORE','Simrol','453552','','cash','2020-11-16 16:06:44'),(23,'Ria','Verma','Company','09798118004','cse190001051@iiti.ac.in','Opposite- D/136, Dela Toli, Harmu Housing Colony, Harmu','Indian Institute of Technology Indore','Ranchi','Simrol','834002','','cash','2020-11-16 16:56:40'),(24,'Ria','Verma','','09798118004','cse190001051@iiti.ac.in','Opposite- D/136, Dela Toli, Harmu Housing Colony, Harmu','Indian Institute of Technology Indore','Ranchi','Simrol','834002','','cash','2020-11-16 17:00:29'),(25,'Ria','Verma','','09798118004','cse190001051@iiti.ac.in','Opposite- D/136, Dela Toli, Harmu Housing Colony, Harmu','Indian Institute of Technology Indore','Ranchi','Simrol','834002','','cash','2020-11-16 17:03:27'),(26,'Ria','Verma','Company','09798118004','cse190001051@iiti.ac.in','Room no. 610 A ,Devi Ahilya Hall of residence ,','Indian Institute of Technology Indore','INDORE','INDORE','453552','','checkpayment','2020-11-17 06:36:16'),(27,'Ria','Verma','Company','09798118004','cse190001051@iiti.ac.in','Room no. 610 A ,Devi Ahilya Hall of residence ,','Indian Institute of Technology Indore','INDORE','INDORE','453552','','paypal','2020-11-17 06:39:41'),(28,'Ria','Verma','Company','09798118004','cse190001051@iiti.ac.in','Room no. 610 A ,Devi Ahilya Hall of residence ,','Indian Institute of Technology Indore','INDORE','Simrol','453552','','checkpayment','2020-11-17 12:03:38'),(29,'Ria','Verma','Company','09798118004','cse190001051@iiti.ac.in','Room no. 610 A ,Devi Ahilya Hall of residence ,','Indian Institute of Technology Indore','INDORE','Simrol','453552','','checkpayment','2020-11-17 12:38:03'),(30,'Ria','Verma','','09798118004','cse190001051@iiti.ac.in','Room no. 610 A ,Devi Ahilya Hall of residence ,','Indian Institute of Technology Indore','INDORE','INDORE','453552','','paypal','2020-11-17 17:58:48');
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
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
