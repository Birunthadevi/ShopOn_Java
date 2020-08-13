-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: shopon
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `catalog`
--

DROP TABLE IF EXISTS `catalog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog` (
  `id` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(20) DEFAULT NULL,
  `CODE` varchar(100) NOT NULL,
  `DEFAULT_CATALOG` bit(1) DEFAULT NULL,
  `SORT_ORDER` int DEFAULT NULL,
  `VISIBLE` bit(1) DEFAULT NULL,
  `MERCHANT_ID` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK32mubpubtaqu30n34bwl7xiis` (`MERCHANT_ID`,`CODE`),
  CONSTRAINT `FKranq0rweb0r6j31j565ak51g8` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `merchant_store` (`MERCHANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog`
--

LOCK TABLES `catalog` WRITE;
/*!40000 ALTER TABLE `catalog` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_entry`
--

DROP TABLE IF EXISTS `catalog_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_entry` (
  `id` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(20) DEFAULT NULL,
  `VISIBLE` bit(1) DEFAULT NULL,
  `CATALOG_ID` bigint NOT NULL,
  `CATEGORY_ID` bigint NOT NULL,
  `PRODUCT_ID` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKenvpf5brcg399wej8e2oq1qd2` (`PRODUCT_ID`,`CATEGORY_ID`,`CATALOG_ID`),
  KEY `FKqp2j48hb3vodovb8gn2o4gox` (`CATALOG_ID`),
  KEY `FK374wks7em54d0oghju0earttl` (`CATEGORY_ID`),
  CONSTRAINT `FK374wks7em54d0oghju0earttl` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `category` (`CATEGORY_ID`),
  CONSTRAINT `FK4e5ugd4jlc0n6i4ohrva71anv` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `product` (`PRODUCT_ID`),
  CONSTRAINT `FKqp2j48hb3vodovb8gn2o4gox` FOREIGN KEY (`CATALOG_ID`) REFERENCES `catalog` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_entry`
--

LOCK TABLES `catalog_entry` WRITE;
/*!40000 ALTER TABLE `catalog_entry` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `CATEGORY_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(20) DEFAULT NULL,
  `CATEGORY_IMAGE` varchar(100) DEFAULT NULL,
  `CATEGORY_STATUS` bit(1) DEFAULT NULL,
  `CODE` varchar(100) NOT NULL,
  `DEPTH` int DEFAULT NULL,
  `FEATURED` bit(1) DEFAULT NULL,
  `LINEAGE` varchar(255) DEFAULT NULL,
  `SORT_ORDER` int DEFAULT NULL,
  `VISIBLE` bit(1) DEFAULT NULL,
  `MERCHANT_ID` int NOT NULL,
  `PARENT_ID` bigint DEFAULT NULL,
  PRIMARY KEY (`CATEGORY_ID`),
  UNIQUE KEY `UK3mq9i6qmgquvoieslx39pej6x` (`MERCHANT_ID`,`CODE`),
  KEY `FKn3kekntr7pm8g9v8ask698ato` (`PARENT_ID`),
  CONSTRAINT `FK8a09asq5fcx0a88i4m8nsixy` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `merchant_store` (`MERCHANT_ID`),
  CONSTRAINT `FKn3kekntr7pm8g9v8ask698ato` FOREIGN KEY (`PARENT_ID`) REFERENCES `category` (`CATEGORY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'2020-06-26 10:05:16','2020-06-26 10:05:16',NULL,NULL,_binary '\0','computerbooks',0,_binary '\0','/1/',0,_binary '',1,NULL),(2,'2020-06-26 10:05:16','2020-06-26 10:05:16',NULL,NULL,_binary '\0','novels',0,_binary '\0','/2/',0,_binary '\0',1,NULL),(3,'2020-06-29 10:11:00','2020-06-29 10:11:00','admin@shopizer.com',NULL,_binary '\0','tech',1,_binary '\0','/1//3/',0,_binary '',1,1),(4,'2020-06-26 10:05:16','2020-06-26 10:05:16',NULL,NULL,_binary '\0','web',1,_binary '\0','/1//4/',0,_binary '',1,1),(5,'2020-06-26 10:05:16','2020-06-26 10:05:16',NULL,NULL,_binary '\0','fiction',1,_binary '\0','/2//5/',0,_binary '',1,2),(6,'2020-07-30 22:33:17','2020-07-30 22:33:17','admin@shopizer.com',NULL,_binary '\0','business',0,_binary '\0','/6/',0,_binary '\0',1,NULL),(7,'2020-06-26 10:05:16','2020-06-26 10:05:16',NULL,NULL,_binary '\0','cloud',2,_binary '\0','/1//3//7/',0,_binary '',1,3);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_description`
--

DROP TABLE IF EXISTS `category_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_description` (
  `DESCRIPTION_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(20) DEFAULT NULL,
  `DESCRIPTION` longtext,
  `NAME` varchar(120) NOT NULL,
  `TITLE` varchar(100) DEFAULT NULL,
  `CATEGORY_HIGHLIGHT` varchar(255) DEFAULT NULL,
  `META_DESCRIPTION` varchar(255) DEFAULT NULL,
  `META_KEYWORDS` varchar(255) DEFAULT NULL,
  `META_TITLE` varchar(120) DEFAULT NULL,
  `SEF_URL` varchar(120) DEFAULT NULL,
  `LANGUAGE_ID` int NOT NULL,
  `CATEGORY_ID` bigint NOT NULL,
  PRIMARY KEY (`DESCRIPTION_ID`),
  UNIQUE KEY `UKbuesqq6cyx7e5hy3mf30cfieq` (`CATEGORY_ID`,`LANGUAGE_ID`),
  KEY `FKl4j5boteutpu1p8f67kydpnmd` (`LANGUAGE_ID`),
  CONSTRAINT `FKa58u7d0ydfgref1iaux5efyov` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `category` (`CATEGORY_ID`),
  CONSTRAINT `FKl4j5boteutpu1p8f67kydpnmd` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `language` (`LANGUAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_description`
--

LOCK TABLES `category_description` WRITE;
/*!40000 ALTER TABLE `category_description` DISABLE KEYS */;
INSERT INTO `category_description` VALUES (1,'2020-06-26 10:05:16','2020-06-26 10:05:16',NULL,NULL,'Livres d\'informatique',NULL,NULL,NULL,NULL,NULL,'livres-informatiques',2,1),(2,'2020-06-26 10:05:16','2020-06-26 10:05:16',NULL,NULL,'Computer Books',NULL,NULL,NULL,NULL,NULL,'computer-books',1,1),(3,'2020-06-26 10:05:16','2020-06-26 10:05:16',NULL,NULL,'Novels',NULL,NULL,NULL,NULL,NULL,'novels',1,2),(4,'2020-06-26 10:05:16','2020-06-26 10:05:16',NULL,NULL,'Romans',NULL,NULL,NULL,NULL,NULL,'romans',2,2),(5,'2020-06-29 10:11:00','2020-06-29 10:11:00',NULL,'','Technologie',NULL,'','','','','technologie',2,3),(6,'2020-06-29 10:11:00','2020-06-29 10:11:00',NULL,'','Technology',NULL,'','','','','technology',1,3),(7,'2020-06-26 10:05:16','2020-06-26 10:05:16',NULL,NULL,'Web',NULL,NULL,NULL,NULL,NULL,'the-web',1,4),(8,'2020-06-26 10:05:16','2020-06-26 10:05:16',NULL,NULL,'Web',NULL,NULL,NULL,NULL,NULL,'le-web',2,4),(9,'2020-06-26 10:05:16','2020-06-26 10:05:16',NULL,NULL,'Sc Fiction',NULL,NULL,NULL,NULL,NULL,'fiction',2,5),(10,'2020-06-26 10:05:16','2020-06-26 10:05:16',NULL,NULL,'Fiction',NULL,NULL,NULL,NULL,NULL,'fiction',1,5),(11,'2020-07-30 22:33:17','2020-07-30 22:33:17',NULL,'','Business',NULL,'','','','','business',1,6),(12,'2020-07-30 22:33:17','2020-07-30 22:33:17',NULL,'','Affaires',NULL,'','','','','affaires',2,6),(13,'2020-06-26 10:05:16','2020-06-26 10:05:16',NULL,NULL,'Programmation pour le cloud',NULL,NULL,NULL,NULL,NULL,'programmation-cloud',2,7),(14,'2020-06-26 10:05:16','2020-06-26 10:05:16',NULL,NULL,'Cloud computing',NULL,NULL,NULL,NULL,NULL,'cloud-computing',1,7);
/*!40000 ALTER TABLE `category_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `content` (
  `CONTENT_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(20) DEFAULT NULL,
  `CODE` varchar(100) NOT NULL,
  `CONTENT_POSITION` varchar(10) DEFAULT NULL,
  `CONTENT_TYPE` varchar(10) DEFAULT NULL,
  `LINK_TO_MENU` bit(1) DEFAULT NULL,
  `PRODUCT_GROUP` varchar(255) DEFAULT NULL,
  `SORT_ORDER` int DEFAULT NULL,
  `VISIBLE` bit(1) DEFAULT NULL,
  `MERCHANT_ID` int NOT NULL,
  PRIMARY KEY (`CONTENT_ID`),
  UNIQUE KEY `UKt1v2ld0mrwviquqourql4uub0` (`MERCHANT_ID`,`CODE`),
  KEY `CODE_IDX` (`CODE`),
  CONSTRAINT `FKfmoi0fkjbtfty3o8fs94t11r1` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `merchant_store` (`MERCHANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content`
--

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
INSERT INTO `content` VALUES (1,NULL,NULL,NULL,'LANDING_PAGE',NULL,'SECTION',_binary '\0',NULL,0,_binary '',1),(2,NULL,NULL,NULL,'bannerImage','LEFT','BOX',_binary '\0',NULL,0,_binary '',1),(3,NULL,NULL,NULL,'footerImage','LEFT','BOX',_binary '\0',NULL,0,_binary '',1);
/*!40000 ALTER TABLE `content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_description`
--

DROP TABLE IF EXISTS `content_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `content_description` (
  `DESCRIPTION_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(20) DEFAULT NULL,
  `DESCRIPTION` longtext,
  `NAME` varchar(120) NOT NULL,
  `TITLE` varchar(100) DEFAULT NULL,
  `META_DESCRIPTION` varchar(255) DEFAULT NULL,
  `META_KEYWORDS` varchar(255) DEFAULT NULL,
  `META_TITLE` varchar(255) DEFAULT NULL,
  `SEF_URL` varchar(120) DEFAULT NULL,
  `LANGUAGE_ID` int NOT NULL,
  `CONTENT_ID` bigint NOT NULL,
  PRIMARY KEY (`DESCRIPTION_ID`),
  UNIQUE KEY `UKn0w5r7ctbp88r4rvk7ayklofm` (`CONTENT_ID`,`LANGUAGE_ID`),
  KEY `FK47yxf681u0rfw2kvarhqb0r3v` (`LANGUAGE_ID`),
  CONSTRAINT `FK47yxf681u0rfw2kvarhqb0r3v` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `language` (`LANGUAGE_ID`),
  CONSTRAINT `FKk7fabfxn2flvcofwwpyg5sys` FOREIGN KEY (`CONTENT_ID`) REFERENCES `content` (`CONTENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_description`
--

LOCK TABLES `content_description` WRITE;
/*!40000 ALTER TABLE `content_description` DISABLE KEYS */;
INSERT INTO `content_description` VALUES (1,'2020-06-26 14:39:05','2020-07-29 10:40:42',NULL,'<h2 style=\"font-family: Georgia, &quot;Times New Roman&quot;, Times, serif; font-size: 36px; margin-top: 5px; margin-bottom: 0px; text-align: center; font-weight: 400; color: rgb(34, 34, 34); background-color: rgb(255, 255, 255);\">\r\n	Featured items</h2>\r\n<p style=\"font-family: &quot;Lucida Grande&quot;, Tahoma; font-size: 12px; font-weight: lighter; font-variant-numeric: normal; font-variant-east-asian: normal; text-transform: uppercase; color: rgb(102, 102, 102); margin-top: 10px; letter-spacing: 0.3em; text-align: center; background-color: rgb(255, 255, 255);\">\r\n	THIS IS A LIST OF OUR FAVORITE FINDINGS</p>\r\n','ShopOn','ShopOn','','',NULL,NULL,1,1),(2,'2020-06-26 14:39:05','2020-07-29 10:40:42',NULL,'','ShopOn','ShopOn','','',NULL,NULL,2,1),(3,'2020-07-30 20:36:21','2020-07-30 20:36:21',NULL,'<p>\r\n	<img alt=\"\" src=\"/static/files/DEFAULT/IMAGE/shopon banner1.jpg\" style=\"float: left; width: 1400px; height: 350px;\" /></p>\r\n','bannerImage',NULL,NULL,NULL,NULL,NULL,1,2),(4,'2020-07-30 20:36:21','2020-07-30 20:36:21',NULL,'','bannerImage',NULL,NULL,NULL,NULL,NULL,2,2),(5,'2020-07-30 20:15:28','2020-07-30 20:15:28',NULL,'<p>\r\n	<img alt=\"\" src=\"/static/files/DEFAULT/IMAGE/ShopOn Logo-1.png\" style=\"width: 200px; height: 200px;\" /></p>\r\n','footerImage',NULL,NULL,NULL,NULL,NULL,1,3),(6,'2020-07-30 20:15:28','2020-07-30 20:15:28',NULL,'','footerImage',NULL,NULL,NULL,NULL,NULL,2,3);
/*!40000 ALTER TABLE `content_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country` (
  `COUNTRY_ID` int NOT NULL,
  `COUNTRY_ISOCODE` varchar(255) NOT NULL,
  `COUNTRY_SUPPORTED` bit(1) DEFAULT NULL,
  `GEOZONE_ID` bigint DEFAULT NULL,
  PRIMARY KEY (`COUNTRY_ID`),
  UNIQUE KEY `UK_dqb99v22pt27v0tgeqo958e6x` (`COUNTRY_ISOCODE`),
  KEY `FKd2q9e14kh1j6tm1gpbct2xwws` (`GEOZONE_ID`),
  CONSTRAINT `FKd2q9e14kh1j6tm1gpbct2xwws` FOREIGN KEY (`GEOZONE_ID`) REFERENCES `geozone` (`GEOZONE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'AL',_binary '',NULL),(2,'DZ',_binary '',NULL),(3,'AR',_binary '',NULL),(4,'AU',_binary '',NULL),(5,'AT',_binary '',NULL),(6,'BH',_binary '',NULL),(7,'BY',_binary '',NULL),(8,'BE',_binary '',NULL),(9,'BO',_binary '',NULL),(10,'BA',_binary '',NULL),(11,'BR',_binary '',NULL),(12,'BG',_binary '',NULL),(13,'CA',_binary '',NULL),(14,'CL',_binary '',NULL),(15,'CN',_binary '',NULL),(16,'CO',_binary '',NULL),(17,'CR',_binary '',NULL),(18,'HR',_binary '',NULL),(19,'CU',_binary '',NULL),(20,'CY',_binary '',NULL),(21,'CZ',_binary '',NULL),(22,'DK',_binary '',NULL),(23,'DO',_binary '',NULL),(24,'EC',_binary '',NULL),(25,'EG',_binary '',NULL),(26,'SV',_binary '',NULL),(27,'EE',_binary '',NULL),(28,'FI',_binary '',NULL),(29,'FR',_binary '',NULL),(30,'DE',_binary '',NULL),(31,'GR',_binary '',NULL),(32,'GT',_binary '',NULL),(33,'HN',_binary '',NULL),(34,'HK',_binary '',NULL),(35,'HU',_binary '',NULL),(36,'IS',_binary '',NULL),(37,'IN',_binary '',NULL),(38,'ID',_binary '',NULL),(39,'IQ',_binary '',NULL),(40,'IE',_binary '',NULL),(41,'IL',_binary '',NULL),(42,'IT',_binary '',NULL),(43,'JP',_binary '',NULL),(44,'JO',_binary '',NULL),(45,'KR',_binary '',NULL),(46,'KW',_binary '',NULL),(47,'LV',_binary '',NULL),(48,'LB',_binary '',NULL),(49,'LY',_binary '',NULL),(50,'LT',_binary '',NULL),(51,'LU',_binary '',NULL),(52,'MK',_binary '',NULL),(53,'MY',_binary '',NULL),(54,'MT',_binary '',NULL),(55,'MX',_binary '',NULL),(56,'ME',_binary '',NULL),(57,'MA',_binary '',NULL),(58,'NL',_binary '',NULL),(59,'NZ',_binary '',NULL),(60,'NI',_binary '',NULL),(61,'NO',_binary '',NULL),(62,'OM',_binary '',NULL),(63,'PA',_binary '',NULL),(64,'PY',_binary '',NULL),(65,'PE',_binary '',NULL),(66,'PH',_binary '',NULL),(67,'PL',_binary '',NULL),(68,'PT',_binary '',NULL),(69,'PR',_binary '',NULL),(70,'QA',_binary '',NULL),(71,'RO',_binary '',NULL),(72,'RU',_binary '',NULL),(73,'SA',_binary '',NULL),(74,'RS',_binary '',NULL),(75,'SG',_binary '',NULL),(76,'SK',_binary '',NULL),(77,'SI',_binary '',NULL),(78,'ZA',_binary '',NULL),(79,'ES',_binary '',NULL),(80,'SD',_binary '',NULL),(81,'SE',_binary '',NULL),(82,'CH',_binary '',NULL),(83,'SY',_binary '',NULL),(84,'TW',_binary '',NULL),(85,'TH',_binary '',NULL),(86,'TN',_binary '',NULL),(87,'TR',_binary '',NULL),(88,'UA',_binary '',NULL),(89,'AE',_binary '',NULL),(90,'GB',_binary '',NULL),(91,'US',_binary '',NULL),(92,'UY',_binary '',NULL),(93,'VE',_binary '',NULL),(94,'VN',_binary '',NULL),(95,'YE',_binary '',NULL);
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country_description`
--

DROP TABLE IF EXISTS `country_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country_description` (
  `DESCRIPTION_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(20) DEFAULT NULL,
  `DESCRIPTION` longtext,
  `NAME` varchar(120) NOT NULL,
  `TITLE` varchar(100) DEFAULT NULL,
  `LANGUAGE_ID` int NOT NULL,
  `COUNTRY_ID` int NOT NULL,
  PRIMARY KEY (`DESCRIPTION_ID`),
  UNIQUE KEY `UKt7nshki1rbp6157ed0v6cx4y4` (`COUNTRY_ID`,`LANGUAGE_ID`),
  KEY `FKersrbjot9p9nfukxfd2l27c7t` (`LANGUAGE_ID`),
  CONSTRAINT `FKersrbjot9p9nfukxfd2l27c7t` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `language` (`LANGUAGE_ID`),
  CONSTRAINT `FKkd2sy7q97wr2ahvyiiqc4txji` FOREIGN KEY (`COUNTRY_ID`) REFERENCES `country` (`COUNTRY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country_description`
--

LOCK TABLES `country_description` WRITE;
/*!40000 ALTER TABLE `country_description` DISABLE KEYS */;
INSERT INTO `country_description` VALUES (1,'2020-06-26 10:05:06','2020-06-26 10:05:06',NULL,NULL,'Albania',NULL,1,1),(2,'2020-06-26 10:05:06','2020-06-26 10:05:06',NULL,NULL,'Albanie',NULL,2,1),(3,'2020-06-26 10:05:06','2020-06-26 10:05:06',NULL,NULL,'Algeria',NULL,1,2),(4,'2020-06-26 10:05:06','2020-06-26 10:05:06',NULL,NULL,'Algérie',NULL,2,2),(5,'2020-06-26 10:05:06','2020-06-26 10:05:06',NULL,NULL,'Argentina',NULL,1,3),(6,'2020-06-26 10:05:06','2020-06-26 10:05:06',NULL,NULL,'Argentine',NULL,2,3),(7,'2020-06-26 10:05:06','2020-06-26 10:05:06',NULL,NULL,'Australia',NULL,1,4),(8,'2020-06-26 10:05:06','2020-06-26 10:05:06',NULL,NULL,'Australie',NULL,2,4),(9,'2020-06-26 10:05:06','2020-06-26 10:05:06',NULL,NULL,'Austria',NULL,1,5),(10,'2020-06-26 10:05:06','2020-06-26 10:05:06',NULL,NULL,'Autriche',NULL,2,5),(11,'2020-06-26 10:05:06','2020-06-26 10:05:06',NULL,NULL,'Bahrain',NULL,1,6),(12,'2020-06-26 10:05:06','2020-06-26 10:05:06',NULL,NULL,'Bahreïn',NULL,2,6),(13,'2020-06-26 10:05:06','2020-06-26 10:05:06',NULL,NULL,'Belarus',NULL,1,7),(14,'2020-06-26 10:05:06','2020-06-26 10:05:06',NULL,NULL,'Biélo-Russie',NULL,2,7),(15,'2020-06-26 10:05:06','2020-06-26 10:05:06',NULL,NULL,'Belgium',NULL,1,8),(16,'2020-06-26 10:05:06','2020-06-26 10:05:06',NULL,NULL,'Belgique',NULL,2,8),(17,'2020-06-26 10:05:06','2020-06-26 10:05:06',NULL,NULL,'Bolivia',NULL,1,9),(18,'2020-06-26 10:05:06','2020-06-26 10:05:06',NULL,NULL,'Bolivie',NULL,2,9),(19,'2020-06-26 10:05:06','2020-06-26 10:05:06',NULL,NULL,'Bosnia and Herzegovina',NULL,1,10),(20,'2020-06-26 10:05:06','2020-06-26 10:05:06',NULL,NULL,'Bosnie-Herzégovine',NULL,2,10),(21,'2020-06-26 10:05:06','2020-06-26 10:05:06',NULL,NULL,'Brazil',NULL,1,11),(22,'2020-06-26 10:05:06','2020-06-26 10:05:06',NULL,NULL,'Brésil',NULL,2,11),(23,'2020-06-26 10:05:06','2020-06-26 10:05:06',NULL,NULL,'Bulgaria',NULL,1,12),(24,'2020-06-26 10:05:06','2020-06-26 10:05:06',NULL,NULL,'Bulgarie',NULL,2,12),(25,'2020-06-26 10:05:06','2020-06-26 10:05:06',NULL,NULL,'Canada',NULL,1,13),(26,'2020-06-26 10:05:06','2020-06-26 10:05:06',NULL,NULL,'Canada',NULL,2,13),(27,'2020-06-26 10:05:06','2020-06-26 10:05:06',NULL,NULL,'Chile',NULL,1,14),(28,'2020-06-26 10:05:06','2020-06-26 10:05:06',NULL,NULL,'Chili',NULL,2,14),(29,'2020-06-26 10:05:06','2020-06-26 10:05:06',NULL,NULL,'China',NULL,1,15),(30,'2020-06-26 10:05:06','2020-06-26 10:05:06',NULL,NULL,'Chine',NULL,2,15),(31,'2020-06-26 10:05:06','2020-06-26 10:05:06',NULL,NULL,'Colombia',NULL,1,16),(32,'2020-06-26 10:05:06','2020-06-26 10:05:06',NULL,NULL,'Colombie',NULL,2,16),(33,'2020-06-26 10:05:06','2020-06-26 10:05:06',NULL,NULL,'Costa Rica',NULL,1,17),(34,'2020-06-26 10:05:06','2020-06-26 10:05:06',NULL,NULL,'Costa Rica',NULL,2,17),(35,'2020-06-26 10:05:06','2020-06-26 10:05:06',NULL,NULL,'Croatia',NULL,1,18),(36,'2020-06-26 10:05:06','2020-06-26 10:05:06',NULL,NULL,'Croatie',NULL,2,18),(37,'2020-06-26 10:05:06','2020-06-26 10:05:06',NULL,NULL,'Cuba',NULL,1,19),(38,'2020-06-26 10:05:06','2020-06-26 10:05:06',NULL,NULL,'Cuba',NULL,2,19),(39,'2020-06-26 10:05:06','2020-06-26 10:05:06',NULL,NULL,'Cyprus',NULL,1,20),(40,'2020-06-26 10:05:06','2020-06-26 10:05:06',NULL,NULL,'Chypre',NULL,2,20),(41,'2020-06-26 10:05:06','2020-06-26 10:05:06',NULL,NULL,'Czech Republic',NULL,1,21),(42,'2020-06-26 10:05:06','2020-06-26 10:05:06',NULL,NULL,'République Tchèque',NULL,2,21),(43,'2020-06-26 10:05:06','2020-06-26 10:05:06',NULL,NULL,'Denmark',NULL,1,22),(44,'2020-06-26 10:05:06','2020-06-26 10:05:06',NULL,NULL,'Danemark',NULL,2,22),(45,'2020-06-26 10:05:06','2020-06-26 10:05:06',NULL,NULL,'Dominican Republic',NULL,1,23),(46,'2020-06-26 10:05:06','2020-06-26 10:05:06',NULL,NULL,'République Dominicaine',NULL,2,23),(47,'2020-06-26 10:05:06','2020-06-26 10:05:06',NULL,NULL,'Ecuador',NULL,1,24),(48,'2020-06-26 10:05:06','2020-06-26 10:05:06',NULL,NULL,'Equateur',NULL,2,24),(49,'2020-06-26 10:05:06','2020-06-26 10:05:06',NULL,NULL,'Egypt',NULL,1,25),(50,'2020-06-26 10:05:06','2020-06-26 10:05:06',NULL,NULL,'Egypte',NULL,2,25),(51,'2020-06-26 10:05:06','2020-06-26 10:05:06',NULL,NULL,'El Salvador',NULL,1,26),(52,'2020-06-26 10:05:06','2020-06-26 10:05:06',NULL,NULL,'El Salvador',NULL,2,26),(53,'2020-06-26 10:05:06','2020-06-26 10:05:06',NULL,NULL,'Estonia',NULL,1,27),(54,'2020-06-26 10:05:06','2020-06-26 10:05:06',NULL,NULL,'Estonie',NULL,2,27),(55,'2020-06-26 10:05:06','2020-06-26 10:05:06',NULL,NULL,'Finland',NULL,1,28),(56,'2020-06-26 10:05:06','2020-06-26 10:05:06',NULL,NULL,'Finlande',NULL,2,28),(57,'2020-06-26 10:05:06','2020-06-26 10:05:06',NULL,NULL,'France',NULL,1,29),(58,'2020-06-26 10:05:06','2020-06-26 10:05:06',NULL,NULL,'France',NULL,2,29),(59,'2020-06-26 10:05:06','2020-06-26 10:05:06',NULL,NULL,'Germany',NULL,1,30),(60,'2020-06-26 10:05:06','2020-06-26 10:05:06',NULL,NULL,'Allemagne',NULL,2,30),(61,'2020-06-26 10:05:06','2020-06-26 10:05:06',NULL,NULL,'Greece',NULL,1,31),(62,'2020-06-26 10:05:06','2020-06-26 10:05:06',NULL,NULL,'Grèce',NULL,2,31),(63,'2020-06-26 10:05:06','2020-06-26 10:05:06',NULL,NULL,'Guatemala',NULL,1,32),(64,'2020-06-26 10:05:07','2020-06-26 10:05:07',NULL,NULL,'Guatemala',NULL,2,32),(65,'2020-06-26 10:05:07','2020-06-26 10:05:07',NULL,NULL,'Honduras',NULL,1,33),(66,'2020-06-26 10:05:07','2020-06-26 10:05:07',NULL,NULL,'Honduras',NULL,2,33),(67,'2020-06-26 10:05:07','2020-06-26 10:05:07',NULL,NULL,'Hong Kong',NULL,1,34),(68,'2020-06-26 10:05:07','2020-06-26 10:05:07',NULL,NULL,'Hong-Kong',NULL,2,34),(69,'2020-06-26 10:05:07','2020-06-26 10:05:07',NULL,NULL,'Hungary',NULL,1,35),(70,'2020-06-26 10:05:07','2020-06-26 10:05:07',NULL,NULL,'Hongrie',NULL,2,35),(71,'2020-06-26 10:05:07','2020-06-26 10:05:07',NULL,NULL,'Iceland',NULL,1,36),(72,'2020-06-26 10:05:07','2020-06-26 10:05:07',NULL,NULL,'Islande',NULL,2,36),(73,'2020-06-26 10:05:07','2020-06-26 10:05:07',NULL,NULL,'India',NULL,1,37),(74,'2020-06-26 10:05:07','2020-06-26 10:05:07',NULL,NULL,'Inde',NULL,2,37),(75,'2020-06-26 10:05:07','2020-06-26 10:05:07',NULL,NULL,'Indonesia',NULL,1,38),(76,'2020-06-26 10:05:07','2020-06-26 10:05:07',NULL,NULL,'Indonésie',NULL,2,38),(77,'2020-06-26 10:05:07','2020-06-26 10:05:07',NULL,NULL,'Iraq',NULL,1,39),(78,'2020-06-26 10:05:07','2020-06-26 10:05:07',NULL,NULL,'Irak',NULL,2,39),(79,'2020-06-26 10:05:07','2020-06-26 10:05:07',NULL,NULL,'Ireland',NULL,1,40),(80,'2020-06-26 10:05:07','2020-06-26 10:05:07',NULL,NULL,'Irlande',NULL,2,40),(81,'2020-06-26 10:05:07','2020-06-26 10:05:07',NULL,NULL,'Israel',NULL,1,41),(82,'2020-06-26 10:05:07','2020-06-26 10:05:07',NULL,NULL,'Israël',NULL,2,41),(83,'2020-06-26 10:05:07','2020-06-26 10:05:07',NULL,NULL,'Italy',NULL,1,42),(84,'2020-06-26 10:05:07','2020-06-26 10:05:07',NULL,NULL,'Italie',NULL,2,42),(85,'2020-06-26 10:05:07','2020-06-26 10:05:07',NULL,NULL,'Japan',NULL,1,43),(86,'2020-06-26 10:05:07','2020-06-26 10:05:07',NULL,NULL,'Japon',NULL,2,43),(87,'2020-06-26 10:05:07','2020-06-26 10:05:07',NULL,NULL,'Jordan',NULL,1,44),(88,'2020-06-26 10:05:07','2020-06-26 10:05:07',NULL,NULL,'Jordanie',NULL,2,44),(89,'2020-06-26 10:05:07','2020-06-26 10:05:07',NULL,NULL,'South Korea',NULL,1,45),(90,'2020-06-26 10:05:07','2020-06-26 10:05:07',NULL,NULL,'Corée du Sud',NULL,2,45),(91,'2020-06-26 10:05:07','2020-06-26 10:05:07',NULL,NULL,'Kuwait',NULL,1,46),(92,'2020-06-26 10:05:07','2020-06-26 10:05:07',NULL,NULL,'Koweit',NULL,2,46),(93,'2020-06-26 10:05:07','2020-06-26 10:05:07',NULL,NULL,'Latvia',NULL,1,47),(94,'2020-06-26 10:05:07','2020-06-26 10:05:07',NULL,NULL,'Lettonie',NULL,2,47),(95,'2020-06-26 10:05:07','2020-06-26 10:05:07',NULL,NULL,'Lebanon',NULL,1,48),(96,'2020-06-26 10:05:07','2020-06-26 10:05:07',NULL,NULL,'Liban',NULL,2,48),(97,'2020-06-26 10:05:07','2020-06-26 10:05:07',NULL,NULL,'Libya',NULL,1,49),(98,'2020-06-26 10:05:07','2020-06-26 10:05:07',NULL,NULL,'Libye',NULL,2,49),(99,'2020-06-26 10:05:07','2020-06-26 10:05:07',NULL,NULL,'Lithuania',NULL,1,50),(100,'2020-06-26 10:05:07','2020-06-26 10:05:07',NULL,NULL,'Lithuanie',NULL,2,50),(101,'2020-06-26 10:05:07','2020-06-26 10:05:07',NULL,NULL,'Luxembourg',NULL,1,51),(102,'2020-06-26 10:05:07','2020-06-26 10:05:07',NULL,NULL,'Luxembourg',NULL,2,51),(103,'2020-06-26 10:05:07','2020-06-26 10:05:07',NULL,NULL,'Macedonia',NULL,1,52),(104,'2020-06-26 10:05:07','2020-06-26 10:05:07',NULL,NULL,'Macédoine',NULL,2,52),(105,'2020-06-26 10:05:07','2020-06-26 10:05:07',NULL,NULL,'Malaysia',NULL,1,53),(106,'2020-06-26 10:05:07','2020-06-26 10:05:07',NULL,NULL,'Malaisie',NULL,2,53),(107,'2020-06-26 10:05:07','2020-06-26 10:05:07',NULL,NULL,'Malta',NULL,1,54),(108,'2020-06-26 10:05:07','2020-06-26 10:05:07',NULL,NULL,'Malte',NULL,2,54),(109,'2020-06-26 10:05:07','2020-06-26 10:05:07',NULL,NULL,'Mexico',NULL,1,55),(110,'2020-06-26 10:05:07','2020-06-26 10:05:07',NULL,NULL,'Mexique',NULL,2,55),(111,'2020-06-26 10:05:07','2020-06-26 10:05:07',NULL,NULL,'Montenegro',NULL,1,56),(112,'2020-06-26 10:05:07','2020-06-26 10:05:07',NULL,NULL,'Monténégro',NULL,2,56),(113,'2020-06-26 10:05:07','2020-06-26 10:05:07',NULL,NULL,'Morocco',NULL,1,57),(114,'2020-06-26 10:05:07','2020-06-26 10:05:07',NULL,NULL,'Maroc',NULL,2,57),(115,'2020-06-26 10:05:07','2020-06-26 10:05:07',NULL,NULL,'Netherlands',NULL,1,58),(116,'2020-06-26 10:05:07','2020-06-26 10:05:07',NULL,NULL,'Pays-Bas',NULL,2,58),(117,'2020-06-26 10:05:07','2020-06-26 10:05:07',NULL,NULL,'New Zealand',NULL,1,59),(118,'2020-06-26 10:05:07','2020-06-26 10:05:07',NULL,NULL,'Nouvelle-Zélande',NULL,2,59),(119,'2020-06-26 10:05:07','2020-06-26 10:05:07',NULL,NULL,'Nicaragua',NULL,1,60),(120,'2020-06-26 10:05:07','2020-06-26 10:05:07',NULL,NULL,'Nicaragua',NULL,2,60),(121,'2020-06-26 10:05:07','2020-06-26 10:05:07',NULL,NULL,'Norway',NULL,1,61),(122,'2020-06-26 10:05:07','2020-06-26 10:05:07',NULL,NULL,'Norvège',NULL,2,61),(123,'2020-06-26 10:05:07','2020-06-26 10:05:07',NULL,NULL,'Oman',NULL,1,62),(124,'2020-06-26 10:05:07','2020-06-26 10:05:07',NULL,NULL,'Oman',NULL,2,62),(125,'2020-06-26 10:05:07','2020-06-26 10:05:07',NULL,NULL,'Panama',NULL,1,63),(126,'2020-06-26 10:05:07','2020-06-26 10:05:07',NULL,NULL,'Panama',NULL,2,63),(127,'2020-06-26 10:05:07','2020-06-26 10:05:07',NULL,NULL,'Paraguay',NULL,1,64),(128,'2020-06-26 10:05:07','2020-06-26 10:05:07',NULL,NULL,'Paraguay',NULL,2,64),(129,'2020-06-26 10:05:08','2020-06-26 10:05:08',NULL,NULL,'Peru',NULL,1,65),(130,'2020-06-26 10:05:08','2020-06-26 10:05:08',NULL,NULL,'Pérou',NULL,2,65),(131,'2020-06-26 10:05:08','2020-06-26 10:05:08',NULL,NULL,'Philippines',NULL,1,66),(132,'2020-06-26 10:05:08','2020-06-26 10:05:08',NULL,NULL,'Philippines',NULL,2,66),(133,'2020-06-26 10:05:08','2020-06-26 10:05:08',NULL,NULL,'Poland',NULL,1,67),(134,'2020-06-26 10:05:08','2020-06-26 10:05:08',NULL,NULL,'Pologne',NULL,2,67),(135,'2020-06-26 10:05:08','2020-06-26 10:05:08',NULL,NULL,'Portugal',NULL,1,68),(136,'2020-06-26 10:05:08','2020-06-26 10:05:08',NULL,NULL,'Portugal',NULL,2,68),(137,'2020-06-26 10:05:08','2020-06-26 10:05:08',NULL,NULL,'Puerto Rico',NULL,1,69),(138,'2020-06-26 10:05:08','2020-06-26 10:05:08',NULL,NULL,'Porto Rico',NULL,2,69),(139,'2020-06-26 10:05:08','2020-06-26 10:05:08',NULL,NULL,'Qatar',NULL,1,70),(140,'2020-06-26 10:05:08','2020-06-26 10:05:08',NULL,NULL,'Qatar',NULL,2,70),(141,'2020-06-26 10:05:08','2020-06-26 10:05:08',NULL,NULL,'Romania',NULL,1,71),(142,'2020-06-26 10:05:08','2020-06-26 10:05:08',NULL,NULL,'Roumanie',NULL,2,71),(143,'2020-06-26 10:05:08','2020-06-26 10:05:08',NULL,NULL,'Russia',NULL,1,72),(144,'2020-06-26 10:05:08','2020-06-26 10:05:08',NULL,NULL,'Russie',NULL,2,72),(145,'2020-06-26 10:05:08','2020-06-26 10:05:08',NULL,NULL,'Saudi Arabia',NULL,1,73),(146,'2020-06-26 10:05:08','2020-06-26 10:05:08',NULL,NULL,'Arabie Saoudite',NULL,2,73),(147,'2020-06-26 10:05:08','2020-06-26 10:05:08',NULL,NULL,'Serbia',NULL,1,74),(148,'2020-06-26 10:05:08','2020-06-26 10:05:08',NULL,NULL,'Serbie',NULL,2,74),(149,'2020-06-26 10:05:08','2020-06-26 10:05:08',NULL,NULL,'Singapore',NULL,1,75),(150,'2020-06-26 10:05:08','2020-06-26 10:05:08',NULL,NULL,'Singapour',NULL,2,75),(151,'2020-06-26 10:05:08','2020-06-26 10:05:08',NULL,NULL,'Slovakia',NULL,1,76),(152,'2020-06-26 10:05:08','2020-06-26 10:05:08',NULL,NULL,'Slovaquie',NULL,2,76),(153,'2020-06-26 10:05:08','2020-06-26 10:05:08',NULL,NULL,'Slovenia',NULL,1,77),(154,'2020-06-26 10:05:08','2020-06-26 10:05:08',NULL,NULL,'Slovénie',NULL,2,77),(155,'2020-06-26 10:05:08','2020-06-26 10:05:08',NULL,NULL,'South Africa',NULL,1,78),(156,'2020-06-26 10:05:08','2020-06-26 10:05:08',NULL,NULL,'Afrique du Sud',NULL,2,78),(157,'2020-06-26 10:05:08','2020-06-26 10:05:08',NULL,NULL,'Spain',NULL,1,79),(158,'2020-06-26 10:05:08','2020-06-26 10:05:08',NULL,NULL,'Espagne',NULL,2,79),(159,'2020-06-26 10:05:08','2020-06-26 10:05:08',NULL,NULL,'Sudan',NULL,1,80),(160,'2020-06-26 10:05:08','2020-06-26 10:05:08',NULL,NULL,'Soudan',NULL,2,80),(161,'2020-06-26 10:05:08','2020-06-26 10:05:08',NULL,NULL,'Sweden',NULL,1,81),(162,'2020-06-26 10:05:08','2020-06-26 10:05:08',NULL,NULL,'Suède',NULL,2,81),(163,'2020-06-26 10:05:08','2020-06-26 10:05:08',NULL,NULL,'Switzerland',NULL,1,82),(164,'2020-06-26 10:05:08','2020-06-26 10:05:08',NULL,NULL,'Suisse',NULL,2,82),(165,'2020-06-26 10:05:08','2020-06-26 10:05:08',NULL,NULL,'Syria',NULL,1,83),(166,'2020-06-26 10:05:08','2020-06-26 10:05:08',NULL,NULL,'Syrie',NULL,2,83),(167,'2020-06-26 10:05:08','2020-06-26 10:05:08',NULL,NULL,'Taiwan',NULL,1,84),(168,'2020-06-26 10:05:08','2020-06-26 10:05:08',NULL,NULL,'Taiwan',NULL,2,84),(169,'2020-06-26 10:05:08','2020-06-26 10:05:08',NULL,NULL,'Thailand',NULL,1,85),(170,'2020-06-26 10:05:08','2020-06-26 10:05:08',NULL,NULL,'Thaïlande',NULL,2,85),(171,'2020-06-26 10:05:08','2020-06-26 10:05:08',NULL,NULL,'Tunisia',NULL,1,86),(172,'2020-06-26 10:05:08','2020-06-26 10:05:08',NULL,NULL,'Tunisie',NULL,2,86),(173,'2020-06-26 10:05:08','2020-06-26 10:05:08',NULL,NULL,'Turkey',NULL,1,87),(174,'2020-06-26 10:05:08','2020-06-26 10:05:08',NULL,NULL,'Turquie',NULL,2,87),(175,'2020-06-26 10:05:08','2020-06-26 10:05:08',NULL,NULL,'Ukraine',NULL,1,88),(176,'2020-06-26 10:05:08','2020-06-26 10:05:08',NULL,NULL,'Ukraine',NULL,2,88),(177,'2020-06-26 10:05:08','2020-06-26 10:05:08',NULL,NULL,'United Arab Emirates',NULL,1,89),(178,'2020-06-26 10:05:08','2020-06-26 10:05:08',NULL,NULL,'Emirats Arabes Unis',NULL,2,89),(179,'2020-06-26 10:05:08','2020-06-26 10:05:08',NULL,NULL,'United Kingdom',NULL,1,90),(180,'2020-06-26 10:05:08','2020-06-26 10:05:08',NULL,NULL,'Royaume-Uni',NULL,2,90),(181,'2020-06-26 10:05:08','2020-06-26 10:05:08',NULL,NULL,'United States',NULL,1,91),(182,'2020-06-26 10:05:08','2020-06-26 10:05:08',NULL,NULL,'Etats-Unis',NULL,2,91),(183,'2020-06-26 10:05:08','2020-06-26 10:05:08',NULL,NULL,'Uruguay',NULL,1,92),(184,'2020-06-26 10:05:08','2020-06-26 10:05:08',NULL,NULL,'Uruguay',NULL,2,92),(185,'2020-06-26 10:05:08','2020-06-26 10:05:08',NULL,NULL,'Venezuela',NULL,1,93),(186,'2020-06-26 10:05:08','2020-06-26 10:05:08',NULL,NULL,'Vénézuela',NULL,2,93),(187,'2020-06-26 10:05:08','2020-06-26 10:05:08',NULL,NULL,'Vietnam',NULL,1,94),(188,'2020-06-26 10:05:08','2020-06-26 10:05:08',NULL,NULL,'Vietnam',NULL,2,94),(189,'2020-06-26 10:05:08','2020-06-26 10:05:08',NULL,NULL,'Yemen',NULL,1,95),(190,'2020-06-26 10:05:08','2020-06-26 10:05:08',NULL,NULL,'Yémen',NULL,2,95);
/*!40000 ALTER TABLE `country_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency`
--

DROP TABLE IF EXISTS `currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `currency` (
  `CURRENCY_ID` bigint NOT NULL,
  `CURRENCY_CODE` varchar(255) DEFAULT NULL,
  `CURRENCY_CURRENCY_CODE` varchar(255) NOT NULL,
  `CURRENCY_NAME` varchar(255) DEFAULT NULL,
  `CURRENCY_SUPPORTED` bit(1) DEFAULT NULL,
  PRIMARY KEY (`CURRENCY_ID`),
  UNIQUE KEY `UK_m7ku15ekud52vp67ry73a36te` (`CURRENCY_CURRENCY_CODE`),
  UNIQUE KEY `UK_1ubr7n96hjajamtggqp090a4x` (`CURRENCY_CODE`),
  UNIQUE KEY `UK_7r1k69cbk5giewqr5c9r4v6f` (`CURRENCY_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency`
--

LOCK TABLES `currency` WRITE;
/*!40000 ALTER TABLE `currency` DISABLE KEYS */;
INSERT INTO `currency` VALUES (1,'FJD','FJD','FJD',_binary ''),(2,'MXN','MXN','MXN',_binary ''),(3,'STD','STD','STD',_binary ''),(4,'LVL','LVL','LVL',_binary ''),(5,'SCR','SCR','SCR',_binary ''),(6,'CDF','CDF','CDF',_binary ''),(7,'BBD','BBD','BBD',_binary ''),(8,'GTQ','GTQ','GTQ',_binary ''),(9,'CLP','CLP','CLP',_binary ''),(10,'HNL','HNL','HNL',_binary ''),(11,'UGX','UGX','UGX',_binary ''),(12,'ZAR','ZAR','ZAR',_binary ''),(13,'MXV','MXV','MXV',_binary ''),(14,'TND','TND','TND',_binary ''),(15,'BSD','BSD','BSD',_binary ''),(16,'SLL','SLL','SLL',_binary ''),(17,'SDG','SDG','SDG',_binary ''),(18,'IQD','IQD','IQD',_binary ''),(19,'CUP','CUP','CUP',_binary ''),(20,'GMD','GMD','GMD',_binary ''),(21,'TWD','TWD','TWD',_binary ''),(22,'RSD','RSD','RSD',_binary ''),(23,'DOP','DOP','DOP',_binary ''),(24,'KMF','KMF','KMF',_binary ''),(25,'MYR','MYR','MYR',_binary ''),(26,'FKP','FKP','FKP',_binary ''),(27,'XOF','XOF','XOF',_binary ''),(28,'GEL','GEL','GEL',_binary ''),(29,'UYU','UYU','UYU',_binary ''),(30,'MAD','MAD','MAD',_binary ''),(31,'CVE','CVE','CVE',_binary ''),(32,'AZN','AZN','AZN',_binary ''),(33,'OMR','OMR','OMR',_binary ''),(34,'PGK','PGK','PGK',_binary ''),(35,'KES','KES','KES',_binary ''),(36,'SEK','SEK','SEK',_binary ''),(37,'BTN','BTN','BTN',_binary ''),(38,'UAH','UAH','UAH',_binary ''),(39,'GNF','GNF','GNF',_binary ''),(40,'ERN','ERN','ERN',_binary ''),(41,'MZN','MZN','MZN',_binary ''),(42,'SVC','SVC','SVC',_binary ''),(43,'ARS','ARS','ARS',_binary ''),(44,'QAR','QAR','QAR',_binary ''),(45,'IRR','IRR','IRR',_binary ''),(46,'MRO','MRO','MRO',_binary ''),(47,'CNY','CNY','CNY',_binary ''),(48,'XPF','XPF','XPF',_binary ''),(49,'THB','THB','THB',_binary ''),(50,'UZS','UZS','UZS',_binary ''),(51,'BDT','BDT','BDT',_binary ''),(52,'LYD','LYD','LYD',_binary ''),(53,'BMD','BMD','BMD',_binary ''),(54,'KWD','KWD','KWD',_binary ''),(55,'PHP','PHP','PHP',_binary ''),(56,'RUB','RUB','RUB',_binary ''),(57,'PYG','PYG','PYG',_binary ''),(58,'ISK','ISK','ISK',_binary ''),(59,'JMD','JMD','JMD',_binary ''),(60,'COP','COP','COP',_binary ''),(61,'USD','USD','USD',_binary ''),(62,'MKD','MKD','MKD',_binary ''),(63,'DZD','DZD','DZD',_binary ''),(64,'PAB','PAB','PAB',_binary ''),(65,'SGD','SGD','SGD',_binary ''),(66,'ETB','ETB','ETB',_binary ''),(67,'KGS','KGS','KGS',_binary ''),(68,'SOS','SOS','SOS',_binary ''),(69,'VUV','VUV','VUV',_binary ''),(70,'VEF','VEF','VEF',_binary ''),(71,'LAK','LAK','LAK',_binary ''),(72,'BND','BND','BND',_binary ''),(73,'ZMK','ZMK','ZMK',_binary ''),(74,'XAF','XAF','XAF',_binary ''),(75,'LRD','LRD','LRD',_binary ''),(76,'HRK','HRK','HRK',_binary ''),(77,'CHF','CHF','CHF',_binary ''),(78,'ALL','ALL','ALL',_binary ''),(79,'DJF','DJF','DJF',_binary ''),(80,'TZS','TZS','TZS',_binary ''),(81,'VND','VND','VND',_binary ''),(82,'AUD','AUD','AUD',_binary ''),(83,'ILS','ILS','ILS',_binary ''),(84,'GHS','GHS','GHS',_binary ''),(85,'GYD','GYD','GYD',_binary ''),(86,'KPW','KPW','KPW',_binary ''),(87,'BOB','BOB','BOB',_binary ''),(88,'KHR','KHR','KHR',_binary ''),(89,'MDL','MDL','MDL',_binary ''),(90,'IDR','IDR','IDR',_binary ''),(91,'KYD','KYD','KYD',_binary ''),(92,'AMD','AMD','AMD',_binary ''),(93,'BWP','BWP','BWP',_binary ''),(94,'SHP','SHP','SHP',_binary ''),(95,'TRY','TRY','TRY',_binary ''),(96,'LBP','LBP','LBP',_binary ''),(97,'TJS','TJS','TJS',_binary ''),(98,'JOD','JOD','JOD',_binary ''),(99,'HKD','HKD','HKD',_binary ''),(100,'RWF','RWF','RWF',_binary ''),(101,'AED','AED','AED',_binary ''),(102,'EUR','EUR','EUR',_binary ''),(103,'LSL','LSL','LSL',_binary ''),(104,'DKK','DKK','DKK',_binary ''),(105,'CAD','CAD','CAD',_binary ''),(106,'BOV','BOV','BOV',_binary ''),(107,'BGN','BGN','BGN',_binary ''),(108,'MMK','MMK','MMK',_binary ''),(109,'NOK','NOK','NOK',_binary ''),(110,'MUR','MUR','MUR',_binary ''),(111,'SYP','SYP','SYP',_binary ''),(112,'GIP','GIP','GIP',_binary ''),(113,'RON','RON','RON',_binary ''),(114,'LKR','LKR','LKR',_binary ''),(115,'NGN','NGN','NGN',_binary ''),(116,'CRC','CRC','CRC',_binary ''),(117,'CZK','CZK','CZK',_binary ''),(118,'PKR','PKR','PKR',_binary ''),(119,'XCD','XCD','XCD',_binary ''),(120,'ANG','ANG','ANG',_binary ''),(121,'HTG','HTG','HTG',_binary ''),(122,'BHD','BHD','BHD',_binary ''),(123,'KZT','KZT','KZT',_binary ''),(124,'SRD','SRD','SRD',_binary ''),(125,'SZL','SZL','SZL',_binary ''),(126,'LTL','LTL','LTL',_binary ''),(127,'SAR','SAR','SAR',_binary ''),(128,'TTD','TTD','TTD',_binary ''),(129,'YER','YER','YER',_binary ''),(130,'MVR','MVR','MVR',_binary ''),(131,'AFN','AFN','AFN',_binary ''),(132,'INR','INR','INR',_binary ''),(133,'AWG','AWG','AWG',_binary ''),(134,'KRW','KRW','KRW',_binary ''),(135,'NPR','NPR','NPR',_binary ''),(136,'JPY','JPY','JPY',_binary ''),(137,'MNT','MNT','MNT',_binary ''),(138,'AOA','AOA','AOA',_binary ''),(139,'PLN','PLN','PLN',_binary ''),(140,'GBP','GBP','GBP',_binary ''),(141,'SBD','SBD','SBD',_binary ''),(142,'HUF','HUF','HUF',_binary ''),(143,'BYR','BYR','BYR',_binary ''),(144,'BIF','BIF','BIF',_binary ''),(145,'MWK','MWK','MWK',_binary ''),(146,'MGA','MGA','MGA',_binary ''),(147,'XDR','XDR','XDR',_binary ''),(148,'BZD','BZD','BZD',_binary ''),(149,'BAM','BAM','BAM',_binary ''),(150,'EGP','EGP','EGP',_binary ''),(151,'MOP','MOP','MOP',_binary ''),(152,'NAD','NAD','NAD',_binary ''),(153,'NIO','NIO','NIO',_binary ''),(154,'PEN','PEN','PEN',_binary ''),(155,'NZD','NZD','NZD',_binary ''),(156,'WST','WST','WST',_binary ''),(157,'CLF','CLF','CLF',_binary ''),(158,'BRL','BRL','BRL',_binary '');
/*!40000 ALTER TABLE `currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `CUSTOMER_ID` bigint NOT NULL,
  `CUSTOMER_ANONYMOUS` bit(1) DEFAULT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(20) DEFAULT NULL,
  `BILLING_STREET_ADDRESS` varchar(256) DEFAULT NULL,
  `BILLING_CITY` varchar(100) DEFAULT NULL,
  `BILLING_COMPANY` varchar(100) DEFAULT NULL,
  `BILLING_FIRST_NAME` varchar(64) NOT NULL,
  `BILLING_LAST_NAME` varchar(64) NOT NULL,
  `LATITUDE` varchar(100) DEFAULT NULL,
  `LONGITUDE` varchar(100) DEFAULT NULL,
  `BILLING_POSTCODE` varchar(20) DEFAULT NULL,
  `BILLING_STATE` varchar(100) DEFAULT NULL,
  `BILLING_TELEPHONE` varchar(32) DEFAULT NULL,
  `CUSTOMER_COMPANY` varchar(100) DEFAULT NULL,
  `REVIEW_AVG` decimal(19,2) DEFAULT NULL,
  `REVIEW_COUNT` int DEFAULT NULL,
  `CUSTOMER_DOB` datetime DEFAULT NULL,
  `DELIVERY_STREET_ADDRESS` varchar(256) DEFAULT NULL,
  `DELIVERY_CITY` varchar(100) DEFAULT NULL,
  `DELIVERY_COMPANY` varchar(100) DEFAULT NULL,
  `DELIVERY_FIRST_NAME` varchar(64) DEFAULT NULL,
  `DELIVERY_LAST_NAME` varchar(64) DEFAULT NULL,
  `DELIVERY_POSTCODE` varchar(20) DEFAULT NULL,
  `DELIVERY_STATE` varchar(100) DEFAULT NULL,
  `DELIVERY_TELEPHONE` varchar(32) DEFAULT NULL,
  `CUSTOMER_EMAIL_ADDRESS` varchar(96) NOT NULL,
  `CUSTOMER_GENDER` varchar(1) DEFAULT NULL,
  `CUSTOMER_NICK` varchar(96) DEFAULT NULL,
  `CUSTOMER_PASSWORD` varchar(60) DEFAULT NULL,
  `PROVIDER` varchar(255) DEFAULT NULL,
  `BILLING_COUNTRY_ID` int NOT NULL,
  `BILLING_ZONE_ID` bigint DEFAULT NULL,
  `LANGUAGE_ID` int NOT NULL,
  `DELIVERY_COUNTRY_ID` int DEFAULT NULL,
  `DELIVERY_ZONE_ID` bigint DEFAULT NULL,
  `MERCHANT_ID` int NOT NULL,
  PRIMARY KEY (`CUSTOMER_ID`),
  KEY `FK5pas8t9mknk4kkin55t4v300l` (`BILLING_COUNTRY_ID`),
  KEY `FKp0xcpa3i2mgdr0kq43xiibx40` (`BILLING_ZONE_ID`),
  KEY `FKdgjqmj04qt89gmfloo4ofojcw` (`LANGUAGE_ID`),
  KEY `FKbxyooiceli2ko29bupdye6jgn` (`DELIVERY_COUNTRY_ID`),
  KEY `FK3k21jw28bbx043c2mnhevg9w4` (`DELIVERY_ZONE_ID`),
  KEY `FK8122nrpakxu3umk1od4v0xxoa` (`MERCHANT_ID`),
  CONSTRAINT `FK3k21jw28bbx043c2mnhevg9w4` FOREIGN KEY (`DELIVERY_ZONE_ID`) REFERENCES `zone` (`ZONE_ID`),
  CONSTRAINT `FK5pas8t9mknk4kkin55t4v300l` FOREIGN KEY (`BILLING_COUNTRY_ID`) REFERENCES `country` (`COUNTRY_ID`),
  CONSTRAINT `FK8122nrpakxu3umk1od4v0xxoa` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `merchant_store` (`MERCHANT_ID`),
  CONSTRAINT `FKbxyooiceli2ko29bupdye6jgn` FOREIGN KEY (`DELIVERY_COUNTRY_ID`) REFERENCES `country` (`COUNTRY_ID`),
  CONSTRAINT `FKdgjqmj04qt89gmfloo4ofojcw` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `language` (`LANGUAGE_ID`),
  CONSTRAINT `FKp0xcpa3i2mgdr0kq43xiibx40` FOREIGN KEY (`BILLING_ZONE_ID`) REFERENCES `zone` (`ZONE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,_binary '\0',NULL,NULL,NULL,'358 Du Languadoc','Boucherville','CSTI Consulting','Leonardo','DiCaprio',NULL,NULL,'J4B-8J9',NULL,NULL,'CSTI Consulting',NULL,NULL,'2020-06-26 10:05:19','358 Du Languadoc','Boucherville',NULL,'Leonardo','DiCaprio','J4B-8J9',NULL,NULL,'test@shopizer.com','M','shopizer','$2a$10$xRdrmbrQbDC3FM/JD/hdSew4wBcY51d4M2gJtRgYDwXDMbXi05k2m',NULL,13,8,1,13,8,1);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_attribute`
--

DROP TABLE IF EXISTS `customer_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_attribute` (
  `CUSTOMER_ATTRIBUTE_ID` bigint NOT NULL,
  `CUSTOMER_ATTR_TXT_VAL` varchar(255) DEFAULT NULL,
  `CUSTOMER_ID` bigint NOT NULL,
  `OPTION_ID` bigint NOT NULL,
  `OPTION_VALUE_ID` bigint NOT NULL,
  PRIMARY KEY (`CUSTOMER_ATTRIBUTE_ID`),
  UNIQUE KEY `UK46kbpre88yh963gewm3kmdni1` (`OPTION_ID`,`CUSTOMER_ID`),
  KEY `FKc3318o13i2bpxkci1bh52we5a` (`CUSTOMER_ID`),
  KEY `FK9fl7iexvdeeeoch9fh35o5vw4` (`OPTION_VALUE_ID`),
  CONSTRAINT `FK4xugs9yd9w4o3sw11fisb8tj5` FOREIGN KEY (`OPTION_ID`) REFERENCES `customer_option` (`CUSTOMER_OPTION_ID`),
  CONSTRAINT `FK9fl7iexvdeeeoch9fh35o5vw4` FOREIGN KEY (`OPTION_VALUE_ID`) REFERENCES `customer_option_value` (`CUSTOMER_OPTION_VALUE_ID`),
  CONSTRAINT `FKc3318o13i2bpxkci1bh52we5a` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `customer` (`CUSTOMER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_attribute`
--

LOCK TABLES `customer_attribute` WRITE;
/*!40000 ALTER TABLE `customer_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_group`
--

DROP TABLE IF EXISTS `customer_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_group` (
  `CUSTOMER_ID` bigint NOT NULL,
  `GROUP_ID` int NOT NULL,
  KEY `FKgrr5v89l1m9sl2qol62bbctq4` (`GROUP_ID`),
  KEY `FK257h3e27f4ujw08doqtq46hho` (`CUSTOMER_ID`),
  CONSTRAINT `FK257h3e27f4ujw08doqtq46hho` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `customer` (`CUSTOMER_ID`),
  CONSTRAINT `FKgrr5v89l1m9sl2qol62bbctq4` FOREIGN KEY (`GROUP_ID`) REFERENCES `sm_group` (`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_group`
--

LOCK TABLES `customer_group` WRITE;
/*!40000 ALTER TABLE `customer_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_opt_val_description`
--

DROP TABLE IF EXISTS `customer_opt_val_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_opt_val_description` (
  `DESCRIPTION_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(20) DEFAULT NULL,
  `DESCRIPTION` longtext,
  `NAME` varchar(120) NOT NULL,
  `TITLE` varchar(100) DEFAULT NULL,
  `LANGUAGE_ID` int NOT NULL,
  `CUSTOMER_OPT_VAL_ID` bigint DEFAULT NULL,
  PRIMARY KEY (`DESCRIPTION_ID`),
  UNIQUE KEY `UKge7f2t1d31r87wnk09h9u1tnv` (`CUSTOMER_OPT_VAL_ID`,`LANGUAGE_ID`),
  KEY `FK6rfssi3qfx4pswicxrfb18c1` (`LANGUAGE_ID`),
  CONSTRAINT `FK6rfssi3qfx4pswicxrfb18c1` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `language` (`LANGUAGE_ID`),
  CONSTRAINT `FKhwrs6fyqk6vh11yvcflu42yef` FOREIGN KEY (`CUSTOMER_OPT_VAL_ID`) REFERENCES `customer_option_value` (`CUSTOMER_OPTION_VALUE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_opt_val_description`
--

LOCK TABLES `customer_opt_val_description` WRITE;
/*!40000 ALTER TABLE `customer_opt_val_description` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_opt_val_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_optin`
--

DROP TABLE IF EXISTS `customer_optin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_optin` (
  `CUSTOMER_OPTIN_ID` bigint NOT NULL,
  `EMAIL` varchar(255) NOT NULL,
  `FIRST` varchar(255) DEFAULT NULL,
  `LAST` varchar(255) DEFAULT NULL,
  `OPTIN_DATE` datetime DEFAULT NULL,
  `VALUE` longtext,
  `MERCHANT_ID` int NOT NULL,
  `OPTIN_ID` bigint DEFAULT NULL,
  PRIMARY KEY (`CUSTOMER_OPTIN_ID`),
  UNIQUE KEY `UKc4fnyu0pvxxtrbko10rm1jqyw` (`EMAIL`,`OPTIN_ID`),
  KEY `FKk5v94dvhsgibaw89hv4m8o5yw` (`MERCHANT_ID`),
  KEY `FK7qym878m07cwvs4foe68lvqjt` (`OPTIN_ID`),
  CONSTRAINT `FK7qym878m07cwvs4foe68lvqjt` FOREIGN KEY (`OPTIN_ID`) REFERENCES `optin` (`OPTIN_ID`),
  CONSTRAINT `FKk5v94dvhsgibaw89hv4m8o5yw` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `merchant_store` (`MERCHANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_optin`
--

LOCK TABLES `customer_optin` WRITE;
/*!40000 ALTER TABLE `customer_optin` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_optin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_option`
--

DROP TABLE IF EXISTS `customer_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_option` (
  `CUSTOMER_OPTION_ID` bigint NOT NULL,
  `CUSTOMER_OPT_ACTIVE` bit(1) DEFAULT NULL,
  `CUSTOMER_OPT_CODE` varchar(255) DEFAULT NULL,
  `CUSTOMER_OPTION_TYPE` varchar(10) DEFAULT NULL,
  `CUSTOMER_OPT_PUBLIC` bit(1) DEFAULT NULL,
  `SORT_ORDER` int DEFAULT NULL,
  `MERCHANT_ID` int NOT NULL,
  PRIMARY KEY (`CUSTOMER_OPTION_ID`),
  UNIQUE KEY `UKrov34a6g4dhhiqukvhp1ggm0u` (`MERCHANT_ID`,`CUSTOMER_OPT_CODE`),
  KEY `CUST_OPT_CODE_IDX` (`CUSTOMER_OPT_CODE`),
  CONSTRAINT `FKcmqnh0rn2hukdfowean5tdy8k` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `merchant_store` (`MERCHANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_option`
--

LOCK TABLES `customer_option` WRITE;
/*!40000 ALTER TABLE `customer_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_option_desc`
--

DROP TABLE IF EXISTS `customer_option_desc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_option_desc` (
  `DESCRIPTION_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(20) DEFAULT NULL,
  `DESCRIPTION` longtext,
  `NAME` varchar(120) NOT NULL,
  `TITLE` varchar(100) DEFAULT NULL,
  `CUSTOMER_OPTION_COMMENT` longtext,
  `LANGUAGE_ID` int NOT NULL,
  `CUSTOMER_OPTION_ID` bigint NOT NULL,
  PRIMARY KEY (`DESCRIPTION_ID`),
  UNIQUE KEY `UK6ovl4t1ciag1wubtcebaoo7vi` (`CUSTOMER_OPTION_ID`,`LANGUAGE_ID`),
  KEY `FKm4iu7v9db17wk2a03xqbqdlfa` (`LANGUAGE_ID`),
  CONSTRAINT `FKc2yiucjbw0wjha8ww7a01qfeo` FOREIGN KEY (`CUSTOMER_OPTION_ID`) REFERENCES `customer_option` (`CUSTOMER_OPTION_ID`),
  CONSTRAINT `FKm4iu7v9db17wk2a03xqbqdlfa` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `language` (`LANGUAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_option_desc`
--

LOCK TABLES `customer_option_desc` WRITE;
/*!40000 ALTER TABLE `customer_option_desc` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_option_desc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_option_set`
--

DROP TABLE IF EXISTS `customer_option_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_option_set` (
  `CUSTOMER_OPTIONSET_ID` bigint NOT NULL,
  `SORT_ORDER` int DEFAULT NULL,
  `CUSTOMER_OPTION_ID` bigint NOT NULL,
  `CUSTOMER_OPTION_VALUE_ID` bigint NOT NULL,
  PRIMARY KEY (`CUSTOMER_OPTIONSET_ID`),
  UNIQUE KEY `UK4peli2ritnnq2xqpyq188srm6` (`CUSTOMER_OPTION_ID`,`CUSTOMER_OPTION_VALUE_ID`),
  KEY `FKj9vnvyh6hhhftjbcsymgiodm9` (`CUSTOMER_OPTION_VALUE_ID`),
  CONSTRAINT `FK1y5qtsuabhpwft3dyhqrgmtb4` FOREIGN KEY (`CUSTOMER_OPTION_ID`) REFERENCES `customer_option` (`CUSTOMER_OPTION_ID`),
  CONSTRAINT `FKj9vnvyh6hhhftjbcsymgiodm9` FOREIGN KEY (`CUSTOMER_OPTION_VALUE_ID`) REFERENCES `customer_option_value` (`CUSTOMER_OPTION_VALUE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_option_set`
--

LOCK TABLES `customer_option_set` WRITE;
/*!40000 ALTER TABLE `customer_option_set` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_option_set` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_option_value`
--

DROP TABLE IF EXISTS `customer_option_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_option_value` (
  `CUSTOMER_OPTION_VALUE_ID` bigint NOT NULL,
  `CUSTOMER_OPT_VAL_CODE` varchar(255) DEFAULT NULL,
  `CUSTOMER_OPT_VAL_IMAGE` varchar(255) DEFAULT NULL,
  `SORT_ORDER` int DEFAULT NULL,
  `MERCHANT_ID` int NOT NULL,
  PRIMARY KEY (`CUSTOMER_OPTION_VALUE_ID`),
  UNIQUE KEY `UKcb1fmv71nrx7m1rlx1ff5qvdt` (`MERCHANT_ID`,`CUSTOMER_OPT_VAL_CODE`),
  KEY `CUST_OPT_VAL_CODE_IDX` (`CUSTOMER_OPT_VAL_CODE`),
  CONSTRAINT `FKho87ssg5rnvwauj3y690a96g6` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `merchant_store` (`MERCHANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_option_value`
--

LOCK TABLES `customer_option_value` WRITE;
/*!40000 ALTER TABLE `customer_option_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_option_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_review`
--

DROP TABLE IF EXISTS `customer_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_review` (
  `CUSTOMER_REVIEW_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(20) DEFAULT NULL,
  `REVIEW_DATE` datetime DEFAULT NULL,
  `REVIEWS_RATING` double DEFAULT NULL,
  `REVIEWS_READ` bigint DEFAULT NULL,
  `STATUS` int DEFAULT NULL,
  `CUSTOMERS_ID` bigint DEFAULT NULL,
  `REVIEWED_CUSTOMER_ID` bigint DEFAULT NULL,
  PRIMARY KEY (`CUSTOMER_REVIEW_ID`),
  UNIQUE KEY `UK2momthbfrtgico2yyod8w18pk` (`CUSTOMERS_ID`,`REVIEWED_CUSTOMER_ID`),
  KEY `FK7pmqdk9od2af7cl6alx82fkek` (`REVIEWED_CUSTOMER_ID`),
  CONSTRAINT `FK7pmqdk9od2af7cl6alx82fkek` FOREIGN KEY (`REVIEWED_CUSTOMER_ID`) REFERENCES `customer` (`CUSTOMER_ID`),
  CONSTRAINT `FKayt6tbxp7d4g1qyg8crw2n73p` FOREIGN KEY (`CUSTOMERS_ID`) REFERENCES `customer` (`CUSTOMER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_review`
--

LOCK TABLES `customer_review` WRITE;
/*!40000 ALTER TABLE `customer_review` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_review_description`
--

DROP TABLE IF EXISTS `customer_review_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_review_description` (
  `DESCRIPTION_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(20) DEFAULT NULL,
  `DESCRIPTION` longtext,
  `NAME` varchar(120) NOT NULL,
  `TITLE` varchar(100) DEFAULT NULL,
  `LANGUAGE_ID` int NOT NULL,
  `CUSTOMER_REVIEW_ID` bigint DEFAULT NULL,
  PRIMARY KEY (`DESCRIPTION_ID`),
  UNIQUE KEY `UK1va9q0nhoe3wli25ktpmouvyh` (`CUSTOMER_REVIEW_ID`,`LANGUAGE_ID`),
  KEY `FK5pkgrlk32uqaxkrbve5mws1hj` (`LANGUAGE_ID`),
  CONSTRAINT `FK5pkgrlk32uqaxkrbve5mws1hj` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `language` (`LANGUAGE_ID`),
  CONSTRAINT `FKhf88oagf6t62k28afn8uaijc7` FOREIGN KEY (`CUSTOMER_REVIEW_ID`) REFERENCES `customer_review` (`CUSTOMER_REVIEW_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_review_description`
--

LOCK TABLES `customer_review_description` WRITE;
/*!40000 ALTER TABLE `customer_review_description` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_review_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_history`
--

DROP TABLE IF EXISTS `file_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `file_history` (
  `FILE_HISTORY_ID` bigint NOT NULL,
  `ACCOUNTED_DATE` datetime DEFAULT NULL,
  `DATE_ADDED` datetime NOT NULL,
  `DATE_DELETED` datetime DEFAULT NULL,
  `DOWNLOAD_COUNT` int NOT NULL,
  `FILE_ID` bigint DEFAULT NULL,
  `FILESIZE` int NOT NULL,
  `MERCHANT_ID` int NOT NULL,
  PRIMARY KEY (`FILE_HISTORY_ID`),
  UNIQUE KEY `UKav35sb3v4nxq8v1n1rkxufir` (`MERCHANT_ID`,`FILE_ID`),
  CONSTRAINT `FK2k8h4penkjlbtc23vamwyek2g` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `merchant_store` (`MERCHANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_history`
--

LOCK TABLES `file_history` WRITE;
/*!40000 ALTER TABLE `file_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `file_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geozone`
--

DROP TABLE IF EXISTS `geozone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `geozone` (
  `GEOZONE_ID` bigint NOT NULL,
  `GEOZONE_CODE` varchar(255) DEFAULT NULL,
  `GEOZONE_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`GEOZONE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geozone`
--

LOCK TABLES `geozone` WRITE;
/*!40000 ALTER TABLE `geozone` DISABLE KEYS */;
/*!40000 ALTER TABLE `geozone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geozone_description`
--

DROP TABLE IF EXISTS `geozone_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `geozone_description` (
  `DESCRIPTION_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(20) DEFAULT NULL,
  `DESCRIPTION` longtext,
  `NAME` varchar(120) NOT NULL,
  `TITLE` varchar(100) DEFAULT NULL,
  `LANGUAGE_ID` int NOT NULL,
  `GEOZONE_ID` bigint DEFAULT NULL,
  PRIMARY KEY (`DESCRIPTION_ID`),
  UNIQUE KEY `UKsoq8o99w3c8ys3ntamt5i4mat` (`GEOZONE_ID`,`LANGUAGE_ID`),
  KEY `FK1t2hp628edebe5d6co2whbla9` (`LANGUAGE_ID`),
  CONSTRAINT `FK1t2hp628edebe5d6co2whbla9` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `language` (`LANGUAGE_ID`),
  CONSTRAINT `FKn82te2yb2st4hk2qlhl8ileb9` FOREIGN KEY (`GEOZONE_ID`) REFERENCES `geozone` (`GEOZONE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geozone_description`
--

LOCK TABLES `geozone_description` WRITE;
/*!40000 ALTER TABLE `geozone_description` DISABLE KEYS */;
/*!40000 ALTER TABLE `geozone_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language`
--

DROP TABLE IF EXISTS `language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `language` (
  `LANGUAGE_ID` int NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(20) DEFAULT NULL,
  `CODE` varchar(255) NOT NULL,
  `SORT_ORDER` int DEFAULT NULL,
  PRIMARY KEY (`LANGUAGE_ID`),
  KEY `CODE_IDX2` (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language`
--

LOCK TABLES `language` WRITE;
/*!40000 ALTER TABLE `language` DISABLE KEYS */;
INSERT INTO `language` VALUES (1,'2020-06-26 10:05:05','2020-06-26 10:05:05',NULL,'en',NULL),(2,'2020-06-26 10:05:06','2020-06-26 10:05:06',NULL,'fr',NULL);
/*!40000 ALTER TABLE `language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufacturer`
--

DROP TABLE IF EXISTS `manufacturer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manufacturer` (
  `MANUFACTURER_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(20) DEFAULT NULL,
  `CODE` varchar(100) NOT NULL,
  `MANUFACTURER_IMAGE` varchar(255) DEFAULT NULL,
  `SORT_ORDER` int DEFAULT NULL,
  `MERCHANT_ID` int NOT NULL,
  PRIMARY KEY (`MANUFACTURER_ID`),
  UNIQUE KEY `UK6brqfdkga7jc78n8dh3v595y3` (`MERCHANT_ID`,`CODE`),
  CONSTRAINT `FKhswph4nthrqwffjekccudsrt2` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `merchant_store` (`MERCHANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufacturer`
--

LOCK TABLES `manufacturer` WRITE;
/*!40000 ALTER TABLE `manufacturer` DISABLE KEYS */;
INSERT INTO `manufacturer` VALUES (1,'2020-06-26 10:05:15','2020-06-26 10:05:15',NULL,'DEFAULT',NULL,0,1),(2,'2020-06-26 10:05:16','2020-06-26 10:05:16',NULL,'oreilley',NULL,0,1),(3,'2020-06-26 10:05:16','2020-06-26 10:05:16',NULL,'sams',NULL,0,1),(4,'2020-06-26 10:05:16','2020-06-26 10:05:16',NULL,'packt',NULL,0,1),(5,'2020-06-26 10:05:16','2020-06-26 10:05:16',NULL,'manning',NULL,0,1),(6,'2020-06-26 10:05:16','2020-06-26 10:05:16',NULL,'novells',NULL,0,1);
/*!40000 ALTER TABLE `manufacturer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufacturer_description`
--

DROP TABLE IF EXISTS `manufacturer_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manufacturer_description` (
  `DESCRIPTION_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(20) DEFAULT NULL,
  `DESCRIPTION` longtext,
  `NAME` varchar(120) NOT NULL,
  `TITLE` varchar(100) DEFAULT NULL,
  `DATE_LAST_CLICK` datetime DEFAULT NULL,
  `MANUFACTURERS_URL` varchar(255) DEFAULT NULL,
  `URL_CLICKED` int DEFAULT NULL,
  `LANGUAGE_ID` int NOT NULL,
  `MANUFACTURER_ID` bigint NOT NULL,
  PRIMARY KEY (`DESCRIPTION_ID`),
  UNIQUE KEY `UKlpv09p83sc887clxe04nroup6` (`MANUFACTURER_ID`,`LANGUAGE_ID`),
  KEY `FK20t33wr4tp1kt1uyw7s8a3afl` (`LANGUAGE_ID`),
  CONSTRAINT `FK20t33wr4tp1kt1uyw7s8a3afl` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `language` (`LANGUAGE_ID`),
  CONSTRAINT `FKre4iys57n5cfbgpg3qqgewtrh` FOREIGN KEY (`MANUFACTURER_ID`) REFERENCES `manufacturer` (`MANUFACTURER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufacturer_description`
--

LOCK TABLES `manufacturer_description` WRITE;
/*!40000 ALTER TABLE `manufacturer_description` DISABLE KEYS */;
INSERT INTO `manufacturer_description` VALUES (1,'2020-06-26 10:05:15','2020-06-26 10:05:15',NULL,'DEFAULT','DEFAULT',NULL,NULL,NULL,NULL,1,1),(2,'2020-06-26 10:05:16','2020-06-26 10:05:16',NULL,NULL,'O\'Reilley',NULL,NULL,NULL,NULL,1,2),(3,'2020-06-26 10:05:16','2020-06-26 10:05:16',NULL,NULL,'Sams',NULL,NULL,NULL,NULL,1,3),(4,'2020-06-26 10:05:16','2020-06-26 10:05:16',NULL,NULL,'Packt',NULL,NULL,NULL,NULL,1,4),(5,'2020-06-26 10:05:16','2020-06-26 10:05:16',NULL,NULL,'Manning',NULL,NULL,NULL,NULL,1,5),(6,'2020-06-26 10:05:16','2020-06-26 10:05:16',NULL,NULL,'Novells publishing',NULL,NULL,NULL,NULL,1,6);
/*!40000 ALTER TABLE `manufacturer_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `merchant_configuration`
--

DROP TABLE IF EXISTS `merchant_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `merchant_configuration` (
  `MERCHANT_CONFIG_ID` bigint NOT NULL,
  `ACTIVE` bit(1) DEFAULT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(20) DEFAULT NULL,
  `CONFIG_KEY` varchar(255) DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `VALUE` longtext,
  `MERCHANT_ID` int DEFAULT NULL,
  PRIMARY KEY (`MERCHANT_CONFIG_ID`),
  UNIQUE KEY `UKj0c3h8onw3m6hjcr3yylst9fb` (`MERCHANT_ID`,`CONFIG_KEY`),
  CONSTRAINT `FKf9bkgf0ysbp5fo9j69shm0pri` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `merchant_store` (`MERCHANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `merchant_configuration`
--

LOCK TABLES `merchant_configuration` WRITE;
/*!40000 ALTER TABLE `merchant_configuration` DISABLE KEYS */;
INSERT INTO `merchant_configuration` VALUES (1,_binary '\0','2020-06-26 10:05:16','2020-08-09 21:58:32',NULL,'CONFIG','CONFIG','{\"allowPurchaseItems\":true,\"displayContactUs\":false,\"displayCustomerAgreement\":true,\"defaultSearchConfigPath\":{},\"displayCustomerSection\":true,\"displayAddToCartOnFeaturedItems\":true,\"testMode\":false,\"displayStoreAddress\":true,\"displaySearchBox\":false,\"debugMode\":false,\"useDefaultSearchConfig\":{}}',1),(50,_binary '\0','2020-06-26 12:53:17','2020-08-09 22:01:16',NULL,'SUPPORTED_CNTR','INTEGRATION','[\"IN\",\"AU\"]',1),(51,_binary '\0','2020-06-26 12:53:20','2020-08-09 22:01:54',NULL,'SHIPPING_CONFIG','INTEGRATION','{\"boxLength\":0,\"orderTotalFreeShipping\":0.00,\"shipBaseType\":\"SHIPPING\",\"shipOptionPriceType\":\"ALL\",\"maxWeight\":0.0,\"boxHeight\":0,\"shipFreeType\":\"INTERNATIONAL\",\"taxOnShipping\":false,\"shipPackageType\":\"ITEM\",\"freeShippingEnabled\":true,\"boxWeight\":0.0,\"shipType\":\"INTERNATIONAL\",\"boxWidth\":0,\"handlingFees\":null,\"shipDescription\":\"SHORT_DESCRIPTION\"}',1),(100,_binary '\0','2020-08-09 22:00:48','2020-08-09 22:01:06',NULL,'weightBased','INTEGRATION','{\"moduleCode\":\"weightBased\",\"active\":true,\"regions\":[{\"customRegionName\":\"india\"}]}',1),(101,_binary '\0','2020-08-09 22:01:06','2020-08-09 22:01:06',NULL,'SHIPPING','INTEGRATION','df02614ab6600db0eb4d78e2c4df55740a3632c23495d207674f0bdef76266c558848e0339163624c5fc30cda898f9b1',1),(102,_binary '\0','2020-08-09 22:02:52','2020-08-09 22:02:52',NULL,'PAYMENT','INTEGRATION','df02614ab6600db0eb4d78e2c4df5574f9ba1903c78f9da01dded48dcbe5fa1395559a2eb8160dd8615b22e900932a7bac035d6eaa57b1ec05f4cedf94c2d8054819918ba0b244669d6987678949825eee5e06278ad1acdb473840b69721531c51e62999ba70c79fdd7257895873ce0ee04309e49440c5940bb98d35a29943cfb0affa37507588224e82b7ed434608f591332c17a8613edc99398af6fde1beedb569de78add9af5196304fd2c4c2d0f22e7c7cda4ca5c52dee8e3bd8257e9b78ebee78456bf31ddfef7d44b1ece3564655c33f064411e6897c54ff534595f99154b60deb85cbead4f4fd0dbbbe4be101658bfd22c81703649cc72f0c16f14de08912e651f1de15a020d9819cc24d58c63530f15dc6bb9fe9efff73dc54bb2876e0a0f9b3d197f2395ee70d1306ced10908b651864a7ad1fd679bfba2fed9f731cb7a1997db7b58927419933cd1406e5abb202b14bb0243f9aca6e91fcce5f248d0d6b2b446580aba48434b2d0d80638d3479f01430920869d766595f8b2564c533e6783c4d50a3ff1461b3d1eb92cbc1867fcebcbeb40db7e838089d709e568b36210ed23a50cd79f307332fe506f0fd63f67219ccd618a41eda66bd863cd517d11f9b8c93e435b64678ca60c915ae096dde7f18ea72c11773f59dd042a89b453068eb05802374d018f5039823ab3305bdba21fba091ed3524726a5211095e270d60bc7313d2c3d76504e6a71795481944425ae4c54b44c82c1e0e7f8a7a2485aeb129f6b3da0f715239f7da45a7520ab34202b1e9d3a027eb52c9ee4c018a636f662604d3d7f6ecb1fa469756f5dbbdba5b60699c0e4ef2476f81b17162ad070ff31024270c21ef69ae9020d9a5af361c9c7fa39f1589b6b2b0eaad44b5afef927f027e56c455e842f1e4d200ca7940269f08e3afe161b30f756499078c3ebbc9bd850ecdb3aae08c23f6f4271401577efd61837bde6f0f315e6ad5bb10027157e3b49091903fdc60f9d9d76820063f2e8fece84d82ba0a27495ce7cca1a6a78fc221fc67eb415e472e48217d5fc00abcd3ee98da3f745859e8da97c97aebc751e36c7642d4ff74adc8fa6f778c477029a8f1361fa9ee7c8456242f9913c26e221d87940433fc8b9e3c3748eb783aeb47eb3f5f0bdee71c05393b6ae8530e1e7655d66563738037c563019f3ab9c309a837e12db82bbaa543b9bdde9db98fe2eb825d8aff5d219d4ddefc245ba1bf514772070e78c9bf0a2f43bf1cb46b5eceba92ee3b2733cf0d8e7e82c5f6d9e61a47d7a69797d8c8f6eab5cc9f3217a4268ab3993b96320f469418b2f058ce27b5ad0e0ed99ca946e6cae4cfe0eb390959521e1c163e2d86fec33c3743392dfa770747151c04fd40db75b630d7ee1cbf5ea1bcc03f6149f2b09d738520b22472f0e880476e15a4e2a1558868add2d440117d4a89a1ab2f1004725fb54aaf100e13c19fb1ea7acd111d398c52183399cc504103dc6dedbfe118ff3d2586e33af081',1);
/*!40000 ALTER TABLE `merchant_configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `merchant_language`
--

DROP TABLE IF EXISTS `merchant_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `merchant_language` (
  `stores_MERCHANT_ID` int NOT NULL,
  `languages_LANGUAGE_ID` int NOT NULL,
  KEY `FKjwy0pjijh1qmcoivq50o2jgec` (`languages_LANGUAGE_ID`),
  KEY `FKiisj0tmoujv6n3iqmytvo39kn` (`stores_MERCHANT_ID`),
  CONSTRAINT `FKiisj0tmoujv6n3iqmytvo39kn` FOREIGN KEY (`stores_MERCHANT_ID`) REFERENCES `merchant_store` (`MERCHANT_ID`),
  CONSTRAINT `FKjwy0pjijh1qmcoivq50o2jgec` FOREIGN KEY (`languages_LANGUAGE_ID`) REFERENCES `language` (`LANGUAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `merchant_language`
--

LOCK TABLES `merchant_language` WRITE;
/*!40000 ALTER TABLE `merchant_language` DISABLE KEYS */;
INSERT INTO `merchant_language` VALUES (1,1),(1,2);
/*!40000 ALTER TABLE `merchant_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `merchant_log`
--

DROP TABLE IF EXISTS `merchant_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `merchant_log` (
  `MERCHANT_LOG_ID` bigint NOT NULL,
  `LOG` longtext,
  `MODULE` varchar(25) DEFAULT NULL,
  `MERCHANT_ID` int NOT NULL,
  PRIMARY KEY (`MERCHANT_LOG_ID`),
  KEY `FKto727b9r68qrtn2vvdqdvd4ic` (`MERCHANT_ID`),
  CONSTRAINT `FKto727b9r68qrtn2vvdqdvd4ic` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `merchant_store` (`MERCHANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `merchant_log`
--

LOCK TABLES `merchant_log` WRITE;
/*!40000 ALTER TABLE `merchant_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `merchant_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `merchant_store`
--

DROP TABLE IF EXISTS `merchant_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `merchant_store` (
  `MERCHANT_ID` int NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(20) DEFAULT NULL,
  `STORE_CODE` varchar(100) NOT NULL,
  `CONTINUESHOPPINGURL` varchar(150) DEFAULT NULL,
  `CURRENCY_FORMAT_NATIONAL` bit(1) DEFAULT NULL,
  `DOMAIN_NAME` varchar(80) DEFAULT NULL,
  `IN_BUSINESS_SINCE` date DEFAULT NULL,
  `INVOICE_TEMPLATE` varchar(25) DEFAULT NULL,
  `IS_RETAILER` bit(1) DEFAULT NULL,
  `SEIZEUNITCODE` varchar(5) DEFAULT NULL,
  `STORE_EMAIL` varchar(60) NOT NULL,
  `STORE_LOGO` varchar(100) DEFAULT NULL,
  `STORE_TEMPLATE` varchar(25) DEFAULT NULL,
  `STORE_ADDRESS` varchar(255) DEFAULT NULL,
  `STORE_CITY` varchar(100) DEFAULT NULL,
  `STORE_NAME` varchar(100) NOT NULL,
  `STORE_PHONE` varchar(50) DEFAULT NULL,
  `STORE_POSTAL_CODE` varchar(15) DEFAULT NULL,
  `STORE_STATE_PROV` varchar(100) DEFAULT NULL,
  `USE_CACHE` bit(1) DEFAULT NULL,
  `WEIGHTUNITCODE` varchar(5) DEFAULT NULL,
  `COUNTRY_ID` int NOT NULL,
  `CURRENCY_ID` bigint NOT NULL,
  `LANGUAGE_ID` int NOT NULL,
  `PARENT_ID` int DEFAULT NULL,
  `ZONE_ID` bigint DEFAULT NULL,
  PRIMARY KEY (`MERCHANT_ID`),
  UNIQUE KEY `UK_4pvtsnqv4nlao8725n9ldpguf` (`STORE_CODE`),
  KEY `FK2gn7vpkd9x832urw7c6jlawnn` (`COUNTRY_ID`),
  KEY `FK63hlw9wp1k1x3f5tke7t2us7s` (`CURRENCY_ID`),
  KEY `FKdnemo9tl8tjhkxko83psvkv19` (`LANGUAGE_ID`),
  KEY `FKgkoele515h76u39b9defibkm9` (`PARENT_ID`),
  KEY `FK5o24aky9161jyofyxmg0g53vv` (`ZONE_ID`),
  CONSTRAINT `FK2gn7vpkd9x832urw7c6jlawnn` FOREIGN KEY (`COUNTRY_ID`) REFERENCES `country` (`COUNTRY_ID`),
  CONSTRAINT `FK5o24aky9161jyofyxmg0g53vv` FOREIGN KEY (`ZONE_ID`) REFERENCES `zone` (`ZONE_ID`),
  CONSTRAINT `FK63hlw9wp1k1x3f5tke7t2us7s` FOREIGN KEY (`CURRENCY_ID`) REFERENCES `currency` (`CURRENCY_ID`),
  CONSTRAINT `FKdnemo9tl8tjhkxko83psvkv19` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `language` (`LANGUAGE_ID`),
  CONSTRAINT `FKgkoele515h76u39b9defibkm9` FOREIGN KEY (`PARENT_ID`) REFERENCES `merchant_store` (`MERCHANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `merchant_store`
--

LOCK TABLES `merchant_store` WRITE;
/*!40000 ALTER TABLE `merchant_store` DISABLE KEYS */;
INSERT INTO `merchant_store` VALUES (1,NULL,NULL,NULL,'DEFAULT',NULL,_binary '\0','localhost:8080','2020-06-26',NULL,_binary '\0','CM','shopon@skillassure.com','ShopOn Logo-1.png','december','#184/185, 2nd Street, White Field','Bangalore','ShopOn','9876549898','560066','Karnataka',_binary '\0','KG',37,132,1,NULL,NULL);
/*!40000 ALTER TABLE `merchant_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `module_configuration`
--

DROP TABLE IF EXISTS `module_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `module_configuration` (
  `MODULE_CONF_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(20) DEFAULT NULL,
  `CODE` varchar(255) NOT NULL,
  `DETAILS` longtext,
  `CONFIGURATION` longtext,
  `CUSTOM_IND` bit(1) DEFAULT NULL,
  `IMAGE` varchar(255) DEFAULT NULL,
  `MODULE` varchar(255) DEFAULT NULL,
  `REGIONS` varchar(255) DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`MODULE_CONF_ID`),
  KEY `MODULE_CONFIGURATION_MODULE` (`MODULE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module_configuration`
--

LOCK TABLES `module_configuration` WRITE;
/*!40000 ALTER TABLE `module_configuration` DISABLE KEYS */;
INSERT INTO `module_configuration` VALUES (1,'2020-06-26 10:05:15','2020-06-26 10:05:15',NULL,'usps',NULL,'[{\"scheme\":\"http\",\"host\":\"testing.shippingapis.com\",\"port\":\"80\",\"uri\":\"/ShippingAPI.dll\",\"env\":\"TEST\",\"config1\":null,\"config2\":null},{\"scheme\":\"http\",\"host\":\"production.shippingapis.com\",\"port\":\"80\",\"uri\":\"/ShippingAPI.dll\",\"env\":\"PROD\",\"config1\":null,\"config2\":null}]',_binary '\0','usps.jpg','SHIPPING','[\"US\"]',NULL),(2,'2020-06-26 10:05:15','2020-06-26 10:05:15',NULL,'canadapost',NULL,'[{\"scheme\":\"https\",\"host\":\"ct.soa-gw.canadapost.ca\",\"port\":\"443\",\"uri\":\"/rs/ship/price\",\"env\":\"TEST\",\"config1\":null,\"config2\":null},{\"scheme\":\"https\",\"host\":\"soa-gw.canadapost.ca\",\"port\":\"443\",\"uri\":\"/rs/ship/price\",\"env\":\"PROD\",\"config1\":null,\"config2\":null}]',_binary '\0','canadapost.jpg','SHIPPING','[\"CA\"]',NULL),(3,'2020-06-26 10:05:15','2020-06-26 10:05:15',NULL,'ups','{\"01\":\"UPS Next Day Air\",\"02\":\"UPS Second Day Air\",\"03\":\"UPS Ground\",\"07\":\"UPS Worldwide Express\",\"08\":\"UPS Worldwide Expedited\",\"11\":\"UPS Standard\",\"12\":\"UPS Three-Day Select\",\"13\":\"UPS Next Day Air Saver\",\"14\":\"UPS Next Day Air Early A.M.\",\"54\":\"UPS Worldwide Express Plus\",\"59\":\"UPS Second Day Air A.M.\",\"69\":\"UPS Saver\"}','[{\"scheme\":\"https\",\"host\":\"wwwcie.ups.com\",\"port\":\"443\",\"uri\":\"/ups.app/xml/Rate\",\"env\":\"TEST\",\"config1\":null,\"config2\":null},{\"scheme\":\"https\",\"host\":\"onlinetools.ups.com\",\"port\":\"443\",\"uri\":\"/xml/Rate\",\"env\":\"PROD\",\"config1\":null,\"config2\":null}]',_binary '\0','ups.jpg','SHIPPING','[\"US\",\"CA\",\"FR\",\"GB\"]',NULL),(4,'2020-06-26 10:05:15','2020-06-26 10:05:15',NULL,'weightBased',NULL,NULL,_binary '',NULL,'SHIPPING','[\"*\"]',NULL),(5,'2020-06-26 10:05:15','2020-06-26 10:05:15',NULL,'customQuotesRules',NULL,NULL,_binary '\0',NULL,'SHIPPING','[\"*\"]',NULL),(6,'2020-06-26 10:05:15','2020-06-26 10:05:15',NULL,'priceByDistance',NULL,NULL,_binary '\0',NULL,'SHIPPING','[\"*\"]',NULL),(7,'2020-06-26 10:05:15','2020-06-26 10:05:15',NULL,'storePickUp',NULL,NULL,_binary '\0',NULL,'SHIPPING','[\"*\"]',NULL),(8,'2020-06-26 10:05:15','2020-06-26 10:05:15',NULL,'moneyorder',NULL,NULL,_binary '\0','moneyorder.gif','PAYMENT','[\"*\"]','moneyorder'),(9,'2020-06-26 10:05:15','2020-06-26 10:05:15',NULL,'paypal-express-checkout',NULL,'[{\"scheme\":\"\",\"host\":\"\",\"port\":\"\",\"uri\":\"\",\"env\":\"TEST\",\"config1\":\"https://www.sandbox.paypal.com/cgi-bin/webscr?cmd=_express-checkout&token=\",\"config2\":null},{\"scheme\":\"\",\"host\":\"\",\"port\":\"\",\"uri\":\"\",\"env\":\"PROD\",\"config1\":\"https://www.paypal.com/cgi-bin/webscr?cmd=_express-checkout&token=\",\"config2\":null}]',_binary '\0','icon-paypal.png','PAYMENT','[\"*\"]','paypal'),(10,'2020-06-26 10:05:15','2020-06-26 10:05:15',NULL,'beanstream',NULL,'[{\"scheme\":\"https\",\"host\":\"www.beanstream.com\",\"port\":\"443\",\"uri\":\"/scripts/process_transaction.asp\",\"env\":\"TEST\",\"config1\":null,\"config2\":null},{\"scheme\":\"https\",\"host\":\"www.beanstream.com\",\"port\":\"443\",\"uri\":\"/scripts/process_transaction.asp\",\"env\":\"PROD\",\"config1\":null,\"config2\":null}]',_binary '\0','beanstream.gif','PAYMENT','[\"US\",\"CA\",\"GB\"]','creditcard'),(11,'2020-06-26 10:05:15','2020-06-26 10:05:15',NULL,'stripe',NULL,'[{\"scheme\":\"https\",\"host\":\"www.stripe.com\",\"port\":\"443\",\"uri\":\"/\",\"env\":\"TEST\",\"config1\":null,\"config2\":null},{\"scheme\":\"https\",\"host\":\"www.stripe.com\",\"port\":\"443\",\"uri\":\"/\",\"env\":\"PROD\",\"config1\":null,\"config2\":null}]',_binary '\0','stripe.png','PAYMENT','[\"US\",\"CA\",\"GB\",\"AU\",\"FI\",\"DK\",\"IE\",\"NO\",\"SE\"]','creditcard'),(12,'2020-06-26 10:05:15','2020-06-26 10:05:15',NULL,'braintree',NULL,'[{\"scheme\":\"https\",\"host\":\"NOTREQUIRED\",\"port\":\"NOTREQUIRED\",\"uri\":\"NOTREQUIRED\",\"env\":\"TEST\",\"config1\":null,\"config2\":null},{\"scheme\":\"https\",\"host\":\"NOTREQUIRED\",\"port\":\"NOTREQUIRED\",\"uri\":\"NOTREQUIRED\",\"env\":\"PROD\",\"config1\":null,\"config2\":null}]',_binary '\0','braintree.jpg','PAYMENT','[\"US\",\"CA\",\"GB\",\"AU\",\"FI\",\"DK\",\"IE\",\"NO\",\"SE\",\"AL\",\"AD\",\"AT\",\"BY\",\"BE\",\"BG\",\"HY\",\"CY\",\"CZ\",\"FR\",\"GR\",\"IS\",\"IE\",\"IM\",\"IT\",\"PL\",\"LU\",\"CH\",\"RS\",\"SG\",\"MY\",\"HK\",\"NZ\"]','creditcard');
/*!40000 ALTER TABLE `module_configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `optin`
--

DROP TABLE IF EXISTS `optin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `optin` (
  `OPTIN_ID` bigint NOT NULL,
  `CODE` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `END_DATE` datetime DEFAULT NULL,
  `TYPE` varchar(255) NOT NULL,
  `START_DATE` datetime DEFAULT NULL,
  `MERCHANT_ID` int DEFAULT NULL,
  PRIMARY KEY (`OPTIN_ID`),
  UNIQUE KEY `UKmanlx6siq6ddf14cud40k8gw6` (`MERCHANT_ID`,`CODE`),
  CONSTRAINT `FK37xvfo4the20avv7f1e1771fh` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `merchant_store` (`MERCHANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `optin`
--

LOCK TABLES `optin` WRITE;
/*!40000 ALTER TABLE `optin` DISABLE KEYS */;
INSERT INTO `optin` VALUES (1,'NEWSLETTER',NULL,NULL,'NEWSLETTER',NULL,1);
/*!40000 ALTER TABLE `optin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_account`
--

DROP TABLE IF EXISTS `order_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_account` (
  `ORDER_ACCOUNT_ID` bigint NOT NULL,
  `ORDER_ACCOUNT_BILL_DAY` int NOT NULL,
  `ORDER_ACCOUNT_END_DATE` date DEFAULT NULL,
  `ORDER_ACCOUNT_START_DATE` date NOT NULL,
  `ORDER_ID` bigint NOT NULL,
  PRIMARY KEY (`ORDER_ACCOUNT_ID`),
  KEY `FKi6l5isodh81m5hy8ua06hx73n` (`ORDER_ID`),
  CONSTRAINT `FKi6l5isodh81m5hy8ua06hx73n` FOREIGN KEY (`ORDER_ID`) REFERENCES `orders` (`ORDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_account`
--

LOCK TABLES `order_account` WRITE;
/*!40000 ALTER TABLE `order_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_account_product`
--

DROP TABLE IF EXISTS `order_account_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_account_product` (
  `ORDER_ACCOUNT_PRODUCT_ID` bigint NOT NULL,
  `ORDER_ACCOUNT_PRODUCT_ACCNT_DT` date DEFAULT NULL,
  `ORDER_ACCOUNT_PRODUCT_END_DT` date DEFAULT NULL,
  `ORDER_ACCOUNT_PRODUCT_EOT` datetime DEFAULT NULL,
  `ORDER_ACCOUNT_PRODUCT_L_ST_DT` datetime DEFAULT NULL,
  `ORDER_ACCOUNT_PRODUCT_L_TRX_ST` int NOT NULL,
  `ORDER_ACCOUNT_PRODUCT_PM_FR_TY` int NOT NULL,
  `ORDER_ACCOUNT_PRODUCT_ST_DT` date NOT NULL,
  `ORDER_ACCOUNT_PRODUCT_STATUS` int NOT NULL,
  `ORDER_ACCOUNT_ID` bigint NOT NULL,
  `ORDER_PRODUCT_ID` bigint NOT NULL,
  PRIMARY KEY (`ORDER_ACCOUNT_PRODUCT_ID`),
  KEY `FK7oxc8ygov7vd2ajt185jhiwts` (`ORDER_ACCOUNT_ID`),
  KEY `FK5kiyyb8ekqi9bfowytww8atcx` (`ORDER_PRODUCT_ID`),
  CONSTRAINT `FK5kiyyb8ekqi9bfowytww8atcx` FOREIGN KEY (`ORDER_PRODUCT_ID`) REFERENCES `order_product` (`ORDER_PRODUCT_ID`),
  CONSTRAINT `FK7oxc8ygov7vd2ajt185jhiwts` FOREIGN KEY (`ORDER_ACCOUNT_ID`) REFERENCES `order_account` (`ORDER_ACCOUNT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_account_product`
--

LOCK TABLES `order_account_product` WRITE;
/*!40000 ALTER TABLE `order_account_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_account_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_attribute`
--

DROP TABLE IF EXISTS `order_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_attribute` (
  `ORDER_ATTRIBUTE_ID` bigint NOT NULL,
  `IDENTIFIER` varchar(255) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  `ORDER_ID` bigint NOT NULL,
  PRIMARY KEY (`ORDER_ATTRIBUTE_ID`),
  KEY `FK4nw5yrtgb4in6leve76bmdnua` (`ORDER_ID`),
  CONSTRAINT `FK4nw5yrtgb4in6leve76bmdnua` FOREIGN KEY (`ORDER_ID`) REFERENCES `orders` (`ORDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_attribute`
--

LOCK TABLES `order_attribute` WRITE;
/*!40000 ALTER TABLE `order_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_product`
--

DROP TABLE IF EXISTS `order_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_product` (
  `ORDER_PRODUCT_ID` bigint NOT NULL,
  `ONETIME_CHARGE` decimal(19,2) NOT NULL,
  `PRODUCT_NAME` varchar(64) NOT NULL,
  `PRODUCT_QUANTITY` int DEFAULT NULL,
  `PRODUCT_SKU` varchar(255) DEFAULT NULL,
  `ORDER_ID` bigint NOT NULL,
  PRIMARY KEY (`ORDER_PRODUCT_ID`),
  KEY `FKf0sghmn59s14cxrjtrvkvi5yk` (`ORDER_ID`),
  CONSTRAINT `FKf0sghmn59s14cxrjtrvkvi5yk` FOREIGN KEY (`ORDER_ID`) REFERENCES `orders` (`ORDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_product`
--

LOCK TABLES `order_product` WRITE;
/*!40000 ALTER TABLE `order_product` DISABLE KEYS */;
INSERT INTO `order_product` VALUES (1,19.99,'Product name',1,'TB12345',1);
/*!40000 ALTER TABLE `order_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_product_attribute`
--

DROP TABLE IF EXISTS `order_product_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_product_attribute` (
  `ORDER_PRODUCT_ATTRIBUTE_ID` bigint NOT NULL,
  `PRODUCT_ATTRIBUTE_IS_FREE` bit(1) NOT NULL,
  `PRODUCT_ATTRIBUTE_NAME` varchar(255) DEFAULT NULL,
  `PRODUCT_ATTRIBUTE_PRICE` decimal(15,4) NOT NULL,
  `PRODUCT_ATTRIBUTE_VAL_NAME` varchar(255) DEFAULT NULL,
  `PRODUCT_ATTRIBUTE_WEIGHT` decimal(15,4) DEFAULT NULL,
  `PRODUCT_OPTION_ID` bigint NOT NULL,
  `PRODUCT_OPTION_VALUE_ID` bigint NOT NULL,
  `ORDER_PRODUCT_ID` bigint NOT NULL,
  PRIMARY KEY (`ORDER_PRODUCT_ATTRIBUTE_ID`),
  KEY `FK7j86rvwaysbok1nuofrnmhmkx` (`ORDER_PRODUCT_ID`),
  CONSTRAINT `FK7j86rvwaysbok1nuofrnmhmkx` FOREIGN KEY (`ORDER_PRODUCT_ID`) REFERENCES `order_product` (`ORDER_PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_product_attribute`
--

LOCK TABLES `order_product_attribute` WRITE;
/*!40000 ALTER TABLE `order_product_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_product_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_product_download`
--

DROP TABLE IF EXISTS `order_product_download`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_product_download` (
  `ORDER_PRODUCT_DOWNLOAD_ID` bigint NOT NULL,
  `DOWNLOAD_COUNT` int NOT NULL,
  `DOWNLOAD_MAXDAYS` int NOT NULL,
  `ORDER_PRODUCT_FILENAME` varchar(255) NOT NULL,
  `ORDER_PRODUCT_ID` bigint NOT NULL,
  PRIMARY KEY (`ORDER_PRODUCT_DOWNLOAD_ID`),
  KEY `FKstrda0eweharld63j8pxa2o2r` (`ORDER_PRODUCT_ID`),
  CONSTRAINT `FKstrda0eweharld63j8pxa2o2r` FOREIGN KEY (`ORDER_PRODUCT_ID`) REFERENCES `order_product` (`ORDER_PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_product_download`
--

LOCK TABLES `order_product_download` WRITE;
/*!40000 ALTER TABLE `order_product_download` DISABLE KEYS */;
INSERT INTO `order_product_download` VALUES (1,1,31,'Your digital file name',1);
/*!40000 ALTER TABLE `order_product_download` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_product_price`
--

DROP TABLE IF EXISTS `order_product_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_product_price` (
  `ORDER_PRODUCT_PRICE_ID` bigint NOT NULL,
  `DEFAULT_PRICE` bit(1) NOT NULL,
  `PRODUCT_PRICE` decimal(19,2) NOT NULL,
  `PRODUCT_PRICE_CODE` varchar(64) NOT NULL,
  `PRODUCT_PRICE_NAME` varchar(255) DEFAULT NULL,
  `PRODUCT_PRICE_SPECIAL` decimal(19,2) DEFAULT NULL,
  `PRD_PRICE_SPECIAL_END_DT` datetime DEFAULT NULL,
  `PRD_PRICE_SPECIAL_ST_DT` datetime DEFAULT NULL,
  `ORDER_PRODUCT_ID` bigint NOT NULL,
  PRIMARY KEY (`ORDER_PRODUCT_PRICE_ID`),
  KEY `FKnkukiqxrieonyulercgnh857s` (`ORDER_PRODUCT_ID`),
  CONSTRAINT `FKnkukiqxrieonyulercgnh857s` FOREIGN KEY (`ORDER_PRODUCT_ID`) REFERENCES `order_product` (`ORDER_PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_product_price`
--

LOCK TABLES `order_product_price` WRITE;
/*!40000 ALTER TABLE `order_product_price` DISABLE KEYS */;
INSERT INTO `order_product_price` VALUES (1,_binary '',19.99,'baseprice','Base Price',NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `order_product_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_status_history`
--

DROP TABLE IF EXISTS `order_status_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_status_history` (
  `ORDER_STATUS_HISTORY_ID` bigint NOT NULL,
  `COMMENTS` longtext,
  `CUSTOMER_NOTIFIED` int DEFAULT NULL,
  `DATE_ADDED` datetime NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `ORDER_ID` bigint NOT NULL,
  PRIMARY KEY (`ORDER_STATUS_HISTORY_ID`),
  KEY `FKmhghgf1xy3o0npsp8xkj6wyvq` (`ORDER_ID`),
  CONSTRAINT `FKmhghgf1xy3o0npsp8xkj6wyvq` FOREIGN KEY (`ORDER_ID`) REFERENCES `orders` (`ORDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_status_history`
--

LOCK TABLES `order_status_history` WRITE;
/*!40000 ALTER TABLE `order_status_history` DISABLE KEYS */;
INSERT INTO `order_status_history` VALUES (1,'We received your order',1,'2020-06-26 10:05:19','ORDERED',1);
/*!40000 ALTER TABLE `order_status_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_total`
--

DROP TABLE IF EXISTS `order_total`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_total` (
  `ORDER_ACCOUNT_ID` bigint NOT NULL,
  `MODULE` varchar(60) DEFAULT NULL,
  `CODE` varchar(255) NOT NULL,
  `ORDER_TOTAL_TYPE` varchar(255) DEFAULT NULL,
  `ORDER_VALUE_TYPE` varchar(255) DEFAULT NULL,
  `SORT_ORDER` int NOT NULL,
  `TEXT` longtext,
  `TITLE` varchar(255) DEFAULT NULL,
  `VALUE` decimal(15,4) NOT NULL,
  `ORDER_ID` bigint NOT NULL,
  PRIMARY KEY (`ORDER_ACCOUNT_ID`),
  KEY `FK1tfvgk5smm80efdcc8uop4he3` (`ORDER_ID`),
  CONSTRAINT `FK1tfvgk5smm80efdcc8uop4he3` FOREIGN KEY (`ORDER_ID`) REFERENCES `orders` (`ORDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_total`
--

LOCK TABLES `order_total` WRITE;
/*!40000 ALTER TABLE `order_total` DISABLE KEYS */;
INSERT INTO `order_total` VALUES (1,'summary','subtotal',NULL,'ONE_TIME',0,'Summary','Summary',19.9900,1),(2,'tax','tax',NULL,'ONE_TIME',1,'Tax','Tax',4.0000,1),(3,'total','total',NULL,'ONE_TIME',2,'Total','Total',23.9900,1);
/*!40000 ALTER TABLE `order_total` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `ORDER_ID` bigint NOT NULL,
  `BILLING_STREET_ADDRESS` varchar(256) DEFAULT NULL,
  `BILLING_CITY` varchar(100) DEFAULT NULL,
  `BILLING_COMPANY` varchar(100) DEFAULT NULL,
  `BILLING_FIRST_NAME` varchar(64) NOT NULL,
  `BILLING_LAST_NAME` varchar(64) NOT NULL,
  `LATITUDE` varchar(100) DEFAULT NULL,
  `LONGITUDE` varchar(100) DEFAULT NULL,
  `BILLING_POSTCODE` varchar(20) DEFAULT NULL,
  `BILLING_STATE` varchar(100) DEFAULT NULL,
  `BILLING_TELEPHONE` varchar(32) DEFAULT NULL,
  `CHANNEL` varchar(255) DEFAULT NULL,
  `CONFIRMED_ADDRESS` bit(1) DEFAULT NULL,
  `CARD_TYPE` varchar(255) DEFAULT NULL,
  `CC_CVV` varchar(255) DEFAULT NULL,
  `CC_EXPIRES` varchar(255) DEFAULT NULL,
  `CC_NUMBER` varchar(255) DEFAULT NULL,
  `CC_OWNER` varchar(255) DEFAULT NULL,
  `CURRENCY_VALUE` decimal(19,2) DEFAULT NULL,
  `CUSTOMER_AGREED` bit(1) DEFAULT NULL,
  `CUSTOMER_EMAIL_ADDRESS` varchar(50) NOT NULL,
  `CUSTOMER_ID` bigint DEFAULT NULL,
  `DATE_PURCHASED` date DEFAULT NULL,
  `DELIVERY_STREET_ADDRESS` varchar(256) DEFAULT NULL,
  `DELIVERY_CITY` varchar(100) DEFAULT NULL,
  `DELIVERY_COMPANY` varchar(100) DEFAULT NULL,
  `DELIVERY_FIRST_NAME` varchar(64) DEFAULT NULL,
  `DELIVERY_LAST_NAME` varchar(64) DEFAULT NULL,
  `DELIVERY_POSTCODE` varchar(20) DEFAULT NULL,
  `DELIVERY_STATE` varchar(100) DEFAULT NULL,
  `DELIVERY_TELEPHONE` varchar(32) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `LOCALE` varchar(255) DEFAULT NULL,
  `ORDER_DATE_FINISHED` datetime DEFAULT NULL,
  `ORDER_TYPE` varchar(255) DEFAULT NULL,
  `PAYMENT_MODULE_CODE` varchar(255) DEFAULT NULL,
  `PAYMENT_TYPE` varchar(255) DEFAULT NULL,
  `SHIPPING_MODULE_CODE` varchar(255) DEFAULT NULL,
  `ORDER_STATUS` varchar(255) DEFAULT NULL,
  `ORDER_TOTAL` decimal(19,2) DEFAULT NULL,
  `BILLING_COUNTRY_ID` int NOT NULL,
  `BILLING_ZONE_ID` bigint DEFAULT NULL,
  `CURRENCY_ID` bigint DEFAULT NULL,
  `DELIVERY_COUNTRY_ID` int DEFAULT NULL,
  `DELIVERY_ZONE_ID` bigint DEFAULT NULL,
  `MERCHANTID` int DEFAULT NULL,
  PRIMARY KEY (`ORDER_ID`),
  KEY `FKipesu5tupnriahutgle6xu9ed` (`BILLING_COUNTRY_ID`),
  KEY `FKit6ti99mv5uvuxqskhurv3y59` (`BILLING_ZONE_ID`),
  KEY `FKfusivmw6q3gjxnmp47n9s74qi` (`CURRENCY_ID`),
  KEY `FKnlx97vjyorunxglhy5bird06c` (`DELIVERY_COUNTRY_ID`),
  KEY `FKn9uvjl8105fsly4doo8rqnv5b` (`DELIVERY_ZONE_ID`),
  KEY `FKaodv5ffayq8x50q311o2y8m1` (`MERCHANTID`),
  CONSTRAINT `FKaodv5ffayq8x50q311o2y8m1` FOREIGN KEY (`MERCHANTID`) REFERENCES `merchant_store` (`MERCHANT_ID`),
  CONSTRAINT `FKfusivmw6q3gjxnmp47n9s74qi` FOREIGN KEY (`CURRENCY_ID`) REFERENCES `currency` (`CURRENCY_ID`),
  CONSTRAINT `FKipesu5tupnriahutgle6xu9ed` FOREIGN KEY (`BILLING_COUNTRY_ID`) REFERENCES `country` (`COUNTRY_ID`),
  CONSTRAINT `FKit6ti99mv5uvuxqskhurv3y59` FOREIGN KEY (`BILLING_ZONE_ID`) REFERENCES `zone` (`ZONE_ID`),
  CONSTRAINT `FKn9uvjl8105fsly4doo8rqnv5b` FOREIGN KEY (`DELIVERY_ZONE_ID`) REFERENCES `zone` (`ZONE_ID`),
  CONSTRAINT `FKnlx97vjyorunxglhy5bird06c` FOREIGN KEY (`DELIVERY_COUNTRY_ID`) REFERENCES `country` (`COUNTRY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'358 Du Languadoc','Boucherville','CSTI Consulting','Leonardo','DiCaprio',NULL,NULL,'J4B-8J9',NULL,NULL,NULL,_binary '\0',NULL,NULL,NULL,NULL,NULL,0.98,_binary '\0','leo@shopizer.com',1,'2020-06-26','358 Du Languadoc','Boucherville',NULL,'Leonardo','DiCaprio','J4B-8J9',NULL,NULL,'ipAddress','2020-06-26 10:05:19','en_US','2020-06-26 10:05:19','ORDER','paypal','PAYPAL',NULL,'DELIVERED',23.99,13,8,105,13,8,1);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission` (
  `PERMISSION_ID` int NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(20) DEFAULT NULL,
  `PERMISSION_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`PERMISSION_ID`),
  UNIQUE KEY `UK_ss26hgwetkj8ms5y5jn2co4j3` (`PERMISSION_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission`
--

LOCK TABLES `permission` WRITE;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
INSERT INTO `permission` VALUES (1,'2020-06-26 10:05:15','2020-06-26 10:05:15',NULL,'STORE_ADMIN'),(2,'2020-06-26 10:05:15','2020-06-26 10:05:15',NULL,'SUPERADMIN'),(3,'2020-06-26 10:05:15','2020-06-26 10:05:15',NULL,'ADMIN'),(4,'2020-06-26 10:05:15','2020-06-26 10:05:15',NULL,'AUTH'),(5,'2020-06-26 10:05:15','2020-06-26 10:05:15',NULL,'PRODUCTS'),(6,'2020-06-26 10:05:15','2020-06-26 10:05:15',NULL,'ORDER'),(7,'2020-06-26 10:05:15','2020-06-26 10:05:15',NULL,'CONTENT'),(8,'2020-06-26 10:05:15','2020-06-26 10:05:15',NULL,'STORE'),(9,'2020-06-26 10:05:15','2020-06-26 10:05:15',NULL,'TAX'),(10,'2020-06-26 10:05:15','2020-06-26 10:05:15',NULL,'PAYMENT'),(11,'2020-06-26 10:05:15','2020-06-26 10:05:16',NULL,'CUSTOMER'),(12,'2020-06-26 10:05:16','2020-06-26 10:05:16',NULL,'SHIPPING'),(13,'2020-06-26 10:05:16','2020-06-26 10:05:16',NULL,'AUTH_CUSTOMER');
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission_group`
--

DROP TABLE IF EXISTS `permission_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission_group` (
  `PERMISSION_ID` int NOT NULL,
  `GROUP_ID` int NOT NULL,
  KEY `FKr7ylutdgqp1nrlbhjwit6y17g` (`GROUP_ID`),
  KEY `FK77ly3khyuu40odly02d351s84` (`PERMISSION_ID`),
  CONSTRAINT `FK77ly3khyuu40odly02d351s84` FOREIGN KEY (`PERMISSION_ID`) REFERENCES `permission` (`PERMISSION_ID`),
  CONSTRAINT `FKr7ylutdgqp1nrlbhjwit6y17g` FOREIGN KEY (`GROUP_ID`) REFERENCES `sm_group` (`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission_group`
--

LOCK TABLES `permission_group` WRITE;
/*!40000 ALTER TABLE `permission_group` DISABLE KEYS */;
INSERT INTO `permission_group` VALUES (1,1),(1,2),(1,3),(2,1),(3,1),(3,2),(3,3),(4,1),(4,2),(4,4),(4,5),(4,6),(4,3),(5,1),(5,2),(5,4),(5,3),(6,1),(6,2),(6,6),(6,3),(7,1),(7,2),(7,7),(7,3),(8,1),(8,2),(8,5),(8,3),(9,1),(9,2),(9,5),(9,3),(10,1),(10,2),(10,5),(10,3),(11,1),(11,2),(11,5),(11,3),(12,1),(12,2),(12,5),(12,3),(13,8);
/*!40000 ALTER TABLE `permission_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `PRODUCT_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(20) DEFAULT NULL,
  `AVAILABLE` bit(1) DEFAULT NULL,
  `COND` int DEFAULT NULL,
  `DATE_AVAILABLE` datetime DEFAULT NULL,
  `PREORDER` bit(1) DEFAULT NULL,
  `PRODUCT_HEIGHT` decimal(19,2) DEFAULT NULL,
  `PRODUCT_FREE` bit(1) DEFAULT NULL,
  `PRODUCT_LENGTH` decimal(19,2) DEFAULT NULL,
  `QUANTITY_ORDERED` int DEFAULT NULL,
  `REVIEW_AVG` decimal(19,2) DEFAULT NULL,
  `REVIEW_COUNT` int DEFAULT NULL,
  `PRODUCT_SHIP` bit(1) DEFAULT NULL,
  `PRODUCT_VIRTUAL` bit(1) DEFAULT NULL,
  `PRODUCT_WEIGHT` decimal(19,2) DEFAULT NULL,
  `PRODUCT_WIDTH` decimal(19,2) DEFAULT NULL,
  `REF_SKU` varchar(255) DEFAULT NULL,
  `RENTAL_DURATION` int DEFAULT NULL,
  `RENTAL_PERIOD` int DEFAULT NULL,
  `RENTAL_STATUS` int DEFAULT NULL,
  `SKU` varchar(255) DEFAULT NULL,
  `SORT_ORDER` int DEFAULT NULL,
  `MANUFACTURER_ID` bigint DEFAULT NULL,
  `MERCHANT_ID` int NOT NULL,
  `CUSTOMER_ID` bigint DEFAULT NULL,
  `TAX_CLASS_ID` bigint DEFAULT NULL,
  `PRODUCT_TYPE_ID` bigint DEFAULT NULL,
  PRIMARY KEY (`PRODUCT_ID`),
  UNIQUE KEY `UKs8ofsn9pehdrstjg52j5qabxh` (`MERCHANT_ID`,`SKU`),
  KEY `FKra5mmrdxn3ci86hod7q1u3vu9` (`MANUFACTURER_ID`),
  KEY `FKqtt5f0aht5h7ough5rbkkcb33` (`CUSTOMER_ID`),
  KEY `FKb8oqtc3j8sqo0t8xdrne7pg69` (`TAX_CLASS_ID`),
  KEY `FKeiirvj8eu40h103fth8es1mt0` (`PRODUCT_TYPE_ID`),
  CONSTRAINT `FKb8oqtc3j8sqo0t8xdrne7pg69` FOREIGN KEY (`TAX_CLASS_ID`) REFERENCES `tax_class` (`TAX_CLASS_ID`),
  CONSTRAINT `FKeiirvj8eu40h103fth8es1mt0` FOREIGN KEY (`PRODUCT_TYPE_ID`) REFERENCES `product_type` (`PRODUCT_TYPE_ID`),
  CONSTRAINT `FKhhoq1nd9e0i4m7rt8gkh7d67h` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `merchant_store` (`MERCHANT_ID`),
  CONSTRAINT `FKqtt5f0aht5h7ough5rbkkcb33` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `customer` (`CUSTOMER_ID`),
  CONSTRAINT `FKra5mmrdxn3ci86hod7q1u3vu9` FOREIGN KEY (`MANUFACTURER_ID`) REFERENCES `manufacturer` (`MANUFACTURER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'2020-06-26 10:05:16','2020-07-29 19:33:52',NULL,_binary '',NULL,'2020-06-26 10:05:16',_binary '\0',10.00,_binary '\0',3.00,NULL,3.50,1,_binary '',_binary '\0',NULL,6.00,NULL,NULL,NULL,NULL,'TB12345',0,5,1,NULL,NULL,1),(2,'2020-06-26 10:05:17','2020-06-26 10:05:17',NULL,_binary '',NULL,'2020-06-26 10:05:17',_binary '\0',4.00,_binary '\0',3.00,NULL,NULL,NULL,_binary '',_binary '\0',NULL,1.00,NULL,NULL,NULL,NULL,'TB2468',0,4,1,NULL,NULL,1),(3,'2020-06-26 10:05:18','2020-06-26 10:05:18',NULL,_binary '',NULL,'2020-06-26 10:05:18',_binary '\0',4.00,_binary '\0',3.00,NULL,NULL,NULL,_binary '',_binary '\0',NULL,1.00,NULL,NULL,NULL,NULL,'NB1111',0,2,1,NULL,NULL,1),(4,'2020-06-26 10:05:18','2020-06-26 10:05:18',NULL,_binary '',NULL,'2020-06-26 10:05:18',_binary '\0',4.00,_binary '\0',3.00,NULL,NULL,NULL,_binary '',_binary '\0',NULL,1.00,NULL,NULL,NULL,NULL,'SF333345',0,3,1,NULL,NULL,1),(5,'2020-06-26 10:05:18','2020-08-09 22:05:55',NULL,_binary '',NULL,'2020-06-26 10:05:18',_binary '\0',4.00,_binary '\0',3.00,NULL,NULL,NULL,_binary '',_binary '\0',NULL,1.00,NULL,NULL,NULL,NULL,'SF333346',0,4,1,NULL,NULL,1);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_attribute`
--

DROP TABLE IF EXISTS `product_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_attribute` (
  `PRODUCT_ATTRIBUTE_ID` bigint NOT NULL,
  `PRODUCT_ATTRIBUTE_DEFAULT` bit(1) DEFAULT NULL,
  `PRODUCT_ATTRIBUTE_DISCOUNTED` bit(1) DEFAULT NULL,
  `PRODUCT_ATTRIBUTE_FOR_DISP` bit(1) DEFAULT NULL,
  `PRODUCT_ATTRIBUTE_REQUIRED` bit(1) DEFAULT NULL,
  `PRODUCT_ATTRIBUTE_FREE` bit(1) DEFAULT NULL,
  `PRODUCT_ATRIBUTE_PRICE` decimal(19,2) DEFAULT NULL,
  `PRODUCT_ATTRIBUTE_WEIGHT` decimal(19,2) DEFAULT NULL,
  `PRODUCT_ATTRIBUTE_SORT_ORD` int DEFAULT NULL,
  `PRODUCT_ID` bigint NOT NULL,
  `OPTION_ID` bigint NOT NULL,
  `OPTION_VALUE_ID` bigint NOT NULL,
  PRIMARY KEY (`PRODUCT_ATTRIBUTE_ID`),
  UNIQUE KEY `UKo0c6cfxcfejwfa2877gfgpuco` (`OPTION_ID`,`OPTION_VALUE_ID`,`PRODUCT_ID`),
  KEY `FKml3nvemdjya159a7669qt1gjd` (`PRODUCT_ID`),
  KEY `FK3rleultg9fn2dxruefbb18d5t` (`OPTION_VALUE_ID`),
  CONSTRAINT `FK2st60u9twmvvaowwn88mt3lrx` FOREIGN KEY (`OPTION_ID`) REFERENCES `product_option` (`PRODUCT_OPTION_ID`),
  CONSTRAINT `FK3rleultg9fn2dxruefbb18d5t` FOREIGN KEY (`OPTION_VALUE_ID`) REFERENCES `product_option_value` (`PRODUCT_OPTION_VALUE_ID`),
  CONSTRAINT `FKml3nvemdjya159a7669qt1gjd` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `product` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_attribute`
--

LOCK TABLES `product_attribute` WRITE;
/*!40000 ALTER TABLE `product_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_availability`
--

DROP TABLE IF EXISTS `product_availability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_availability` (
  `PRODUCT_AVAIL_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(20) DEFAULT NULL,
  `AVAILABLE` bit(1) DEFAULT NULL,
  `OWNER` varchar(255) DEFAULT NULL,
  `DATE_AVAILABLE` date DEFAULT NULL,
  `FREE_SHIPPING` bit(1) DEFAULT NULL,
  `QUANTITY` int DEFAULT NULL,
  `QUANTITY_ORD_MAX` int DEFAULT NULL,
  `QUANTITY_ORD_MIN` int DEFAULT NULL,
  `STATUS` bit(1) DEFAULT NULL,
  `REGION` varchar(255) DEFAULT NULL,
  `REGION_VARIANT` varchar(255) DEFAULT NULL,
  `MERCHANT_ID` int DEFAULT NULL,
  `PRODUCT_ID` bigint NOT NULL,
  PRIMARY KEY (`PRODUCT_AVAIL_ID`),
  KEY `FKmjs1xqdsgji88j5uduj83bntl` (`MERCHANT_ID`),
  KEY `FK5sbh4dx25pmjcqx958hr9ys8h` (`PRODUCT_ID`),
  CONSTRAINT `FK5sbh4dx25pmjcqx958hr9ys8h` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `product` (`PRODUCT_ID`),
  CONSTRAINT `FKmjs1xqdsgji88j5uduj83bntl` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `merchant_store` (`MERCHANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_availability`
--

LOCK TABLES `product_availability` WRITE;
/*!40000 ALTER TABLE `product_availability` DISABLE KEYS */;
INSERT INTO `product_availability` VALUES (1,NULL,NULL,NULL,NULL,NULL,'2020-06-26',_binary '\0',100,0,0,_binary '','*',NULL,NULL,1),(2,NULL,NULL,NULL,NULL,NULL,'2020-06-26',_binary '\0',100,0,0,_binary '','*',NULL,NULL,2),(3,NULL,NULL,NULL,NULL,NULL,'2020-06-26',_binary '\0',100,0,0,_binary '','*',NULL,NULL,3),(4,NULL,NULL,NULL,NULL,NULL,'2020-06-26',_binary '\0',100,0,0,_binary '','*',NULL,NULL,4),(5,NULL,NULL,NULL,NULL,NULL,'2020-06-26',_binary '\0',100,0,0,_binary '','*',NULL,NULL,5);
/*!40000 ALTER TABLE `product_availability` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_category`
--

DROP TABLE IF EXISTS `product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_category` (
  `PRODUCT_ID` bigint NOT NULL,
  `CATEGORY_ID` bigint NOT NULL,
  PRIMARY KEY (`PRODUCT_ID`,`CATEGORY_ID`),
  KEY `FK3xw1sbaa29r534jvedimdd7md` (`CATEGORY_ID`),
  CONSTRAINT `FK3xw1sbaa29r534jvedimdd7md` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `category` (`CATEGORY_ID`),
  CONSTRAINT `FKa7245ly271mb0crlhxwhhppsq` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `product` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_category`
--

LOCK TABLES `product_category` WRITE;
/*!40000 ALTER TABLE `product_category` DISABLE KEYS */;
INSERT INTO `product_category` VALUES (1,3),(2,3),(4,3),(5,3),(1,4),(2,4),(3,7);
/*!40000 ALTER TABLE `product_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_description`
--

DROP TABLE IF EXISTS `product_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_description` (
  `DESCRIPTION_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(20) DEFAULT NULL,
  `DESCRIPTION` longtext,
  `NAME` varchar(120) NOT NULL,
  `TITLE` varchar(100) DEFAULT NULL,
  `META_DESCRIPTION` varchar(255) DEFAULT NULL,
  `META_KEYWORDS` varchar(255) DEFAULT NULL,
  `META_TITLE` varchar(255) DEFAULT NULL,
  `DOWNLOAD_LNK` varchar(255) DEFAULT NULL,
  `PRODUCT_HIGHLIGHT` varchar(255) DEFAULT NULL,
  `SEF_URL` varchar(255) DEFAULT NULL,
  `LANGUAGE_ID` int NOT NULL,
  `PRODUCT_ID` bigint NOT NULL,
  PRIMARY KEY (`DESCRIPTION_ID`),
  UNIQUE KEY `UKq4dnkx5b776ayqas2h4rr2d8q` (`PRODUCT_ID`,`LANGUAGE_ID`),
  KEY `PRODUCT_DESCRIPTION_SEF_URL` (`SEF_URL`),
  KEY `FK6esjdaa6vu2t5vjin788a8og6` (`LANGUAGE_ID`),
  CONSTRAINT `FK6esjdaa6vu2t5vjin788a8og6` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `language` (`LANGUAGE_ID`),
  CONSTRAINT `FKm46yjcu59q79qrokgglwq2ove` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `product` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_description`
--

LOCK TABLES `product_description` WRITE;
/*!40000 ALTER TABLE `product_description` DISABLE KEYS */;
INSERT INTO `product_description` VALUES (1,'2020-06-26 10:05:16','2020-06-26 10:05:16',NULL,NULL,'Spring in Action',NULL,NULL,NULL,NULL,NULL,NULL,'Spring-in-Action',1,1),(2,'2020-06-26 10:05:17','2020-06-26 10:05:17',NULL,NULL,'Node Web Development',NULL,NULL,NULL,NULL,NULL,NULL,'Node-Web-Development',1,2),(3,'2020-06-26 10:05:18','2020-06-26 10:05:18',NULL,NULL,'Programming for PAAS',NULL,NULL,NULL,NULL,NULL,NULL,'programming-for-paas',1,3),(4,'2020-06-26 10:05:18','2020-06-26 10:05:18',NULL,NULL,'Android development',NULL,NULL,NULL,NULL,NULL,NULL,'android-application-development',1,4),(5,'2020-06-26 10:05:18','2020-06-26 10:05:18',NULL,NULL,'Android 3.0 Cookbook',NULL,NULL,NULL,NULL,NULL,NULL,'android-3-cookbook',1,5);
/*!40000 ALTER TABLE `product_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_digital`
--

DROP TABLE IF EXISTS `product_digital`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_digital` (
  `PRODUCT_DIGITAL_ID` bigint NOT NULL,
  `FILE_NAME` varchar(255) NOT NULL,
  `PRODUCT_ID` bigint NOT NULL,
  PRIMARY KEY (`PRODUCT_DIGITAL_ID`),
  UNIQUE KEY `UKjuk1qgkh9v5w7ghvb18krwo8v` (`PRODUCT_ID`,`FILE_NAME`),
  CONSTRAINT `FK47fmb5cg68pws7k26txyl1il6` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `product` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_digital`
--

LOCK TABLES `product_digital` WRITE;
/*!40000 ALTER TABLE `product_digital` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_digital` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_image`
--

DROP TABLE IF EXISTS `product_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_image` (
  `PRODUCT_IMAGE_ID` bigint NOT NULL,
  `DEFAULT_IMAGE` bit(1) DEFAULT NULL,
  `IMAGE_CROP` bit(1) DEFAULT NULL,
  `IMAGE_TYPE` int DEFAULT NULL,
  `PRODUCT_IMAGE` varchar(255) DEFAULT NULL,
  `PRODUCT_IMAGE_URL` varchar(255) DEFAULT NULL,
  `PRODUCT_ID` bigint NOT NULL,
  PRIMARY KEY (`PRODUCT_IMAGE_ID`),
  KEY `FKgab836d8rxqg8vv55nm02r65i` (`PRODUCT_ID`),
  CONSTRAINT `FKgab836d8rxqg8vv55nm02r65i` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `product` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_image`
--

LOCK TABLES `product_image` WRITE;
/*!40000 ALTER TABLE `product_image` DISABLE KEYS */;
INSERT INTO `product_image` VALUES (1,_binary '',_binary '\0',0,'spring.png',NULL,1),(2,_binary '',_binary '\0',0,'node.jpg',NULL,2),(3,_binary '',_binary '\0',0,'paas.JPG',NULL,3),(4,_binary '',_binary '\0',0,'android.jpg',NULL,4),(5,_binary '',_binary '\0',0,'android2.jpg',NULL,5);
/*!40000 ALTER TABLE `product_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_image_description`
--

DROP TABLE IF EXISTS `product_image_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_image_description` (
  `DESCRIPTION_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(20) DEFAULT NULL,
  `DESCRIPTION` longtext,
  `NAME` varchar(120) NOT NULL,
  `TITLE` varchar(100) DEFAULT NULL,
  `ALT_TAG` varchar(100) DEFAULT NULL,
  `LANGUAGE_ID` int NOT NULL,
  `PRODUCT_IMAGE_ID` bigint NOT NULL,
  PRIMARY KEY (`DESCRIPTION_ID`),
  UNIQUE KEY `UKn7yhdj6ccydgf201gibb882cd` (`PRODUCT_IMAGE_ID`,`LANGUAGE_ID`),
  KEY `FKlhdnpki4sf98wev0pcj2bvnih` (`LANGUAGE_ID`),
  CONSTRAINT `FK1dhldo18nj9l2y6qympgucynq` FOREIGN KEY (`PRODUCT_IMAGE_ID`) REFERENCES `product_image` (`PRODUCT_IMAGE_ID`),
  CONSTRAINT `FKlhdnpki4sf98wev0pcj2bvnih` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `language` (`LANGUAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_image_description`
--

LOCK TABLES `product_image_description` WRITE;
/*!40000 ALTER TABLE `product_image_description` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_image_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_option`
--

DROP TABLE IF EXISTS `product_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_option` (
  `PRODUCT_OPTION_ID` bigint NOT NULL,
  `PRODUCT_OPTION_CODE` varchar(255) DEFAULT NULL,
  `PRODUCT_OPTION_SORT_ORD` int DEFAULT NULL,
  `PRODUCT_OPTION_TYPE` varchar(10) DEFAULT NULL,
  `PRODUCT_OPTION_READ` bit(1) DEFAULT NULL,
  `MERCHANT_ID` int NOT NULL,
  PRIMARY KEY (`PRODUCT_OPTION_ID`),
  UNIQUE KEY `UKhfcw5oi9ulljlog1b7ns1r9tu` (`MERCHANT_ID`,`PRODUCT_OPTION_CODE`),
  KEY `PRD_OPTION_CODE_IDX` (`PRODUCT_OPTION_CODE`),
  CONSTRAINT `FKp8cski5t5f5m4et4fw0uilcgu` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `merchant_store` (`MERCHANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_option`
--

LOCK TABLES `product_option` WRITE;
/*!40000 ALTER TABLE `product_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_option_desc`
--

DROP TABLE IF EXISTS `product_option_desc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_option_desc` (
  `DESCRIPTION_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(20) DEFAULT NULL,
  `DESCRIPTION` longtext,
  `NAME` varchar(120) NOT NULL,
  `TITLE` varchar(100) DEFAULT NULL,
  `PRODUCT_OPTION_COMMENT` longtext,
  `LANGUAGE_ID` int NOT NULL,
  `PRODUCT_OPTION_ID` bigint NOT NULL,
  PRIMARY KEY (`DESCRIPTION_ID`),
  UNIQUE KEY `UKmkcm8isyyyqbjd1yyb8mrpkuw` (`PRODUCT_OPTION_ID`,`LANGUAGE_ID`),
  KEY `FK8fiwk5o1gbn2r2u8529yaf9xt` (`LANGUAGE_ID`),
  CONSTRAINT `FK8fiwk5o1gbn2r2u8529yaf9xt` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `language` (`LANGUAGE_ID`),
  CONSTRAINT `FKgjqmfofile4hwv867irsnvuc0` FOREIGN KEY (`PRODUCT_OPTION_ID`) REFERENCES `product_option` (`PRODUCT_OPTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_option_desc`
--

LOCK TABLES `product_option_desc` WRITE;
/*!40000 ALTER TABLE `product_option_desc` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_option_desc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_option_value`
--

DROP TABLE IF EXISTS `product_option_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_option_value` (
  `PRODUCT_OPTION_VALUE_ID` bigint NOT NULL,
  `PRODUCT_OPTION_VAL_CODE` varchar(255) DEFAULT NULL,
  `PRODUCT_OPT_FOR_DISP` bit(1) DEFAULT NULL,
  `PRODUCT_OPT_VAL_IMAGE` varchar(255) DEFAULT NULL,
  `PRODUCT_OPT_VAL_SORT_ORD` int DEFAULT NULL,
  `MERCHANT_ID` int NOT NULL,
  PRIMARY KEY (`PRODUCT_OPTION_VALUE_ID`),
  UNIQUE KEY `UKixbpi4hxrhljh935c3xfvnvsh` (`MERCHANT_ID`,`PRODUCT_OPTION_VAL_CODE`),
  KEY `PRD_OPTION_VAL_CODE_IDX` (`PRODUCT_OPTION_VAL_CODE`),
  CONSTRAINT `FKnd3nw0mamlk8bkxo8ad5m85pq` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `merchant_store` (`MERCHANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_option_value`
--

LOCK TABLES `product_option_value` WRITE;
/*!40000 ALTER TABLE `product_option_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_option_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_option_value_description`
--

DROP TABLE IF EXISTS `product_option_value_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_option_value_description` (
  `DESCRIPTION_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(20) DEFAULT NULL,
  `DESCRIPTION` longtext,
  `NAME` varchar(120) NOT NULL,
  `TITLE` varchar(100) DEFAULT NULL,
  `LANGUAGE_ID` int NOT NULL,
  `PRODUCT_OPTION_VALUE_ID` bigint DEFAULT NULL,
  PRIMARY KEY (`DESCRIPTION_ID`),
  UNIQUE KEY `UKasgc60ot1wy0uho96n0j8429p` (`PRODUCT_OPTION_VALUE_ID`,`LANGUAGE_ID`),
  KEY `FK19mnby7atlt85exlypxdxhacx` (`LANGUAGE_ID`),
  CONSTRAINT `FK19mnby7atlt85exlypxdxhacx` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `language` (`LANGUAGE_ID`),
  CONSTRAINT `FKqttc6b79yp2s1hyrhg4thag6s` FOREIGN KEY (`PRODUCT_OPTION_VALUE_ID`) REFERENCES `product_option_value` (`PRODUCT_OPTION_VALUE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_option_value_description`
--

LOCK TABLES `product_option_value_description` WRITE;
/*!40000 ALTER TABLE `product_option_value_description` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_option_value_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_price`
--

DROP TABLE IF EXISTS `product_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_price` (
  `PRODUCT_PRICE_ID` bigint NOT NULL,
  `PRODUCT_PRICE_CODE` varchar(255) NOT NULL,
  `DEFAULT_PRICE` bit(1) DEFAULT NULL,
  `PRODUCT_PRICE_AMOUNT` decimal(19,2) NOT NULL,
  `PRODUCT_PRICE_SPECIAL_AMOUNT` decimal(19,2) DEFAULT NULL,
  `PRODUCT_PRICE_SPECIAL_END_DATE` date DEFAULT NULL,
  `PRODUCT_PRICE_SPECIAL_ST_DATE` date DEFAULT NULL,
  `PRODUCT_PRICE_TYPE` varchar(20) DEFAULT NULL,
  `PRODUCT_AVAIL_ID` bigint NOT NULL,
  PRIMARY KEY (`PRODUCT_PRICE_ID`),
  KEY `FK1dic7jnnk1qikgvwcrf4dw12r` (`PRODUCT_AVAIL_ID`),
  CONSTRAINT `FK1dic7jnnk1qikgvwcrf4dw12r` FOREIGN KEY (`PRODUCT_AVAIL_ID`) REFERENCES `product_availability` (`PRODUCT_AVAIL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_price`
--

LOCK TABLES `product_price` WRITE;
/*!40000 ALTER TABLE `product_price` DISABLE KEYS */;
INSERT INTO `product_price` VALUES (1,'base',_binary '',39.99,NULL,NULL,NULL,'ONE_TIME',1),(2,'base',_binary '',29.99,NULL,NULL,NULL,'ONE_TIME',2),(3,'base',_binary '',19.99,NULL,NULL,NULL,'ONE_TIME',3),(4,'base',_binary '',18.99,NULL,NULL,NULL,'ONE_TIME',4),(5,'base',_binary '',18.99,NULL,NULL,NULL,'ONE_TIME',5);
/*!40000 ALTER TABLE `product_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_price_description`
--

DROP TABLE IF EXISTS `product_price_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_price_description` (
  `DESCRIPTION_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(20) DEFAULT NULL,
  `DESCRIPTION` longtext,
  `NAME` varchar(120) NOT NULL,
  `TITLE` varchar(100) DEFAULT NULL,
  `LANGUAGE_ID` int NOT NULL,
  `PRODUCT_PRICE_ID` bigint NOT NULL,
  PRIMARY KEY (`DESCRIPTION_ID`),
  UNIQUE KEY `UKfrsw8d41sxxogvxxoyd8nwaxu` (`PRODUCT_PRICE_ID`,`LANGUAGE_ID`),
  KEY `FK7bmbrjr8ar5icwdpt8myj6gei` (`LANGUAGE_ID`),
  CONSTRAINT `FK7bmbrjr8ar5icwdpt8myj6gei` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `language` (`LANGUAGE_ID`),
  CONSTRAINT `FKbwxw861ipjsct606j3dagdjsf` FOREIGN KEY (`PRODUCT_PRICE_ID`) REFERENCES `product_price` (`PRODUCT_PRICE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_price_description`
--

LOCK TABLES `product_price_description` WRITE;
/*!40000 ALTER TABLE `product_price_description` DISABLE KEYS */;
INSERT INTO `product_price_description` VALUES (1,'2020-06-26 10:05:16','2020-06-26 10:05:16',NULL,NULL,'Base price',NULL,1,1),(2,'2020-06-26 10:05:17','2020-06-26 10:05:17',NULL,NULL,'Base price',NULL,1,2),(3,'2020-06-26 10:05:18','2020-06-26 10:05:18',NULL,NULL,'Base price',NULL,1,3),(4,'2020-06-26 10:05:18','2020-06-26 10:05:18',NULL,NULL,'Base price',NULL,1,4),(5,'2020-06-26 10:05:18','2020-06-26 10:05:18',NULL,NULL,'Base price',NULL,1,5);
/*!40000 ALTER TABLE `product_price_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_relationship`
--

DROP TABLE IF EXISTS `product_relationship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_relationship` (
  `PRODUCT_RELATIONSHIP_ID` bigint NOT NULL,
  `ACTIVE` bit(1) DEFAULT NULL,
  `CODE` varchar(255) DEFAULT NULL,
  `PRODUCT_ID` bigint DEFAULT NULL,
  `RELATED_PRODUCT_ID` bigint DEFAULT NULL,
  `MERCHANT_ID` int NOT NULL,
  PRIMARY KEY (`PRODUCT_RELATIONSHIP_ID`),
  KEY `FKso3cvinykac5wdwu1tjgfotor` (`PRODUCT_ID`),
  KEY `FKfskwtawyt85g9h6761fa69ya5` (`RELATED_PRODUCT_ID`),
  KEY `FKnprvswtbgrm6bjfq3cbdl3qsm` (`MERCHANT_ID`),
  CONSTRAINT `FKfskwtawyt85g9h6761fa69ya5` FOREIGN KEY (`RELATED_PRODUCT_ID`) REFERENCES `product` (`PRODUCT_ID`),
  CONSTRAINT `FKnprvswtbgrm6bjfq3cbdl3qsm` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `merchant_store` (`MERCHANT_ID`),
  CONSTRAINT `FKso3cvinykac5wdwu1tjgfotor` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `product` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_relationship`
--

LOCK TABLES `product_relationship` WRITE;
/*!40000 ALTER TABLE `product_relationship` DISABLE KEYS */;
INSERT INTO `product_relationship` VALUES (1,_binary '','FEATURED_ITEM',NULL,1,1),(3,_binary '','FEATURED_ITEM',NULL,5,1),(4,_binary '','FEATURED_ITEM',NULL,2,1);
/*!40000 ALTER TABLE `product_relationship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_review`
--

DROP TABLE IF EXISTS `product_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_review` (
  `PRODUCT_REVIEW_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(20) DEFAULT NULL,
  `REVIEW_DATE` datetime DEFAULT NULL,
  `REVIEWS_RATING` double DEFAULT NULL,
  `REVIEWS_READ` bigint DEFAULT NULL,
  `STATUS` int DEFAULT NULL,
  `CUSTOMERS_ID` bigint DEFAULT NULL,
  `PRODUCT_ID` bigint DEFAULT NULL,
  PRIMARY KEY (`PRODUCT_REVIEW_ID`),
  UNIQUE KEY `UK9ew5idgdbk8a77534hbnhd4yb` (`CUSTOMERS_ID`,`PRODUCT_ID`),
  KEY `FKbfi8de7kxultg1vevq6jc1hn7` (`PRODUCT_ID`),
  CONSTRAINT `FK7tm0jrt0hiugo3ep49t3subou` FOREIGN KEY (`CUSTOMERS_ID`) REFERENCES `customer` (`CUSTOMER_ID`),
  CONSTRAINT `FKbfi8de7kxultg1vevq6jc1hn7` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `product` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_review`
--

LOCK TABLES `product_review` WRITE;
/*!40000 ALTER TABLE `product_review` DISABLE KEYS */;
INSERT INTO `product_review` VALUES (1,'2020-07-29 19:33:52','2020-07-29 19:33:52',NULL,'2020-07-29 00:00:00',3.5,NULL,NULL,1,1);
/*!40000 ALTER TABLE `product_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_review_description`
--

DROP TABLE IF EXISTS `product_review_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_review_description` (
  `DESCRIPTION_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(20) DEFAULT NULL,
  `DESCRIPTION` longtext,
  `NAME` varchar(120) NOT NULL,
  `TITLE` varchar(100) DEFAULT NULL,
  `LANGUAGE_ID` int NOT NULL,
  `PRODUCT_REVIEW_ID` bigint DEFAULT NULL,
  PRIMARY KEY (`DESCRIPTION_ID`),
  UNIQUE KEY `UKqno5wjdtcj8pm3ykkkh7t4rxj` (`PRODUCT_REVIEW_ID`,`LANGUAGE_ID`),
  KEY `FK7byc5jsf5bm4lk674ac44e50m` (`LANGUAGE_ID`),
  CONSTRAINT `FK7byc5jsf5bm4lk674ac44e50m` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `language` (`LANGUAGE_ID`),
  CONSTRAINT `FKmjivhigdcxmytndlpjuhf4o25` FOREIGN KEY (`PRODUCT_REVIEW_ID`) REFERENCES `product_review` (`PRODUCT_REVIEW_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_review_description`
--

LOCK TABLES `product_review_description` WRITE;
/*!40000 ALTER TABLE `product_review_description` DISABLE KEYS */;
INSERT INTO `product_review_description` VALUES (1,'2020-07-29 19:33:52','2020-07-29 19:33:52',NULL,'this book is good','-',NULL,1,1);
/*!40000 ALTER TABLE `product_review_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_type`
--

DROP TABLE IF EXISTS `product_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_type` (
  `PRODUCT_TYPE_ID` bigint NOT NULL,
  `PRD_TYPE_ADD_TO_CART` bit(1) DEFAULT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(20) DEFAULT NULL,
  `PRD_TYPE_CODE` varchar(255) DEFAULT NULL,
  `MERCHANT_ID` int DEFAULT NULL,
  PRIMARY KEY (`PRODUCT_TYPE_ID`),
  KEY `FKswkvtaq4om2di6x8cd4m22ofn` (`MERCHANT_ID`),
  CONSTRAINT `FKswkvtaq4om2di6x8cd4m22ofn` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `merchant_store` (`MERCHANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_type`
--

LOCK TABLES `product_type` WRITE;
/*!40000 ALTER TABLE `product_type` DISABLE KEYS */;
INSERT INTO `product_type` VALUES (1,NULL,'2020-06-26 10:05:15','2020-06-26 10:05:15',NULL,'GENERAL',NULL);
/*!40000 ALTER TABLE `product_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_type_description`
--

DROP TABLE IF EXISTS `product_type_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_type_description` (
  `DESCRIPTION_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(20) DEFAULT NULL,
  `DESCRIPTION` longtext,
  `NAME` varchar(120) NOT NULL,
  `TITLE` varchar(100) DEFAULT NULL,
  `LANGUAGE_ID` int NOT NULL,
  `PRODUCT_TYPE_ID` bigint NOT NULL,
  PRIMARY KEY (`DESCRIPTION_ID`),
  UNIQUE KEY `UKbnra4lwqjkju4yh04824sw6be` (`PRODUCT_TYPE_ID`,`LANGUAGE_ID`),
  KEY `FK81q74whco5y9fd51aa330hlc0` (`LANGUAGE_ID`),
  CONSTRAINT `FK81q74whco5y9fd51aa330hlc0` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `language` (`LANGUAGE_ID`),
  CONSTRAINT `FKrefxr8q2qwraslqguql31vu34` FOREIGN KEY (`PRODUCT_TYPE_ID`) REFERENCES `product_price` (`PRODUCT_PRICE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_type_description`
--

LOCK TABLES `product_type_description` WRITE;
/*!40000 ALTER TABLE `product_type_description` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_type_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shiping_origin`
--

DROP TABLE IF EXISTS `shiping_origin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shiping_origin` (
  `SHIP_ORIGIN_ID` bigint NOT NULL,
  `ACTIVE` bit(1) DEFAULT NULL,
  `STREET_ADDRESS` varchar(256) DEFAULT NULL,
  `CITY` varchar(100) DEFAULT NULL,
  `POSTCODE` varchar(20) DEFAULT NULL,
  `STATE` varchar(100) DEFAULT NULL,
  `COUNTRY_ID` int DEFAULT NULL,
  `MERCHANT_ID` int NOT NULL,
  `ZONE_ID` bigint DEFAULT NULL,
  PRIMARY KEY (`SHIP_ORIGIN_ID`),
  KEY `FKpqig59usqvs9h0dw4lm8rv7yy` (`COUNTRY_ID`),
  KEY `FKp0dbwsv3sdsp57ex7j5k9b0oq` (`MERCHANT_ID`),
  KEY `FK6k73f1n18kr7mqp708aiwq047` (`ZONE_ID`),
  CONSTRAINT `FK6k73f1n18kr7mqp708aiwq047` FOREIGN KEY (`ZONE_ID`) REFERENCES `zone` (`ZONE_ID`),
  CONSTRAINT `FKp0dbwsv3sdsp57ex7j5k9b0oq` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `merchant_store` (`MERCHANT_ID`),
  CONSTRAINT `FKpqig59usqvs9h0dw4lm8rv7yy` FOREIGN KEY (`COUNTRY_ID`) REFERENCES `country` (`COUNTRY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shiping_origin`
--

LOCK TABLES `shiping_origin` WRITE;
/*!40000 ALTER TABLE `shiping_origin` DISABLE KEYS */;
INSERT INTO `shiping_origin` VALUES (1,_binary '\0','','Bengaluru','560066','Karnataka',37,1,NULL);
/*!40000 ALTER TABLE `shiping_origin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping_quote`
--

DROP TABLE IF EXISTS `shipping_quote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shipping_quote` (
  `SHIPPING_QUOTE_ID` bigint NOT NULL,
  `CART_ID` bigint DEFAULT NULL,
  `CUSTOMER_ID` bigint DEFAULT NULL,
  `DELIVERY_STREET_ADDRESS` varchar(256) DEFAULT NULL,
  `DELIVERY_CITY` varchar(100) DEFAULT NULL,
  `DELIVERY_COMPANY` varchar(100) DEFAULT NULL,
  `DELIVERY_FIRST_NAME` varchar(64) DEFAULT NULL,
  `DELIVERY_LAST_NAME` varchar(64) DEFAULT NULL,
  `DELIVERY_POSTCODE` varchar(20) DEFAULT NULL,
  `DELIVERY_STATE` varchar(100) DEFAULT NULL,
  `DELIVERY_TELEPHONE` varchar(32) DEFAULT NULL,
  `SHIPPING_NUMBER_DAYS` int DEFAULT NULL,
  `FREE_SHIPPING` bit(1) DEFAULT NULL,
  `QUOTE_HANDLING` decimal(19,2) DEFAULT NULL,
  `MODULE` varchar(255) NOT NULL,
  `OPTION_CODE` varchar(255) DEFAULT NULL,
  `OPTION_DELIVERY_DATE` datetime DEFAULT NULL,
  `OPTION_NAME` varchar(255) DEFAULT NULL,
  `OPTION_SHIPPING_DATE` datetime DEFAULT NULL,
  `ORDER_ID` bigint DEFAULT NULL,
  `QUOTE_PRICE` decimal(19,2) DEFAULT NULL,
  `QUOTE_DATE` datetime DEFAULT NULL,
  `DELIVERY_COUNTRY_ID` int DEFAULT NULL,
  `DELIVERY_ZONE_ID` bigint DEFAULT NULL,
  PRIMARY KEY (`SHIPPING_QUOTE_ID`),
  KEY `FK9vb7tbjl8ivygdiqw883fewx7` (`DELIVERY_COUNTRY_ID`),
  KEY `FKiioesp0vl6x4om1jeajj4uy1t` (`DELIVERY_ZONE_ID`),
  CONSTRAINT `FK9vb7tbjl8ivygdiqw883fewx7` FOREIGN KEY (`DELIVERY_COUNTRY_ID`) REFERENCES `country` (`COUNTRY_ID`),
  CONSTRAINT `FKiioesp0vl6x4om1jeajj4uy1t` FOREIGN KEY (`DELIVERY_ZONE_ID`) REFERENCES `zone` (`ZONE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_quote`
--

LOCK TABLES `shipping_quote` WRITE;
/*!40000 ALTER TABLE `shipping_quote` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipping_quote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopping_cart`
--

DROP TABLE IF EXISTS `shopping_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shopping_cart` (
  `SHP_CART_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(20) DEFAULT NULL,
  `CUSTOMER_ID` bigint DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `SHP_CART_CODE` varchar(255) NOT NULL,
  `MERCHANT_ID` int NOT NULL,
  PRIMARY KEY (`SHP_CART_ID`),
  UNIQUE KEY `UK_8ld8p40fwrjobi7t3n95pna35` (`SHP_CART_CODE`),
  KEY `SHP_CART_CODE_IDX` (`SHP_CART_CODE`),
  KEY `SHP_CART_CUSTOMER_IDX` (`CUSTOMER_ID`),
  KEY `FKqvghr5rmjefe3lw9mcolk30a0` (`MERCHANT_ID`),
  CONSTRAINT `FKqvghr5rmjefe3lw9mcolk30a0` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `merchant_store` (`MERCHANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping_cart`
--

LOCK TABLES `shopping_cart` WRITE;
/*!40000 ALTER TABLE `shopping_cart` DISABLE KEYS */;
INSERT INTO `shopping_cart` VALUES (1,'2020-06-26 10:14:34','2020-06-26 10:14:34',NULL,NULL,'0:0:0:0:0:0:0:1','f41fbb6b56f949ffbb6b72952a92eee8',1),(50,'2020-07-29 12:04:54','2020-07-29 12:04:55',NULL,NULL,'0:0:0:0:0:0:0:1','cab10ac62466447fa20d4ff51c4bb0ed',1),(100,'2020-07-30 22:03:33','2020-07-30 22:03:33',NULL,NULL,'0:0:0:0:0:0:0:1','88b9611c9ddc4c6382e038f16e1a110f',1),(150,'2020-08-09 22:04:45','2020-08-09 22:04:45',NULL,NULL,'0:0:0:0:0:0:0:1','4791a3ebd2ce4ca3b38706106e740eff',1);
/*!40000 ALTER TABLE `shopping_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopping_cart_attr_item`
--

DROP TABLE IF EXISTS `shopping_cart_attr_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shopping_cart_attr_item` (
  `SHP_CART_ATTR_ITEM_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(20) DEFAULT NULL,
  `PRODUCT_ATTR_ID` bigint NOT NULL,
  `SHP_CART_ITEM_ID` bigint NOT NULL,
  PRIMARY KEY (`SHP_CART_ATTR_ITEM_ID`),
  KEY `FKp42tpa623hyo9ww69v0ohb3er` (`SHP_CART_ITEM_ID`),
  CONSTRAINT `FKp42tpa623hyo9ww69v0ohb3er` FOREIGN KEY (`SHP_CART_ITEM_ID`) REFERENCES `shopping_cart_item` (`SHP_CART_ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping_cart_attr_item`
--

LOCK TABLES `shopping_cart_attr_item` WRITE;
/*!40000 ALTER TABLE `shopping_cart_attr_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `shopping_cart_attr_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopping_cart_item`
--

DROP TABLE IF EXISTS `shopping_cart_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shopping_cart_item` (
  `SHP_CART_ITEM_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(20) DEFAULT NULL,
  `PRODUCT_ID` bigint NOT NULL,
  `QUANTITY` int DEFAULT NULL,
  `SHP_CART_ID` bigint NOT NULL,
  PRIMARY KEY (`SHP_CART_ITEM_ID`),
  KEY `FK2gbimdwe9uysd5xadnfl0xq83` (`SHP_CART_ID`),
  CONSTRAINT `FK2gbimdwe9uysd5xadnfl0xq83` FOREIGN KEY (`SHP_CART_ID`) REFERENCES `shopping_cart` (`SHP_CART_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping_cart_item`
--

LOCK TABLES `shopping_cart_item` WRITE;
/*!40000 ALTER TABLE `shopping_cart_item` DISABLE KEYS */;
INSERT INTO `shopping_cart_item` VALUES (1,'2020-06-26 10:14:34','2020-06-29 11:10:48',NULL,6,1,1),(50,'2020-06-26 11:55:00','2020-06-29 11:10:48',NULL,3,1,1),(51,'2020-06-29 09:54:36','2020-06-29 11:10:48',NULL,1,3,1),(52,'2020-06-29 11:04:45','2020-06-29 11:04:45',NULL,2,1,1),(100,'2020-07-29 12:04:55','2020-07-29 12:04:55',NULL,1,1,50),(150,'2020-07-30 22:03:33','2020-07-30 22:03:33',NULL,5,1,100),(200,'2020-08-09 22:04:45','2020-08-09 22:04:45',NULL,5,1,150);
/*!40000 ALTER TABLE `shopping_cart_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sm_group`
--

DROP TABLE IF EXISTS `sm_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sm_group` (
  `GROUP_ID` int NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(20) DEFAULT NULL,
  `GROUP_NAME` varchar(255) DEFAULT NULL,
  `GROUP_TYPE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`GROUP_ID`),
  UNIQUE KEY `UK_t83rjsoml3o785oj37lpqpyko` (`GROUP_NAME`),
  KEY `SM_GROUP_GROUP_TYPE` (`GROUP_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sm_group`
--

LOCK TABLES `sm_group` WRITE;
/*!40000 ALTER TABLE `sm_group` DISABLE KEYS */;
INSERT INTO `sm_group` VALUES (1,'2020-06-26 10:05:15','2020-06-26 10:05:15',NULL,'SUPERADMIN','ADMIN'),(2,'2020-06-26 10:05:15','2020-06-26 10:05:15',NULL,'ADMIN','ADMIN'),(3,'2020-06-26 10:05:15','2020-06-26 10:05:15',NULL,'ADMIN_RETAILER','ADMIN'),(4,'2020-06-26 10:05:15','2020-06-26 10:05:15',NULL,'ADMIN_CATALOGUE','ADMIN'),(5,'2020-06-26 10:05:15','2020-06-26 10:05:15',NULL,'ADMIN_STORE','ADMIN'),(6,'2020-06-26 10:05:15','2020-06-26 10:05:15',NULL,'ADMIN_ORDER','ADMIN'),(7,'2020-06-26 10:05:15','2020-06-26 10:05:15',NULL,'ADMIN_CONTENT','ADMIN'),(8,'2020-06-26 10:05:16','2020-06-26 10:05:16',NULL,'CUSTOMER','ADMIN');
/*!40000 ALTER TABLE `sm_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sm_sequencer`
--

DROP TABLE IF EXISTS `sm_sequencer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sm_sequencer` (
  `SEQ_NAME` varchar(255) NOT NULL,
  `SEQ_COUNT` bigint DEFAULT NULL,
  PRIMARY KEY (`SEQ_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sm_sequencer`
--

LOCK TABLES `sm_sequencer` WRITE;
/*!40000 ALTER TABLE `sm_sequencer` DISABLE KEYS */;
INSERT INTO `sm_sequencer` VALUES ('category_description_seq',15),('CATEGORY_SEQ_NEXT_VAL',1),('content_description_seq',7),('CONTENT_SEQ_NEXT_VAL',1),('country_description_seq',191),('COUNTRY_SEQ_NEXT_VAL',2),('CURRENCY_SEQ_NEXT_VAL',4),('CUSTOMER_SEQ_NEXT_VAL',1),('GROUP_SEQ_NEXT_VAL',1),('LANG_SEQ_NEXT_VAL',1),('manufacturer_description_seq',7),('MANUFACT_SEQ_NEXT_VAL',1),('MERCH_CONF_SEQ_NEXT_VAL',3),('MOD_CONF_SEQ_NEXT_VAL',1),('OPTIN_SEQ_NEXT_VAL',1),('ORDER_ID_SEQ_NEXT_VAL',1),('ORDER_PRD_PRICE_ID_NEXT_VAL',1),('ORDER_PRODUCT_DL_ID_NEXT_VALUE',1),('ORDER_PRODUCT_ID_NEXT_VALUE',1),('ORDER_TOTAL_ID_NEXT_VALUE',1),('PERMISSION_SEQ_NEXT_VAL',1),('PRD_TYPE_SEQ_NEXT_VAL',1),('PRODUCT_AVAIL_SEQ_NEXT_VAL',2),('product_description_seq',9),('PRODUCT_IMG_SEQ_NEXT_VAL',1),('product_price_description_seq',9),('PRODUCT_PRICE_SEQ_NEXT_VAL',2),('PRODUCT_RELATION_SEQ_NEXT_VAL',1),('product_review_description_seq',2),('PRODUCT_REVIEW_SEQ_NEXT_VAL',1),('PRODUCT_SEQ_NEXT_VAL',2),('SHP_CRT_ITM_SEQ_NEXT_VAL',5),('SHP_CRT_SEQ_NEXT_VAL',4),('SHP_ORIG_SEQ_NEXT_VAL',1),('STATUS_HIST_ID_NEXT_VALUE',1),('STORE_SEQ_NEXT_VAL',1),('SYST_CONF_SEQ_NEXT_VAL',1),('TX_CLASS_SEQ_NEXT_VAL',1),('USER_SEQ_NEXT_VAL',1),('zone_description_seq',377),('ZONE_SEQ_NEXT_VAL',4);
/*!40000 ALTER TABLE `sm_sequencer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sm_transaction`
--

DROP TABLE IF EXISTS `sm_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sm_transaction` (
  `TRANSACTION_ID` bigint NOT NULL,
  `AMOUNT` decimal(19,2) DEFAULT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(20) DEFAULT NULL,
  `DETAILS` longtext,
  `PAYMENT_TYPE` varchar(255) DEFAULT NULL,
  `TRANSACTION_DATE` datetime DEFAULT NULL,
  `TRANSACTION_TYPE` varchar(255) DEFAULT NULL,
  `ORDER_ID` bigint DEFAULT NULL,
  PRIMARY KEY (`TRANSACTION_ID`),
  KEY `FK7j0s1gqh2tue1fyh5nyj5kwkp` (`ORDER_ID`),
  CONSTRAINT `FK7j0s1gqh2tue1fyh5nyj5kwkp` FOREIGN KEY (`ORDER_ID`) REFERENCES `orders` (`ORDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sm_transaction`
--

LOCK TABLES `sm_transaction` WRITE;
/*!40000 ALTER TABLE `sm_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `sm_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_configuration`
--

DROP TABLE IF EXISTS `system_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_configuration` (
  `SYSTEM_CONFIG_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(20) DEFAULT NULL,
  `CONFIG_KEY` varchar(255) DEFAULT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`SYSTEM_CONFIG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_configuration`
--

LOCK TABLES `system_configuration` WRITE;
/*!40000 ALTER TABLE `system_configuration` DISABLE KEYS */;
INSERT INTO `system_configuration` VALUES (1,'2020-06-26 10:05:19','2020-06-26 10:05:19','SYSTEM','TEST_DATA_LOADED','true');
/*!40000 ALTER TABLE `system_configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_notification`
--

DROP TABLE IF EXISTS `system_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_notification` (
  `SYSTEM_NOTIF_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(20) DEFAULT NULL,
  `END_DATE` date DEFAULT NULL,
  `CONFIG_KEY` varchar(255) DEFAULT NULL,
  `START_DATE` date DEFAULT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `MERCHANT_ID` int DEFAULT NULL,
  `USER_ID` bigint DEFAULT NULL,
  PRIMARY KEY (`SYSTEM_NOTIF_ID`),
  UNIQUE KEY `UKnpdnlc390vgr2mhepib1mtrmr` (`MERCHANT_ID`,`CONFIG_KEY`),
  KEY `FKa54891emcl0fo27a1qk54slvk` (`USER_ID`),
  CONSTRAINT `FKa54891emcl0fo27a1qk54slvk` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`),
  CONSTRAINT `FKs6qk7l06e0s6m9n04momedgt7` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `merchant_store` (`MERCHANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_notification`
--

LOCK TABLES `system_notification` WRITE;
/*!40000 ALTER TABLE `system_notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_class`
--

DROP TABLE IF EXISTS `tax_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tax_class` (
  `TAX_CLASS_ID` bigint NOT NULL,
  `TAX_CLASS_CODE` varchar(10) NOT NULL,
  `TAX_CLASS_TITLE` varchar(32) NOT NULL,
  `MERCHANT_ID` int DEFAULT NULL,
  PRIMARY KEY (`TAX_CLASS_ID`),
  UNIQUE KEY `UKa4q5q57a8oeh2ojeo8dhr935k` (`MERCHANT_ID`,`TAX_CLASS_CODE`),
  KEY `TAX_CLASS_CODE_IDX` (`TAX_CLASS_CODE`),
  CONSTRAINT `FK82i8puujghcv7fc82qwsgjg8w` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `merchant_store` (`MERCHANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_class`
--

LOCK TABLES `tax_class` WRITE;
/*!40000 ALTER TABLE `tax_class` DISABLE KEYS */;
INSERT INTO `tax_class` VALUES (1,'DEFAULT','DEFAULT',1);
/*!40000 ALTER TABLE `tax_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_rate`
--

DROP TABLE IF EXISTS `tax_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tax_rate` (
  `TAX_RATE_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(20) DEFAULT NULL,
  `TAX_CODE` varchar(255) DEFAULT NULL,
  `PIGGYBACK` bit(1) DEFAULT NULL,
  `STORE_STATE_PROV` varchar(100) DEFAULT NULL,
  `TAX_PRIORITY` int DEFAULT NULL,
  `TAX_RATE` decimal(7,4) NOT NULL,
  `COUNTRY_ID` int NOT NULL,
  `MERCHANT_ID` int NOT NULL,
  `PARENT_ID` bigint DEFAULT NULL,
  `TAX_CLASS_ID` bigint NOT NULL,
  `ZONE_ID` bigint DEFAULT NULL,
  PRIMARY KEY (`TAX_RATE_ID`),
  UNIQUE KEY `UK8gh6l9n0xq03b91sglp62oelu` (`TAX_CODE`,`MERCHANT_ID`),
  KEY `FK6wm34jcwoembe1qsmle2wtwnv` (`COUNTRY_ID`),
  KEY `FKfwp6yka2qps9jna473e6c6yc1` (`MERCHANT_ID`),
  KEY `FKt8isen27i3ioa0tw3bl8qlvdh` (`PARENT_ID`),
  KEY `FK7bpa9pbl1gnj5y3xbgs3wc0eg` (`TAX_CLASS_ID`),
  KEY `FKm9snpf6o1nb4j1t80nas8d1ix` (`ZONE_ID`),
  CONSTRAINT `FK6wm34jcwoembe1qsmle2wtwnv` FOREIGN KEY (`COUNTRY_ID`) REFERENCES `country` (`COUNTRY_ID`),
  CONSTRAINT `FK7bpa9pbl1gnj5y3xbgs3wc0eg` FOREIGN KEY (`TAX_CLASS_ID`) REFERENCES `tax_class` (`TAX_CLASS_ID`),
  CONSTRAINT `FKfwp6yka2qps9jna473e6c6yc1` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `merchant_store` (`MERCHANT_ID`),
  CONSTRAINT `FKm9snpf6o1nb4j1t80nas8d1ix` FOREIGN KEY (`ZONE_ID`) REFERENCES `zone` (`ZONE_ID`),
  CONSTRAINT `FKt8isen27i3ioa0tw3bl8qlvdh` FOREIGN KEY (`PARENT_ID`) REFERENCES `tax_rate` (`TAX_RATE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_rate`
--

LOCK TABLES `tax_rate` WRITE;
/*!40000 ALTER TABLE `tax_rate` DISABLE KEYS */;
/*!40000 ALTER TABLE `tax_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_rate_description`
--

DROP TABLE IF EXISTS `tax_rate_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tax_rate_description` (
  `DESCRIPTION_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(20) DEFAULT NULL,
  `DESCRIPTION` longtext,
  `NAME` varchar(120) NOT NULL,
  `TITLE` varchar(100) DEFAULT NULL,
  `LANGUAGE_ID` int NOT NULL,
  `TAX_RATE_ID` bigint DEFAULT NULL,
  PRIMARY KEY (`DESCRIPTION_ID`),
  UNIQUE KEY `UKt3xg8pl88yacdxg49nb46effg` (`TAX_RATE_ID`,`LANGUAGE_ID`),
  KEY `FKsicb2ydx42o04pvlnxw2mlx0w` (`LANGUAGE_ID`),
  CONSTRAINT `FK65c2lqslk5kx25dpkem2r0vxq` FOREIGN KEY (`TAX_RATE_ID`) REFERENCES `tax_rate` (`TAX_RATE_ID`),
  CONSTRAINT `FKsicb2ydx42o04pvlnxw2mlx0w` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `language` (`LANGUAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_rate_description`
--

LOCK TABLES `tax_rate_description` WRITE;
/*!40000 ALTER TABLE `tax_rate_description` DISABLE KEYS */;
/*!40000 ALTER TABLE `tax_rate_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `USER_ID` bigint NOT NULL,
  `ACTIVE` bit(1) DEFAULT NULL,
  `ADMIN_EMAIL` varchar(255) DEFAULT NULL,
  `ADMIN_NAME` varchar(100) DEFAULT NULL,
  `ADMIN_PASSWORD` varchar(60) DEFAULT NULL,
  `ADMIN_A1` varchar(255) DEFAULT NULL,
  `ADMIN_A2` varchar(255) DEFAULT NULL,
  `ADMIN_A3` varchar(255) DEFAULT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(20) DEFAULT NULL,
  `ADMIN_FIRST_NAME` varchar(255) DEFAULT NULL,
  `LAST_ACCESS` datetime DEFAULT NULL,
  `ADMIN_LAST_NAME` varchar(255) DEFAULT NULL,
  `LOGIN_ACCESS` datetime DEFAULT NULL,
  `ADMIN_Q1` varchar(255) DEFAULT NULL,
  `ADMIN_Q2` varchar(255) DEFAULT NULL,
  `ADMIN_Q3` varchar(255) DEFAULT NULL,
  `LANGUAGE_ID` int DEFAULT NULL,
  `MERCHANT_ID` int NOT NULL,
  PRIMARY KEY (`USER_ID`),
  UNIQUE KEY `UKt2hv34k7g4po0pvmmvt5c7vgo` (`MERCHANT_ID`,`ADMIN_NAME`),
  KEY `FK3sh6qxgt118m71ttvkubgd9y8` (`LANGUAGE_ID`),
  CONSTRAINT `FK2yn065l2n7nw9rofjs4hwpij2` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `merchant_store` (`MERCHANT_ID`),
  CONSTRAINT `FK3sh6qxgt118m71ttvkubgd9y8` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `language` (`LANGUAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,_binary '','admin@shopizer.com','admin@shopizer.com','$2a$10$xRdrmbrQbDC3FM/JD/hdSew4wBcY51d4M2gJtRgYDwXDMbXi05k2m',NULL,NULL,NULL,'2020-06-26 10:05:16','2020-08-09 21:58:03',NULL,'Administrator','2020-07-30 22:32:39','User','2020-08-09 21:58:03',NULL,NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_group`
--

DROP TABLE IF EXISTS `user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_group` (
  `USER_ID` bigint NOT NULL,
  `GROUP_ID` int NOT NULL,
  KEY `FK75kainrhn4kh8j3sw2xbe7v61` (`GROUP_ID`),
  KEY `FKdonp1m2n25ua1465rhice3qna` (`USER_ID`),
  CONSTRAINT `FK75kainrhn4kh8j3sw2xbe7v61` FOREIGN KEY (`GROUP_ID`) REFERENCES `sm_group` (`GROUP_ID`),
  CONSTRAINT `FKdonp1m2n25ua1465rhice3qna` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group`
--

LOCK TABLES `user_group` WRITE;
/*!40000 ALTER TABLE `user_group` DISABLE KEYS */;
INSERT INTO `user_group` VALUES (1,1),(1,2);
/*!40000 ALTER TABLE `user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userconnection`
--

DROP TABLE IF EXISTS `userconnection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userconnection` (
  `providerId` varchar(255) NOT NULL,
  `providerUserId` varchar(255) NOT NULL,
  `userId` varchar(255) NOT NULL,
  `accessToken` varchar(255) DEFAULT NULL,
  `displayName` varchar(255) DEFAULT NULL,
  `expireTime` bigint DEFAULT NULL,
  `imageUrl` varchar(255) DEFAULT NULL,
  `profileUrl` varchar(255) DEFAULT NULL,
  `refreshToken` varchar(255) DEFAULT NULL,
  `secret` varchar(255) DEFAULT NULL,
  `userRank` int NOT NULL,
  PRIMARY KEY (`providerId`,`providerUserId`,`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userconnection`
--

LOCK TABLES `userconnection` WRITE;
/*!40000 ALTER TABLE `userconnection` DISABLE KEYS */;
/*!40000 ALTER TABLE `userconnection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zone`
--

DROP TABLE IF EXISTS `zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zone` (
  `ZONE_ID` bigint NOT NULL,
  `ZONE_CODE` varchar(255) NOT NULL,
  `COUNTRY_ID` int NOT NULL,
  PRIMARY KEY (`ZONE_ID`),
  UNIQUE KEY `UK_4tq3p5w8k4h4easyf5t3n1jdr` (`ZONE_CODE`),
  KEY `FKhn2c1w3e1twhjg7tiwv7vuk67` (`COUNTRY_ID`),
  CONSTRAINT `FKhn2c1w3e1twhjg7tiwv7vuk67` FOREIGN KEY (`COUNTRY_ID`) REFERENCES `country` (`COUNTRY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zone`
--

LOCK TABLES `zone` WRITE;
/*!40000 ALTER TABLE `zone` DISABLE KEYS */;
INSERT INTO `zone` VALUES (1,'Guipuzcoa',79),(2,'HI',91),(3,'PR',91),(4,'Zamora',79),(5,'Vizcaya',79),(6,'Albacete',79),(7,'Lleida',79),(8,'QC',13),(9,'NRW',30),(10,'IA',91),(11,'ID',91),(12,'YT',13),(13,'Leon',79),(14,'ACorua',79),(15,'Castellon',79),(16,'LasPalmas',79),(17,'Pontevedra',79),(18,'AA',91),(19,'Teruel',79),(20,'AB',13),(21,'AC',91),(22,'IL',91),(23,'AE',91),(24,'AF',91),(25,'IN',91),(26,'AG',82),(27,'A Corua',79),(28,'AI',82),(29,'AK',91),(30,'Caceres',79),(31,'Segovia',79),(32,'AL',91),(33,'AM',91),(34,'ZG',82),(35,'Malaga',79),(36,'ZH',82),(37,'LaRioja',79),(38,'AP',91),(39,'Melilla',79),(40,'AR',91),(41,'AS',91),(42,'NSW',4),(43,'Madrid',79),(44,'RI',91),(45,'AZ',91),(46,'Ceuta',79),(47,'BC',13),(48,'Huelva',79),(49,'BE',82),(50,'Huesca',79),(51,'ARCH',82),(52,'BL',82),(53,'JU',82),(54,'Asturias',79),(55,'SA',4),(56,'SB',5),(57,'TIAT',5),(58,'SC',91),(59,'THE',30),(60,'SD',91),(61,'BS',82),(62,'Cordoba',79),(63,'Tarragona',79),(64,'Valladolid',79),(65,'SG',82),(66,'SH',82),(67,'WAAU',4),(68,'SK',13),(69,'NDS',30),(70,'SO',82),(71,'CA',91),(72,'NTAU',4),(73,'ST',5),(74,'KN',5),(75,'Jaen',79),(76,'CiudadReal',79),(77,'SZ',82),(78,'Alava',79),(79,'KS',91),(80,'CO',91),(81,'KY',91),(82,'BER',30),(83,'CT',91),(84,'ACT',4),(85,'TG',82),(86,'LA',91),(87,'HAM',30),(88,'TI',82),(89,'Lugo',79),(90,'NECH',82),(91,'TN',91),(92,'Toledo',79),(93,'DC',91),(94,'Palencia',79),(95,'DE',91),(96,'TX',91),(97,'TAS',4),(98,'QLD',4),(99,'LU',82),(100,'Burgos',79),(101,'Cadiz',79),(102,'SantaCruzdeTenerife',79),(103,'MA',91),(104,'MB',13),(105,'MD',91),(106,'Girona',79),(107,'ME',91),(108,'Alicante',79),(109,'Guadalajara',79),(110,'Cantabria',79),(111,'MH',91),(112,'MI',91),(113,'UR',82),(114,'UT',91),(115,'MN',91),(116,'MO',91),(117,'MP',91),(118,'Barcelona',79),(119,'MS',91),(120,'MT',91),(121,'Badajoz',79),(122,'MEC',30),(123,'VA',91),(124,'VB',5),(125,'Cuenca',79),(126,'WIAT',5),(127,'VD',82),(128,'Sevilla',79),(129,'VI',91),(130,'Zaragoza',79),(131,'NB',13),(132,'SAC',30),(133,'NC',91),(134,'ND',91),(135,'NE',91),(136,'NF',13),(137,'NH',91),(138,'NJ',91),(139,'VS',82),(140,'VT',91),(141,'NM',91),(142,'NO',5),(143,'SAS',30),(144,'NS',13),(145,'SAR',30),(146,'FL',91),(147,'NT',13),(148,'FM',91),(149,'NU',13),(150,'NV',91),(151,'NW',82),(152,'WA',91),(153,'NY',91),(154,'Granada',79),(155,'Soria',79),(156,'FR',82),(157,'RHE',30),(158,'Ourense',79),(159,'WI',91),(160,'OH',91),(161,'GA',91),(162,'Murcia',79),(163,'OK',91),(164,'GE',82),(165,'WV',91),(166,'ON',13),(167,'OO',5),(168,'WY',91),(169,'BLAT',5),(170,'Avila',79),(171,'OR',91),(172,'Salamanca',79),(173,'GL',82),(174,'Baleares',79),(175,'OW',82),(176,'GR',82),(177,'GU',91),(178,'PA',91),(179,'VIC',4),(180,'BRE',30),(181,'PE',13),(182,'BRG',30),(183,'HES',30),(184,'Almeria',79),(185,'BAW',30),(186,'BAY',30),(187,'Navarra',79),(188,'Valencia',79),(189,'SCN',30);
/*!40000 ALTER TABLE `zone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zone_description`
--

DROP TABLE IF EXISTS `zone_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zone_description` (
  `DESCRIPTION_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(20) DEFAULT NULL,
  `DESCRIPTION` longtext,
  `NAME` varchar(120) NOT NULL,
  `TITLE` varchar(100) DEFAULT NULL,
  `LANGUAGE_ID` int NOT NULL,
  `ZONE_ID` bigint NOT NULL,
  PRIMARY KEY (`DESCRIPTION_ID`),
  UNIQUE KEY `UKm64laxgrv9fxm6io232ap4su9` (`ZONE_ID`,`LANGUAGE_ID`),
  KEY `FK69ybu7r3bgpcq65c77ji1udh3` (`LANGUAGE_ID`),
  CONSTRAINT `FK69ybu7r3bgpcq65c77ji1udh3` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `language` (`LANGUAGE_ID`),
  CONSTRAINT `FKpv4elin6w3b03756obqvk447f` FOREIGN KEY (`ZONE_ID`) REFERENCES `zone` (`ZONE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zone_description`
--

LOCK TABLES `zone_description` WRITE;
/*!40000 ALTER TABLE `zone_description` DISABLE KEYS */;
INSERT INTO `zone_description` VALUES (1,'2020-06-26 10:05:08','2020-06-26 10:05:08',NULL,NULL,'Guipuzcoa',NULL,1,1),(2,'2020-06-26 10:05:08','2020-06-26 10:05:08',NULL,NULL,'Guipuzcoa',NULL,2,1),(3,'2020-06-26 10:05:08','2020-06-26 10:05:08',NULL,NULL,'Hawaii',NULL,1,2),(4,'2020-06-26 10:05:08','2020-06-26 10:05:08',NULL,NULL,'Hawaii',NULL,2,2),(5,'2020-06-26 10:05:08','2020-06-26 10:05:08',NULL,NULL,'Puerto Rico',NULL,1,3),(6,'2020-06-26 10:05:08','2020-06-26 10:05:08',NULL,NULL,'Puerto Rico',NULL,2,3),(7,'2020-06-26 10:05:08','2020-06-26 10:05:08',NULL,NULL,'Zamora',NULL,1,4),(8,'2020-06-26 10:05:08','2020-06-26 10:05:08',NULL,NULL,'Zamora',NULL,2,4),(9,'2020-06-26 10:05:09','2020-06-26 10:05:09',NULL,NULL,'Vizcaya',NULL,1,5),(10,'2020-06-26 10:05:09','2020-06-26 10:05:09',NULL,NULL,'Vizcaya',NULL,2,5),(11,'2020-06-26 10:05:09','2020-06-26 10:05:09',NULL,NULL,'Albacete',NULL,1,6),(12,'2020-06-26 10:05:09','2020-06-26 10:05:09',NULL,NULL,'Albacete',NULL,2,6),(13,'2020-06-26 10:05:09','2020-06-26 10:05:09',NULL,NULL,'Lleida',NULL,1,7),(14,'2020-06-26 10:05:09','2020-06-26 10:05:09',NULL,NULL,'Lleida',NULL,2,7),(15,'2020-06-26 10:05:09','2020-06-26 10:05:09',NULL,NULL,'Quebec',NULL,1,8),(16,'2020-06-26 10:05:09','2020-06-26 10:05:09',NULL,NULL,'Québec',NULL,2,8),(17,'2020-06-26 10:05:09','2020-06-26 10:05:09',NULL,NULL,'Nordrhein-Westfalen',NULL,1,9),(18,'2020-06-26 10:05:09','2020-06-26 10:05:09',NULL,NULL,'Nordrhein-Westfalen',NULL,2,9),(19,'2020-06-26 10:05:09','2020-06-26 10:05:09',NULL,NULL,'Iowa',NULL,1,10),(20,'2020-06-26 10:05:09','2020-06-26 10:05:09',NULL,NULL,'Iowa',NULL,2,10),(21,'2020-06-26 10:05:09','2020-06-26 10:05:09',NULL,NULL,'Idaho',NULL,1,11),(22,'2020-06-26 10:05:09','2020-06-26 10:05:09',NULL,NULL,'Idaho',NULL,2,11),(23,'2020-06-26 10:05:09','2020-06-26 10:05:09',NULL,NULL,'Yukon Territory',NULL,1,12),(24,'2020-06-26 10:05:09','2020-06-26 10:05:09',NULL,NULL,'Yukon',NULL,2,12),(25,'2020-06-26 10:05:09','2020-06-26 10:05:09',NULL,NULL,'Leon',NULL,1,13),(26,'2020-06-26 10:05:09','2020-06-26 10:05:09',NULL,NULL,'Leon',NULL,2,13),(27,'2020-06-26 10:05:09','2020-06-26 10:05:09',NULL,NULL,'A Corua',NULL,1,14),(28,'2020-06-26 10:05:09','2020-06-26 10:05:09',NULL,NULL,'Castellon',NULL,1,15),(29,'2020-06-26 10:05:09','2020-06-26 10:05:09',NULL,NULL,'Castellon',NULL,2,15),(30,'2020-06-26 10:05:09','2020-06-26 10:05:09',NULL,NULL,'Las Palmas',NULL,1,16),(31,'2020-06-26 10:05:09','2020-06-26 10:05:09',NULL,NULL,'Las Palmas',NULL,2,16),(32,'2020-06-26 10:05:09','2020-06-26 10:05:09',NULL,NULL,'Pontevedra',NULL,1,17),(33,'2020-06-26 10:05:09','2020-06-26 10:05:09',NULL,NULL,'Pontevedra',NULL,2,17),(34,'2020-06-26 10:05:09','2020-06-26 10:05:09',NULL,NULL,'Armed Forces Americas',NULL,1,18),(35,'2020-06-26 10:05:09','2020-06-26 10:05:09',NULL,NULL,'Armed Forces Americas',NULL,2,18),(36,'2020-06-26 10:05:09','2020-06-26 10:05:09',NULL,NULL,'Teruel',NULL,1,19),(37,'2020-06-26 10:05:09','2020-06-26 10:05:09',NULL,NULL,'Teruel',NULL,2,19),(38,'2020-06-26 10:05:09','2020-06-26 10:05:09',NULL,NULL,'Alberta',NULL,1,20),(39,'2020-06-26 10:05:09','2020-06-26 10:05:09',NULL,NULL,'Alberta',NULL,2,20),(40,'2020-06-26 10:05:09','2020-06-26 10:05:09',NULL,NULL,'Armed Forces Canada',NULL,1,21),(41,'2020-06-26 10:05:09','2020-06-26 10:05:09',NULL,NULL,'Armed Forces Canada',NULL,2,21),(42,'2020-06-26 10:05:09','2020-06-26 10:05:09',NULL,NULL,'Illinois',NULL,1,22),(43,'2020-06-26 10:05:09','2020-06-26 10:05:09',NULL,NULL,'Illinois',NULL,2,22),(44,'2020-06-26 10:05:09','2020-06-26 10:05:09',NULL,NULL,'Armed Forces Europe',NULL,1,23),(45,'2020-06-26 10:05:09','2020-06-26 10:05:09',NULL,NULL,'Armed Forces Europe',NULL,2,23),(46,'2020-06-26 10:05:09','2020-06-26 10:05:09',NULL,NULL,'Armed Forces Africa',NULL,1,24),(47,'2020-06-26 10:05:09','2020-06-26 10:05:09',NULL,NULL,'Armed Forces Africa',NULL,2,24),(48,'2020-06-26 10:05:09','2020-06-26 10:05:09',NULL,NULL,'Indiana',NULL,1,25),(49,'2020-06-26 10:05:09','2020-06-26 10:05:09',NULL,NULL,'Indiana',NULL,2,25),(50,'2020-06-26 10:05:09','2020-06-26 10:05:09',NULL,NULL,'Aargau',NULL,1,26),(51,'2020-06-26 10:05:09','2020-06-26 10:05:09',NULL,NULL,'Aargau',NULL,2,26),(52,'2020-06-26 10:05:09','2020-06-26 10:05:09',NULL,NULL,'A Corua',NULL,2,27),(53,'2020-06-26 10:05:09','2020-06-26 10:05:09',NULL,NULL,'Appenzell Innerrhoden',NULL,1,28),(54,'2020-06-26 10:05:09','2020-06-26 10:05:09',NULL,NULL,'Appenzell Innerrhoden',NULL,2,28),(55,'2020-06-26 10:05:09','2020-06-26 10:05:09',NULL,NULL,'Alaska',NULL,1,29),(56,'2020-06-26 10:05:09','2020-06-26 10:05:09',NULL,NULL,'Alaska',NULL,2,29),(57,'2020-06-26 10:05:09','2020-06-26 10:05:09',NULL,NULL,'Caceres',NULL,1,30),(58,'2020-06-26 10:05:09','2020-06-26 10:05:09',NULL,NULL,'Caceres',NULL,2,30),(59,'2020-06-26 10:05:09','2020-06-26 10:05:09',NULL,NULL,'Segovia',NULL,1,31),(60,'2020-06-26 10:05:09','2020-06-26 10:05:09',NULL,NULL,'Segovia',NULL,2,31),(61,'2020-06-26 10:05:09','2020-06-26 10:05:09',NULL,NULL,'Alabama',NULL,1,32),(62,'2020-06-26 10:05:09','2020-06-26 10:05:09',NULL,NULL,'Alabama',NULL,2,32),(63,'2020-06-26 10:05:09','2020-06-26 10:05:09',NULL,NULL,'Armed Forces Middle East',NULL,1,33),(64,'2020-06-26 10:05:09','2020-06-26 10:05:09',NULL,NULL,'Armed Forces Middle East',NULL,2,33),(65,'2020-06-26 10:05:09','2020-06-26 10:05:09',NULL,NULL,'Zug',NULL,1,34),(66,'2020-06-26 10:05:09','2020-06-26 10:05:09',NULL,NULL,'Zug',NULL,2,34),(67,'2020-06-26 10:05:09','2020-06-26 10:05:09',NULL,NULL,'Malaga',NULL,1,35),(68,'2020-06-26 10:05:09','2020-06-26 10:05:09',NULL,NULL,'Malaga',NULL,2,35),(69,'2020-06-26 10:05:09','2020-06-26 10:05:09',NULL,NULL,'Zrich',NULL,1,36),(70,'2020-06-26 10:05:09','2020-06-26 10:05:09',NULL,NULL,'Zrich',NULL,2,36),(71,'2020-06-26 10:05:09','2020-06-26 10:05:09',NULL,NULL,'La Rioja',NULL,1,37),(72,'2020-06-26 10:05:09','2020-06-26 10:05:09',NULL,NULL,'La Rioja',NULL,2,37),(73,'2020-06-26 10:05:09','2020-06-26 10:05:09',NULL,NULL,'Armed Forces Pacific',NULL,1,38),(74,'2020-06-26 10:05:09','2020-06-26 10:05:09',NULL,NULL,'Armed Forces Pacific',NULL,2,38),(75,'2020-06-26 10:05:09','2020-06-26 10:05:09',NULL,NULL,'Melilla',NULL,1,39),(76,'2020-06-26 10:05:09','2020-06-26 10:05:09',NULL,NULL,'Melilla',NULL,2,39),(77,'2020-06-26 10:05:09','2020-06-26 10:05:09',NULL,NULL,'Arkansas',NULL,1,40),(78,'2020-06-26 10:05:09','2020-06-26 10:05:09',NULL,NULL,'Arkansas',NULL,2,40),(79,'2020-06-26 10:05:09','2020-06-26 10:05:09',NULL,NULL,'American Samoa',NULL,1,41),(80,'2020-06-26 10:05:09','2020-06-26 10:05:09',NULL,NULL,'American Samoa',NULL,2,41),(81,'2020-06-26 10:05:09','2020-06-26 10:05:09',NULL,NULL,'New South Wales',NULL,1,42),(82,'2020-06-26 10:05:09','2020-06-26 10:05:09',NULL,NULL,'Nouvelle-Galles du Sud',NULL,2,42),(83,'2020-06-26 10:05:09','2020-06-26 10:05:09',NULL,NULL,'Madrid',NULL,1,43),(84,'2020-06-26 10:05:09','2020-06-26 10:05:09',NULL,NULL,'Madrid',NULL,2,43),(85,'2020-06-26 10:05:10','2020-06-26 10:05:10',NULL,NULL,'Rhode Island',NULL,1,44),(86,'2020-06-26 10:05:10','2020-06-26 10:05:10',NULL,NULL,'Rhode Island',NULL,2,44),(87,'2020-06-26 10:05:10','2020-06-26 10:05:10',NULL,NULL,'Arizona',NULL,1,45),(88,'2020-06-26 10:05:10','2020-06-26 10:05:10',NULL,NULL,'Arizona',NULL,2,45),(89,'2020-06-26 10:05:10','2020-06-26 10:05:10',NULL,NULL,'Ceuta',NULL,1,46),(90,'2020-06-26 10:05:10','2020-06-26 10:05:10',NULL,NULL,'Ceuta',NULL,2,46),(91,'2020-06-26 10:05:10','2020-06-26 10:05:10',NULL,NULL,'British Columbia',NULL,1,47),(92,'2020-06-26 10:05:10','2020-06-26 10:05:10',NULL,NULL,'Columbie Britanique',NULL,2,47),(93,'2020-06-26 10:05:10','2020-06-26 10:05:10',NULL,NULL,'Huelva',NULL,1,48),(94,'2020-06-26 10:05:10','2020-06-26 10:05:10',NULL,NULL,'Huelva',NULL,2,48),(95,'2020-06-26 10:05:10','2020-06-26 10:05:10',NULL,NULL,'Bern',NULL,1,49),(96,'2020-06-26 10:05:10','2020-06-26 10:05:10',NULL,NULL,'Bern',NULL,2,49),(97,'2020-06-26 10:05:10','2020-06-26 10:05:10',NULL,NULL,'Huesca',NULL,1,50),(98,'2020-06-26 10:05:10','2020-06-26 10:05:10',NULL,NULL,'Huesca',NULL,2,50),(99,'2020-06-26 10:05:10','2020-06-26 10:05:10',NULL,NULL,'Appenzell Ausserrhoden',NULL,1,51),(100,'2020-06-26 10:05:10','2020-06-26 10:05:10',NULL,NULL,'Appenzell Ausserrhoden',NULL,2,51),(101,'2020-06-26 10:05:10','2020-06-26 10:05:10',NULL,NULL,'Basel-Landschaft',NULL,1,52),(102,'2020-06-26 10:05:10','2020-06-26 10:05:10',NULL,NULL,'Basel-Landschaft',NULL,2,52),(103,'2020-06-26 10:05:10','2020-06-26 10:05:10',NULL,NULL,'Jura',NULL,1,53),(104,'2020-06-26 10:05:10','2020-06-26 10:05:10',NULL,NULL,'Jura',NULL,2,53),(105,'2020-06-26 10:05:10','2020-06-26 10:05:10',NULL,NULL,'Asturias',NULL,1,54),(106,'2020-06-26 10:05:10','2020-06-26 10:05:10',NULL,NULL,'Asturias',NULL,2,54),(107,'2020-06-26 10:05:10','2020-06-26 10:05:10',NULL,NULL,'South Australia',NULL,1,55),(108,'2020-06-26 10:05:10','2020-06-26 10:05:10',NULL,NULL,'Australie-Mridionale',NULL,2,55),(109,'2020-06-26 10:05:10','2020-06-26 10:05:10',NULL,NULL,'Salzburg',NULL,1,56),(110,'2020-06-26 10:05:10','2020-06-26 10:05:10',NULL,NULL,'Salzburg',NULL,2,56),(111,'2020-06-26 10:05:10','2020-06-26 10:05:10',NULL,NULL,'Tirol',NULL,1,57),(112,'2020-06-26 10:05:10','2020-06-26 10:05:10',NULL,NULL,'Tirol',NULL,2,57),(113,'2020-06-26 10:05:10','2020-06-26 10:05:10',NULL,NULL,'South Carolina',NULL,1,58),(114,'2020-06-26 10:05:10','2020-06-26 10:05:10',NULL,NULL,'Caroline du Sud',NULL,2,58),(115,'2020-06-26 10:05:10','2020-06-26 10:05:10',NULL,NULL,'Thringen',NULL,1,59),(116,'2020-06-26 10:05:10','2020-06-26 10:05:10',NULL,NULL,'Thringen',NULL,2,59),(117,'2020-06-26 10:05:10','2020-06-26 10:05:10',NULL,NULL,'South Dakota',NULL,1,60),(118,'2020-06-26 10:05:10','2020-06-26 10:05:10',NULL,NULL,'Dakota du Sud',NULL,2,60),(119,'2020-06-26 10:05:10','2020-06-26 10:05:10',NULL,NULL,'Basel-Stadt',NULL,1,61),(120,'2020-06-26 10:05:10','2020-06-26 10:05:10',NULL,NULL,'Basel-Stadt',NULL,2,61),(121,'2020-06-26 10:05:10','2020-06-26 10:05:10',NULL,NULL,'Cordoba',NULL,1,62),(122,'2020-06-26 10:05:10','2020-06-26 10:05:10',NULL,NULL,'Cordoba',NULL,2,62),(123,'2020-06-26 10:05:10','2020-06-26 10:05:10',NULL,NULL,'Tarragona',NULL,1,63),(124,'2020-06-26 10:05:10','2020-06-26 10:05:10',NULL,NULL,'Tarragona',NULL,2,63),(125,'2020-06-26 10:05:10','2020-06-26 10:05:10',NULL,NULL,'Valladolid',NULL,1,64),(126,'2020-06-26 10:05:10','2020-06-26 10:05:10',NULL,NULL,'Valladolid',NULL,2,64),(127,'2020-06-26 10:05:10','2020-06-26 10:05:10',NULL,NULL,'St. Gallen',NULL,1,65),(128,'2020-06-26 10:05:10','2020-06-26 10:05:10',NULL,NULL,'St. Gallen',NULL,2,65),(129,'2020-06-26 10:05:10','2020-06-26 10:05:10',NULL,NULL,'Schaffhausen',NULL,1,66),(130,'2020-06-26 10:05:10','2020-06-26 10:05:10',NULL,NULL,'Schaffhausen',NULL,2,66),(131,'2020-06-26 10:05:10','2020-06-26 10:05:10',NULL,NULL,'Western Australia',NULL,1,67),(132,'2020-06-26 10:05:10','2020-06-26 10:05:10',NULL,NULL,'Australie-Occidentale',NULL,2,67),(133,'2020-06-26 10:05:10','2020-06-26 10:05:10',NULL,NULL,'Saskatchewan',NULL,1,68),(134,'2020-06-26 10:05:10','2020-06-26 10:05:10',NULL,NULL,'Saskatchewan',NULL,2,68),(135,'2020-06-26 10:05:10','2020-06-26 10:05:10',NULL,NULL,'Niedersachsen',NULL,1,69),(136,'2020-06-26 10:05:10','2020-06-26 10:05:10',NULL,NULL,'Niedersachsen',NULL,2,69),(137,'2020-06-26 10:05:10','2020-06-26 10:05:10',NULL,NULL,'Solothurn',NULL,1,70),(138,'2020-06-26 10:05:10','2020-06-26 10:05:10',NULL,NULL,'Solothurn',NULL,2,70),(139,'2020-06-26 10:05:10','2020-06-26 10:05:10',NULL,NULL,'California',NULL,1,71),(140,'2020-06-26 10:05:10','2020-06-26 10:05:10',NULL,NULL,'Californie',NULL,2,71),(141,'2020-06-26 10:05:10','2020-06-26 10:05:10',NULL,NULL,'Northern Territory',NULL,1,72),(142,'2020-06-26 10:05:10','2020-06-26 10:05:10',NULL,NULL,'Territoire du Nord',NULL,2,72),(143,'2020-06-26 10:05:10','2020-06-26 10:05:10',NULL,NULL,'Steiermark',NULL,1,73),(144,'2020-06-26 10:05:10','2020-06-26 10:05:10',NULL,NULL,'Steiermark',NULL,2,73),(145,'2020-06-26 10:05:10','2020-06-26 10:05:10',NULL,NULL,'Katen',NULL,1,74),(146,'2020-06-26 10:05:10','2020-06-26 10:05:10',NULL,NULL,'Karten',NULL,2,74),(147,'2020-06-26 10:05:10','2020-06-26 10:05:10',NULL,NULL,'Jaen',NULL,1,75),(148,'2020-06-26 10:05:10','2020-06-26 10:05:10',NULL,NULL,'Jaen',NULL,2,75),(149,'2020-06-26 10:05:10','2020-06-26 10:05:10',NULL,NULL,'Ciudad Real',NULL,1,76),(150,'2020-06-26 10:05:10','2020-06-26 10:05:10',NULL,NULL,'Ciudad Real',NULL,2,76),(151,'2020-06-26 10:05:10','2020-06-26 10:05:10',NULL,NULL,'Schwyz',NULL,1,77),(152,'2020-06-26 10:05:10','2020-06-26 10:05:10',NULL,NULL,'Schwyz',NULL,2,77),(153,'2020-06-26 10:05:10','2020-06-26 10:05:10',NULL,NULL,'Alava',NULL,1,78),(154,'2020-06-26 10:05:10','2020-06-26 10:05:10',NULL,NULL,'Alava',NULL,2,78),(155,'2020-06-26 10:05:10','2020-06-26 10:05:10',NULL,NULL,'Kansas',NULL,1,79),(156,'2020-06-26 10:05:10','2020-06-26 10:05:10',NULL,NULL,'Kansas',NULL,2,79),(157,'2020-06-26 10:05:10','2020-06-26 10:05:10',NULL,NULL,'Colorado',NULL,1,80),(158,'2020-06-26 10:05:10','2020-06-26 10:05:10',NULL,NULL,'Colorado',NULL,2,80),(159,'2020-06-26 10:05:10','2020-06-26 10:05:10',NULL,NULL,'Kentucky',NULL,1,81),(160,'2020-06-26 10:05:10','2020-06-26 10:05:10',NULL,NULL,'Kentucky',NULL,2,81),(161,'2020-06-26 10:05:10','2020-06-26 10:05:10',NULL,NULL,'Berlin',NULL,1,82),(162,'2020-06-26 10:05:10','2020-06-26 10:05:10',NULL,NULL,'Berlin',NULL,2,82),(163,'2020-06-26 10:05:10','2020-06-26 10:05:10',NULL,NULL,'Connecticut',NULL,1,83),(164,'2020-06-26 10:05:10','2020-06-26 10:05:10',NULL,NULL,'Connecticut',NULL,2,83),(165,'2020-06-26 10:05:11','2020-06-26 10:05:11',NULL,NULL,'Australian Capital Territory',NULL,1,84),(166,'2020-06-26 10:05:11','2020-06-26 10:05:11',NULL,NULL,'Territoire de la capitale australienne',NULL,2,84),(167,'2020-06-26 10:05:11','2020-06-26 10:05:11',NULL,NULL,'Thurgau',NULL,1,85),(168,'2020-06-26 10:05:11','2020-06-26 10:05:11',NULL,NULL,'Thurgau',NULL,2,85),(169,'2020-06-26 10:05:11','2020-06-26 10:05:11',NULL,NULL,'Louisiana',NULL,1,86),(170,'2020-06-26 10:05:11','2020-06-26 10:05:11',NULL,NULL,'Louisiane',NULL,2,86),(171,'2020-06-26 10:05:11','2020-06-26 10:05:11',NULL,NULL,'Hamburg',NULL,1,87),(172,'2020-06-26 10:05:11','2020-06-26 10:05:11',NULL,NULL,'Hamburg',NULL,2,87),(173,'2020-06-26 10:05:11','2020-06-26 10:05:11',NULL,NULL,'Tessin',NULL,1,88),(174,'2020-06-26 10:05:11','2020-06-26 10:05:11',NULL,NULL,'Tessin',NULL,2,88),(175,'2020-06-26 10:05:11','2020-06-26 10:05:11',NULL,NULL,'Lugo',NULL,1,89),(176,'2020-06-26 10:05:11','2020-06-26 10:05:11',NULL,NULL,'Lugo',NULL,2,89),(177,'2020-06-26 10:05:11','2020-06-26 10:05:11',NULL,NULL,'Neuenburg',NULL,1,90),(178,'2020-06-26 10:05:11','2020-06-26 10:05:11',NULL,NULL,'Neuenburg',NULL,2,90),(179,'2020-06-26 10:05:11','2020-06-26 10:05:11',NULL,NULL,'Tennessee',NULL,1,91),(180,'2020-06-26 10:05:11','2020-06-26 10:05:11',NULL,NULL,'Tennessee',NULL,2,91),(181,'2020-06-26 10:05:11','2020-06-26 10:05:11',NULL,NULL,'Toledo',NULL,1,92),(182,'2020-06-26 10:05:11','2020-06-26 10:05:11',NULL,NULL,'Toledo',NULL,2,92),(183,'2020-06-26 10:05:11','2020-06-26 10:05:11',NULL,NULL,'District of Columbia',NULL,1,93),(184,'2020-06-26 10:05:11','2020-06-26 10:05:11',NULL,NULL,'District de Columbia',NULL,2,93),(185,'2020-06-26 10:05:11','2020-06-26 10:05:11',NULL,NULL,'Palencia',NULL,1,94),(186,'2020-06-26 10:05:11','2020-06-26 10:05:11',NULL,NULL,'Palencia',NULL,2,94),(187,'2020-06-26 10:05:11','2020-06-26 10:05:11',NULL,NULL,'Delaware',NULL,1,95),(188,'2020-06-26 10:05:11','2020-06-26 10:05:11',NULL,NULL,'Delaware',NULL,2,95),(189,'2020-06-26 10:05:11','2020-06-26 10:05:11',NULL,NULL,'Texas',NULL,1,96),(190,'2020-06-26 10:05:11','2020-06-26 10:05:11',NULL,NULL,'Texas',NULL,2,96),(191,'2020-06-26 10:05:11','2020-06-26 10:05:11',NULL,NULL,'Tasmania',NULL,1,97),(192,'2020-06-26 10:05:11','2020-06-26 10:05:11',NULL,NULL,'Tasmanie',NULL,2,97),(193,'2020-06-26 10:05:11','2020-06-26 10:05:11',NULL,NULL,'Queensland',NULL,1,98),(194,'2020-06-26 10:05:11','2020-06-26 10:05:11',NULL,NULL,'Queensland',NULL,2,98),(195,'2020-06-26 10:05:11','2020-06-26 10:05:11',NULL,NULL,'Luzern',NULL,1,99),(196,'2020-06-26 10:05:11','2020-06-26 10:05:11',NULL,NULL,'Luzern',NULL,2,99),(197,'2020-06-26 10:05:11','2020-06-26 10:05:11',NULL,NULL,'Burgos',NULL,1,100),(198,'2020-06-26 10:05:11','2020-06-26 10:05:11',NULL,NULL,'Burgos',NULL,2,100),(199,'2020-06-26 10:05:11','2020-06-26 10:05:11',NULL,NULL,'Cadiz',NULL,1,101),(200,'2020-06-26 10:05:11','2020-06-26 10:05:11',NULL,NULL,'Cadiz',NULL,2,101),(201,'2020-06-26 10:05:11','2020-06-26 10:05:11',NULL,NULL,'Santa Cruz de Tenerife',NULL,1,102),(202,'2020-06-26 10:05:11','2020-06-26 10:05:11',NULL,NULL,'Santa Cruz de Tenerife',NULL,2,102),(203,'2020-06-26 10:05:11','2020-06-26 10:05:11',NULL,NULL,'Massachusetts',NULL,1,103),(204,'2020-06-26 10:05:11','2020-06-26 10:05:11',NULL,NULL,'Massachusetts',NULL,2,103),(205,'2020-06-26 10:05:11','2020-06-26 10:05:11',NULL,NULL,'Manitoba',NULL,1,104),(206,'2020-06-26 10:05:11','2020-06-26 10:05:11',NULL,NULL,'Manitoba',NULL,2,104),(207,'2020-06-26 10:05:11','2020-06-26 10:05:11',NULL,NULL,'Maryland',NULL,1,105),(208,'2020-06-26 10:05:11','2020-06-26 10:05:11',NULL,NULL,'Maryland',NULL,2,105),(209,'2020-06-26 10:05:11','2020-06-26 10:05:11',NULL,NULL,'Girona',NULL,1,106),(210,'2020-06-26 10:05:11','2020-06-26 10:05:11',NULL,NULL,'Girona',NULL,2,106),(211,'2020-06-26 10:05:11','2020-06-26 10:05:11',NULL,NULL,'Maine',NULL,1,107),(212,'2020-06-26 10:05:11','2020-06-26 10:05:11',NULL,NULL,'Maine',NULL,2,107),(213,'2020-06-26 10:05:11','2020-06-26 10:05:11',NULL,NULL,'Alicante',NULL,1,108),(214,'2020-06-26 10:05:11','2020-06-26 10:05:11',NULL,NULL,'Alicante',NULL,2,108),(215,'2020-06-26 10:05:11','2020-06-26 10:05:11',NULL,NULL,'Guadalajara',NULL,1,109),(216,'2020-06-26 10:05:11','2020-06-26 10:05:11',NULL,NULL,'Guadalajara',NULL,2,109),(217,'2020-06-26 10:05:11','2020-06-26 10:05:11',NULL,NULL,'Cantabria',NULL,1,110),(218,'2020-06-26 10:05:11','2020-06-26 10:05:11',NULL,NULL,'Cantabria',NULL,2,110),(219,'2020-06-26 10:05:11','2020-06-26 10:05:11',NULL,NULL,'Marshall Islands',NULL,1,111),(220,'2020-06-26 10:05:11','2020-06-26 10:05:11',NULL,NULL,'Marshall Islands',NULL,2,111),(221,'2020-06-26 10:05:11','2020-06-26 10:05:11',NULL,NULL,'Michigan',NULL,1,112),(222,'2020-06-26 10:05:11','2020-06-26 10:05:11',NULL,NULL,'Michigan',NULL,2,112),(223,'2020-06-26 10:05:11','2020-06-26 10:05:11',NULL,NULL,'Uri',NULL,1,113),(224,'2020-06-26 10:05:11','2020-06-26 10:05:11',NULL,NULL,'Uri',NULL,2,113),(225,'2020-06-26 10:05:11','2020-06-26 10:05:11',NULL,NULL,'Utah',NULL,1,114),(226,'2020-06-26 10:05:11','2020-06-26 10:05:11',NULL,NULL,'Utah',NULL,2,114),(227,'2020-06-26 10:05:11','2020-06-26 10:05:11',NULL,NULL,'Minnesota',NULL,1,115),(228,'2020-06-26 10:05:11','2020-06-26 10:05:11',NULL,NULL,'Minnesota',NULL,2,115),(229,'2020-06-26 10:05:11','2020-06-26 10:05:11',NULL,NULL,'Missouri',NULL,1,116),(230,'2020-06-26 10:05:11','2020-06-26 10:05:11',NULL,NULL,'Missouri',NULL,2,116),(231,'2020-06-26 10:05:11','2020-06-26 10:05:11',NULL,NULL,'Northern Mariana Islands',NULL,1,117),(232,'2020-06-26 10:05:11','2020-06-26 10:05:11',NULL,NULL,'Northern Mariana Islands',NULL,2,117),(233,'2020-06-26 10:05:11','2020-06-26 10:05:11',NULL,NULL,'Barcelona',NULL,1,118),(234,'2020-06-26 10:05:11','2020-06-26 10:05:11',NULL,NULL,'Barcelona',NULL,2,118),(235,'2020-06-26 10:05:11','2020-06-26 10:05:11',NULL,NULL,'Mississippi',NULL,1,119),(236,'2020-06-26 10:05:11','2020-06-26 10:05:11',NULL,NULL,'Mississippi',NULL,2,119),(237,'2020-06-26 10:05:11','2020-06-26 10:05:11',NULL,NULL,'Montana',NULL,1,120),(238,'2020-06-26 10:05:11','2020-06-26 10:05:11',NULL,NULL,'Montana',NULL,2,120),(239,'2020-06-26 10:05:11','2020-06-26 10:05:11',NULL,NULL,'Badajoz',NULL,1,121),(240,'2020-06-26 10:05:11','2020-06-26 10:05:11',NULL,NULL,'Badajoz',NULL,2,121),(241,'2020-06-26 10:05:11','2020-06-26 10:05:11',NULL,NULL,'Mecklenburg-Vorpommern',NULL,1,122),(242,'2020-06-26 10:05:11','2020-06-26 10:05:11',NULL,NULL,'Mecklenburg-Vorpommern',NULL,2,122),(243,'2020-06-26 10:05:11','2020-06-26 10:05:11',NULL,NULL,'Virginia',NULL,1,123),(244,'2020-06-26 10:05:11','2020-06-26 10:05:11',NULL,NULL,'Virginie',NULL,2,123),(245,'2020-06-26 10:05:12','2020-06-26 10:05:12',NULL,NULL,'Voralberg',NULL,1,124),(246,'2020-06-26 10:05:12','2020-06-26 10:05:12',NULL,NULL,'Voralberg',NULL,2,124),(247,'2020-06-26 10:05:12','2020-06-26 10:05:12',NULL,NULL,'Cuenca',NULL,1,125),(248,'2020-06-26 10:05:12','2020-06-26 10:05:12',NULL,NULL,'Cuenca',NULL,2,125),(249,'2020-06-26 10:05:12','2020-06-26 10:05:12',NULL,NULL,'Wien',NULL,1,126),(250,'2020-06-26 10:05:12','2020-06-26 10:05:12',NULL,NULL,'Wien',NULL,2,126),(251,'2020-06-26 10:05:12','2020-06-26 10:05:12',NULL,NULL,'Waadt',NULL,1,127),(252,'2020-06-26 10:05:12','2020-06-26 10:05:12',NULL,NULL,'Waadt',NULL,2,127),(253,'2020-06-26 10:05:12','2020-06-26 10:05:12',NULL,NULL,'Sevilla',NULL,1,128),(254,'2020-06-26 10:05:12','2020-06-26 10:05:12',NULL,NULL,'Sevilla',NULL,2,128),(255,'2020-06-26 10:05:12','2020-06-26 10:05:12',NULL,NULL,'Virgin Islands',NULL,1,129),(256,'2020-06-26 10:05:12','2020-06-26 10:05:12',NULL,NULL,'Virgin Islands',NULL,2,129),(257,'2020-06-26 10:05:12','2020-06-26 10:05:12',NULL,NULL,'Zaragoza',NULL,1,130),(258,'2020-06-26 10:05:12','2020-06-26 10:05:12',NULL,NULL,'Zaragoza',NULL,2,130),(259,'2020-06-26 10:05:12','2020-06-26 10:05:12',NULL,NULL,'New Brunswick',NULL,1,131),(260,'2020-06-26 10:05:12','2020-06-26 10:05:12',NULL,NULL,'Nouveau Brunswick',NULL,2,131),(261,'2020-06-26 10:05:12','2020-06-26 10:05:12',NULL,NULL,'Sachsen-Anhalt',NULL,1,132),(262,'2020-06-26 10:05:12','2020-06-26 10:05:12',NULL,NULL,'Sachsen-Anhalt',NULL,2,132),(263,'2020-06-26 10:05:12','2020-06-26 10:05:12',NULL,NULL,'North Carolina',NULL,1,133),(264,'2020-06-26 10:05:12','2020-06-26 10:05:12',NULL,NULL,'Caroline du Nord',NULL,2,133),(265,'2020-06-26 10:05:12','2020-06-26 10:05:12',NULL,NULL,'North Dakota',NULL,1,134),(266,'2020-06-26 10:05:12','2020-06-26 10:05:12',NULL,NULL,'Dakota du Nord',NULL,2,134),(267,'2020-06-26 10:05:12','2020-06-26 10:05:12',NULL,NULL,'Nebraska',NULL,1,135),(268,'2020-06-26 10:05:12','2020-06-26 10:05:12',NULL,NULL,'Nebraska',NULL,2,135),(269,'2020-06-26 10:05:12','2020-06-26 10:05:12',NULL,NULL,'Newfoundland - Labrador',NULL,1,136),(270,'2020-06-26 10:05:12','2020-06-26 10:05:12',NULL,NULL,'Terre-Neuve - Labrador',NULL,2,136),(271,'2020-06-26 10:05:12','2020-06-26 10:05:12',NULL,NULL,'New Hampshire',NULL,1,137),(272,'2020-06-26 10:05:12','2020-06-26 10:05:12',NULL,NULL,'Nouveau Hampshire',NULL,2,137),(273,'2020-06-26 10:05:12','2020-06-26 10:05:12',NULL,NULL,'New Jersey',NULL,1,138),(274,'2020-06-26 10:05:12','2020-06-26 10:05:12',NULL,NULL,'New Jersey',NULL,2,138),(275,'2020-06-26 10:05:12','2020-06-26 10:05:12',NULL,NULL,'Wallis',NULL,1,139),(276,'2020-06-26 10:05:12','2020-06-26 10:05:12',NULL,NULL,'Wallis',NULL,2,139),(277,'2020-06-26 10:05:12','2020-06-26 10:05:12',NULL,NULL,'Vermont',NULL,1,140),(278,'2020-06-26 10:05:12','2020-06-26 10:05:12',NULL,NULL,'Vermont',NULL,2,140),(279,'2020-06-26 10:05:12','2020-06-26 10:05:12',NULL,NULL,'New Mexico',NULL,1,141),(280,'2020-06-26 10:05:12','2020-06-26 10:05:12',NULL,NULL,'Nouveau Mexique',NULL,2,141),(281,'2020-06-26 10:05:12','2020-06-26 10:05:12',NULL,NULL,'Niederosterreich',NULL,1,142),(282,'2020-06-26 10:05:12','2020-06-26 10:05:12',NULL,NULL,'Niederosterreich',NULL,2,142),(283,'2020-06-26 10:05:12','2020-06-26 10:05:12',NULL,NULL,'Sachsen',NULL,1,143),(284,'2020-06-26 10:05:12','2020-06-26 10:05:12',NULL,NULL,'Sachsen',NULL,2,143),(285,'2020-06-26 10:05:12','2020-06-26 10:05:12',NULL,NULL,'Nova Scotia',NULL,1,144),(286,'2020-06-26 10:05:12','2020-06-26 10:05:12',NULL,NULL,'Nouvelle Écosse',NULL,2,144),(287,'2020-06-26 10:05:12','2020-06-26 10:05:12',NULL,NULL,'Saarland',NULL,1,145),(288,'2020-06-26 10:05:12','2020-06-26 10:05:12',NULL,NULL,'Saarland',NULL,2,145),(289,'2020-06-26 10:05:12','2020-06-26 10:05:12',NULL,NULL,'Florida',NULL,1,146),(290,'2020-06-26 10:05:12','2020-06-26 10:05:12',NULL,NULL,'Floride',NULL,2,146),(291,'2020-06-26 10:05:12','2020-06-26 10:05:12',NULL,NULL,'Northwest Territories',NULL,1,147),(292,'2020-06-26 10:05:12','2020-06-26 10:05:12',NULL,NULL,'Territores du Nord-Ouest',NULL,2,147),(293,'2020-06-26 10:05:12','2020-06-26 10:05:12',NULL,NULL,'Federated States Of Micronesia',NULL,1,148),(294,'2020-06-26 10:05:12','2020-06-26 10:05:12',NULL,NULL,'Federated States Of Micronesia',NULL,2,148),(295,'2020-06-26 10:05:12','2020-06-26 10:05:12',NULL,NULL,'Nunavut',NULL,1,149),(296,'2020-06-26 10:05:12','2020-06-26 10:05:12',NULL,NULL,'Nunavut',NULL,2,149),(297,'2020-06-26 10:05:12','2020-06-26 10:05:12',NULL,NULL,'Nevada',NULL,1,150),(298,'2020-06-26 10:05:12','2020-06-26 10:05:12',NULL,NULL,'Nevada',NULL,2,150),(299,'2020-06-26 10:05:12','2020-06-26 10:05:12',NULL,NULL,'Nidwalden',NULL,1,151),(300,'2020-06-26 10:05:12','2020-06-26 10:05:12',NULL,NULL,'Nidwalden',NULL,2,151),(301,'2020-06-26 10:05:12','2020-06-26 10:05:12',NULL,NULL,'Washington',NULL,1,152),(302,'2020-06-26 10:05:12','2020-06-26 10:05:12',NULL,NULL,'Washington',NULL,2,152),(303,'2020-06-26 10:05:12','2020-06-26 10:05:12',NULL,NULL,'New York',NULL,1,153),(304,'2020-06-26 10:05:12','2020-06-26 10:05:12',NULL,NULL,'New York',NULL,2,153),(305,'2020-06-26 10:05:12','2020-06-26 10:05:12',NULL,NULL,'Granada',NULL,1,154),(306,'2020-06-26 10:05:12','2020-06-26 10:05:12',NULL,NULL,'Granada',NULL,2,154),(307,'2020-06-26 10:05:13','2020-06-26 10:05:13',NULL,NULL,'Soria',NULL,1,155),(308,'2020-06-26 10:05:13','2020-06-26 10:05:13',NULL,NULL,'Soria',NULL,2,155),(309,'2020-06-26 10:05:13','2020-06-26 10:05:13',NULL,NULL,'Freiburg',NULL,1,156),(310,'2020-06-26 10:05:13','2020-06-26 10:05:13',NULL,NULL,'Freiburg',NULL,2,156),(311,'2020-06-26 10:05:13','2020-06-26 10:05:13',NULL,NULL,'Rheinland-Pfalz',NULL,1,157),(312,'2020-06-26 10:05:13','2020-06-26 10:05:13',NULL,NULL,'Rheinland-Pfalz',NULL,2,157),(313,'2020-06-26 10:05:13','2020-06-26 10:05:13',NULL,NULL,'Ourense',NULL,1,158),(314,'2020-06-26 10:05:13','2020-06-26 10:05:13',NULL,NULL,'Ourense',NULL,2,158),(315,'2020-06-26 10:05:13','2020-06-26 10:05:13',NULL,NULL,'Wisconsin',NULL,1,159),(316,'2020-06-26 10:05:13','2020-06-26 10:05:13',NULL,NULL,'Wisconsin',NULL,2,159),(317,'2020-06-26 10:05:13','2020-06-26 10:05:13',NULL,NULL,'Ohio',NULL,1,160),(318,'2020-06-26 10:05:13','2020-06-26 10:05:13',NULL,NULL,'Ohio',NULL,2,160),(319,'2020-06-26 10:05:13','2020-06-26 10:05:13',NULL,NULL,'Georgia',NULL,1,161),(320,'2020-06-26 10:05:13','2020-06-26 10:05:13',NULL,NULL,'Georgie',NULL,2,161),(321,'2020-06-26 10:05:13','2020-06-26 10:05:13',NULL,NULL,'Murcia',NULL,1,162),(322,'2020-06-26 10:05:13','2020-06-26 10:05:13',NULL,NULL,'Murcia',NULL,2,162),(323,'2020-06-26 10:05:13','2020-06-26 10:05:13',NULL,NULL,'Oklahoma',NULL,1,163),(324,'2020-06-26 10:05:13','2020-06-26 10:05:13',NULL,NULL,'Oklahoma',NULL,2,163),(325,'2020-06-26 10:05:13','2020-06-26 10:05:13',NULL,NULL,'Genf',NULL,1,164),(326,'2020-06-26 10:05:13','2020-06-26 10:05:13',NULL,NULL,'Genf',NULL,2,164),(327,'2020-06-26 10:05:13','2020-06-26 10:05:13',NULL,NULL,'West Virginia',NULL,1,165),(328,'2020-06-26 10:05:13','2020-06-26 10:05:13',NULL,NULL,'West Virginia',NULL,2,165),(329,'2020-06-26 10:05:13','2020-06-26 10:05:13',NULL,NULL,'Ontario',NULL,1,166),(330,'2020-06-26 10:05:13','2020-06-26 10:05:13',NULL,NULL,'Ontario',NULL,2,166),(331,'2020-06-26 10:05:13','2020-06-26 10:05:13',NULL,NULL,'Oberosterreich',NULL,1,167),(332,'2020-06-26 10:05:13','2020-06-26 10:05:13',NULL,NULL,'Oberosterreich',NULL,2,167),(333,'2020-06-26 10:05:13','2020-06-26 10:05:13',NULL,NULL,'Wyoming',NULL,1,168),(334,'2020-06-26 10:05:13','2020-06-26 10:05:13',NULL,NULL,'Wyoming',NULL,2,168),(335,'2020-06-26 10:05:13','2020-06-26 10:05:13',NULL,NULL,'Burgenland',NULL,1,169),(336,'2020-06-26 10:05:13','2020-06-26 10:05:13',NULL,NULL,'Burgenland',NULL,2,169),(337,'2020-06-26 10:05:13','2020-06-26 10:05:13',NULL,NULL,'Avila',NULL,1,170),(338,'2020-06-26 10:05:13','2020-06-26 10:05:13',NULL,NULL,'Avila',NULL,2,170),(339,'2020-06-26 10:05:13','2020-06-26 10:05:13',NULL,NULL,'Oregon',NULL,1,171),(340,'2020-06-26 10:05:13','2020-06-26 10:05:13',NULL,NULL,'Oregon',NULL,2,171),(341,'2020-06-26 10:05:13','2020-06-26 10:05:13',NULL,NULL,'Salamanca',NULL,1,172),(342,'2020-06-26 10:05:13','2020-06-26 10:05:13',NULL,NULL,'Salamanca',NULL,2,172),(343,'2020-06-26 10:05:13','2020-06-26 10:05:13',NULL,NULL,'Glarus',NULL,1,173),(344,'2020-06-26 10:05:13','2020-06-26 10:05:13',NULL,NULL,'Glarus',NULL,2,173),(345,'2020-06-26 10:05:13','2020-06-26 10:05:13',NULL,NULL,'Baleares',NULL,1,174),(346,'2020-06-26 10:05:13','2020-06-26 10:05:13',NULL,NULL,'Baleares',NULL,2,174),(347,'2020-06-26 10:05:13','2020-06-26 10:05:13',NULL,NULL,'Obwalden',NULL,1,175),(348,'2020-06-26 10:05:13','2020-06-26 10:05:13',NULL,NULL,'Obwalden',NULL,2,175),(349,'2020-06-26 10:05:13','2020-06-26 10:05:13',NULL,NULL,'Graubnden',NULL,1,176),(350,'2020-06-26 10:05:13','2020-06-26 10:05:13',NULL,NULL,'Graubnden',NULL,2,176),(351,'2020-06-26 10:05:13','2020-06-26 10:05:13',NULL,NULL,'Guam',NULL,1,177),(352,'2020-06-26 10:05:13','2020-06-26 10:05:13',NULL,NULL,'Guam',NULL,2,177),(353,'2020-06-26 10:05:13','2020-06-26 10:05:13',NULL,NULL,'Pennsylvania',NULL,1,178),(354,'2020-06-26 10:05:13','2020-06-26 10:05:13',NULL,NULL,'Pennsylvanie',NULL,2,178),(355,'2020-06-26 10:05:13','2020-06-26 10:05:13',NULL,NULL,'Victoria',NULL,1,179),(356,'2020-06-26 10:05:13','2020-06-26 10:05:13',NULL,NULL,'Victoria',NULL,2,179),(357,'2020-06-26 10:05:13','2020-06-26 10:05:13',NULL,NULL,'Bremen',NULL,1,180),(358,'2020-06-26 10:05:13','2020-06-26 10:05:13',NULL,NULL,'Bremen',NULL,2,180),(359,'2020-06-26 10:05:13','2020-06-26 10:05:13',NULL,NULL,'Prince Edward Island',NULL,1,181),(360,'2020-06-26 10:05:13','2020-06-26 10:05:13',NULL,NULL,'Île-du-Prince-Édouard',NULL,2,181),(361,'2020-06-26 10:05:13','2020-06-26 10:05:13',NULL,NULL,'Brandenburg',NULL,1,182),(362,'2020-06-26 10:05:13','2020-06-26 10:05:13',NULL,NULL,'Brandenburg',NULL,2,182),(363,'2020-06-26 10:05:13','2020-06-26 10:05:13',NULL,NULL,'Hessen',NULL,1,183),(364,'2020-06-26 10:05:13','2020-06-26 10:05:13',NULL,NULL,'Hessen',NULL,2,183),(365,'2020-06-26 10:05:13','2020-06-26 10:05:13',NULL,NULL,'Almeria',NULL,1,184),(366,'2020-06-26 10:05:13','2020-06-26 10:05:13',NULL,NULL,'Almeria',NULL,2,184),(367,'2020-06-26 10:05:13','2020-06-26 10:05:13',NULL,NULL,'Baden-Wrttemberg',NULL,1,185),(368,'2020-06-26 10:05:13','2020-06-26 10:05:13',NULL,NULL,'Baden-Wrttemberg',NULL,2,185),(369,'2020-06-26 10:05:13','2020-06-26 10:05:13',NULL,NULL,'Bayern',NULL,1,186),(370,'2020-06-26 10:05:13','2020-06-26 10:05:13',NULL,NULL,'Bayern',NULL,2,186),(371,'2020-06-26 10:05:13','2020-06-26 10:05:13',NULL,NULL,'Navarra',NULL,1,187),(372,'2020-06-26 10:05:13','2020-06-26 10:05:13',NULL,NULL,'Navarra',NULL,2,187),(373,'2020-06-26 10:05:13','2020-06-26 10:05:13',NULL,NULL,'Valencia',NULL,1,188),(374,'2020-06-26 10:05:13','2020-06-26 10:05:13',NULL,NULL,'Valencia',NULL,2,188),(375,'2020-06-26 10:05:13','2020-06-26 10:05:13',NULL,NULL,'Schleswig-Holstein',NULL,1,189),(376,'2020-06-26 10:05:13','2020-06-26 10:05:13',NULL,NULL,'Schleswig-Holstein',NULL,2,189);
/*!40000 ALTER TABLE `zone_description` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-09 22:07:30
