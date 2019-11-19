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

-- Data exporting was unselected.

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

-- Data exporting was unselected.

-- Dumping structure for table zerowaste.sub_broadcast_type
CREATE TABLE IF NOT EXISTS `sub_broadcast_type` (
  `id` int(1) NOT NULL AUTO_INCREMENT,
  `title` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table zerowaste.unit_of_measure
CREATE TABLE IF NOT EXISTS `unit_of_measure` (
  `id` int(1) DEFAULT NULL,
  `title` text DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table zerowaste.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `email` text DEFAULT NULL,
  `password` text NOT NULL,
  `name` text NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `usertype` int(1) NOT NULL,
  `longitude` float DEFAULT 0,
  `lattitude` float DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `FK_users_usertype` (`usertype`),
  CONSTRAINT `FK_users_usertype` FOREIGN KEY (`usertype`) REFERENCES `usertype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table zerowaste.usertype
CREATE TABLE IF NOT EXISTS `usertype` (
  `id` int(1) NOT NULL AUTO_INCREMENT,
  `title` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
