-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: service_me
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `banking_details`
--

DROP TABLE IF EXISTS `banking_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `banking_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Customer_email` varchar(255) DEFAULT NULL,
  `card_number` mediumtext,
  `expiry` varchar(5) DEFAULT NULL,
  `cvv` int DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banking_details`
--

LOCK TABLES `banking_details` WRITE;
/*!40000 ALTER TABLE `banking_details` DISABLE KEYS */;
INSERT INTO `banking_details` VALUES (4,'davidl@gmail.com','1234567891234567','10/23',123,'South Africa','credit card'),(5,'davidl@gmail.com','9876543210987654','11/24',284,'South Africa','credit card'),(6,'lucyh@gmail.com','1234567899876543','09/22',243,'South Africa','credit card'),(7,'john@gmail.com','1111222233334444','08/25',321,'South Africa','paypal'),(8,'jennyw@gmail.com','1122334455667788','01/24',987,'South Africa','credit card'),(9,'paulm@gmail.com','1112333455567778','05/22',654,'South Africa','credit card');
/*!40000 ALTER TABLE `banking_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_email` varchar(255) NOT NULL,
  `agent_email` varchar(255) NOT NULL,
  `bedrooms` int DEFAULT NULL,
  `bathrooms` int DEFAULT NULL,
  `date` date NOT NULL,
  `time` varchar(5) NOT NULL,
  `unit_and_apt` varchar(255) NOT NULL,
  `street` varchar(255) NOT NULL,
  `suburb` varchar(255) NOT NULL,
  `total` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
INSERT INTO `bookings` VALUES (15,'davidl@gmail.com','carlm@gmail.com',1,2,'2021-09-24','08:00','10 Grantbay','Dreyer','Claremont',410),(16,'davidl@gmail.com','paulm@gmail.com',2,2,'2021-09-24','12:00','10 ','Bergvliet road','Diep River',510),(17,'john@gmail.com','alicia@gmail.com',1,1,'2021-09-24','08:00','15 Loop Hall','Strand Street','Observatory',330),(18,'john@gmail.com','alicia@gmail.com',1,1,'2021-09-24','08:00','15 Loop Hall','Long Street','Plumstead',330),(19,'john@gmail.com','paulm@gmail.com',1,1,'2021-09-24','08:00','30 Belleview','Ocean way','Plumstead',330),(20,'jennyw@gmail.com','alicia@gmail.com',3,1,'2021-09-25','08:00','15 Albertpark','Strand Street','Cape Town',530),(21,'john@gmail.com','peterl@gmail.com',1,1,'2021-09-24','08:00','15 Loop Hall','Dreyer Street','Observatory',330),(22,'paulm@gmail.com','lucasg@gmail.com',1,3,'2021-09-24','08:00','23 High Cliff','Strand Street','Plumstead',490);
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cleaning_prices`
--

DROP TABLE IF EXISTS `cleaning_prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cleaning_prices` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rooms` varchar(100) DEFAULT NULL,
  `price` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cleaning_prices`
--

LOCK TABLES `cleaning_prices` WRITE;
/*!40000 ALTER TABLE `cleaning_prices` DISABLE KEYS */;
INSERT INTO `cleaning_prices` VALUES (1,'liv_room_kitchen',150),(2,'bedrooms',100),(3,'bathrooms',80);
/*!40000 ALTER TABLE `cleaning_prices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_email` varchar(255) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `contact` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`customer_email`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (3,'john@gmail.com','john','0682622669','12345'),(4,'tonyp@gmail.com','Tony Parker','0782325987','15324'),(5,'dannyg@gmail.com','Danny Green','0645823952','54321'),(8,'davidl@gmail.com','David Lokhart','+27682622547','98765'),(9,'daniel@gmail.com','Daniel Mack','0682622924','123456789'),(10,'paulm@gmail.com','Paul Myers','08965341','myers'),(11,'lucyh@gmail.com','Lucy Hield','0786532975','lucyh'),(12,'jennyw@gmail.com','Jenny Wart','0645823347','jenny'),(13,'plandim@gmail.com','Plandi Makali','0645823347','plandi'),(14,'sheilaw@gmail.com','Sheila Wanx','0682536997','sheila');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `id` int NOT NULL AUTO_INCREMENT,
  `agent_email` varchar(50) DEFAULT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `contact` varchar(13) DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  `services` varchar(50) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (11,'lucasg@gmail.com','Lucas Gail','lucas','+27682622669','images/background5.JPG','Cleaner','I clean well'),(12,'carlm@gmail.com','Carl Max','carl','0894539753','images/background2.JPG','Cleaner','I am a dedicated cleaner'),(13,'loganw@gmail.com','Logan Wills','logan','+27683364521','images/background1.JPG','Cleaner','Trust me for your cleanings'),(15,'peterl@gmail.com','Peter Loyd','peter','0682622669','images/background4.JPG','Cleaner','I have years of experience cleaning houses. I\'m comfortable with kids and pets.'),(16,'paulm@gmail.com','Paul Myers','myers','0896534185','images/background6.JPG','Cleaner','I live in Claremont. I do high quality cleaning.'),(17,'annahb@gmail.com','Annah Beckett','annah','0898942626','images/default.png','Cleaner','I clean very well. I live in Plumstead'),(18,'alicia@gmail.com','Alicia Jones','alicia','08965341','images/background3.JPG','Cleaner','You can entrust me with your cleanings.'),(19,'dianah@gmail.com','Diana Hall','diana','0896534185','https://i.ibb.co/ZVFsg37/default.png','Cleaner','My name is Diana and I can make your home shine like never before.'),(22,'nancyw@gmail.com','Nancy Wallace','nancy','0896534185','images/garden1.jpg','Gardener','I\'m an experienced gardener. I do plant art also.'),(23,'darrenb@gmail.com','Darren Becker','darren','0782325432','images/garden.jpg','Gardener','Gardening is my passion. Your garden will be as beautiful as ever'),(24,'brucek@gmail.com','','bruce','+27986524555','images/garden3.jpg','Gardener','Gardening is my specialty');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `garden_prices`
--

DROP TABLE IF EXISTS `garden_prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `garden_prices` (
  `footage` varchar(100) DEFAULT NULL,
  `price` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `garden_prices`
--

LOCK TABLES `garden_prices` WRITE;
/*!40000 ALTER TABLE `garden_prices` DISABLE KEYS */;
INSERT INTO `garden_prices` VALUES ('0-100 Square Feet',100),('100-200 Square Feet',150),('200-300 Square Feet',200),('300-400 Square Feet+',250);
/*!40000 ALTER TABLE `garden_prices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gardening_bookings`
--

DROP TABLE IF EXISTS `gardening_bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gardening_bookings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_email` varchar(100) NOT NULL,
  `agent_email` varchar(100) NOT NULL,
  `footage` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `time` varchar(5) NOT NULL,
  `unit_and_apt` varchar(100) NOT NULL,
  `street` varchar(100) NOT NULL,
  `suburb` varchar(100) NOT NULL,
  `total` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gardening_bookings`
--

LOCK TABLES `gardening_bookings` WRITE;
/*!40000 ALTER TABLE `gardening_bookings` DISABLE KEYS */;
INSERT INTO `gardening_bookings` VALUES (1,'john@gmail.com','nancyw@gmail.com','0-100 Square Feet','2021-09-24','08:00','23 High Cliff','Dreyer','Observatory',100),(2,'lucyh@gmail.com','nancyw@gmail.com','0-100 Square Feet','2021-09-24','08:00','15 Albertpark','Long Street','Observatory',100),(3,'john@gmail.com','nancyw@gmail.com','0-100 Square Feet','2021-09-26','08:00','23 High Cliff','Strand Street','Rosebank',100),(4,'jennyw@gmail.com','darrenb@gmail.com','0-100 Square Feet','2021-09-24','08:00','15 Albertpark','Strand Street','Capetown',100),(5,'paulm@gmail.com','nancyw@gmail.com','0-100 Square Feet','2021-09-24','08:00','15 Loop Hall','Dreyer Street','Mowbray',100);
/*!40000 ALTER TABLE `gardening_bookings` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-24 22:21:06
