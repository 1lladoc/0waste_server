-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.3.16-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for zerowaste
CREATE DATABASE IF NOT EXISTS `zerowaste` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `zerowaste`;

-- Dumping structure for table zerowaste.broadcast_type
CREATE TABLE IF NOT EXISTS `broadcast_type` (
  `id` int(1) NOT NULL AUTO_INCREMENT,
  `title` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table zerowaste.broadcast_type: ~2 rows (approximately)
/*!40000 ALTER TABLE `broadcast_type` DISABLE KEYS */;
INSERT INTO `broadcast_type` (`id`, `title`, `description`) VALUES
	(1, 'Recyclable', 'Location'),
	(2, 'Waste', 'Location'),
	(3, 'Location', 'Location');
/*!40000 ALTER TABLE `broadcast_type` ENABLE KEYS */;

-- Dumping structure for table zerowaste.record
CREATE TABLE IF NOT EXISTS `record` (
  `id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned zerofill NOT NULL DEFAULT 0000000000,
  `broadcast_type` int(1) DEFAULT 0,
  `sub_broadcast_type` int(1) DEFAULT 0,
  `quantity` int(4) DEFAULT 0,
  `unit_of_measure` int(1) DEFAULT 0,
  `latitude` float DEFAULT 0,
  `longitude` float DEFAULT 0,
  `date_time` datetime DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `FK_record_users` (`user_id`),
  CONSTRAINT `FK_record_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table zerowaste.record: ~0 rows (approximately)
/*!40000 ALTER TABLE `record` DISABLE KEYS */;
/*!40000 ALTER TABLE `record` ENABLE KEYS */;

-- Dumping structure for table zerowaste.reports
CREATE TABLE IF NOT EXISTS `reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned zerofill NOT NULL,
  `rating` double DEFAULT 0,
  `comment` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_reports_users` (`user_id`),
  CONSTRAINT `FK_reports_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table zerowaste.reports: ~0 rows (approximately)
/*!40000 ALTER TABLE `reports` DISABLE KEYS */;
INSERT INTO `reports` (`id`, `user_id`, `rating`, `comment`) VALUES
	(1, 0000000024, 4, NULL),
	(2, 0000000024, 3, NULL),
	(3, 0000000024, 5, NULL),
	(4, 0000000024, 5, NULL);
/*!40000 ALTER TABLE `reports` ENABLE KEYS */;

-- Dumping structure for table zerowaste.sub_broadcast_type
CREATE TABLE IF NOT EXISTS `sub_broadcast_type` (
  `id` int(1) NOT NULL AUTO_INCREMENT,
  `title` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table zerowaste.sub_broadcast_type: ~2 rows (approximately)
/*!40000 ALTER TABLE `sub_broadcast_type` DISABLE KEYS */;
INSERT INTO `sub_broadcast_type` (`id`, `title`, `description`) VALUES
	(1, 'Plastic', 'Plastic'),
	(2, 'Paper', 'Paper');
/*!40000 ALTER TABLE `sub_broadcast_type` ENABLE KEYS */;

-- Dumping structure for table zerowaste.unit_of_measure
CREATE TABLE IF NOT EXISTS `unit_of_measure` (
  `id` int(1) DEFAULT NULL,
  `title` text DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table zerowaste.unit_of_measure: ~0 rows (approximately)
/*!40000 ALTER TABLE `unit_of_measure` DISABLE KEYS */;
INSERT INTO `unit_of_measure` (`id`, `title`, `description`) VALUES
	(1, 'Kg', 'Kilogram');
/*!40000 ALTER TABLE `unit_of_measure` ENABLE KEYS */;

-- Dumping structure for table zerowaste.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `email` text DEFAULT NULL,
  `password` text NOT NULL,
  `name` text NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `usertype` int(1) NOT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_users_usertype` (`usertype`),
  CONSTRAINT `FK_users_usertype` FOREIGN KEY (`usertype`) REFERENCES `usertype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

-- Dumping data for table zerowaste.users: ~7 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `email`, `password`, `name`, `mobile`, `usertype`, `latitude`, `longitude`) VALUES
	(0000000003, 'admin@menro.com', '0192023a7bbd73250516f069df18b500', 'Melanie', '09187654321', 1, 0, 0),
	(0000000024, '', '1bbd886460827015e5d605ed44252251', 'Test Junkshop1', '11111111111', 2, 10.1916769, 122.851643),
	(0000000025, '', 'bae5e3208a3c700e3db642b6631e95b9', 'Test Junkshop2', '22222222222', 2, 10.1914034, 122.851936),
	(0000000026, '', 'd27d320c27c3033b7883347d8beca317', 'Test Junkshop3', '33333333333', 2, 10.1916611, 122.851362),
	(0000000027, '', 'b857eed5c9405c1f2b98048aae506792', 'Test Junkshop4', '44444444444', 2, 10.1783426, 122.856619),
	(0000000028, '', 'f638f4354ff089323d1a5f78fd8f63ca', 'TEST 5', '55555555555', 2, 10.191198828339088, 122.85113241523504),
	(0000000029, '', '7c497868c9e6d3e4cf2e87396372cd3b', 'TEST 6', '66666666669', 2, 10.181208003320508, 122.85632818937303);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for table zerowaste.usertype
CREATE TABLE IF NOT EXISTS `usertype` (
  `id` int(1) NOT NULL AUTO_INCREMENT,
  `title` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table zerowaste.usertype: ~2 rows (approximately)
/*!40000 ALTER TABLE `usertype` DISABLE KEYS */;
INSERT INTO `usertype` (`id`, `title`, `description`) VALUES
	(1, 'Residential', 'Residential'),
	(2, 'Junkshop', 'Junk Shop');
/*!40000 ALTER TABLE `usertype` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
