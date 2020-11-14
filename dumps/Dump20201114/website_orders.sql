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
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `order_id_UNIQUE` (`order_id`),
  KEY `fk_orders_1_idx` (`user_id`),
  KEY `fk_orders_2_idx` (`pro_id`),
  KEY `fk_orders_3_idx` (`vid`),
  CONSTRAINT `fk_orders_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_orders_2` FOREIGN KEY (`pro_id`) REFERENCES `rating` (`pid`),
  CONSTRAINT `fk_orders_3` FOREIGN KEY (`vid`) REFERENCES `seller` (`vid`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (7,1,3,4,344,'2020-11-07 16:25:09','Not Delivered',1),(8,1,1,1,200,'2020-11-07 17:41:11','Not Delivered',1),(9,1,1,1,200,'2020-11-10 22:49:41','Not Delivered',1),(10,1,1,1,200,'2020-11-11 22:56:05','Not Delivered',1),(11,1,1,1,200,'2020-11-13 09:29:19','Not Delivered',NULL),(12,1,1,1,200,'2020-11-13 22:54:19','Not Delivered',NULL),(13,1,1,1,200,'2020-11-13 23:14:39','Not Delivered',NULL),(14,1,1,1,200,'2020-11-13 23:15:11','Not Delivered',NULL),(15,1,1,1,200,'2020-11-14 10:11:55','Not Delivered',1),(16,1,1,1,200,'2020-11-14 10:21:14','Not Delivered',1),(17,1,1,1,200,'2020-11-14 10:21:31','Not Delivered',1);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-14 13:24:32
