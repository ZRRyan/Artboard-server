-- MySQL dump 10.13  Distrib 5.7.12, for osx10.9 (x86_64)
--
-- Host: 127.0.0.1    Database: ArtBoard
-- ------------------------------------------------------
-- Server version	5.7.13

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
-- Table structure for table `T_Broadcast`
--

DROP TABLE IF EXISTS `T_Broadcast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_Broadcast` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  `latitude` float DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `T_Broadcast`
--

LOCK TABLES `T_Broadcast` WRITE;
/*!40000 ALTER TABLE `T_Broadcast` DISABLE KEYS */;
/*!40000 ALTER TABLE `T_Broadcast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `T_BroadcastLike`
--

DROP TABLE IF EXISTS `T_BroadcastLike`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_BroadcastLike` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `T_BroadcastLike`
--

LOCK TABLES `T_BroadcastLike` WRITE;
/*!40000 ALTER TABLE `T_BroadcastLike` DISABLE KEYS */;
/*!40000 ALTER TABLE `T_BroadcastLike` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `T_BroadcastMedia`
--

DROP TABLE IF EXISTS `T_BroadcastMedia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_BroadcastMedia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `broadcast_id` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `media_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `T_BroadcastMedia`
--

LOCK TABLES `T_BroadcastMedia` WRITE;
/*!40000 ALTER TABLE `T_BroadcastMedia` DISABLE KEYS */;
/*!40000 ALTER TABLE `T_BroadcastMedia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `T_Friend`
--

DROP TABLE IF EXISTS `T_Friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_Friend` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid1` int(11) DEFAULT NULL,
  `uid2` int(11) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `T_Friend`
--

LOCK TABLES `T_Friend` WRITE;
/*!40000 ALTER TABLE `T_Friend` DISABLE KEYS */;
/*!40000 ALTER TABLE `T_Friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `T_GroupChatUser`
--

DROP TABLE IF EXISTS `T_GroupChatUser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_GroupChatUser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `activity_id` varchar(50) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `T_GroupChatUser`
--

LOCK TABLES `T_GroupChatUser` WRITE;
/*!40000 ALTER TABLE `T_GroupChatUser` DISABLE KEYS */;
/*!40000 ALTER TABLE `T_GroupChatUser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `T_Picture`
--

DROP TABLE IF EXISTS `T_Picture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_Picture` (
  `picture_id` int(11) NOT NULL AUTO_INCREMENT,
  `thumbnail` varchar(200) DEFAULT NULL,
  `big_img` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`picture_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `T_Picture`
--

LOCK TABLES `T_Picture` WRITE;
/*!40000 ALTER TABLE `T_Picture` DISABLE KEYS */;
/*!40000 ALTER TABLE `T_Picture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `T_Position`
--

DROP TABLE IF EXISTS `T_Position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_Position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  `latitude` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `T_Position`
--

LOCK TABLES `T_Position` WRITE;
/*!40000 ALTER TABLE `T_Position` DISABLE KEYS */;
/*!40000 ALTER TABLE `T_Position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `T_User`
--

DROP TABLE IF EXISTS `T_User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_User` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `nickname` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `sex` int(11) DEFAULT NULL,
  `birthday` varchar(50) DEFAULT NULL,
  `signature` varchar(50) DEFAULT NULL,
  `avatar` varchar(50) DEFAULT NULL,
  `province_id` varchar(50) DEFAULT NULL,
  `city_id` varchar(50) DEFAULT NULL,
  `region_id` varchar(50) DEFAULT NULL,
  `add_time` datetime DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `T_User`
--

LOCK TABLES `T_User` WRITE;
/*!40000 ALTER TABLE `T_User` DISABLE KEYS */;
INSERT INTO `T_User` VALUES (1,NULL,'12343445','123456',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,NULL,'12343445','123456343434',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,NULL,'12343445','123456343434',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,NULL,'12343445','123456343434',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,NULL,'12343445','123456343434',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,NULL,'12343445','123456343434',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,NULL,'12343445','123456343434',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,NULL,'12343445','123456343434',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,NULL,'12343445','123456343434',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,NULL,'12343445','123456343434',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12,NULL,'12343445','123456343434',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(13,NULL,'12343445','123456343434',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,NULL,'12343445','123456343434',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(15,NULL,'12343445','123456343434',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16,NULL,'12343445','123456343434',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(17,NULL,'12323','13232',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(18,NULL,'12323','13232',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(19,NULL,'12323','13232',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(20,NULL,'12323','13232',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(21,NULL,'12323','13232',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(22,NULL,'12323','13232',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(23,NULL,'gEJRKBUEXOTouJFAXdrAdw==','123456343434',NULL,NULL,NULL,NULL,NULL,NULL,'0','0','0',NULL),(24,NULL,'gEJRKBUEXOTouJFAXdrAdw==','18322718633',NULL,NULL,NULL,NULL,NULL,NULL,'0','0','0','2016-09-25 10:41:59'),(25,NULL,'gEJRKBUEXOTouJFAXdrAdw==','1832271863',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-09-25 10:57:12');
/*!40000 ALTER TABLE `T_User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `T_UserActivity`
--

DROP TABLE IF EXISTS `T_UserActivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_UserActivity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `begin_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  `latitude` float DEFAULT NULL,
  `remark` varchar(50) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `T_UserActivity`
--

LOCK TABLES `T_UserActivity` WRITE;
/*!40000 ALTER TABLE `T_UserActivity` DISABLE KEYS */;
/*!40000 ALTER TABLE `T_UserActivity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `T_UserTag`
--

DROP TABLE IF EXISTS `T_UserTag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_UserTag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `tag` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `T_UserTag`
--

LOCK TABLES `T_UserTag` WRITE;
/*!40000 ALTER TABLE `T_UserTag` DISABLE KEYS */;
INSERT INTO `T_UserTag` VALUES (1,1,'[\"ÈÈ\"'),(2,1,'\"uu\"]'),(3,10,'123'),(4,10,'we'),(5,10,'uu'),(6,11,'123'),(7,11,'we'),(8,11,'uu'),(9,12,'123'),(10,12,'we'),(11,13,'123'),(12,13,'we'),(13,14,'123'),(14,14,'we');
/*!40000 ALTER TABLE `T_UserTag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `T_Video`
--

DROP TABLE IF EXISTS `T_Video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_Video` (
  `video_id` int(11) NOT NULL AUTO_INCREMENT,
  `thumbnail` varchar(200) DEFAULT NULL,
  `video_url` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`video_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `T_Video`
--

LOCK TABLES `T_Video` WRITE;
/*!40000 ALTER TABLE `T_Video` DISABLE KEYS */;
/*!40000 ALTER TABLE `T_Video` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-09-27  9:54:10
