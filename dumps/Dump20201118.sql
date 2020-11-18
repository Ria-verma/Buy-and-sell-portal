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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `aid` int NOT NULL AUTO_INCREMENT,
  `email` varchar(45) NOT NULL,
  `details` varchar(45) DEFAULT NULL,
  `password` varchar(250) NOT NULL,
  `join_date` datetime DEFAULT NULL,
  `username` varchar(45) NOT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `pid` int NOT NULL,
  `quantity` int NOT NULL,
  `vid` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `username_idx` (`user_id`),
  KEY `fk_cart_3_idx` (`vid`),
  KEY `fk_cart_2_idx` (`pid`),
  CONSTRAINT `fk_cart_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_cart_2` FOREIGN KEY (`pid`) REFERENCES `products` (`pid`),
  CONSTRAINT `fk_cart_3` FOREIGN KEY (`vid`) REFERENCES `seller` (`vid`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `pro_id` int NOT NULL,
  `quantity` int NOT NULL,
  `price` int NOT NULL,
  `datetime` datetime NOT NULL,
  `delivery_status` varchar(45) NOT NULL DEFAULT 'Not Delivered',
  `vid` int DEFAULT NULL,
  `did` int DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `order_id_UNIQUE` (`order_id`),
  KEY `fk_orders_1_idx` (`user_id`),
  KEY `fk_orders_2_idx` (`pro_id`),
  KEY `fk_orders_3_idx` (`vid`),
  KEY `fk_orders_4_idx` (`did`),
  CONSTRAINT `fk_orders_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_orders_2` FOREIGN KEY (`pro_id`) REFERENCES `products` (`pid`),
  CONSTRAINT `fk_orders_3` FOREIGN KEY (`vid`) REFERENCES `seller` (`vid`),
  CONSTRAINT `fk_orders_4` FOREIGN KEY (`did`) REFERENCES `order_details` (`did`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,1,4,200,'2020-11-17 12:38:03','Delivered',2,29),(2,31,3,2,400,'2020-11-17 12:38:03','Delivered',1,29),(3,31,1,1,200,'2020-11-17 17:58:49','Not Delivered',2,30),(4,31,1,2,200,'2020-11-17 17:58:49','Delivered',1,30);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `price`
--

DROP TABLE IF EXISTS `price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `price` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pid` int NOT NULL,
  `vid` int NOT NULL,
  `price` int NOT NULL,
  `disprice` int DEFAULT NULL,
  `dateAdded` date NOT NULL,
  `stock` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_price_1_idx` (`pid`),
  KEY `fk_price_2_idx` (`vid`),
  CONSTRAINT `fk_price_1` FOREIGN KEY (`pid`) REFERENCES `products` (`pid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_price_2` FOREIGN KEY (`vid`) REFERENCES `seller` (`vid`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `price`
--

LOCK TABLES `price` WRITE;
/*!40000 ALTER TABLE `price` DISABLE KEYS */;
INSERT INTO `price` VALUES (1,1,1,200,200,'2001-11-01',77),(2,2,1,400,200,'2001-11-01',88),(3,3,1,400,344,'2001-11-01',98),(36,4,1,500,460,'2001-11-01',100),(37,5,1,500,490,'2001-11-01',100),(38,6,1,500,400,'2001-11-01',98),(39,7,1,500,NULL,'2001-11-01',100),(40,8,1,500,NULL,'2001-11-01',100),(41,9,1,500,NULL,'2001-11-01',100),(42,10,1,500,NULL,'2001-11-01',100),(43,11,1,400,NULL,'2001-11-01',100),(44,1,2,200,100,'2001-11-01',70);
/*!40000 ALTER TABLE `price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `pid` int NOT NULL AUTO_INCREMENT,
  `pname` varchar(45) NOT NULL,
  `price` double NOT NULL,
  `pdetails` varchar(45) DEFAULT NULL,
  `new` varchar(45) DEFAULT 'NO',
  `category` varchar(45) NOT NULL,
  `Deleted` int DEFAULT NULL,
  `rating` double NOT NULL DEFAULT '0',
  `no_of_ppl` int NOT NULL DEFAULT '0',
  `rid` int DEFAULT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Men\'s short',200,'qwe','1','clothing',0,0,0,NULL),(2,'Mens\'s top',400,'qwe',NULL,'clothing',0,0,0,NULL),(3,'Women\'s top',400,'qwe','1','clothing',0,0,0,NULL),(4,'Grey swetshirt',500,'qwe','1','clothing',0,0,0,NULL),(5,'White Cushion',500,'soft cotten made',NULL,'homedecor',0,0,0,NULL),(6,'Purple Cushion',500,'beautiful and useful',NULL,'homedecor',0,0,0,NULL),(7,'Watch 1',500,NULL,'1','watches',0,0,0,NULL),(8,'Watch 2',500,NULL,NULL,'watches',0,0,0,NULL),(9,'Green Apple',500,NULL,NULL,'pantry',0,0,0,NULL),(10,'Pantry 1',500,NULL,'1','pantry',0,0,0,NULL),(11,'Pantry 3',500,NULL,NULL,'pantry',0,0,0,NULL);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pid` int NOT NULL,
  `uid` int NOT NULL,
  `comment` varchar(500) DEFAULT NULL,
  `rating` int DEFAULT NULL,
  `datetime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_comments_1_idx` (`pid`),
  KEY `fk_comments_2_idx` (`uid`),
  CONSTRAINT `fk_comments_1` FOREIGN KEY (`pid`) REFERENCES `products` (`pid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_comments_2` FOREIGN KEY (`uid`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (1,1,1,'1sdvfdvb',4,'2020-11-15 17:36:52');
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seller`
--

DROP TABLE IF EXISTS `seller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seller` (
  `vid` int NOT NULL AUTO_INCREMENT,
  `seller_name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  `join_date` date NOT NULL,
  `streetname` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `state` varchar(45) NOT NULL,
  `pincode` int NOT NULL,
  `Deleted` int DEFAULT '0',
  `password` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`vid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seller`
--

LOCK TABLES `seller` WRITE;
/*!40000 ALTER TABLE `seller` DISABLE KEYS */;
INSERT INTO `seller` VALUES (1,'Sruthi','cse190001051@iiti.ac.in','glkdfjgrdoi','2001-11-01','djsoif','jfsdoif','fdldkasjfi',43,0,'19285house'),(2,'veromoda','riaverma135@gmailipfjerfop.com','fjerjo;igeroij','2001-11-01','vjsdo;ij','jcasiojc','jcasoijf',425,0,'19285house');
/*!40000 ALTER TABLE `seller` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(250) NOT NULL,
  `join_date` date NOT NULL,
  `Deleted` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='contains information of users registered';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Ria','cse190001051@irrlkdngo','19285house','2001-11-02',NULL),(20,'Ria','riaverma1302@gmail.com','19285house','2020-11-14',NULL),(31,'Ria','cse190001051@iiti.ac.in','19285house','2020-11-17',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-18 12:13:08
