-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.1.21-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win32
-- HeidiSQL 버전:                  9.4.0.5174
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- library 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `library` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `library`;

-- 테이블 library.admin 구조 내보내기
CREATE TABLE IF NOT EXISTS `admin` (
  `admin_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(50) DEFAULT NULL,
  `admin_password` varchar(50) DEFAULT NULL,
  `admin_email` varchar(50) DEFAULT NULL,
  `status` char(1) DEFAULT 'A',
  PRIMARY KEY (`a_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 library.book 구조 내보내기
CREATE TABLE IF NOT EXISTS `book` (
  `book_id` int(11) NOT NULL AUTO_INCREMENT,
  `title_statement` varchar(50) NOT NULL,
  `author_last_name` varchar(50) NOT NULL,
  `author_first_name` varchar(50) DEFAULT NULL,
  `subtitle` varchar(50) NOT NULL,
  `publisher` varchar(50) DEFAULT NULL,
  `issued_date` date DEFAULT NULL,
  `isbn` varchar(50) DEFAULT NULL,
  `isdn` varchar(50) DEFAULT NULL,
  `issn` varchar(50) DEFAULT NULL,
  `editor` varchar(20) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `keyword` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='book management';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 library.book_management 구조 내보내기
CREATE TABLE IF NOT EXISTS `book_management` (
  `book_id` int(11) NOT NULL,
  `book_location` varchar(20) DEFAULT NULL,
  `rental_status` char(1) NOT NULL DEFAULT 'N',
  KEY `FK_book_management_book` (`book_id`),
  CONSTRAINT `FK_book_management_book` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 library.rental_management 구조 내보내기
CREATE TABLE IF NOT EXISTS `rental_management` (
  `rental_id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `rental_date` date DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  PRIMARY KEY (`rental_id`),
  KEY `FK_rental_management_book` (`book_id`),
  KEY `FK_rental_management_user` (`user_id`),
  CONSTRAINT `FK_rental_management_book` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`),
  CONSTRAINT `FK_rental_management_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 library.reservation 구조 내보내기
--CREATE TABLE IF NOT EXISTS `reservation` (
--  `reserve_id` int(11) NOT NULL AUTO_INCREMENT,
--  `book_id` int(11) DEFAULT NULL,
--  `user_id` int(11) DEFAULT NULL,
--  `reserve_date` date DEFAULT NULL,
--  PRIMARY KEY (`reserve_id`),
--  KEY `FK_reservation_user` (`user_id`),
--  KEY `FK_reservation_book` (`book_id`),
--  CONSTRAINT `FK_reservation_book` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`),
--  CONSTRAINT `FK_reservation_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 library.user 구조 내보내기
CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) NOT NULL,
  `user_password` varchar(50) NOT NULL,
  `user_email` varchar(50) DEFAULT NULL,
  `phone` int(30) DEFAULT NULL,
  `user_address` varchar(50) DEFAULT NULL,
  `user_status` char(1) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 내보낼 데이터가 선택되어 있지 않습니다.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
