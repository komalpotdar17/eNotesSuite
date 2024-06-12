-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 15, 2022 at 01:16 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `enotesjsp`
--

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE `notes` (
  `id` int(5) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` varchar(350) DEFAULT NULL,
  `emailid` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `notes`
--

INSERT INTO `notes` (`id`, `title`, `content`, `emailid`, `creationDate`, `updationDate`) VALUES
(2, 'What is JavaScript', 'JavaScript is the Programming Language for the Web.', 'abhi@gmail.com', '2022-03-15 08:23:57', '2022-03-15 08:54:35'),
(3, 'abc', 'hjshsdhag', 'mohit@gmail.com', '2022-03-15 09:09:25', NULL),
(4, 'Tomorrow Working Time', '10 Am to 6Pm', 'abhi@gmail.com', '2022-03-15 10:45:54', '2022-03-15 11:49:36'),
(5, 'Abhishek Birthday Date', '31 March 2022', 'sachin@gmail.com', '2022-03-15 12:10:06', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `userdtls`
--

CREATE TABLE `userdtls` (
  `id` int(11) NOT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `about` varchar(255) DEFAULT NULL,
  `ContactNo` varchar(15) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `RegDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `userdtls`
--

INSERT INTO `userdtls` (`id`, `fullName`, `about`, `ContactNo`, `email`, `password`, `role`, `RegDate`) VALUES
(1, 'Abhishek Pandey', 'Software Developer', '9876540000', 'abhi@gmail.com', '123', 'ROLE_USER', '2022-03-15 06:28:20'),
(3, 'Mohit Kumar', 'UI Designer', '7845120010', 'mohit@gmail.com', '1234', 'ROLE_USER', '2022-03-15 09:07:58'),
(4, 'Sachin Kumar', 'I am a software developer', '9200137456', 'sachin@gmail.com', 'sachin', 'ROLE_USER', '2022-03-15 12:03:40');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userdtls`
--
ALTER TABLE `userdtls`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `notes`
--
ALTER TABLE `notes`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `userdtls`
--
ALTER TABLE `userdtls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
