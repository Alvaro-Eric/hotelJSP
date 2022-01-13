-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 26, 2021 at 07:58 AM
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

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`id`, `endDate`, `startDate`, `status`, `customerid`, `roomid`) VALUES
(1, '2021-12-24', '2021-12-22', NULL, 'CO1', 'Room1'),
(2, '2021-12-25', '2021-12-22', NULL, 'CO2', 'Room2'),
(3, '2021-12-24', '2021-12-22', NULL, 'CO1', 'Room3'),
(4, '2021-12-26', '2021-12-22', NULL, 'CO2', 'Room4'),
(5, '2021-12-24', '2021-12-23', NULL, 'CO3', 'Room5'),
(8, NULL, NULL, 'AVAILABLE', NULL, 'Room5');

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
('CO2', '0785043214', 2, 'Emmy', 'James'),
('CO3', '0785412698', 2, 'Ange', 'Uwase'),
('CO4', '078889556', 0, 'Eric', 'Abizera');

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
('Room1', b'0', 1, 'ONE_BEDRM', 10000, 'OCCUPIED'),
('Room2', b'0', 2, 'TWO_BEDRM', 20000, 'OCCUPIED'),
('Room3', b'0', 3, 'THREE_BEDRM', 30000, 'OCCUPIED'),
('Room4', b'0', 4, 'PENTHOUSE', 100000, 'OCCUPIED'),
('Room5', b'0', 3, 'THREE_BEDRM', 30000, 'AVAILABLE');

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
