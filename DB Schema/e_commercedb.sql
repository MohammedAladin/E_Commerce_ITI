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
INSERT INTO `product` VALUES (3,66.00,'this is grape',_binary '�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0�\0\0\0�\0\0\0\�>a\�\0\0\0sBIT|d�\0\0\0	pHYs\0\0�\0\0���\�I\0\0\0tEXtSoftware\0www.inkscape.org�\�<\Z\0\0\�IDATx�\�\�k�\\e��s\�\�\�\�l�R�*��mJ[h\�\� � �M1�b\Z/ESI\�\nK\��\�\�\"�\�\Z�\�@�������T	M�m\�2�e%\�\�\��V1�\�.ݹ\�Μ\�ewg/3;3{朙\��\�Ӝ\��>\��̹̜��������������������������������\\�L�֧e�\0>u�ip\�\���S!X\0E\�׫u}�\�ۡ���\0X`)�ډk\�\0�pN�\'U\�M�\��\�\�(�y-�Y��U�\���\�0\�D\�\�聭��\�f~�b\�*ۻh�\�\�\�#\0~n\��\�w#uu1n\�X\09\�83t�\�ȏ\0\�Z\�f\�\0~+e̺���X\0�\�iͿo�ȓ\0�4��hY���%tܓ���\0�\���\�\�Á�/\�\�C��l5\�\�^/e|hWw⺴\�+\0����\�s�.�\�\�e�\�E#�\�\��H��\n�;\0D;{}��z�\��`\��7C�(�\��\�e�ȗLw\�i/��\�`T-8��\�\�w.\�h5\��\�nd^\0\�$�.�\�\�I�3ӕ,\�aɛ˜21�b�WAkDt�*�\0X�\�E�-ם6���)\�\�R7@3�=O�8\0g?T?-GUw�?�5��\�w�#r�M3l��\0��m\�zs��\0`�\�pO\�v�@6m��^*O\�*a\�\�ZI\�QH+�\�J3苢\�q=\�bz\���k5�\�Ѩ���*\n�\�w@�����;߈|ٴ����OUe{w�	��ם\0���#l\�\�\�1\r�!q���ΥRXv\�\���\�t5���\�\�ѡ6\Z�\��i&��cVd�]\�	�\�?�T�~\�\�w\�\�5t�B��s�\0\��\Z\�jv+`E\����6�\�O�\�ϥ\�J\�or3`E@\"o�\�\�~\�Q\��\�nƫ�\�\�k�\�7�Σ\�9\�~A*�\0R܌\�ﶝO�q3X\������(���%Pi[(\�{\0.��/�N�6\�����(\�\�s��v3�k`b\Z����\0ܙV]\0*���\�\�\�ћ]\��:5]��P�p+*ܬ`gObi&�\���h�y�)�yCFE�>7\�\\\0&6x\r�fw&�\�\�(�q3\\I`bC_�\��]\�f243z݌WT�NmD ����B�q3`��\�t|I\�N�<^�G\�\��#d���䊴��`\��\�\�g,�]�\�g\�y���\"	,\�=}���\���\�\�F\�$N\0X\�V�\�$DO�\�Hm\�\�\�5\���\�_\0]�C\06�\Z�<�\�,\�1\�Bo�q\�0\��P�<�\�\�K\����.�x�M[\0{c}MI	���k\�W\�[\�<\�]�F!+O{�D�\r\��j�\��\�Ć\n�p\�`w\�収\�Xo��y*�\�3=K0e0Rk?v�\\`C�y\�=t_��&@G�\�\�z\0�|�\�\�]���V�P\0g�%o��\�i��\�3p:��j\�t\'4\��\�\�?��\�tK&�b�\'��\�T�mwl\�\�\��\�\n�\� ���\0\�\�\Zi�<s�\0�\��jT��!4}\�\�4�=g�\0T\�^�C^�F���g\�?p�\�\�Ks�B\�͞/\0���<�b�Q?�g-p|I��\�lw���Nd\�4\�K:乌�Y=�9�$p��t\�s���~+\0q�?ِ\�t�|o|\0�ßl\�k�u��/��\��\�OJ\�-b&\�$PN��y\�¥�\�D�\�y2\�9�3�yb�ҿ\�\�TT�2�V�gtbB�ۚ�����9�go����\�\�)�\n\�\�fD���7&\'/\�\r�\�w��T�=�\�\�Py\n\��Ms\�)Y0a|�i����T\���\�L�����\�t��^��w\�D\�G&\�\�Y\0O\�\��?\0����sAڂn�\�\�Sy�0�p��>^��\����=R\�5ݲG\���)\�v?-�]y!�\'\�҂\�2-\�g�\�^T�\�P\"�`�Q5.�\�?\0\�\0��͌\�Lp��g�QŊ~1Î\�\��\0h)57*3ՃW5���e��fZ��7s�c\Z�\�\�\n}��RbPY��\�DB/���^\�bz>X��\�\�Q\0�\r]FE�\��pF\�M��\�l\�ʻy̙�fdj���\0���ft	�K`�Y�XJ\0\�;\��|�Hҁ�\n�\rWF]�+\�\r�\�\�\�\0x��Ptx�\�)#2�\�9<�����\�j����K\�M#f�\\�;\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"���\�N\�\�*S[\0\0\0\0IEND�B`�','hassanass',-23,3);
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
