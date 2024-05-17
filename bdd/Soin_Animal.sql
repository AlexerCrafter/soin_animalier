-- MariaDB dump 10.19  Distrib 10.11.4-MariaDB, for debian-linux-gnu (aarch64)
--
-- Host: localhost    Database: Soin_Animal
-- ------------------------------------------------------
-- Server version	10.11.4-MariaDB-1~deb12u1

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
-- Table structure for table `Allergie`
--

DROP TABLE IF EXISTS `Allergie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Allergie` (
  `Id_Allergie` int(11) NOT NULL AUTO_INCREMENT,
  `Type_Allergie` varchar(50) NOT NULL,
  `Id_Animal` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id_Allergie`),
  KEY `Id_Animal` (`Id_Animal`),
  CONSTRAINT `Allergie_ibfk_1` FOREIGN KEY (`Id_Animal`) REFERENCES `Animal` (`Id_Animal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Allergie`
--

LOCK TABLES `Allergie` WRITE;
/*!40000 ALTER TABLE `Allergie` DISABLE KEYS */;
/*!40000 ALTER TABLE `Allergie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Animal`
--

DROP TABLE IF EXISTS `Animal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Animal` (
  `Id_Animal` int(11) NOT NULL,
  `Nom_Animal` varchar(20) NOT NULL,
  `Espece_Animal` varchar(20) NOT NULL,
  `Race_Animal` varchar(40) NOT NULL,
  `Taille` int(11) NOT NULL,
  `Poids` int(11) NOT NULL,
  PRIMARY KEY (`Id_Animal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Animal`
--

LOCK TABLES `Animal` WRITE;
/*!40000 ALTER TABLE `Animal` DISABLE KEYS */;
/*!40000 ALTER TABLE `Animal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Client`
--

DROP TABLE IF EXISTS `Client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Client` (
  `Id_Client` int(11) NOT NULL AUTO_INCREMENT,
  `Username` varchar(10) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `Id_Role` int(11) DEFAULT NULL,
  `Nom` varchar(30) NOT NULL,
  `Prenom` varchar(30) NOT NULL,
  `Adresse` varchar(50) NOT NULL,
  `Num_Telephone` int(11) NOT NULL,
  `Mail` varchar(30) NOT NULL,
  PRIMARY KEY (`Id_Client`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Client`
--

LOCK TABLES `Client` WRITE;
/*!40000 ALTER TABLE `Client` DISABLE KEYS */;
/*!40000 ALTER TABLE `Client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Identifiant`
--

DROP TABLE IF EXISTS `Identifiant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Identifiant` (
  `Id_Client` int(11) DEFAULT NULL,
  `Id_Animal` int(11) DEFAULT NULL,
  `Id_Medical` int(11) DEFAULT NULL,
  KEY `Id_Client` (`Id_Client`),
  KEY `Id_Medical` (`Id_Medical`),
  KEY `Id_Animal` (`Id_Animal`),
  CONSTRAINT `Identifiant_ibfk_1` FOREIGN KEY (`Id_Client`) REFERENCES `Client` (`Id_Client`),
  CONSTRAINT `Identifiant_ibfk_2` FOREIGN KEY (`Id_Medical`) REFERENCES `Suivi` (`Id_Medical`),
  CONSTRAINT `Identifiant_ibfk_3` FOREIGN KEY (`Id_Animal`) REFERENCES `Animal` (`Id_Animal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Identifiant`
--

LOCK TABLES `Identifiant` WRITE;
/*!40000 ALTER TABLE `Identifiant` DISABLE KEYS */;
/*!40000 ALTER TABLE `Identifiant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Role`
--

DROP TABLE IF EXISTS `Role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Role` (
  `Id_Role` int(11) NOT NULL AUTO_INCREMENT,
  `Nom_Role` varchar(15) NOT NULL,
  `Id_Client` int(11) NOT NULL,
  PRIMARY KEY (`Id_Role`),
  KEY `Id_Client` (`Id_Client`),
  CONSTRAINT `Role_ibfk_1` FOREIGN KEY (`Id_Client`) REFERENCES `Client` (`Id_Client`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Role`
--

LOCK TABLES `Role` WRITE;
/*!40000 ALTER TABLE `Role` DISABLE KEYS */;
/*!40000 ALTER TABLE `Role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Suivi`
--

DROP TABLE IF EXISTS `Suivi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Suivi` (
  `Id_Medical` int(11) NOT NULL AUTO_INCREMENT,
  `Id_Animal` int(11) DEFAULT NULL,
  `Date` date NOT NULL,
  `Poids_Actu` int(11) NOT NULL,
  `Poids_Pese` int(11) NOT NULL,
  `Type_Alimentation` varchar(30) NOT NULL,
  `Quantite` int(11) NOT NULL,
  `Traitement_actu` varchar(100) DEFAULT NULL,
  `Diff_Poids` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id_Medical`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Suivi`
--

LOCK TABLES `Suivi` WRITE;
/*!40000 ALTER TABLE `Suivi` DISABLE KEYS */;
/*!40000 ALTER TABLE `Suivi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Vaccin`
--

DROP TABLE IF EXISTS `Vaccin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Vaccin` (
  `Id_Vaccin` int(11) NOT NULL AUTO_INCREMENT,
  `Type_Vaccin` varchar(50) NOT NULL,
  `Id_Animal` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id_Vaccin`),
  KEY `Id_Animal` (`Id_Animal`),
  CONSTRAINT `Vaccin_ibfk_1` FOREIGN KEY (`Id_Animal`) REFERENCES `Animal` (`Id_Animal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Vaccin`
--

LOCK TABLES `Vaccin` WRITE;
/*!40000 ALTER TABLE `Vaccin` DISABLE KEYS */;
/*!40000 ALTER TABLE `Vaccin` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-18 12:51:41
