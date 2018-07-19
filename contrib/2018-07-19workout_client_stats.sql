-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 19, 2018 at 09:01 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `smpmpro`
--

-- --------------------------------------------------------

--
-- Table structure for table `workout_client_stats`
--

CREATE TABLE `workout_client_stats` (
  `id` int(11) NOT NULL,
  `type` varchar(20) NOT NULL,
  `client_id` int(11) NOT NULL,
  `weight` varchar(100) DEFAULT NULL,
  `body_fat` varchar(255) DEFAULT NULL,
  `waist` varchar(100) DEFAULT NULL,
  `chest` varchar(100) DEFAULT NULL,
  `arms` varchar(100) DEFAULT NULL,
  `forearms` varchar(100) DEFAULT NULL,
  `shoulders` varchar(100) DEFAULT NULL,
  `hips` varchar(100) DEFAULT NULL,
  `thighs` varchar(100) DEFAULT NULL,
  `calves` varchar(100) DEFAULT NULL,
  `neck` varchar(100) DEFAULT NULL,
  `height` varchar(100) DEFAULT NULL,
  `updated_by` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `target_date` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `workout_client_stats`
--

INSERT INTO `workout_client_stats` (`id`, `type`, `client_id`, `weight`, `body_fat`, `waist`, `chest`, `arms`, `forearms`, `shoulders`, `hips`, `thighs`, `calves`, `neck`, `height`, `updated_by`, `created_by`, `target_date`, `created_at`, `updated_at`) VALUES
(8, 'start', 83, '1', '1', '', 'd', '', '', '', 't', '', '', 'w', '1', 82, 82, NULL, '2018-07-18 22:07:58', '2018-07-18 23:07:37'),
(9, 'goal', 83, '1', '1', '', '', 'd', 'e', '', 't', '', '', 'w', '2', 82, 82, NULL, '2018-07-18 22:07:37', '2018-07-18 23:07:37'),
(10, 'result', 83, '1', '1', '', '', '', '', '', '', '', '', '', '', 82, 82, '2018-07-17 22:07:06', '2018-07-18 22:07:06', '2018-07-18 22:07:18'),
(11, 'result', 83, '1', '1', '', 'ff', '', '', 'a', 't', '', 'w', '', '3', 82, 82, '2018-07-18 22:07:31', '2018-07-18 22:07:31', '2018-07-18 23:07:37');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `workout_client_stats`
--
ALTER TABLE `workout_client_stats`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `workout_client_stats`
--
ALTER TABLE `workout_client_stats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
