-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: materialinfodb
-- ------------------------------------------------------
-- Server version	5.7.21-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bid_info`
--

DROP TABLE IF EXISTS `bid_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bid_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quote_id` int(11) DEFAULT NULL,
  `bid_total_price` double DEFAULT NULL,
  `bid_status` int(11) DEFAULT NULL,
  `time_deliver` datetime DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_by` int(11) DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bid_info`
--

LOCK TABLES `bid_info` WRITE;
/*!40000 ALTER TABLE `bid_info` DISABLE KEYS */;
INSERT INTO `bid_info` VALUES (1,1,2342423,66,'2019-03-22 00:00:00',1,'2019-03-20 22:41:03',NULL,NULL),(2,2,3333,0,'2019-03-29 00:00:00',1,'2019-03-22 22:34:52',NULL,NULL),(3,2,4535345,66,'2019-03-19 00:00:00',1,'2019-03-23 09:41:51',NULL,NULL),(4,3,3333,0,'2019-05-ss.txt 00:00:00',1,'2019-05-03 00:00:00',NULL,NULL),(5,3,32424,0,'2019-05-07 00:00:00',1,'2019-05-07 00:00:00',NULL,NULL),(6,3,223432,0,'2019-03-19 00:00:00',1,'2019-05-07 00:00:00',NULL,NULL),(7,3,1111,66,'2019-03-21 00:00:00',1,'2019-05-07 00:00:00',NULL,NULL),(8,2,12321,0,'2019-03-19 00:00:00',1,'2019-05-ss.txt 00:00:00',NULL,NULL),(9,2,333,0,'2019-03-22 00:00:00',1,'2019-05-ss.txt 00:00:00',NULL,NULL),(10,4,666666,66,'2019-05-ss.txt 00:00:00',1,'2019-05-13 00:00:00',NULL,NULL),(11,4,444444,0,'2019-06-01 00:00:00',1,'2019-05-13 00:00:00',NULL,NULL),(12,4,222,0,'2019-05-ss.txt 00:00:00',1,'2019-05-13 00:00:00',NULL,NULL),(13,7,5000000,1,'2019-05-ss.txt 00:00:00',1,'2019-05-18 00:00:00',NULL,NULL),(14,10,10000,1,'2019-05-31 00:00:00',2,'2019-05-18 00:00:00',NULL,NULL),(15,12,20000,1,'2019-06-01 00:00:00',2,'2019-05-18 00:00:00',NULL,NULL),(16,9,2000,1,'2019-05-31 00:00:00',2,'2019-05-18 00:00:00',NULL,NULL);
/*!40000 ALTER TABLE `bid_info` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-21 22:48:59
