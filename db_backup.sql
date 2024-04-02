-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: my_wallet_db
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account_money`
--

DROP TABLE IF EXISTS `account_money`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_money` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `id_user` int NOT NULL,
  `name_company` varchar(150) NOT NULL,
  `total_money` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_id_user_account_money` (`id_user`),
  CONSTRAINT `fk_id_user_account_money` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_money`
--

LOCK TABLES `account_money` WRITE;
/*!40000 ALTER TABLE `account_money` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_money` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories_type_operation`
--

DROP TABLE IF EXISTS `categories_type_operation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories_type_operation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `id_user` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_id_user_categories_type` (`id_user`),
  CONSTRAINT `fk_id_user_categories_type` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories_type_operation`
--

LOCK TABLES `categories_type_operation` WRITE;
/*!40000 ALTER TABLE `categories_type_operation` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories_type_operation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency`
--

DROP TABLE IF EXISTS `currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `currency` (
  `id_currency` int NOT NULL AUTO_INCREMENT,
  `country_code` varchar(6) NOT NULL,
  `country_number` int DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `currency_name` varchar(50) DEFAULT NULL,
  `currency_code` varchar(50) DEFAULT NULL,
  `currency_number` int DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_currency`)
) ENGINE=InnoDB AUTO_INCREMENT=265 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency`
--

LOCK TABLES `currency` WRITE;
/*!40000 ALTER TABLE `currency` DISABLE KEYS */;
INSERT INTO `currency` VALUES (1,'AFG',4,'AFGHANISTAN','Afghani','AFN',971,'2024-02-29 03:31:14'),(2,'ALB',8,'ALBANIA','Lek','ALL',8,'2024-02-29 03:31:14'),(3,'DZA',12,'ALGERIA','Algerian Dinar','DZD',12,'2024-02-29 03:31:14'),(4,'ASM',16,'AMERICAN SAMOA','US Dollar','USD',840,'2024-02-29 03:31:14'),(5,'AND',20,'ANDORRA','Euro','EUR',978,'2024-02-29 03:31:14'),(6,'AGO',24,'ANGOLA','Kwanza','AOA',973,'2024-02-29 03:31:14'),(7,'AIA',660,'ANGUILLA','East Caribbean Dollar','XCD',951,'2024-02-29 03:31:14'),(8,'ATG',28,'ANTIGUA AND BARBUDA','East Caribbean Dollar','XCD',951,'2024-02-29 03:31:14'),(9,'ARG',32,'ARGENTINA','Argentine Peso','ARS',32,'2024-02-29 03:31:14'),(10,'ARM',51,'ARMENIA','Armenian Dram','AMD',51,'2024-02-29 03:31:14'),(11,'ABW',533,'ARUBA','Aruban Florin','AWG',533,'2024-02-29 03:31:14'),(12,'AUS',36,'AUSTRALIA','Australian Dollar','AUD',36,'2024-02-29 03:31:14'),(13,'AUT',40,'AUSTRIA','Euro','EUR',978,'2024-02-29 03:31:14'),(14,'AZE',31,'AZERBAIJAN','Azerbaijanian Manat','AZN',944,'2024-02-29 03:31:14'),(15,'BHS',44,'BAHAMAS (THE)','Bahamian Dollar','BSD',44,'2024-02-29 03:31:14'),(16,'BHR',48,'BAHRAIN','Bahraini Dinar','BHD',48,'2024-02-29 03:31:14'),(17,'BGD',50,'BANGLADESH','Taka','BDT',50,'2024-02-29 03:31:14'),(18,'BRB',52,'BARBADOS','Barbados Dollar','BBD',52,'2024-02-29 03:31:14'),(19,'BLR',112,'BELARUS','Belarussian Ruble','BYR',974,'2024-02-29 03:31:14'),(20,'BEL',56,'BELGIUM','Euro','EUR',978,'2024-02-29 03:31:14'),(21,'BLZ',84,'BELIZE','Belize Dollar','BZD',84,'2024-02-29 03:31:14'),(22,'BEN',204,'BENIN','CFA Franc BCEAO','XOF',952,'2024-02-29 03:31:14'),(23,'BMU',60,'BERMUDA','Bermudian Dollar','BMD',60,'2024-02-29 03:31:14'),(24,'BTN',64,'BHUTAN','Ngultrum','BTN',64,'2024-02-29 03:31:14'),(25,'BTN',64,'BHUTAN','Indian Rupee','INR',356,'2024-02-29 03:31:14'),(26,'BOL',68,'BOLIVIA (PLURINATIONAL STATE OF)','Boliviano','BOB',68,'2024-02-29 03:31:14'),(27,'BOL',68,'BOLIVIA (PLURINATIONAL STATE OF)','Mvdol','BOV',984,'2024-02-29 03:31:14'),(28,'BES',535,'BONAIRE| SINT EUSTATIUS AND SABA','US Dollar','USD',840,'2024-02-29 03:31:14'),(29,'BIH',70,'BOSNIA AND HERZEGOVINA','Convertible Mark','BAM',977,'2024-02-29 03:31:14'),(30,'BWA',72,'BOTSWANA','Pula','BWP',72,'2024-02-29 03:31:14'),(31,'BVT',74,'BOUVET ISLAND','Norwegian Krone','NOK',578,'2024-02-29 03:31:14'),(32,'BRA',76,'BRAZIL','Brazilian Real','BRL',986,'2024-02-29 03:31:14'),(33,'IOT',86,'BRITISH INDIAN OCEAN TERRITORY (THE)','US Dollar','USD',840,'2024-02-29 03:31:14'),(34,'BRN',96,'BRUNEI DARUSSALAM','Brunei Dollar','BND',96,'2024-02-29 03:31:14'),(35,'BGR',100,'BULGARIA','Bulgarian Lev','BGN',975,'2024-02-29 03:31:14'),(36,'BFA',854,'BURKINA FASO','CFA Franc BCEAO','XOF',952,'2024-02-29 03:31:14'),(37,'BDI',108,'BURUNDI','Burundi Franc','BIF',108,'2024-02-29 03:31:14'),(38,'CPV',132,'CABO VERDE','Cabo Verde Escudo','CVE',132,'2024-02-29 03:31:14'),(39,'KHM',116,'CAMBODIA','Riel','KHR',116,'2024-02-29 03:31:14'),(40,'CMR',120,'CAMEROON','CFA Franc BEAC','XAF',950,'2024-02-29 03:31:14'),(41,'CAN',124,'CANADA','Canadian Dollar','CAD',124,'2024-02-29 03:31:14'),(42,'CYM',136,'CAYMAN ISLANDS (THE)','Cayman Islands Dollar','KYD',136,'2024-02-29 03:31:14'),(43,'CAF',140,'CENTRAL AFRICAN REPUBLIC (THE)','CFA Franc BEAC','XAF',950,'2024-02-29 03:31:14'),(44,'TCD',148,'CHAD','CFA Franc BEAC','XAF',950,'2024-02-29 03:31:14'),(45,'CHL',152,'CHILE','Unidad de Fomento','CLF',990,'2024-02-29 03:31:14'),(46,'CHL',152,'CHILE','Chilean Peso','CLP',152,'2024-02-29 03:31:14'),(47,'CHN',156,'CHINA','Yuan Renminbi','CNY',156,'2024-02-29 03:31:14'),(48,'CXR',162,'CHRISTMAS ISLAND','Australian Dollar','AUD',36,'2024-02-29 03:31:14'),(49,'CCK',166,'COCOS (KEELING) ISLANDS (THE)','Australian Dollar','AUD',36,'2024-02-29 03:31:14'),(50,'COL',170,'COLOMBIA','Colombian Peso','COP',170,'2024-02-29 03:31:14'),(51,'COL',170,'COLOMBIA','Unidad de Valor Real','COU',970,'2024-02-29 03:31:14'),(52,'COM',174,'COMOROS (THE)','Comoro Franc','KMF',174,'2024-02-29 03:31:14'),(53,'COD',180,'CONGO (THE DEMOCRATIC REPUBLIC OF THE)','Congolese Franc','CDF',976,'2024-02-29 03:31:14'),(54,'COG',178,'CONGO (THE)','CFA Franc BEAC','XAF',950,'2024-02-29 03:31:14'),(55,'COK',184,'COOK ISLANDS (THE)','New Zealand Dollar','NZD',554,'2024-02-29 03:31:14'),(56,'CRI',188,'COSTA RICA','Costa Rican Colon','CRC',188,'2024-02-29 03:31:14'),(57,'HRV',191,'CROATIA','Kuna','HRK',191,'2024-02-29 03:31:14'),(58,'CUB',192,'CUBA','Peso Convertible','CUC',931,'2024-02-29 03:31:14'),(59,'CUB',192,'CUBA','Cuban Peso','CUP',192,'2024-02-29 03:31:14'),(60,'CUW',531,'CURAÃ‡AO','Netherlands Antillean Guilder','ANG',532,'2024-02-29 03:31:14'),(61,'CYP',196,'CYPRUS','Euro','EUR',978,'2024-02-29 03:31:14'),(62,'CZE',203,'CZECH REPUBLIC (THE)','Czech Koruna','CZK',203,'2024-02-29 03:31:14'),(63,'CIV',384,'CÃ”TE D\'IVOIRE','CFA Franc BCEAO','XOF',952,'2024-02-29 03:31:14'),(64,'DNK',208,'DENMARK','Danish Krone','DKK',208,'2024-02-29 03:31:14'),(65,'DJI',262,'DJIBOUTI','Djibouti Franc','DJF',262,'2024-02-29 03:31:14'),(66,'DMA',212,'DOMINICA','East Caribbean Dollar','XCD',951,'2024-02-29 03:31:14'),(67,'DOM',214,'DOMINICAN REPUBLIC (THE)','Dominican Peso','DOP',214,'2024-02-29 03:31:14'),(68,'ECU',218,'ECUADOR','US Dollar','USD',840,'2024-02-29 03:31:14'),(69,'EGY',818,'EGYPT','Egyptian Pound','EGP',818,'2024-02-29 03:31:14'),(70,'SLV',222,'EL SALVADOR','El Salvador Colon','SVC',222,'2024-02-29 03:31:14'),(71,'SLV',222,'EL SALVADOR','US Dollar','USD',840,'2024-02-29 03:31:14'),(72,'GNQ',226,'EQUATORIAL GUINEA','CFA Franc BEAC','XAF',950,'2024-02-29 03:31:14'),(73,'ERI',232,'ERITREA','Nakfa','ERN',232,'2024-02-29 03:31:14'),(74,'EST',233,'ESTONIA','Euro','EUR',978,'2024-02-29 03:31:14'),(75,'ETH',231,'ETHIOPIA','Ethiopian Birr','ETB',230,'2024-02-29 03:31:14'),(76,'DEU',276,'EUROPEAN UNION','Euro','EUR',978,'2024-02-29 03:31:14'),(77,'FLK',238,'FALKLAND ISLANDS (THE) [MALVINAS]','Falkland Islands Pound','FKP',238,'2024-02-29 03:31:14'),(78,'FRO',234,'FAROE ISLANDS (THE)','Danish Krone','DKK',208,'2024-02-29 03:31:14'),(79,'FJI',242,'FIJI','Fiji Dollar','FJD',242,'2024-02-29 03:31:14'),(80,'FIN',246,'FINLAND','Euro','EUR',978,'2024-02-29 03:31:14'),(81,'FRA',250,'FRANCE','Euro','EUR',978,'2024-02-29 03:31:14'),(82,'GUF',254,'FRENCH GUIANA','Euro','EUR',978,'2024-02-29 03:31:14'),(83,'PYF',258,'FRENCH POLYNESIA','CFP Franc','XPF',953,'2024-02-29 03:31:14'),(84,'ATF',260,'FRENCH SOUTHERN TERRITORIES (THE)','Euro','EUR',978,'2024-02-29 03:31:14'),(85,'GAB',266,'GABON','CFA Franc BEAC','XAF',950,'2024-02-29 03:31:14'),(86,'GMB',270,'GAMBIA (THE)','Dalasi','GMD',270,'2024-02-29 03:31:14'),(87,'GEO',268,'GEORGIA','Lari','GEL',981,'2024-02-29 03:31:14'),(88,'DEU',276,'GERMANY','Euro','EUR',978,'2024-02-29 03:31:14'),(89,'GHA',288,'GHANA','Ghana Cedi','GHS',936,'2024-02-29 03:31:14'),(90,'GIB',292,'GIBRALTAR','Gibraltar Pound','GIP',292,'2024-02-29 03:31:14'),(91,'GRC',300,'GREECE','Euro','EUR',978,'2024-02-29 03:31:14'),(92,'GRL',304,'GREENLAND','Danish Krone','DKK',208,'2024-02-29 03:31:14'),(93,'GRD',308,'GRENADA','East Caribbean Dollar','XCD',951,'2024-02-29 03:31:14'),(94,'GLP',312,'GUADELOUPE','Euro','EUR',978,'2024-02-29 03:31:14'),(95,'GUM',316,'GUAM','US Dollar','USD',840,'2024-02-29 03:31:14'),(96,'GTM',320,'GUATEMALA','Quetzal','GTQ',320,'2024-02-29 03:31:14'),(97,'GGY',831,'GUERNSEY','Pound Sterling','GBP',826,'2024-02-29 03:31:14'),(98,'GIN',324,'GUINEA','Guinea Franc','GNF',324,'2024-02-29 03:31:14'),(99,'GNB',624,'GUINEA-BISSAU','CFA Franc BCEAO','XOF',952,'2024-02-29 03:31:14'),(100,'GUY',328,'GUYANA','Guyana Dollar','GYD',328,'2024-02-29 03:31:14'),(101,'HTI',332,'HAITI','Gourde','HTG',332,'2024-02-29 03:31:14'),(102,'HTI',332,'HAITI','US Dollar','USD',840,'2024-02-29 03:31:14'),(103,'HMD',334,'HEARD ISLAND AND McDONALD ISLANDS','Australian Dollar','AUD',36,'2024-02-29 03:31:14'),(104,'VAT',336,'HOLY SEE (THE)','Euro','EUR',978,'2024-02-29 03:31:15'),(105,'HND',340,'HONDURAS','Lempira','HNL',340,'2024-02-29 03:31:15'),(106,'HKG',344,'HONG KONG','Hong Kong Dollar','HKD',344,'2024-02-29 03:31:15'),(107,'HUN',348,'HUNGARY','Forint','HUF',348,'2024-02-29 03:31:15'),(108,'ISL',352,'ICELAND','Iceland Krona','ISK',352,'2024-02-29 03:31:15'),(109,'IND',356,'INDIA','Indian Rupee','INR',356,'2024-02-29 03:31:15'),(110,'IDN',360,'INDONESIA','Rupiah','IDR',360,'2024-02-29 03:31:15'),(111,'IRN',364,'IRAN (ISLAMIC REPUBLIC OF)','Iranian Rial','IRR',364,'2024-02-29 03:31:15'),(112,'IRQ',368,'IRAQ','Iraqi Dinar','IQD',368,'2024-02-29 03:31:15'),(113,'IRL',372,'IRELAND','Euro','EUR',978,'2024-02-29 03:31:15'),(114,'IMN',833,'ISLE OF MAN','Pound Sterling','GBP',826,'2024-02-29 03:31:15'),(115,'ISR',376,'ISRAEL','New Israeli Sheqel','ILS',376,'2024-02-29 03:31:15'),(116,'ITA',380,'ITALY','Euro','EUR',978,'2024-02-29 03:31:15'),(117,'JAM',388,'JAMAICA','Jamaican Dollar','JMD',388,'2024-02-29 03:31:15'),(118,'JPN',392,'JAPAN','Yen','JPY',392,'2024-02-29 03:31:15'),(119,'JEY',832,'JERSEY','Pound Sterling','GBP',826,'2024-02-29 03:31:15'),(120,'JOR',400,'JORDAN','Jordanian Dinar','JOD',400,'2024-02-29 03:31:15'),(121,'KAZ',398,'KAZAKHSTAN','Tenge','KZT',398,'2024-02-29 03:31:15'),(122,'KEN',404,'KENYA','Kenyan Shilling','KES',404,'2024-02-29 03:31:15'),(123,'KIR',296,'KIRIBATI','Australian Dollar','AUD',36,'2024-02-29 03:31:15'),(124,'PRK',408,'KOREA (THE DEMOCRATIC PEOPLEâ€™S REPUBLIC OF)','North Korean Won','KPW',408,'2024-02-29 03:31:15'),(125,'KOR',410,'KOREA (THE REPUBLIC OF)','Won','KRW',410,'2024-02-29 03:31:15'),(126,'KWT',414,'KUWAIT','Kuwaiti Dinar','KWD',414,'2024-02-29 03:31:15'),(127,'KGZ',417,'KYRGYZSTAN','Som','KGS',417,'2024-02-29 03:31:15'),(128,'LAO',418,'LAO PEOPLEâ€™S DEMOCRATIC REPUBLIC (THE)','Kip','LAK',418,'2024-02-29 03:31:15'),(129,'LVA',428,'LATVIA','Euro','EUR',978,'2024-02-29 03:31:15'),(130,'LBN',422,'LEBANON','Lebanese Pound','LBP',422,'2024-02-29 03:31:15'),(131,'LSO',426,'LESOTHO','Loti','LSL',426,'2024-02-29 03:31:15'),(132,'LSO',426,'LESOTHO','Rand','ZAR',710,'2024-02-29 03:31:15'),(133,'LBR',430,'LIBERIA','Liberian Dollar','LRD',430,'2024-02-29 03:31:15'),(134,'LBY',434,'LIBYA','Libyan Dinar','LYD',434,'2024-02-29 03:31:15'),(135,'LIE',438,'LIECHTENSTEIN','Swiss Franc','CHF',756,'2024-02-29 03:31:15'),(136,'LTU',440,'LITHUANIA','Euro','EUR',978,'2024-02-29 03:31:15'),(137,'LUX',442,'LUXEMBOURG','Euro','EUR',978,'2024-02-29 03:31:15'),(138,'MAC',446,'MACAO','Pataca','MOP',446,'2024-02-29 03:31:15'),(139,'MKD',807,'MACEDONIA (THE FORMER YUGOSLAV REPUBLIC OF)','Denar','MKD',807,'2024-02-29 03:31:15'),(140,'MDG',450,'MADAGASCAR','Malagasy Ariary','MGA',969,'2024-02-29 03:31:15'),(141,'MWI',454,'MALAWI','Kwacha','MWK',454,'2024-02-29 03:31:15'),(142,'MYS',458,'MALAYSIA','Malaysian Ringgit','MYR',458,'2024-02-29 03:31:15'),(143,'MDV',462,'MALDIVES','Rufiyaa','MVR',462,'2024-02-29 03:31:15'),(144,'MLI',466,'MALI','CFA Franc BCEAO','XOF',952,'2024-02-29 03:31:15'),(145,'MLT',470,'MALTA','Euro','EUR',978,'2024-02-29 03:31:15'),(146,'MHL',584,'MARSHALL ISLANDS (THE)','US Dollar','USD',840,'2024-02-29 03:31:15'),(147,'MTQ',474,'MARTINIQUE','Euro','EUR',978,'2024-02-29 03:31:15'),(148,'MRT',478,'MAURITANIA','Ouguiya','MRU',929,'2024-02-29 03:31:15'),(149,'MUS',480,'MAURITIUS','Mauritius Rupee','MUR',480,'2024-02-29 03:31:15'),(150,'MYT',175,'MAYOTTE','Euro','EUR',978,'2024-02-29 03:31:15'),(151,'MEX',484,'MEXICO','Mexican Peso','MXN',484,'2024-02-29 03:31:15'),(152,'MEX',484,'MEXICO','Mexican Unidad de Inversion (UDI)','MXV',979,'2024-02-29 03:31:15'),(153,'FSM',583,'MICRONESIA (FEDERATED STATES OF)','US Dollar','USD',840,'2024-02-29 03:31:15'),(154,'MDA',498,'MOLDOVA (THE REPUBLIC OF)','Moldovan Leu','MDL',498,'2024-02-29 03:31:15'),(155,'MCO',492,'MONACO','Euro','EUR',978,'2024-02-29 03:31:15'),(156,'MNG',496,'MONGOLIA','Tugrik','MNT',496,'2024-02-29 03:31:15'),(157,'MNE',499,'MONTENEGRO','Euro','EUR',978,'2024-02-29 03:31:15'),(158,'MSR',500,'MONTSERRAT','East Caribbean Dollar','XCD',951,'2024-02-29 03:31:15'),(159,'MAR',504,'MOROCCO','Moroccan Dirham','MAD',504,'2024-02-29 03:31:15'),(160,'MOZ',508,'MOZAMBIQUE','Mozambique Metical','MZN',943,'2024-02-29 03:31:15'),(161,'MMR',104,'MYANMAR','Kyat','MMK',104,'2024-02-29 03:31:15'),(162,'NAM',516,'NAMIBIA','Namibia Dollar','NAD',516,'2024-02-29 03:31:15'),(163,'NAM',516,'NAMIBIA','Rand','ZAR',710,'2024-02-29 03:31:15'),(164,'NRU',520,'NAURU','Australian Dollar','AUD',36,'2024-02-29 03:31:15'),(165,'NPL',524,'NEPAL','Nepalese Rupee','NPR',524,'2024-02-29 03:31:15'),(166,'NLD',528,'NETHERLANDS (THE)','Euro','EUR',978,'2024-02-29 03:31:15'),(167,'NCL',540,'NEW CALEDONIA','CFP Franc','XPF',953,'2024-02-29 03:31:15'),(168,'NZL',554,'NEW ZEALAND','New Zealand Dollar','NZD',554,'2024-02-29 03:31:15'),(169,'NIC',558,'NICARAGUA','Cordoba Oro','NIO',558,'2024-02-29 03:31:15'),(170,'NER',562,'NIGER (THE)','CFA Franc BCEAO','XOF',952,'2024-02-29 03:31:15'),(171,'NGA',566,'NIGERIA','Naira','NGN',566,'2024-02-29 03:31:15'),(172,'NIU',570,'NIUE','New Zealand Dollar','NZD',554,'2024-02-29 03:31:15'),(173,'NFK',574,'NORFOLK ISLAND','Australian Dollar','AUD',36,'2024-02-29 03:31:15'),(174,'MNP',580,'NORTHERN MARIANA ISLANDS (THE)','US Dollar','USD',840,'2024-02-29 03:31:15'),(175,'NOR',578,'NORWAY','Norwegian Krone','NOK',578,'2024-02-29 03:31:15'),(176,'OMN',512,'OMAN','Rial Omani','OMR',512,'2024-02-29 03:31:15'),(177,'PAK',586,'PAKISTAN','Pakistan Rupee','PKR',586,'2024-02-29 03:31:15'),(178,'PLW',585,'PALAU','US Dollar','USD',840,'2024-02-29 03:31:15'),(179,'PSE',275,'PALESTINE',' None','Non',0,'2024-02-29 03:31:15'),(180,'PAN',591,'PANAMA','Balboa','PAB',590,'2024-02-29 03:31:15'),(181,'PAN',591,'PANAMA','US Dollar','USD',840,'2024-02-29 03:31:15'),(182,'PNG',598,'PAPUA NEW GUINEA','Kina','PGK',598,'2024-02-29 03:31:15'),(183,'PRY',600,'PARAGUAY','Guarani','PYG',600,'2024-02-29 03:31:15'),(184,'PER',604,'PERU','Nuevo Sol','PEN',604,'2024-02-29 03:31:15'),(185,'PHL',608,'PHILIPPINES (THE)','Philippine Peso','PHP',608,'2024-02-29 03:31:15'),(186,'PCN',612,'PITCAIRN','New Zealand Dollar','NZD',554,'2024-02-29 03:31:15'),(187,'POL',616,'POLAND','Zloty','PLN',985,'2024-02-29 03:31:15'),(188,'PRT',620,'PORTUGAL','Euro','EUR',978,'2024-02-29 03:31:15'),(189,'PRI',630,'PUERTO RICO','US Dollar','USD',840,'2024-02-29 03:31:15'),(190,'QAT',634,'QATAR','Qatari Rial','QAR',634,'2024-02-29 03:31:15'),(191,'REU',638,'RÃ‰UNION','Euro','EUR',978,'2024-02-29 03:31:15'),(192,'ROU',642,'ROMANIA','Romanian Leu','RON',946,'2024-02-29 03:31:15'),(193,'RUS',643,'RUSSIAN FEDERATION (THE)','Russian Ruble','RUB',643,'2024-02-29 03:31:15'),(194,'RWA',646,'RWANDA','Rwanda Franc','RWF',646,'2024-02-29 03:31:15'),(195,'BLM',652,'SAINT BARTHÃ‰LEMY','Euro','EUR',978,'2024-02-29 03:31:15'),(196,'SHN',654,'SAINT HELENA| ASCENSION AND TRISTAN DA CUNHA','Saint Helena Pound','SHP',654,'2024-02-29 03:31:15'),(197,'KNA',659,'SAINT KITTS AND NEVIS','East Caribbean Dollar','XCD',951,'2024-02-29 03:31:15'),(198,'LCA',662,'SAINT LUCIA','East Caribbean Dollar','XCD',951,'2024-02-29 03:31:15'),(199,'MAF',663,'SAINT MARTIN (FRENCH PART)','Euro','EUR',978,'2024-02-29 03:31:15'),(200,'SPM',666,'SAINT PIERRE AND MIQUELON','Euro','EUR',978,'2024-02-29 03:31:15'),(201,'VCT',670,'SAINT VINCENT AND THE GRENADINES','East Caribbean Dollar','XCD',951,'2024-02-29 03:31:15'),(202,'WSM',882,'SAMOA','Tala','WST',882,'2024-02-29 03:31:15'),(203,'SMR',674,'SAN MARINO','Euro','EUR',978,'2024-02-29 03:31:15'),(204,'STP',678,'SAO TOME AND PRINCIPE','Dobra','STN',930,'2024-02-29 03:31:15'),(205,'SAU',682,'SAUDI ARABIA','Saudi Riyal','SAR',682,'2024-02-29 03:31:15'),(206,'SEN',686,'SENEGAL','CFA Franc BCEAO','XOF',952,'2024-02-29 03:31:15'),(207,'SRB',688,'SERBIA','Serbian Dinar','RSD',941,'2024-02-29 03:31:15'),(208,'SYC',690,'SEYCHELLES','Seychelles Rupee','SCR',690,'2024-02-29 03:31:15'),(209,'SLE',694,'SIERRA LEONE','Leone','SLL',694,'2024-02-29 03:31:15'),(210,'SGP',702,'SINGAPORE','Singapore Dollar','SGD',702,'2024-02-29 03:31:15'),(211,'SXM',534,'SINT MAARTEN (DUTCH PART)','Netherlands Antillean Guilder','ANG',532,'2024-02-29 03:31:15'),(212,'SVK',703,'SLOVAKIA','Euro','EUR',978,'2024-02-29 03:31:15'),(213,'SVN',705,'SLOVENIA','Euro','EUR',978,'2024-02-29 03:31:15'),(214,'SLB',90,'SOLOMON ISLANDS','Solomon Islands Dollar','SBD',90,'2024-02-29 03:31:15'),(215,'SOM',706,'SOMALIA','Somali Shilling','SOS',706,'2024-02-29 03:31:16'),(216,'ZAF',710,'SOUTH AFRICA','Rand','ZAR',710,'2024-02-29 03:31:16'),(217,'SGS',239,'SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS',' none','NON',0,'2024-02-29 03:31:16'),(218,'SSD',728,'SOUTH SUDAN','South Sudanese Pound','SSP',728,'2024-02-29 03:31:16'),(219,'ESP',724,'SPAIN','Euro','EUR',978,'2024-02-29 03:31:16'),(220,'LKA',144,'SRI LANKA','Sri Lanka Rupee','LKR',144,'2024-02-29 03:31:16'),(221,'SDN',729,'SUDAN (THE)','Sudanese Pound','SDG',938,'2024-02-29 03:31:16'),(222,'SUR',740,'SURINAME','Surinam Dollar','SRD',968,'2024-02-29 03:31:16'),(223,'SJM',744,'SVALBARD AND JAN MAYEN','Norwegian Krone','NOK',578,'2024-02-29 03:31:16'),(224,'SWZ',748,'SWAZILAND','Lilangeni','SZL',748,'2024-02-29 03:31:16'),(225,'SWE',752,'SWEDEN','Swedish Krona','SEK',752,'2024-02-29 03:31:16'),(226,'CHE',756,'SWITZERLAND','WIR Euro','CHE',947,'2024-02-29 03:31:16'),(227,'CHE',756,'SWITZERLAND','Swiss Franc','CHF',756,'2024-02-29 03:31:16'),(228,'CHE',756,'SWITZERLAND','WIR Franc','CHW',948,'2024-02-29 03:31:16'),(229,'SYR',760,'SYRIAN ARAB REPUBLIC','Syrian Pound','SYP',760,'2024-02-29 03:31:16'),(230,'TWN',158,'TAIWAN (PROVINCE OF CHINA)','New Taiwan Dollar','TWD',901,'2024-02-29 03:31:16'),(231,'TJK',762,'TAJIKISTAN','Somoni','TJS',972,'2024-02-29 03:31:16'),(232,'TZA',834,'TANZANIA| UNITED REPUBLIC OF','Tanzanian Shilling','TZS',834,'2024-02-29 03:31:16'),(233,'THA',764,'THAILAND','Baht','THB',764,'2024-02-29 03:31:16'),(234,'TLS',626,'TIMOR-LESTE','US Dollar','USD',840,'2024-02-29 03:31:16'),(235,'TGO',768,'TOGO','CFA Franc BCEAO','XOF',952,'2024-02-29 03:31:16'),(236,'TKL',772,'TOKELAU','New Zealand Dollar','NZD',554,'2024-02-29 03:31:16'),(237,'TON',776,'TONGA','Paâ€™anga','TOP',776,'2024-02-29 03:31:16'),(238,'TTO',780,'TRINIDAD AND TOBAGO','Trinidad and Tobago Dollar','TTD',780,'2024-02-29 03:31:16'),(239,'TUN',788,'TUNISIA','Tunisian Dinar','TND',788,'2024-02-29 03:31:16'),(240,'TUR',792,'TURKEY','Turkish Lira','TRY',949,'2024-02-29 03:31:16'),(241,'TKM',795,'TURKMENISTAN','Turkmenistan New Manat','TMT',934,'2024-02-29 03:31:16'),(242,'TCA',796,'TURKS AND CAICOS ISLANDS (THE)','US Dollar','USD',840,'2024-02-29 03:31:16'),(243,'TUV',798,'TUVALU','Australian Dollar','AUD',36,'2024-02-29 03:31:16'),(244,'UGA',800,'UGANDA','Uganda Shilling','UGX',800,'2024-02-29 03:31:16'),(245,'UKR',804,'UKRAINE','Hryvnia','UAH',980,'2024-02-29 03:31:16'),(246,'ARE',784,'UNITED ARAB EMIRATES (THE)','UAE Dirham','AED',784,'2024-02-29 03:31:16'),(247,'UMI',581,'UNITED STATES MINOR OUTLYING ISLANDS (THE)','US Dollar','USD',840,'2024-02-29 03:31:16'),(248,'USA',840,'UNITED STATES OF AMERICA (THE)','US Dollar','USD',840,'2024-02-29 03:31:16'),(249,'USA',840,'UNITED STATES OF AMERICA (THE)','US Dollar (Next day)','USN',997,'2024-02-29 03:31:16'),(250,'URY',858,'URUGUAY','Uruguay Peso en Unidades Indexadas (URUIURUI)','UYI',940,'2024-02-29 03:31:16'),(251,'URY',858,'URUGUAY','Peso Uruguayo','UYU',858,'2024-02-29 03:31:16'),(252,'UZB',860,'UZBEKISTAN','Uzbekistan Sum','UZS',860,'2024-02-29 03:31:16'),(253,'VUT',548,'VANUATU','Vatu','VUV',548,'2024-02-29 03:31:16'),(254,'VEN',862,'VENEZUELA (BOLIVARIAN REPUBLIC OF)','Bolivar','VEF',937,'2024-02-29 03:31:16'),(255,'VNM',704,'VIET NAM','Dong','VND',704,'2024-02-29 03:31:16'),(256,'VGB',92,'VIRGIN ISLANDS (BRITISH)','US Dollar','USD',840,'2024-02-29 03:31:16'),(257,'VIR',850,'VIRGIN ISLANDS (U.S.)','US Dollar','USD',840,'2024-02-29 03:31:16'),(258,'WLF',876,'WALLIS AND FUTUNA','CFP Franc','XPF',953,'2024-02-29 03:31:16'),(259,'ESH',732,'WESTERN SAHARA','Moroccan Dirham','MAD',504,'2024-02-29 03:31:16'),(260,'YEM',887,'YEMEN','Yemeni Rial','YER',886,'2024-02-29 03:31:16'),(261,'ZMB',894,'ZAMBIA','Zambian Kwacha','ZMW',967,'2024-02-29 03:31:16'),(262,'ZWE',716,'ZIMBABWE','Zimbabwe Dollar','ZWL',932,'2024-02-29 03:31:16'),(263,'ALA',248,'Ã…LAND ISLANDS','Euro','EUR',978,'2024-02-29 03:31:16'),(264,'ATA',10,'Antarctica','None','NON',0,'2024-02-29 03:31:16');
/*!40000 ALTER TABLE `currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency_user`
--

DROP TABLE IF EXISTS `currency_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `currency_user` (
  `id_currency_user` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `id_currency` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_currency_user`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency_user`
--

LOCK TABLES `currency_user` WRITE;
/*!40000 ALTER TABLE `currency_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `currency_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operations`
--

DROP TABLE IF EXISTS `operations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `operations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `id_user` int NOT NULL,
  `type_operation` enum('IN','OUT') NOT NULL,
  `state_operation` varchar(20) NOT NULL,
  `id_type_category` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date_operation` timestamp NOT NULL,
  `quantity` double NOT NULL,
  `id_account_money` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_id_user` (`id_user`),
  KEY `fk_id_type_category` (`id_type_category`),
  KEY `fk_operations_id_account_money` (`id_account_money`),
  CONSTRAINT `fk_id_type_category` FOREIGN KEY (`id_type_category`) REFERENCES `categories_type_operation` (`id`),
  CONSTRAINT `fk_id_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_operations_id_account_money` FOREIGN KEY (`id_account_money`) REFERENCES `account_money` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operations`
--

LOCK TABLES `operations` WRITE;
/*!40000 ALTER TABLE `operations` DISABLE KEYS */;
/*!40000 ALTER TABLE `operations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','2023-12-19 06:06:40','2023-12-19 06:06:40'),(2,'customer','2023-12-19 06:07:01','2023-12-19 06:07:01');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_users`
--

DROP TABLE IF EXISTS `roles_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idRole` int NOT NULL,
  `idUser` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idUser` (`idUser`),
  KEY `idRole` (`idRole`),
  CONSTRAINT `roles_users_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`),
  CONSTRAINT `roles_users_ibfk_2` FOREIGN KEY (`idRole`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_users`
--

LOCK TABLES `roles_users` WRITE;
/*!40000 ALTER TABLE `roles_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `password` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=160 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-02 16:18:15
