-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: localhost    Database: intern
-- ------------------------------------------------------
-- Server version	5.6.17

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(32) DEFAULT NULL,
  `lastname` varchar(32) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(128) DEFAULT NULL,
  `access` varchar(11) NOT NULL,
  `password` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,NULL,NULL,'admin',NULL,'Admin','d033e22ae348aeb5660fc2140aec35850c4da997');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banner_collections`
--

DROP TABLE IF EXISTS `banner_collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banner_collections` (
  `banner_collection_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`banner_collection_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banner_collections`
--

LOCK TABLES `banner_collections` WRITE;
/*!40000 ALTER TABLE `banner_collections` DISABLE KEYS */;
INSERT INTO `banner_collections` VALUES (1,'Homepage Banners'),(2,'Homepage Boxes');
/*!40000 ALTER TABLE `banner_collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banners`
--

DROP TABLE IF EXISTS `banners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banners` (
  `banner_id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `banner_collection_id` int(9) unsigned NOT NULL,
  `name` varchar(128) NOT NULL,
  `enable_date` date NOT NULL,
  `disable_date` date NOT NULL,
  `image` varchar(64) NOT NULL,
  `link` varchar(128) DEFAULT NULL,
  `new_window` tinyint(1) NOT NULL DEFAULT '0',
  `sequence` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`banner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banners`
--

LOCK TABLES `banners` WRITE;
/*!40000 ALTER TABLE `banners` DISABLE KEYS */;
/*!40000 ALTER TABLE `banners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `canned_messages`
--

DROP TABLE IF EXISTS `canned_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `canned_messages` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `deletable` tinyint(1) NOT NULL DEFAULT '1',
  `type` enum('internal','order') NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `subject` varchar(100) DEFAULT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canned_messages`
--

LOCK TABLES `canned_messages` WRITE;
/*!40000 ALTER TABLE `canned_messages` DISABLE KEYS */;
INSERT INTO `canned_messages` VALUES (1,0,'internal','Gift Card Email Notification','You have received a gift card from {from} to {site_name}!','<p>Congrats on your new {site_name} gift card!<br><br>Card Code: {code}<br>Gift Amount: {amount}<br>From: {from}<br>Redeemable at: {site_name} {url}</p><p>Personal Message from Sender:<br>{personal_message}</p><p>Be sure to save this email in a safe place. Your gift card code is as good as cash.</p>'),(3,0,'order','Order Shipped Notification','Your order has shipped (order: {order_number})!','<p>Dear {customer_name},</p>\n<p>Thank you for your purchase at {site_name}!</p>\n<p>This message is to inform you that your order ({order_number}) has been shipped.</p>\n<p>Enjoy your purchase!</p>'),(6,0,'internal','Registration Confirmation','Thank you for registring at {site_name}!','<p>Dear {customer_name},</p>\n<p>Thanks for registering at {site_name}. Your participation is appreciated. After registering, you should have been logged in automatically. You may access your account by using the email address this notice was sent to, and the password you signed up with. If you forget your password, on the login page, click the \"forgot password\" link and you can get a new password generated and sent to you.<br /><br />Thanks,<br />{site_name}</p>'),(7,0,'internal','Order Submitted Confirmation','Thank you for your order with {site_name}!','<p>Dear {customer_name},</p>\n<p>Thank you for your order with {site_name}!</p>\n<p>{order_summary}</p>'),(8,0,'order','Digital Download Notification','Digital Download Notification','<p style=\"text-align: center;\"><strong>{download_link}</strong></p>');
/*!40000 ALTER TABLE `canned_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(9) unsigned NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL,
  `slug` varchar(64) NOT NULL,
  `route_id` int(9) NOT NULL,
  `description` text NOT NULL,
  `excerpt` text NOT NULL,
  `sequence` int(5) unsigned NOT NULL DEFAULT '0',
  `image` varchar(255) DEFAULT NULL,
  `seo_title` text NOT NULL,
  `meta` text NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_products`
--

DROP TABLE IF EXISTS `category_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category_products` (
  `product_id` int(9) unsigned NOT NULL,
  `category_id` int(9) unsigned NOT NULL,
  `sequence` int(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_products`
--

LOCK TABLES `category_products` WRITE;
/*!40000 ALTER TABLE `category_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `category_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countries` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `sequence` int(11) NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL,
  `iso_code_2` varchar(2) NOT NULL,
  `iso_code_3` varchar(3) NOT NULL,
  `address_format` text NOT NULL,
  `zip_required` int(1) NOT NULL DEFAULT '0',
  `status` int(1) NOT NULL DEFAULT '1',
  `tax` float(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=240 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,3,'Afghanistan','AF','AFG','',0,1,0.00),(2,4,'Albania','AL','ALB','',0,1,0.00),(3,5,'Algeria','DZ','DZA','',1,1,0.00),(4,6,'American Samoa','AS','ASM','',0,1,0.00),(5,7,'Andorra','AD','AND','',0,1,0.00),(6,8,'Angola','AO','AGO','',0,1,0.00),(7,9,'Anguilla','AI','AIA','',0,1,0.00),(8,10,'Antarctica','AQ','ATA','',1,1,0.00),(9,11,'Antigua and Barbuda','AG','ATG','',0,1,0.00),(10,12,'Argentina','AR','ARG','',1,1,0.00),(11,13,'Armenia','AM','ARM','',1,1,0.00),(12,14,'Aruba','AW','ABW','',0,1,0.00),(13,15,'Australia','AU','AUS','',1,1,0.00),(14,16,'Austria','AT','AUT','',1,1,0.00),(15,17,'Azerbaijan','AZ','AZE','',1,1,0.00),(16,18,'Bahamas','BS','BHS','',0,1,0.00),(17,19,'Bahrain','BH','BHR','',0,1,0.00),(18,20,'Bangladesh','BD','BGD','',1,1,0.00),(19,21,'Barbados','BB','BRB','',0,1,0.00),(20,22,'Belarus','BY','BLR','',1,1,0.00),(21,23,'Belgium','BE','BEL','',1,1,0.00),(22,24,'Belize','BZ','BLZ','',0,1,0.00),(23,25,'Benin','BJ','BEN','',0,1,0.00),(24,26,'Bermuda','BM','BMU','',0,1,0.00),(25,27,'Bhutan','BT','BTN','',0,1,0.00),(26,28,'Bolivia','BO','BOL','',0,1,0.00),(27,29,'Bosnia and Herzegowina','BA','BIH','',1,1,0.00),(28,30,'Botswana','BW','BWA','',0,1,0.00),(29,31,'Bouvet Island','BV','BVT','',1,1,0.00),(30,32,'Brazil','BR','BRA','',1,1,0.00),(31,33,'British Indian Ocean Territory','IO','IOT','',1,1,0.00),(32,34,'Brunei Darussalam','BN','BRN','',0,1,0.00),(33,35,'Bulgaria','BG','BGR','',1,1,0.00),(34,36,'Burkina Faso','BF','BFA','',0,1,0.00),(35,37,'Burundi','BI','BDI','',0,1,0.00),(36,38,'Cambodia','KH','KHM','',0,1,0.00),(37,39,'Cameroon','CM','CMR','',0,1,0.00),(38,1,'Canada','CA','CAN','',1,1,0.00),(39,40,'Cape Verde','CV','CPV','',0,1,0.00),(40,41,'Cayman Islands','KY','CYM','',0,1,0.00),(41,42,'Central African Republic','CF','CAF','',0,1,0.00),(42,43,'Chad','TD','TCD','',0,1,0.00),(43,44,'Chile','CL','CHL','',0,1,0.00),(44,45,'China','CN','CHN','',1,1,0.00),(45,46,'Christmas Island','CX','CXR','',1,1,0.00),(46,47,'Cocos (Keeling) Islands','CC','CCK','',1,1,0.00),(47,48,'Colombia','CO','COL','',0,1,0.00),(48,49,'Comoros','KM','COM','',1,1,0.00),(49,50,'Congo','CG','COG','',0,1,0.00),(50,51,'Cook Islands','CK','COK','',0,1,0.00),(51,52,'Costa Rica','CR','CRI','',0,1,0.00),(52,53,'Cote D\\Ivoire','CI','CIV','',1,1,0.00),(53,54,'Croatia','HR','HRV','',1,1,0.00),(54,55,'Cuba','CU','CUB','',1,1,0.00),(55,56,'Cyprus','CY','CYP','',1,1,0.00),(56,57,'Czech Republic','CZ','CZE','',1,1,0.00),(57,58,'Denmark','DK','DNK','',1,1,0.00),(58,59,'Djibouti','DJ','DJI','',0,1,0.00),(59,60,'Dominica','DM','DMA','',0,1,0.00),(60,61,'Dominican Republic','DO','DOM','',0,1,0.00),(61,62,'East Timor','TP','TMP','',1,1,0.00),(62,63,'Ecuador','EC','ECU','',0,1,0.00),(63,64,'Egypt','EG','EGY','',0,1,0.00),(64,65,'El Salvador','SV','SLV','',0,1,0.00),(65,66,'Equatorial Guinea','GQ','GNQ','',0,1,0.00),(66,67,'Eritrea','ER','ERI','',0,1,0.00),(67,68,'Estonia','EE','EST','',1,1,0.00),(68,69,'Ethiopia','ET','ETH','',0,1,0.00),(69,70,'Falkland Islands (Malvinas)','FK','FLK','',1,1,0.00),(70,71,'Faroe Islands','FO','FRO','',1,1,0.00),(71,72,'Fiji','FJ','FJI','',0,1,0.00),(72,73,'Finland','FI','FIN','',1,1,0.00),(73,74,'France','FR','FRA','',1,1,0.00),(74,75,'France','Me','FX','FXX',0,1,1.00),(75,76,'French Guiana','GF','GUF','',0,1,0.00),(76,77,'French Polynesia','PF','PYF','',0,1,0.00),(77,78,'French Southern Territories','TF','ATF','',1,1,0.00),(78,79,'Gabon','GA','GAB','',0,1,0.00),(79,80,'Gambia','GM','GMB','',0,1,0.00),(80,81,'Georgia','GE','GEO','',1,1,0.00),(81,82,'Germany','DE','DEU','',1,1,0.00),(82,83,'Ghana','GH','GHA','',0,1,0.00),(83,84,'Gibraltar','GI','GIB','',0,1,0.00),(84,85,'Greece','GR','GRC','',1,1,0.00),(85,86,'Greenland','GL','GRL','',1,1,0.00),(86,87,'Grenada','GD','GRD','',0,1,0.00),(87,88,'Guadeloupe','GP','GLP','',0,1,0.00),(88,89,'Guam','GU','GUM','',0,1,0.00),(89,90,'Guatemala','GT','GTM','',0,1,0.00),(90,91,'Guinea','GN','GIN','',0,1,0.00),(91,92,'Guinea-bissau','GW','GNB','',0,1,0.00),(92,93,'Guyana','GY','GUY','',0,1,0.00),(93,94,'Haiti','HT','HTI','',0,1,0.00),(94,95,'Heard and Mc Donald Islands','HM','HMD','',1,1,0.00),(95,96,'Honduras','HN','HND','',0,1,0.00),(96,97,'Hong Kong','HK','HKG','',0,1,0.00),(97,98,'Hungary','HU','HUN','',1,1,0.00),(98,99,'Iceland','IS','ISL','',1,1,0.00),(99,100,'India','IN','IND','',1,1,0.00),(100,101,'Indonesia','ID','IDN','',1,1,0.00),(101,102,'Iran (Islamic Republic of)','IR','IRN','',1,1,0.00),(102,103,'Iraq','IQ','IRQ','',0,1,0.00),(103,104,'Ireland','IE','IRL','',0,1,0.00),(104,105,'Israel','IL','ISR','',1,1,0.00),(105,106,'Italy','IT','ITA','',1,1,0.00),(106,107,'Jamaica','JM','JAM','',0,1,0.00),(107,108,'Japan','JP','JPN','',1,1,0.00),(108,109,'Jordan','JO','JOR','',0,1,0.00),(109,110,'Kazakhstan','KZ','KAZ','',1,1,0.00),(110,111,'Kenya','KE','KEN','',0,1,0.00),(111,112,'Kiribati','KI','KIR','',0,1,0.00),(112,113,'North Korea','KP','PRK','',1,1,0.00),(113,114,'Korea','Re','KR','KOR',0,1,1.00),(114,115,'Kuwait','KW','KWT','',0,1,0.00),(115,116,'Kyrgyzstan','KG','KGZ','',1,1,0.00),(116,117,'Lao People\\s Democratic Republic','LA','LAO','',0,1,0.00),(117,118,'Latvia','LV','LVA','',1,1,0.00),(118,119,'Lebanon','LB','LBN','',0,1,0.00),(119,120,'Lesotho','LS','LSO','',0,1,0.00),(120,121,'Liberia','LR','LBR','',0,1,0.00),(121,122,'Libyan Arab Jamahiriya','LY','LBY','',1,1,0.00),(122,123,'Liechtenstein','LI','LIE','',1,1,0.00),(123,124,'Lithuania','LT','LTU','',1,1,0.00),(124,125,'Luxembourg','LU','LUX','',1,1,0.00),(125,126,'Macau','MO','MAC','',0,1,0.00),(126,127,'Macedonia','MK','MKD','',1,1,0.00),(127,128,'Madagascar','MG','MDG','',0,1,0.00),(128,129,'Malawi','MW','MWI','',1,1,0.00),(129,130,'Malaysia','MY','MYS','',1,1,0.00),(130,131,'Maldives','MV','MDV','',0,1,0.00),(131,132,'Mali','ML','MLI','',0,1,0.00),(132,133,'Malta','MT','MLT','',0,1,0.00),(133,134,'Marshall Islands','MH','MHL','',1,1,0.00),(134,135,'Martinique','MQ','MTQ','',1,1,0.00),(135,136,'Mauritania','MR','MRT','',0,1,0.00),(136,137,'Mauritius','MU','MUS','',0,1,0.00),(137,138,'Mayotte','YT','MYT','',1,1,0.00),(138,139,'Mexico','MX','MEX','',1,1,0.00),(139,140,'Micronesia','Fe','FM','FSM',0,1,1.00),(140,141,'Moldova','Re','MD','MDA',0,1,1.00),(141,142,'Monaco','MC','MCO','',1,1,0.00),(142,143,'Mongolia','MN','MNG','',1,1,0.00),(143,144,'Montserrat','MS','MSR','',0,1,0.00),(144,145,'Morocco','MA','MAR','',0,1,0.00),(145,146,'Mozambique','MZ','MOZ','',0,1,0.00),(146,147,'Myanmar','MM','MMR','',1,1,0.00),(147,148,'Namibia','NA','NAM','',0,1,0.00),(148,149,'Nauru','NR','NRU','',1,1,0.00),(149,150,'Nepal','NP','NPL','',0,1,0.00),(150,151,'Netherlands','NL','NLD','',1,1,0.00),(151,152,'Netherlands Antilles','AN','ANT','',0,1,0.00),(152,153,'New Caledonia','NC','NCL','',0,1,0.00),(153,154,'New Zealand','NZ','NZL','',1,1,0.00),(154,155,'Nicaragua','NI','NIC','',0,1,0.00),(155,156,'Niger','NE','NER','',0,1,0.00),(156,157,'Nigeria','NG','NGA','',0,1,0.00),(157,158,'Niue','NU','NIU','',1,1,0.00),(158,159,'Norfolk Island','NF','NFK','',0,1,0.00),(159,160,'Northern Mariana Islands','MP','MNP','',0,1,0.00),(160,161,'Norway','NO','NOR','',1,1,0.00),(161,162,'Oman','OM','OMN','',0,1,0.00),(162,163,'Pakistan','PK','PAK','',1,1,0.00),(163,164,'Palau','PW','PLW','',1,1,0.00),(164,165,'Panama','PA','PAN','',0,1,0.00),(165,166,'Papua New Guinea','PG','PNG','',0,1,0.00),(166,167,'Paraguay','PY','PRY','',0,1,0.00),(167,168,'Peru','PE','PER','',0,1,0.00),(168,169,'Philippines','PH','PHL','',1,1,0.00),(169,170,'Pitcairn','PN','PCN','',1,1,0.00),(170,171,'Poland','PL','POL','',1,1,0.00),(171,172,'Portugal','PT','PRT','',1,1,0.00),(172,173,'Puerto Rico','PR','PRI','',1,1,0.00),(173,174,'Qatar','QA','QAT','',0,1,0.00),(174,175,'Reunion','RE','REU','',1,1,0.00),(175,176,'Romania','RO','ROM','',1,1,0.00),(176,177,'Russian Federation','RU','RUS','',1,1,0.00),(177,178,'Rwanda','RW','RWA','',0,1,0.00),(178,179,'Saint Kitts and Nevis','KN','KNA','',1,1,0.00),(179,180,'Saint Lucia','LC','LCA','',1,1,0.00),(180,181,'Saint Vincent and the Grenadines','VC','VCT','',1,1,0.00),(181,182,'Samoa','WS','WSM','',1,1,0.00),(182,183,'San Marino','SM','SMR','',1,1,0.00),(183,184,'Sao Tome and Principe','ST','STP','',1,1,0.00),(184,185,'Saudi Arabia','SA','SAU','',1,1,0.00),(185,186,'Senegal','SN','SEN','',0,1,0.00),(186,187,'Seychelles','SC','SYC','',0,1,0.00),(187,188,'Sierra Leone','SL','SLE','',0,1,0.00),(188,189,'Singapore','SG','SGP','',1,1,0.00),(189,190,'Slovak Republic','SK','SVK','{firstname} {lastname}\\r\n{company}\\r\n{address_1}\n{address_2}\\r\n{city} {zip}\\r\n{zone}\\r\n{country}',1,1,0.00),(190,191,'Slovenia','SI','SVN','',1,1,0.00),(191,192,'Solomon Islands','SB','SLB','',0,1,0.00),(192,193,'Somalia','SO','SOM','',1,1,0.00),(193,194,'South Africa','ZA','ZAF','',1,1,0.00),(194,195,'South Georgia &amp; South Sandwich Islands','GS','SGS','',1,1,0.00),(195,196,'Spain','ES','ESP','',1,1,0.00),(196,197,'Sri Lanka','LK','LKA','',1,1,0.00),(197,198,'St. Helena','SH','SHN','',1,1,0.00),(198,199,'St. Pierre and Miquelon','PM','SPM','',1,1,0.00),(199,200,'Sudan','SD','SDN','',1,1,0.00),(200,201,'Suriname','SR','SUR','',0,1,0.00),(201,202,'Svalbard and Jan Mayen Islands','SJ','SJM','',1,1,0.00),(202,203,'Swaziland','SZ','SWZ','',0,1,0.00),(203,204,'Sweden','SE','SWE','',1,1,0.00),(204,205,'Switzerland','CH','CHE','',1,1,0.00),(205,206,'Syrian Arab Republic','SY','SYR','',0,1,0.00),(206,207,'Taiwan','TW','TWN','',1,1,0.00),(207,208,'Tajikistan','TJ','TJK','',1,1,0.00),(208,209,'Tanzania','Un','TZ','TZA',0,0,1.00),(209,210,'Thailand','TH','THA','',1,1,0.00),(210,211,'Togo','TG','TGO','',0,1,0.00),(211,212,'Tokelau','TK','TKL','',1,1,0.00),(212,213,'Tonga','TO','TON','',0,1,0.00),(213,214,'Trinidad and Tobago','TT','TTO','',0,1,0.00),(214,215,'Tunisia','TN','TUN','',0,1,0.00),(215,216,'Turkey','TR','TUR','',1,1,0.00),(216,217,'Turkmenistan','TM','TKM','',1,1,0.00),(217,218,'Turks and Caicos Islands','TC','TCA','',0,1,0.00),(218,219,'Tuvalu','TV','TUV','',0,1,0.00),(219,220,'Uganda','UG','UGA','',0,1,0.00),(220,221,'Ukraine','UA','UKR','',1,1,0.00),(221,222,'United Arab Emirates','AE','ARE','',0,1,0.00),(222,2,'United Kingdom','GB','GBR','',1,1,0.00),(223,0,'United States','US','USA','{firstname} {lastname}\n{company}\n{address_1}\n{address_2}\n{city}, {zone} {zip}\n{country}',1,1,0.00),(224,223,'United States Minor Outlying Islands','UM','UMI','',1,1,0.00),(225,224,'Uruguay','UY','URY','',1,1,0.00),(226,225,'Uzbekistan','UZ','UZB','',1,1,0.00),(227,226,'Vanuatu','VU','VUT','',0,1,0.00),(228,227,'Vatican City State (Holy See)','VA','VAT','',1,1,0.00),(229,228,'Venezuela','VE','VEN','',0,1,0.00),(230,229,'Viet Nam','VN','VNM','',1,1,0.00),(231,230,'Virgin Islands (British)','VG','VGB','',0,1,0.00),(232,231,'Virgin Islands (U.S.)','VI','VIR','',1,1,0.00),(233,232,'Wallis and Futuna Islands','WF','WLF','',0,1,0.00),(234,233,'Western Sahara','EH','ESH','',1,1,0.00),(235,234,'Yemen','YE','YEM','',0,1,0.00),(236,235,'Yugoslavia','YU','YUG','',1,1,0.00),(237,236,'Democratic Republic of Congo','CD','COD','',1,1,0.00),(238,237,'Zambia','ZM','ZMB','',0,1,0.00),(239,238,'Zimbabwe','ZW','ZWE','',0,1,0.00);
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country_zone_areas`
--

DROP TABLE IF EXISTS `country_zone_areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country_zone_areas` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `zone_id` int(9) unsigned NOT NULL,
  `code` varchar(15) NOT NULL,
  `tax` float(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country_zone_areas`
--

LOCK TABLES `country_zone_areas` WRITE;
/*!40000 ALTER TABLE `country_zone_areas` DISABLE KEYS */;
/*!40000 ALTER TABLE `country_zone_areas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country_zones`
--

DROP TABLE IF EXISTS `country_zones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country_zones` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `country_id` int(9) unsigned NOT NULL,
  `code` varchar(32) DEFAULT NULL,
  `name` varchar(128) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `tax` float(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3957 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country_zones`
--

LOCK TABLES `country_zones` WRITE;
/*!40000 ALTER TABLE `country_zones` DISABLE KEYS */;
INSERT INTO `country_zones` VALUES (1,1,'BDS','Badakhshan',1,0.00),(2,1,'BDG','Badghis',1,0.00),(3,1,'BGL','Baghlan',1,0.00),(4,1,'BAL','Balkh',1,0.00),(5,1,'BAM','Bamian',1,0.00),(6,1,'FRA','Farah',1,0.00),(7,1,'FYB','Faryab',1,0.00),(8,1,'GHA','Ghazni',1,0.00),(9,1,'GHO','Ghowr',1,0.00),(10,1,'HEL','Helmand',1,0.00),(11,1,'HER','Herat',1,0.00),(12,1,'JOW','Jowzjan',1,0.00),(13,1,'KAB','Kabul',1,0.00),(14,1,'KAN','Kandahar',1,0.00),(15,1,'KAP','Kapisa',1,0.00),(16,1,'KHO','Khost',1,0.00),(17,1,'KNR','Konar',1,0.00),(18,1,'KDZ','Kondoz',1,0.00),(19,1,'LAG','Laghman',1,0.00),(20,1,'LOW','Lowgar',1,0.00),(21,1,'NAN','Nangrahar',1,0.00),(22,1,'NIM','Nimruz',1,0.00),(23,1,'NUR','Nurestan',1,0.00),(24,1,'ORU','Oruzgan',1,0.00),(25,1,'PIA','Paktia',1,0.00),(26,1,'PKA','Paktika',1,0.00),(27,1,'PAR','Parwan',1,0.00),(28,1,'SAM','Samangan',1,0.00),(29,1,'SAR','Sar-e Pol',1,0.00),(30,1,'TAK','Takhar',1,0.00),(31,1,'WAR','Wardak',1,0.00),(32,1,'ZAB','Zabol',1,0.00),(33,2,'BR','Berat',1,0.00),(34,2,'BU','Bulqize',1,0.00),(35,2,'DL','Delvine',1,0.00),(36,2,'DV','Devoll',1,0.00),(37,2,'DI','Diber',1,0.00),(38,2,'DR','Durres',1,0.00),(39,2,'EL','Elbasan',1,0.00),(40,2,'ER','Kolonje',1,0.00),(41,2,'FR','Fier',1,0.00),(42,2,'GJ','Gjirokaster',1,0.00),(43,2,'GR','Gramsh',1,0.00),(44,2,'HA','Has',1,0.00),(45,2,'KA','Kavaje',1,0.00),(46,2,'KB','Kurbin',1,0.00),(47,2,'KC','Kucove',1,0.00),(48,2,'KO','Korce',1,0.00),(49,2,'KR','Kruje',1,0.00),(50,2,'KU','Kukes',1,0.00),(51,2,'LB','Librazhd',1,0.00),(52,2,'LE','Lezhe',1,0.00),(53,2,'LU','Lushnje',1,0.00),(54,2,'MM','Malesi e Madhe',1,0.00),(55,2,'MK','Mallakaster',1,0.00),(56,2,'MT','Mat',1,0.00),(57,2,'MR','Mirdite',1,0.00),(58,2,'PQ','Peqin',1,0.00),(59,2,'PR','Permet',1,0.00),(60,2,'PG','Pogradec',1,0.00),(61,2,'PU','Puke',1,0.00),(62,2,'SH','Shkoder',1,0.00),(63,2,'SK','Skrapar',1,0.00),(64,2,'SR','Sarande',1,0.00),(65,2,'TE','Tepelene',1,0.00),(66,2,'TP','Tropoje',1,0.00),(67,2,'TR','Tirane',1,0.00),(68,2,'VL','Vlore',1,0.00),(69,3,'ADR','Adrar',1,0.00),(70,3,'ADE','Ain Defla',1,0.00),(71,3,'ATE','Ain Temouchent',1,0.00),(72,3,'ALG','Alger',1,0.00),(73,3,'ANN','Annaba',1,0.00),(74,3,'BAT','Batna',1,0.00),(75,3,'BEC','Bechar',1,0.00),(76,3,'BEJ','Bejaia',1,0.00),(77,3,'BIS','Biskra',1,0.00),(78,3,'BLI','Blida',1,0.00),(79,3,'BBA','Bordj Bou Arreridj',1,0.00),(80,3,'BOA','Bouira',1,0.00),(81,3,'BMD','Boumerdes',1,0.00),(82,3,'CHL','Chlef',1,0.00),(83,3,'CON','Constantine',1,0.00),(84,3,'DJE','Djelfa',1,0.00),(85,3,'EBA','El Bayadh',1,0.00),(86,3,'EOU','El Oued',1,0.00),(87,3,'ETA','El Tarf',1,0.00),(88,3,'GHA','Ghardaia',1,0.00),(89,3,'GUE','Guelma',1,0.00),(90,3,'ILL','Illizi',1,0.00),(91,3,'JIJ','Jijel',1,0.00),(92,3,'KHE','Khenchela',1,0.00),(93,3,'LAG','Laghouat',1,0.00),(94,3,'MUA','Muaskar',1,0.00),(95,3,'MED','Medea',1,0.00),(96,3,'MIL','Mila',1,0.00),(97,3,'MOS','Mostaganem',1,0.00),(98,3,'MSI','M\\Sila',1,0.00),(99,3,'NAA','Naama',1,0.00),(100,3,'ORA','Oran',1,0.00),(101,3,'OUA','Ouargla',1,0.00),(102,3,'OEB','Oum el-Bouaghi',1,0.00),(103,3,'REL','Relizane',1,0.00),(104,3,'SAI','Saida',1,0.00),(105,3,'SET','Setif',1,0.00),(106,3,'SBA','Sidi Bel Abbes',1,0.00),(107,3,'SKI','Skikda',1,0.00),(108,3,'SAH','Souk Ahras',1,0.00),(109,3,'TAM','Tamanghasset',1,0.00),(110,3,'TEB','Tebessa',1,0.00),(111,3,'TIA','Tiaret',1,0.00),(112,3,'TIN','Tindouf',1,0.00),(113,3,'TIP','Tipaza',1,0.00),(114,3,'TIS','Tissemsilt',1,0.00),(115,3,'TOU','Tizi Ouzou',1,0.00),(116,3,'TLE','Tlemcen',1,0.00),(117,4,'E','Eastern',1,0.00),(118,4,'M','Manu\\a',1,0.00),(119,4,'R','Rose Island',1,0.00),(120,4,'S','Swains Island',1,0.00),(121,4,'W','Western',1,0.00),(122,5,'ALV','Andorra la Vella',1,0.00),(123,5,'CAN','Canillo',1,0.00),(124,5,'ENC','Encamp',1,0.00),(125,5,'ESE','Escaldes-Engordany',1,0.00),(126,5,'LMA','La Massana',1,0.00),(127,5,'ORD','Ordino',1,0.00),(128,5,'SJL','Sant Julia de Loria',1,0.00),(129,6,'BGO','Bengo',1,0.00),(130,6,'BGU','Benguela',1,0.00),(131,6,'BIE','Bie',1,0.00),(132,6,'CAB','Cabinda',1,0.00),(133,6,'CCU','Cuando-Cubango',1,0.00),(134,6,'CNO','Cuanza Norte',1,0.00),(135,6,'CUS','Cuanza Sul',1,0.00),(136,6,'CNN','Cunene',1,0.00),(137,6,'HUA','Huambo',1,0.00),(138,6,'HUI','Huila',1,0.00),(139,6,'LUA','Luanda',1,0.00),(140,6,'LNO','Lunda Norte',1,0.00),(141,6,'LSU','Lunda Sul',1,0.00),(142,6,'MAL','Malange',1,0.00),(143,6,'MOX','Moxico',1,0.00),(144,6,'NAM','Namibe',1,0.00),(145,6,'UIG','Uige',1,0.00),(146,6,'ZAI','Zaire',1,0.00),(147,9,'ASG','Saint George',1,0.00),(148,9,'ASJ','Saint John',1,0.00),(149,9,'ASM','Saint Mary',1,0.00),(150,9,'ASL','Saint Paul',1,0.00),(151,9,'ASR','Saint Peter',1,0.00),(152,9,'ASH','Saint Philip',1,0.00),(153,9,'BAR','Barbuda',1,0.00),(154,9,'RED','Redonda',1,0.00),(155,10,'AN','Antartida e Islas del Atlantico',1,0.00),(156,10,'BA','Buenos Aires',1,0.00),(157,10,'CA','Catamarca',1,0.00),(158,10,'CH','Chaco',1,0.00),(159,10,'CU','Chubut',1,0.00),(160,10,'CO','Cordoba',1,0.00),(161,10,'CR','Corrientes',1,0.00),(162,10,'DF','Distrito Federal',1,0.00),(163,10,'ER','Entre Rios',1,0.00),(164,10,'FO','Formosa',1,0.00),(165,10,'JU','Jujuy',1,0.00),(166,10,'LP','La Pampa',1,0.00),(167,10,'LR','La Rioja',1,0.00),(168,10,'ME','Mendoza',1,0.00),(169,10,'MI','Misiones',1,0.00),(170,10,'NE','Neuquen',1,0.00),(171,10,'RN','Rio Negro',1,0.00),(172,10,'SA','Salta',1,0.00),(173,10,'SJ','San Juan',1,0.00),(174,10,'SL','San Luis',1,0.00),(175,10,'SC','Santa Cruz',1,0.00),(176,10,'SF','Santa Fe',1,0.00),(177,10,'SD','Santiago del Estero',1,0.00),(178,10,'TF','Tierra del Fuego',1,0.00),(179,10,'TU','Tucuman',1,0.00),(180,11,'AGT','Aragatsotn',1,0.00),(181,11,'ARR','Ararat',1,0.00),(182,11,'ARM','Armavir',1,0.00),(183,11,'GEG','Geghark\\unik\\',1,0.00),(184,11,'KOT','Kotayk\\',1,0.00),(185,11,'LOR','Lorri',1,0.00),(186,11,'SHI','Shirak',1,0.00),(187,11,'SYU','Syunik\\',1,0.00),(188,11,'TAV','Tavush',1,0.00),(189,11,'VAY','Vayots\\ Dzor',1,0.00),(190,11,'YER','Yerevan',1,0.00),(191,13,'ACT','Australian Capital Territory',1,0.00),(192,13,'NSW','New South Wales',1,0.00),(193,13,'NT','Northern Territory',1,0.00),(194,13,'QLD','Queensland',1,0.00),(195,13,'SA','South Australia',1,0.00),(196,13,'TAS','Tasmania',1,0.00),(197,13,'VIC','Victoria',1,0.00),(198,13,'WA','Western Australia',1,0.00),(199,14,'BUR','Burgenland',1,0.00),(200,14,'KAR','K√§rnten',1,0.00),(201,14,'NOS','Nieder&ouml;sterreich',1,0.00),(202,14,'OOS','Ober&ouml;sterreich',1,0.00),(203,14,'SAL','Salzburg',1,0.00),(204,14,'STE','Steiermark',1,0.00),(205,14,'TIR','Tirol',1,0.00),(206,14,'VOR','Vorarlberg',1,0.00),(207,14,'WIE','Wien',1,0.00),(208,15,'AB','Ali Bayramli',1,0.00),(209,15,'ABS','Abseron',1,0.00),(210,15,'AGC','AgcabAdi',1,0.00),(211,15,'AGM','Agdam',1,0.00),(212,15,'AGS','Agdas',1,0.00),(213,15,'AGA','Agstafa',1,0.00),(214,15,'AGU','Agsu',1,0.00),(215,15,'AST','Astara',1,0.00),(216,15,'BA','Baki',1,0.00),(217,15,'BAB','BabAk',1,0.00),(218,15,'BAL','BalakAn',1,0.00),(219,15,'BAR','BArdA',1,0.00),(220,15,'BEY','Beylaqan',1,0.00),(221,15,'BIL','Bilasuvar',1,0.00),(222,15,'CAB','Cabrayil',1,0.00),(223,15,'CAL','Calilabab',1,0.00),(224,15,'CUL','Culfa',1,0.00),(225,15,'DAS','Daskasan',1,0.00),(226,15,'DAV','Davaci',1,0.00),(227,15,'FUZ','Fuzuli',1,0.00),(228,15,'GA','Ganca',1,0.00),(229,15,'GAD','Gadabay',1,0.00),(230,15,'GOR','Goranboy',1,0.00),(231,15,'GOY','Goycay',1,0.00),(232,15,'HAC','Haciqabul',1,0.00),(233,15,'IMI','Imisli',1,0.00),(234,15,'ISM','Ismayilli',1,0.00),(235,15,'KAL','Kalbacar',1,0.00),(236,15,'KUR','Kurdamir',1,0.00),(237,15,'LA','Lankaran',1,0.00),(238,15,'LAC','Lacin',1,0.00),(239,15,'LAN','Lankaran',1,0.00),(240,15,'LER','Lerik',1,0.00),(241,15,'MAS','Masalli',1,0.00),(242,15,'MI','Mingacevir',1,0.00),(243,15,'NA','Naftalan',1,0.00),(244,15,'NEF','Neftcala',1,0.00),(245,15,'OGU','Oguz',1,0.00),(246,15,'ORD','Ordubad',1,0.00),(247,15,'QAB','Qabala',1,0.00),(248,15,'QAX','Qax',1,0.00),(249,15,'QAZ','Qazax',1,0.00),(250,15,'QOB','Qobustan',1,0.00),(251,15,'QBA','Quba',1,0.00),(252,15,'QBI','Qubadli',1,0.00),(253,15,'QUS','Qusar',1,0.00),(254,15,'SA','Saki',1,0.00),(255,15,'SAT','Saatli',1,0.00),(256,15,'SAB','Sabirabad',1,0.00),(257,15,'SAD','Sadarak',1,0.00),(258,15,'SAH','Sahbuz',1,0.00),(259,15,'SAK','Saki',1,0.00),(260,15,'SAL','Salyan',1,0.00),(261,15,'SM','Sumqayit',1,0.00),(262,15,'SMI','Samaxi',1,0.00),(263,15,'SKR','Samkir',1,0.00),(264,15,'SMX','Samux',1,0.00),(265,15,'SAR','Sarur',1,0.00),(266,15,'SIY','Siyazan',1,0.00),(267,15,'SS','Susa',1,0.00),(268,15,'SUS','Susa',1,0.00),(269,15,'TAR','Tartar',1,0.00),(270,15,'TOV','Tovuz',1,0.00),(271,15,'UCA','Ucar',1,0.00),(272,15,'XA','Xankandi',1,0.00),(273,15,'XAC','Xacmaz',1,0.00),(274,15,'XAN','Xanlar',1,0.00),(275,15,'XIZ','Xizi',1,0.00),(276,15,'XCI','Xocali',1,0.00),(277,15,'XVD','Xocavand',1,0.00),(278,15,'YAR','Yardimli',1,0.00),(279,15,'YEV','Yevlax',1,0.00),(280,15,'ZAN','Zangilan',1,0.00),(281,15,'ZAQ','Zaqatala',1,0.00),(282,15,'ZAR','Zardab',1,0.00),(283,15,'NX','Naxcivan',1,0.00),(284,16,'ACK','Acklins',1,0.00),(285,16,'BER','Berry Islands',1,0.00),(286,16,'BIM','Bimini',1,0.00),(287,16,'BLK','Black Point',1,0.00),(288,16,'CAT','Cat Island',1,0.00),(289,16,'CAB','Central Abaco',1,0.00),(290,16,'CAN','Central Andros',1,0.00),(291,16,'CEL','Central Eleuthera',1,0.00),(292,16,'FRE','City of Freeport',1,0.00),(293,16,'CRO','Crooked Island',1,0.00),(294,16,'EGB','East Grand Bahama',1,0.00),(295,16,'EXU','Exuma',1,0.00),(296,16,'GRD','Grand Cay',1,0.00),(297,16,'HAR','Harbour Island',1,0.00),(298,16,'HOP','Hope Town',1,0.00),(299,16,'INA','Inagua',1,0.00),(300,16,'LNG','Long Island',1,0.00),(301,16,'MAN','Mangrove Cay',1,0.00),(302,16,'MAY','Mayaguana',1,0.00),(303,16,'MOO','Moore\\s Island',1,0.00),(304,16,'NAB','North Abaco',1,0.00),(305,16,'NAN','North Andros',1,0.00),(306,16,'NEL','North Eleuthera',1,0.00),(307,16,'RAG','Ragged Island',1,0.00),(308,16,'RUM','Rum Cay',1,0.00),(309,16,'SAL','San Salvador',1,0.00),(310,16,'SAB','South Abaco',1,0.00),(311,16,'SAN','South Andros',1,0.00),(312,16,'SEL','South Eleuthera',1,0.00),(313,16,'SWE','Spanish Wells',1,0.00),(314,16,'WGB','West Grand Bahama',1,0.00),(315,17,'CAP','Capital',1,0.00),(316,17,'CEN','Central',1,0.00),(317,17,'MUH','Muharraq',1,0.00),(318,17,'NOR','Northern',1,0.00),(319,17,'SOU','Southern',1,0.00),(320,18,'BAR','Barisal',1,0.00),(321,18,'CHI','Chittagong',1,0.00),(322,18,'DHA','Dhaka',1,0.00),(323,18,'KHU','Khulna',1,0.00),(324,18,'RAJ','Rajshahi',1,0.00),(325,18,'SYL','Sylhet',1,0.00),(326,19,'CC','Christ Church',1,0.00),(327,19,'AND','Saint Andrew',1,0.00),(328,19,'GEO','Saint George',1,0.00),(329,19,'JAM','Saint James',1,0.00),(330,19,'JOH','Saint John',1,0.00),(331,19,'JOS','Saint Joseph',1,0.00),(332,19,'LUC','Saint Lucy',1,0.00),(333,19,'MIC','Saint Michael',1,0.00),(334,19,'PET','Saint Peter',1,0.00),(335,19,'PHI','Saint Philip',1,0.00),(336,19,'THO','Saint Thomas',1,0.00),(337,20,'BR','Brestskaya (Brest)',1,0.00),(338,20,'HO','Homyel\\skaya (Homyel\\)',1,0.00),(339,20,'HM','Horad Minsk',1,0.00),(340,20,'HR','Hrodzyenskaya (Hrodna)',1,0.00),(341,20,'MA','Mahilyowskaya (Mahilyow)',1,0.00),(342,20,'MI','Minskaya',1,0.00),(343,20,'VI','Vitsyebskaya (Vitsyebsk)',1,0.00),(344,21,'VAN','Antwerpen',1,0.00),(345,21,'WBR','Brabant Wallon',1,0.00),(346,21,'WHT','Hainaut',1,0.00),(347,21,'WLG','Liege',1,0.00),(348,21,'VLI','Limburg',1,0.00),(349,21,'WLX','Luxembourg',1,0.00),(350,21,'WNA','Namur',1,0.00),(351,21,'VOV','Oost-Vlaanderen',1,0.00),(352,21,'VBR','Vlaams Brabant',1,0.00),(353,21,'VWV','West-Vlaanderen',1,0.00),(354,22,'BZ','Belize',1,0.00),(355,22,'CY','Cayo',1,0.00),(356,22,'CR','Corozal',1,0.00),(357,22,'OW','Orange Walk',1,0.00),(358,22,'SC','Stann Creek',1,0.00),(359,22,'TO','Toledo',1,0.00),(360,23,'AL','Alibori',1,0.00),(361,23,'AK','Atakora',1,0.00),(362,23,'AQ','Atlantique',1,0.00),(363,23,'BO','Borgou',1,0.00),(364,23,'CO','Collines',1,0.00),(365,23,'DO','Donga',1,0.00),(366,23,'KO','Kouffo',1,0.00),(367,23,'LI','Littoral',1,0.00),(368,23,'MO','Mono',1,0.00),(369,23,'OU','Oueme',1,0.00),(370,23,'PL','Plateau',1,0.00),(371,23,'ZO','Zou',1,0.00),(372,24,'DS','Devonshire',1,0.00),(373,24,'HC','Hamilton City',1,0.00),(374,24,'HA','Hamilton',1,0.00),(375,24,'PG','Paget',1,0.00),(376,24,'PB','Pembroke',1,0.00),(377,24,'GC','Saint George City',1,0.00),(378,24,'SG','Saint George\\s',1,0.00),(379,24,'SA','Sandys',1,0.00),(380,24,'SM','Smith\\s',1,0.00),(381,24,'SH','Southampton',1,0.00),(382,24,'WA','Warwick',1,0.00),(383,25,'BUM','Bumthang',1,0.00),(384,25,'CHU','Chukha',1,0.00),(385,25,'DAG','Dagana',1,0.00),(386,25,'GAS','Gasa',1,0.00),(387,25,'HAA','Haa',1,0.00),(388,25,'LHU','Lhuntse',1,0.00),(389,25,'MON','Mongar',1,0.00),(390,25,'PAR','Paro',1,0.00),(391,25,'PEM','Pemagatshel',1,0.00),(392,25,'PUN','Punakha',1,0.00),(393,25,'SJO','Samdrup Jongkhar',1,0.00),(394,25,'SAT','Samtse',1,0.00),(395,25,'SAR','Sarpang',1,0.00),(396,25,'THI','Thimphu',1,0.00),(397,25,'TRG','Trashigang',1,0.00),(398,25,'TRY','Trashiyangste',1,0.00),(399,25,'TRO','Trongsa',1,0.00),(400,25,'TSI','Tsirang',1,0.00),(401,25,'WPH','Wangdue Phodrang',1,0.00),(402,25,'ZHE','Zhemgang',1,0.00),(403,26,'BEN','Beni',1,0.00),(404,26,'CHU','Chuquisaca',1,0.00),(405,26,'COC','Cochabamba',1,0.00),(406,26,'LPZ','La Paz',1,0.00),(407,26,'ORU','Oruro',1,0.00),(408,26,'PAN','Pando',1,0.00),(409,26,'POT','Potosi',1,0.00),(410,26,'SCZ','Santa Cruz',1,0.00),(411,26,'TAR','Tarija',1,0.00),(412,27,'BRO','Brcko district',1,0.00),(413,27,'FUS','Unsko-Sanski Kanton',1,0.00),(414,27,'FPO','Posavski Kanton',1,0.00),(415,27,'FTU','Tuzlanski Kanton',1,0.00),(416,27,'FZE','Zenicko-Dobojski Kanton',1,0.00),(417,27,'FBP','Bosanskopodrinjski Kanton',1,0.00),(418,27,'FSB','Srednjebosanski Kanton',1,0.00),(419,27,'FHN','Hercegovacko-neretvanski Kanton',1,0.00),(420,27,'FZH','Zapadnohercegovacka Zupanija',1,0.00),(421,27,'FSA','Kanton Sarajevo',1,0.00),(422,27,'FZA','Zapadnobosanska',1,0.00),(423,27,'SBL','Banja Luka',1,0.00),(424,27,'SDO','Doboj',1,0.00),(425,27,'SBI','Bijeljina',1,0.00),(426,27,'SVL','Vlasenica',1,0.00),(427,27,'SSR','Sarajevo-Romanija or Sokolac',1,0.00),(428,27,'SFO','Foca',1,0.00),(429,27,'STR','Trebinje',1,0.00),(430,28,'CE','Central',1,0.00),(431,28,'GH','Ghanzi',1,0.00),(432,28,'KD','Kgalagadi',1,0.00),(433,28,'KT','Kgatleng',1,0.00),(434,28,'KW','Kweneng',1,0.00),(435,28,'NG','Ngamiland',1,0.00),(436,28,'NE','North East',1,0.00),(437,28,'NW','North West',1,0.00),(438,28,'SE','South East',1,0.00),(439,28,'SO','Southern',1,0.00),(440,30,'AC','Acre',1,0.00),(441,30,'AL','Alagoas',1,0.00),(442,30,'AP','Amapa',1,0.00),(443,30,'AM','Amazonas',1,0.00),(444,30,'BA','Bahia',1,0.00),(445,30,'CE','Ceara',1,0.00),(446,30,'DF','Distrito Federal',1,0.00),(447,30,'ES','Espirito Santo',1,0.00),(448,30,'GO','Goias',1,0.00),(449,30,'MA','Maranhao',1,0.00),(450,30,'MT','Mato Grosso',1,0.00),(451,30,'MS','Mato Grosso do Sul',1,0.00),(452,30,'MG','Minas Gerais',1,0.00),(453,30,'PA','Para',1,0.00),(454,30,'PB','Paraiba',1,0.00),(455,30,'PR','Parana',1,0.00),(456,30,'PE','Pernambuco',1,0.00),(457,30,'PI','Piaui',1,0.00),(458,30,'RJ','Rio de Janeiro',1,0.00),(459,30,'RN','Rio Grande do Norte',1,0.00),(460,30,'RS','Rio Grande do Sul',1,0.00),(461,30,'RO','Rondonia',1,0.00),(462,30,'RR','Roraima',1,0.00),(463,30,'SC','Santa Catarina',1,0.00),(464,30,'SP','Sao Paulo',1,0.00),(465,30,'SE','Sergipe',1,0.00),(466,30,'TO','Tocantins',1,0.00),(467,31,'PB','Peros Banhos',1,0.00),(468,31,'SI','Salomon Islands',1,0.00),(469,31,'NI','Nelsons Island',1,0.00),(470,31,'TB','Three Brothers',1,0.00),(471,31,'EA','Eagle Islands',1,0.00),(472,31,'DI','Danger Island',1,0.00),(473,31,'EG','Egmont Islands',1,0.00),(474,31,'DG','Diego Garcia',1,0.00),(475,32,'BEL','Belait',1,0.00),(476,32,'BRM','Brunei and Muara',1,0.00),(477,32,'TEM','Temburong',1,0.00),(478,32,'TUT','Tutong',1,0.00),(479,33,'','Blagoevgrad',1,0.00),(480,33,'','Burgas',1,0.00),(481,33,'','Dobrich',1,0.00),(482,33,'','Gabrovo',1,0.00),(483,33,'','Haskovo',1,0.00),(484,33,'','Kardjali',1,0.00),(485,33,'','Kyustendil',1,0.00),(486,33,'','Lovech',1,0.00),(487,33,'','Montana',1,0.00),(488,33,'','Pazardjik',1,0.00),(489,33,'','Pernik',1,0.00),(490,33,'','Pleven',1,0.00),(491,33,'','Plovdiv',1,0.00),(492,33,'','Razgrad',1,0.00),(493,33,'','Shumen',1,0.00),(494,33,'','Silistra',1,0.00),(495,33,'','Sliven',1,0.00),(496,33,'','Smolyan',1,0.00),(497,33,'','Sofia',1,0.00),(498,33,'','Sofia - town',1,0.00),(499,33,'','Stara Zagora',1,0.00),(500,33,'','Targovishte',1,0.00),(501,33,'','Varna',1,0.00),(502,33,'','Veliko Tarnovo',1,0.00),(503,33,'','Vidin',1,0.00),(504,33,'','Vratza',1,0.00),(505,33,'','Yambol',1,0.00),(506,34,'BAL','Bale',1,0.00),(507,34,'BAM','Bam',1,0.00),(508,34,'BAN','Banwa',1,0.00),(509,34,'BAZ','Bazega',1,0.00),(510,34,'BOR','Bougouriba',1,0.00),(511,34,'BLG','Boulgou',1,0.00),(512,34,'BOK','Boulkiemde',1,0.00),(513,34,'COM','Comoe',1,0.00),(514,34,'GAN','Ganzourgou',1,0.00),(515,34,'GNA','Gnagna',1,0.00),(516,34,'GOU','Gourma',1,0.00),(517,34,'HOU','Houet',1,0.00),(518,34,'IOA','Ioba',1,0.00),(519,34,'KAD','Kadiogo',1,0.00),(520,34,'KEN','Kenedougou',1,0.00),(521,34,'KOD','Komondjari',1,0.00),(522,34,'KOP','Kompienga',1,0.00),(523,34,'KOS','Kossi',1,0.00),(524,34,'KOL','Koulpelogo',1,0.00),(525,34,'KOT','Kouritenga',1,0.00),(526,34,'KOW','Kourweogo',1,0.00),(527,34,'LER','Leraba',1,0.00),(528,34,'LOR','Loroum',1,0.00),(529,34,'MOU','Mouhoun',1,0.00),(530,34,'NAH','Nahouri',1,0.00),(531,34,'NAM','Namentenga',1,0.00),(532,34,'NAY','Nayala',1,0.00),(533,34,'NOU','Noumbiel',1,0.00),(534,34,'OUB','Oubritenga',1,0.00),(535,34,'OUD','Oudalan',1,0.00),(536,34,'PAS','Passore',1,0.00),(537,34,'PON','Poni',1,0.00),(538,34,'SAG','Sanguie',1,0.00),(539,34,'SAM','Sanmatenga',1,0.00),(540,34,'SEN','Seno',1,0.00),(541,34,'SIS','Sissili',1,0.00),(542,34,'SOM','Soum',1,0.00),(543,34,'SOR','Sourou',1,0.00),(544,34,'TAP','Tapoa',1,0.00),(545,34,'TUY','Tuy',1,0.00),(546,34,'YAG','Yagha',1,0.00),(547,34,'YAT','Yatenga',1,0.00),(548,34,'ZIR','Ziro',1,0.00),(549,34,'ZOD','Zondoma',1,0.00),(550,34,'ZOW','Zoundweogo',1,0.00),(551,35,'BB','Bubanza',1,0.00),(552,35,'BJ','Bujumbura',1,0.00),(553,35,'BR','Bururi',1,0.00),(554,35,'CA','Cankuzo',1,0.00),(555,35,'CI','Cibitoke',1,0.00),(556,35,'GI','Gitega',1,0.00),(557,35,'KR','Karuzi',1,0.00),(558,35,'KY','Kayanza',1,0.00),(559,35,'KI','Kirundo',1,0.00),(560,35,'MA','Makamba',1,0.00),(561,35,'MU','Muramvya',1,0.00),(562,35,'MY','Muyinga',1,0.00),(563,35,'MW','Mwaro',1,0.00),(564,35,'NG','Ngozi',1,0.00),(565,35,'RT','Rutana',1,0.00),(566,35,'RY','Ruyigi',1,0.00),(567,36,'PP','Phnom Penh',1,0.00),(568,36,'PS','Preah Seihanu (Kompong Som or Sihanoukville)',1,0.00),(569,36,'PA','Pailin',1,0.00),(570,36,'KB','Keb',1,0.00),(571,36,'BM','Banteay Meanchey',1,0.00),(572,36,'BA','Battambang',1,0.00),(573,36,'KM','Kampong Cham',1,0.00),(574,36,'KN','Kampong Chhnang',1,0.00),(575,36,'KU','Kampong Speu',1,0.00),(576,36,'KO','Kampong Som',1,0.00),(577,36,'KT','Kampong Thom',1,0.00),(578,36,'KP','Kampot',1,0.00),(579,36,'KL','Kandal',1,0.00),(580,36,'KK','Kaoh Kong',1,0.00),(581,36,'KR','Kratie',1,0.00),(582,36,'MK','Mondul Kiri',1,0.00),(583,36,'OM','Oddar Meancheay',1,0.00),(584,36,'PU','Pursat',1,0.00),(585,36,'PR','Preah Vihear',1,0.00),(586,36,'PG','Prey Veng',1,0.00),(587,36,'RK','Ratanak Kiri',1,0.00),(588,36,'SI','Siemreap',1,0.00),(589,36,'ST','Stung Treng',1,0.00),(590,36,'SR','Svay Rieng',1,0.00),(591,36,'TK','Takeo',1,0.00),(592,37,'ADA','Adamawa (Adamaoua)',1,0.00),(593,37,'CEN','Centre',1,0.00),(594,37,'EST','East (Est)',1,0.00),(595,37,'EXN','Extreme North (Extreme-Nord)',1,0.00),(596,37,'LIT','Littoral',1,0.00),(597,37,'NOR','North (Nord)',1,0.00),(598,37,'NOT','Northwest (Nord-Ouest)',1,0.00),(599,37,'OUE','West (Ouest)',1,0.00),(600,37,'SUD','South (Sud)',1,0.00),(601,37,'SOU','Southwest (Sud-Ouest).',1,0.00),(602,38,'AB','Alberta',1,0.00),(603,38,'BC','British Columbia',1,0.00),(604,38,'MB','Manitoba',1,0.00),(605,38,'NB','New Brunswick',1,0.00),(606,38,'NL','Newfoundland and Labrador',1,0.00),(607,38,'NT','Northwest Territories',1,0.00),(608,38,'NS','Nova Scotia',1,0.00),(609,38,'NU','Nunavut',1,0.00),(610,38,'ON','Ontario',1,0.00),(611,38,'PE','Prince Edward Island',1,0.00),(612,38,'QC','Qu&eacute;bec',1,0.00),(613,38,'SK','Saskatchewan',1,0.00),(614,38,'YT','Yukon Territory',1,0.00),(615,39,'BV','Boa Vista',1,0.00),(616,39,'BR','Brava',1,0.00),(617,39,'CS','Calheta de Sao Miguel',1,0.00),(618,39,'MA','Maio',1,0.00),(619,39,'MO','Mosteiros',1,0.00),(620,39,'PA','Paul',1,0.00),(621,39,'PN','Porto Novo',1,0.00),(622,39,'PR','Praia',1,0.00),(623,39,'RG','Ribeira Grande',1,0.00),(624,39,'SL','Sal',1,0.00),(625,39,'CA','Santa Catarina',1,0.00),(626,39,'CR','Santa Cruz',1,0.00),(627,39,'SD','Sao Domingos',1,0.00),(628,39,'SF','Sao Filipe',1,0.00),(629,39,'SN','Sao Nicolau',1,0.00),(630,39,'SV','Sao Vicente',1,0.00),(631,39,'TA','Tarrafal',1,0.00),(632,40,'CR','Creek',1,0.00),(633,40,'EA','Eastern',1,0.00),(634,40,'ML','Midland',1,0.00),(635,40,'ST','South Town',1,0.00),(636,40,'SP','Spot Bay',1,0.00),(637,40,'SK','Stake Bay',1,0.00),(638,40,'WD','West End',1,0.00),(639,40,'WN','Western',1,0.00),(640,41,'BBA','Bamingui-Bangoran',1,0.00),(641,41,'BKO','Basse-Kotto',1,0.00),(642,41,'HKO','Haute-Kotto',1,0.00),(643,41,'HMB','Haut-Mbomou',1,0.00),(644,41,'KEM','Kemo',1,0.00),(645,41,'LOB','Lobaye',1,0.00),(646,41,'MKD','Mambere-Kade√î',1,0.00),(647,41,'MBO','Mbomou',1,0.00),(648,41,'NMM','Nana-Mambere',1,0.00),(649,41,'OMP','Ombella-M\\Poko',1,0.00),(650,41,'OUK','Ouaka',1,0.00),(651,41,'OUH','Ouham',1,0.00),(652,41,'OPE','Ouham-Pende',1,0.00),(653,41,'VAK','Vakaga',1,0.00),(654,41,'NGR','Nana-Grebizi',1,0.00),(655,41,'SMB','Sangha-Mbaere',1,0.00),(656,41,'BAN','Bangui',1,0.00),(657,42,'BA','Batha',1,0.00),(658,42,'BI','Biltine',1,0.00),(659,42,'BE','Borkou-Ennedi-Tibesti',1,0.00),(660,42,'CB','Chari-Baguirmi',1,0.00),(661,42,'GU','Guera',1,0.00),(662,42,'KA','Kanem',1,0.00),(663,42,'LA','Lac',1,0.00),(664,42,'LC','Logone Occidental',1,0.00),(665,42,'LR','Logone Oriental',1,0.00),(666,42,'MK','Mayo-Kebbi',1,0.00),(667,42,'MC','Moyen-Chari',1,0.00),(668,42,'OU','Ouaddai',1,0.00),(669,42,'SA','Salamat',1,0.00),(670,42,'TA','Tandjile',1,0.00),(671,43,'AI','Aisen del General Carlos Ibanez',1,0.00),(672,43,'AN','Antofagasta',1,0.00),(673,43,'AR','Araucania',1,0.00),(674,43,'AT','Atacama',1,0.00),(675,43,'BI','Bio-Bio',1,0.00),(676,43,'CO','Coquimbo',1,0.00),(677,43,'LI','Libertador General Bernardo O\\Hi',1,0.00),(678,43,'LL','Los Lagos',1,0.00),(679,43,'MA','Magallanes y de la Antartica Chi',1,0.00),(680,43,'ML','Maule',1,0.00),(681,43,'RM','Region Metropolitana',1,0.00),(682,43,'TA','Tarapaca',1,0.00),(683,43,'VS','Valparaiso',1,0.00),(684,44,'AN','Anhui',1,0.00),(685,44,'BE','Beijing',1,0.00),(686,44,'CH','Chongqing',1,0.00),(687,44,'FU','Fujian',1,0.00),(688,44,'GA','Gansu',1,0.00),(689,44,'GU','Guangdong',1,0.00),(690,44,'GX','Guangxi',1,0.00),(691,44,'GZ','Guizhou',1,0.00),(692,44,'HA','Hainan',1,0.00),(693,44,'HB','Hebei',1,0.00),(694,44,'HL','Heilongjiang',1,0.00),(695,44,'HE','Henan',1,0.00),(696,44,'HK','Hong Kong',1,0.00),(697,44,'HU','Hubei',1,0.00),(698,44,'HN','Hunan',1,0.00),(699,44,'IM','Inner Mongolia',1,0.00),(700,44,'JI','Jiangsu',1,0.00),(701,44,'JX','Jiangxi',1,0.00),(702,44,'JL','Jilin',1,0.00),(703,44,'LI','Liaoning',1,0.00),(704,44,'MA','Macau',1,0.00),(705,44,'NI','Ningxia',1,0.00),(706,44,'SH','Shaanxi',1,0.00),(707,44,'SA','Shandong',1,0.00),(708,44,'SG','Shanghai',1,0.00),(709,44,'SX','Shanxi',1,0.00),(710,44,'SI','Sichuan',1,0.00),(711,44,'TI','Tianjin',1,0.00),(712,44,'XI','Xinjiang',1,0.00),(713,44,'YU','Yunnan',1,0.00),(714,44,'ZH','Zhejiang',1,0.00),(715,46,'D','Direction Island',1,0.00),(716,46,'H','Home Island',1,0.00),(717,46,'O','Horsburgh Island',1,0.00),(718,46,'S','South Island',1,0.00),(719,46,'W','West Island',1,0.00),(720,47,'AMZ','Amazonas',1,0.00),(721,47,'ANT','Antioquia',1,0.00),(722,47,'ARA','Arauca',1,0.00),(723,47,'ATL','Atlantico',1,0.00),(724,47,'BDC','Bogota D.C.',1,0.00),(725,47,'BOL','Bolivar',1,0.00),(726,47,'BOY','Boyaca',1,0.00),(727,47,'CAL','Caldas',1,0.00),(728,47,'CAQ','Caqueta',1,0.00),(729,47,'CAS','Casanare',1,0.00),(730,47,'CAU','Cauca',1,0.00),(731,47,'CES','Cesar',1,0.00),(732,47,'CHO','Choco',1,0.00),(733,47,'COR','Cordoba',1,0.00),(734,47,'CAM','Cundinamarca',1,0.00),(735,47,'GNA','Guainia',1,0.00),(736,47,'GJR','Guajira',1,0.00),(737,47,'GVR','Guaviare',1,0.00),(738,47,'HUI','Huila',1,0.00),(739,47,'MAG','Magdalena',1,0.00),(740,47,'MET','Meta',1,0.00),(741,47,'NAR','Narino',1,0.00),(742,47,'NDS','Norte de Santander',1,0.00),(743,47,'PUT','Putumayo',1,0.00),(744,47,'QUI','Quindio',1,0.00),(745,47,'RIS','Risaralda',1,0.00),(746,47,'SAP','San Andres y Providencia',1,0.00),(747,47,'SAN','Santander',1,0.00),(748,47,'SUC','Sucre',1,0.00),(749,47,'TOL','Tolima',1,0.00),(750,47,'VDC','Valle del Cauca',1,0.00),(751,47,'VAU','Vaupes',1,0.00),(752,47,'VIC','Vichada',1,0.00),(753,48,'G','Grande Comore',1,0.00),(754,48,'A','Anjouan',1,0.00),(755,48,'M','Moheli',1,0.00),(756,49,'BO','Bouenza',1,0.00),(757,49,'BR','Brazzaville',1,0.00),(758,49,'CU','Cuvette',1,0.00),(759,49,'CO','Cuvette-Ouest',1,0.00),(760,49,'KO','Kouilou',1,0.00),(761,49,'LE','Lekoumou',1,0.00),(762,49,'LI','Likouala',1,0.00),(763,49,'NI','Niari',1,0.00),(764,49,'PL','Plateaux',1,0.00),(765,49,'PO','Pool',1,0.00),(766,49,'SA','Sangha',1,0.00),(767,50,'PU','Pukapuka',1,0.00),(768,50,'RK','Rakahanga',1,0.00),(769,50,'MK','Manihiki',1,0.00),(770,50,'PE','Penrhyn',1,0.00),(771,50,'NI','Nassau Island',1,0.00),(772,50,'SU','Surwarrow',1,0.00),(773,50,'PA','Palmerston',1,0.00),(774,50,'AI','Aitutaki',1,0.00),(775,50,'MA','Manuae',1,0.00),(776,50,'TA','Takutea',1,0.00),(777,50,'MT','Mitiaro',1,0.00),(778,50,'AT','Atiu',1,0.00),(779,50,'MU','Mauke',1,0.00),(780,50,'RR','Rarotonga',1,0.00),(781,50,'MG','Mangaia',1,0.00),(782,51,'AL','Alajuela',1,0.00),(783,51,'CA','Cartago',1,0.00),(784,51,'GU','Guanacaste',1,0.00),(785,51,'HE','Heredia',1,0.00),(786,51,'LI','Limon',1,0.00),(787,51,'PU','Puntarenas',1,0.00),(788,51,'SJ','San Jose',1,0.00),(789,52,'ABE','Abengourou',1,0.00),(790,52,'ABI','Abidjan',1,0.00),(791,52,'ABO','Aboisso',1,0.00),(792,52,'ADI','Adiake',1,0.00),(793,52,'ADZ','Adzope',1,0.00),(794,52,'AGB','Agboville',1,0.00),(795,52,'AGN','Agnibilekrou',1,0.00),(796,52,'ALE','Alepe',1,0.00),(797,52,'BOC','Bocanda',1,0.00),(798,52,'BAN','Bangolo',1,0.00),(799,52,'BEO','Beoumi',1,0.00),(800,52,'BIA','Biankouma',1,0.00),(801,52,'BDK','Bondoukou',1,0.00),(802,52,'BGN','Bongouanou',1,0.00),(803,52,'BFL','Bouafle',1,0.00),(804,52,'BKE','Bouake',1,0.00),(805,52,'BNA','Bouna',1,0.00),(806,52,'BDL','Boundiali',1,0.00),(807,52,'DKL','Dabakala',1,0.00),(808,52,'DBU','Dabou',1,0.00),(809,52,'DAL','Daloa',1,0.00),(810,52,'DAN','Danane',1,0.00),(811,52,'DAO','Daoukro',1,0.00),(812,52,'DIM','Dimbokro',1,0.00),(813,52,'DIV','Divo',1,0.00),(814,52,'DUE','Duekoue',1,0.00),(815,52,'FER','Ferkessedougou',1,0.00),(816,52,'GAG','Gagnoa',1,0.00),(817,52,'GBA','Grand-Bassam',1,0.00),(818,52,'GLA','Grand-Lahou',1,0.00),(819,52,'GUI','Guiglo',1,0.00),(820,52,'ISS','Issia',1,0.00),(821,52,'JAC','Jacqueville',1,0.00),(822,52,'KAT','Katiola',1,0.00),(823,52,'KOR','Korhogo',1,0.00),(824,52,'LAK','Lakota',1,0.00),(825,52,'MAN','Man',1,0.00),(826,52,'MKN','Mankono',1,0.00),(827,52,'MBA','Mbahiakro',1,0.00),(828,52,'ODI','Odienne',1,0.00),(829,52,'OUM','Oume',1,0.00),(830,52,'SAK','Sakassou',1,0.00),(831,52,'SPE','San-Pedro',1,0.00),(832,52,'SAS','Sassandra',1,0.00),(833,52,'SEG','Seguela',1,0.00),(834,52,'SIN','Sinfra',1,0.00),(835,52,'SOU','Soubre',1,0.00),(836,52,'TAB','Tabou',1,0.00),(837,52,'TAN','Tanda',1,0.00),(838,52,'TIE','Tiebissou',1,0.00),(839,52,'TIN','Tingrela',1,0.00),(840,52,'TIA','Tiassale',1,0.00),(841,52,'TBA','Touba',1,0.00),(842,52,'TLP','Toulepleu',1,0.00),(843,52,'TMD','Toumodi',1,0.00),(844,52,'VAV','Vavoua',1,0.00),(845,52,'YAM','Yamoussoukro',1,0.00),(846,52,'ZUE','Zuenoula',1,0.00),(847,53,'BB','Bjelovar-Bilogora',1,0.00),(848,53,'CZ','City of Zagreb',1,0.00),(849,53,'DN','Dubrovnik-Neretva',1,0.00),(850,53,'IS','Istra',1,0.00),(851,53,'KA','Karlovac',1,0.00),(852,53,'KK','Koprivnica-Krizevci',1,0.00),(853,53,'KZ','Krapina-Zagorje',1,0.00),(854,53,'LS','Lika-Senj',1,0.00),(855,53,'ME','Medimurje',1,0.00),(856,53,'OB','Osijek-Baranja',1,0.00),(857,53,'PS','Pozega-Slavonia',1,0.00),(858,53,'PG','Primorje-Gorski Kotar',1,0.00),(859,53,'SI','Sibenik',1,0.00),(860,53,'SM','Sisak-Moslavina',1,0.00),(861,53,'SB','Slavonski Brod-Posavina',1,0.00),(862,53,'SD','Split-Dalmatia',1,0.00),(863,53,'VA','Varazdin',1,0.00),(864,53,'VP','Virovitica-Podravina',1,0.00),(865,53,'VS','Vukovar-Srijem',1,0.00),(866,53,'ZK','Zadar-Knin',1,0.00),(867,53,'ZA','Zagreb',1,0.00),(868,54,'CA','Camaguey',1,0.00),(869,54,'CD','Ciego de Avila',1,0.00),(870,54,'CI','Cienfuegos',1,0.00),(871,54,'CH','Ciudad de La Habana',1,0.00),(872,54,'GR','Granma',1,0.00),(873,54,'GU','Guantanamo',1,0.00),(874,54,'HO','Holguin',1,0.00),(875,54,'IJ','Isla de la Juventud',1,0.00),(876,54,'LH','La Habana',1,0.00),(877,54,'LT','Las Tunas',1,0.00),(878,54,'MA','Matanzas',1,0.00),(879,54,'PR','Pinar del Rio',1,0.00),(880,54,'SS','Sancti Spiritus',1,0.00),(881,54,'SC','Santiago de Cuba',1,0.00),(882,54,'VC','Villa Clara',1,0.00),(883,55,'F','Famagusta',1,0.00),(884,55,'K','Kyrenia',1,0.00),(885,55,'A','Larnaca',1,0.00),(886,55,'I','Limassol',1,0.00),(887,55,'N','Nicosia',1,0.00),(888,55,'P','Paphos',1,0.00),(889,56,'U','Ustecky',1,0.00),(890,56,'C','Jihocesky',1,0.00),(891,56,'B','Jihomoravsky',1,0.00),(892,56,'K','Karlovarsky',1,0.00),(893,56,'H','Kralovehradecky',1,0.00),(894,56,'L','Liberecky',1,0.00),(895,56,'T','Moravskoslezsky',1,0.00),(896,56,'M','Olomoucky',1,0.00),(897,56,'E','Pardubicky',1,0.00),(898,56,'P','Plzensky',1,0.00),(899,56,'A','Praha',1,0.00),(900,56,'S','Stredocesky',1,0.00),(901,56,'J','Vysocina',1,0.00),(902,56,'Z','Zlinsky',1,0.00),(903,57,'AR','Arhus',1,0.00),(904,57,'BH','Bornholm',1,0.00),(905,57,'CO','Copenhagen',1,0.00),(906,57,'FO','Faroe Islands',1,0.00),(907,57,'FR','Frederiksborg',1,0.00),(908,57,'FY','Fyn',1,0.00),(909,57,'KO','Kobenhavn',1,0.00),(910,57,'NO','Nordjylland',1,0.00),(911,57,'RI','Ribe',1,0.00),(912,57,'RK','Ringkobing',1,0.00),(913,57,'RO','Roskilde',1,0.00),(914,57,'SO','Sonderjylland',1,0.00),(915,57,'ST','Storstrom',1,0.00),(916,57,'VK','Vejle',1,0.00),(917,57,'VJ','Vestj&aelig;lland',1,0.00),(918,57,'VB','Viborg',1,0.00),(919,58,'S','\\Ali Sabih',1,0.00),(920,58,'K','Dikhil',1,0.00),(921,58,'J','Djibouti',1,0.00),(922,58,'O','Obock',1,0.00),(923,58,'T','Tadjoura',1,0.00),(924,59,'AND','Saint Andrew Parish',1,0.00),(925,59,'DAV','Saint David Parish',1,0.00),(926,59,'GEO','Saint George Parish',1,0.00),(927,59,'JOH','Saint John Parish',1,0.00),(928,59,'JOS','Saint Joseph Parish',1,0.00),(929,59,'LUK','Saint Luke Parish',1,0.00),(930,59,'MAR','Saint Mark Parish',1,0.00),(931,59,'PAT','Saint Patrick Parish',1,0.00),(932,59,'PAU','Saint Paul Parish',1,0.00),(933,59,'PET','Saint Peter Parish',1,0.00),(934,60,'DN','Distrito Nacional',1,0.00),(935,60,'AZ','Azua',1,0.00),(936,60,'BC','Baoruco',1,0.00),(937,60,'BH','Barahona',1,0.00),(938,60,'DJ','Dajabon',1,0.00),(939,60,'DU','Duarte',1,0.00),(940,60,'EL','Elias Pina',1,0.00),(941,60,'SY','El Seybo',1,0.00),(942,60,'ET','Espaillat',1,0.00),(943,60,'HM','Hato Mayor',1,0.00),(944,60,'IN','Independencia',1,0.00),(945,60,'AL','La Altagracia',1,0.00),(946,60,'RO','La Romana',1,0.00),(947,60,'VE','La Vega',1,0.00),(948,60,'MT','Maria Trinidad Sanchez',1,0.00),(949,60,'MN','Monsenor Nouel',1,0.00),(950,60,'MC','Monte Cristi',1,0.00),(951,60,'MP','Monte Plata',1,0.00),(952,60,'PD','Pedernales',1,0.00),(953,60,'PR','Peravia (Bani)',1,0.00),(954,60,'PP','Puerto Plata',1,0.00),(955,60,'SL','Salcedo',1,0.00),(956,60,'SM','Samana',1,0.00),(957,60,'SH','Sanchez Ramirez',1,0.00),(958,60,'SC','San Cristobal',1,0.00),(959,60,'JO','San Jose de Ocoa',1,0.00),(960,60,'SJ','San Juan',1,0.00),(961,60,'PM','San Pedro de Macoris',1,0.00),(962,60,'SA','Santiago',1,0.00),(963,60,'ST','Santiago Rodriguez',1,0.00),(964,60,'SD','Santo Domingo',1,0.00),(965,60,'VA','Valverde',1,0.00),(966,61,'AL','Aileu',1,0.00),(967,61,'AN','Ainaro',1,0.00),(968,61,'BA','Baucau',1,0.00),(969,61,'BO','Bobonaro',1,0.00),(970,61,'CO','Cova Lima',1,0.00),(971,61,'DI','Dili',1,0.00),(972,61,'ER','Ermera',1,0.00),(973,61,'LA','Lautem',1,0.00),(974,61,'LI','Liquica',1,0.00),(975,61,'MT','Manatuto',1,0.00),(976,61,'MF','Manufahi',1,0.00),(977,61,'OE','Oecussi',1,0.00),(978,61,'VI','Viqueque',1,0.00),(979,62,'AZU','Azuay',1,0.00),(980,62,'BOL','Bolivar',1,0.00),(981,62,'CAN','Ca&ntilde;ar',1,0.00),(982,62,'CAR','Carchi',1,0.00),(983,62,'CHI','Chimborazo',1,0.00),(984,62,'COT','Cotopaxi',1,0.00),(985,62,'EOR','El Oro',1,0.00),(986,62,'ESM','Esmeraldas',1,0.00),(987,62,'GPS','Gal&aacute;pagos',1,0.00),(988,62,'GUA','Guayas',1,0.00),(989,62,'IMB','Imbabura',1,0.00),(990,62,'LOJ','Loja',1,0.00),(991,62,'LRO','Los Rios',1,0.00),(992,62,'MAN','Manab&iacute;',1,0.00),(993,62,'MSA','Morona Santiago',1,0.00),(994,62,'NAP','Napo',1,0.00),(995,62,'ORE','Orellana',1,0.00),(996,62,'PAS','Pastaza',1,0.00),(997,62,'PIC','Pichincha',1,0.00),(998,62,'SUC','Sucumb&iacute;os',1,0.00),(999,62,'TUN','Tungurahua',1,0.00),(1000,62,'ZCH','Zamora Chinchipe',1,0.00),(1001,63,'DHY','Ad Daqahliyah',1,0.00),(1002,63,'BAM','Al Bahr al Ahmar',1,0.00),(1003,63,'BHY','Al Buhayrah',1,0.00),(1004,63,'FYM','Al Fayyum',1,0.00),(1005,63,'GBY','Al Gharbiyah',1,0.00),(1006,63,'IDR','Al Iskandariyah',1,0.00),(1007,63,'IML','Al Isma\\iliyah',1,0.00),(1008,63,'JZH','Al Jizah',1,0.00),(1009,63,'MFY','Al Minufiyah',1,0.00),(1010,63,'MNY','Al Minya',1,0.00),(1011,63,'QHR','Al Qahirah',1,0.00),(1012,63,'QLY','Al Qalyubiyah',1,0.00),(1013,63,'WJD','Al Wadi al Jadid',1,0.00),(1014,63,'SHQ','Ash Sharqiyah',1,0.00),(1015,63,'SWY','As Suways',1,0.00),(1016,63,'ASW','Aswan',1,0.00),(1017,63,'ASY','Asyut',1,0.00),(1018,63,'BSW','Bani Suwayf',1,0.00),(1019,63,'BSD','Bur Sa\\id',1,0.00),(1020,63,'DMY','Dumyat',1,0.00),(1021,63,'JNS','Janub Sina\\',1,0.00),(1022,63,'KSH','Kafr ash Shaykh',1,0.00),(1023,63,'MAT','Matruh',1,0.00),(1024,63,'QIN','Qina',1,0.00),(1025,63,'SHS','Shamal Sina\\',1,0.00),(1026,63,'SUH','Suhaj',1,0.00),(1027,64,'AH','Ahuachapan',1,0.00),(1028,64,'CA','Cabanas',1,0.00),(1029,64,'CH','Chalatenango',1,0.00),(1030,64,'CU','Cuscatlan',1,0.00),(1031,64,'LB','La Libertad',1,0.00),(1032,64,'PZ','La Paz',1,0.00),(1033,64,'UN','La Union',1,0.00),(1034,64,'MO','Morazan',1,0.00),(1035,64,'SM','San Miguel',1,0.00),(1036,64,'SS','San Salvador',1,0.00),(1037,64,'SV','San Vicente',1,0.00),(1038,64,'SA','Santa Ana',1,0.00),(1039,64,'SO','Sonsonate',1,0.00),(1040,64,'US','Usulutan',1,0.00),(1041,65,'AN','Provincia Annobon',1,0.00),(1042,65,'BN','Provincia Bioko Norte',1,0.00),(1043,65,'BS','Provincia Bioko Sur',1,0.00),(1044,65,'CS','Provincia Centro Sur',1,0.00),(1045,65,'KN','Provincia Kie-Ntem',1,0.00),(1046,65,'LI','Provincia Litoral',1,0.00),(1047,65,'WN','Provincia Wele-Nzas',1,0.00),(1048,66,'MA','Central (Maekel)',1,0.00),(1049,66,'KE','Anseba (Keren)',1,0.00),(1050,66,'DK','Southern Red Sea (Debub-Keih-Bahri)',1,0.00),(1051,66,'SK','Northern Red Sea (Semien-Keih-Bahri)',1,0.00),(1052,66,'DE','Southern (Debub)',1,0.00),(1053,66,'BR','Gash-Barka (Barentu)',1,0.00),(1054,67,'HA','Harjumaa (Tallinn)',1,0.00),(1055,67,'HI','Hiiumaa (Kardla)',1,0.00),(1056,67,'IV','Ida-Virumaa (Johvi)',1,0.00),(1057,67,'JA','Jarvamaa (Paide)',1,0.00),(1058,67,'JO','Jogevamaa (Jogeva)',1,0.00),(1059,67,'LV','Laane-Virumaa (Rakvere)',1,0.00),(1060,67,'LA','Laanemaa (Haapsalu)',1,0.00),(1061,67,'PA','Parnumaa (Parnu)',1,0.00),(1062,67,'PO','Polvamaa (Polva)',1,0.00),(1063,67,'RA','Raplamaa (Rapla)',1,0.00),(1064,67,'SA','Saaremaa (Kuessaare)',1,0.00),(1065,67,'TA','Tartumaa (Tartu)',1,0.00),(1066,67,'VA','Valgamaa (Valga)',1,0.00),(1067,67,'VI','Viljandimaa (Viljandi)',1,0.00),(1068,67,'VO','Vorumaa (Voru)',1,0.00),(1069,68,'AF','Afar',1,0.00),(1070,68,'AH','Amhara',1,0.00),(1071,68,'BG','Benishangul-Gumaz',1,0.00),(1072,68,'GB','Gambela',1,0.00),(1073,68,'HR','Hariai',1,0.00),(1074,68,'OR','Oromia',1,0.00),(1075,68,'SM','Somali',1,0.00),(1076,68,'SN','Southern Nations - Nationalities and Peoples Region',1,0.00),(1077,68,'TG','Tigray',1,0.00),(1078,68,'AA','Addis Ababa',1,0.00),(1079,68,'DD','Dire Dawa',1,0.00),(1080,71,'C','Central Division',1,0.00),(1081,71,'N','Northern Division',1,0.00),(1082,71,'E','Eastern Division',1,0.00),(1083,71,'W','Western Division',1,0.00),(1084,71,'R','Rotuma',1,0.00),(1085,72,'AL','Ahvenanmaan Laani',1,0.00),(1086,72,'ES','Etela-Suomen Laani',1,0.00),(1087,72,'IS','Ita-Suomen Laani',1,0.00),(1088,72,'LS','Lansi-Suomen Laani',1,0.00),(1089,72,'LA','Lapin Lanani',1,0.00),(1090,72,'OU','Oulun Laani',1,0.00),(1091,73,'AL','Alsace',1,0.00),(1092,73,'AQ','Aquitaine',1,0.00),(1093,73,'AU','Auvergne',1,0.00),(1094,73,'BR','Brittany',1,0.00),(1095,73,'BU','Burgundy',1,0.00),(1096,73,'CE','Center Loire Valley',1,0.00),(1097,73,'CH','Champagne',1,0.00),(1098,73,'CO','Corse',1,0.00),(1099,73,'FR','France Comte',1,0.00),(1100,73,'LA','Languedoc Roussillon',1,0.00),(1101,73,'LI','Limousin',1,0.00),(1102,73,'LO','Lorraine',1,0.00),(1103,73,'MI','Midi Pyrenees',1,0.00),(1104,73,'NO','Nord Pas de Calais',1,0.00),(1105,73,'NR','Normandy',1,0.00),(1106,73,'PA','Paris / Ill de France',1,0.00),(1107,73,'PI','Picardie',1,0.00),(1108,73,'PO','Poitou Charente',1,0.00),(1109,73,'PR','Provence',1,0.00),(1110,73,'RH','Rhone Alps',1,0.00),(1111,73,'RI','Riviera',1,0.00),(1112,73,'WE','Western Loire Valley',1,0.00),(1113,74,'Et','Etranger',1,0.00),(1114,74,'01','Ain',1,0.00),(1115,74,'02','Aisne',1,0.00),(1116,74,'03','Allier',1,0.00),(1117,74,'04','Alpes de Haute Provence',1,0.00),(1118,74,'05','Hautes-Alpes',1,0.00),(1119,74,'06','Alpes Maritimes',1,0.00),(1120,74,'07','Ard&egrave;che',1,0.00),(1121,74,'08','Ardennes',1,0.00),(1122,74,'09','Ari&egrave;ge',1,0.00),(1123,74,'10','Aube',1,0.00),(1124,74,'11','Aude',1,0.00),(1125,74,'12','Aveyron',1,0.00),(1126,74,'13','Bouches du Rh&ocirc;ne',1,0.00),(1127,74,'14','Calvados',1,0.00),(1128,74,'15','Cantal',1,0.00),(1129,74,'16','Charente',1,0.00),(1130,74,'17','Charente Maritime',1,0.00),(1131,74,'18','Cher',1,0.00),(1132,74,'19','Corr&egrave;ze',1,0.00),(1133,74,'2A','Corse du Sud',1,0.00),(1134,74,'2B','Haute Corse',1,0.00),(1135,74,'21','C&ocirc;te d&#039;or',1,0.00),(1136,74,'22','C&ocirc;tes d&#039;Armor',1,0.00),(1137,74,'23','Creuse',1,0.00),(1138,74,'24','Dordogne',1,0.00),(1139,74,'25','Doubs',1,0.00),(1140,74,'26','Dr&ocirc;me',1,0.00),(1141,74,'27','Eure',1,0.00),(1142,74,'28','Eure et Loir',1,0.00),(1143,74,'29','Finist&egrave;re',1,0.00),(1144,74,'30','Gard',1,0.00),(1145,74,'31','Haute Garonne',1,0.00),(1146,74,'32','Gers',1,0.00),(1147,74,'33','Gironde',1,0.00),(1148,74,'34','H&eacute;rault',1,0.00),(1149,74,'35','Ille et Vilaine',1,0.00),(1150,74,'36','Indre',1,0.00),(1151,74,'37','Indre et Loire',1,0.00),(1152,74,'38','Is&eacute;re',1,0.00),(1153,74,'39','Jura',1,0.00),(1154,74,'40','Landes',1,0.00),(1155,74,'41','Loir et Cher',1,0.00),(1156,74,'42','Loire',1,0.00),(1157,74,'43','Haute Loire',1,0.00),(1158,74,'44','Loire Atlantique',1,0.00),(1159,74,'45','Loiret',1,0.00),(1160,74,'46','Lot',1,0.00),(1161,74,'47','Lot et Garonne',1,0.00),(1162,74,'48','Loz&egrave;re',1,0.00),(1163,74,'49','Maine et Loire',1,0.00),(1164,74,'50','Manche',1,0.00),(1165,74,'51','Marne',1,0.00),(1166,74,'52','Haute Marne',1,0.00),(1167,74,'53','Mayenne',1,0.00),(1168,74,'54','Meurthe et Moselle',1,0.00),(1169,74,'55','Meuse',1,0.00),(1170,74,'56','Morbihan',1,0.00),(1171,74,'57','Moselle',1,0.00),(1172,74,'58','Ni&egrave;vre',1,0.00),(1173,74,'59','Nord',1,0.00),(1174,74,'60','Oise',1,0.00),(1175,74,'61','Orne',1,0.00),(1176,74,'62','Pas de Calais',1,0.00),(1177,74,'63','Puy de D&ocirc;me',1,0.00),(1178,74,'64','Pyr&eacute;n&eacute;es Atlantiques',1,0.00),(1179,74,'65','Hautes Pyr&eacute;n&eacute;es',1,0.00),(1180,74,'66','Pyr&eacute;n&eacute;es Orientales',1,0.00),(1181,74,'67','Bas Rhin',1,0.00),(1182,74,'68','Haut Rhin',1,0.00),(1183,74,'69','Rh&ocirc;ne',1,0.00),(1184,74,'70','Haute Sa&ocirc;ne',1,0.00),(1185,74,'71','Sa&ocirc;ne et Loire',1,0.00),(1186,74,'72','Sarthe',1,0.00),(1187,74,'73','Savoie',1,0.00),(1188,74,'74','Haute Savoie',1,0.00),(1189,74,'75','Paris',1,0.00),(1190,74,'76','Seine Maritime',1,0.00),(1191,74,'77','Seine et Marne',1,0.00),(1192,74,'78','Yvelines',1,0.00),(1193,74,'79','Deux S&egrave;vres',1,0.00),(1194,74,'80','Somme',1,0.00),(1195,74,'81','Tarn',1,0.00),(1196,74,'82','Tarn et Garonne',1,0.00),(1197,74,'83','Var',1,0.00),(1198,74,'84','Vaucluse',1,0.00),(1199,74,'85','Vend&eacute;e',1,0.00),(1200,74,'86','Vienne',1,0.00),(1201,74,'87','Haute Vienne',1,0.00),(1202,74,'88','Vosges',1,0.00),(1203,74,'89','Yonne',1,0.00),(1204,74,'90','Territoire de Belfort',1,0.00),(1205,74,'91','Essonne',1,0.00),(1206,74,'92','Hauts de Seine',1,0.00),(1207,74,'93','Seine St-Denis',1,0.00),(1208,74,'94','Val de Marne',1,0.00),(1209,74,'95','Val d\\Oise',1,0.00),(1210,76,'M','Archipel des Marquises',1,0.00),(1211,76,'T','Archipel des Tuamotu',1,0.00),(1212,76,'I','Archipel des Tubuai',1,0.00),(1213,76,'V','Iles du Vent',1,0.00),(1214,76,'S','Iles Sous-le-Vent',1,0.00),(1215,77,'C','Iles Crozet',1,0.00),(1216,77,'K','Iles Kerguelen',1,0.00),(1217,77,'A','Ile Amsterdam',1,0.00),(1218,77,'P','Ile Saint-Paul',1,0.00),(1219,77,'D','Adelie Land',1,0.00),(1220,78,'ES','Estuaire',1,0.00),(1221,78,'HO','Haut-Ogooue',1,0.00),(1222,78,'MO','Moyen-Ogooue',1,0.00),(1223,78,'NG','Ngounie',1,0.00),(1224,78,'NY','Nyanga',1,0.00),(1225,78,'OI','Ogooue-Ivindo',1,0.00),(1226,78,'OL','Ogooue-Lolo',1,0.00),(1227,78,'OM','Ogooue-Maritime',1,0.00),(1228,78,'WN','Woleu-Ntem',1,0.00),(1229,79,'BJ','Banjul',1,0.00),(1230,79,'BS','Basse',1,0.00),(1231,79,'BR','Brikama',1,0.00),(1232,79,'JA','Janjangbure',1,0.00),(1233,79,'KA','Kanifeng',1,0.00),(1234,79,'KE','Kerewan',1,0.00),(1235,79,'KU','Kuntaur',1,0.00),(1236,79,'MA','Mansakonko',1,0.00),(1237,79,'LR','Lower River',1,0.00),(1238,79,'CR','Central River',1,0.00),(1239,79,'NB','North Bank',1,0.00),(1240,79,'UR','Upper River',1,0.00),(1241,79,'WE','Western',1,0.00),(1242,80,'AB','Abkhazia',1,0.00),(1243,80,'AJ','Ajaria',1,0.00),(1244,80,'TB','Tbilisi',1,0.00),(1245,80,'GU','Guria',1,0.00),(1246,80,'IM','Imereti',1,0.00),(1247,80,'KA','Kakheti',1,0.00),(1248,80,'KK','Kvemo Kartli',1,0.00),(1249,80,'MM','Mtskheta-Mtianeti',1,0.00),(1250,80,'RL','Racha Lechkhumi and Kvemo Svanet',1,0.00),(1251,80,'SZ','Samegrelo-Zemo Svaneti',1,0.00),(1252,80,'SJ','Samtskhe-Javakheti',1,0.00),(1253,80,'SK','Shida Kartli',1,0.00),(1254,81,'BAW','Baden-W&uuml;rttemberg',1,0.00),(1255,81,'BAY','Bayern',1,0.00),(1256,81,'BER','Berlin',1,0.00),(1257,81,'BRG','Brandenburg',1,0.00),(1258,81,'BRE','Bremen',1,0.00),(1259,81,'HAM','Hamburg',1,0.00),(1260,81,'HES','Hessen',1,0.00),(1261,81,'MEC','Mecklenburg-Vorpommern',1,0.00),(1262,81,'NDS','Niedersachsen',1,0.00),(1263,81,'NRW','Nordrhein-Westfalen',1,0.00),(1264,81,'RHE','Rheinland-Pfalz',1,0.00),(1265,81,'SAR','Saarland',1,0.00),(1266,81,'SAS','Sachsen',1,0.00),(1267,81,'SAC','Sachsen-Anhalt',1,0.00),(1268,81,'SCN','Schleswig-Holstein',1,0.00),(1269,81,'THE','Th&uuml;ringen',1,0.00),(1270,82,'AS','Ashanti Region',1,0.00),(1271,82,'BA','Brong-Ahafo Region',1,0.00),(1272,82,'CE','Central Region',1,0.00),(1273,82,'EA','Eastern Region',1,0.00),(1274,82,'GA','Greater Accra Region',1,0.00),(1275,82,'NO','Northern Region',1,0.00),(1276,82,'UE','Upper East Region',1,0.00),(1277,82,'UW','Upper West Region',1,0.00),(1278,82,'VO','Volta Region',1,0.00),(1279,82,'WE','Western Region',1,0.00),(1280,84,'AT','Attica',1,0.00),(1281,84,'CN','Central Greece',1,0.00),(1282,84,'CM','Central Macedonia',1,0.00),(1283,84,'CR','Crete',1,0.00),(1284,84,'EM','East Macedonia and Thrace',1,0.00),(1285,84,'EP','Epirus',1,0.00),(1286,84,'II','Ionian Islands',1,0.00),(1287,84,'NA','North Aegean',1,0.00),(1288,84,'PP','Peloponnesos',1,0.00),(1289,84,'SA','South Aegean',1,0.00),(1290,84,'TH','Thessaly',1,0.00),(1291,84,'WG','West Greece',1,0.00),(1292,84,'WM','West Macedonia',1,0.00),(1293,85,'A','Avannaa',1,0.00),(1294,85,'T','Tunu',1,0.00),(1295,85,'K','Kitaa',1,0.00),(1296,86,'A','Saint Andrew',1,0.00),(1297,86,'D','Saint David',1,0.00),(1298,86,'G','Saint George',1,0.00),(1299,86,'J','Saint John',1,0.00),(1300,86,'M','Saint Mark',1,0.00),(1301,86,'P','Saint Patrick',1,0.00),(1302,86,'C','Carriacou',1,0.00),(1303,86,'Q','Petit Martinique',1,0.00),(1304,89,'AV','Alta Verapaz',1,0.00),(1305,89,'BV','Baja Verapaz',1,0.00),(1306,89,'CM','Chimaltenango',1,0.00),(1307,89,'CQ','Chiquimula',1,0.00),(1308,89,'PE','El Peten',1,0.00),(1309,89,'PR','El Progreso',1,0.00),(1310,89,'QC','El Quiche',1,0.00),(1311,89,'ES','Escuintla',1,0.00),(1312,89,'GU','Guatemala',1,0.00),(1313,89,'HU','Huehuetenango',1,0.00),(1314,89,'IZ','Izabal',1,0.00),(1315,89,'JA','Jalapa',1,0.00),(1316,89,'JU','Jutiapa',1,0.00),(1317,89,'QZ','Quetzaltenango',1,0.00),(1318,89,'RE','Retalhuleu',1,0.00),(1319,89,'ST','Sacatepequez',1,0.00),(1320,89,'SM','San Marcos',1,0.00),(1321,89,'SR','Santa Rosa',1,0.00),(1322,89,'SO','Solola',1,0.00),(1323,89,'SU','Suchitepequez',1,0.00),(1324,89,'TO','Totonicapan',1,0.00),(1325,89,'ZA','Zacapa',1,0.00),(1326,90,'CNK','Conakry',1,0.00),(1327,90,'BYL','Beyla',1,0.00),(1328,90,'BFA','Boffa',1,0.00),(1329,90,'BOK','Boke',1,0.00),(1330,90,'COY','Coyah',1,0.00),(1331,90,'DBL','Dabola',1,0.00),(1332,90,'DLB','Dalaba',1,0.00),(1333,90,'DGR','Dinguiraye',1,0.00),(1334,90,'DBR','Dubreka',1,0.00),(1335,90,'FRN','Faranah',1,0.00),(1336,90,'FRC','Forecariah',1,0.00),(1337,90,'FRI','Fria',1,0.00),(1338,90,'GAO','Gaoual',1,0.00),(1339,90,'GCD','Gueckedou',1,0.00),(1340,90,'KNK','Kankan',1,0.00),(1341,90,'KRN','Kerouane',1,0.00),(1342,90,'KND','Kindia',1,0.00),(1343,90,'KSD','Kissidougou',1,0.00),(1344,90,'KBA','Koubia',1,0.00),(1345,90,'KDA','Koundara',1,0.00),(1346,90,'KRA','Kouroussa',1,0.00),(1347,90,'LAB','Labe',1,0.00),(1348,90,'LLM','Lelouma',1,0.00),(1349,90,'LOL','Lola',1,0.00),(1350,90,'MCT','Macenta',1,0.00),(1351,90,'MAL','Mali',1,0.00),(1352,90,'MAM','Mamou',1,0.00),(1353,90,'MAN','Mandiana',1,0.00),(1354,90,'NZR','Nzerekore',1,0.00),(1355,90,'PIT','Pita',1,0.00),(1356,90,'SIG','Siguiri',1,0.00),(1357,90,'TLM','Telimele',1,0.00),(1358,90,'TOG','Tougue',1,0.00),(1359,90,'YOM','Yomou',1,0.00),(1360,91,'BF','Bafata Region',1,0.00),(1361,91,'BB','Biombo Region',1,0.00),(1362,91,'BS','Bissau Region',1,0.00),(1363,91,'BL','Bolama Region',1,0.00),(1364,91,'CA','Cacheu Region',1,0.00),(1365,91,'GA','Gabu Region',1,0.00),(1366,91,'OI','Oio Region',1,0.00),(1367,91,'QU','Quinara Region',1,0.00),(1368,91,'TO','Tombali Region',1,0.00),(1369,92,'BW','Barima-Waini',1,0.00),(1370,92,'CM','Cuyuni-Mazaruni',1,0.00),(1371,92,'DM','Demerara-Mahaica',1,0.00),(1372,92,'EC','East Berbice-Corentyne',1,0.00),(1373,92,'EW','Essequibo Islands-West Demerara',1,0.00),(1374,92,'MB','Mahaica-Berbice',1,0.00),(1375,92,'PM','Pomeroon-Supenaam',1,0.00),(1376,92,'PI','Potaro-Siparuni',1,0.00),(1377,92,'UD','Upper Demerara-Berbice',1,0.00),(1378,92,'UT','Upper Takutu-Upper Essequibo',1,0.00),(1379,93,'AR','Artibonite',1,0.00),(1380,93,'CE','Centre',1,0.00),(1381,93,'GA','Grand\\Anse',1,0.00),(1382,93,'ND','Nord',1,0.00),(1383,93,'NE','Nord-Est',1,0.00),(1384,93,'NO','Nord-Ouest',1,0.00),(1385,93,'OU','Ouest',1,0.00),(1386,93,'SD','Sud',1,0.00),(1387,93,'SE','Sud-Est',1,0.00),(1388,94,'F','Flat Island',1,0.00),(1389,94,'M','McDonald Island',1,0.00),(1390,94,'S','Shag Island',1,0.00),(1391,94,'H','Heard Island',1,0.00),(1392,95,'AT','Atlantida',1,0.00),(1393,95,'CH','Choluteca',1,0.00),(1394,95,'CL','Colon',1,0.00),(1395,95,'CM','Comayagua',1,0.00),(1396,95,'CP','Copan',1,0.00),(1397,95,'CR','Cortes',1,0.00),(1398,95,'PA','El Paraiso',1,0.00),(1399,95,'FM','Francisco Morazan',1,0.00),(1400,95,'GD','Gracias a Dios',1,0.00),(1401,95,'IN','Intibuca',1,0.00),(1402,95,'IB','Islas de la Bahia (Bay Islands)',1,0.00),(1403,95,'PZ','La Paz',1,0.00),(1404,95,'LE','Lempira',1,0.00),(1405,95,'OC','Ocotepeque',1,0.00),(1406,95,'OL','Olancho',1,0.00),(1407,95,'SB','Santa Barbara',1,0.00),(1408,95,'VA','Valle',1,0.00),(1409,95,'YO','Yoro',1,0.00),(1410,96,'HCW','Central and Western Hong Kong Island',1,0.00),(1411,96,'HEA','Eastern Hong Kong Island',1,0.00),(1412,96,'HSO','Southern Hong Kong Island',1,0.00),(1413,96,'HWC','Wan Chai Hong Kong Island',1,0.00),(1414,96,'KKC','Kowloon City Kowloon',1,0.00),(1415,96,'KKT','Kwun Tong Kowloon',1,0.00),(1416,96,'KSS','Sham Shui Po Kowloon',1,0.00),(1417,96,'KWT','Wong Tai Sin Kowloon',1,0.00),(1418,96,'KYT','Yau Tsim Mong Kowloon',1,0.00),(1419,96,'NIS','Islands New Territories',1,0.00),(1420,96,'NKT','Kwai Tsing New Territories',1,0.00),(1421,96,'NNO','North New Territories',1,0.00),(1422,96,'NSK','Sai Kung New Territories',1,0.00),(1423,96,'NST','Sha Tin New Territories',1,0.00),(1424,96,'NTP','Tai Po New Territories',1,0.00),(1425,96,'NTW','Tsuen Wan New Territories',1,0.00),(1426,96,'NTM','Tuen Mun New Territories',1,0.00),(1427,96,'NYL','Yuen Long New Territories',1,0.00),(1428,97,'BK','Bacs-Kiskun',1,0.00),(1429,97,'BA','Baranya',1,0.00),(1430,97,'BE','Bekes',1,0.00),(1431,97,'BS','Bekescsaba',1,0.00),(1432,97,'BZ','Borsod-Abauj-Zemplen',1,0.00),(1433,97,'BU','Budapest',1,0.00),(1434,97,'CS','Csongrad',1,0.00),(1435,97,'DE','Debrecen',1,0.00),(1436,97,'DU','Dunaujvaros',1,0.00),(1437,97,'EG','Eger',1,0.00),(1438,97,'FE','Fejer',1,0.00),(1439,97,'GY','Gyor',1,0.00),(1440,97,'GM','Gyor-Moson-Sopron',1,0.00),(1441,97,'HB','Hajdu-Bihar',1,0.00),(1442,97,'HE','Heves',1,0.00),(1443,97,'HO','Hodmezovasarhely',1,0.00),(1444,97,'JN','Jasz-Nagykun-Szolnok',1,0.00),(1445,97,'KA','Kaposvar',1,0.00),(1446,97,'KE','Kecskemet',1,0.00),(1447,97,'KO','Komarom-Esztergom',1,0.00),(1448,97,'MI','Miskolc',1,0.00),(1449,97,'NA','Nagykanizsa',1,0.00),(1450,97,'NO','Nograd',1,0.00),(1451,97,'NY','Nyiregyhaza',1,0.00),(1452,97,'PE','Pecs',1,0.00),(1453,97,'PS','Pest',1,0.00),(1454,97,'SO','Somogy',1,0.00),(1455,97,'SP','Sopron',1,0.00),(1456,97,'SS','Szabolcs-Szatmar-Bereg',1,0.00),(1457,97,'SZ','Szeged',1,0.00),(1458,97,'SE','Szekesfehervar',1,0.00),(1459,97,'SL','Szolnok',1,0.00),(1460,97,'SM','Szombathely',1,0.00),(1461,97,'TA','Tatabanya',1,0.00),(1462,97,'TO','Tolna',1,0.00),(1463,97,'VA','Vas',1,0.00),(1464,97,'VE','Veszprem',1,0.00),(1465,97,'ZA','Zala',1,0.00),(1466,97,'ZZ','Zalaegerszeg',1,0.00),(1467,98,'AL','Austurland',1,0.00),(1468,98,'HF','Hofuoborgarsvaeoi',1,0.00),(1469,98,'NE','Norourland eystra',1,0.00),(1470,98,'NV','Norourland vestra',1,0.00),(1471,98,'SL','Suourland',1,0.00),(1472,98,'SN','Suournes',1,0.00),(1473,98,'VF','Vestfiroir',1,0.00),(1474,98,'VL','Vesturland',1,0.00),(1475,99,'AN','Andaman and Nicobar Islands',1,0.00),(1476,99,'AP','Andhra Pradesh',1,0.00),(1477,99,'AR','Arunachal Pradesh',1,0.00),(1478,99,'AS','Assam',1,0.00),(1479,99,'BI','Bihar',1,0.00),(1480,99,'CH','Chandigarh',1,0.00),(1481,99,'DA','Dadra and Nagar Haveli',1,0.00),(1482,99,'DM','Daman and Diu',1,0.00),(1483,99,'DE','Delhi',1,0.00),(1484,99,'GO','Goa',1,0.00),(1485,99,'GU','Gujarat',1,0.00),(1486,99,'HA','Haryana',1,0.00),(1487,99,'HP','Himachal Pradesh',1,0.00),(1488,99,'JA','Jammu and Kashmir',1,0.00),(1489,99,'KA','Karnataka',1,0.00),(1490,99,'KE','Kerala',1,0.00),(1491,99,'LI','Lakshadweep Islands',1,0.00),(1492,99,'MP','Madhya Pradesh',1,0.00),(1493,99,'MA','Maharashtra',1,0.00),(1494,99,'MN','Manipur',1,0.00),(1495,99,'ME','Meghalaya',1,0.00),(1496,99,'MI','Mizoram',1,0.00),(1497,99,'NA','Nagaland',1,0.00),(1498,99,'OR','Orissa',1,0.00),(1499,99,'PO','Pondicherry',1,0.00),(1500,99,'PU','Punjab',1,0.00),(1501,99,'RA','Rajasthan',1,0.00),(1502,99,'SI','Sikkim',1,0.00),(1503,99,'TN','Tamil Nadu',1,0.00),(1504,99,'TR','Tripura',1,0.00),(1505,99,'UP','Uttar Pradesh',1,0.00),(1506,99,'WB','West Bengal',1,0.00),(1507,100,'AC','Aceh',1,0.00),(1508,100,'BA','Bali',1,0.00),(1509,100,'BT','Banten',1,0.00),(1510,100,'BE','Bengkulu',1,0.00),(1511,100,'BD','BoDeTaBek',1,0.00),(1512,100,'GO','Gorontalo',1,0.00),(1513,100,'JK','Jakarta Raya',1,0.00),(1514,100,'JA','Jambi',1,0.00),(1515,100,'JB','Jawa Barat',1,0.00),(1516,100,'JT','Jawa Tengah',1,0.00),(1517,100,'JI','Jawa Timur',1,0.00),(1518,100,'KB','Kalimantan Barat',1,0.00),(1519,100,'KS','Kalimantan Selatan',1,0.00),(1520,100,'KT','Kalimantan Tengah',1,0.00),(1521,100,'KI','Kalimantan Timur',1,0.00),(1522,100,'BB','Kepulauan Bangka Belitung',1,0.00),(1523,100,'LA','Lampung',1,0.00),(1524,100,'MA','Maluku',1,0.00),(1525,100,'MU','Maluku Utara',1,0.00),(1526,100,'NB','Nusa Tenggara Barat',1,0.00),(1527,100,'NT','Nusa Tenggara Timur',1,0.00),(1528,100,'PA','Papua',1,0.00),(1529,100,'RI','Riau',1,0.00),(1530,100,'SN','Sulawesi Selatan',1,0.00),(1531,100,'ST','Sulawesi Tengah',1,0.00),(1532,100,'SG','Sulawesi Tenggara',1,0.00),(1533,100,'SA','Sulawesi Utara',1,0.00),(1534,100,'SB','Sumatera Barat',1,0.00),(1535,100,'SS','Sumatera Selatan',1,0.00),(1536,100,'SU','Sumatera Utara',1,0.00),(1537,100,'YO','Yogyakarta',1,0.00),(1538,101,'TEH','Tehran',1,0.00),(1539,101,'QOM','Qom',1,0.00),(1540,101,'MKZ','Markazi',1,0.00),(1541,101,'QAZ','Qazvin',1,0.00),(1542,101,'GIL','Gilan',1,0.00),(1543,101,'ARD','Ardabil',1,0.00),(1544,101,'ZAN','Zanjan',1,0.00),(1545,101,'EAZ','East Azarbaijan',1,0.00),(1546,101,'WEZ','West Azarbaijan',1,0.00),(1547,101,'KRD','Kurdistan',1,0.00),(1548,101,'HMD','Hamadan',1,0.00),(1549,101,'KRM','Kermanshah',1,0.00),(1550,101,'ILM','Ilam',1,0.00),(1551,101,'LRS','Lorestan',1,0.00),(1552,101,'KZT','Khuzestan',1,0.00),(1553,101,'CMB','Chahar Mahaal and Bakhtiari',1,0.00),(1554,101,'KBA','Kohkiluyeh and Buyer Ahmad',1,0.00),(1555,101,'BSH','Bushehr',1,0.00),(1556,101,'FAR','Fars',1,0.00),(1557,101,'HRM','Hormozgan',1,0.00),(1558,101,'SBL','Sistan and Baluchistan',1,0.00),(1559,101,'KRB','Kerman',1,0.00),(1560,101,'YZD','Yazd',1,0.00),(1561,101,'EFH','Esfahan',1,0.00),(1562,101,'SMN','Semnan',1,0.00),(1563,101,'MZD','Mazandaran',1,0.00),(1564,101,'GLS','Golestan',1,0.00),(1565,101,'NKH','North Khorasan',1,0.00),(1566,101,'RKH','Razavi Khorasan',1,0.00),(1567,101,'SKH','South Khorasan',1,0.00),(1568,102,'BD','Baghdad',1,0.00),(1569,102,'SD','Salah ad Din',1,0.00),(1570,102,'DY','Diyala',1,0.00),(1571,102,'WS','Wasit',1,0.00),(1572,102,'MY','Maysan',1,0.00),(1573,102,'BA','Al Basrah',1,0.00),(1574,102,'DQ','Dhi Qar',1,0.00),(1575,102,'MU','Al Muthanna',1,0.00),(1576,102,'QA','Al Qadisyah',1,0.00),(1577,102,'BB','Babil',1,0.00),(1578,102,'KB','Al Karbala',1,0.00),(1579,102,'NJ','An Najaf',1,0.00),(1580,102,'AB','Al Anbar',1,0.00),(1581,102,'NN','Ninawa',1,0.00),(1582,102,'DH','Dahuk',1,0.00),(1583,102,'AL','Arbil',1,0.00),(1584,102,'TM','At Ta\\mim',1,0.00),(1585,102,'SL','As Sulaymaniyah',1,0.00),(1586,103,'CA','Carlow',1,0.00),(1587,103,'CV','Cavan',1,0.00),(1588,103,'CL','Clare',1,0.00),(1589,103,'CO','Cork',1,0.00),(1590,103,'DO','Donegal',1,0.00),(1591,103,'DU','Dublin',1,0.00),(1592,103,'GA','Galway',1,0.00),(1593,103,'KE','Kerry',1,0.00),(1594,103,'KI','Kildare',1,0.00),(1595,103,'KL','Kilkenny',1,0.00),(1596,103,'LA','Laois',1,0.00),(1597,103,'LE','Leitrim',1,0.00),(1598,103,'LI','Limerick',1,0.00),(1599,103,'LO','Longford',1,0.00),(1600,103,'LU','Louth',1,0.00),(1601,103,'MA','Mayo',1,0.00),(1602,103,'ME','Meath',1,0.00),(1603,103,'MO','Monaghan',1,0.00),(1604,103,'OF','Offaly',1,0.00),(1605,103,'RO','Roscommon',1,0.00),(1606,103,'SL','Sligo',1,0.00),(1607,103,'TI','Tipperary',1,0.00),(1608,103,'WA','Waterford',1,0.00),(1609,103,'WE','Westmeath',1,0.00),(1610,103,'WX','Wexford',1,0.00),(1611,103,'WI','Wicklow',1,0.00),(1612,104,'BS','Be\\er Sheva',1,0.00),(1613,104,'BH','Bika\\at Hayarden',1,0.00),(1614,104,'EA','Eilat and Arava',1,0.00),(1615,104,'GA','Galil',1,0.00),(1616,104,'HA','Haifa',1,0.00),(1617,104,'JM','Jehuda Mountains',1,0.00),(1618,104,'JE','Jerusalem',1,0.00),(1619,104,'NE','Negev',1,0.00),(1620,104,'SE','Semaria',1,0.00),(1621,104,'SH','Sharon',1,0.00),(1622,104,'TA','Tel Aviv (Gosh Dan)',1,0.00),(1643,106,'CLA','Clarendon Parish',1,0.00),(1644,106,'HAN','Hanover Parish',1,0.00),(1645,106,'KIN','Kingston Parish',1,0.00),(1646,106,'MAN','Manchester Parish',1,0.00),(1647,106,'POR','Portland Parish',1,0.00),(1648,106,'AND','Saint Andrew Parish',1,0.00),(1649,106,'ANN','Saint Ann Parish',1,0.00),(1650,106,'CAT','Saint Catherine Parish',1,0.00),(1651,106,'ELI','Saint Elizabeth Parish',1,0.00),(1652,106,'JAM','Saint James Parish',1,0.00),(1653,106,'MAR','Saint Mary Parish',1,0.00),(1654,106,'THO','Saint Thomas Parish',1,0.00),(1655,106,'TRL','Trelawny Parish',1,0.00),(1656,106,'WML','Westmoreland Parish',1,0.00),(1657,107,'AI','Aichi',1,0.00),(1658,107,'AK','Akita',1,0.00),(1659,107,'AO','Aomori',1,0.00),(1660,107,'CH','Chiba',1,0.00),(1661,107,'EH','Ehime',1,0.00),(1662,107,'FK','Fukui',1,0.00),(1663,107,'FU','Fukuoka',1,0.00),(1664,107,'FS','Fukushima',1,0.00),(1665,107,'GI','Gifu',1,0.00),(1666,107,'GU','Gumma',1,0.00),(1667,107,'HI','Hiroshima',1,0.00),(1668,107,'HO','Hokkaido',1,0.00),(1669,107,'HY','Hyogo',1,0.00),(1670,107,'IB','Ibaraki',1,0.00),(1671,107,'IS','Ishikawa',1,0.00),(1672,107,'IW','Iwate',1,0.00),(1673,107,'KA','Kagawa',1,0.00),(1674,107,'KG','Kagoshima',1,0.00),(1675,107,'KN','Kanagawa',1,0.00),(1676,107,'KO','Kochi',1,0.00),(1677,107,'KU','Kumamoto',1,0.00),(1678,107,'KY','Kyoto',1,0.00),(1679,107,'MI','Mie',1,0.00),(1680,107,'MY','Miyagi',1,0.00),(1681,107,'MZ','Miyazaki',1,0.00),(1682,107,'NA','Nagano',1,0.00),(1683,107,'NG','Nagasaki',1,0.00),(1684,107,'NR','Nara',1,0.00),(1685,107,'NI','Niigata',1,0.00),(1686,107,'OI','Oita',1,0.00),(1687,107,'OK','Okayama',1,0.00),(1688,107,'ON','Okinawa',1,0.00),(1689,107,'OS','Osaka',1,0.00),(1690,107,'SA','Saga',1,0.00),(1691,107,'SI','Saitama',1,0.00),(1692,107,'SH','Shiga',1,0.00),(1693,107,'SM','Shimane',1,0.00),(1694,107,'SZ','Shizuoka',1,0.00),(1695,107,'TO','Tochigi',1,0.00),(1696,107,'TS','Tokushima',1,0.00),(1697,107,'TK','Tokyo',1,0.00),(1698,107,'TT','Tottori',1,0.00),(1699,107,'TY','Toyama',1,0.00),(1700,107,'WA','Wakayama',1,0.00),(1701,107,'YA','Yamagata',1,0.00),(1702,107,'YM','Yamaguchi',1,0.00),(1703,107,'YN','Yamanashi',1,0.00),(1704,108,'AM','\\Amman',1,0.00),(1705,108,'AJ','Ajlun',1,0.00),(1706,108,'AA','Al \\Aqabah',1,0.00),(1707,108,'AB','Al Balqa\\',1,0.00),(1708,108,'AK','Al Karak',1,0.00),(1709,108,'AL','Al Mafraq',1,0.00),(1710,108,'AT','At Tafilah',1,0.00),(1711,108,'AZ','Az Zarqa\\',1,0.00),(1712,108,'IR','Irbid',1,0.00),(1713,108,'JA','Jarash',1,0.00),(1714,108,'MA','Ma\\an',1,0.00),(1715,108,'MD','Madaba',1,0.00),(1716,109,'AL','Almaty',1,0.00),(1717,109,'AC','Almaty City',1,0.00),(1718,109,'AM','Aqmola',1,0.00),(1719,109,'AQ','Aqtobe',1,0.00),(1720,109,'AS','Astana City',1,0.00),(1721,109,'AT','Atyrau',1,0.00),(1722,109,'BA','Batys Qazaqstan',1,0.00),(1723,109,'BY','Bayqongyr City',1,0.00),(1724,109,'MA','Mangghystau',1,0.00),(1725,109,'ON','Ongtustik Qazaqstan',1,0.00),(1726,109,'PA','Pavlodar',1,0.00),(1727,109,'QA','Qaraghandy',1,0.00),(1728,109,'QO','Qostanay',1,0.00),(1729,109,'QY','Qyzylorda',1,0.00),(1730,109,'SH','Shyghys Qazaqstan',1,0.00),(1731,109,'SO','Soltustik Qazaqstan',1,0.00),(1732,109,'ZH','Zhambyl',1,0.00),(1733,110,'CE','Central',1,0.00),(1734,110,'CO','Coast',1,0.00),(1735,110,'EA','Eastern',1,0.00),(1736,110,'NA','Nairobi Area',1,0.00),(1737,110,'NE','North Eastern',1,0.00),(1738,110,'NY','Nyanza',1,0.00),(1739,110,'RV','Rift Valley',1,0.00),(1740,110,'WE','Western',1,0.00),(1741,111,'AG','Abaiang',1,0.00),(1742,111,'AM','Abemama',1,0.00),(1743,111,'AK','Aranuka',1,0.00),(1744,111,'AO','Arorae',1,0.00),(1745,111,'BA','Banaba',1,0.00),(1746,111,'BE','Beru',1,0.00),(1747,111,'bT','Butaritari',1,0.00),(1748,111,'KA','Kanton',1,0.00),(1749,111,'KR','Kiritimati',1,0.00),(1750,111,'KU','Kuria',1,0.00),(1751,111,'MI','Maiana',1,0.00),(1752,111,'MN','Makin',1,0.00),(1753,111,'ME','Marakei',1,0.00),(1754,111,'NI','Nikunau',1,0.00),(1755,111,'NO','Nonouti',1,0.00),(1756,111,'ON','Onotoa',1,0.00),(1757,111,'TT','Tabiteuea',1,0.00),(1758,111,'TR','Tabuaeran',1,0.00),(1759,111,'TM','Tamana',1,0.00),(1760,111,'TW','Tarawa',1,0.00),(1761,111,'TE','Teraina',1,0.00),(1762,112,'CHA','Chagang-do',1,0.00),(1763,112,'HAB','Hamgyong-bukto',1,0.00),(1764,112,'HAN','Hamgyong-namdo',1,0.00),(1765,112,'HWB','Hwanghae-bukto',1,0.00),(1766,112,'HWN','Hwanghae-namdo',1,0.00),(1767,112,'KAN','Kangwon-do',1,0.00),(1768,112,'PYB','P\\yongan-bukto',1,0.00),(1769,112,'PYN','P\\yongan-namdo',1,0.00),(1770,112,'YAN','Ryanggang-do (Yanggang-do)',1,0.00),(1771,112,'NAJ','Rason Directly Governed City',1,0.00),(1772,112,'PYO','P\\yongyang Special City',1,0.00),(1773,113,'CO','Ch\\ungch\\ong-bukto',1,0.00),(1774,113,'CH','Ch\\ungch\\ong-namdo',1,0.00),(1775,113,'CD','Cheju-do',1,0.00),(1776,113,'CB','Cholla-bukto',1,0.00),(1777,113,'CN','Cholla-namdo',1,0.00),(1778,113,'IG','Inch\\on-gwangyoksi',1,0.00),(1779,113,'KA','Kangwon-do',1,0.00),(1780,113,'KG','Kwangju-gwangyoksi',1,0.00),(1781,113,'KD','Kyonggi-do',1,0.00),(1782,113,'KB','Kyongsang-bukto',1,0.00),(1783,113,'KN','Kyongsang-namdo',1,0.00),(1784,113,'PG','Pusan-gwangyoksi',1,0.00),(1785,113,'SO','Soul-t\\ukpyolsi',1,0.00),(1786,113,'TA','Taegu-gwangyoksi',1,0.00),(1787,113,'TG','Taejon-gwangyoksi',1,0.00),(1788,114,'AL','Al \\Asimah',1,0.00),(1789,114,'AA','Al Ahmadi',1,0.00),(1790,114,'AF','Al Farwaniyah',1,0.00),(1791,114,'AJ','Al Jahra\\',1,0.00),(1792,114,'HA','Hawalli',1,0.00),(1793,115,'GB','Bishkek',1,0.00),(1794,115,'B','Batken',1,0.00),(1795,115,'C','Chu',1,0.00),(1796,115,'J','Jalal-Abad',1,0.00),(1797,115,'N','Naryn',1,0.00),(1798,115,'O','Osh',1,0.00),(1799,115,'T','Talas',1,0.00),(1800,115,'Y','Ysyk-Kol',1,0.00),(1801,116,'VT','Vientiane',1,0.00),(1802,116,'AT','Attapu',1,0.00),(1803,116,'BK','Bokeo',1,0.00),(1804,116,'BL','Bolikhamxai',1,0.00),(1805,116,'CH','Champasak',1,0.00),(1806,116,'HO','Houaphan',1,0.00),(1807,116,'KH','Khammouan',1,0.00),(1808,116,'LM','Louang Namtha',1,0.00),(1809,116,'LP','Louangphabang',1,0.00),(1810,116,'OU','Oudomxai',1,0.00),(1811,116,'PH','Phongsali',1,0.00),(1812,116,'SL','Salavan',1,0.00),(1813,116,'SV','Savannakhet',1,0.00),(1814,116,'VI','Vientiane',1,0.00),(1815,116,'XA','Xaignabouli',1,0.00),(1816,116,'XE','Xekong',1,0.00),(1817,116,'XI','Xiangkhoang',1,0.00),(1818,116,'XN','Xaisomboun',1,0.00),(1819,117,'AIZ','Aizkraukles Rajons',1,0.00),(1820,117,'ALU','Aluksnes Rajons',1,0.00),(1821,117,'BAL','Balvu Rajons',1,0.00),(1822,117,'BAU','Bauskas Rajons',1,0.00),(1823,117,'CES','Cesu Rajons',1,0.00),(1824,117,'DGR','Daugavpils Rajons',1,0.00),(1825,117,'DOB','Dobeles Rajons',1,0.00),(1826,117,'GUL','Gulbenes Rajons',1,0.00),(1827,117,'JEK','Jekabpils Rajons',1,0.00),(1828,117,'JGR','Jelgavas Rajons',1,0.00),(1829,117,'KRA','Kraslavas Rajons',1,0.00),(1830,117,'KUL','Kuldigas Rajons',1,0.00),(1831,117,'LPR','Liepajas Rajons',1,0.00),(1832,117,'LIM','Limbazu Rajons',1,0.00),(1833,117,'LUD','Ludzas Rajons',1,0.00),(1834,117,'MAD','Madonas Rajons',1,0.00),(1835,117,'OGR','Ogres Rajons',1,0.00),(1836,117,'PRE','Preilu Rajons',1,0.00),(1837,117,'RZR','Rezeknes Rajons',1,0.00),(1838,117,'RGR','Rigas Rajons',1,0.00),(1839,117,'SAL','Saldus Rajons',1,0.00),(1840,117,'TAL','Talsu Rajons',1,0.00),(1841,117,'TUK','Tukuma Rajons',1,0.00),(1842,117,'VLK','Valkas Rajons',1,0.00),(1843,117,'VLM','Valmieras Rajons',1,0.00),(1844,117,'VSR','Ventspils Rajons',1,0.00),(1845,117,'DGV','Daugavpils',1,0.00),(1846,117,'JGV','Jelgava',1,0.00),(1847,117,'JUR','Jurmala',1,0.00),(1848,117,'LPK','Liepaja',1,0.00),(1849,117,'RZK','Rezekne',1,0.00),(1850,117,'RGA','Riga',1,0.00),(1851,117,'VSL','Ventspils',1,0.00),(1852,119,'BE','Berea',1,0.00),(1853,119,'BB','Butha-Buthe',1,0.00),(1854,119,'LE','Leribe',1,0.00),(1855,119,'MF','Mafeteng',1,0.00),(1856,119,'MS','Maseru',1,0.00),(1857,119,'MH','Mohale\\s Hoek',1,0.00),(1858,119,'MK','Mokhotlong',1,0.00),(1859,119,'QN','Qacha\\s Nek',1,0.00),(1860,119,'QT','Quthing',1,0.00),(1861,119,'TT','Thaba-Tseka',1,0.00),(1862,120,'BI','Bomi',1,0.00),(1863,120,'BG','Bong',1,0.00),(1864,120,'GB','Grand Bassa',1,0.00),(1865,120,'CM','Grand Cape Mount',1,0.00),(1866,120,'GG','Grand Gedeh',1,0.00),(1867,120,'GK','Grand Kru',1,0.00),(1868,120,'LO','Lofa',1,0.00),(1869,120,'MG','Margibi',1,0.00),(1870,120,'ML','Maryland',1,0.00),(1871,120,'MS','Montserrado',1,0.00),(1872,120,'NB','Nimba',1,0.00),(1873,120,'RC','River Cess',1,0.00),(1874,120,'SN','Sinoe',1,0.00),(1875,121,'AJ','Ajdabiya',1,0.00),(1876,121,'AZ','Al \\Aziziyah',1,0.00),(1877,121,'FA','Al Fatih',1,0.00),(1878,121,'JA','Al Jabal al Akhdar',1,0.00),(1879,121,'JU','Al Jufrah',1,0.00),(1880,121,'KH','Al Khums',1,0.00),(1881,121,'KU','Al Kufrah',1,0.00),(1882,121,'NK','An Nuqat al Khams',1,0.00),(1883,121,'AS','Ash Shati\\',1,0.00),(1884,121,'AW','Awbari',1,0.00),(1885,121,'ZA','Az Zawiyah',1,0.00),(1886,121,'BA','Banghazi',1,0.00),(1887,121,'DA','Darnah',1,0.00),(1888,121,'GD','Ghadamis',1,0.00),(1889,121,'GY','Gharyan',1,0.00),(1890,121,'MI','Misratah',1,0.00),(1891,121,'MZ','Murzuq',1,0.00),(1892,121,'SB','Sabha',1,0.00),(1893,121,'SW','Sawfajjin',1,0.00),(1894,121,'SU','Surt',1,0.00),(1895,121,'TL','Tarabulus (Tripoli)',1,0.00),(1896,121,'TH','Tarhunah',1,0.00),(1897,121,'TU','Tubruq',1,0.00),(1898,121,'YA','Yafran',1,0.00),(1899,121,'ZL','Zlitan',1,0.00),(1900,122,'V','Vaduz',1,0.00),(1901,122,'A','Schaan',1,0.00),(1902,122,'B','Balzers',1,0.00),(1903,122,'N','Triesen',1,0.00),(1904,122,'E','Eschen',1,0.00),(1905,122,'M','Mauren',1,0.00),(1906,122,'T','Triesenberg',1,0.00),(1907,122,'R','Ruggell',1,0.00),(1908,122,'G','Gamprin',1,0.00),(1909,122,'L','Schellenberg',1,0.00),(1910,122,'P','Planken',1,0.00),(1911,123,'AL','Alytus',1,0.00),(1912,123,'KA','Kaunas',1,0.00),(1913,123,'KL','Klaipeda',1,0.00),(1914,123,'MA','Marijampole',1,0.00),(1915,123,'PA','Panevezys',1,0.00),(1916,123,'SI','Siauliai',1,0.00),(1917,123,'TA','Taurage',1,0.00),(1918,123,'TE','Telsiai',1,0.00),(1919,123,'UT','Utena',1,0.00),(1920,123,'VI','Vilnius',1,0.00),(1921,124,'DD','Diekirch',1,0.00),(1922,124,'DC','Clervaux',1,0.00),(1923,124,'DR','Redange',1,0.00),(1924,124,'DV','Vianden',1,0.00),(1925,124,'DW','Wiltz',1,0.00),(1926,124,'GG','Grevenmacher',1,0.00),(1927,124,'GE','Echternach',1,0.00),(1928,124,'GR','Remich',1,0.00),(1929,124,'LL','Luxembourg',1,0.00),(1930,124,'LC','Capellen',1,0.00),(1931,124,'LE','Esch-sur-Alzette',1,0.00),(1932,124,'LM','Mersch',1,0.00),(1933,125,'OLF','Our Lady Fatima Parish',1,0.00),(1934,125,'ANT','St. Anthony Parish',1,0.00),(1935,125,'LAZ','St. Lazarus Parish',1,0.00),(1936,125,'CAT','Cathedral Parish',1,0.00),(1937,125,'LAW','St. Lawrence Parish',1,0.00),(1938,127,'AN','Antananarivo',1,0.00),(1939,127,'AS','Antsiranana',1,0.00),(1940,127,'FN','Fianarantsoa',1,0.00),(1941,127,'MJ','Mahajanga',1,0.00),(1942,127,'TM','Toamasina',1,0.00),(1943,127,'TL','Toliara',1,0.00),(1944,128,'BLK','Balaka',1,0.00),(1945,128,'BLT','Blantyre',1,0.00),(1946,128,'CKW','Chikwawa',1,0.00),(1947,128,'CRD','Chiradzulu',1,0.00),(1948,128,'CTP','Chitipa',1,0.00),(1949,128,'DDZ','Dedza',1,0.00),(1950,128,'DWA','Dowa',1,0.00),(1951,128,'KRG','Karonga',1,0.00),(1952,128,'KSG','Kasungu',1,0.00),(1953,128,'LKM','Likoma',1,0.00),(1954,128,'LLG','Lilongwe',1,0.00),(1955,128,'MCG','Machinga',1,0.00),(1956,128,'MGC','Mangochi',1,0.00),(1957,128,'MCH','Mchinji',1,0.00),(1958,128,'MLJ','Mulanje',1,0.00),(1959,128,'MWZ','Mwanza',1,0.00),(1960,128,'MZM','Mzimba',1,0.00),(1961,128,'NTU','Ntcheu',1,0.00),(1962,128,'NKB','Nkhata Bay',1,0.00),(1963,128,'NKH','Nkhotakota',1,0.00),(1964,128,'NSJ','Nsanje',1,0.00),(1965,128,'NTI','Ntchisi',1,0.00),(1966,128,'PHL','Phalombe',1,0.00),(1967,128,'RMP','Rumphi',1,0.00),(1968,128,'SLM','Salima',1,0.00),(1969,128,'THY','Thyolo',1,0.00),(1970,128,'ZBA','Zomba',1,0.00),(1971,129,'JO','Johor',1,0.00),(1972,129,'KE','Kedah',1,0.00),(1973,129,'KL','Kelantan',1,0.00),(1974,129,'LA','Labuan',1,0.00),(1975,129,'ME','Melaka',1,0.00),(1976,129,'NS','Negeri Sembilan',1,0.00),(1977,129,'PA','Pahang',1,0.00),(1978,129,'PE','Perak',1,0.00),(1979,129,'PR','Perlis',1,0.00),(1980,129,'PP','Pulau Pinang',1,0.00),(1981,129,'SA','Sabah',1,0.00),(1982,129,'SR','Sarawak',1,0.00),(1983,129,'SE','Selangor',1,0.00),(1984,129,'TE','Terengganu',1,0.00),(1985,129,'WP','Wilayah Persekutuan',1,0.00),(1986,130,'THU','Thiladhunmathi Uthuru',1,0.00),(1987,130,'THD','Thiladhunmathi Dhekunu',1,0.00),(1988,130,'MLU','Miladhunmadulu Uthuru',1,0.00),(1989,130,'MLD','Miladhunmadulu Dhekunu',1,0.00),(1990,130,'MAU','Maalhosmadulu Uthuru',1,0.00),(1991,130,'MAD','Maalhosmadulu Dhekunu',1,0.00),(1992,130,'FAA','Faadhippolhu',1,0.00),(1993,130,'MAA','Male Atoll',1,0.00),(1994,130,'AAU','Ari Atoll Uthuru',1,0.00),(1995,130,'AAD','Ari Atoll Dheknu',1,0.00),(1996,130,'FEA','Felidhe Atoll',1,0.00),(1997,130,'MUA','Mulaku Atoll',1,0.00),(1998,130,'NAU','Nilandhe Atoll Uthuru',1,0.00),(1999,130,'NAD','Nilandhe Atoll Dhekunu',1,0.00),(2000,130,'KLH','Kolhumadulu',1,0.00),(2001,130,'HDH','Hadhdhunmathi',1,0.00),(2002,130,'HAU','Huvadhu Atoll Uthuru',1,0.00),(2003,130,'HAD','Huvadhu Atoll Dhekunu',1,0.00),(2004,130,'FMU','Fua Mulaku',1,0.00),(2005,130,'ADD','Addu',1,0.00),(2006,131,'GA','Gao',1,0.00),(2007,131,'KY','Kayes',1,0.00),(2008,131,'KD','Kidal',1,0.00),(2009,131,'KL','Koulikoro',1,0.00),(2010,131,'MP','Mopti',1,0.00),(2011,131,'SG','Segou',1,0.00),(2012,131,'SK','Sikasso',1,0.00),(2013,131,'TB','Tombouctou',1,0.00),(2014,131,'CD','Bamako Capital District',1,0.00),(2015,132,'ATT','Attard',1,0.00),(2016,132,'BAL','Balzan',1,0.00),(2017,132,'BGU','Birgu',1,0.00),(2018,132,'BKK','Birkirkara',1,0.00),(2019,132,'BRZ','Birzebbuga',1,0.00),(2020,132,'BOR','Bormla',1,0.00),(2021,132,'DIN','Dingli',1,0.00),(2022,132,'FGU','Fgura',1,0.00),(2023,132,'FLO','Floriana',1,0.00),(2024,132,'GDJ','Gudja',1,0.00),(2025,132,'GZR','Gzira',1,0.00),(2026,132,'GRG','Gargur',1,0.00),(2027,132,'GXQ','Gaxaq',1,0.00),(2028,132,'HMR','Hamrun',1,0.00),(2029,132,'IKL','Iklin',1,0.00),(2030,132,'ISL','Isla',1,0.00),(2031,132,'KLK','Kalkara',1,0.00),(2032,132,'KRK','Kirkop',1,0.00),(2033,132,'LIJ','Lija',1,0.00),(2034,132,'LUQ','Luqa',1,0.00),(2035,132,'MRS','Marsa',1,0.00),(2036,132,'MKL','Marsaskala',1,0.00),(2037,132,'MXL','Marsaxlokk',1,0.00),(2038,132,'MDN','Mdina',1,0.00),(2039,132,'MEL','Melliea',1,0.00),(2040,132,'MGR','Mgarr',1,0.00),(2041,132,'MST','Mosta',1,0.00),(2042,132,'MQA','Mqabba',1,0.00),(2043,132,'MSI','Msida',1,0.00),(2044,132,'MTF','Mtarfa',1,0.00),(2045,132,'NAX','Naxxar',1,0.00),(2046,132,'PAO','Paola',1,0.00),(2047,132,'PEM','Pembroke',1,0.00),(2048,132,'PIE','Pieta',1,0.00),(2049,132,'QOR','Qormi',1,0.00),(2050,132,'QRE','Qrendi',1,0.00),(2051,132,'RAB','Rabat',1,0.00),(2052,132,'SAF','Safi',1,0.00),(2053,132,'SGI','San Giljan',1,0.00),(2054,132,'SLU','Santa Lucija',1,0.00),(2055,132,'SPB','San Pawl il-Bahar',1,0.00),(2056,132,'SGW','San Gwann',1,0.00),(2057,132,'SVE','Santa Venera',1,0.00),(2058,132,'SIG','Siggiewi',1,0.00),(2059,132,'SLM','Sliema',1,0.00),(2060,132,'SWQ','Swieqi',1,0.00),(2061,132,'TXB','Ta Xbiex',1,0.00),(2062,132,'TRX','Tarxien',1,0.00),(2063,132,'VLT','Valletta',1,0.00),(2064,132,'XGJ','Xgajra',1,0.00),(2065,132,'ZBR','Zabbar',1,0.00),(2066,132,'ZBG','Zebbug',1,0.00),(2067,132,'ZJT','Zejtun',1,0.00),(2068,132,'ZRQ','Zurrieq',1,0.00),(2069,132,'FNT','Fontana',1,0.00),(2070,132,'GHJ','Ghajnsielem',1,0.00),(2071,132,'GHR','Gharb',1,0.00),(2072,132,'GHS','Ghasri',1,0.00),(2073,132,'KRC','Kercem',1,0.00),(2074,132,'MUN','Munxar',1,0.00),(2075,132,'NAD','Nadur',1,0.00),(2076,132,'QAL','Qala',1,0.00),(2077,132,'VIC','Victoria',1,0.00),(2078,132,'SLA','San Lawrenz',1,0.00),(2079,132,'SNT','Sannat',1,0.00),(2080,132,'ZAG','Xagra',1,0.00),(2081,132,'XEW','Xewkija',1,0.00),(2082,132,'ZEB','Zebbug',1,0.00),(2083,133,'ALG','Ailinginae',1,0.00),(2084,133,'ALL','Ailinglaplap',1,0.00),(2085,133,'ALK','Ailuk',1,0.00),(2086,133,'ARN','Arno',1,0.00),(2087,133,'AUR','Aur',1,0.00),(2088,133,'BKR','Bikar',1,0.00),(2089,133,'BKN','Bikini',1,0.00),(2090,133,'BKK','Bokak',1,0.00),(2091,133,'EBN','Ebon',1,0.00),(2092,133,'ENT','Enewetak',1,0.00),(2093,133,'EKB','Erikub',1,0.00),(2094,133,'JBT','Jabat',1,0.00),(2095,133,'JLT','Jaluit',1,0.00),(2096,133,'JEM','Jemo',1,0.00),(2097,133,'KIL','Kili',1,0.00),(2098,133,'KWJ','Kwajalein',1,0.00),(2099,133,'LAE','Lae',1,0.00),(2100,133,'LIB','Lib',1,0.00),(2101,133,'LKP','Likiep',1,0.00),(2102,133,'MJR','Majuro',1,0.00),(2103,133,'MLP','Maloelap',1,0.00),(2104,133,'MJT','Mejit',1,0.00),(2105,133,'MIL','Mili',1,0.00),(2106,133,'NMK','Namorik',1,0.00),(2107,133,'NAM','Namu',1,0.00),(2108,133,'RGL','Rongelap',1,0.00),(2109,133,'RGK','Rongrik',1,0.00),(2110,133,'TOK','Toke',1,0.00),(2111,133,'UJA','Ujae',1,0.00),(2112,133,'UJL','Ujelang',1,0.00),(2113,133,'UTK','Utirik',1,0.00),(2114,133,'WTH','Wotho',1,0.00),(2115,133,'WTJ','Wotje',1,0.00),(2116,135,'AD','Adrar',1,0.00),(2117,135,'AS','Assaba',1,0.00),(2118,135,'BR','Brakna',1,0.00),(2119,135,'DN','Dakhlet Nouadhibou',1,0.00),(2120,135,'GO','Gorgol',1,0.00),(2121,135,'GM','Guidimaka',1,0.00),(2122,135,'HC','Hodh Ech Chargui',1,0.00),(2123,135,'HG','Hodh El Gharbi',1,0.00),(2124,135,'IN','Inchiri',1,0.00),(2125,135,'TA','Tagant',1,0.00),(2126,135,'TZ','Tiris Zemmour',1,0.00),(2127,135,'TR','Trarza',1,0.00),(2128,135,'NO','Nouakchott',1,0.00),(2129,136,'BR','Beau Bassin-Rose Hill',1,0.00),(2130,136,'CU','Curepipe',1,0.00),(2131,136,'PU','Port Louis',1,0.00),(2132,136,'QB','Quatre Bornes',1,0.00),(2133,136,'VP','Vacoas-Phoenix',1,0.00),(2134,136,'AG','Agalega Islands',1,0.00),(2135,136,'CC','Cargados Carajos Shoals (Saint Brandon Islands)',1,0.00),(2136,136,'RO','Rodrigues',1,0.00),(2137,136,'BL','Black River',1,0.00),(2138,136,'FL','Flacq',1,0.00),(2139,136,'GP','Grand Port',1,0.00),(2140,136,'MO','Moka',1,0.00),(2141,136,'PA','Pamplemousses',1,0.00),(2142,136,'PW','Plaines Wilhems',1,0.00),(2143,136,'PL','Port Louis',1,0.00),(2144,136,'RR','Riviere du Rempart',1,0.00),(2145,136,'SA','Savanne',1,0.00),(2146,138,'BN','Baja California Norte',1,0.00),(2147,138,'BS','Baja California Sur',1,0.00),(2148,138,'CA','Campeche',1,0.00),(2149,138,'CI','Chiapas',1,0.00),(2150,138,'CH','Chihuahua',1,0.00),(2151,138,'CZ','Coahuila de Zaragoza',1,0.00),(2152,138,'CL','Colima',1,0.00),(2153,138,'DF','Distrito Federal',1,0.00),(2154,138,'DU','Durango',1,0.00),(2155,138,'GA','Guanajuato',1,0.00),(2156,138,'GE','Guerrero',1,0.00),(2157,138,'HI','Hidalgo',1,0.00),(2158,138,'JA','Jalisco',1,0.00),(2159,138,'ME','Mexico',1,0.00),(2160,138,'MI','Michoacan de Ocampo',1,0.00),(2161,138,'MO','Morelos',1,0.00),(2162,138,'NA','Nayarit',1,0.00),(2163,138,'NL','Nuevo Leon',1,0.00),(2164,138,'OA','Oaxaca',1,0.00),(2165,138,'PU','Puebla',1,0.00),(2166,138,'QA','Queretaro de Arteaga',1,0.00),(2167,138,'QR','Quintana Roo',1,0.00),(2168,138,'SA','San Luis Potosi',1,0.00),(2169,138,'SI','Sinaloa',1,0.00),(2170,138,'SO','Sonora',1,0.00),(2171,138,'TB','Tabasco',1,0.00),(2172,138,'TM','Tamaulipas',1,0.00),(2173,138,'TL','Tlaxcala',1,0.00),(2174,138,'VE','Veracruz-Llave',1,0.00),(2175,138,'YU','Yucatan',1,0.00),(2176,138,'ZA','Zacatecas',1,0.00),(2177,139,'C','Chuuk',1,0.00),(2178,139,'K','Kosrae',1,0.00),(2179,139,'P','Pohnpei',1,0.00),(2180,139,'Y','Yap',1,0.00),(2181,140,'GA','Gagauzia',1,0.00),(2182,140,'CU','Chisinau',1,0.00),(2183,140,'BA','Balti',1,0.00),(2184,140,'CA','Cahul',1,0.00),(2185,140,'ED','Edinet',1,0.00),(2186,140,'LA','Lapusna',1,0.00),(2187,140,'OR','Orhei',1,0.00),(2188,140,'SO','Soroca',1,0.00),(2189,140,'TI','Tighina',1,0.00),(2190,140,'UN','Ungheni',1,0.00),(2191,140,'SN','St‚Äönga Nistrului',1,0.00),(2192,141,'FV','Fontvieille',1,0.00),(2193,141,'LC','La Condamine',1,0.00),(2194,141,'MV','Monaco-Ville',1,0.00),(2195,141,'MC','Monte-Carlo',1,0.00),(2196,142,'1','Ulanbaatar',1,0.00),(2197,142,'035','Orhon',1,0.00),(2198,142,'037','Darhan uul',1,0.00),(2199,142,'039','Hentiy',1,0.00),(2200,142,'041','Hovsgol',1,0.00),(2201,142,'043','Hovd',1,0.00),(2202,142,'046','Uvs',1,0.00),(2203,142,'047','Tov',1,0.00),(2204,142,'049','Selenge',1,0.00),(2205,142,'051','Suhbaatar',1,0.00),(2206,142,'053','Omnogovi',1,0.00),(2207,142,'055','Ovorhangay',1,0.00),(2208,142,'057','Dzavhan',1,0.00),(2209,142,'059','DundgovL',1,0.00),(2210,142,'061','Dornod',1,0.00),(2211,142,'063','Dornogov',1,0.00),(2212,142,'064','Govi-Sumber',1,0.00),(2213,142,'065','Govi-Altay',1,0.00),(2214,142,'067','Bulgan',1,0.00),(2215,142,'069','Bayanhongor',1,0.00),(2216,142,'071','Bayan-Olgiy',1,0.00),(2217,142,'073','Arhangay',1,0.00),(2218,143,'A','Saint Anthony',1,0.00),(2219,143,'G','Saint Georges',1,0.00),(2220,143,'P','Saint Peter',1,0.00),(2221,144,'AGD','Agadir',1,0.00),(2222,144,'HOC','Al Hoceima',1,0.00),(2223,144,'AZI','Azilal',1,0.00),(2224,144,'BME','Beni Mellal',1,0.00),(2225,144,'BSL','Ben Slimane',1,0.00),(2226,144,'BLM','Boulemane',1,0.00),(2227,144,'CBL','Casablanca',1,0.00),(2228,144,'CHA','Chaouen',1,0.00),(2229,144,'EJA','El Jadida',1,0.00),(2230,144,'EKS','El Kelaa des Sraghna',1,0.00),(2231,144,'ERA','Er Rachidia',1,0.00),(2232,144,'ESS','Essaouira',1,0.00),(2233,144,'FES','Fes',1,0.00),(2234,144,'FIG','Figuig',1,0.00),(2235,144,'GLM','Guelmim',1,0.00),(2236,144,'IFR','Ifrane',1,0.00),(2237,144,'KEN','Kenitra',1,0.00),(2238,144,'KHM','Khemisset',1,0.00),(2239,144,'KHN','Khenifra',1,0.00),(2240,144,'KHO','Khouribga',1,0.00),(2241,144,'LYN','Laayoune',1,0.00),(2242,144,'LAR','Larache',1,0.00),(2243,144,'MRK','Marrakech',1,0.00),(2244,144,'MKN','Meknes',1,0.00),(2245,144,'NAD','Nador',1,0.00),(2246,144,'ORZ','Ouarzazate',1,0.00),(2247,144,'OUJ','Oujda',1,0.00),(2248,144,'RSA','Rabat-Sale',1,0.00),(2249,144,'SAF','Safi',1,0.00),(2250,144,'SET','Settat',1,0.00),(2251,144,'SKA','Sidi Kacem',1,0.00),(2252,144,'TGR','Tangier',1,0.00),(2253,144,'TAN','Tan-Tan',1,0.00),(2254,144,'TAO','Taounate',1,0.00),(2255,144,'TRD','Taroudannt',1,0.00),(2256,144,'TAT','Tata',1,0.00),(2257,144,'TAZ','Taza',1,0.00),(2258,144,'TET','Tetouan',1,0.00),(2259,144,'TIZ','Tiznit',1,0.00),(2260,144,'ADK','Ad Dakhla',1,0.00),(2261,144,'BJD','Boujdour',1,0.00),(2262,144,'ESM','Es Smara',1,0.00),(2263,145,'CD','Cabo Delgado',1,0.00),(2264,145,'GZ','Gaza',1,0.00),(2265,145,'IN','Inhambane',1,0.00),(2266,145,'MN','Manica',1,0.00),(2267,145,'MC','Maputo (city)',1,0.00),(2268,145,'MP','Maputo',1,0.00),(2269,145,'NA','Nampula',1,0.00),(2270,145,'NI','Niassa',1,0.00),(2271,145,'SO','Sofala',1,0.00),(2272,145,'TE','Tete',1,0.00),(2273,145,'ZA','Zambezia',1,0.00),(2274,146,'AY','Ayeyarwady',1,0.00),(2275,146,'BG','Bago',1,0.00),(2276,146,'MG','Magway',1,0.00),(2277,146,'MD','Mandalay',1,0.00),(2278,146,'SG','Sagaing',1,0.00),(2279,146,'TN','Tanintharyi',1,0.00),(2280,146,'YG','Yangon',1,0.00),(2281,146,'CH','Chin State',1,0.00),(2282,146,'KC','Kachin State',1,0.00),(2283,146,'KH','Kayah State',1,0.00),(2284,146,'KN','Kayin State',1,0.00),(2285,146,'MN','Mon State',1,0.00),(2286,146,'RK','Rakhine State',1,0.00),(2287,146,'SH','Shan State',1,0.00),(2288,147,'CA','Caprivi',1,0.00),(2289,147,'ER','Erongo',1,0.00),(2290,147,'HA','Hardap',1,0.00),(2291,147,'KR','Karas',1,0.00),(2292,147,'KV','Kavango',1,0.00),(2293,147,'KH','Khomas',1,0.00),(2294,147,'KU','Kunene',1,0.00),(2295,147,'OW','Ohangwena',1,0.00),(2296,147,'OK','Omaheke',1,0.00),(2297,147,'OT','Omusati',1,0.00),(2298,147,'ON','Oshana',1,0.00),(2299,147,'OO','Oshikoto',1,0.00),(2300,147,'OJ','Otjozondjupa',1,0.00),(2301,148,'AO','Aiwo',1,0.00),(2302,148,'AA','Anabar',1,0.00),(2303,148,'AT','Anetan',1,0.00),(2304,148,'AI','Anibare',1,0.00),(2305,148,'BA','Baiti',1,0.00),(2306,148,'BO','Boe',1,0.00),(2307,148,'BU','Buada',1,0.00),(2308,148,'DE','Denigomodu',1,0.00),(2309,148,'EW','Ewa',1,0.00),(2310,148,'IJ','Ijuw',1,0.00),(2311,148,'ME','Meneng',1,0.00),(2312,148,'NI','Nibok',1,0.00),(2313,148,'UA','Uaboe',1,0.00),(2314,148,'YA','Yaren',1,0.00),(2315,149,'BA','Bagmati',1,0.00),(2316,149,'BH','Bheri',1,0.00),(2317,149,'DH','Dhawalagiri',1,0.00),(2318,149,'GA','Gandaki',1,0.00),(2319,149,'JA','Janakpur',1,0.00),(2320,149,'KA','Karnali',1,0.00),(2321,149,'KO','Kosi',1,0.00),(2322,149,'LU','Lumbini',1,0.00),(2323,149,'MA','Mahakali',1,0.00),(2324,149,'ME','Mechi',1,0.00),(2325,149,'NA','Narayani',1,0.00),(2326,149,'RA','Rapti',1,0.00),(2327,149,'SA','Sagarmatha',1,0.00),(2328,149,'SE','Seti',1,0.00),(2329,150,'DR','Drenthe',1,0.00),(2330,150,'FL','Flevoland',1,0.00),(2331,150,'FR','Friesland',1,0.00),(2332,150,'GE','Gelderland',1,0.00),(2333,150,'GR','Groningen',1,0.00),(2334,150,'LI','Limburg',1,0.00),(2335,150,'NB','Noord Brabant',1,0.00),(2336,150,'NH','Noord Holland',1,0.00),(2337,150,'OV','Overijssel',1,0.00),(2338,150,'UT','Utrecht',1,0.00),(2339,150,'ZE','Zeeland',1,0.00),(2340,150,'ZH','Zuid Holland',1,0.00),(2341,152,'L','Iles Loyaute',1,0.00),(2342,152,'N','Nord',1,0.00),(2343,152,'S','Sud',1,0.00),(2344,153,'AUK','Auckland',1,0.00),(2345,153,'BOP','Bay of Plenty',1,0.00),(2346,153,'CAN','Canterbury',1,0.00),(2347,153,'COR','Coromandel',1,0.00),(2348,153,'GIS','Gisborne',1,0.00),(2349,153,'FIO','Fiordland',1,0.00),(2350,153,'HKB','Hawke\\s Bay',1,0.00),(2351,153,'MBH','Marlborough',1,0.00),(2352,153,'MWT','Manawatu-Wanganui',1,0.00),(2353,153,'MCM','Mt Cook-Mackenzie',1,0.00),(2354,153,'NSN','Nelson',1,0.00),(2355,153,'NTL','Northland',1,0.00),(2356,153,'OTA','Otago',1,0.00),(2357,153,'STL','Southland',1,0.00),(2358,153,'TKI','Taranaki',1,0.00),(2359,153,'WGN','Wellington',1,0.00),(2360,153,'WKO','Waikato',1,0.00),(2361,153,'WAI','Wairprarapa',1,0.00),(2362,153,'WTC','West Coast',1,0.00),(2363,154,'AN','Atlantico Norte',1,0.00),(2364,154,'AS','Atlantico Sur',1,0.00),(2365,154,'BO','Boaco',1,0.00),(2366,154,'CA','Carazo',1,0.00),(2367,154,'CI','Chinandega',1,0.00),(2368,154,'CO','Chontales',1,0.00),(2369,154,'ES','Esteli',1,0.00),(2370,154,'GR','Granada',1,0.00),(2371,154,'JI','Jinotega',1,0.00),(2372,154,'LE','Leon',1,0.00),(2373,154,'MD','Madriz',1,0.00),(2374,154,'MN','Managua',1,0.00),(2375,154,'MS','Masaya',1,0.00),(2376,154,'MT','Matagalpa',1,0.00),(2377,154,'NS','Nuevo Segovia',1,0.00),(2378,154,'RS','Rio San Juan',1,0.00),(2379,154,'RI','Rivas',1,0.00),(2380,155,'AG','Agadez',1,0.00),(2381,155,'DF','Diffa',1,0.00),(2382,155,'DS','Dosso',1,0.00),(2383,155,'MA','Maradi',1,0.00),(2384,155,'NM','Niamey',1,0.00),(2385,155,'TH','Tahoua',1,0.00),(2386,155,'TL','Tillaberi',1,0.00),(2387,155,'ZD','Zinder',1,0.00),(2388,156,'AB','Abia',1,0.00),(2389,156,'CT','Abuja Federal Capital Territory',1,0.00),(2390,156,'AD','Adamawa',1,0.00),(2391,156,'AK','Akwa Ibom',1,0.00),(2392,156,'AN','Anambra',1,0.00),(2393,156,'BC','Bauchi',1,0.00),(2394,156,'BY','Bayelsa',1,0.00),(2395,156,'BN','Benue',1,0.00),(2396,156,'BO','Borno',1,0.00),(2397,156,'CR','Cross River',1,0.00),(2398,156,'DE','Delta',1,0.00),(2399,156,'EB','Ebonyi',1,0.00),(2400,156,'ED','Edo',1,0.00),(2401,156,'EK','Ekiti',1,0.00),(2402,156,'EN','Enugu',1,0.00),(2403,156,'GO','Gombe',1,0.00),(2404,156,'IM','Imo',1,0.00),(2405,156,'JI','Jigawa',1,0.00),(2406,156,'KD','Kaduna',1,0.00),(2407,156,'KN','Kano',1,0.00),(2408,156,'KT','Katsina',1,0.00),(2409,156,'KE','Kebbi',1,0.00),(2410,156,'KO','Kogi',1,0.00),(2411,156,'KW','Kwara',1,0.00),(2412,156,'LA','Lagos',1,0.00),(2413,156,'NA','Nassarawa',1,0.00),(2414,156,'NI','Niger',1,0.00),(2415,156,'OG','Ogun',1,0.00),(2416,156,'ONG','Ondo',1,0.00),(2417,156,'OS','Osun',1,0.00),(2418,156,'OY','Oyo',1,0.00),(2419,156,'PL','Plateau',1,0.00),(2420,156,'RI','Rivers',1,0.00),(2421,156,'SO','Sokoto',1,0.00),(2422,156,'TA','Taraba',1,0.00),(2423,156,'YO','Yobe',1,0.00),(2424,156,'ZA','Zamfara',1,0.00),(2425,159,'N','Northern Islands',1,0.00),(2426,159,'R','Rota',1,0.00),(2427,159,'S','Saipan',1,0.00),(2428,159,'T','Tinian',1,0.00),(2429,160,'AK','Akershus',1,0.00),(2430,160,'AA','Aust-Agder',1,0.00),(2431,160,'BU','Buskerud',1,0.00),(2432,160,'FM','Finnmark',1,0.00),(2433,160,'HM','Hedmark',1,0.00),(2434,160,'HL','Hordaland',1,0.00),(2435,160,'MR','More og Romdal',1,0.00),(2436,160,'NT','Nord-Trondelag',1,0.00),(2437,160,'NL','Nordland',1,0.00),(2438,160,'OF','Ostfold',1,0.00),(2439,160,'OP','Oppland',1,0.00),(2440,160,'OL','Oslo',1,0.00),(2441,160,'RL','Rogaland',1,0.00),(2442,160,'ST','Sor-Trondelag',1,0.00),(2443,160,'SJ','Sogn og Fjordane',1,0.00),(2444,160,'SV','Svalbard',1,0.00),(2445,160,'TM','Telemark',1,0.00),(2446,160,'TR','Troms',1,0.00),(2447,160,'VA','Vest-Agder',1,0.00),(2448,160,'VF','Vestfold',1,0.00),(2449,161,'DA','Ad Dakhiliyah',1,0.00),(2450,161,'BA','Al Batinah',1,0.00),(2451,161,'WU','Al Wusta',1,0.00),(2452,161,'SH','Ash Sharqiyah',1,0.00),(2453,161,'ZA','Az Zahirah',1,0.00),(2454,161,'MA','Masqat',1,0.00),(2455,161,'MU','Musandam',1,0.00),(2456,161,'ZU','Zufar',1,0.00),(2457,162,'B','Balochistan',1,0.00),(2458,162,'T','Federally Administered Tribal Areas',1,0.00),(2459,162,'I','Islamabad Capital Territory',1,0.00),(2460,162,'N','North-West Frontier',1,0.00),(2461,162,'P','Punjab',1,0.00),(2462,162,'S','Sindh',1,0.00),(2463,163,'AM','Aimeliik',1,0.00),(2464,163,'AR','Airai',1,0.00),(2465,163,'AN','Angaur',1,0.00),(2466,163,'HA','Hatohobei',1,0.00),(2467,163,'KA','Kayangel',1,0.00),(2468,163,'KO','Koror',1,0.00),(2469,163,'ME','Melekeok',1,0.00),(2470,163,'NA','Ngaraard',1,0.00),(2471,163,'NG','Ngarchelong',1,0.00),(2472,163,'ND','Ngardmau',1,0.00),(2473,163,'NT','Ngatpang',1,0.00),(2474,163,'NC','Ngchesar',1,0.00),(2475,163,'NR','Ngeremlengui',1,0.00),(2476,163,'NW','Ngiwal',1,0.00),(2477,163,'PE','Peleliu',1,0.00),(2478,163,'SO','Sonsorol',1,0.00),(2479,164,'BT','Bocas del Toro',1,0.00),(2480,164,'CH','Chiriqui',1,0.00),(2481,164,'CC','Cocle',1,0.00),(2482,164,'CL','Colon',1,0.00),(2483,164,'DA','Darien',1,0.00),(2484,164,'HE','Herrera',1,0.00),(2485,164,'LS','Los Santos',1,0.00),(2486,164,'PA','Panama',1,0.00),(2487,164,'SB','San Blas',1,0.00),(2488,164,'VG','Veraguas',1,0.00),(2489,165,'BV','Bougainville',1,0.00),(2490,165,'CE','Central',1,0.00),(2491,165,'CH','Chimbu',1,0.00),(2492,165,'EH','Eastern Highlands',1,0.00),(2493,165,'EB','East New Britain',1,0.00),(2494,165,'ES','East Sepik',1,0.00),(2495,165,'EN','Enga',1,0.00),(2496,165,'GU','Gulf',1,0.00),(2497,165,'MD','Madang',1,0.00),(2498,165,'MN','Manus',1,0.00),(2499,165,'MB','Milne Bay',1,0.00),(2500,165,'MR','Morobe',1,0.00),(2501,165,'NC','National Capital',1,0.00),(2502,165,'NI','New Ireland',1,0.00),(2503,165,'NO','Northern',1,0.00),(2504,165,'SA','Sandaun',1,0.00),(2505,165,'SH','Southern Highlands',1,0.00),(2506,165,'WE','Western',1,0.00),(2507,165,'WH','Western Highlands',1,0.00),(2508,165,'WB','West New Britain',1,0.00),(2509,166,'AG','Alto Paraguay',1,0.00),(2510,166,'AN','Alto Parana',1,0.00),(2511,166,'AM','Amambay',1,0.00),(2512,166,'AS','Asuncion',1,0.00),(2513,166,'BO','Boqueron',1,0.00),(2514,166,'CG','Caaguazu',1,0.00),(2515,166,'CZ','Caazapa',1,0.00),(2516,166,'CN','Canindeyu',1,0.00),(2517,166,'CE','Central',1,0.00),(2518,166,'CC','Concepcion',1,0.00),(2519,166,'CD','Cordillera',1,0.00),(2520,166,'GU','Guaira',1,0.00),(2521,166,'IT','Itapua',1,0.00),(2522,166,'MI','Misiones',1,0.00),(2523,166,'NE','Neembucu',1,0.00),(2524,166,'PA','Paraguari',1,0.00),(2525,166,'PH','Presidente Hayes',1,0.00),(2526,166,'SP','San Pedro',1,0.00),(2527,167,'AM','Amazonas',1,0.00),(2528,167,'AN','Ancash',1,0.00),(2529,167,'AP','Apurimac',1,0.00),(2530,167,'AR','Arequipa',1,0.00),(2531,167,'AY','Ayacucho',1,0.00),(2532,167,'CJ','Cajamarca',1,0.00),(2533,167,'CL','Callao',1,0.00),(2534,167,'CU','Cusco',1,0.00),(2535,167,'HV','Huancavelica',1,0.00),(2536,167,'HO','Huanuco',1,0.00),(2537,167,'IC','Ica',1,0.00),(2538,167,'JU','Junin',1,0.00),(2539,167,'LD','La Libertad',1,0.00),(2540,167,'LY','Lambayeque',1,0.00),(2541,167,'LI','Lima',1,0.00),(2542,167,'LO','Loreto',1,0.00),(2543,167,'MD','Madre de Dios',1,0.00),(2544,167,'MO','Moquegua',1,0.00),(2545,167,'PA','Pasco',1,0.00),(2546,167,'PI','Piura',1,0.00),(2547,167,'PU','Puno',1,0.00),(2548,167,'SM','San Martin',1,0.00),(2549,167,'TA','Tacna',1,0.00),(2550,167,'TU','Tumbes',1,0.00),(2551,167,'UC','Ucayali',1,0.00),(2552,168,'ABR','Abra',1,0.00),(2553,168,'ANO','Agusan del Norte',1,0.00),(2554,168,'ASU','Agusan del Sur',1,0.00),(2555,168,'AKL','Aklan',1,0.00),(2556,168,'ALB','Albay',1,0.00),(2557,168,'ANT','Antique',1,0.00),(2558,168,'APY','Apayao',1,0.00),(2559,168,'AUR','Aurora',1,0.00),(2560,168,'BAS','Basilan',1,0.00),(2561,168,'BTA','Bataan',1,0.00),(2562,168,'BTE','Batanes',1,0.00),(2563,168,'BTG','Batangas',1,0.00),(2564,168,'BLR','Biliran',1,0.00),(2565,168,'BEN','Benguet',1,0.00),(2566,168,'BOL','Bohol',1,0.00),(2567,168,'BUK','Bukidnon',1,0.00),(2568,168,'BUL','Bulacan',1,0.00),(2569,168,'CAG','Cagayan',1,0.00),(2570,168,'CNO','Camarines Norte',1,0.00),(2571,168,'CSU','Camarines Sur',1,0.00),(2572,168,'CAM','Camiguin',1,0.00),(2573,168,'CAP','Capiz',1,0.00),(2574,168,'CAT','Catanduanes',1,0.00),(2575,168,'CAV','Cavite',1,0.00),(2576,168,'CEB','Cebu',1,0.00),(2577,168,'CMP','Compostela',1,0.00),(2578,168,'DNO','Davao del Norte',1,0.00),(2579,168,'DSU','Davao del Sur',1,0.00),(2580,168,'DOR','Davao Oriental',1,0.00),(2581,168,'ESA','Eastern Samar',1,0.00),(2582,168,'GUI','Guimaras',1,0.00),(2583,168,'IFU','Ifugao',1,0.00),(2584,168,'INO','Ilocos Norte',1,0.00),(2585,168,'ISU','Ilocos Sur',1,0.00),(2586,168,'ILO','Iloilo',1,0.00),(2587,168,'ISA','Isabela',1,0.00),(2588,168,'KAL','Kalinga',1,0.00),(2589,168,'LAG','Laguna',1,0.00),(2590,168,'LNO','Lanao del Norte',1,0.00),(2591,168,'LSU','Lanao del Sur',1,0.00),(2592,168,'UNI','La Union',1,0.00),(2593,168,'LEY','Leyte',1,0.00),(2594,168,'MAG','Maguindanao',1,0.00),(2595,168,'MRN','Marinduque',1,0.00),(2596,168,'MSB','Masbate',1,0.00),(2597,168,'MIC','Mindoro Occidental',1,0.00),(2598,168,'MIR','Mindoro Oriental',1,0.00),(2599,168,'MSC','Misamis Occidental',1,0.00),(2600,168,'MOR','Misamis Oriental',1,0.00),(2601,168,'MOP','Mountain',1,0.00),(2602,168,'NOC','Negros Occidental',1,0.00),(2603,168,'NOR','Negros Oriental',1,0.00),(2604,168,'NCT','North Cotabato',1,0.00),(2605,168,'NSM','Northern Samar',1,0.00),(2606,168,'NEC','Nueva Ecija',1,0.00),(2607,168,'NVZ','Nueva Vizcaya',1,0.00),(2608,168,'PLW','Palawan',1,0.00),(2609,168,'PMP','Pampanga',1,0.00),(2610,168,'PNG','Pangasinan',1,0.00),(2611,168,'QZN','Quezon',1,0.00),(2612,168,'QRN','Quirino',1,0.00),(2613,168,'RIZ','Rizal',1,0.00),(2614,168,'ROM','Romblon',1,0.00),(2615,168,'SMR','Samar',1,0.00),(2616,168,'SRG','Sarangani',1,0.00),(2617,168,'SQJ','Siquijor',1,0.00),(2618,168,'SRS','Sorsogon',1,0.00),(2619,168,'SCO','South Cotabato',1,0.00),(2620,168,'SLE','Southern Leyte',1,0.00),(2621,168,'SKU','Sultan Kudarat',1,0.00),(2622,168,'SLU','Sulu',1,0.00),(2623,168,'SNO','Surigao del Norte',1,0.00),(2624,168,'SSU','Surigao del Sur',1,0.00),(2625,168,'TAR','Tarlac',1,0.00),(2626,168,'TAW','Tawi-Tawi',1,0.00),(2627,168,'ZBL','Zambales',1,0.00),(2628,168,'ZNO','Zamboanga del Norte',1,0.00),(2629,168,'ZSU','Zamboanga del Sur',1,0.00),(2630,168,'ZSI','Zamboanga Sibugay',1,0.00),(2631,170,'DO','Dolnoslaskie',1,0.00),(2632,170,'KP','Kujawsko-Pomorskie',1,0.00),(2633,170,'LO','Lodzkie',1,0.00),(2634,170,'LL','Lubelskie',1,0.00),(2635,170,'LU','Lubuskie',1,0.00),(2636,170,'ML','Malopolskie',1,0.00),(2637,170,'MZ','Mazowieckie',1,0.00),(2638,170,'OP','Opolskie',1,0.00),(2639,170,'PP','Podkarpackie',1,0.00),(2640,170,'PL','Podlaskie',1,0.00),(2641,170,'PM','Pomorskie',1,0.00),(2642,170,'SL','Slaskie',1,0.00),(2643,170,'SW','Swietokrzyskie',1,0.00),(2644,170,'WM','Warminsko-Mazurskie',1,0.00),(2645,170,'WP','Wielkopolskie',1,0.00),(2646,170,'ZA','Zachodniopomorskie',1,0.00),(2647,198,'P','Saint Pierre',1,0.00),(2648,198,'M','Miquelon',1,0.00),(2649,171,'AC','A&ccedil;ores',1,0.00),(2650,171,'AV','Aveiro',1,0.00),(2651,171,'BE','Beja',1,0.00),(2652,171,'BR','Braga',1,0.00),(2653,171,'BA','Bragan&ccedil;a',1,0.00),(2654,171,'CB','Castelo Branco',1,0.00),(2655,171,'CO','Coimbra',1,0.00),(2656,171,'EV','&Eacute;vora',1,0.00),(2657,171,'FA','Faro',1,0.00),(2658,171,'GU','Guarda',1,0.00),(2659,171,'LE','Leiria',1,0.00),(2660,171,'LI','Lisboa',1,0.00),(2661,171,'ME','Madeira',1,0.00),(2662,171,'PO','Portalegre',1,0.00),(2663,171,'PR','Porto',1,0.00),(2664,171,'SA','Santar&eacute;m',1,0.00),(2665,171,'SE','Set&uacute;bal',1,0.00),(2666,171,'VC','Viana do Castelo',1,0.00),(2667,171,'VR','Vila Real',1,0.00),(2668,171,'VI','Viseu',1,0.00),(2669,173,'DW','Ad Dawhah',1,0.00),(2670,173,'GW','Al Ghuwayriyah',1,0.00),(2671,173,'JM','Al Jumayliyah',1,0.00),(2672,173,'KR','Al Khawr',1,0.00),(2673,173,'WK','Al Wakrah',1,0.00),(2674,173,'RN','Ar Rayyan',1,0.00),(2675,173,'JB','Jarayan al Batinah',1,0.00),(2676,173,'MS','Madinat ash Shamal',1,0.00),(2677,173,'UD','Umm Sa\\id',1,0.00),(2678,173,'UL','Umm Salal',1,0.00),(2679,175,'AB','Alba',1,0.00),(2680,175,'AR','Arad',1,0.00),(2681,175,'AG','Arges',1,0.00),(2682,175,'BC','Bacau',1,0.00),(2683,175,'BH','Bihor',1,0.00),(2684,175,'BN','Bistrita-Nasaud',1,0.00),(2685,175,'BT','Botosani',1,0.00),(2686,175,'BV','Brasov',1,0.00),(2687,175,'BR','Braila',1,0.00),(2688,175,'B','Bucuresti',1,0.00),(2689,175,'BZ','Buzau',1,0.00),(2690,175,'CS','Caras-Severin',1,0.00),(2691,175,'CL','Calarasi',1,0.00),(2692,175,'CJ','Cluj',1,0.00),(2693,175,'CT','Constanta',1,0.00),(2694,175,'CV','Covasna',1,0.00),(2695,175,'DB','Dimbovita',1,0.00),(2696,175,'DJ','Dolj',1,0.00),(2697,175,'GL','Galati',1,0.00),(2698,175,'GR','Giurgiu',1,0.00),(2699,175,'GJ','Gorj',1,0.00),(2700,175,'HR','Harghita',1,0.00),(2701,175,'HD','Hunedoara',1,0.00),(2702,175,'IL','Ialomita',1,0.00),(2703,175,'IS','Iasi',1,0.00),(2704,175,'IF','Ilfov',1,0.00),(2705,175,'MM','Maramures',1,0.00),(2706,175,'MH','Mehedinti',1,0.00),(2707,175,'MS','Mures',1,0.00),(2708,175,'NT','Neamt',1,0.00),(2709,175,'OT','Olt',1,0.00),(2710,175,'PH','Prahova',1,0.00),(2711,175,'SM','Satu-Mare',1,0.00),(2712,175,'SJ','Salaj',1,0.00),(2713,175,'SB','Sibiu',1,0.00),(2714,175,'SV','Suceava',1,0.00),(2715,175,'TR','Teleorman',1,0.00),(2716,175,'TM','Timis',1,0.00),(2717,175,'TL','Tulcea',1,0.00),(2718,175,'VS','Vaslui',1,0.00),(2719,175,'VL','Valcea',1,0.00),(2720,175,'VN','Vrancea',1,0.00),(2721,176,'AB','Abakan',1,0.00),(2722,176,'AG','Aginskoye',1,0.00),(2723,176,'AN','Anadyr',1,0.00),(2724,176,'AR','Arkahangelsk',1,0.00),(2725,176,'AS','Astrakhan',1,0.00),(2726,176,'BA','Barnaul',1,0.00),(2727,176,'BE','Belgorod',1,0.00),(2728,176,'BI','Birobidzhan',1,0.00),(2729,176,'BL','Blagoveshchensk',1,0.00),(2730,176,'BR','Bryansk',1,0.00),(2731,176,'CH','Cheboksary',1,0.00),(2732,176,'CL','Chelyabinsk',1,0.00),(2733,176,'CR','Cherkessk',1,0.00),(2734,176,'CI','Chita',1,0.00),(2735,176,'DU','Dudinka',1,0.00),(2736,176,'EL','Elista',1,0.00),(2737,176,'GO','Gomo-Altaysk',1,0.00),(2738,176,'GA','Gorno-Altaysk',1,0.00),(2739,176,'GR','Groznyy',1,0.00),(2740,176,'IR','Irkutsk',1,0.00),(2741,176,'IV','Ivanovo',1,0.00),(2742,176,'IZ','Izhevsk',1,0.00),(2743,176,'KA','Kalinigrad',1,0.00),(2744,176,'KL','Kaluga',1,0.00),(2745,176,'KS','Kasnodar',1,0.00),(2746,176,'KZ','Kazan',1,0.00),(2747,176,'KE','Kemerovo',1,0.00),(2748,176,'KH','Khabarovsk',1,0.00),(2749,176,'KM','Khanty-Mansiysk',1,0.00),(2750,176,'KO','Kostroma',1,0.00),(2751,176,'KR','Krasnodar',1,0.00),(2752,176,'KN','Krasnoyarsk',1,0.00),(2753,176,'KU','Kudymkar',1,0.00),(2754,176,'KG','Kurgan',1,0.00),(2755,176,'KK','Kursk',1,0.00),(2756,176,'KY','Kyzyl',1,0.00),(2757,176,'LI','Lipetsk',1,0.00),(2758,176,'MA','Magadan',1,0.00),(2759,176,'MK','Makhachkala',1,0.00),(2760,176,'MY','Maykop',1,0.00),(2761,176,'MO','Moscow',1,0.00),(2762,176,'MU','Murmansk',1,0.00),(2763,176,'NA','Nalchik',1,0.00),(2764,176,'NR','Naryan Mar',1,0.00),(2765,176,'NZ','Nazran',1,0.00),(2766,176,'NI','Nizhniy Novgorod',1,0.00),(2767,176,'NO','Novgorod',1,0.00),(2768,176,'NV','Novosibirsk',1,0.00),(2769,176,'OM','Omsk',1,0.00),(2770,176,'OR','Orel',1,0.00),(2771,176,'OE','Orenburg',1,0.00),(2772,176,'PA','Palana',1,0.00),(2773,176,'PE','Penza',1,0.00),(2774,176,'PR','Perm',1,0.00),(2775,176,'PK','Petropavlovsk-Kamchatskiy',1,0.00),(2776,176,'PT','Petrozavodsk',1,0.00),(2777,176,'PS','Pskov',1,0.00),(2778,176,'RO','Rostov-na-Donu',1,0.00),(2779,176,'RY','Ryazan',1,0.00),(2780,176,'SL','Salekhard',1,0.00),(2781,176,'SA','Samara',1,0.00),(2782,176,'SR','Saransk',1,0.00),(2783,176,'SV','Saratov',1,0.00),(2784,176,'SM','Smolensk',1,0.00),(2785,176,'SP','St. Petersburg',1,0.00),(2786,176,'ST','Stavropol',1,0.00),(2787,176,'SY','Syktyvkar',1,0.00),(2788,176,'TA','Tambov',1,0.00),(2789,176,'TO','Tomsk',1,0.00),(2790,176,'TU','Tula',1,0.00),(2791,176,'TR','Tura',1,0.00),(2792,176,'TV','Tver',1,0.00),(2793,176,'TY','Tyumen',1,0.00),(2794,176,'UF','Ufa',1,0.00),(2795,176,'UL','Ul\\yanovsk',1,0.00),(2796,176,'UU','Ulan-Ude',1,0.00),(2797,176,'US','Ust\\-Ordynskiy',1,0.00),(2798,176,'VL','Vladikavkaz',1,0.00),(2799,176,'VA','Vladimir',1,0.00),(2800,176,'VV','Vladivostok',1,0.00),(2801,176,'VG','Volgograd',1,0.00),(2802,176,'VD','Vologda',1,0.00),(2803,176,'VO','Voronezh',1,0.00),(2804,176,'VY','Vyatka',1,0.00),(2805,176,'YA','Yakutsk',1,0.00),(2806,176,'YR','Yaroslavl',1,0.00),(2807,176,'YE','Yekaterinburg',1,0.00),(2808,176,'YO','Yoshkar-Ola',1,0.00),(2809,177,'BU','Butare',1,0.00),(2810,177,'BY','Byumba',1,0.00),(2811,177,'CY','Cyangugu',1,0.00),(2812,177,'GK','Gikongoro',1,0.00),(2813,177,'GS','Gisenyi',1,0.00),(2814,177,'GT','Gitarama',1,0.00),(2815,177,'KG','Kibungo',1,0.00),(2816,177,'KY','Kibuye',1,0.00),(2817,177,'KR','Kigali Rurale',1,0.00),(2818,177,'KV','Kigali-ville',1,0.00),(2819,177,'RU','Ruhengeri',1,0.00),(2820,177,'UM','Umutara',1,0.00),(2821,178,'CCN','Christ Church Nichola Town',1,0.00),(2822,178,'SAS','Saint Anne Sandy Point',1,0.00),(2823,178,'SGB','Saint George Basseterre',1,0.00),(2824,178,'SGG','Saint George Gingerland',1,0.00),(2825,178,'SJW','Saint James Windward',1,0.00),(2826,178,'SJC','Saint John Capesterre',1,0.00),(2827,178,'SJF','Saint John Figtree',1,0.00),(2828,178,'SMC','Saint Mary Cayon',1,0.00),(2829,178,'CAP','Saint Paul Capesterre',1,0.00),(2830,178,'CHA','Saint Paul Charlestown',1,0.00),(2831,178,'SPB','Saint Peter Basseterre',1,0.00),(2832,178,'STL','Saint Thomas Lowland',1,0.00),(2833,178,'STM','Saint Thomas Middle Island',1,0.00),(2834,178,'TPP','Trinity Palmetto Point',1,0.00),(2835,179,'AR','Anse-la-Raye',1,0.00),(2836,179,'CA','Castries',1,0.00),(2837,179,'CH','Choiseul',1,0.00),(2838,179,'DA','Dauphin',1,0.00),(2839,179,'DE','Dennery',1,0.00),(2840,179,'GI','Gros-Islet',1,0.00),(2841,179,'LA','Laborie',1,0.00),(2842,179,'MI','Micoud',1,0.00),(2843,179,'PR','Praslin',1,0.00),(2844,179,'SO','Soufriere',1,0.00),(2845,179,'VF','Vieux-Fort',1,0.00),(2846,180,'C','Charlotte',1,0.00),(2847,180,'R','Grenadines',1,0.00),(2848,180,'A','Saint Andrew',1,0.00),(2849,180,'D','Saint David',1,0.00),(2850,180,'G','Saint George',1,0.00),(2851,180,'P','Saint Patrick',1,0.00),(2852,181,'AN','A\\ana',1,0.00),(2853,181,'AI','Aiga-i-le-Tai',1,0.00),(2854,181,'AT','Atua',1,0.00),(2855,181,'FA','Fa\\asaleleaga',1,0.00),(2856,181,'GE','Gaga\\emauga',1,0.00),(2857,181,'GF','Gagaifomauga',1,0.00),(2858,181,'PA','Palauli',1,0.00),(2859,181,'SA','Satupa\\itea',1,0.00),(2860,181,'TU','Tuamasaga',1,0.00),(2861,181,'VF','Va\\a-o-Fonoti',1,0.00),(2862,181,'VS','Vaisigano',1,0.00),(2863,182,'AC','Acquaviva',1,0.00),(2864,182,'BM','Borgo Maggiore',1,0.00),(2865,182,'CH','Chiesanuova',1,0.00),(2866,182,'DO','Domagnano',1,0.00),(2867,182,'FA','Faetano',1,0.00),(2868,182,'FI','Fiorentino',1,0.00),(2869,182,'MO','Montegiardino',1,0.00),(2870,182,'SM','Citta di San Marino',1,0.00),(2871,182,'SE','Serravalle',1,0.00),(2872,183,'S','Sao Tome',1,0.00),(2873,183,'P','Principe',1,0.00),(2874,184,'BH','Al Bahah',1,0.00),(2875,184,'HS','Al Hudud ash Shamaliyah',1,0.00),(2876,184,'JF','Al Jawf',1,0.00),(2877,184,'MD','Al Madinah',1,0.00),(2878,184,'QS','Al Qasim',1,0.00),(2879,184,'RD','Ar Riyad',1,0.00),(2880,184,'AQ','Ash Sharqiyah (Eastern)',1,0.00),(2881,184,'AS','\\Asir',1,0.00),(2882,184,'HL','Ha\\il',1,0.00),(2883,184,'JZ','Jizan',1,0.00),(2884,184,'ML','Makkah',1,0.00),(2885,184,'NR','Najran',1,0.00),(2886,184,'TB','Tabuk',1,0.00),(2887,185,'DA','Dakar',1,0.00),(2888,185,'DI','Diourbel',1,0.00),(2889,185,'FA','Fatick',1,0.00),(2890,185,'KA','Kaolack',1,0.00),(2891,185,'KO','Kolda',1,0.00),(2892,185,'LO','Louga',1,0.00),(2893,185,'MA','Matam',1,0.00),(2894,185,'SL','Saint-Louis',1,0.00),(2895,185,'TA','Tambacounda',1,0.00),(2896,185,'TH','Thies',1,0.00),(2897,185,'ZI','Ziguinchor',1,0.00),(2898,186,'AP','Anse aux Pins',1,0.00),(2899,186,'AB','Anse Boileau',1,0.00),(2900,186,'AE','Anse Etoile',1,0.00),(2901,186,'AL','Anse Louis',1,0.00),(2902,186,'AR','Anse Royale',1,0.00),(2903,186,'BL','Baie Lazare',1,0.00),(2904,186,'BS','Baie Sainte Anne',1,0.00),(2905,186,'BV','Beau Vallon',1,0.00),(2906,186,'BA','Bel Air',1,0.00),(2907,186,'BO','Bel Ombre',1,0.00),(2908,186,'CA','Cascade',1,0.00),(2909,186,'GL','Glacis',1,0.00),(2910,186,'GM','Grand\\ Anse (on Mahe)',1,0.00),(2911,186,'GP','Grand\\ Anse (on Praslin)',1,0.00),(2912,186,'DG','La Digue',1,0.00),(2913,186,'RA','La Riviere Anglaise',1,0.00),(2914,186,'MB','Mont Buxton',1,0.00),(2915,186,'MF','Mont Fleuri',1,0.00),(2916,186,'PL','Plaisance',1,0.00),(2917,186,'PR','Pointe La Rue',1,0.00),(2918,186,'PG','Port Glaud',1,0.00),(2919,186,'SL','Saint Louis',1,0.00),(2920,186,'TA','Takamaka',1,0.00),(2921,187,'E','Eastern',1,0.00),(2922,187,'N','Northern',1,0.00),(2923,187,'S','Southern',1,0.00),(2924,187,'W','Western',1,0.00),(2925,189,'BA','Banskobystrick√Ω',1,0.00),(2926,189,'BR','Bratislavsk√Ω',1,0.00),(2927,189,'KO','Ko≈°ick√Ω',1,0.00),(2928,189,'NI','Nitriansky',1,0.00),(2929,189,'PR','Pre≈°ovsk√Ω',1,0.00),(2930,189,'TC','Trenƒçiansky',1,0.00),(2931,189,'TV','Trnavsk√Ω',1,0.00),(2932,189,'ZI','≈Ωilinsk√Ω',1,0.00),(2933,191,'CE','Central',1,0.00),(2934,191,'CH','Choiseul',1,0.00),(2935,191,'GC','Guadalcanal',1,0.00),(2936,191,'HO','Honiara',1,0.00),(2937,191,'IS','Isabel',1,0.00),(2938,191,'MK','Makira',1,0.00),(2939,191,'ML','Malaita',1,0.00),(2940,191,'RB','Rennell and Bellona',1,0.00),(2941,191,'TM','Temotu',1,0.00),(2942,191,'WE','Western',1,0.00),(2943,192,'AW','Awdal',1,0.00),(2944,192,'BK','Bakool',1,0.00),(2945,192,'BN','Banaadir',1,0.00),(2946,192,'BR','Bari',1,0.00),(2947,192,'BY','Bay',1,0.00),(2948,192,'GA','Galguduud',1,0.00),(2949,192,'GE','Gedo',1,0.00),(2950,192,'HI','Hiiraan',1,0.00),(2951,192,'JD','Jubbada Dhexe',1,0.00),(2952,192,'JH','Jubbada Hoose',1,0.00),(2953,192,'MU','Mudug',1,0.00),(2954,192,'NU','Nugaal',1,0.00),(2955,192,'SA','Sanaag',1,0.00),(2956,192,'SD','Shabeellaha Dhexe',1,0.00),(2957,192,'SH','Shabeellaha Hoose',1,0.00),(2958,192,'SL','Sool',1,0.00),(2959,192,'TO','Togdheer',1,0.00),(2960,192,'WG','Woqooyi Galbeed',1,0.00),(2961,193,'EC','Eastern Cape',1,0.00),(2962,193,'FS','Free State',1,0.00),(2963,193,'GT','Gauteng',1,0.00),(2964,193,'KN','KwaZulu-Natal',1,0.00),(2965,193,'LP','Limpopo',1,0.00),(2966,193,'MP','Mpumalanga',1,0.00),(2967,193,'NW','North West',1,0.00),(2968,193,'NC','Northern Cape',1,0.00),(2969,193,'WC','Western Cape',1,0.00),(2970,195,'CA','La Coru&ntilde;a',1,0.00),(2971,195,'AL','&Aacute;lava',1,0.00),(2972,195,'AB','Albacete',1,0.00),(2973,195,'AC','Alicante',1,0.00),(2974,195,'AM','Almeria',1,0.00),(2975,195,'AS','Asturias',1,0.00),(2976,195,'AV','&Aacute;vila',1,0.00),(2977,195,'BJ','Badajoz',1,0.00),(2978,195,'IB','Baleares',1,0.00),(2979,195,'BA','Barcelona',1,0.00),(2980,195,'BU','Burgos',1,0.00),(2981,195,'CC','C&aacute;ceres',1,0.00),(2982,195,'CZ','C&aacute;diz',1,0.00),(2983,195,'CT','Cantabria',1,0.00),(2984,195,'CL','Castell&oacute;n',1,0.00),(2985,195,'CE','Ceuta',1,0.00),(2986,195,'CR','Ciudad Real',1,0.00),(2987,195,'CD','C&oacute;rdoba',1,0.00),(2988,195,'CU','Cuenca',1,0.00),(2989,195,'GI','Girona',1,0.00),(2990,195,'GD','Granada',1,0.00),(2991,195,'GJ','Guadalajara',1,0.00),(2992,195,'GP','Guip&uacute;zcoa',1,0.00),(2993,195,'HL','Huelva',1,0.00),(2994,195,'HS','Huesca',1,0.00),(2995,195,'JN','Ja&eacute;n',1,0.00),(2996,195,'RJ','La Rioja',1,0.00),(2997,195,'PM','Las Palmas',1,0.00),(2998,195,'LE','Leon',1,0.00),(2999,195,'LL','Lleida',1,0.00),(3000,195,'LG','Lugo',1,0.00),(3001,195,'MD','Madrid',1,0.00),(3002,195,'MA','Malaga',1,0.00),(3003,195,'ML','Melilla',1,0.00),(3004,195,'MU','Murcia',1,0.00),(3005,195,'NV','Navarra',1,0.00),(3006,195,'OU','Ourense',1,0.00),(3007,195,'PL','Palencia',1,0.00),(3008,195,'PO','Pontevedra',1,0.00),(3009,195,'SL','Salamanca',1,0.00),(3010,195,'SC','Santa Cruz de Tenerife',1,0.00),(3011,195,'SG','Segovia',1,0.00),(3012,195,'SV','Sevilla',1,0.00),(3013,195,'SO','Soria',1,0.00),(3014,195,'TA','Tarragona',1,0.00),(3015,195,'TE','Teruel',1,0.00),(3016,195,'TO','Toledo',1,0.00),(3017,195,'VC','Valencia',1,0.00),(3018,195,'VD','Valladolid',1,0.00),(3019,195,'VZ','Vizcaya',1,0.00),(3020,195,'ZM','Zamora',1,0.00),(3021,195,'ZR','Zaragoza',1,0.00),(3022,196,'CE','Central',1,0.00),(3023,196,'EA','Eastern',1,0.00),(3024,196,'NC','North Central',1,0.00),(3025,196,'NO','Northern',1,0.00),(3026,196,'NW','North Western',1,0.00),(3027,196,'SA','Sabaragamuwa',1,0.00),(3028,196,'SO','Southern',1,0.00),(3029,196,'UV','Uva',1,0.00),(3030,196,'WE','Western',1,0.00),(3031,197,'A','Ascension',1,0.00),(3032,197,'S','Saint Helena',1,0.00),(3033,197,'T','Tristan da Cunha',1,0.00),(3034,199,'ANL','A\\ali an Nil',1,0.00),(3035,199,'BAM','Al Bahr al Ahmar',1,0.00),(3036,199,'BRT','Al Buhayrat',1,0.00),(3037,199,'JZR','Al Jazirah',1,0.00),(3038,199,'KRT','Al Khartum',1,0.00),(3039,199,'QDR','Al Qadarif',1,0.00),(3040,199,'WDH','Al Wahdah',1,0.00),(3041,199,'ANB','An Nil al Abyad',1,0.00),(3042,199,'ANZ','An Nil al Azraq',1,0.00),(3043,199,'ASH','Ash Shamaliyah',1,0.00),(3044,199,'BJA','Bahr al Jabal',1,0.00),(3045,199,'GIS','Gharb al Istiwa\\iyah',1,0.00),(3046,199,'GBG','Gharb Bahr al Ghazal',1,0.00),(3047,199,'GDA','Gharb Darfur',1,0.00),(3048,199,'GKU','Gharb Kurdufan',1,0.00),(3049,199,'JDA','Janub Darfur',1,0.00),(3050,199,'JKU','Janub Kurdufan',1,0.00),(3051,199,'JQL','Junqali',1,0.00),(3052,199,'KSL','Kassala',1,0.00),(3053,199,'NNL','Nahr an Nil',1,0.00),(3054,199,'SBG','Shamal Bahr al Ghazal',1,0.00),(3055,199,'SDA','Shamal Darfur',1,0.00),(3056,199,'SKU','Shamal Kurdufan',1,0.00),(3057,199,'SIS','Sharq al Istiwa\\iyah',1,0.00),(3058,199,'SNR','Sinnar',1,0.00),(3059,199,'WRB','Warab',1,0.00),(3060,200,'BR','Brokopondo',1,0.00),(3061,200,'CM','Commewijne',1,0.00),(3062,200,'CR','Coronie',1,0.00),(3063,200,'MA','Marowijne',1,0.00),(3064,200,'NI','Nickerie',1,0.00),(3065,200,'PA','Para',1,0.00),(3066,200,'PM','Paramaribo',1,0.00),(3067,200,'SA','Saramacca',1,0.00),(3068,200,'SI','Sipaliwini',1,0.00),(3069,200,'WA','Wanica',1,0.00),(3070,202,'H','Hhohho',1,0.00),(3071,202,'L','Lubombo',1,0.00),(3072,202,'M','Manzini',1,0.00),(3073,202,'S','Shishelweni',1,0.00),(3074,203,'K','Blekinge',1,0.00),(3075,203,'W','Dalama',1,0.00),(3076,203,'X','G&auml;vleborg',1,0.00),(3077,203,'I','Gotland',1,0.00),(3078,203,'N','Halland',1,0.00),(3079,203,'Z','J&auml;mtland',1,0.00),(3080,203,'F','J&ouml;nk&ouml;ping',1,0.00),(3081,203,'H','Kalmar',1,0.00),(3082,203,'G','Kronoberg',1,0.00),(3083,203,'BD','Norrbotten',1,0.00),(3084,203,'T','&Ouml;rebro',1,0.00),(3085,203,'E','&Ouml;sterg&ouml;tland',1,0.00),(3086,203,'M','Sk&aring;ne',1,0.00),(3087,203,'D','S&ouml;dermanland',1,0.00),(3088,203,'AB','Stockholm',1,0.00),(3089,203,'C','Uppsala',1,0.00),(3090,203,'S','V&auml;rmland',1,0.00),(3091,203,'AC','V&auml;sterbotten',1,0.00),(3092,203,'Y','V&auml;sternorrland',1,0.00),(3093,203,'U','V&auml;stmanland',1,0.00),(3094,203,'O','V&auml;stra G&ouml;taland',1,0.00),(3095,204,'AG','Aargau',1,0.00),(3096,204,'AR','Appenzell Ausserrhoden',1,0.00),(3097,204,'AI','Appenzell Innerrhoden',1,0.00),(3098,204,'BS','Basel-Stadt',1,0.00),(3099,204,'BL','Basel-Landschaft',1,0.00),(3100,204,'BE','Bern',1,0.00),(3101,204,'FR','Fribourg',1,0.00),(3102,204,'GE','Gen&egrave;ve',1,0.00),(3103,204,'GL','Glarus',1,0.00),(3104,204,'GR','Graub&uuml;nden',1,0.00),(3105,204,'JU','Jura',1,0.00),(3106,204,'LU','Luzern',1,0.00),(3107,204,'NE','Neuch&acirc;tel',1,0.00),(3108,204,'NW','Nidwald',1,0.00),(3109,204,'OW','Obwald',1,0.00),(3110,204,'SG','St. Gallen',1,0.00),(3111,204,'SH','Schaffhausen',1,0.00),(3112,204,'SZ','Schwyz',1,0.00),(3113,204,'SO','Solothurn',1,0.00),(3114,204,'TG','Thurgau',1,0.00),(3115,204,'TI','Ticino',1,0.00),(3116,204,'UR','Uri',1,0.00),(3117,204,'VS','Valais',1,0.00),(3118,204,'VD','Vaud',1,0.00),(3119,204,'ZG','Zug',1,0.00),(3120,204,'ZH','Z&uuml;rich',1,0.00),(3121,205,'HA','Al Hasakah',1,0.00),(3122,205,'LA','Al Ladhiqiyah',1,0.00),(3123,205,'QU','Al Qunaytirah',1,0.00),(3124,205,'RQ','Ar Raqqah',1,0.00),(3125,205,'SU','As Suwayda',1,0.00),(3126,205,'DA','Dara',1,0.00),(3127,205,'DZ','Dayr az Zawr',1,0.00),(3128,205,'DI','Dimashq',1,0.00),(3129,205,'HL','Halab',1,0.00),(3130,205,'HM','Hamah',1,0.00),(3131,205,'HI','Hims',1,0.00),(3132,205,'ID','Idlib',1,0.00),(3133,205,'RD','Rif Dimashq',1,0.00),(3134,205,'TA','Tartus',1,0.00),(3135,206,'CH','Chang-hua',1,0.00),(3136,206,'CI','Chia-i',1,0.00),(3137,206,'HS','Hsin-chu',1,0.00),(3138,206,'HL','Hua-lien',1,0.00),(3139,206,'IL','I-lan',1,0.00),(3140,206,'KH','Kao-hsiung county',1,0.00),(3141,206,'KM','Kin-men',1,0.00),(3142,206,'LC','Lien-chiang',1,0.00),(3143,206,'ML','Miao-li',1,0.00),(3144,206,'NT','Nan-t\\ou',1,0.00),(3145,206,'PH','P\\eng-hu',1,0.00),(3146,206,'PT','P\\ing-tung',1,0.00),(3147,206,'TG','T\\ai-chung',1,0.00),(3148,206,'TA','T\\ai-nan',1,0.00),(3149,206,'TP','T\\ai-pei county',1,0.00),(3150,206,'TT','T\\ai-tung',1,0.00),(3151,206,'TY','T\\ao-yuan',1,0.00),(3152,206,'YL','Yun-lin',1,0.00),(3153,206,'CC','Chia-i city',1,0.00),(3154,206,'CL','Chi-lung',1,0.00),(3155,206,'HC','Hsin-chu',1,0.00),(3156,206,'TH','T\\ai-chung',1,0.00),(3157,206,'TN','T\\ai-nan',1,0.00),(3158,206,'KC','Kao-hsiung city',1,0.00),(3159,206,'TC','T\\ai-pei city',1,0.00),(3160,207,'GB','Gorno-Badakhstan',1,0.00),(3161,207,'KT','Khatlon',1,0.00),(3162,207,'SU','Sughd',1,0.00),(3163,208,'AR','Arusha',1,0.00),(3164,208,'DS','Dar es Salaam',1,0.00),(3165,208,'DO','Dodoma',1,0.00),(3166,208,'IR','Iringa',1,0.00),(3167,208,'KA','Kagera',1,0.00),(3168,208,'KI','Kigoma',1,0.00),(3169,208,'KJ','Kilimanjaro',1,0.00),(3170,208,'LN','Lindi',1,0.00),(3171,208,'MY','Manyara',1,0.00),(3172,208,'MR','Mara',1,0.00),(3173,208,'MB','Mbeya',1,0.00),(3174,208,'MO','Morogoro',1,0.00),(3175,208,'MT','Mtwara',1,0.00),(3176,208,'MW','Mwanza',1,0.00),(3177,208,'PN','Pemba North',1,0.00),(3178,208,'PS','Pemba South',1,0.00),(3179,208,'PW','Pwani',1,0.00),(3180,208,'RK','Rukwa',1,0.00),(3181,208,'RV','Ruvuma',1,0.00),(3182,208,'SH','Shinyanga',1,0.00),(3183,208,'SI','Singida',1,0.00),(3184,208,'TB','Tabora',1,0.00),(3185,208,'TN','Tanga',1,0.00),(3186,208,'ZC','Zanzibar Central/South',1,0.00),(3187,208,'ZN','Zanzibar North',1,0.00),(3188,208,'ZU','Zanzibar Urban/West',1,0.00),(3189,209,'Amnat Charoen','Amnat Charoen',1,0.00),(3190,209,'Ang Thong','Ang Thong',1,0.00),(3191,209,'Ayutthaya','Ayutthaya',1,0.00),(3192,209,'Bangkok','Bangkok',1,0.00),(3193,209,'Buriram','Buriram',1,0.00),(3194,209,'Chachoengsao','Chachoengsao',1,0.00),(3195,209,'Chai Nat','Chai Nat',1,0.00),(3196,209,'Chaiyaphum','Chaiyaphum',1,0.00),(3197,209,'Chanthaburi','Chanthaburi',1,0.00),(3198,209,'Chiang Mai','Chiang Mai',1,0.00),(3199,209,'Chiang Rai','Chiang Rai',1,0.00),(3200,209,'Chon Buri','Chon Buri',1,0.00),(3201,209,'Chumphon','Chumphon',1,0.00),(3202,209,'Kalasin','Kalasin',1,0.00),(3203,209,'Kamphaeng Phet','Kamphaeng Phet',1,0.00),(3204,209,'Kanchanaburi','Kanchanaburi',1,0.00),(3205,209,'Khon Kaen','Khon Kaen',1,0.00),(3206,209,'Krabi','Krabi',1,0.00),(3207,209,'Lampang','Lampang',1,0.00),(3208,209,'Lamphun','Lamphun',1,0.00),(3209,209,'Loei','Loei',1,0.00),(3210,209,'Lop Buri','Lop Buri',1,0.00),(3211,209,'Mae Hong Son','Mae Hong Son',1,0.00),(3212,209,'Maha Sarakham','Maha Sarakham',1,0.00),(3213,209,'Mukdahan','Mukdahan',1,0.00),(3214,209,'Nakhon Nayok','Nakhon Nayok',1,0.00),(3215,209,'Nakhon Pathom','Nakhon Pathom',1,0.00),(3216,209,'Nakhon Phanom','Nakhon Phanom',1,0.00),(3217,209,'Nakhon Ratchasima','Nakhon Ratchasima',1,0.00),(3218,209,'Nakhon Sawan','Nakhon Sawan',1,0.00),(3219,209,'Nakhon Si Thammarat','Nakhon Si Thammarat',1,0.00),(3220,209,'Nan','Nan',1,0.00),(3221,209,'Narathiwat','Narathiwat',1,0.00),(3222,209,'Nong Bua Lamphu','Nong Bua Lamphu',1,0.00),(3223,209,'Nong Khai','Nong Khai',1,0.00),(3224,209,'Nonthaburi','Nonthaburi',1,0.00),(3225,209,'Pathum Thani','Pathum Thani',1,0.00),(3226,209,'Pattani','Pattani',1,0.00),(3227,209,'Phangnga','Phangnga',1,0.00),(3228,209,'Phatthalung','Phatthalung',1,0.00),(3229,209,'Phayao','Phayao',1,0.00),(3230,209,'Phetchabun','Phetchabun',1,0.00),(3231,209,'Phetchaburi','Phetchaburi',1,0.00),(3232,209,'Phichit','Phichit',1,0.00),(3233,209,'Phitsanulok','Phitsanulok',1,0.00),(3234,209,'Phrae','Phrae',1,0.00),(3235,209,'Phuket','Phuket',1,0.00),(3236,209,'Prachin Buri','Prachin Buri',1,0.00),(3237,209,'Prachuap Khiri Khan','Prachuap Khiri Khan',1,0.00),(3238,209,'Ranong','Ranong',1,0.00),(3239,209,'Ratchaburi','Ratchaburi',1,0.00),(3240,209,'Rayong','Rayong',1,0.00),(3241,209,'Roi Et','Roi Et',1,0.00),(3242,209,'Sa Kaeo','Sa Kaeo',1,0.00),(3243,209,'Sakon Nakhon','Sakon Nakhon',1,0.00),(3244,209,'Samut Prakan','Samut Prakan',1,0.00),(3245,209,'Samut Sakhon','Samut Sakhon',1,0.00),(3246,209,'Samut Songkhram','Samut Songkhram',1,0.00),(3247,209,'Sara Buri','Sara Buri',1,0.00),(3248,209,'Satun','Satun',1,0.00),(3249,209,'Sing Buri','Sing Buri',1,0.00),(3250,209,'Sisaket','Sisaket',1,0.00),(3251,209,'Songkhla','Songkhla',1,0.00),(3252,209,'Sukhothai','Sukhothai',1,0.00),(3253,209,'Suphan Buri','Suphan Buri',1,0.00),(3254,209,'Surat Thani','Surat Thani',1,0.00),(3255,209,'Surin','Surin',1,0.00),(3256,209,'Tak','Tak',1,0.00),(3257,209,'Trang','Trang',1,0.00),(3258,209,'Trat','Trat',1,0.00),(3259,209,'Ubon Ratchathani','Ubon Ratchathani',1,0.00),(3260,209,'Udon Thani','Udon Thani',1,0.00),(3261,209,'Uthai Thani','Uthai Thani',1,0.00),(3262,209,'Uttaradit','Uttaradit',1,0.00),(3263,209,'Yala','Yala',1,0.00),(3264,209,'Yasothon','Yasothon',1,0.00),(3265,210,'K','Kara',1,0.00),(3266,210,'P','Plateaux',1,0.00),(3267,210,'S','Savanes',1,0.00),(3268,210,'C','Centrale',1,0.00),(3269,210,'M','Maritime',1,0.00),(3270,211,'A','Atafu',1,0.00),(3271,211,'F','Fakaofo',1,0.00),(3272,211,'N','Nukunonu',1,0.00),(3273,212,'H','Ha\\apai',1,0.00),(3274,212,'T','Tongatapu',1,0.00),(3275,212,'V','Vava\\u',1,0.00),(3276,213,'CT','Couva/Tabaquite/Talparo',1,0.00),(3277,213,'DM','Diego Martin',1,0.00),(3278,213,'MR','Mayaro/Rio Claro',1,0.00),(3279,213,'PD','Penal/Debe',1,0.00),(3280,213,'PT','Princes Town',1,0.00),(3281,213,'SG','Sangre Grande',1,0.00),(3282,213,'SL','San Juan/Laventille',1,0.00),(3283,213,'SI','Siparia',1,0.00),(3284,213,'TP','Tunapuna/Piarco',1,0.00),(3285,213,'PS','Port of Spain',1,0.00),(3286,213,'SF','San Fernando',1,0.00),(3287,213,'AR','Arima',1,0.00),(3288,213,'PF','Point Fortin',1,0.00),(3289,213,'CH','Chaguanas',1,0.00),(3290,213,'TO','Tobago',1,0.00),(3291,214,'AR','Ariana',1,0.00),(3292,214,'BJ','Beja',1,0.00),(3293,214,'BA','Ben Arous',1,0.00),(3294,214,'BI','Bizerte',1,0.00),(3295,214,'GB','Gabes',1,0.00),(3296,214,'GF','Gafsa',1,0.00),(3297,214,'JE','Jendouba',1,0.00),(3298,214,'KR','Kairouan',1,0.00),(3299,214,'KS','Kasserine',1,0.00),(3300,214,'KB','Kebili',1,0.00),(3301,214,'KF','Kef',1,0.00),(3302,214,'MH','Mahdia',1,0.00),(3303,214,'MN','Manouba',1,0.00),(3304,214,'ME','Medenine',1,0.00),(3305,214,'MO','Monastir',1,0.00),(3306,214,'NA','Nabeul',1,0.00),(3307,214,'SF','Sfax',1,0.00),(3308,214,'SD','Sidi',1,0.00),(3309,214,'SL','Siliana',1,0.00),(3310,214,'SO','Sousse',1,0.00),(3311,214,'TA','Tataouine',1,0.00),(3312,214,'TO','Tozeur',1,0.00),(3313,214,'TU','Tunis',1,0.00),(3314,214,'ZA','Zaghouan',1,0.00),(3315,215,'ADA','Adana',1,0.00),(3316,215,'ADI','Adiyaman',1,0.00),(3317,215,'AFY','Afyonkarahisar',1,0.00),(3318,215,'AGR','Agri',1,0.00),(3319,215,'AKS','Aksaray',1,0.00),(3320,215,'AMA','Amasya',1,0.00),(3321,215,'ANK','Ankara',1,0.00),(3322,215,'ANT','Antalya',1,0.00),(3323,215,'ARD','Ardahan',1,0.00),(3324,215,'ART','Artvin',1,0.00),(3325,215,'AYI','Aydin',1,0.00),(3326,215,'BAL','Balikesir',1,0.00),(3327,215,'BAR','Bartin',1,0.00),(3328,215,'BAT','Batman',1,0.00),(3329,215,'BAY','Bayburt',1,0.00),(3330,215,'BIL','Bilecik',1,0.00),(3331,215,'BIN','Bingol',1,0.00),(3332,215,'BIT','Bitlis',1,0.00),(3333,215,'BOL','Bolu',1,0.00),(3334,215,'BRD','Burdur',1,0.00),(3335,215,'BRS','Bursa',1,0.00),(3336,215,'CKL','Canakkale',1,0.00),(3337,215,'CKR','Cankiri',1,0.00),(3338,215,'COR','Corum',1,0.00),(3339,215,'DEN','Denizli',1,0.00),(3340,215,'DIY','Diyarbakir',1,0.00),(3341,215,'DUZ','Duzce',1,0.00),(3342,215,'EDI','Edirne',1,0.00),(3343,215,'ELA','Elazig',1,0.00),(3344,215,'EZC','Erzincan',1,0.00),(3345,215,'EZR','Erzurum',1,0.00),(3346,215,'ESK','Eskisehir',1,0.00),(3347,215,'GAZ','Gaziantep',1,0.00),(3348,215,'GIR','Giresun',1,0.00),(3349,215,'GMS','Gumushane',1,0.00),(3350,215,'HKR','Hakkari',1,0.00),(3351,215,'HTY','Hatay',1,0.00),(3352,215,'IGD','Igdir',1,0.00),(3353,215,'ISP','Isparta',1,0.00),(3354,215,'IST','Istanbul',1,0.00),(3355,215,'IZM','Izmir',1,0.00),(3356,215,'KAH','Kahramanmaras',1,0.00),(3357,215,'KRB','Karabuk',1,0.00),(3358,215,'KRM','Karaman',1,0.00),(3359,215,'KRS','Kars',1,0.00),(3360,215,'KAS','Kastamonu',1,0.00),(3361,215,'KAY','Kayseri',1,0.00),(3362,215,'KLS','Kilis',1,0.00),(3363,215,'KRK','Kirikkale',1,0.00),(3364,215,'KLR','Kirklareli',1,0.00),(3365,215,'KRH','Kirsehir',1,0.00),(3366,215,'KOC','Kocaeli',1,0.00),(3367,215,'KON','Konya',1,0.00),(3368,215,'KUT','Kutahya',1,0.00),(3369,215,'MAL','Malatya',1,0.00),(3370,215,'MAN','Manisa',1,0.00),(3371,215,'MAR','Mardin',1,0.00),(3372,215,'MER','Mersin',1,0.00),(3373,215,'MUG','Mugla',1,0.00),(3374,215,'MUS','Mus',1,0.00),(3375,215,'NEV','Nevsehir',1,0.00),(3376,215,'NIG','Nigde',1,0.00),(3377,215,'ORD','Ordu',1,0.00),(3378,215,'OSM','Osmaniye',1,0.00),(3379,215,'RIZ','Rize',1,0.00),(3380,215,'SAK','Sakarya',1,0.00),(3381,215,'SAM','Samsun',1,0.00),(3382,215,'SAN','Sanliurfa',1,0.00),(3383,215,'SII','Siirt',1,0.00),(3384,215,'SIN','Sinop',1,0.00),(3385,215,'SIR','Sirnak',1,0.00),(3386,215,'SIV','Sivas',1,0.00),(3387,215,'TEL','Tekirdag',1,0.00),(3388,215,'TOK','Tokat',1,0.00),(3389,215,'TRA','Trabzon',1,0.00),(3390,215,'TUN','Tunceli',1,0.00),(3391,215,'USK','Usak',1,0.00),(3392,215,'VAN','Van',1,0.00),(3393,215,'YAL','Yalova',1,0.00),(3394,215,'YOZ','Yozgat',1,0.00),(3395,215,'ZON','Zonguldak',1,0.00),(3396,216,'A','Ahal Welayaty',1,0.00),(3397,216,'B','Balkan Welayaty',1,0.00),(3398,216,'D','Dashhowuz Welayaty',1,0.00),(3399,216,'L','Lebap Welayaty',1,0.00),(3400,216,'M','Mary Welayaty',1,0.00),(3401,217,'AC','Ambergris Cays',1,0.00),(3402,217,'DC','Dellis Cay',1,0.00),(3403,217,'FC','French Cay',1,0.00),(3404,217,'LW','Little Water Cay',1,0.00),(3405,217,'RC','Parrot Cay',1,0.00),(3406,217,'PN','Pine Cay',1,0.00),(3407,217,'SL','Salt Cay',1,0.00),(3408,217,'GT','Grand Turk',1,0.00),(3409,217,'SC','South Caicos',1,0.00),(3410,217,'EC','East Caicos',1,0.00),(3411,217,'MC','Middle Caicos',1,0.00),(3412,217,'NC','North Caicos',1,0.00),(3413,217,'PR','Providenciales',1,0.00),(3414,217,'WC','West Caicos',1,0.00),(3415,218,'NMG','Nanumanga',1,0.00),(3416,218,'NLK','Niulakita',1,0.00),(3417,218,'NTO','Niutao',1,0.00),(3418,218,'FUN','Funafuti',1,0.00),(3419,218,'NME','Nanumea',1,0.00),(3420,218,'NUI','Nui',1,0.00),(3421,218,'NFT','Nukufetau',1,0.00),(3422,218,'NLL','Nukulaelae',1,0.00),(3423,218,'VAI','Vaitupu',1,0.00),(3424,219,'KAL','Kalangala',1,0.00),(3425,219,'KMP','Kampala',1,0.00),(3426,219,'KAY','Kayunga',1,0.00),(3427,219,'KIB','Kiboga',1,0.00),(3428,219,'LUW','Luwero',1,0.00),(3429,219,'MAS','Masaka',1,0.00),(3430,219,'MPI','Mpigi',1,0.00),(3431,219,'MUB','Mubende',1,0.00),(3432,219,'MUK','Mukono',1,0.00),(3433,219,'NKS','Nakasongola',1,0.00),(3434,219,'RAK','Rakai',1,0.00),(3435,219,'SEM','Sembabule',1,0.00),(3436,219,'WAK','Wakiso',1,0.00),(3437,219,'BUG','Bugiri',1,0.00),(3438,219,'BUS','Busia',1,0.00),(3439,219,'IGA','Iganga',1,0.00),(3440,219,'JIN','Jinja',1,0.00),(3441,219,'KAB','Kaberamaido',1,0.00),(3442,219,'KML','Kamuli',1,0.00),(3443,219,'KPC','Kapchorwa',1,0.00),(3444,219,'KTK','Katakwi',1,0.00),(3445,219,'KUM','Kumi',1,0.00),(3446,219,'MAY','Mayuge',1,0.00),(3447,219,'MBA','Mbale',1,0.00),(3448,219,'PAL','Pallisa',1,0.00),(3449,219,'SIR','Sironko',1,0.00),(3450,219,'SOR','Soroti',1,0.00),(3451,219,'TOR','Tororo',1,0.00),(3452,219,'ADJ','Adjumani',1,0.00),(3453,219,'APC','Apac',1,0.00),(3454,219,'ARU','Arua',1,0.00),(3455,219,'GUL','Gulu',1,0.00),(3456,219,'KIT','Kitgum',1,0.00),(3457,219,'KOT','Kotido',1,0.00),(3458,219,'LIR','Lira',1,0.00),(3459,219,'MRT','Moroto',1,0.00),(3460,219,'MOY','Moyo',1,0.00),(3461,219,'NAK','Nakapiripirit',1,0.00),(3462,219,'NEB','Nebbi',1,0.00),(3463,219,'PAD','Pader',1,0.00),(3464,219,'YUM','Yumbe',1,0.00),(3465,219,'BUN','Bundibugyo',1,0.00),(3466,219,'BSH','Bushenyi',1,0.00),(3467,219,'HOI','Hoima',1,0.00),(3468,219,'KBL','Kabale',1,0.00),(3469,219,'KAR','Kabarole',1,0.00),(3470,219,'KAM','Kamwenge',1,0.00),(3471,219,'KAN','Kanungu',1,0.00),(3472,219,'KAS','Kasese',1,0.00),(3473,219,'KBA','Kibaale',1,0.00),(3474,219,'KIS','Kisoro',1,0.00),(3475,219,'KYE','Kyenjojo',1,0.00),(3476,219,'MSN','Masindi',1,0.00),(3477,219,'MBR','Mbarara',1,0.00),(3478,219,'NTU','Ntungamo',1,0.00),(3479,219,'RUK','Rukungiri',1,0.00),(3480,220,'CK','Cherkasy',1,0.00),(3481,220,'CH','Chernihiv',1,0.00),(3482,220,'CV','Chernivtsi',1,0.00),(3483,220,'CR','Crimea',1,0.00),(3484,220,'DN','Dnipropetrovs\\k',1,0.00),(3485,220,'DO','Donets\\k',1,0.00),(3486,220,'IV','Ivano-Frankivs\\k',1,0.00),(3487,220,'KL','Kharkiv Kherson',1,0.00),(3488,220,'KM','Khmel\\nyts\\kyy',1,0.00),(3489,220,'KR','Kirovohrad',1,0.00),(3490,220,'KV','Kiev',1,0.00),(3491,220,'KY','Kyyiv',1,0.00),(3492,220,'LU','Luhans\\k',1,0.00),(3493,220,'LV','L\\viv',1,0.00),(3494,220,'MY','Mykolayiv',1,0.00),(3495,220,'OD','Odesa',1,0.00),(3496,220,'PO','Poltava',1,0.00),(3497,220,'RI','Rivne',1,0.00),(3498,220,'SE','Sevastopol',1,0.00),(3499,220,'SU','Sumy',1,0.00),(3500,220,'TE','Ternopil\\',1,0.00),(3501,220,'VI','Vinnytsya',1,0.00),(3502,220,'VO','Volyn\\',1,0.00),(3503,220,'ZK','Zakarpattya',1,0.00),(3504,220,'ZA','Zaporizhzhya',1,0.00),(3505,220,'ZH','Zhytomyr',1,0.00),(3506,221,'AZ','Abu Zaby',1,0.00),(3507,221,'AJ','\\Ajman',1,0.00),(3508,221,'FU','Al Fujayrah',1,0.00),(3509,221,'SH','Ash Shariqah',1,0.00),(3510,221,'DU','Dubayy',1,0.00),(3511,221,'RK','R\\as al Khaymah',1,0.00),(3512,221,'UQ','Umm al Qaywayn',1,0.00),(3513,222,'ABN','Aberdeen',1,0.00),(3514,222,'ABNS','Aberdeenshire',1,0.00),(3515,222,'ANG','Anglesey',1,0.00),(3516,222,'AGS','Angus',1,0.00),(3517,222,'ARY','Argyll and Bute',1,0.00),(3518,222,'BEDS','Bedfordshire',1,0.00),(3519,222,'BERKS','Berkshire',1,0.00),(3520,222,'BLA','Blaenau Gwent',1,0.00),(3521,222,'BRI','Bridgend',1,0.00),(3522,222,'BSTL','Bristol',1,0.00),(3523,222,'BUCKS','Buckinghamshire',1,0.00),(3524,222,'CAE','Caerphilly',1,0.00),(3525,222,'CAMBS','Cambridgeshire',1,0.00),(3526,222,'CDF','Cardiff',1,0.00),(3527,222,'CARM','Carmarthenshire',1,0.00),(3528,222,'CDGN','Ceredigion',1,0.00),(3529,222,'CHES','Cheshire',1,0.00),(3530,222,'CLACK','Clackmannanshire',1,0.00),(3531,222,'CON','Conwy',1,0.00),(3532,222,'CORN','Cornwall',1,0.00),(3533,222,'DNBG','Denbighshire',1,0.00),(3534,222,'DERBY','Derbyshire',1,0.00),(3535,222,'DVN','Devon',1,0.00),(3536,222,'DOR','Dorset',1,0.00),(3537,222,'DGL','Dumfries and Galloway',1,0.00),(3538,222,'DUND','Dundee',1,0.00),(3539,222,'DHM','Durham',1,0.00),(3540,222,'ARYE','East Ayrshire',1,0.00),(3541,222,'DUNBE','East Dunbartonshire',1,0.00),(3542,222,'LOTE','East Lothian',1,0.00),(3543,222,'RENE','East Renfrewshire',1,0.00),(3544,222,'ERYS','East Riding of Yorkshire',1,0.00),(3545,222,'SXE','East Sussex',1,0.00),(3546,222,'EDIN','Edinburgh',1,0.00),(3547,222,'ESX','Essex',1,0.00),(3548,222,'FALK','Falkirk',1,0.00),(3549,222,'FFE','Fife',1,0.00),(3550,222,'FLINT','Flintshire',1,0.00),(3551,222,'GLAS','Glasgow',1,0.00),(3552,222,'GLOS','Gloucestershire',1,0.00),(3553,222,'LDN','Greater London',1,0.00),(3554,222,'MCH','Greater Manchester',1,0.00),(3555,222,'GDD','Gwynedd',1,0.00),(3556,222,'HANTS','Hampshire',1,0.00),(3557,222,'HWR','Herefordshire',1,0.00),(3558,222,'HERTS','Hertfordshire',1,0.00),(3559,222,'HLD','Highlands',1,0.00),(3560,222,'IVER','Inverclyde',1,0.00),(3561,222,'IOW','Isle of Wight',1,0.00),(3562,222,'KNT','Kent',1,0.00),(3563,222,'LANCS','Lancashire',1,0.00),(3564,222,'LEICS','Leicestershire',1,0.00),(3565,222,'LINCS','Lincolnshire',1,0.00),(3566,222,'MSY','Merseyside',1,0.00),(3567,222,'MERT','Merthyr Tydfil',1,0.00),(3568,222,'MLOT','Midlothian',1,0.00),(3569,222,'MMOUTH','Monmouthshire',1,0.00),(3570,222,'MORAY','Moray',1,0.00),(3571,222,'NPRTAL','Neath Port Talbot',1,0.00),(3572,222,'NEWPT','Newport',1,0.00),(3573,222,'NOR','Norfolk',1,0.00),(3574,222,'ARYN','North Ayrshire',1,0.00),(3575,222,'LANN','North Lanarkshire',1,0.00),(3576,222,'YSN','North Yorkshire',1,0.00),(3577,222,'NHM','Northamptonshire',1,0.00),(3578,222,'NLD','Northumberland',1,0.00),(3579,222,'NOT','Nottinghamshire',1,0.00),(3580,222,'ORK','Orkney Islands',1,0.00),(3581,222,'OFE','Oxfordshire',1,0.00),(3582,222,'PEM','Pembrokeshire',1,0.00),(3583,222,'PERTH','Perth and Kinross',1,0.00),(3584,222,'PWS','Powys',1,0.00),(3585,222,'REN','Renfrewshire',1,0.00),(3586,222,'RHON','Rhondda Cynon Taff',1,0.00),(3587,222,'RUT','Rutland',1,0.00),(3588,222,'BOR','Scottish Borders',1,0.00),(3589,222,'SHET','Shetland Islands',1,0.00),(3590,222,'SPE','Shropshire',1,0.00),(3591,222,'SOM','Somerset',1,0.00),(3592,222,'ARYS','South Ayrshire',1,0.00),(3593,222,'LANS','South Lanarkshire',1,0.00),(3594,222,'YSS','South Yorkshire',1,0.00),(3595,222,'SFD','Staffordshire',1,0.00),(3596,222,'STIR','Stirling',1,0.00),(3597,222,'SFK','Suffolk',1,0.00),(3598,222,'SRY','Surrey',1,0.00),(3599,222,'SWAN','Swansea',1,0.00),(3600,222,'TORF','Torfaen',1,0.00),(3601,222,'TWR','Tyne and Wear',1,0.00),(3602,222,'VGLAM','Vale of Glamorgan',1,0.00),(3603,222,'WARKS','Warwickshire',1,0.00),(3604,222,'WDUN','West Dunbartonshire',1,0.00),(3605,222,'WLOT','West Lothian',1,0.00),(3606,222,'WMD','West Midlands',1,0.00),(3607,222,'SXW','West Sussex',1,0.00),(3608,222,'YSW','West Yorkshire',1,0.00),(3609,222,'WIL','Western Isles',1,0.00),(3610,222,'WLT','Wiltshire',1,0.00),(3611,222,'WORCS','Worcestershire',1,0.00),(3612,222,'WRX','Wrexham',1,0.00),(3613,223,'AL','Alabama',1,0.00),(3614,223,'AK','Alaska',1,0.00),(3615,223,'AS','American Samoa',1,0.00),(3616,223,'AZ','Arizona',1,0.00),(3617,223,'AR','Arkansas',1,0.00),(3618,223,'AF','Armed Forces Africa',1,0.00),(3619,223,'AA','Armed Forces Americas',1,0.00),(3620,223,'AC','Armed Forces Canada',1,0.00),(3621,223,'AE','Armed Forces Europe',1,0.00),(3622,223,'AM','Armed Forces Middle East',1,0.00),(3623,223,'AP','Armed Forces Pacific',1,0.00),(3624,223,'CA','California',1,0.00),(3625,223,'CO','Colorado',1,0.00),(3626,223,'CT','Connecticut',1,0.00),(3627,223,'DE','Delaware',1,0.00),(3628,223,'DC','District of Columbia',1,0.00),(3629,223,'FM','Federated States Of Micronesia',1,0.00),(3630,223,'FL','Florida',1,0.00),(3631,223,'GA','Georgia',1,0.00),(3632,223,'GU','Guam',1,0.00),(3633,223,'HI','Hawaii',1,0.00),(3634,223,'ID','Idaho',1,0.00),(3635,223,'IL','Illinois',1,0.00),(3636,223,'IN','Indiana',1,0.00),(3637,223,'IA','Iowa',1,0.00),(3638,223,'KS','Kansas',1,0.00),(3639,223,'KY','Kentucky',1,0.00),(3640,223,'LA','Louisiana',1,4.00),(3641,223,'ME','Maine',1,0.00),(3642,223,'MH','Marshall Islands',1,0.00),(3643,223,'MD','Maryland',1,0.00),(3644,223,'MA','Massachusetts',1,0.00),(3645,223,'MI','Michigan',1,0.00),(3646,223,'MN','Minnesota',1,0.00),(3647,223,'MS','Mississippi',1,0.00),(3648,223,'MO','Missouri',1,0.00),(3649,223,'MT','Montana',1,0.00),(3650,223,'NE','Nebraska',1,0.00),(3651,223,'NV','Nevada',1,0.00),(3652,223,'NH','New Hampshire',1,0.00),(3653,223,'NJ','New Jersey',1,0.00),(3654,223,'NM','New Mexico',1,0.00),(3655,223,'NY','New York',1,0.00),(3656,223,'NC','North Carolina',1,0.00),(3657,223,'ND','North Dakota',1,0.00),(3658,223,'MP','Northern Mariana Islands',1,0.00),(3659,223,'OH','Ohio',1,0.00),(3660,223,'OK','Oklahoma',1,0.00),(3661,223,'OR','Oregon',1,0.00),(3662,223,'PW','Palau',1,0.00),(3663,223,'PA','Pennsylvania',1,0.00),(3664,223,'PR','Puerto Rico',1,0.00),(3665,223,'RI','Rhode Island',1,0.00),(3666,223,'SC','South Carolina',1,0.00),(3667,223,'SD','South Dakota',1,0.00),(3668,223,'TN','Tennessee',1,0.00),(3669,223,'TX','Texas',1,0.00),(3670,223,'UT','Utah',1,0.00),(3671,223,'VT','Vermont',1,0.00),(3672,223,'VI','Virgin Islands',1,0.00),(3673,223,'VA','Virginia',1,0.00),(3674,223,'WA','Washington',1,0.00),(3675,223,'WV','West Virginia',1,0.00),(3676,223,'WI','Wisconsin',1,0.00),(3677,223,'WY','Wyoming',1,0.00),(3678,224,'BI','Baker Island',1,0.00),(3679,224,'HI','Howland Island',1,0.00),(3680,224,'JI','Jarvis Island',1,0.00),(3681,224,'JA','Johnston Atoll',1,0.00),(3682,224,'KR','Kingman Reef',1,0.00),(3683,224,'MA','Midway Atoll',1,0.00),(3684,224,'NI','Navassa Island',1,0.00),(3685,224,'PA','Palmyra Atoll',1,0.00),(3686,224,'WI','Wake Island',1,0.00),(3687,225,'AR','Artigas',1,0.00),(3688,225,'CA','Canelones',1,0.00),(3689,225,'CL','Cerro Largo',1,0.00),(3690,225,'CO','Colonia',1,0.00),(3691,225,'DU','Durazno',1,0.00),(3692,225,'FS','Flores',1,0.00),(3693,225,'FA','Florida',1,0.00),(3694,225,'LA','Lavalleja',1,0.00),(3695,225,'MA','Maldonado',1,0.00),(3696,225,'MO','Montevideo',1,0.00),(3697,225,'PA','Paysandu',1,0.00),(3698,225,'RN','Rio Negro',1,0.00),(3699,225,'RV','Rivera',1,0.00),(3700,225,'RO','Rocha',1,0.00),(3701,225,'SL','Salto',1,0.00),(3702,225,'SJ','San Jose',1,0.00),(3703,225,'SO','Soriano',1,0.00),(3704,225,'TA','Tacuarembo',1,0.00),(3705,225,'TT','Treinta y Tres',1,0.00),(3706,226,'AN','Andijon',1,0.00),(3707,226,'BU','Buxoro',1,0.00),(3708,226,'FA','Farg\\ona',1,0.00),(3709,226,'JI','Jizzax',1,0.00),(3710,226,'NG','Namangan',1,0.00),(3711,226,'NW','Navoiy',1,0.00),(3712,226,'QA','Qashqadaryo',1,0.00),(3713,226,'QR','Qoraqalpog\\iston Republikasi',1,0.00),(3714,226,'SA','Samarqand',1,0.00),(3715,226,'SI','Sirdaryo',1,0.00),(3716,226,'SU','Surxondaryo',1,0.00),(3717,226,'TK','Toshkent City',1,0.00),(3718,226,'TO','Toshkent Region',1,0.00),(3719,226,'XO','Xorazm',1,0.00),(3720,227,'MA','Malampa',1,0.00),(3721,227,'PE','Penama',1,0.00),(3722,227,'SA','Sanma',1,0.00),(3723,227,'SH','Shefa',1,0.00),(3724,227,'TA','Tafea',1,0.00),(3725,227,'TO','Torba',1,0.00),(3726,229,'AM','Amazonas',1,0.00),(3727,229,'AN','Anzoategui',1,0.00),(3728,229,'AP','Apure',1,0.00),(3729,229,'AR','Aragua',1,0.00),(3730,229,'BA','Barinas',1,0.00),(3731,229,'BO','Bolivar',1,0.00),(3732,229,'CA','Carabobo',1,0.00),(3733,229,'CO','Cojedes',1,0.00),(3734,229,'DA','Delta Amacuro',1,0.00),(3735,229,'DF','Dependencias Federales',1,0.00),(3736,229,'DI','Distrito Federal',1,0.00),(3737,229,'FA','Falcon',1,0.00),(3738,229,'GU','Guarico',1,0.00),(3739,229,'LA','Lara',1,0.00),(3740,229,'ME','Merida',1,0.00),(3741,229,'MI','Miranda',1,0.00),(3742,229,'MO','Monagas',1,0.00),(3743,229,'NE','Nueva Esparta',1,0.00),(3744,229,'PO','Portuguesa',1,0.00),(3745,229,'SU','Sucre',1,0.00),(3746,229,'TA','Tachira',1,0.00),(3747,229,'TR','Trujillo',1,0.00),(3748,229,'VA','Vargas',1,0.00),(3749,229,'YA','Yaracuy',1,0.00),(3750,229,'ZU','Zulia',1,0.00),(3751,230,'AG','An Giang',1,0.00),(3752,230,'BG','Bac Giang',1,0.00),(3753,230,'BK','Bac Kan',1,0.00),(3754,230,'BL','Bac Lieu',1,0.00),(3755,230,'BC','Bac Ninh',1,0.00),(3756,230,'BR','Ba Ria-Vung Tau',1,0.00),(3757,230,'BN','Ben Tre',1,0.00),(3758,230,'BH','Binh Dinh',1,0.00),(3759,230,'BU','Binh Duong',1,0.00),(3760,230,'BP','Binh Phuoc',1,0.00),(3761,230,'BT','Binh Thuan',1,0.00),(3762,230,'CM','Ca Mau',1,0.00),(3763,230,'CT','Can Tho',1,0.00),(3764,230,'CB','Cao Bang',1,0.00),(3765,230,'DL','Dak Lak',1,0.00),(3766,230,'DG','Dak Nong',1,0.00),(3767,230,'DN','Da Nang',1,0.00),(3768,230,'DB','Dien Bien',1,0.00),(3769,230,'DI','Dong Nai',1,0.00),(3770,230,'DT','Dong Thap',1,0.00),(3771,230,'GL','Gia Lai',1,0.00),(3772,230,'HG','Ha Giang',1,0.00),(3773,230,'HD','Hai Duong',1,0.00),(3774,230,'HP','Hai Phong',1,0.00),(3775,230,'HM','Ha Nam',1,0.00),(3776,230,'HI','Ha Noi',1,0.00),(3777,230,'HT','Ha Tay',1,0.00),(3778,230,'HH','Ha Tinh',1,0.00),(3779,230,'HB','Hoa Binh',1,0.00),(3780,230,'HC','Ho Chi Minh City',1,0.00),(3781,230,'HU','Hau Giang',1,0.00),(3782,230,'HY','Hung Yen',1,0.00),(3783,232,'C','Saint Croix',1,0.00),(3784,232,'J','Saint John',1,0.00),(3785,232,'T','Saint Thomas',1,0.00),(3786,233,'A','Alo',1,0.00),(3787,233,'S','Sigave',1,0.00),(3788,233,'W','Wallis',1,0.00),(3789,235,'AB','Abyan',1,0.00),(3790,235,'AD','Adan',1,0.00),(3791,235,'AM','Amran',1,0.00),(3792,235,'BA','Al Bayda',1,0.00),(3793,235,'DA','Ad Dali',1,0.00),(3794,235,'DH','Dhamar',1,0.00),(3795,235,'HD','Hadramawt',1,0.00),(3796,235,'HJ','Hajjah',1,0.00),(3797,235,'HU','Al Hudaydah',1,0.00),(3798,235,'IB','Ibb',1,0.00),(3799,235,'JA','Al Jawf',1,0.00),(3800,235,'LA','Lahij',1,0.00),(3801,235,'MA','Ma\\rib',1,0.00),(3802,235,'MR','Al Mahrah',1,0.00),(3803,235,'MW','Al Mahwit',1,0.00),(3804,235,'SD','Sa\\dah',1,0.00),(3805,235,'SN','San\\a',1,0.00),(3806,235,'SH','Shabwah',1,0.00),(3807,235,'TA','Ta\\izz',1,0.00),(3808,236,'KOS','Kosovo',1,0.00),(3809,236,'MON','Montenegro',1,0.00),(3810,236,'SER','Serbia',1,0.00),(3811,236,'VOJ','Vojvodina',1,0.00),(3812,237,'BC','Bas-Congo',1,0.00),(3813,237,'BN','Bandundu',1,0.00),(3814,237,'EQ','Equateur',1,0.00),(3815,237,'KA','Katanga',1,0.00),(3816,237,'KE','Kasai-Oriental',1,0.00),(3817,237,'KN','Kinshasa',1,0.00),(3818,237,'KW','Kasai-Occidental',1,0.00),(3819,237,'MA','Maniema',1,0.00),(3820,237,'NK','Nord-Kivu',1,0.00),(3821,237,'OR','Orientale',1,0.00),(3822,237,'SK','Sud-Kivu',1,0.00),(3823,238,'CE','Central',1,0.00),(3824,238,'CB','Copperbelt',1,0.00),(3825,238,'EA','Eastern',1,0.00),(3826,238,'LP','Luapula',1,0.00),(3827,238,'LK','Lusaka',1,0.00),(3828,238,'NO','Northern',1,0.00),(3829,238,'NW','North-Western',1,0.00),(3830,238,'SO','Southern',1,0.00),(3831,238,'WE','Western',1,0.00),(3832,239,'BU','Bulawayo',1,0.00),(3833,239,'HA','Harare',1,0.00),(3834,239,'ML','Manicaland',1,0.00),(3835,239,'MC','Mashonaland Central',1,0.00),(3836,239,'ME','Mashonaland East',1,0.00),(3837,239,'MW','Mashonaland West',1,0.00),(3838,239,'MV','Masvingo',1,0.00),(3839,239,'MN','Matabeleland North',1,0.00),(3840,239,'MS','Matabeleland South',1,0.00),(3841,239,'MD','Midlands',1,0.00),(3842,105,'AG','Agrigento',1,0.00),(3843,105,'AL','Alessandria',1,0.00),(3844,105,'AN','Ancona',1,0.00),(3845,105,'AO','Aosta',1,0.00),(3846,105,'AR','Arezzo',1,0.00),(3847,105,'AP','Ascoli Piceno',1,0.00),(3848,105,'AT','Asti',1,0.00),(3849,105,'AV','Avellino',1,0.00),(3850,105,'BA','Bari',1,0.00),(3851,105,'BL','Belluno',1,0.00),(3852,105,'BN','Benevento',1,0.00),(3853,105,'BG','Bergamo',1,0.00),(3854,105,'BI','Biella',1,0.00),(3855,105,'BO','Bologna',1,0.00),(3856,105,'BZ','Bolzano',1,0.00),(3857,105,'BS','Brescia',1,0.00),(3858,105,'BR','Brindisi',1,0.00),(3859,105,'CA','Cagliari',1,0.00),(3860,105,'CL','Caltanissetta',1,0.00),(3861,105,'CB','Campobasso',1,0.00),(3862,105,'CI','Carbonia-Iglesias',1,0.00),(3863,105,'CE','Caserta',1,0.00),(3864,105,'CT','Catania',1,0.00),(3865,105,'CZ','Catanzaro',1,0.00),(3866,105,'CH','Chieti',1,0.00),(3867,105,'CO','Como',1,0.00),(3868,105,'CS','Cosenza',1,0.00),(3869,105,'CR','Cremona',1,0.00),(3870,105,'KR','Crotone',1,0.00),(3871,105,'CN','Cuneo',1,0.00),(3872,105,'EN','Enna',1,0.00),(3873,105,'FE','Ferrara',1,0.00),(3874,105,'FI','Firenze',1,0.00),(3875,105,'FG','Foggia',1,0.00),(3876,105,'FC','Forli-Cesena',1,0.00),(3877,105,'FR','Frosinone',1,0.00),(3878,105,'GE','Genova',1,0.00),(3879,105,'GO','Gorizia',1,0.00),(3880,105,'GR','Grosseto',1,0.00),(3881,105,'IM','Imperia',1,0.00),(3882,105,'IS','Isernia',1,0.00),(3883,105,'AQ','L&#39;Aquila',1,0.00),(3884,105,'SP','La Spezia',1,0.00),(3885,105,'LT','Latina',1,0.00),(3886,105,'LE','Lecce',1,0.00),(3887,105,'LC','Lecco',1,0.00),(3888,105,'LI','Livorno',1,0.00),(3889,105,'LO','Lodi',1,0.00),(3890,105,'LU','Lucca',1,0.00),(3891,105,'MC','Macerata',1,0.00),(3892,105,'MN','Mantova',1,0.00),(3893,105,'MS','Massa-Carrara',1,0.00),(3894,105,'MT','Matera',1,0.00),(3895,105,'VS','Medio Campidano',1,0.00),(3896,105,'ME','Messina',1,0.00),(3897,105,'MI','Milano',1,0.00),(3898,105,'MO','Modena',1,0.00),(3899,105,'NA','Napoli',1,0.00),(3900,105,'NO','Novara',1,0.00),(3901,105,'NU','Nuoro',1,0.00),(3902,105,'OG','Ogliastra',1,0.00),(3903,105,'OT','Olbia-Tempio',1,0.00),(3904,105,'OR','Oristano',1,0.00),(3905,105,'PD','Padova',1,0.00),(3906,105,'PA','Palermo',1,0.00),(3907,105,'PR','Parma',1,0.00),(3908,105,'PV','Pavia',1,0.00),(3909,105,'PG','Perugia',1,0.00),(3910,105,'PU','Pesaro e Urbino',1,0.00),(3911,105,'PE','Pescara',1,0.00),(3912,105,'PC','Piacenza',1,0.00),(3913,105,'PI','Pisa',1,0.00),(3914,105,'PT','Pistoia',1,0.00),(3915,105,'PN','Pordenone',1,0.00),(3916,105,'PZ','Potenza',1,0.00),(3917,105,'PO','Prato',1,0.00),(3918,105,'RG','Ragusa',1,0.00),(3919,105,'RA','Ravenna',1,0.00),(3920,105,'RC','Reggio Calabria',1,0.00),(3921,105,'RE','Reggio Emilia',1,0.00),(3922,105,'RI','Rieti',1,0.00),(3923,105,'RN','Rimini',1,0.00),(3924,105,'RM','Roma',1,0.00),(3925,105,'RO','Rovigo',1,0.00),(3926,105,'SA','Salerno',1,0.00),(3927,105,'SS','Sassari',1,0.00),(3928,105,'SV','Savona',1,0.00),(3929,105,'SI','Siena',1,0.00),(3930,105,'SR','Siracusa',1,0.00),(3931,105,'SO','Sondrio',1,0.00),(3932,105,'TA','Taranto',1,0.00),(3933,105,'TE','Teramo',1,0.00),(3934,105,'TR','Terni',1,0.00),(3935,105,'TO','Torino',1,0.00),(3936,105,'TP','Trapani',1,0.00),(3937,105,'TN','Trento',1,0.00),(3938,105,'TV','Treviso',1,0.00),(3939,105,'TS','Trieste',1,0.00),(3940,105,'UD','Udine',1,0.00),(3941,105,'VA','Varese',1,0.00),(3942,105,'VE','Venezia',1,0.00),(3943,105,'VB','Verbano-Cusio-Ossola',1,0.00),(3944,105,'VC','Vercelli',1,0.00),(3945,105,'VR','Verona',1,0.00),(3946,105,'VV','Vibo Valentia',1,0.00),(3947,105,'VI','Vicenza',1,0.00),(3948,105,'VT','Viterbo',1,0.00),(3949,222,'ANT','County Antrim',1,0.00),(3950,222,'ARM','County Armagh',1,0.00),(3951,222,'DOW','County Down',1,0.00),(3952,222,'FER','County Fermanagh',1,0.00),(3953,222,'LDY','County Londonderry',1,0.00),(3954,222,'TYR','County Tyrone',1,0.00),(3955,222,'CMA','Cumbria',1,0.00),(3956,138,'AG','Aguascalientes',1,0.00);
/*!40000 ALTER TABLE `country_zones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupons`
--

DROP TABLE IF EXISTS `coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coupons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `whole_order_coupon` tinyint(1) NOT NULL,
  `max_product_instances` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `max_uses` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `num_uses` mediumint(8) unsigned NOT NULL,
  `reduction_target` varchar(8) NOT NULL,
  `reduction_type` varchar(10) NOT NULL,
  `reduction_amount` float(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupons`
--

LOCK TABLES `coupons` WRITE;
/*!40000 ALTER TABLE `coupons` DISABLE KEYS */;
/*!40000 ALTER TABLE `coupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupons_products`
--

DROP TABLE IF EXISTS `coupons_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coupons_products` (
  `coupon_id` int(9) unsigned NOT NULL,
  `product_id` int(9) unsigned NOT NULL,
  `sequence` int(9) unsigned NOT NULL,
  KEY `coupon_id` (`coupon_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupons_products`
--

LOCK TABLES `coupons_products` WRITE;
/*!40000 ALTER TABLE `coupons_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `coupons_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_groups`
--

DROP TABLE IF EXISTS `customer_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_groups` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `discount` float(10,2) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `discount_type` enum('fixed','percent') NOT NULL DEFAULT 'percent',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_groups`
--

LOCK TABLES `customer_groups` WRITE;
/*!40000 ALTER TABLE `customer_groups` DISABLE KEYS */;
INSERT INTO `customer_groups` VALUES (1,0.00,'Shoppers','fixed');
/*!40000 ALTER TABLE `customer_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(128) NOT NULL,
  `email_subscribe` tinyint(1) NOT NULL DEFAULT '0',
  `phone` varchar(32) NOT NULL,
  `company` varchar(128) NOT NULL,
  `default_billing_address` int(9) NOT NULL,
  `default_shipping_address` int(9) NOT NULL,
  `ship_to_bill_address` enum('false','true') NOT NULL DEFAULT 'true',
  `password` varchar(40) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `group_id` int(11) NOT NULL DEFAULT '1',
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers_address_bank`
--

DROP TABLE IF EXISTS `customers_address_bank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers_address_bank` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(9) unsigned NOT NULL,
  `entry_name` varchar(20) NOT NULL,
  `field_data` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers_address_bank`
--

LOCK TABLES `customers_address_bank` WRITE;
/*!40000 ALTER TABLE `customers_address_bank` DISABLE KEYS */;
/*!40000 ALTER TABLE `customers_address_bank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `digital_products`
--

DROP TABLE IF EXISTS `digital_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `digital_products` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `filename` varchar(100) NOT NULL,
  `max_downloads` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `version` varchar(150) NOT NULL,
  `size` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `digital_products`
--

LOCK TABLES `digital_products` WRITE;
/*!40000 ALTER TABLE `digital_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `digital_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `download_package_files`
--

DROP TABLE IF EXISTS `download_package_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `download_package_files` (
  `package_id` int(9) unsigned NOT NULL,
  `file_id` int(9) unsigned NOT NULL,
  `downloads` int(5) NOT NULL,
  `link` varchar(32) NOT NULL,
  KEY `package_id` (`package_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `download_package_files`
--

LOCK TABLES `download_package_files` WRITE;
/*!40000 ALTER TABLE `download_package_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `download_package_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `download_packages`
--

DROP TABLE IF EXISTS `download_packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `download_packages` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` varchar(60) NOT NULL,
  `customer_id` int(9) unsigned NOT NULL,
  `code` varchar(16) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `download_packages`
--

LOCK TABLES `download_packages` WRITE;
/*!40000 ALTER TABLE `download_packages` DISABLE KEYS */;
/*!40000 ALTER TABLE `download_packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employer`
--

DROP TABLE IF EXISTS `employer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employer` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `id_member` int(10) unsigned DEFAULT NULL,
  `id_state` int(10) unsigned DEFAULT NULL,
  `id_country` int(10) unsigned NOT NULL,
  `prefix` char(5) NOT NULL,
  `suffix` char(5) DEFAULT NULL,
  `other_title` varchar(32) DEFAULT NULL,
  `phone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `phone_mobile` varchar(32) DEFAULT NULL,
  `company_website` varchar(255) DEFAULT NULL,
  `company_video_url` text,
  `logo` text,
  `company` varchar(128) NOT NULL,
  `address1` varchar(128) NOT NULL,
  `address2` varchar(128) DEFAULT NULL,
  `postcode` varchar(12) DEFAULT NULL,
  `city` varchar(64) NOT NULL,
  `company_type` varchar(128) NOT NULL,
  `company_overview` text,
  `show_name` char(1) DEFAULT 'N',
  `show_phone` char(1) DEFAULT 'N',
  `show_fax` char(1) DEFAULT 'N',
  `show_email` char(1) DEFAULT 'N',
  `show_address` char(1) DEFAULT 'N',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employer`
--

LOCK TABLES `employer` WRITE;
/*!40000 ALTER TABLE `employer` DISABLE KEYS */;
/*!40000 ALTER TABLE `employer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employer_single_job`
--

DROP TABLE IF EXISTS `employer_single_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employer_single_job` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_employer` int(10) unsigned DEFAULT NULL,
  `id_state` int(10) unsigned DEFAULT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `job_title` varchar(128) NOT NULL,
  `city` varchar(64) NOT NULL,
  `postcode` varchar(12) DEFAULT NULL,
  `job_type` varchar(128) NOT NULL,
  `position_type` varchar(128) NOT NULL,
  `min_exp` varchar(128) NOT NULL,
  `min_edu` varchar(128) NOT NULL,
  `app_salary` varchar(128) NOT NULL,
  `salary_type` varchar(128) NOT NULL,
  `short_desc` text,
  `long_desc` text,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employer_single_job`
--

LOCK TABLES `employer_single_job` WRITE;
/*!40000 ALTER TABLE `employer_single_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `employer_single_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gift_cards`
--

DROP TABLE IF EXISTS `gift_cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gift_cards` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `order_number` varchar(60) NOT NULL,
  `code` varchar(16) NOT NULL,
  `expiry_date` date NOT NULL,
  `beginning_amount` float(10,2) NOT NULL,
  `amount_used` float(10,2) NOT NULL,
  `to_name` varchar(70) DEFAULT NULL,
  `to_email` varchar(75) NOT NULL,
  `from` varchar(70) DEFAULT NULL,
  `personal_message` mediumtext,
  `activated` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gift_cards`
--

LOCK TABLES `gift_cards` WRITE;
/*!40000 ALTER TABLE `gift_cards` DISABLE KEYS */;
/*!40000 ALTER TABLE `gift_cards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_seeker`
--

DROP TABLE IF EXISTS `job_seeker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_seeker` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(128) NOT NULL,
  `password` varchar(50) NOT NULL,
  `phone` varchar(32) NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_seeker`
--

LOCK TABLES `job_seeker` WRITE;
/*!40000 ALTER TABLE `job_seeker` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_seeker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_seeker_education`
--

DROP TABLE IF EXISTS `job_seeker_education`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_seeker_education` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `school` varchar(128) NOT NULL,
  `major` varchar(100) NOT NULL,
  `gpa` float(10,2) NOT NULL,
  `degree_level` varchar(100) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `desc` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_seeker_education`
--

LOCK TABLES `job_seeker_education` WRITE;
/*!40000 ALTER TABLE `job_seeker_education` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_seeker_education` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_seeker_experience`
--

DROP TABLE IF EXISTS `job_seeker_experience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_seeker_experience` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `company` varchar(128) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `desc` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_seeker_experience`
--

LOCK TABLES `job_seeker_experience` WRITE;
/*!40000 ALTER TABLE `job_seeker_experience` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_seeker_experience` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_seeker_hobbies`
--

DROP TABLE IF EXISTS `job_seeker_hobbies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_seeker_hobbies` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_seeker_hobbies`
--

LOCK TABLES `job_seeker_hobbies` WRITE;
/*!40000 ALTER TABLE `job_seeker_hobbies` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_seeker_hobbies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_seeker_language`
--

DROP TABLE IF EXISTS `job_seeker_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_seeker_language` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `rank` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_seeker_language`
--

LOCK TABLES `job_seeker_language` WRITE;
/*!40000 ALTER TABLE `job_seeker_language` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_seeker_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_seeker_skill`
--

DROP TABLE IF EXISTS `job_seeker_skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_seeker_skill` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `score` float(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_seeker_skill`
--

LOCK TABLES `job_seeker_skill` WRITE;
/*!40000 ALTER TABLE `job_seeker_skill` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_seeker_skill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(128) NOT NULL,
  `password` varchar(50) NOT NULL,
  `char` char(1) DEFAULT 'J',
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `version` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (3);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `option_values`
--

DROP TABLE IF EXISTS `option_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `option_values` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `option_id` int(9) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `price` float(10,2) NOT NULL,
  `weight` float(10,2) NOT NULL,
  `sequence` int(11) NOT NULL,
  `limit` int(9) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `option_values`
--

LOCK TABLES `option_values` WRITE;
/*!40000 ALTER TABLE `option_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `option_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `options`
--

DROP TABLE IF EXISTS `options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `options` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(9) unsigned NOT NULL,
  `sequence` int(5) unsigned NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL,
  `type` varchar(24) NOT NULL,
  `required` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `options`
--

LOCK TABLES `options` WRITE;
/*!40000 ALTER TABLE `options` DISABLE KEYS */;
/*!40000 ALTER TABLE `options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_items` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(9) unsigned NOT NULL,
  `product_id` int(9) unsigned NOT NULL,
  `quantity` int(11) NOT NULL,
  `contents` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_number` varchar(60) NOT NULL,
  `customer_id` int(9) unsigned DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `ordered_on` datetime NOT NULL,
  `shipped_on` datetime NOT NULL,
  `tax` float(10,2) NOT NULL,
  `total` float(10,2) NOT NULL,
  `subtotal` float(10,2) NOT NULL,
  `gift_card_discount` float(10,2) NOT NULL,
  `coupon_discount` float(10,2) NOT NULL,
  `shipping` float(10,2) NOT NULL,
  `shipping_notes` text NOT NULL,
  `shipping_method` tinytext NOT NULL,
  `notes` text,
  `payment_info` text NOT NULL,
  `referral` text NOT NULL,
  `company` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `phone` varchar(40) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `ship_company` varchar(255) DEFAULT NULL,
  `ship_firstname` varchar(255) DEFAULT NULL,
  `ship_lastname` varchar(255) DEFAULT NULL,
  `ship_email` varchar(255) DEFAULT NULL,
  `ship_phone` varchar(40) DEFAULT NULL,
  `ship_address1` varchar(255) DEFAULT NULL,
  `ship_address2` varchar(255) DEFAULT NULL,
  `ship_city` varchar(255) DEFAULT NULL,
  `ship_zip` varchar(11) DEFAULT NULL,
  `ship_zone` varchar(255) DEFAULT NULL,
  `ship_zone_id` int(11) DEFAULT NULL,
  `ship_country` varchar(255) DEFAULT NULL,
  `ship_country_code` varchar(10) DEFAULT NULL,
  `ship_country_id` int(9) unsigned DEFAULT NULL,
  `bill_company` varchar(255) DEFAULT NULL,
  `bill_firstname` varchar(255) DEFAULT NULL,
  `bill_lastname` varchar(255) DEFAULT NULL,
  `bill_email` varchar(255) DEFAULT NULL,
  `bill_phone` varchar(40) DEFAULT NULL,
  `bill_address1` varchar(255) DEFAULT NULL,
  `bill_address2` varchar(255) DEFAULT NULL,
  `bill_city` varchar(255) DEFAULT NULL,
  `bill_zip` varchar(11) DEFAULT NULL,
  `bill_zone` varchar(255) DEFAULT NULL,
  `bill_zone_id` int(9) unsigned DEFAULT NULL,
  `bill_country` varchar(255) DEFAULT NULL,
  `bill_country_code` varchar(10) DEFAULT NULL,
  `bill_country_id` int(9) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(9) unsigned NOT NULL,
  `title` varchar(128) NOT NULL,
  `menu_title` varchar(128) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `route_id` int(128) NOT NULL,
  `content` longtext NOT NULL,
  `sequence` int(11) NOT NULL DEFAULT '0',
  `seo_title` text NOT NULL,
  `meta` text NOT NULL,
  `url` varchar(255) NOT NULL,
  `new_window` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `sku` varchar(30) NOT NULL,
  `name` varchar(128) NOT NULL,
  `slug` varchar(128) NOT NULL,
  `route_id` int(9) unsigned NOT NULL,
  `description` text NOT NULL,
  `excerpt` text NOT NULL,
  `price` float(10,2) NOT NULL DEFAULT '0.00',
  `saleprice` float(10,2) NOT NULL DEFAULT '0.00',
  `free_shipping` tinyint(1) NOT NULL DEFAULT '0',
  `shippable` tinyint(1) NOT NULL DEFAULT '1',
  `taxable` tinyint(1) NOT NULL DEFAULT '1',
  `fixed_quantity` tinyint(1) NOT NULL DEFAULT '0',
  `weight` varchar(10) NOT NULL DEFAULT '0',
  `track_stock` tinyint(1) NOT NULL DEFAULT '0',
  `quantity` int(11) NOT NULL,
  `related_products` text,
  `images` text,
  `seo_title` text,
  `meta` text,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_files`
--

DROP TABLE IF EXISTS `products_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_files` (
  `product_id` int(9) unsigned NOT NULL,
  `file_id` int(9) unsigned NOT NULL,
  KEY `product_id` (`product_id`),
  KEY `file_id` (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_files`
--

LOCK TABLES `products_files` WRITE;
/*!40000 ALTER TABLE `products_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `products_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `routes`
--

DROP TABLE IF EXISTS `routes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `routes` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) NOT NULL,
  `route` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `routes`
--

LOCK TABLES `routes` WRITE;
/*!40000 ALTER TABLE `routes` DISABLE KEYS */;
INSERT INTO `routes` VALUES (1,'post_resume','cart/post_resume'),(2,'post_job','cart/post_job'),(3,'contact_us','cart/contact_us'),(4,'job_listing','cart/job_listing'),(5,'job_detail','cart/job_detail'),(6,'about_us','cart/about_us'),(7,'short_code','cart/short_code');
/*!40000 ALTER TABLE `routes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search`
--

DROP TABLE IF EXISTS `search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `search` (
  `code` varchar(40) NOT NULL,
  `term` varchar(255) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search`
--

LOCK TABLES `search` WRITE;
/*!40000 ALTER TABLE `search` DISABLE KEYS */;
/*!40000 ALTER TABLE `search` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `setting_key` varchar(255) NOT NULL,
  `setting` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'gocart','theme','default'),(2,'gocart','ssl_support','0'),(3,'gocart','company_name','Trainee'),(4,'gocart','address1',''),(5,'gocart','address2',''),(6,'gocart','country',''),(7,'gocart','country_id',''),(8,'gocart','city',''),(9,'gocart','zone_id',''),(10,'gocart','state',''),(11,'gocart','zip',''),(12,'gocart','email',''),(13,'gocart','locale','fr_FR'),(14,'gocart','currency_iso','USD'),(15,'gocart','weight_unit','LB'),(16,'gocart','dimension_unit','IN'),(17,'gocart','require_shipping','1'),(18,'gocart','site_logo','/images/logo.png'),(19,'gocart','admin_folder','admin'),(20,'gocart','new_customer_status','1'),(21,'gocart','require_login','0'),(22,'gocart','order_status','Order Placed'),(23,'gocart','order_statuses','{\"Order Placed\":\"Order Placed\",\"Pending\":\"Pending\",\"Processing\":\"Processing\",\"Shipped\":\"Shipped\",\"On Hold\":\"On Hold\",\"Cancelled\":\"Cancelled\",\"Delivered\":\"Delivered\"}'),(24,'gocart','inventory_enabled','0'),(25,'gocart','allow_os_purchase','1'),(26,'gocart','tax_address','ship'),(27,'gocart','tax_shipping','0');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-07-28 14:51:56
