-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Vært: 127.0.0.1:3306
-- Genereringstid: 28. 08 2024 kl. 12:57:55
-- Serverversion: 5.7.36
-- PHP-version: 8.2.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sportseventsdb`
--

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `event-team-con`
--

DROP TABLE IF EXISTS `event-team-con`;
CREATE TABLE IF NOT EXISTS `event-team-con` (
  `evtecId` int(11) NOT NULL AUTO_INCREMENT,
  `evtecEvenId` int(11) DEFAULT NULL,
  `evtecTeamId` int(11) DEFAULT NULL,
  PRIMARY KEY (`evtecId`),
  KEY `evteEvenId` (`evtecEvenId`),
  KEY `evteTeamId` (`evtecTeamId`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci;

--
-- Data dump for tabellen `event-team-con`
--

INSERT INTO `event-team-con` (`evtecId`, `evtecEvenId`, `evtecTeamId`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 2),
(4, 2, 3),
(5, 3, 4),
(6, 3, 1),
(7, 4, 5),
(8, 4, 3),
(9, 1, 6),
(10, 2, 7),
(11, 3, 8),
(12, 4, 9),
(13, 4, 6),
(14, 3, 7);

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `events`
--

DROP TABLE IF EXISTS `events`;
CREATE TABLE IF NOT EXISTS `events` (
  `evenId` int(11) NOT NULL AUTO_INCREMENT,
  `evenName` varchar(100) COLLATE utf8_danish_ci NOT NULL,
  `evenDateTime` datetime DEFAULT NULL,
  `evenLocation` varchar(100) COLLATE utf8_danish_ci DEFAULT NULL,
  `evenDescription` text COLLATE utf8_danish_ci,
  PRIMARY KEY (`evenId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci;

--
-- Data dump for tabellen `events`
--

INSERT INTO `events` (`evenId`, `evenName`, `evenDateTime`, `evenLocation`, `evenDescription`) VALUES
(1, 'Summer Championship', '2024-07-10 15:30:00', 'Parken Stadium', 'A major summer event featuring top teams.'),
(2, 'Winter Classic', '2024-12-15 18:00:00', 'Aarhus Arena', 'An exciting winter event with intense competition.'),
(3, 'Spring Tournament', '2024-04-20 14:00:00', 'Odense Stadium', 'A competitive spring tournament featuring upcoming teams.'),
(4, 'Autumn Cup', '2024-10-05 16:00:00', 'Copenhagen Arena', 'An annual event marking the end of the sports season.');

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `teams`
--

DROP TABLE IF EXISTS `teams`;
CREATE TABLE IF NOT EXISTS `teams` (
  `teamId` int(11) NOT NULL AUTO_INCREMENT,
  `teamName` varchar(100) COLLATE utf8_danish_ci NOT NULL,
  `teamCity` varchar(100) COLLATE utf8_danish_ci DEFAULT NULL,
  `teamCoachName` varchar(100) COLLATE utf8_danish_ci DEFAULT NULL,
  `teamCoachEmail` varchar(100) COLLATE utf8_danish_ci DEFAULT NULL,
  `teamCoachPhone` varchar(20) COLLATE utf8_danish_ci DEFAULT NULL,
  PRIMARY KEY (`teamId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci;

--
-- Data dump for tabellen `teams`
--

INSERT INTO `teams` (`teamId`, `teamName`, `teamCity`, `teamCoachName`, `teamCoachEmail`, `teamCoachPhone`) VALUES
(1, 'Lions', 'Copenhagen', 'John Doe', 'john.doe@example.com', '1234567890'),
(2, 'Tigers', 'Aarhus', 'Jane Smith', 'jane.smith@example.com', '2345678901'),
(3, 'Bears', 'Odense', 'Mike Johnson', 'mike.johnson@example.com', '3456789012'),
(4, 'Wolves', 'Aalborg', 'Sara Lee', 'sara.lee@example.com', '4567890123'),
(5, 'Hawks', 'Esbjerg', 'David Brown', 'david.brown@example.com', '5678901234'),
(6, 'Eagles', 'Herning', 'Michael Scott', 'michael.scott@example.com', '6789012345'),
(7, 'Sharks', 'Vejle', 'Angela Martin', 'angela.martin@example.com', '7890123456'),
(8, 'Panthers', 'Roskilde', 'Jim Halpert', 'jim.halpert@example.com', '8901234567'),
(9, 'Dragons', 'Horsens', 'Pam Beesly', 'pam.beesly@example.com', '9012345678');

--
-- Begrænsninger for dumpede tabeller
--

--
-- Begrænsninger for tabel `event-team-con`
--
ALTER TABLE `event-team-con`
  ADD CONSTRAINT `event-team-con_ibfk_1` FOREIGN KEY (`evtecEvenId`) REFERENCES `events` (`evenId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `event-team-con_ibfk_2` FOREIGN KEY (`evtecTeamId`) REFERENCES `teams` (`teamId`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
