-- MariaDB dump 10.19  Distrib 10.6.5-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: laliga
-- ------------------------------------------------------
-- Server version	10.6.5-MariaDB-1:10.6.5+maria~focal

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
-- Table structure for table `club`
--

DROP TABLE IF EXISTS `club`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `club` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `budget` double NOT NULL,
  `budget_rest` double DEFAULT 0,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foundation_year` date NOT NULL,
  `active` int(11) NOT NULL DEFAULT 1,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `club`
--

LOCK TABLES `club` WRITE;
/*!40000 ALTER TABLE `club` DISABLE KEYS */;
INSERT INTO `club` VALUES (1,'Arenas Club de Guecho',702037.81,673002.74,'Guecho','1922-08-08',1,'2021-12-13 11:42:19',NULL),(2,'Athletic Club',1369887.84,1339704.2500000002,'Bilbao','1921-04-23',1,'2021-12-13 11:42:19',NULL),(3,'Foot-Ball Club Barcelona',2543887.63,2511930.94,'Barcelona','1922-04-12',1,'2021-12-13 11:42:19',NULL),(4,'Athletic Club de Madrid',989580.58,957923.94,'Madrid','1920-05-07',1,'2021-12-13 11:42:19',NULL),(5,'Real Club Deportivo Español',308332.19,278095.14999999997,'Barcelona','1922-03-24',1,'2021-12-13 11:42:19',NULL),(6,'Club Deportivo Europa',1701496.37,1672044.1900000002,'Barcelona','1922-12-11',1,'2021-12-13 11:42:19',NULL),(7,'Real Santander Racing Club',262102.69,233621.14,'Santander','1921-11-19',1,'2021-12-13 11:42:19',NULL),(8,'Real Madrid Foot-Ball Club',463330.09,432406.04000000004,'Madrid','1921-03-09',1,'2021-12-13 11:42:19',NULL),(9,'Real Sociedad de Foot-Ball',2139809.37,2110204.31,'San Sebastián','1922-05-19',0,'2021-12-13 11:42:19',NULL),(10,'Real Unión Club de Irún',1041489.32,1009020.9799999999,'Irún','1921-12-20',0,'2021-12-13 11:42:19',NULL);
/*!40000 ALTER TABLE `club` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctrine_migration_versions`
--

LOCK TABLES `doctrine_migration_versions` WRITE;
/*!40000 ALTER TABLE `doctrine_migration_versions` DISABLE KEYS */;
INSERT INTO `doctrine_migration_versions` VALUES ('DoctrineMigrations\\Version20211208231133','2021-12-13 11:42:19',44),('DoctrineMigrations\\Version20211212233101','2021-12-13 11:42:19',28);
/*!40000 ALTER TABLE `doctrine_migration_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manager` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `club_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `salary` double DEFAULT NULL,
  `license_date` date NOT NULL,
  `active` int(11) NOT NULL DEFAULT 1,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FA2425B961190A32` (`club_id`),
  CONSTRAINT `FK_FA2425B961190A32` FOREIGN KEY (`club_id`) REFERENCES `club` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
INSERT INTO `manager` VALUES (1,10,'Enrique Merino Calvo',1453.56,'1922-11-23',1,'2021-12-13 11:42:19',NULL),(2,9,'Luciano Cortes Prieto',1077.23,'1920-12-24',0,'2021-12-13 11:42:19',NULL),(3,8,'Reinaldo Crespo Sanchez',1970.66,'1921-09-02',1,'2021-12-13 11:42:19',NULL),(4,7,'Francisco Marti Hernandez',1637.84,'1922-09-01',1,'2021-12-13 11:42:19',NULL),(5,6,'Venancio Rubio Ibañez',1381.01,'1920-10-06',1,'2021-12-13 11:42:19',NULL),(6,5,'Paco Sanchez Dio',1781.64,'1921-12-15',1,'2021-12-13 11:42:19',NULL),(7,4,'Edgardo Mendez Ledz',1842.74,'1921-04-27',1,'2021-12-13 11:42:19',NULL),(8,3,'Geronimo Ramirez Maiden',1669.86,'1921-04-26',1,'2021-12-13 11:42:19',NULL),(9,2,'Flavio Campos Burning',1216.9,'1921-07-21',0,'2021-12-13 11:42:19',NULL),(10,1,'Joaquín León Medina',1413.31,'1920-12-11',1,'2021-12-13 11:42:19',NULL),(11,NULL,'Nuño Moreno Velasco',1326.13,'1921-11-14',1,'2021-12-13 11:42:19',NULL),(12,NULL,'Pepe Garcia Montero',1249.59,'1921-02-22',0,'2021-12-13 11:42:19',NULL),(13,NULL,'Ernesto Iglesias Diez',1414.34,'1922-02-01',0,'2021-12-13 11:42:19',NULL),(14,NULL,'Dámaso Campos Ruiz',1468.16,'1920-08-04',1,'2021-12-13 11:42:19',NULL),(15,3,'Pepe Lopez Nuñezaaaaa',1233.42,'2021-12-12',1,'2021-12-13 12:55:28',NULL);
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `club_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `salary` double DEFAULT NULL,
  `dorsal` int(11) DEFAULT NULL,
  `birth_date` date NOT NULL,
  `active` int(11) NOT NULL DEFAULT 1,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_98197A6561190A32` (`club_id`),
  CONSTRAINT `FK_98197A6561190A32` FOREIGN KEY (`club_id`) REFERENCES `club` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player`
--

LOCK TABLES `player` WRITE;
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
INSERT INTO `player` VALUES (1,1,'Pepe Lopez Nuñez',1691.42,19,'1891-03-27',1,'2021-12-11 01:50:29',NULL),(2,1,'Hugo Pardo Crespo',1040.34,18,'1891-02-24',1,'2021-12-11 01:50:29',NULL),(3,1,'Dámaso Garcia Ortega',1842.45,17,'1891-07-14',0,'2021-12-11 01:50:29',NULL),(4,1,'Raul Marti Pascual',1534.8,16,'1891-10-04',1,'2021-12-11 01:50:29',NULL),(5,1,'Pasqual Romero Martinez',1553.74,15,'1891-10-28',1,'2021-12-11 01:50:29',NULL),(6,1,'Marcelino Sanz Navarro',1984.57,14,'1892-02-14',1,'2021-12-11 01:50:29',NULL),(7,1,'Gaspar Merino Medina',1494.9,13,'1890-07-17',1,'2021-12-11 01:50:29',NULL),(8,1,'Jacinto Ibañez Calvo',1628.59,12,'1891-05-05',1,'2021-12-11 01:50:29',NULL),(9,1,'Esteban Ramos Santos',1452,11,'1890-10-25',0,'2021-12-11 01:50:29',NULL),(10,1,'Napoleon Montero Gil',1654.61,10,'1891-04-26',1,'2021-12-11 01:50:29',NULL),(11,1,'Ginés Herrero Mendez',1449.41,9,'1891-02-09',1,'2021-12-11 01:50:29',NULL),(12,1,'Manrique Martinez Vidal',1243.33,8,'1891-08-04',1,'2021-12-11 01:50:29',NULL),(13,1,'Silvestre Aguilar Ferrer',1580.27,7,'1891-03-27',1,'2021-12-11 01:50:29',NULL),(14,1,'Sixto Marquez Vazquez',1034.11,6,'1891-02-25',0,'2021-12-11 01:50:29',NULL),(15,1,'Manuel Diaz Iglesias',1514.23,5,'1892-05-29',0,'2021-12-11 01:50:29',NULL),(16,1,'Maximiliano Vicente Santana',1358.26,4,'1892-06-21',0,'2021-12-11 01:50:29',NULL),(17,1,'Leon Moreno Garrido',1004.16,3,'1891-04-25',0,'2021-12-11 01:50:29',NULL),(18,1,'Hernán Casado Herrero',1052.58,2,'1891-12-27',0,'2021-12-11 01:50:29',NULL),(19,1,'Felipe Montero Fernandez',1507.99,1,'1891-07-01',0,'2021-12-11 01:50:29',NULL),(20,NULL,'Daniel Prieto Marin',NULL,NULL,'1891-04-06',0,'2021-12-11 01:50:29',NULL),(21,2,'Gabriel Morales Leon',1846.81,19,'1892-10-17',0,'2021-12-11 01:50:29',NULL),(22,2,'Jhon Ramirez Prieto',1518.37,18,'1891-08-17',1,'2021-12-11 01:50:29',NULL),(23,2,'Leandro Muñoz Soler',1482.89,17,'1892-04-14',1,'2021-12-11 01:50:29',NULL),(24,2,'Fulgencio Alonso Lorenzo',1641.01,16,'1891-12-06',1,'2021-12-11 01:50:29',NULL),(25,2,'Ramiro Nuﾑez Pascual',1590.36,15,'1890-11-07',1,'2021-12-11 01:50:29',NULL),(26,2,'Nestor Martin Nieto',1051.21,14,'1892-02-03',1,'2021-12-11 01:50:29',NULL),(27,2,'Pepe Rubio Martinez',1628.01,13,'1892-02-22',1,'2021-12-11 01:50:29',NULL),(28,2,'José Ortega Rubio',1899.72,12,'1891-06-21',1,'2021-12-11 01:50:29',NULL),(29,2,'Aníbal Andres Serrano',1177.03,11,'1892-07-30',1,'2021-12-11 01:50:29',NULL),(30,2,'Reinaldo Rodriguez Bravo',1285.56,10,'1892-11-16',0,'2021-12-11 01:50:29',NULL),(31,2,'Osorio Santos Vila',1849.59,9,'1892-08-20',1,'2021-12-11 01:50:29',NULL),(32,2,'Carlos Ramirez Diaz',1896.45,8,'1892-05-29',0,'2021-12-11 01:50:29',NULL),(33,2,'Álvaro Martin Rubio',1437.91,7,'1890-08-02',1,'2021-12-11 01:50:29',NULL),(34,2,'Osorio Campos Peña',1828.11,6,'1890-11-24',0,'2021-12-11 01:50:29',NULL),(35,2,'Lucero Gutierrez Garrido',1091.86,5,'1892-01-12',0,'2021-12-11 01:50:29',NULL),(36,2,'Carlo Herrero Ferrer',1125.32,4,'1890-09-15',0,'2021-12-11 01:50:29',NULL),(37,2,'Jusepe Diez Guerrero',1185.54,3,'1891-01-16',1,'2021-12-11 01:50:29',NULL),(38,2,'Fausto Montero Izquierdo',1951.48,2,'1891-02-04',1,'2021-12-11 01:50:29',NULL),(39,2,'Antonio Ramirez Iglesias',1479.46,1,'1892-06-14',1,'2021-12-11 01:50:29',NULL),(40,NULL,'Matías Gimenez Navarro',NULL,NULL,'1890-08-27',0,'2021-12-11 01:50:29',NULL),(41,3,'Bruno Hidalgo Alvarez',1121.45,19,'1890-08-15',1,'2021-12-11 01:50:29',NULL),(42,3,'Mariano Sanchez Duran',1916.8,18,'1891-03-29',1,'2021-12-11 01:50:29',NULL),(43,3,'Álvaro Martin Duran',1665.54,17,'1890-11-26',0,'2021-12-11 01:50:29',NULL),(44,3,'Marcelo Marquez Ramos',1398.78,16,'1890-10-19',1,'2021-12-11 01:50:29',NULL),(45,3,'Silvestre Diez Romero',1685,15,'1890-11-19',0,'2021-12-11 01:50:29',NULL),(46,3,'Cayetano Campos Soto',1606.46,14,'1891-07-20',0,'2021-12-11 01:50:29',NULL),(47,3,'Felipe Marti Campos',1621.38,13,'1892-08-27',0,'2021-12-11 01:50:29',NULL),(48,3,'Geronimo Prieto Ortiz',1864.53,12,'1892-05-22',1,'2021-12-11 01:50:29',NULL),(49,3,'Luca Herrero Sanz',1848.49,11,'1891-07-30',1,'2021-12-11 01:50:29',NULL),(50,3,'Ramón Carmona Vega',1378.77,10,'1890-08-02',1,'2021-12-11 01:50:29',NULL),(51,3,'Eduardo Muñoz Suarez',1185.46,9,'1892-08-03',0,'2021-12-11 01:50:29',NULL),(52,3,'Hernán Garcia Morales',1078.63,8,'1890-07-14',0,'2021-12-11 01:50:29',NULL),(53,3,'Geronimo Ortega Santana',1892.71,7,'1890-12-10',0,'2021-12-11 01:50:29',NULL),(54,3,'Julián Pastor Cruz',1813.25,6,'1892-10-14',0,'2021-12-11 01:50:29',NULL),(55,3,'Joaquín Marin Muﾑoz',1786.55,5,'1891-04-29',0,'2021-12-11 01:50:29',NULL),(56,3,'Rogelio Caballero Caballero',1580.67,4,'1892-11-14',1,'2021-12-11 01:50:29',NULL),(57,3,'Jorge Ruiz Cortes',1674.2,3,'1890-11-07',0,'2021-12-11 01:50:29',NULL),(58,3,'Javier Ramirez Gallego',1226.13,2,'1892-04-04',1,'2021-12-11 01:50:29',NULL),(59,3,'Jerónimo Redondo Vicente',1942.03,1,'1892-12-03',0,'2021-12-11 01:50:29',NULL),(60,NULL,'Ademar Santos Torres',NULL,NULL,'1892-10-04',0,'2021-12-11 01:50:29',NULL),(61,4,'Maximiliano Guerrero Diaz',1218.19,19,'1891-11-03',0,'2021-12-11 01:50:29',NULL),(62,4,'Luis Dominguez Merino',1749.58,18,'1892-06-16',0,'2021-12-11 01:50:29',NULL),(63,4,'Edgardo Arias Diaz',1934.48,17,'1890-12-26',0,'2021-12-11 01:50:29',NULL),(64,4,'Fernando Gil Herrera',1660.48,16,'1892-02-28',0,'2021-12-11 01:50:29',NULL),(65,4,'Cesar Guerrero Medina',1131.08,15,'1892-12-04',0,'2021-12-11 01:50:29',NULL),(66,4,'Carlos Campos Morales',1897.22,14,'1891-05-11',1,'2021-12-11 01:50:29',NULL),(67,4,'Javier Reyes Marquez',1790.33,13,'1891-02-01',0,'2021-12-11 01:50:29',NULL),(68,4,'Arnulfo Merino Caballero',1607.26,12,'1892-07-29',0,'2021-12-11 01:50:29',NULL),(69,4,'Angel Ibañez Bravo',1982.93,11,'1892-08-31',0,'2021-12-11 01:50:29',NULL),(70,4,'Jairo Merino Gutierrez',1198.4,10,'1890-11-04',0,'2021-12-11 01:50:29',NULL),(71,4,'Ernesto Suarez Ibañez',1971.24,9,'1890-11-12',1,'2021-12-11 01:50:29',NULL),(72,4,'Cipriano Soto Rubio',1285.62,8,'1892-05-14',0,'2021-12-11 01:50:29',NULL),(73,4,'Pascual Castro Santana',1404.03,7,'1891-02-12',0,'2021-12-11 01:50:29',NULL),(74,4,'Armando Lozano Lorenzo',1183.37,6,'1890-10-29',1,'2021-12-11 01:50:29',NULL),(75,4,'Victorino Flores Caballero',1326.34,5,'1890-11-03',0,'2021-12-11 01:50:29',NULL),(76,4,'Geronimo Gomez Marquez',1458.51,4,'1890-10-31',1,'2021-12-11 01:50:29',NULL),(77,4,'Hernán Miguel Campos',1493.47,3,'1891-11-24',1,'2021-12-11 01:50:29',NULL),(78,4,'Ulises Herrero Morales',1723.67,2,'1891-10-31',1,'2021-12-11 01:50:29',NULL),(79,4,'Samuel Vicente Hernandez',1797.7,1,'1891-11-01',1,'2021-12-11 01:50:29',NULL),(80,NULL,'Gutierre Iglesias Hidalgo',NULL,NULL,'1892-04-08',0,'2021-12-11 01:50:29',NULL),(81,5,'Ricardo Iba Rodriguez',1019.47,19,'1892-07-15',1,'2021-12-11 01:50:29',NULL),(82,5,'Tonin Diaz Hernandez',1476.5,18,'1892-08-30',0,'2021-12-11 01:50:29',NULL),(83,5,'Fabricio Flores Duran',1012.22,17,'1891-01-03',0,'2021-12-11 01:50:29',NULL),(84,5,'Tonin Hernandez Herrero',1580.31,16,'1891-01-30',0,'2021-12-11 01:50:29',NULL),(85,5,'Ignacio Gomez Leon',1169.65,15,'1891-03-11',0,'2021-12-11 01:50:29',NULL),(86,5,'Gutierre Romero Sanz',1142.87,14,'1892-02-15',0,'2021-12-11 01:50:29',NULL),(87,5,'Ginés Vila Medina',1959.89,13,'1891-02-07',1,'2021-12-11 01:50:29',NULL),(88,5,'Jerónimo Mendez Cruz',1761.59,12,'1890-09-22',1,'2021-12-11 01:50:29',NULL),(89,5,'Leonardo Ferrer Martin',1855.38,11,'1891-05-07',1,'2021-12-11 01:50:29',NULL),(90,5,'Adriano Gil Moreno',1380.9,10,'1892-02-15',1,'2021-12-11 01:50:29',NULL),(91,5,'Enrique Prieto Fernandez',1730.11,9,'1890-10-27',0,'2021-12-11 01:50:29',NULL),(92,5,'Mauricio Sanz Alonso',1887.37,8,'1891-08-12',1,'2021-12-11 01:50:29',NULL),(93,5,'Nazario Moya Vicente',1778.85,7,'1890-11-27',1,'2021-12-11 01:50:29',NULL),(94,5,'Reinaldo Delgado Castillo',1049.9,6,'1891-06-11',0,'2021-12-11 01:50:29',NULL),(95,5,'Hernándo Guerrero Garrido',1715.03,5,'1892-01-30',0,'2021-12-11 01:50:29',NULL),(96,5,'Flavio Ferrer Vicente',1366.45,4,'1892-02-02',0,'2021-12-11 01:50:29',NULL),(97,5,'Angel Dominguez Rodriguez',1006.97,3,'1892-01-11',1,'2021-12-11 01:50:29',NULL),(98,5,'José Ruiz Vega',1997.97,2,'1892-07-18',1,'2021-12-11 01:50:29',NULL),(99,5,'Francisco Moya Merino',1563.97,1,'1890-12-01',0,'2021-12-11 01:50:29',NULL),(100,NULL,'Daniel Cabrera Crespo',NULL,NULL,'1890-12-10',0,'2021-12-11 01:50:29',NULL),(101,6,'Narciso ﾑez Pastor',1640.8,19,'1892-09-21',1,'2021-12-11 01:50:29',NULL),(102,6,'Edgardo Redondo Diaz',1260.46,18,'1892-03-23',0,'2021-12-11 01:50:29',NULL),(103,6,'Jairo Ramirez Dominguez',1114.25,17,'1891-02-15',0,'2021-12-11 01:50:29',NULL),(104,6,'Ezequiel Pardo Pastor',1805.87,16,'1890-08-26',1,'2021-12-11 01:50:29',NULL),(105,6,'Miguel Alonso Lorenzo',1766.33,15,'1892-06-19',1,'2021-12-11 01:50:29',NULL),(106,6,'Elbio Gonzalez Crespo',1961.18,14,'1891-08-15',0,'2021-12-11 01:50:29',NULL),(107,6,'Manolo Martinez Muﾑoz',1385.05,13,'1892-04-06',0,'2021-12-11 01:50:29',NULL),(108,6,'Manolito Bravo Garrido',1075.53,12,'1890-09-13',0,'2021-12-11 01:50:29',NULL),(109,6,'Enrique Rubio Ramos',1798.78,11,'1890-12-11',0,'2021-12-11 01:50:29',NULL),(110,6,'Pablo Nuﾑez Lorenzo',1074.14,10,'1891-12-03',1,'2021-12-11 01:50:29',NULL),(111,6,'Angel Alvarez Mendez',1796.97,9,'1890-08-25',0,'2021-12-11 01:50:29',NULL),(112,6,'Eduardo Muñoz Pastor',1105.94,8,'1891-03-27',1,'2021-12-11 01:50:29',NULL),(113,6,'Rodolfo Iba Moreno',1250.7,7,'1891-02-03',1,'2021-12-11 01:50:29',NULL),(114,6,'Javier Hidalgo Calvo',1634.24,6,'1891-11-14',1,'2021-12-11 01:50:29',NULL),(115,6,'Antonio Nuﾑez Sanz',1597.5,5,'1892-04-02',1,'2021-12-11 01:50:29',NULL),(116,6,'Napoleon Vazquez Prieto',1852.77,4,'1890-11-03',0,'2021-12-11 01:50:29',NULL),(117,6,'Adriano Santana Soler',1492.69,3,'1890-10-16',0,'2021-12-11 01:50:29',NULL),(118,6,'Luca Pastor Merino',1353.54,2,'1891-01-23',1,'2021-12-11 01:50:29',NULL),(119,6,'Victorino Alvarez Ortega',1104.43,1,'1890-08-09',1,'2021-12-11 01:50:29',NULL),(120,NULL,'Luis Duran Saez',NULL,NULL,'1892-08-31',0,'2021-12-11 01:50:29',NULL),(121,7,'Arnulfo Diez Mora',1044.98,19,'1891-01-22',1,'2021-12-11 01:50:29',NULL),(122,7,'Pasqual Medina Caballero',1812.04,18,'1892-11-09',0,'2021-12-11 01:50:29',NULL),(123,7,'Angel Alvarez Medina',1379.87,17,'1891-08-28',1,'2021-12-11 01:50:29',NULL),(124,7,'Amílcar Diez Molina',1367.33,16,'1890-12-08',1,'2021-12-11 01:50:29',NULL),(125,7,'Jacinto Carrasco Flores',1360.17,15,'1892-04-27',0,'2021-12-11 01:50:29',NULL),(126,7,'Gilberto Castillo Crespo',1397.41,14,'1892-07-19',1,'2021-12-11 01:50:29',NULL),(127,7,'Guido Iba Cabrera',1771.21,13,'1892-05-14',1,'2021-12-11 01:50:29',NULL),(128,7,'Cipriano Soto Blanco',1963.21,12,'1891-08-16',1,'2021-12-11 01:50:29',NULL),(129,7,'José Gallego Moreno',1247.09,11,'1891-01-22',0,'2021-12-11 01:50:29',NULL),(130,7,'Panfilo Crespo Izquierdo',1430.32,10,'1890-12-14',1,'2021-12-11 01:50:29',NULL),(131,7,'Jhon Torres Peña',1775.76,9,'1891-05-22',1,'2021-12-11 01:50:29',NULL),(132,7,'Geronimo Lopez Calvo',1064.33,8,'1891-04-08',1,'2021-12-11 01:50:29',NULL),(133,7,'Maikel Lozano Ferrer',1312.54,7,'1890-09-28',1,'2021-12-11 01:50:29',NULL),(134,7,'Dámaso Vazquez Montero',1172.71,6,'1892-11-18',0,'2021-12-11 01:50:29',NULL),(135,7,'Raphael Ruiz Muñoz',1308.32,5,'1892-11-25',0,'2021-12-11 01:50:29',NULL),(136,7,'Quique Cruz Morales',1552.95,4,'1892-11-05',0,'2021-12-11 01:50:29',NULL),(137,7,'Heriberto Fuentes Navarro',1269.34,3,'1892-04-13',1,'2021-12-11 01:50:29',NULL),(138,7,'Ulises Soler Flores',1540.92,2,'1891-08-14',0,'2021-12-11 01:50:29',NULL),(139,7,'Venancio Calvo Ferrer',1073.21,1,'1891-02-16',1,'2021-12-11 01:50:29',NULL),(140,NULL,'Marcelo Iglesias Ruiz',NULL,NULL,'1892-01-23',0,'2021-12-11 01:50:29',NULL),(141,8,'Juan Marti Gallego',1735.43,19,'1892-03-03',0,'2021-12-11 01:50:29',NULL),(142,8,'Raul Marin Marquez',1446.2,18,'1891-12-16',1,'2021-12-11 01:50:29',NULL),(143,8,'Leonardo Gimenez Rubio',1946.09,17,'1892-02-22',0,'2021-12-11 01:50:29',NULL),(144,8,'Carlito Romero Castillo',1255.44,16,'1891-06-29',0,'2021-12-11 01:50:29',NULL),(145,8,'Santiago Hernandez Saez',1690.74,15,'1891-03-10',1,'2021-12-11 01:50:29',NULL),(146,8,'Maikel Lorenzo Perez',1478.11,14,'1890-09-08',0,'2021-12-11 01:50:29',NULL),(147,8,'Leandro Peña Prieto',1672.81,13,'1892-09-18',0,'2021-12-11 01:50:29',NULL),(148,8,'Alfredo Delgado Izquierdo',1748.15,12,'1892-01-20',0,'2021-12-11 01:50:29',NULL),(149,8,'Adrià Castillo Carrasco',1180.86,11,'1892-06-11',1,'2021-12-11 01:50:29',NULL),(150,8,'Geronimo Romero Crespo',1716.99,10,'1891-06-15',1,'2021-12-11 01:50:29',NULL),(151,8,'Carmelo Cortes Herrera',1701.21,9,'1892-04-06',0,'2021-12-11 01:50:29',NULL),(152,8,'Narciso Ferrer Prieto',1983.73,8,'1892-02-12',1,'2021-12-11 01:50:29',NULL),(153,8,'José Vila Duran',1685.71,7,'1890-07-28',0,'2021-12-11 01:50:29',NULL),(154,8,'Lotario Peña Soler',1411.53,6,'1891-05-27',0,'2021-12-11 01:50:29',NULL),(155,8,'Nacho Navarro Iglesias',1390.19,5,'1891-10-10',1,'2021-12-11 01:50:29',NULL),(156,8,'Jacinto Carrasco Ramos',1603.95,4,'1892-11-27',0,'2021-12-11 01:50:29',NULL),(157,8,'Venancio Nieto Velasco',1057.46,3,'1892-07-06',0,'2021-12-11 01:50:29',NULL),(158,8,'Liberto Cano Marquez',1160.76,2,'1890-12-14',1,'2021-12-11 01:50:29',NULL),(159,8,'Carlos Arias Muﾑoz',1088.03,1,'1892-07-19',0,'2021-12-11 01:50:29',NULL),(160,NULL,'David Romero ﾑez',NULL,NULL,'1890-11-09',0,'2021-12-11 01:50:29',NULL),(161,9,'Rodolfo Herrera Velasco',1628.84,19,'1891-04-02',0,'2021-12-11 01:50:29',NULL),(162,9,'Ronaldo Lozano Miguel',1255.98,18,'1892-03-21',1,'2021-12-11 01:50:29',NULL),(163,9,'Vladimiro Moreno Cruz',1781.55,17,'1892-08-26',1,'2021-12-11 01:50:29',NULL),(164,9,'Leandro Mora Carrasco',1803.62,16,'1892-01-18',1,'2021-12-11 01:50:29',NULL),(165,9,'Jusepe Herrera Peña',1834.3,15,'1890-11-02',1,'2021-12-11 01:50:29',NULL),(166,9,'Fulgencio Blanco Torres',1585.5,14,'1890-09-26',0,'2021-12-11 01:50:29',NULL),(167,9,'Arsenio Garcia Nuﾑez',1352.15,13,'1892-07-22',0,'2021-12-11 01:50:29',NULL),(168,9,'Ulises Marti Morales',1387.25,12,'1891-04-13',0,'2021-12-11 01:50:29',NULL),(169,9,'Alberto Leon Caballero',1383.11,11,'1891-06-22',1,'2021-12-11 01:50:29',NULL),(170,9,'Patricio Campos Sanchez',1077.42,10,'1890-12-11',1,'2021-12-11 01:50:29',NULL),(171,9,'Leon Flores Moya',1775.97,9,'1892-10-02',1,'2021-12-11 01:50:29',NULL),(172,9,'Elbio Gil Jimenez',1850.46,8,'1892-06-13',1,'2021-12-11 01:50:29',NULL),(173,9,'Alberto Serrano Perez',1672.63,7,'1892-01-26',1,'2021-12-11 01:50:29',NULL),(174,9,'Lucero Navarro Herrero',1084.22,6,'1892-04-26',0,'2021-12-11 01:50:29',NULL),(175,9,'Edgardo Sanz Bravo',1562.09,5,'1891-11-16',1,'2021-12-11 01:50:29',NULL),(176,9,'Luciano Montero Fuentes',1212.26,4,'1892-08-23',1,'2021-12-11 01:50:29',NULL),(177,9,'Tonino Ibañez Ruiz',1969.84,3,'1892-04-22',0,'2021-12-11 01:50:29',NULL),(178,9,'Gregorio Soler Hernandez',1296.89,2,'1891-12-31',1,'2021-12-11 01:50:29',NULL),(179,9,'Manrique Delgado Rodriguez',1013.75,1,'1891-07-12',1,'2021-12-11 01:50:29',NULL),(180,NULL,'Leonardo Delgado Torres',NULL,NULL,'1890-11-22',0,'2021-12-11 01:50:29',NULL),(181,10,'Agustín Duran Esteban',1906.85,19,'1892-06-23',0,'2021-12-11 01:50:29',NULL),(182,10,'Antero Jimenez Velasco',1976.69,18,'1891-05-01',1,'2021-12-11 01:50:29',NULL),(183,10,'Jerónimo Navarro Mendez',1877.68,17,'1892-01-01',0,'2021-12-11 01:50:29',NULL),(184,10,'Pascual Casado Navarro',1124.61,16,'1890-10-17',0,'2021-12-11 01:50:29',NULL),(185,10,'Fabricio Cortes Velasco',1631.13,15,'1892-09-24',1,'2021-12-11 01:50:29',NULL),(186,10,'Noe Castro Ferrer',1760.61,14,'1891-03-04',1,'2021-12-11 01:50:29',NULL),(187,10,'Roman Reyes Casado',1336.87,13,'1892-04-29',0,'2021-12-11 01:50:29',NULL),(188,10,'Osorio Miguel Muñoz',1551.97,12,'1891-10-13',0,'2021-12-11 01:50:29',NULL),(189,10,'Abel Martinez Cano',1973.69,11,'1891-10-01',0,'2021-12-11 01:50:29',NULL),(190,10,'Hector Carmona Sanz',1365.36,10,'1892-07-20',0,'2021-12-11 01:50:29',NULL),(191,10,'Silvestre Carmona ﾑez',1800.66,9,'1891-11-28',1,'2021-12-11 01:50:29',NULL),(192,10,'José Leon Arias',1254.79,8,'1891-01-14',1,'2021-12-11 01:50:29',NULL),(193,10,'Pasqual Gimenez Gallego',1841.52,7,'1890-09-02',0,'2021-12-11 01:50:29',NULL),(194,10,'Julio Crespo Dominguez',1567.17,6,'1891-05-07',1,'2021-12-11 01:50:29',NULL),(195,10,'Raphael Blanco Vidal',1851.21,5,'1892-07-05',0,'2021-12-11 01:50:29',NULL),(196,10,'Agustín Santana Morales',1571.06,4,'1892-11-14',0,'2021-12-11 01:50:29',NULL),(197,10,'Leopoldo Santos Suarez',1008.4,3,'1891-04-01',1,'2021-12-11 01:50:29',NULL),(198,10,'Cristhian Crespo Nuñez',1692.34,2,'1890-11-25',1,'2021-12-11 01:50:29',NULL),(199,10,'Diego Velasco Vidal',1922.17,1,'1890-07-21',0,'2021-12-11 01:50:29',NULL),(200,3,'Pepe Lopez Nuñezaaaaa',13333.42,13,'1891-03-27',1,'2021-12-13 12:54:55',NULL);
/*!40000 ALTER TABLE `player` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-13 13:05:58

