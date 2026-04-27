-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: db_penggajian3
-- ------------------------------------------------------
-- Server version	8.0.43

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
-- Table structure for table `data_jabatan`
--

DROP TABLE IF EXISTS `data_jabatan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_jabatan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_jabatan` varchar(255) NOT NULL,
  `nama_jabatan` varchar(120) NOT NULL,
  `gaji_pokok` int NOT NULL,
  `tj_transport` int NOT NULL,
  `uang_makan` int DEFAULT NULL,
  `userId` int NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `dataPegawaiId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `dataPegawaiId` (`dataPegawaiId`),
  CONSTRAINT `data_jabatan_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `data_pegawai` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `data_jabatan_ibfk_2` FOREIGN KEY (`dataPegawaiId`) REFERENCES `data_pegawai` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_jabatan`
--

LOCK TABLES `data_jabatan` WRITE;
/*!40000 ALTER TABLE `data_jabatan` DISABLE KEYS */;
INSERT INTO `data_jabatan` VALUES (1,'ddfeaa41-b6d1-41e4-877a-26c0f6b32503','HRD',3000,2000,1000,1,'2023-06-06 13:47:52','2023-06-06 13:47:52',NULL),(2,'424fee23-3ef9-45a3-b28a-baa233343e86','Operator Produksi',2000,1000,500,1,'2023-06-06 13:49:08','2023-06-06 13:49:08',NULL);
/*!40000 ALTER TABLE `data_jabatan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_kehadiran`
--

DROP TABLE IF EXISTS `data_kehadiran`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_kehadiran` (
  `id` int NOT NULL AUTO_INCREMENT,
  `bulan` varchar(15) NOT NULL,
  `nik` varchar(16) NOT NULL,
  `nama_pegawai` varchar(100) NOT NULL,
  `jenis_kelamin` varchar(20) DEFAULT NULL,
  `nama_jabatan` varchar(50) DEFAULT NULL,
  `hadir` int DEFAULT NULL,
  `sakit` int DEFAULT NULL,
  `alpha` int DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_kehadiran`
--

LOCK TABLES `data_kehadiran` WRITE;
/*!40000 ALTER TABLE `data_kehadiran` DISABLE KEYS */;
INSERT INTO `data_kehadiran` VALUES (1,'juni','112233','Aldi','Laki - Laki','HRD',9,2,1,'2023-06-06 13:47:58','2023-06-06 13:47:58');
/*!40000 ALTER TABLE `data_kehadiran` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_overtime`
--

DROP TABLE IF EXISTS `data_overtime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_overtime` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_pegawai` int DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `jam_lembur` int DEFAULT NULL,
  `alasan` varchar(255) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_overtime`
--

LOCK TABLES `data_overtime` WRITE;
/*!40000 ALTER TABLE `data_overtime` DISABLE KEYS */;
INSERT INTO `data_overtime` VALUES (1,1,'2026-04-27',3,'Menyelesaikan pekerjaan proyek tambahan','2026-04-27 07:18:43','2026-04-27 07:18:43'),(2,2,'2026-04-27',2,'Extra work on project','2026-04-27 07:45:07','2026-04-27 07:45:07');
/*!40000 ALTER TABLE `data_overtime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_pegawai`
--

DROP TABLE IF EXISTS `data_pegawai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_pegawai` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_pegawai` varchar(255) NOT NULL,
  `nik` varchar(16) NOT NULL,
  `nama_pegawai` varchar(100) NOT NULL,
  `username` varchar(120) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `jenis_kelamin` varchar(15) NOT NULL,
  `jabatan` varchar(50) NOT NULL,
  `tanggal_masuk` varchar(255) NOT NULL,
  `status` varchar(50) NOT NULL,
  `photo` varchar(100) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `hak_akses` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `designation` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_pegawai`
--

LOCK TABLES `data_pegawai` WRITE;
/*!40000 ALTER TABLE `data_pegawai` DISABLE KEYS */;
INSERT INTO `data_pegawai` VALUES (1,'e6be1994-e5c9-471b-8c23-9b2ee6787d86','112233','Aldi','aldi','$argon2id$v=19$m=65536,t=3,p=4$6DiWFZ/T0BYGNlrox2C4Ww$r6BpPOyKQirtqnsc2t8ChJ3g6AHQOBu9dNaq0bkNEqw','Laki-Laki','HRD','2026-04-27','karyawan tetap','7f52d5fd1511704e51cbe30fdb1d8924.jpg','http://localhost:5000/images/7f52d5fd1511704e51cbe30fdb1d8924.jpg','admin','2023-06-06 13:46:29','2026-04-27 09:12:37','FrontEnd Developer'),(2,'98788064-fd08-4efa-af45-183db6cfb640','223344','Budi','budi','$argon2id$v=19$m=65536,t=3,p=4$CyodSZT68auVQ42ItRyVxA$zE2CWObkUAjlF6K9ED37aVXFDVyOB9b/V8MkK/dzpKY','Laki-Laki','Operator Produksi','01-02-23','karyawan tetap','7f52d5fd1511704e51cbe30fdb1d8924.jpg','http://localhost:5000/images/7f52d5fd1511704e51cbe30fdb1d8924.jpg','pegawai','2023-06-06 13:50:02','2023-06-06 13:50:02',NULL);
/*!40000 ALTER TABLE `data_pegawai` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `potongan_gaji`
--

DROP TABLE IF EXISTS `potongan_gaji`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `potongan_gaji` (
  `id` int NOT NULL AUTO_INCREMENT,
  `potongan` varchar(120) NOT NULL,
  `jml_potongan` int NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `potongan_gaji`
--

LOCK TABLES `potongan_gaji` WRITE;
/*!40000 ALTER TABLE `potongan_gaji` DISABLE KEYS */;
/*!40000 ALTER TABLE `potongan_gaji` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-27 14:53:42
