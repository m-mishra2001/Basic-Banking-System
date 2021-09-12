-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 12, 2021 at 11:06 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.3.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `basicbankingsystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `AccountNo` int(11) NOT NULL,
  `Name` varchar(500) NOT NULL,
  `Email` varchar(500) DEFAULT NULL,
  `Balance` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`AccountNo`, `Name`, `Email`, `Balance`) VALUES
(23456, 'Muski', 'student5454@gmail.com', 5000),
(45679, 'simmi', 'fgcf@gmail.com', 448189),
(2346536, 'Shivani Dube', 'shivani@gmail.com', 5000),
(4087945, 'akshat', 'sharmaakshat@gmail.com', 4000);

-- --------------------------------------------------------

--
-- Table structure for table `transactionhistory`
--

CREATE TABLE `transactionhistory` (
  `TransactionId` int(11) NOT NULL,
  `Sender's Account` int(11) DEFAULT NULL,
  `Receiver's Account` int(11) DEFAULT NULL,
  `Amount` int(11) DEFAULT NULL,
  `Date` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transactionhistory`
--

INSERT INTO `transactionhistory` (`TransactionId`, `Sender's Account`, `Receiver's Account`, `Amount`, `Date`) VALUES
(4, 23456, 4087945, 1000, '2021/09/10 23:25:25'),
(5, 45679, 23456, 1000, '2021/09/10 23:52:41'),
(6, 45679, 23456, 1000, '2021/09/11 09:56:13'),
(7, 2346536, 23456, 1000, '2021/09/11 10:12:54'),
(8, 23456, 2346536, 1000, '2021/09/11 15:32:59');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`AccountNo`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indexes for table `transactionhistory`
--
ALTER TABLE `transactionhistory`
  ADD PRIMARY KEY (`TransactionId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
