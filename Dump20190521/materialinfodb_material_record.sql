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
-- Table structure for table `material_record`
--

DROP TABLE IF EXISTS `material_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `material_record` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `material_id` int(11) DEFAULT NULL,
  `material_num` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `use_reason` varchar(200) DEFAULT NULL,
  `refuse_reason` varchar(255) DEFAULT NULL,
  `record_status` int(11) DEFAULT NULL,
  `manager_id` int(11) DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_by` int(11) DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material_record`
--

LOCK TABLES `material_record` WRITE;
/*!40000 ALTER TABLE `material_record` DISABLE KEYS */;
INSERT INTO `material_record` VALUES (4,20,222,1,'非第三方',NULL,1,1,1,'2019-03-13 23:31:33',NULL,'2019-03-29 00:00:00'),(9,20,13,1,'威锋网',NULL,2,NULL,1,'2019-03-15 13:37:44',NULL,NULL),(10,20,16,1,'研究院',NULL,0,1,1,'2019-03-15 13:37:44',NULL,NULL),(11,20,19,1,'问问',NULL,1,1,1,'2019-03-15 13:37:44',NULL,'2019-05-ss.txt 00:00:00'),(12,19,55555555,1,'头太小',NULL,2,1,1,'2019-03-16 21:19:29',NULL,NULL),(13,26,1,1,'',NULL,1,1,1,'2019-03-16 23:48:50',NULL,'2019-03-17 00:00:00'),(14,32,1,1,'',NULL,0,NULL,1,'2019-03-17 17:ss.txt:ss.txt',NULL,NULL),(15,26,333,1,'',NULL,0,NULL,1,'2019-05-05 00:00:00',NULL,NULL),(16,23,1111111,1,'测试库存不足1',NULL,1,1,1,'2019-05-ss.txt 00:00:00',NULL,'2019-05-ss.txt 00:00:00'),(17,49,1,1,'',NULL,0,NULL,1,'2019-05-ss.txt 00:00:00',NULL,NULL),(18,1,111,1,'',NULL,1,1,1,'2019-05-ss.txt 00:00:00',NULL,'2019-05-ss.txt 00:00:00'),(19,27,10,5,'部门需要鼠标',NULL,0,NULL,5,'2019-05-18 00:00:00',NULL,NULL);
/*!40000 ALTER TABLE `material_record` ENABLE KEYS */;
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
