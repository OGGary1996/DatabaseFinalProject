-- MySQL dump 10.13  Distrib 8.0.39, for macos14 (arm64)
--
-- Host: localhost    Database: Employee
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `Address`
--

DROP TABLE IF EXISTS `Address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Address` (
  `Emp_ID` int NOT NULL,
  `Street` varchar(100) NOT NULL,
  `City` varchar(20) NOT NULL,
  `Prov` varchar(10) NOT NULL,
  `Postal` varchar(10) NOT NULL,
  PRIMARY KEY (`Emp_ID`),
  CONSTRAINT `Emp_ID_as_FK` FOREIGN KEY (`Emp_ID`) REFERENCES `Employees_Info` (`Emp_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Address`
--

LOCK TABLES `Address` WRITE;
/*!40000 ALTER TABLE `Address` DISABLE KEYS */;
INSERT INTO `Address` VALUES (3571,'386 High Street','Tuxford','SK','S0L 8V6'),(32177,'4319 Main St.','Moose Jaw','SK','S6H 2M2'),(33982,'117 East Broadway','Moose Jaw','SK','S6H 3P5'),(41822,'72 Railway Ave.','Pense','SK','S0T 1K4'),(51537,'9745 University Drive','Regina','SK','S4P 7A3'),(52421,'27 High St.','Tuxford','SK','S0L 8V6'),(72201,'1015 Brunswick Lane','Moose Jaw','SK','S6H 4T5'),(72690,'59 Oslo Square','Moose Jaw','SK','S6H 2H9'),(81216,'95 Lakeshore Blvd.','Caronport','SK','S0T 3S7'),(85833,'1216 Willow Cres.','Pasqua','SK','S0H 5T8'),(97319,'6803 Park Ave.','Moose Jaw','SK','S6H 1X7');
/*!40000 ALTER TABLE `Address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Department`
--

DROP TABLE IF EXISTS `Department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Department` (
  `Department_ID` int NOT NULL,
  `Department` varchar(50) NOT NULL,
  `Supervisor_ID` int NOT NULL,
  PRIMARY KEY (`Department_ID`),
  UNIQUE KEY `Department` (`Department`),
  KEY `Supervisor_ID` (`Supervisor_ID`),
  CONSTRAINT `department_ibfk_1` FOREIGN KEY (`Supervisor_ID`) REFERENCES `Supervisor` (`Supervisor_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Department`
--

LOCK TABLES `Department` WRITE;
/*!40000 ALTER TABLE `Department` DISABLE KEYS */;
INSERT INTO `Department` VALUES (100,'Front-End',10),(200,'Facility Operations',20),(300,'Kitchen',30),(400,'Pharmacy',40);
/*!40000 ALTER TABLE `Department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employees_Info`
--

DROP TABLE IF EXISTS `Employees_Info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Employees_Info` (
  `Emp_ID` int NOT NULL,
  `SIN` varchar(12) NOT NULL,
  `Lastname` varchar(50) NOT NULL,
  `Firstname` varchar(50) NOT NULL,
  `Birth_Date` date NOT NULL,
  PRIMARY KEY (`Emp_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employees_Info`
--

LOCK TABLES `Employees_Info` WRITE;
/*!40000 ALTER TABLE `Employees_Info` DISABLE KEYS */;
INSERT INTO `Employees_Info` VALUES (3571,'374853129','Hashimoto','Jo','1956-06-23'),(32177,'306114858','DaSilva','Robbie','1951-02-18'),(33982,'867481381','Boychuk','Robin','1971-03-04'),(41822,'717505366','Miller','Chris','1968-11-15'),(51537,'112893584','Smith','Kim','1982-11-29'),(52421,'936654021','O Day','Shelley','1963-07-31'),(72201,'635111876','Ramirez','Kelly','1986-09-29'),(72690,'655971502','Wong','Jodie','1987-01-01'),(81216,'615917448','Hansen','Jaimie','1983-03-04'),(85833,'466128562','Singh','Lindsey','1975-03-15'),(97319,'516303417','Novak','Gerry','1986-08-24');
/*!40000 ALTER TABLE `Employees_Info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employment_Info`
--

DROP TABLE IF EXISTS `Employment_Info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Employment_Info` (
  `Emp_ID` int NOT NULL,
  `Hire_Date` date NOT NULL,
  `Job_Code` int NOT NULL,
  PRIMARY KEY (`Emp_ID`),
  KEY `Job_Code` (`Job_Code`),
  CONSTRAINT `Emp_ID_as_FK_to_Employees_Info` FOREIGN KEY (`Emp_ID`) REFERENCES `Employees_Info` (`Emp_ID`),
  CONSTRAINT `employment_info_ibfk_1` FOREIGN KEY (`Job_Code`) REFERENCES `Job_Position` (`Job_Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employment_Info`
--

LOCK TABLES `Employment_Info` WRITE;
/*!40000 ALTER TABLE `Employment_Info` DISABLE KEYS */;
INSERT INTO `Employment_Info` VALUES (3571,'1980-03-20',1000),(32177,'1983-07-07',4000),(33982,'1998-10-11',5000),(41822,'1985-02-19',2000),(51537,'2001-12-02',2000),(52421,'1997-11-08',6000),(72201,'2003-08-26',3000),(72690,'2003-08-26',6000),(81216,'2002-05-21',8000),(85833,'2002-07-27',7000),(97319,'2003-07-07',3000);
/*!40000 ALTER TABLE `Employment_Info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Job_Position`
--

DROP TABLE IF EXISTS `Job_Position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Job_Position` (
  `Job_Code` int NOT NULL,
  `Position` varchar(40) NOT NULL,
  `Payrate` double NOT NULL,
  `Inc_Tax` enum('YES','NO') NOT NULL,
  `Department_ID` int NOT NULL,
  PRIMARY KEY (`Job_Code`),
  UNIQUE KEY `Position` (`Position`),
  KEY `Department_ID` (`Department_ID`),
  CONSTRAINT `job_position_ibfk_1` FOREIGN KEY (`Department_ID`) REFERENCES `Department` (`Department_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Job_Position`
--

LOCK TABLES `Job_Position` WRITE;
/*!40000 ALTER TABLE `Job_Position` DISABLE KEYS */;
INSERT INTO `Job_Position` VALUES (1000,'Greeter',10.25,'YES',100),(2000,'Cashier',11.99,'YES',100),(3000,'Stockperson',12.99,'NO',200),(4000,'Baker',17.5,'YES',300),(5000,'Butcher',18,'YES',300),(6000,'Cleaner',13.5,'NO',200),(7000,'Pharmacist',30,'YES',400),(8000,'Assistant Baker',15.5,'YES',300);
/*!40000 ALTER TABLE `Job_Position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PayPeriod`
--

DROP TABLE IF EXISTS `PayPeriod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PayPeriod` (
  `Period_ID` int NOT NULL,
  `Pay_Week_End_Date` date NOT NULL,
  `Days_Available` int NOT NULL,
  PRIMARY KEY (`Period_ID`),
  UNIQUE KEY `Pay_Week_End_Date` (`Pay_Week_End_Date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PayPeriod`
--

LOCK TABLES `PayPeriod` WRITE;
/*!40000 ALTER TABLE `PayPeriod` DISABLE KEYS */;
INSERT INTO `PayPeriod` VALUES (130523,'2013-05-23',7),(130530,'2013-05-30',6);
/*!40000 ALTER TABLE `PayPeriod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Payroll`
--

DROP TABLE IF EXISTS `Payroll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Payroll` (
  `Record_ID` int NOT NULL,
  `Emp_ID` int NOT NULL,
  `Period_ID` int NOT NULL,
  `Hours` double NOT NULL,
  `Over_Time` double NOT NULL,
  `Person_Hours_Worked` double NOT NULL,
  PRIMARY KEY (`Record_ID`),
  KEY `Emp_ID` (`Emp_ID`),
  KEY `Period_ID` (`Period_ID`),
  CONSTRAINT `payroll_ibfk_1` FOREIGN KEY (`Emp_ID`) REFERENCES `Employees_Info` (`Emp_ID`),
  CONSTRAINT `payroll_ibfk_2` FOREIGN KEY (`Period_ID`) REFERENCES `PayPeriod` (`Period_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Payroll`
--

LOCK TABLES `Payroll` WRITE;
/*!40000 ALTER TABLE `Payroll` DISABLE KEYS */;
INSERT INTO `Payroll` VALUES (1,33982,130523,40,0,322.5),(2,33982,130530,38.25,0,236),(3,51537,130523,27,0,322.5),(4,41822,130523,40,0,322.5),(5,41822,130530,38,1.25,236),(6,3571,130523,40,0,322.5),(7,3571,130530,40,0,236),(8,85833,130523,37.5,0.5,322.5),(9,85833,130530,22,0,236),(10,81216,130523,40,0,322.5),(11,32177,130523,40,3.7,322.5),(12,32177,130530,40,2.25,236),(13,52421,130523,22,0,322.5),(14,52421,130530,40,4.5,236),(15,72690,130523,36,0,322.5),(16,72201,130530,18,0,236);
/*!40000 ALTER TABLE `Payroll` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Supervisor`
--

DROP TABLE IF EXISTS `Supervisor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Supervisor` (
  `Supervisor_ID` int NOT NULL,
  `Supervisor` varchar(50) NOT NULL,
  `Supervisor_Cell` varchar(12) NOT NULL,
  PRIMARY KEY (`Supervisor_ID`),
  UNIQUE KEY `Supervisor` (`Supervisor`),
  UNIQUE KEY `Supervisor_Cell` (`Supervisor_Cell`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Supervisor`
--

LOCK TABLES `Supervisor` WRITE;
/*!40000 ALTER TABLE `Supervisor` DISABLE KEYS */;
INSERT INTO `Supervisor` VALUES (10,'Melissa Jones','306.304.8878'),(20,'Jason Goldberg','306.304.4545'),(30,'Chand Long','306.304.1212'),(40,'Joseph Snowdale','306.304.9091');
/*!40000 ALTER TABLE `Supervisor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-24 10:13:12
