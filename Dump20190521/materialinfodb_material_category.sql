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
-- Table structure for table `material_category`
--

DROP TABLE IF EXISTS `material_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `material_category` (
  `id` int(11) unsigned NOT NULL,
  `category_code` varchar(20) DEFAULT NULL,
  `category_name` varchar(20) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_by` int(11) DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material_category`
--

LOCK TABLES `material_category` WRITE;
/*!40000 ALTER TABLE `material_category` DISABLE KEYS */;
INSERT INTO `material_category` VALUES (1,'CATEGORY_001','服装鞋帽',NULL,1,NULL,NULL,NULL),(2,'CATEGORY_002','家用电器',NULL,1,NULL,NULL,NULL),(3,'CATEGORY_003','电脑办公',NULL,1,NULL,NULL,NULL),(4,'CATEGORY_004','清洁用品',NULL,1,NULL,NULL,NULL),(5,'CATEGORY_005','母婴玩具',NULL,1,NULL,NULL,NULL),(6,'CATEGORY_006','手机数码',NULL,1,NULL,NULL,NULL),(7,'CATEGORY_007','图书音像',NULL,1,NULL,NULL,NULL),(8,'CATEGORY_008','鞋靴箱包',NULL,1,NULL,NULL,NULL),(9,'CATEGORY_009','户外钟表',NULL,1,NULL,NULL,NULL),(10,'CATEGORY_010','食品烟酒',NULL,1,NULL,NULL,NULL),(11,'CATEGORY_001_01','男装',1,1,NULL,NULL,NULL),(12,'CATEGORY_001_02','女装',1,1,NULL,NULL,NULL),(13,'CATEGORY_001_03','童装',1,1,NULL,NULL,NULL),(14,'CATEGORY_002_01','冰箱',2,1,NULL,NULL,NULL),(15,'CATEGORY_002_02','洗衣机',2,1,NULL,NULL,NULL),(16,'CATEGORY_003_01','笔记本',3,1,NULL,NULL,NULL),(17,'CATEGORY_003_02','游戏本',3,1,NULL,NULL,NULL),(18,'CATEGORY_004_01','洗发',4,1,NULL,NULL,NULL),(19,'CATEGORY_004_02','护肤',4,1,NULL,NULL,NULL),(20,'CATEGORY_004_03','牙膏牙刷',4,1,NULL,NULL,NULL),(21,'CATEGORY_001_04','内衣',1,1,NULL,NULL,NULL),(22,'CATEGORY_001_05','配饰',1,1,NULL,NULL,NULL),(23,'CATEGORY_002_03','电视',2,1,NULL,NULL,NULL),(24,'CATEGORY_002_04','空调',2,1,NULL,NULL,NULL),(25,'CATEGORY_006_01','手机',6,1,NULL,NULL,NULL),(26,'CATEGORY_006_02','数码相机',6,1,NULL,NULL,NULL),(27,'CATEGORY_006_03','耳机',6,1,NULL,NULL,NULL),(28,'CATEGORY_003_03','显示器',3,1,NULL,NULL,NULL),(29,'CATEGORY_003_04','鼠标',3,1,NULL,NULL,NULL),(30,'CATEGORY_003_05','键盘',3,1,NULL,NULL,NULL),(31,'CATEGORY_003_06','路由器',3,1,NULL,NULL,NULL),(32,'CATEGORY_003_07','平板电脑',3,1,NULL,NULL,NULL),(33,'CATEGORY_008_01','时尚女鞋',8,1,NULL,NULL,NULL),(34,'CATEGORY_008_02','流行男鞋',8,1,NULL,NULL,NULL),(35,'CATEGORY_008_03','箱包',8,1,NULL,NULL,NULL),(36,'CATEGORY_007_01','音箱',7,1,NULL,NULL,NULL),(37,'CATEGORY_007_02','教材',7,1,NULL,NULL,NULL),(38,'CATEGORY_007_03','杂志',7,1,NULL,NULL,NULL),(39,'CATEGORY_007_04','电子书',7,1,NULL,NULL,NULL),(40,'CATEGORY_007_05','科学纪录片',7,1,NULL,NULL,NULL),(41,'CATEGORY_006_04','游戏机',6,1,NULL,NULL,NULL),(42,'CATEGORY_005_01','奶粉',5,1,NULL,NULL,NULL),(43,'CATEGORY_005_02','玩具',5,1,NULL,NULL,NULL),(44,'CATEGORY_005_03','婴儿车',5,1,NULL,NULL,NULL),(45,'CATEGORY_005_04','乐器',5,1,NULL,NULL,NULL),(46,'CATEGORY_009_01','跑步机',9,1,NULL,NULL,NULL),(47,'CATEGORY_009_02','钟表',9,1,NULL,NULL,NULL),(48,'CATEGORY_009_03','球类',9,1,NULL,NULL,NULL),(49,'CATEGORY_009_04','乐器',9,1,NULL,NULL,NULL),(50,'CATEGORY_009_05','钓鱼用品',9,1,NULL,NULL,NULL),(51,'CATEGORY_010_01','水果',10,1,NULL,NULL,NULL),(52,'CATEGORY_010_02','中外名酒',10,1,NULL,NULL,NULL),(53,'CATEGORY_010_03','茶类',10,1,NULL,NULL,NULL),(54,'CATEGORY_001_06','鞋子',1,1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `material_category` ENABLE KEYS */;
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
