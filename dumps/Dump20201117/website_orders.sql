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
  `did` int DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `order_id_UNIQUE` (`order_id`),
  KEY `fk_orders_1_idx` (`user_id`),
  KEY `fk_orders_2_idx` (`pro_id`),
  KEY `fk_orders_3_idx` (`vid`),
  KEY `fk_orders_4_idx` (`did`),
  CONSTRAINT `fk_orders_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_orders_2` FOREIGN KEY (`pro_id`) REFERENCES `rating` (`pid`),
  CONSTRAINT `fk_orders_3` FOREIGN KEY (`vid`) REFERENCES `seller` (`vid`),
  CONSTRAINT `fk_orders_4` FOREIGN KEY (`did`) REFERENCES `order_details` (`did`)
) ENGINE=InnoDB AUTO_INCREMENT=176 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (7,1,3,4,344,'2020-11-07 16:25:09','Delivered',1,NULL),(8,1,1,1,200,'2020-11-07 17:41:11','Delivered',1,NULL),(9,1,1,1,200,'2020-11-10 22:49:41','Delivered',1,NULL),(10,1,1,1,200,'2020-11-11 22:56:05','Delivered',1,NULL),(11,1,1,1,200,'2020-11-13 09:29:19','Not Delivered',NULL,NULL),(12,1,1,1,200,'2020-11-13 22:54:19','Not Delivered',NULL,NULL),(13,1,1,1,200,'2020-11-13 23:14:39','Not Delivered',NULL,NULL),(14,1,1,1,200,'2020-11-13 23:15:11','Not Delivered',NULL,NULL),(15,1,1,1,200,'2020-11-14 10:11:55','Delivered',1,NULL),(16,1,1,1,200,'2020-11-14 10:21:14','Delivered',1,NULL),(17,1,1,1,200,'2020-11-14 10:21:31','Delivered',1,NULL),(18,1,2,3,400,'2020-11-15 01:07:57','Not Delivered',1,NULL),(19,1,6,1,500,'2020-11-15 01:07:57','Not Delivered',1,NULL),(20,1,2,3,400,'2020-11-15 01:09:40','Not Delivered',1,NULL),(21,1,6,1,500,'2020-11-15 01:09:40','Not Delivered',1,NULL),(22,1,2,3,400,'2020-11-15 01:20:56','Not Delivered',1,NULL),(23,1,6,1,500,'2020-11-15 01:20:56','Not Delivered',1,NULL),(24,1,2,3,400,'2020-11-15 01:25:11','Not Delivered',1,7),(25,1,6,1,500,'2020-11-15 01:25:11','Not Delivered',1,7),(26,1,2,3,400,'2020-11-15 07:02:53','Not Delivered',1,9),(27,1,6,1,500,'2020-11-15 07:02:53','Not Delivered',1,9),(28,1,2,3,400,'2020-11-15 07:06:05','Not Delivered',1,9),(29,1,6,1,500,'2020-11-15 07:06:05','Not Delivered',1,9),(30,1,2,3,400,'2020-11-15 07:06:48','Not Delivered',1,9),(31,1,6,1,500,'2020-11-15 07:06:48','Not Delivered',1,9),(32,1,2,3,400,'2020-11-15 07:07:16','Not Delivered',1,9),(33,1,6,1,500,'2020-11-15 07:07:16','Not Delivered',1,9),(34,1,2,3,400,'2020-11-15 07:07:51','Not Delivered',1,9),(35,1,6,1,500,'2020-11-15 07:07:51','Not Delivered',1,9),(36,1,2,3,400,'2020-11-15 07:08:01','Not Delivered',1,10),(37,1,6,1,500,'2020-11-15 07:08:01','Not Delivered',1,10),(38,1,2,3,400,'2020-11-15 07:08:28','Not Delivered',1,10),(39,1,6,1,500,'2020-11-15 07:08:28','Not Delivered',1,10),(40,1,2,3,400,'2020-11-15 07:08:40','Not Delivered',1,10),(41,1,6,1,500,'2020-11-15 07:08:40','Not Delivered',1,10),(42,1,2,3,400,'2020-11-15 08:04:15','Not Delivered',1,10),(43,1,6,1,500,'2020-11-15 08:04:15','Not Delivered',1,10),(44,1,2,3,400,'2020-11-15 08:05:19','Not Delivered',1,10),(45,1,6,1,500,'2020-11-15 08:05:19','Not Delivered',1,10),(46,1,2,3,400,'2020-11-15 08:05:54','Not Delivered',1,10),(47,1,6,1,500,'2020-11-15 08:05:54','Not Delivered',1,10),(48,1,2,3,400,'2020-11-15 08:11:59','Not Delivered',1,10),(49,1,6,1,500,'2020-11-15 08:11:59','Not Delivered',1,10),(50,1,2,3,400,'2020-11-15 08:12:26','Not Delivered',1,10),(51,1,6,1,500,'2020-11-15 08:12:26','Not Delivered',1,10),(52,1,2,3,400,'2020-11-15 08:13:38','Not Delivered',1,10),(53,1,6,1,500,'2020-11-15 08:13:38','Not Delivered',1,10),(54,1,2,3,400,'2020-11-15 08:14:21','Not Delivered',1,10),(55,1,6,1,500,'2020-11-15 08:14:21','Not Delivered',1,10),(56,1,2,3,400,'2020-11-15 08:15:06','Not Delivered',1,10),(57,1,6,1,500,'2020-11-15 08:15:06','Not Delivered',1,10),(58,1,2,3,400,'2020-11-15 08:15:42','Not Delivered',1,10),(59,1,6,1,500,'2020-11-15 08:15:42','Not Delivered',1,10),(60,1,2,3,400,'2020-11-15 08:16:03','Not Delivered',1,10),(61,1,6,1,500,'2020-11-15 08:16:03','Not Delivered',1,10),(62,1,2,3,400,'2020-11-15 08:16:17','Not Delivered',1,10),(63,1,6,1,500,'2020-11-15 08:16:17','Not Delivered',1,10),(64,1,2,3,400,'2020-11-15 08:16:34','Not Delivered',1,10),(65,1,6,1,500,'2020-11-15 08:16:34','Not Delivered',1,10),(66,1,2,3,400,'2020-11-15 08:17:09','Not Delivered',1,10),(67,1,6,1,500,'2020-11-15 08:17:09','Not Delivered',1,10),(68,1,2,3,400,'2020-11-15 08:17:27','Not Delivered',1,10),(69,1,6,1,500,'2020-11-15 08:17:27','Not Delivered',1,10),(70,1,2,3,400,'2020-11-15 08:17:48','Not Delivered',1,10),(71,1,6,1,500,'2020-11-15 08:17:48','Not Delivered',1,10),(72,1,2,3,400,'2020-11-15 08:17:59','Not Delivered',1,10),(73,1,6,1,500,'2020-11-15 08:17:59','Not Delivered',1,10),(74,1,2,3,400,'2020-11-15 08:18:19','Not Delivered',1,10),(75,1,6,1,500,'2020-11-15 08:18:19','Not Delivered',1,10),(76,1,2,3,400,'2020-11-15 08:18:39','Not Delivered',1,10),(77,1,6,1,500,'2020-11-15 08:18:39','Not Delivered',1,10),(78,1,2,3,400,'2020-11-15 08:20:21','Not Delivered',1,10),(79,1,6,1,500,'2020-11-15 08:20:21','Not Delivered',1,10),(80,1,2,3,400,'2020-11-15 08:20:51','Not Delivered',1,10),(81,1,6,1,500,'2020-11-15 08:20:51','Not Delivered',1,10),(82,1,2,3,400,'2020-11-15 08:21:24','Not Delivered',1,10),(83,1,6,1,500,'2020-11-15 08:21:24','Not Delivered',1,10),(84,1,2,3,400,'2020-11-15 08:21:31','Not Delivered',1,10),(85,1,6,1,500,'2020-11-15 08:21:31','Not Delivered',1,10),(86,1,2,3,400,'2020-11-15 08:22:51','Not Delivered',1,10),(87,1,6,1,500,'2020-11-15 08:22:51','Not Delivered',1,10),(88,1,2,3,400,'2020-11-15 08:26:18','Not Delivered',1,10),(89,1,6,1,500,'2020-11-15 08:26:18','Not Delivered',1,10),(90,1,2,3,400,'2020-11-15 08:27:22','Not Delivered',1,10),(91,1,6,1,500,'2020-11-15 08:27:22','Not Delivered',1,10),(92,1,2,3,400,'2020-11-15 08:29:12','Not Delivered',1,10),(93,1,6,1,500,'2020-11-15 08:29:12','Not Delivered',1,10),(94,1,2,3,400,'2020-11-15 08:29:19','Not Delivered',1,10),(95,1,6,1,500,'2020-11-15 08:29:19','Not Delivered',1,10),(96,1,2,3,400,'2020-11-15 08:29:31','Not Delivered',1,10),(97,1,6,1,500,'2020-11-15 08:29:31','Not Delivered',1,10),(98,1,2,3,400,'2020-11-15 08:29:37','Not Delivered',1,10),(99,1,6,1,500,'2020-11-15 08:29:37','Not Delivered',1,10),(100,1,2,3,400,'2020-11-15 08:30:32','Not Delivered',1,10),(101,1,6,1,500,'2020-11-15 08:30:32','Not Delivered',1,10),(102,1,2,3,400,'2020-11-15 08:43:06','Not Delivered',1,10),(103,1,6,1,500,'2020-11-15 08:43:06','Not Delivered',1,10),(104,1,2,3,400,'2020-11-15 08:43:33','Not Delivered',1,10),(105,1,6,1,500,'2020-11-15 08:43:33','Not Delivered',1,10),(106,1,2,3,400,'2020-11-15 08:45:48','Not Delivered',1,10),(107,1,6,1,500,'2020-11-15 08:45:48','Not Delivered',1,10),(108,1,2,3,400,'2020-11-15 08:45:57','Not Delivered',1,10),(109,1,6,1,500,'2020-11-15 08:45:57','Not Delivered',1,10),(110,1,2,3,400,'2020-11-15 08:46:47','Not Delivered',1,10),(111,1,6,1,500,'2020-11-15 08:46:47','Not Delivered',1,10),(112,1,2,3,400,'2020-11-15 08:46:59','Not Delivered',1,10),(113,1,6,1,500,'2020-11-15 08:46:59','Not Delivered',1,10),(114,1,2,3,400,'2020-11-15 08:48:17','Not Delivered',1,10),(115,1,6,1,500,'2020-11-15 08:48:17','Not Delivered',1,10),(116,1,2,3,400,'2020-11-15 08:49:25','Not Delivered',1,10),(117,1,6,1,500,'2020-11-15 08:49:25','Not Delivered',1,10),(118,1,2,3,400,'2020-11-15 08:49:34','Not Delivered',1,10),(119,1,6,1,500,'2020-11-15 08:49:34','Not Delivered',1,10),(120,1,2,3,400,'2020-11-15 09:31:51','Not Delivered',1,11),(121,1,6,1,500,'2020-11-15 09:31:51','Not Delivered',1,11),(122,1,6,1,500,'2020-11-15 09:33:53','Not Delivered',1,12),(123,1,6,1,500,'2020-11-15 09:42:16','Not Delivered',1,12),(124,1,2,3,400,'2020-11-15 09:43:54','Not Delivered',1,13),(125,1,6,1,500,'2020-11-15 09:43:54','Not Delivered',1,13),(126,1,2,3,400,'2020-11-15 09:44:10','Not Delivered',1,13),(127,1,6,1,500,'2020-11-15 09:44:10','Not Delivered',1,13),(128,1,2,7,400,'2020-11-15 15:35:50','Not Delivered',1,14),(129,1,6,1,500,'2020-11-15 15:35:50','Not Delivered',1,14),(130,1,2,7,400,'2020-11-15 17:15:58','Not Delivered',1,15),(131,1,6,1,500,'2020-11-15 17:15:58','Not Delivered',1,15),(132,1,1,6,200,'2020-11-15 17:15:58','Not Delivered',2,15),(133,1,2,7,400,'2020-11-16 08:02:52','Not Delivered',1,16),(134,1,6,1,500,'2020-11-16 08:02:52','Not Delivered',1,16),(135,1,1,6,200,'2020-11-16 08:02:52','Not Delivered',2,16),(136,1,2,7,400,'2020-11-16 08:04:15','Not Delivered',1,17),(137,1,6,1,500,'2020-11-16 08:04:15','Not Delivered',1,17),(138,1,1,6,200,'2020-11-16 08:04:15','Not Delivered',2,17),(139,1,2,7,400,'2020-11-16 08:04:21','Not Delivered',1,18),(140,1,6,1,500,'2020-11-16 08:04:21','Not Delivered',1,18),(141,1,1,6,200,'2020-11-16 08:04:21','Not Delivered',2,18),(142,1,2,7,400,'2020-11-16 08:04:42','Not Delivered',1,19),(143,1,6,1,500,'2020-11-16 08:04:42','Not Delivered',1,19),(144,1,1,6,200,'2020-11-16 08:04:42','Not Delivered',2,19),(145,1,2,7,400,'2020-11-16 08:10:30','Not Delivered',1,20),(146,1,6,1,500,'2020-11-16 08:10:30','Not Delivered',1,20),(147,1,1,6,200,'2020-11-16 08:10:30','Not Delivered',2,20),(148,1,2,7,400,'2020-11-16 08:51:53','Not Delivered',1,21),(149,1,6,1,500,'2020-11-16 08:51:53','Not Delivered',1,21),(150,1,1,6,200,'2020-11-16 08:51:53','Not Delivered',2,21),(151,1,2,7,400,'2020-11-16 16:06:44','Not Delivered',1,22),(152,1,6,1,500,'2020-11-16 16:06:44','Not Delivered',1,22),(153,1,1,6,200,'2020-11-16 16:06:44','Not Delivered',2,22),(154,1,1,3,200,'2020-11-16 16:06:44','Not Delivered',1,22),(155,1,6,1,500,'2020-11-16 16:56:40','Not Delivered',1,23),(156,1,1,6,200,'2020-11-16 16:56:40','Not Delivered',2,23),(157,1,1,5,200,'2020-11-16 16:56:40','Not Delivered',1,23),(158,1,2,4,400,'2020-11-16 16:56:40','Not Delivered',1,23),(159,1,6,1,500,'2020-11-16 17:00:29','Not Delivered',1,24),(160,1,1,7,200,'2020-11-16 17:00:29','Not Delivered',2,24),(161,1,1,5,200,'2020-11-16 17:00:29','Not Delivered',1,24),(162,1,2,4,400,'2020-11-16 17:00:29','Not Delivered',1,24),(163,1,6,1,500,'2020-11-16 17:03:21','Not Delivered',1,24),(164,1,1,7,200,'2020-11-16 17:03:21','Not Delivered',2,24),(165,1,1,5,200,'2020-11-16 17:03:21','Not Delivered',1,24),(166,1,2,4,400,'2020-11-16 17:03:21','Not Delivered',1,24),(167,1,2,4,400,'2020-11-16 17:03:27','Not Delivered',1,25),(168,1,6,1,500,'2020-11-17 06:36:16','Not Delivered',1,26),(169,1,1,12,200,'2020-11-17 06:36:16','Not Delivered',2,26),(170,1,1,5,200,'2020-11-17 06:36:16','Not Delivered',1,26),(171,1,2,6,400,'2020-11-17 06:36:16','Not Delivered',1,26),(172,1,6,1,500,'2020-11-17 06:39:41','Not Delivered',1,27),(173,1,1,12,200,'2020-11-17 06:39:41','Not Delivered',2,27),(174,1,1,5,200,'2020-11-17 06:39:41','Not Delivered',1,27),(175,1,2,6,400,'2020-11-17 06:39:41','Not Delivered',1,27);
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

-- Dump completed on 2020-11-17  7:51:23
