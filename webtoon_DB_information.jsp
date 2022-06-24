-- MariaDB dump 10.19  Distrib 10.7.3-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: webtoon
-- ------------------------------------------------------
-- Server version	10.7.3-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bmw`
--

DROP TABLE IF EXISTS `bmw`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bmw` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `title` char(41) NOT NULL,
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bmw`
--

LOCK TABLES `bmw` WRITE;
/*!40000 ALTER TABLE `bmw` DISABLE KEYS */;
INSERT INTO `bmw` VALUES
(1,'redsun'),
(2,'webtoon'),
(3,'title3');
/*!40000 ALTER TABLE `bmw` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL DEFAULT '0',
  `id` varchar(40) NOT NULL DEFAULT '0',
  `pwd` text NOT NULL,
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES
(1,'Admin','admin','1234'),
(13,'simhyunmin','jpsim7402','1945'),
(14,'hyunsu','jpsim1234','1123'),
(15,'yujin','junh00098','1545'),
(16,'itp','uuh112','1945'),
(17,'1234','aaaa','1945'),
(18,'사용자1','aaaa','1234');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `redsun`
--

DROP TABLE IF EXISTS `redsun`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `redsun` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `episode` int(11) NOT NULL,
  `title` varchar(40) NOT NULL,
  `date` text DEFAULT NULL,
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `redsun`
--

LOCK TABLES `redsun` WRITE;
/*!40000 ALTER TABLE `redsun` DISABLE KEYS */;
INSERT INTO `redsun` VALUES
(1,1,'title1','2019-01-11'),
(16,2,'title2','2022-06-05');
/*!40000 ALTER TABLE `redsun` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `title3`
--

DROP TABLE IF EXISTS `title3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `title3` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `episode` int(11) NOT NULL,
  `title` varchar(40) NOT NULL,
  `date` text DEFAULT NULL,
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `title3`
--

LOCK TABLES `title3` WRITE;
/*!40000 ALTER TABLE `title3` DISABLE KEYS */;
/*!40000 ALTER TABLE `title3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webtoon`
--

DROP TABLE IF EXISTS `webtoon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webtoon` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `episode` int(11) NOT NULL,
  `title` varchar(40) NOT NULL,
  `date` text DEFAULT NULL,
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webtoon`
--

LOCK TABLES `webtoon` WRITE;
/*!40000 ALTER TABLE `webtoon` DISABLE KEYS */;
INSERT INTO `webtoon` VALUES
(1,1,'title1','2022-06-13');
/*!40000 ALTER TABLE `webtoon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webtoonlist`
--

DROP TABLE IF EXISTS `webtoonlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webtoonlist` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `title` char(20) NOT NULL,
  `genre` char(20) NOT NULL,
  `summary` char(50) NOT NULL,
  `writer` char(15) NOT NULL,
  `memo` char(40) NOT NULL,
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webtoonlist`
--

LOCK TABLES `webtoonlist` WRITE;
/*!40000 ALTER TABLE `webtoonlist` DISABLE KEYS */;
INSERT INTO `webtoonlist` VALUES
(1,'redsun','action','Princess Rescuing Dramon from the Sea','redhyun','hello, my name is redhyu'),
(27,'webtoon','genre1','summary1','writer1','memo1'),
(38,'title3','genre3','summary3','writer3','memo3\r\n');
/*!40000 ALTER TABLE `webtoonlist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-18 23:16:28
