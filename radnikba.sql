-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: radnikba
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment` (
  `appointment_id` int NOT NULL AUTO_INCREMENT,
  `worker_id` int DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `appointment_start_date` date DEFAULT NULL,
  `appointment_end_date` date DEFAULT NULL,
  PRIMARY KEY (`appointment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment`
--

LOCK TABLES `appointment` WRITE;
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
INSERT INTO `appointment` VALUES (1,1,4,'2022-03-02','2022-03-24'),(2,3,2,'2020-06-10','2020-11-21'),(3,4,3,'2022-03-09','2022-03-19'),(4,5,5,'2022-03-10','2022-06-24'),(5,2,1,'2022-03-18','2022-03-27');
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `customer_username` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `customer_password` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `customer_name` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `customer_surname` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `customer_city` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `customer_phone_number` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `customer_email` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `customer_address` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'evladic','17012000','Ervin','Vladic','Sarajevo','062759523','ervinvladic@hotmail.com','Munira Gavrankapetanovica 10'),(2,'andrewmarkovic','z873mdjau','Andrej','Markovic','Mostar','061432378','andrew_markovic@yahoo.com','Paromlinska 8'),(3,'radisict','TinkiVink1','Tin','Radisic','Sarajevo','062425832','tinradisic@outlook.com','TMP 12'),(4,'HarunKu','Kunovac18','Harun','Kunovac','Tuzla','061763281','harunkunovac@gmail.com','Jadranska 14'),(5,'malikera','malikera12','Kerim','Salic','Sarajevo','061872145','kerimsalic@outlook.com','Zorane Micanovic 17');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job` (
  `job_id` int NOT NULL AUTO_INCREMENT,
  `job_name` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `job_description` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
INSERT INTO `job` VALUES (1,'bricklayer','Work with walls'),(2,'builder','Work with construction works'),(3,'carpenter','Work with wooden tables and chairs'),(4,'electrician','Electrical work'),(6,'cleaning','pomalo##');
/*!40000 ALTER TABLE `job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `review_id` int NOT NULL AUTO_INCREMENT,
  `worker_id` int DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `review_grade` enum('1','2','3','4','5') CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `review_comment` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`review_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (1,2,2,'4','/'),(2,1,3,'5','Good job!5'),(3,3,1,'5','Great worker'),(4,4,4,'4','/'),(5,2,5,'4','/');
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `worker`
--

DROP TABLE IF EXISTS `worker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `worker` (
  `worker_id` int NOT NULL AUTO_INCREMENT,
  `worker_job_id` int DEFAULT NULL,
  `worker_username` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `worker_password` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `worker_name` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `worker_surname` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `worker_city` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `worker_phone_number` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `worker_address` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `worker_email` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`worker_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `worker`
--

LOCK TABLES `worker` WRITE;
/*!40000 ALTER TABLE `worker` DISABLE KEYS */;
INSERT INTO `worker` VALUES (1,1,'fariskoka','hill123','Faris','Kokorovic','Sarajevo','0603354678','Trgovacka 52','fariskokorovic17@gmail.com'),(2,2,'del_gradjevinar','delgrad','Nisvet','Delic','Sarajevo','062567891','Alekse Santica 10','nisvetdelic@outlook.com'),(3,3,'mido12','mido12345','Midhat','Salic','Mostar','062986213','Fehima Agica Age 18','salicmd@gmail.com'),(4,4,'abaza7','qw3Nmt','Mirza','Abaza','Tuzla','061452117','Tuzlanska 192','mirza.abaza@outlook.com'),(5,5,'bojo7','bojo12678','Petar','Bojo','Kiseljak','063211455','Kiseljak 278','bojo17@gmail.com');
/*!40000 ALTER TABLE `worker` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-23 10:03:53
