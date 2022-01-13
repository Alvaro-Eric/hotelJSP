-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 13, 2022 at 07:09 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `internhip`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `id` bigint(20) NOT NULL,
  `endDate` varchar(255) DEFAULT NULL,
  `startDate` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `customerid` varchar(255) DEFAULT NULL,
  `roomid` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customerid` varchar(255) NOT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `customerCategory` int(11) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customerid`, `contact`, `customerCategory`, `firstname`, `lastname`) VALUES
('CO1', '0785047581', 0, 'Alvaro', 'Eric'),
('CO2', '0782317775', 1, 'Ariwabo', 'Arnauld');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` bigint(20) NOT NULL,
  `date` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `date`, `email`, `password`, `phone`, `username`) VALUES
(1, '1999-04-07', 'alvaroeric71@gmail.com', 'alvaro12', '0785047581', 'Alvaro'),
(2, '2000-02-29', 'alvaro@gmail.com', 'ERICK12@', '0785437581', 'Eric'),
(3, '1997-06-29', 'james@gmail.com', '123456', '0788545626', 'James'),
(4, '1997-04-30', 'hakimu14@gmail.com', '789456', '0785461233', 'Kalisa '),
(5, '1999-06-30', 'armelabizera@gmail.com', '123456', '0785412369', 'Armel'),
(6, '2004-04-30', 'abdmuv@gmail.com', '123456', '0785412369', 'Armand');

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `roomid` varchar(255) NOT NULL,
  `available` bit(1) NOT NULL,
  `beds` int(11) NOT NULL,
  `capacity` varchar(255) DEFAULT NULL,
  `price` bigint(20) NOT NULL,
  `status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`roomid`, `available`, `beds`, `capacity`, `price`, `status`) VALUES
('Room1', b'0', 1, 'ONE_BEDRM', 10000, 'AVAILABLE');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id` int(11) NOT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `telphone` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `address`, `name`, `telphone`) VALUES
(1, 'kanombe', 'Alvaro', '0785047851'),
(2, 'kanombe', 'Armand', '0788811065'),
(3, 'kanombe', 'Armel', '0785283963'),
(4, 'kanombe', 'Amahoro', '0788811065'),
(5, 'kabeza', 'Ines', '0788645039'),
(6, 'kanombe', 'Abizera', '0785283963'),
(7, 'kanombe', 'Ariwabo', '0783777188'),
(8, 'kanombe', 'aaa', '0783777188'),
(9, 'Kacyiru', 'Alice', '078899999');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_bhd2pwkqxrykgjwr3c12i59bg` (`customerid`),
  ADD KEY `FK_s120qk77bg9npo8tlv3aa42r9` (`roomid`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customerid`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`roomid`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `FK_bhd2pwkqxrykgjwr3c12i59bg` FOREIGN KEY (`customerid`) REFERENCES `customer` (`customerid`),
  ADD CONSTRAINT `FK_s120qk77bg9npo8tlv3aa42r9` FOREIGN KEY (`roomid`) REFERENCES `room` (`roomid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
