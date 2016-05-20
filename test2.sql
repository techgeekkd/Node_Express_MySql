-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 29, 2015 at 03:53 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `test`
--

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE IF NOT EXISTS `department` (
  `Dept_Id` int(4) NOT NULL AUTO_INCREMENT,
  `Dept_Name` varchar(30) NOT NULL,
  PRIMARY KEY (`Dept_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`Dept_Id`, `Dept_Name`) VALUES
(1, 'SAP'),
(2, 'JAVA'),
(3, '.NET'),
(4, 'Mainframe'),
(5, 'Mobile');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE IF NOT EXISTS `employee` (
  `Emp_Id` int(6) NOT NULL AUTO_INCREMENT,
  `Emp_Name` varchar(30) NOT NULL,
  `Role_Id` int(4) NOT NULL,
  `Dept_Id` int(4) NOT NULL,
  `DoJ` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Emp_Id`),
  KEY `Dept_Id` (`Dept_Id`),
  KEY `Role_Id` (`Role_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`Emp_Id`, `Emp_Name`, `Role_Id`, `Dept_Id`, `DoJ`) VALUES
(1, 'Kd', 4, 4, '2015-11-29 12:33:15'),
(2, 'Rachit', 4, 1, '2015-11-29 12:39:12'),
(3, 'Agnivesh', 5, 2, '2015-11-29 12:39:12'),
(4, 'Harshit', 2, 5, '2015-11-29 13:23:57'),
(5, 'On Demand', 1, 4, '2015-11-29 13:26:28'),
(6, 'Testing Role', 1, 4, '2015-11-29 14:31:30'),
(7, 'Another Employee', 1, 4, '2015-11-29 14:31:39');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE IF NOT EXISTS `role` (
  `Role_Id` int(4) NOT NULL AUTO_INCREMENT,
  `Role_Name` varchar(30) NOT NULL,
  PRIMARY KEY (`Role_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`Role_Id`, `Role_Name`) VALUES
(1, 'Associate'),
(2, 'Senior Associate'),
(3, 'Consultant'),
(4, 'Lead Consultant'),
(5, 'Senior Consultant');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `emp_dept_mapping` FOREIGN KEY (`Dept_Id`) REFERENCES `department` (`Dept_Id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `emp_role_mapping` FOREIGN KEY (`Role_Id`) REFERENCES `role` (`Role_Id`) ON DELETE NO ACTION ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
