CREATE DATABASE  IF NOT EXISTS `tn2` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `tn2`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: tn2
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `tblcanhan205`
--

DROP TABLE IF EXISTS `tblcanhan205`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblcanhan205` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cccd` varchar(13) NOT NULL,
  `ngaySinh` varchar(10) NOT NULL,
  `hoTen` varchar(255) NOT NULL,
  `diaChi` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `ghiChu` varchar(255) DEFAULT NULL,
  `loai` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cccd` (`cccd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblcanhan205`
--

LOCK TABLES `tblcanhan205` WRITE;
/*!40000 ALTER TABLE `tblcanhan205` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblcanhan205` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblhoadon205`
--

DROP TABLE IF EXISTS `tblhoadon205`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblhoadon205` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ngayThanhToan` date NOT NULL,
  `thanhTien` date NOT NULL,
  `loai` varchar(255) NOT NULL,
  `tblHopDong205id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKtblHoaDon2701415` (`tblHopDong205id`),
  CONSTRAINT `FKtblHoaDon2701415` FOREIGN KEY (`tblHopDong205id`) REFERENCES `tblhopdong205` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblhoadon205`
--

LOCK TABLES `tblhoadon205` WRITE;
/*!40000 ALTER TABLE `tblhoadon205` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblhoadon205` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblhonghoc205`
--

DROP TABLE IF EXISTS `tblhonghoc205`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblhonghoc205` (
  `id` int NOT NULL AUTO_INCREMENT,
  `boPhan` varchar(255) NOT NULL,
  `tinhTrang` varchar(255) NOT NULL,
  `giaTri` float NOT NULL,
  `ghiChu` varchar(255) DEFAULT NULL,
  `tblXeHopDong205id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKtblHongHoc18655` (`tblXeHopDong205id`),
  CONSTRAINT `FKtblHongHoc18655` FOREIGN KEY (`tblXeHopDong205id`) REFERENCES `tblxehopdong205` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblhonghoc205`
--

LOCK TABLES `tblhonghoc205` WRITE;
/*!40000 ALTER TABLE `tblhonghoc205` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblhonghoc205` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblhopdong205`
--

DROP TABLE IF EXISTS `tblhopdong205`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblhopdong205` (
  `id` int NOT NULL AUTO_INCREMENT,
  `loai` varchar(255) NOT NULL,
  `tblThanhVien205id` int NOT NULL,
  `tblCaNhan205id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKtblHopDong763469` (`tblThanhVien205id`),
  KEY `FKtblHopDong648551` (`tblCaNhan205id`),
  CONSTRAINT `FKtblHopDong648551` FOREIGN KEY (`tblCaNhan205id`) REFERENCES `tblcanhan205` (`id`),
  CONSTRAINT `FKtblHopDong763469` FOREIGN KEY (`tblThanhVien205id`) REFERENCES `tblthanhvien205` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblhopdong205`
--

LOCK TABLES `tblhopdong205` WRITE;
/*!40000 ALTER TABLE `tblhopdong205` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblhopdong205` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbltaisancamco205`
--

DROP TABLE IF EXISTS `tbltaisancamco205`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbltaisancamco205` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ten` varchar(255) NOT NULL,
  `giaTri` float NOT NULL,
  `ghiChu` varchar(255) DEFAULT NULL,
  `tblHopDong205id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKtblTaiSanC752943` (`tblHopDong205id`),
  CONSTRAINT `FKtblTaiSanC752943` FOREIGN KEY (`tblHopDong205id`) REFERENCES `tblhopdong205` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbltaisancamco205`
--

LOCK TABLES `tbltaisancamco205` WRITE;
/*!40000 ALTER TABLE `tbltaisancamco205` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbltaisancamco205` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblthanhvien205`
--

DROP TABLE IF EXISTS `tblthanhvien205`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblthanhvien205` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `chucVu` varchar(255) NOT NULL,
  `tblCaNhan205id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `FKtblThanhVi880583` (`tblCaNhan205id`),
  CONSTRAINT `FKtblThanhVi880583` FOREIGN KEY (`tblCaNhan205id`) REFERENCES `tblcanhan205` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblthanhvien205`
--

LOCK TABLES `tblthanhvien205` WRITE;
/*!40000 ALTER TABLE `tblthanhvien205` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblthanhvien205` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblxe205`
--

DROP TABLE IF EXISTS `tblxe205`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblxe205` (
  `id` int NOT NULL AUTO_INCREMENT,
  `bienSo` varchar(255) NOT NULL,
  `dongXe` varchar(255) NOT NULL,
  `hangXe` varchar(255) NOT NULL,
  `doiXe` varchar(255) NOT NULL,
  `moTa` varchar(255) DEFAULT NULL,
  `tblCaNhan205id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bienSo` (`bienSo`),
  KEY `FKtblXe20574597` (`tblCaNhan205id`),
  CONSTRAINT `FKtblXe20574597` FOREIGN KEY (`tblCaNhan205id`) REFERENCES `tblcanhan205` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblxe205`
--

LOCK TABLES `tblxe205` WRITE;
/*!40000 ALTER TABLE `tblxe205` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblxe205` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblxehopdong205`
--

DROP TABLE IF EXISTS `tblxehopdong205`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblxehopdong205` (
  `id` int NOT NULL AUTO_INCREMENT,
  `donGia` float NOT NULL,
  `ngayKetThuc` date NOT NULL,
  `ngayBatDau` date NOT NULL,
  `tinhTrang` varchar(255) DEFAULT NULL,
  `tblXe205id` int NOT NULL,
  `tblHopDong205id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKtblXeHopDo839924` (`tblXe205id`),
  KEY `FKtblXeHopDo843353` (`tblHopDong205id`),
  CONSTRAINT `FKtblXeHopDo839924` FOREIGN KEY (`tblXe205id`) REFERENCES `tblxe205` (`id`),
  CONSTRAINT `FKtblXeHopDo843353` FOREIGN KEY (`tblHopDong205id`) REFERENCES `tblhopdong205` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblxehopdong205`
--

LOCK TABLES `tblxehopdong205` WRITE;
/*!40000 ALTER TABLE `tblxehopdong205` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblxehopdong205` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-18 15:07:28
