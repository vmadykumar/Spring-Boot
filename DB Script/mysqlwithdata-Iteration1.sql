CREATE DATABASE  IF NOT EXISTS `happytrip_itr1` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `happytrip_itr1`;
-- MySQL dump 10.13  Distrib 5.1.40, for Win32 (ia32)
--
-- Host: localhost    Database: happytrip_itr1
-- ------------------------------------------------------
-- Server version	5.5.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `flightbookings`
--

DROP TABLE IF EXISTS `flightbookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flightbookings` (
  `bookingid` bigint(20) NOT NULL AUTO_INCREMENT,
  `costperticket` float DEFAULT NULL,
  `dateofjourney` varchar(255) DEFAULT NULL,
  `noofseats` int(11) DEFAULT NULL,
  `classid` bigint(20) DEFAULT NULL,
  `flightrouteid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`bookingid`),
  KEY `FK91E417AA79413680` (`classid`),
  KEY `FK91E417AAB7BFA2B6` (`flightrouteid`),
  KEY `FK91E417AA8A21F572` (`flightrouteid`),
  CONSTRAINT `FK91E417AA79413680` FOREIGN KEY (`classid`) REFERENCES `classes` (`classid`),
  CONSTRAINT `FK91E417AA8A21F572` FOREIGN KEY (`flightrouteid`) REFERENCES `flightroutes` (`flightrouteid`),
  CONSTRAINT `FK91E417AAB7BFA2B6` FOREIGN KEY (`flightrouteid`) REFERENCES `scheduledflight` (`flightrouteid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flightbookings`
--

LOCK TABLES `flightbookings` WRITE;
/*!40000 ALTER TABLE `flightbookings` DISABLE KEYS */;
/*!40000 ALTER TABLE `flightbookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roomtypes`
--

DROP TABLE IF EXISTS `roomtypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roomtypes` (
  `typeid` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`typeid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roomtypes`
--

LOCK TABLES `roomtypes` WRITE;
/*!40000 ALTER TABLE `roomtypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `roomtypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seatavailability`
--

DROP TABLE IF EXISTS `seatavailability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seatavailability` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `availableseats` int(11) DEFAULT NULL,
  `classid` bigint(20) DEFAULT NULL,
  `scheduledflightid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKE79003E079413680` (`classid`),
  KEY `FKE79003E0C39FAD3A` (`scheduledflightid`),
  CONSTRAINT `FKE79003E0C39FAD3A` FOREIGN KEY (`scheduledflightid`) REFERENCES `scheduledflight` (`flightrouteid`),
  CONSTRAINT `FKE79003E079413680` FOREIGN KEY (`classid`) REFERENCES `classes` (`classid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seatavailability`
--

LOCK TABLES `seatavailability` WRITE;
/*!40000 ALTER TABLE `seatavailability` DISABLE KEYS */;
/*!40000 ALTER TABLE `seatavailability` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotelrooms_types`
--

DROP TABLE IF EXISTS `hotelrooms_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hotelrooms_types` (
  `hotelid` bigint(20) NOT NULL,
  `typeid` bigint(20) NOT NULL,
  PRIMARY KEY (`hotelid`,`typeid`),
  KEY `FK74E8223ED9BB5E48` (`hotelid`),
  KEY `FK74E8223E501B37A5` (`typeid`),
  CONSTRAINT `FK74E8223E501B37A5` FOREIGN KEY (`typeid`) REFERENCES `roomtypes` (`typeid`),
  CONSTRAINT `FK74E8223ED9BB5E48` FOREIGN KEY (`hotelid`) REFERENCES `hotels` (`hotelid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotelrooms_types`
--

LOCK TABLES `hotelrooms_types` WRITE;
/*!40000 ALTER TABLE `hotelrooms_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `hotelrooms_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotelrooms`
--

DROP TABLE IF EXISTS `hotelrooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hotelrooms` (
  `hotelid` bigint(20) NOT NULL AUTO_INCREMENT,
  `costperday` float DEFAULT NULL,
  `noofrooms` int(11) DEFAULT NULL,
  `typeid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`hotelid`),
  KEY `FK3725C9C4501B37A5` (`typeid`),
  CONSTRAINT `FK3725C9C4501B37A5` FOREIGN KEY (`typeid`) REFERENCES `roomtypes` (`typeid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotelrooms`
--

LOCK TABLES `hotelrooms` WRITE;
/*!40000 ALTER TABLE `hotelrooms` DISABLE KEYS */;
/*!40000 ALTER TABLE `hotelrooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `airlinereport`
--

DROP TABLE IF EXISTS `airlinereport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `airlinereport` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `airlinecode` varchar(255) DEFAULT NULL,
  `airlinelogo` varchar(255) DEFAULT NULL,
  `airlinename` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airlinereport`
--

LOCK TABLES `airlinereport` WRITE;
/*!40000 ALTER TABLE `airlinereport` DISABLE KEYS */;
/*!40000 ALTER TABLE `airlinereport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookingpayments`
--

DROP TABLE IF EXISTS `bookingpayments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bookingpayments` (
  `bookingid` bigint(20) NOT NULL AUTO_INCREMENT,
  `paymentamount` float DEFAULT NULL,
  `paymentdate` datetime DEFAULT NULL,
  `referenceno` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`bookingid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookingpayments`
--

LOCK TABLES `bookingpayments` WRITE;
/*!40000 ALTER TABLE `bookingpayments` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookingpayments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flightroutecosts`
--

DROP TABLE IF EXISTS `flightroutecosts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flightroutecosts` (
  `flightroutecostid` bigint(20) NOT NULL AUTO_INCREMENT,
  `costperticket` float DEFAULT NULL,
  `classid` bigint(20) DEFAULT NULL,
  `flightrouteid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`flightroutecostid`),
  KEY `FK31C8560D79413680` (`classid`),
  KEY `FK31C8560D8A21F572` (`flightrouteid`),
  CONSTRAINT `FK31C8560D8A21F572` FOREIGN KEY (`flightrouteid`) REFERENCES `flightroutes` (`flightrouteid`),
  CONSTRAINT `FK31C8560D79413680` FOREIGN KEY (`classid`) REFERENCES `classes` (`classid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flightroutecosts`
--

LOCK TABLES `flightroutecosts` WRITE;
/*!40000 ALTER TABLE `flightroutecosts` DISABLE KEYS */;
/*!40000 ALTER TABLE `flightroutecosts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flight_routes`
--

DROP TABLE IF EXISTS `flight_routes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flight_routes` (
  `flightid` bigint(20) NOT NULL,
  `routeid` bigint(20) NOT NULL,
  PRIMARY KEY (`flightid`,`routeid`),
  KEY `FK5AA131F9EB5B6E32` (`routeid`),
  KEY `FK5AA131F9D8F7A7D6` (`flightid`),
  CONSTRAINT `FK5AA131F9D8F7A7D6` FOREIGN KEY (`flightid`) REFERENCES `flights` (`flightid`),
  CONSTRAINT `FK5AA131F9EB5B6E32` FOREIGN KEY (`routeid`) REFERENCES `routes` (`routeid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flight_routes`
--

LOCK TABLES `flight_routes` WRITE;
/*!40000 ALTER TABLE `flight_routes` DISABLE KEYS */;
/*!40000 ALTER TABLE `flight_routes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotels`
--

DROP TABLE IF EXISTS `hotels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hotels` (
  `hotelid` bigint(20) NOT NULL AUTO_INCREMENT,
  `briefnote` varchar(255) DEFAULT NULL,
  `hotelname` varchar(255) DEFAULT NULL,
  `photourl` varchar(255) DEFAULT NULL,
  `starranking` int(11) DEFAULT NULL,
  `cityid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`hotelid`),
  KEY `FKB7CA753F824839CC` (`cityid`),
  CONSTRAINT `FKB7CA753F824839CC` FOREIGN KEY (`cityid`) REFERENCES `cities` (`cityid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotels`
--

LOCK TABLES `hotels` WRITE;
/*!40000 ALTER TABLE `hotels` DISABLE KEYS */;
/*!40000 ALTER TABLE `hotels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookingcontacts`
--

DROP TABLE IF EXISTS `bookingcontacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bookingcontacts` (
  `bookingid` bigint(20) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `contactname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobileno` varchar(255) DEFAULT NULL,
  `phoneno` varchar(255) DEFAULT NULL,
  `pincode` varchar(255) DEFAULT NULL,
  `cityid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`bookingid`),
  KEY `FK864AFFAC824839CC` (`cityid`),
  CONSTRAINT `FK864AFFAC824839CC` FOREIGN KEY (`cityid`) REFERENCES `cities` (`cityid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookingcontacts`
--

LOCK TABLES `bookingcontacts` WRITE;
/*!40000 ALTER TABLE `bookingcontacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookingcontacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bookings` (
  `bookingid` bigint(20) NOT NULL AUTO_INCREMENT,
  `bookingdate` varchar(255) DEFAULT NULL,
  `bookingreferenceno` varchar(255) DEFAULT NULL,
  `iscanceled` tinyint(4) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `totalcost` float DEFAULT NULL,
  `bookerid` bigint(20) DEFAULT NULL,
  `typeid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`bookingid`),
  KEY `FK7786033A4AE6D557` (`bookerid`),
  KEY `FK7786033AE232700D` (`typeid`),
  CONSTRAINT `FK7786033A4AE6D557` FOREIGN KEY (`bookerid`) REFERENCES `users` (`user_id`),
  CONSTRAINT `FK7786033AE232700D` FOREIGN KEY (`typeid`) REFERENCES `bookingtypes` (`typeid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `airlines`
--

DROP TABLE IF EXISTS `airlines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `airlines` (
  `airlineid` bigint(20) NOT NULL AUTO_INCREMENT,
  `airlinecode` varchar(255) DEFAULT NULL,
  `airlinelogo` varchar(255) DEFAULT NULL,
  `airlinename` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`airlineid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airlines`
--

LOCK TABLES `airlines` WRITE;
/*!40000 ALTER TABLE `airlines` DISABLE KEYS */;
/*!40000 ALTER TABLE `airlines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flights`
--

DROP TABLE IF EXISTS `flights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flights` (
  `flightid` bigint(20) NOT NULL AUTO_INCREMENT,
  `flightname` varchar(255) DEFAULT NULL,
  `airlineid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`flightid`),
  KEY `FKD1FF0A0392AB9C` (`airlineid`),
  CONSTRAINT `FKD1FF0A0392AB9C` FOREIGN KEY (`airlineid`) REFERENCES `airlines` (`airlineid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flights`
--

LOCK TABLES `flights` WRITE;
/*!40000 ALTER TABLE `flights` DISABLE KEYS */;
/*!40000 ALTER TABLE `flights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_roles` (
  `user_role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `authority` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`user_role_id`),
  KEY `FK73429949CA9D8275` (`user_id`),
  CONSTRAINT `FK73429949CA9D8275` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (33,'ROLE_ADMIN',33),(34,'ROLE_USER',34),(35,'ROLE_ADMIN',35),(36,'ROLE_USER',36);
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotelbookings`
--

DROP TABLE IF EXISTS `hotelbookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hotelbookings` (
  `bookingid` bigint(20) NOT NULL AUTO_INCREMENT,
  `costperday` float DEFAULT NULL,
  `fromdate` datetime DEFAULT NULL,
  `noofpeople` int(11) DEFAULT NULL,
  `noofrooms` int(11) DEFAULT NULL,
  `todate` datetime DEFAULT NULL,
  `roomid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`bookingid`),
  KEY `FK1840D0EEE06A002A` (`roomid`),
  CONSTRAINT `FK1840D0EEE06A002A` FOREIGN KEY (`roomid`) REFERENCES `hotelrooms` (`hotelid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotelbookings`
--

LOCK TABLES `hotelbookings` WRITE;
/*!40000 ALTER TABLE `hotelbookings` DISABLE KEYS */;
/*!40000 ALTER TABLE `hotelbookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotelratings`
--

DROP TABLE IF EXISTS `hotelratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hotelratings` (
  `hotelid` bigint(20) NOT NULL AUTO_INCREMENT,
  `rating` float DEFAULT NULL,
  `totalratings` decimal(19,2) DEFAULT NULL,
  PRIMARY KEY (`hotelid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotelratings`
--

LOCK TABLES `hotelratings` WRITE;
/*!40000 ALTER TABLE `hotelratings` DISABLE KEYS */;
/*!40000 ALTER TABLE `hotelratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flightroutes`
--

DROP TABLE IF EXISTS `flightroutes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flightroutes` (
  `flightrouteid` bigint(20) NOT NULL AUTO_INCREMENT,
  `arrivaltime` varchar(255) DEFAULT NULL,
  `departuretime` varchar(255) DEFAULT NULL,
  `distanceinkms` int(11) DEFAULT NULL,
  `durationinmins` int(11) DEFAULT NULL,
  `flightnumber` varchar(255) DEFAULT NULL,
  `flightid` bigint(20) DEFAULT NULL,
  `routeid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`flightrouteid`),
  KEY `FKAF9407BAEB5B6E32` (`routeid`),
  KEY `FKAF9407BAD8F7A7D6` (`flightid`),
  CONSTRAINT `FKAF9407BAD8F7A7D6` FOREIGN KEY (`flightid`) REFERENCES `flights` (`flightid`),
  CONSTRAINT `FKAF9407BAEB5B6E32` FOREIGN KEY (`routeid`) REFERENCES `routes` (`routeid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flightroutes`
--

LOCK TABLES `flightroutes` WRITE;
/*!40000 ALTER TABLE `flightroutes` DISABLE KEYS */;
/*!40000 ALTER TABLE `flightroutes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createddate` varchar(45) DEFAULT NULL,
  `dateofbirth` varchar(45) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `enabled` bit(1) NOT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `loginid` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (33,'Sep 21, 2013 1:01:25 PM','Sep 21, 2013 1:01:25 PM','admin@mindtree.com','',NULL,NULL,'admin@mindtree.com','admin'),(34,'Sep 21, 2013 1:01:25 PM','Sep 21, 2013 1:01:25 PM','user@mindtree.com','',NULL,NULL,'user@mindtree.com','password'),(35,'Sep 21, 2013 1:01:25 PM','Sep 21, 2013 1:01:25 PM','happyadmin','',NULL,NULL,'happyadmin','password'),(36,'Sep 21, 2013 1:01:25 PM','Sep 21, 2013 1:01:25 PM','user@fanmail.com','',NULL,NULL,'user@fanmail.com','password');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usercontactinformation`
--

DROP TABLE IF EXISTS `usercontactinformation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usercontactinformation` (
  `contactid` bigint(20) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `mobileno` varchar(255) DEFAULT NULL,
  `pincode` varchar(255) DEFAULT NULL,
  `cityid` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`contactid`),
  KEY `FK82432C17CA9D8275` (`user_id`),
  KEY `FK82432C17824839CC` (`cityid`),
  CONSTRAINT `FK82432C17CA9D8275` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usercontactinformation`
--

LOCK TABLES `usercontactinformation` WRITE;
/*!40000 ALTER TABLE `usercontactinformation` DISABLE KEYS */;
/*!40000 ALTER TABLE `usercontactinformation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `routereport`
--

DROP TABLE IF EXISTS `routereport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `routereport` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fromcity` varchar(255) DEFAULT NULL,
  `tocity` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `routereport`
--

LOCK TABLES `routereport` WRITE;
/*!40000 ALTER TABLE `routereport` DISABLE KEYS */;
/*!40000 ALTER TABLE `routereport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cities` (
  `cityid` bigint(20) NOT NULL AUTO_INCREMENT,
  `cityname` varchar(255) DEFAULT NULL,
  `stateid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`cityid`),
  KEY `FKAEEDBB4927C020C2` (`stateid`),
  CONSTRAINT `FKAEEDBB4927C020C2` FOREIGN KEY (`stateid`) REFERENCES `states` (`stateid`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (12,'Bangalore',5),(13,'Mangalore',5),(14,'Mysore',5),(15,'Chennai',5),(16,'Kolkata',5);
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flightcapacity`
--

DROP TABLE IF EXISTS `flightcapacity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flightcapacity` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `totalseats` int(11) DEFAULT NULL,
  `flightid` bigint(20) DEFAULT NULL,
  `classid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1653292AD8F7A7D6` (`flightid`),
  KEY `FK1653292A79413680` (`classid`),
  CONSTRAINT `FK1653292A79413680` FOREIGN KEY (`classid`) REFERENCES `classes` (`classid`),
  CONSTRAINT `FK1653292AD8F7A7D6` FOREIGN KEY (`flightid`) REFERENCES `flights` (`flightid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flightcapacity`
--

LOCK TABLES `flightcapacity` WRITE;
/*!40000 ALTER TABLE `flightcapacity` DISABLE KEYS */;
/*!40000 ALTER TABLE `flightcapacity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passengers`
--

DROP TABLE IF EXISTS `passengers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `passengers` (
  `passengerid` bigint(20) NOT NULL AUTO_INCREMENT,
  `dateofbirth` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `bookingid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`passengerid`),
  KEY `FK2E3B3F19788C76C2` (`bookingid`),
  CONSTRAINT `FK2E3B3F19788C76C2` FOREIGN KEY (`bookingid`) REFERENCES `flightbookings` (`bookingid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passengers`
--

LOCK TABLES `passengers` WRITE;
/*!40000 ALTER TABLE `passengers` DISABLE KEYS */;
/*!40000 ALTER TABLE `passengers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userreport`
--

DROP TABLE IF EXISTS `userreport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userreport` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userreport`
--

LOCK TABLES `userreport` WRITE;
/*!40000 ALTER TABLE `userreport` DISABLE KEYS */;
/*!40000 ALTER TABLE `userreport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookingcancelations`
--

DROP TABLE IF EXISTS `bookingcancelations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bookingcancelations` (
  `bookingid` bigint(20) NOT NULL AUTO_INCREMENT,
  `cancelationdate` datetime DEFAULT NULL,
  `refundamount` float DEFAULT NULL,
  PRIMARY KEY (`bookingid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookingcancelations`
--

LOCK TABLES `bookingcancelations` WRITE;
/*!40000 ALTER TABLE `bookingcancelations` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookingcancelations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotelcontacts`
--

DROP TABLE IF EXISTS `hotelcontacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hotelcontacts` (
  `hotelid` bigint(20) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `contactno` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `pinCode` varchar(255) DEFAULT NULL,
  `cityid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`hotelid`),
  KEY `FK7EE82E07824839CC` (`cityid`),
  CONSTRAINT `FK7EE82E07824839CC` FOREIGN KEY (`cityid`) REFERENCES `cities` (`cityid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotelcontacts`
--

LOCK TABLES `hotelcontacts` WRITE;
/*!40000 ALTER TABLE `hotelcontacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `hotelcontacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookingreport`
--

DROP TABLE IF EXISTS `bookingreport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bookingreport` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `costperticket` float DEFAULT NULL,
  `dateofjourney` datetime DEFAULT NULL,
  `numberofseats` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookingreport`
--

LOCK TABLES `bookingreport` WRITE;
/*!40000 ALTER TABLE `bookingreport` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookingreport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookingtypes`
--

DROP TABLE IF EXISTS `bookingtypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bookingtypes` (
  `typeid` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`typeid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookingtypes`
--

LOCK TABLES `bookingtypes` WRITE;
/*!40000 ALTER TABLE `bookingtypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookingtypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviews` (
  `reviewid` bigint(20) NOT NULL AUTO_INCREMENT,
  `createddate` datetime DEFAULT NULL,
  `isactive` tinyint(4) DEFAULT NULL,
  `isreportabused` tinyint(4) DEFAULT NULL,
  `reviewtext` varchar(255) DEFAULT NULL,
  `hotelid` bigint(20) DEFAULT NULL,
  `userid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`reviewid`),
  KEY `FK418FF41BD9BB5E48` (`hotelid`),
  KEY `FK418FF41BA18DC68C` (`userid`),
  CONSTRAINT `FK418FF41BA18DC68C` FOREIGN KEY (`userid`) REFERENCES `users` (`user_id`),
  CONSTRAINT `FK418FF41BD9BB5E48` FOREIGN KEY (`hotelid`) REFERENCES `hotels` (`hotelid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scheduledflightreport`
--

DROP TABLE IF EXISTS `scheduledflightreport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scheduledflightreport` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `arrivaltime` varchar(255) DEFAULT NULL,
  `departuretime` varchar(255) DEFAULT NULL,
  `flightnumber` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scheduledflightreport`
--

LOCK TABLES `scheduledflightreport` WRITE;
/*!40000 ALTER TABLE `scheduledflightreport` DISABLE KEYS */;
/*!40000 ALTER TABLE `scheduledflightreport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `states` (
  `stateid` bigint(20) NOT NULL AUTO_INCREMENT,
  `statename` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`stateid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states`
--

LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
INSERT INTO `states` VALUES (5,'Karnataka');
/*!40000 ALTER TABLE `states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classes` (
  `classid` bigint(20) NOT NULL AUTO_INCREMENT,
  `classtype` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`classid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes`
--

LOCK TABLES `classes` WRITE;
/*!40000 ALTER TABLE `classes` DISABLE KEYS */;
INSERT INTO `classes` VALUES (9,'Economy'),(10,'Business'),(11,'First'),(12,'Premium Economy');
/*!40000 ALTER TABLE `classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scheduledflight`
--

DROP TABLE IF EXISTS `scheduledflight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scheduledflight` (
  `scheduledflightdate` varchar(255) DEFAULT NULL,
  `flightrouteid` bigint(20) NOT NULL,
  PRIMARY KEY (`flightrouteid`),
  KEY `FK5A634F5D8A21F572` (`flightrouteid`),
  CONSTRAINT `FK5A634F5D8A21F572` FOREIGN KEY (`flightrouteid`) REFERENCES `flightroutes` (`flightrouteid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scheduledflight`
--

LOCK TABLES `scheduledflight` WRITE;
/*!40000 ALTER TABLE `scheduledflight` DISABLE KEYS */;
/*!40000 ALTER TABLE `scheduledflight` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `routes`
--

DROP TABLE IF EXISTS `routes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `routes` (
  `routeid` bigint(20) NOT NULL AUTO_INCREMENT,
  `fromcityid` bigint(20) DEFAULT NULL,
  `tocityid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`routeid`),
  KEY `FKC8DB974A6EAE69F6` (`fromcityid`),
  KEY `FKC8DB974A84244007` (`tocityid`),
  CONSTRAINT `FKC8DB974A84244007` FOREIGN KEY (`tocityid`) REFERENCES `cities` (`cityid`),
  CONSTRAINT `FKC8DB974A6EAE69F6` FOREIGN KEY (`fromcityid`) REFERENCES `cities` (`cityid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `routes`
--

LOCK TABLES `routes` WRITE;
/*!40000 ALTER TABLE `routes` DISABLE KEYS */;
/*!40000 ALTER TABLE `routes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backup`
--

DROP TABLE IF EXISTS `backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backup` (
  `backupid` bigint(20) NOT NULL AUTO_INCREMENT,
  `data` longblob,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`backupid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backup`
--

LOCK TABLES `backup` WRITE;
/*!40000 ALTER TABLE `backup` DISABLE KEYS */;
/*!40000 ALTER TABLE `backup` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-09-21 13:04:43
