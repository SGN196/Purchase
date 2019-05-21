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
-- Table structure for table `data_dictionary`
--

DROP TABLE IF EXISTS `data_dictionary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_dictionary` (
  `id` int(11) unsigned NOT NULL,
  `type_code` varchar(50) DEFAULT NULL,
  `type_name` varchar(50) DEFAULT NULL,
  `value_id` int(11) DEFAULT NULL,
  `value_name` varchar(50) DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_by` int(11) DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_dictionary`
--

LOCK TABLES `data_dictionary` WRITE;
/*!40000 ALTER TABLE `data_dictionary` DISABLE KEYS */;
INSERT INTO `data_dictionary` VALUES (1,'DEPARTMENT','部门名称',1,'超级管理员',NULL,NULL,NULL,NULL),(2,'DEPARTMENT','部门名称',2,'总经理办公室',NULL,NULL,NULL,NULL),(3,'DEPARTMENT','部门名称',3,'行政部',NULL,NULL,NULL,NULL),(4,'DEPARTMENT','部门名称',4,'人力部',NULL,NULL,NULL,NULL),(5,'DEPARTMENT','部门名称',5,'财务部',NULL,NULL,NULL,NULL),(6,'DEPARTMENT','部门名称',6,'生产技术部',NULL,NULL,NULL,NULL),(7,'DEPARTMENT','部门名称',7,'计划营销部',NULL,NULL,NULL,NULL),(8,'DEPARTMENT','部门名称',8,'安全监察部',NULL,NULL,NULL,NULL),(9,'DEPARTMENT','部门名称',9,'仓库管理部',NULL,NULL,NULL,NULL),(10,'QUOTE_INFO','采购需求',1,'未确认',NULL,NULL,NULL,NULL),(11,'QUOTE_INFO','采购需求',2,'采购中',NULL,NULL,NULL,NULL),(12,'QUOTE_INFO','采购需求',3,'采购完成',NULL,NULL,NULL,NULL),(13,'ORDER_STATUS','订单状态',1,'订单提交',NULL,NULL,NULL,NULL),(14,'ORDER_STATUS','订单状态',2,'交易完成',NULL,NULL,NULL,NULL),(15,'BID_STATUS','竞价状态',1,'进行中',NULL,NULL,NULL,NULL),(16,'BID_STATUS','竞价状态',2,'已结束',NULL,NULL,NULL,NULL),(17,'OUT_REPOSITY','出库状态',0,'待审核',NULL,NULL,NULL,NULL),(18,'OUT_REPOSITY','出库状态',1,'审核通过',NULL,NULL,NULL,NULL),(19,'OUT_REPOSITY','出库状态',2,'审核失败',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `data_dictionary` ENABLE KEYS */;
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
