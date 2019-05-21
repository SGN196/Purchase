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
-- Table structure for table `material_info`
--

DROP TABLE IF EXISTS `material_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `material_info` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `material_name` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `material_quantity` int(11) DEFAULT NULL,
  `material_unit` varchar(10) CHARACTER SET ucs2 DEFAULT NULL,
  `material_info` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `category_level1` int(11) DEFAULT NULL,
  `category_level2` int(11) DEFAULT NULL,
  `category_level3` int(11) DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_by` int(11) DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=armscii8 COLLATE=armscii8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material_info`
--

LOCK TABLES `material_info` WRITE;
/*!40000 ALTER TABLE `material_info` DISABLE KEYS */;
INSERT INTO `material_info` VALUES (1,'小米手机4',441,'个','小米公司发布的第四代小米手机',6,25,NULL,NULL,NULL,NULL,NULL),(19,'三鹿奶粉',234,'袋','三聚氰胺11',5,42,NULL,NULL,NULL,NULL,NULL),(20,'三星note7',5215,'个','爆炸7',6,25,NULL,NULL,NULL,NULL,NULL),(21,'维多利亚的秘密',4234,'套','一个时尚品牌',1,21,NULL,NULL,NULL,NULL,NULL),(22,'奥康皮鞋',131,'双','奥康皮鞋的简介',1,54,NULL,NULL,NULL,NULL,NULL),(23,'国家地理',2323423,'本','这是教育图书类',7,38,NULL,NULL,NULL,NULL,NULL),(24,'森海塞尔IE800',0,'条','森海塞尔高端耳机',6,27,NULL,NULL,NULL,NULL,NULL),(25,'Bose',0,'个','一个外国的耳机、音响品牌',7,36,NULL,NULL,NULL,NULL,NULL),(26,'西门子电冰箱',706,'个','西门子的双开门电冰箱',2,14,NULL,NULL,NULL,NULL,'2019-05-13 00:00:00'),(27,'罗技鼠标G303',0,'个','罗技鼠标，中端信号，性价比较高。',3,29,NULL,NULL,NULL,NULL,NULL),(32,'海飞丝去屑洗发水',0,'瓶','无硅油，去屑',4,18,NULL,NULL,NULL,NULL,NULL),(33,'格力无氟变频',0,'台','买手机送空调',2,24,NULL,NULL,NULL,NULL,NULL),(34,'小米滑板车',0,'辆','婴幼儿的童年玩具',5,44,NULL,NULL,NULL,NULL,NULL),(39,'周大福金项链',0,'条',NULL,1,22,NULL,NULL,NULL,NULL,NULL),(40,'拨浪鼓',0,'个',NULL,5,45,NULL,1,'2019-03-27 00:00:00',NULL,NULL),(41,'TCL55寸电视',0,'台','1',2,23,NULL,1,'2019-05-05 00:00:00',NULL,NULL),(42,'婴儿车',0,'部','1',5,44,NULL,1,'2019-05-05 00:00:00',NULL,NULL),(43,'kindle',0,'台','2',7,39,NULL,1,'2019-05-05 00:00:00',NULL,NULL),(44,'dell 游侠G2',0,'台','1',3,17,NULL,1,'2019-05-05 00:00:00',NULL,NULL),(45,'AKG 240s',0,'个','1',6,27,NULL,1,'2019-05-05 00:00:00',NULL,NULL),(46,'格力空调',0,'个','·1',2,24,NULL,1,'2019-05-05 00:00:00',NULL,NULL),(47,'项链1号',0,'条',NULL,1,22,NULL,1,'2019-05-05 00:00:00',NULL,NULL),(48,'鳄鱼皮鞋',0,'双',NULL,1,54,NULL,1,'2019-05-05 00:00:00',NULL,NULL),(49,'小米电动牙刷',0,'只','小米智能产品',4,20,NULL,5,'2019-05-18 00:00:00',NULL,NULL);
/*!40000 ALTER TABLE `material_info` ENABLE KEYS */;
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
