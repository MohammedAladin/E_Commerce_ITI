-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: ecommercedb
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `buyeditem`
--

DROP TABLE IF EXISTS `buyeditem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buyeditem` (
  `buyedItemId` int NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `totalPrice` decimal(10,2) DEFAULT NULL,
  `orderId` int NOT NULL,
  `productId` int NOT NULL,
  PRIMARY KEY (`buyedItemId`),
  KEY `FK8topbmrtwi6dsnb2xnjx255lx` (`orderId`),
  KEY `FKebhtwcibriystv7tjhrllwdos` (`productId`),
  CONSTRAINT `FK8topbmrtwi6dsnb2xnjx255lx` FOREIGN KEY (`orderId`) REFERENCES `customerorder` (`orderId`),
  CONSTRAINT `FKebhtwcibriystv7tjhrllwdos` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buyeditem`
--

LOCK TABLES `buyeditem` WRITE;
/*!40000 ALTER TABLE `buyeditem` DISABLE KEYS */;
/*!40000 ALTER TABLE `buyeditem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `cartId` int NOT NULL AUTO_INCREMENT,
  `customer_id` int DEFAULT NULL,
  PRIMARY KEY (`cartId`),
  KEY `FKdebwvad6pp1ekiqy5jtixqbaj` (`customer_id`),
  CONSTRAINT `FKdebwvad6pp1ekiqy5jtixqbaj` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customerId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,1),(2,3);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cartitem`
--

DROP TABLE IF EXISTS `cartitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cartitem` (
  `cartItemId` int NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `cartId` int DEFAULT NULL,
  `productId` int DEFAULT NULL,
  PRIMARY KEY (`cartItemId`),
  KEY `FKqwjiex7c2l8l6r5iduyqb2e01` (`cartId`),
  KEY `FKlj3e8ge5f41mi18f592ei25be` (`productId`),
  CONSTRAINT `FKlj3e8ge5f41mi18f592ei25be` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`),
  CONSTRAINT `FKqwjiex7c2l8l6r5iduyqb2e01` FOREIGN KEY (`cartId`) REFERENCES `cart` (`cartId`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartitem`
--

LOCK TABLES `cartitem` WRITE;
/*!40000 ALTER TABLE `cartitem` DISABLE KEYS */;
INSERT INTO `cartitem` VALUES (15,2,1,3);
/*!40000 ALTER TABLE `cartitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `categoryId` int NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(255) NOT NULL,
  PRIMARY KEY (`categoryId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (3,'summerfruit'),(4,'winterfruit'),(5,'vegetables');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creditcard`
--

DROP TABLE IF EXISTS `creditcard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `creditcard` (
  `creditCardId` int NOT NULL AUTO_INCREMENT,
  `cardNumber` varchar(16) NOT NULL,
  `cvv` int NOT NULL,
  `exp_date` date NOT NULL,
  `customer_id` int DEFAULT NULL,
  PRIMARY KEY (`creditCardId`),
  KEY `FK6fhawx0vgp3e9i024ljptx6b1` (`customer_id`),
  CONSTRAINT `FK6fhawx0vgp3e9i024ljptx6b1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creditcard`
--

LOCK TABLES `creditcard` WRITE;
/*!40000 ALTER TABLE `creditcard` DISABLE KEYS */;
/*!40000 ALTER TABLE `creditcard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customerId` int NOT NULL AUTO_INCREMENT,
  `creditLimit` decimal(10,2) NOT NULL,
  `customerImage` varbinary(255) DEFAULT NULL,
  `customerName` varchar(255) NOT NULL,
  `DOB` date NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phoneNumber` varchar(15) NOT NULL,
  PRIMARY KEY (`customerId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,5228.00,NULL,'hassan kamal','2024-03-12','hassan@gmail.com','123456','01010467364'),(2,1500.00,NULL,'mohamed ali','2024-03-05','mohamed@gmail.com','123456','01271929866'),(3,1500.00,NULL,'ali hassan','1999-03-22','ali@gmail.com','12345678a','01271929866');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customerorder`
--

DROP TABLE IF EXISTS `customerorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customerorder` (
  `orderId` int NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `orderStatus` varchar(50) NOT NULL,
  `totalPrice` decimal(10,2) NOT NULL,
  `customerId` int DEFAULT NULL,
  PRIMARY KEY (`orderId`),
  KEY `FKok8nlguayly9hhkdb7ku0bcvp` (`customerId`),
  CONSTRAINT `FKok8nlguayly9hhkdb7ku0bcvp` FOREIGN KEY (`customerId`) REFERENCES `customer` (`customerId`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customerorder`
--

LOCK TABLES `customerorder` WRITE;
/*!40000 ALTER TABLE `customerorder` DISABLE KEYS */;
INSERT INTO `customerorder` VALUES (1,'2024-03-12','Shipped',2400.00,1),(2,'2024-03-12','Delivered',3680.00,2),(3,'2024-03-25','Done',462.00,1),(4,'2024-03-25','Done',462.00,1),(5,'2024-03-25','Done',462.00,1),(6,'2024-03-26','Done',462.00,1),(7,'2024-03-26','Done',462.00,1),(8,'2024-03-26','Done',0.00,1),(9,'2024-03-26','Done',0.00,1),(10,'2024-03-26','Done',462.00,1),(11,'2024-03-26','Done',0.00,1),(12,'2024-03-26','Done',462.00,1),(13,'2024-03-26','Done',462.00,1),(14,'2024-03-26','Done',462.00,1);
/*!40000 ALTER TABLE `customerorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderhistory`
--

DROP TABLE IF EXISTS `orderhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderhistory` (
  `orderId` int NOT NULL,
  `date` date NOT NULL,
  `orderStatus` varchar(50) NOT NULL,
  `paymentMethod` varchar(50) NOT NULL,
  `totalPrice` decimal(10,2) NOT NULL,
  `customerId` int DEFAULT NULL,
  PRIMARY KEY (`orderId`),
  KEY `FKpggj0kysblsiuinyk56m99589` (`customerId`),
  CONSTRAINT `FKpggj0kysblsiuinyk56m99589` FOREIGN KEY (`customerId`) REFERENCES `customer` (`customerId`),
  CONSTRAINT `FKrjtjl5148tjjukwed0q260ckr` FOREIGN KEY (`orderId`) REFERENCES `customerorder` (`orderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderhistory`
--

LOCK TABLES `orderhistory` WRITE;
/*!40000 ALTER TABLE `orderhistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `orderhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `productId` int NOT NULL AUTO_INCREMENT,
  `price` decimal(10,2) NOT NULL,
  `productDescription` tinytext NOT NULL,
  `productImage` blob,
  `productName` varchar(255) NOT NULL,
  `stockCount` int NOT NULL,
  `categoryId` int DEFAULT NULL,
  PRIMARY KEY (`productId`),
  KEY `FK6i3ku5n5njmijfxwv43ktj2ki` (`categoryId`),
  CONSTRAINT `FK6i3ku5n5njmijfxwv43ktj2ki` FOREIGN KEY (`categoryId`) REFERENCES `category` (`categoryId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (3,66.00,'this is grape',_binary '‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0€\0\0\0€\0\0\0\Ã>a\Ë\0\0\0sBIT|dˆ\0\0\0	pHYs\0\0±\0\0±õƒ\íI\0\0\0tEXtSoftware\0www.inkscape.org›\î<\Z\0\0\èIDATxœ\í\ÝkŒ\\eðÿs\Î\ì\î\Ìl÷RÀ*©‹mJ[h\é\Î ø ‰M1šb\Z/ESI\Ì\nK\êö\í\Õ\"‘\Ä\Z•\Æ@šŠ®ú¡úÁT	M­m\Ö2»e%\Ô\Ö\Õ¡V1º\Ë.Ý¹\ìÎœ\Çewg/3;3{æœ™\Ýÿ\ïÓœ\Ûó>\ÉûÌ¹Ìœó€ˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆªøÀ\\ñLÖ§e \0>u®ip\Ã\ÉøS!X\0E\Ú×«u}ƒ\ÉÛ¡¸¢·\0X`)€Ú‰k\Ê\0 pN \'U\ÇM´\îœ÷\ç\Ç(y-ñYˆóUˆ\Ü ¹\Ä0\çD\å°\íè­Ÿ¿\ëf~¥b\ä£*Û»h°\Ö\Å\È#\0~n\Ãþ\Þw#uu1n\ÑX\09\ì83t‹\ãÈ\0\ÜZ\Æf\Ò\0~+eÌº…ï—±œX\0“\ìiÍ¿o‡È“\0ž4ª¸hY²©½%tÜ“ö²°\0²\ìùó\à\ÕÃÀ/\Ü\éCó¨l5\Ñ\Ð^/e|hWwâº´\ê+\0–ùšˆ\Ês«.¿\é\Õe¤\åE#•\Î\ÄŸH«¾\n¿;\0D;{}ü¨zò\åœ÷`\Îô7Cô(€\ëý\ÎeŒÈ—Lw\âi/šš\×`T-8Á—\Ü\àw.\Óh5\Ýñ\ånd^\0\Î$ô.¿\Ó\ÈIñ3Ó•,\ëaÉ›Ëœ21ªb—WAkDt±*®\0Xš\ÅEû-×6Ÿ‘Á)\Û\ÆR7@3»=Oº8\0g?T?-GUw°?¦5ÿ¶\ãw«#r M3l’ðº\0¿°m\ÞzsøŸ\0`º\â¿pO\Ùv@6m‹„^*O\ì*a\Þ\ÔZI\ÆQH+€\ëJ3è‹¢\Öq=\àbz\åö÷k5´\êÑ¨Œ¸¸*\nÀ\Äw@œý€¬ò;ßˆ|Ù´„º¶²OUe{wü	ˆŸ×\0ª•#l\Å\î\Ì1\r !q‚‡üÎ¥RXv\æ\Æö›\Þt5¦›Á\Ü\ÒÑ¡6\Z‡\Øùi&ð·cVdœ]\ß	 \ì?‚T…~\Þ\í˜w\Ø\Þ5t¯BŽ s«\0\Ã†\Z\Ìjv+`E\ížþ“6¨\ÊOÀ\ÎÏ¥\ÖJ\Æor3`E@\"oƒ\à\ã~\çQ\É‘\ånÆ«˜\Ø\ëk‚\Ê7üÎ£\â9\î~A*¦\0RÜŒ\Òï¶O®q3X\Ùþúð›ˆ(–¨…%Pi[(\Î{\0.Á±/ÀNœ6\ë¾¯‚(\Ë\ßsŒÀv3œk`b\Z†•¸Š\0Ü™V]\0*À•Ž\Í\ê\ÝÑ›]\Äœ:5]ñóP¬p+*Ü¬`gObi&­\ß›¡h˜y‹)•yCFE•>7\ã•\\\0&6x\r¤fw&­\î\î–(ÿq3\\I`bC_ƒ\È÷]\èf243zÝŒWT˜NmD ñ£÷B’q3`Á°\ët|I\ÚNü<^ûG\Ñ\ëö#dý°óµäŠ´“`\çû\í¨\Ûg,€]¯\Çg\ÄyÀ·§\"	,\Ó=}ö”†\Ü™‡\é\ÔF\Ô$N\0X\ãVƒ\äŠ$DOˆ\âHm\Í\È\á¶5\Íý¥\Ê_\0]ñC\06•\Zœ<‘\ä,\ì1\ëBo»q\Î0\ÝñP¼<«\Ô\ÈK\Ãýœð.•x¡M[\0{c}MI	öøˆk\é‘W\Î[\ê<\Ø]ðF!+O{˜D°\r\ìüjµ\Â«\ÓÄ†\nºp\Ê`w\çåŽ\ÔXoºy*‘\Í3=K0e0Rk?vþ\\`Cõy\Ó=t_¾•&@G‡\Ú\åz\0|€\Ê\á]©•¹V˜P\0g—%o°¸\ìi‘—\ê3p:öõj\Ýt\'4\ïî‚ª•\Þ\Ø?ü\ÎtK&€b½\'ù\çT´mwl\è\Ú\Éó\Ç\nÀ\Ó €ùý\0\æ\Ü\Zi<s¬\0¬\ÆøjTùˆ!4}\Ø\Ä4œ=g¬\0T\ä“^§C^“F±’÷g\Ï?p®\Ü\ÅKs›B\ïÍž/\0±®ò<òžb½Q?ôg-p|Iˆ¼\Ölw¥–ŽNd\í4\éK:ä¹Œ•Y=ú9û$pÀŸt\ÈsŠ~+\0qð–?Ù\çtü|o|\0üÃŸl\Èk’uÀø/‘\à»¼\çOJ\ä-b&\ë$PNø’y\ËÂ¥ñ\ÙDÿ\ày2\ä9¼3úyb¤Ò¿\à\ÚTT‘2õV¨gtbB˜Ûšú ø÷9‘go´®•¡\Ñ\É)÷\n\ä‡\ÞfDž²ô7&\'/\ß\rƒ\à¤w‘§T=™\ã\áPy\n\àMs\Ð)Y0a|iÀ´„þT\Õ¨ª\ÏLž•óñð\Út¦¿^¤ªw\ÊD\ÂG&\Ï\ÌY\0O\Ý\Úø?\0÷ƒ—…sAÚ‚n™\î\ÅSyˆ0‘p§¨>^¾¼\È¢²£=R\ß5Ý²G\Ù­ÿ)\ßv?-ò†]y!¸\'\×Ò‚\Æ2-\ág¡\Ò^T›\ÎP\"ø`¾Q5.¿\éŽ?\0\Å\0õ³ÍŒ\ÊLp’ºg¦QÅŠ~1ÃŽ\Ø\å›±\0h)57*3ÕƒW5…¿¾e¹¤fZµ¤7s˜c\Z\Æ\ä\n}À‚RbPYô²\ÅDB/ºÁ¬^\Íbz>X„´\Ý\àQ\0®\r]FE†\ÈópF\ÚM´ñ¿\Ål\èÊ»yÌ™þfdj¿‘¯\0ˆº—ft	ÀK`ŸY¾XJ\0\×;\Êô|°HÒõ\n½\rWF]‰+\ã\rñ¹\Ã\Ù\É\0xóPtx‘\à)#2«\ç9<û¦š˜†\ëj¦¤€òK\ÙM#fµ\\ö;\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"ªÿÀ\ïN\ç\Ý*S[\0\0\0\0IEND®B`‚','hassanass',-23,3);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productreview`
--

DROP TABLE IF EXISTS `productreview`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productreview` (
  `reviewId` int NOT NULL AUTO_INCREMENT,
  `rating` int NOT NULL,
  `reviewText` tinytext NOT NULL,
  `customerId` int DEFAULT NULL,
  `productId` int DEFAULT NULL,
  PRIMARY KEY (`reviewId`),
  KEY `FKi7t5sa5kdg07mo02y0ke5r6hi` (`customerId`),
  KEY `FKqwoklxcsf22p5hnplpxsy6kai` (`productId`),
  CONSTRAINT `FKi7t5sa5kdg07mo02y0ke5r6hi` FOREIGN KEY (`customerId`) REFERENCES `customer` (`customerId`),
  CONSTRAINT `FKqwoklxcsf22p5hnplpxsy6kai` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productreview`
--

LOCK TABLES `productreview` WRITE;
/*!40000 ALTER TABLE `productreview` DISABLE KEYS */;
/*!40000 ALTER TABLE `productreview` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-26 16:46:04
