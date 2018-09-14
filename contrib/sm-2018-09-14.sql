-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 13, 2018 at 11:05 PM
-- Server version: 5.6.40
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ampluswe_wp2`
--

-- --------------------------------------------------------

--
-- Table structure for table `workout_activity_logs`
--

CREATE TABLE `workout_activity_logs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `log_type` varchar(255) NOT NULL,
  `log_description` text NOT NULL,
  `gym_id` int(11) DEFAULT NULL,
  `trainer_id` int(11) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `workout_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `workout_activity_logs`
--

INSERT INTO `workout_activity_logs` (`id`, `user_id`, `log_type`, `log_description`, `gym_id`, `trainer_id`, `client_id`, `created_at`, `workout_id`) VALUES
(15, 70, 'GYM_UPDATE_PROGRAM', 'jabsgym updated a program (Upper body).', 70, NULL, NULL, '2018-07-30 12:07:09', NULL),
(16, 70, 'GYM_UPDATE_NOTE', 'jabsgym updated the program (Lower body) note -This program is not for clients with heart problems..', 70, NULL, NULL, '2018-07-31 09:07:54', NULL),
(17, 70, 'GYM_UPDATE_PROGRAM', 'jabsgym updated a program (Lower body).', 70, NULL, NULL, '2018-07-31 09:07:04', NULL),
(18, 76, 'TRAINER_UPDATE_PROGRAM', 'trainer001 updated a program (Upper body).', NULL, NULL, NULL, '2018-07-31 11:07:21', NULL),
(19, 76, 'TRAINER_UPDATE_PROGRAM', 'trainer001 updated a program (first).', NULL, NULL, NULL, '2018-07-31 11:07:17', NULL),
(20, 76, 'TRAINER_UPDATE_PROGRAM', 'trainer001 updated a program (Upper body).', NULL, NULL, NULL, '2018-07-31 11:07:43', NULL),
(21, 76, 'TRAINER_UPDATE_PROGRAM', 'trainer001 updated a program (Upper body).', NULL, NULL, NULL, '2018-07-31 11:07:41', NULL),
(22, 76, 'TRAINER_UPDATE_PROGRAM', 'trainer001 updated a program (Upper body).', NULL, NULL, NULL, '2018-07-31 12:07:13', NULL),
(23, 76, 'TRAINER_UPDATE_PROGRAM', 'trainer001 updated a program (Upper body).', NULL, NULL, NULL, '2018-07-31 12:07:27', NULL),
(24, 76, 'TRAINER_UPDATE_PROGRAM', 'trainer001 updated a program (first).', NULL, NULL, NULL, '2018-07-31 12:07:08', NULL),
(25, 70, 'GYM_UPDATE_NOTE', 'jabsgym updated the program (Lower body) note -This program is not for clients with heart and lung problems..', 70, NULL, NULL, '2018-07-31 14:07:49', NULL),
(26, 70, 'GYM_UPDATE_PROGRAM', 'jabsgym updated a program (Lower body).', 70, NULL, NULL, '2018-07-31 14:07:44', NULL),
(27, 76, 'TRAINER_CREATE_PROGRAM', 'trainer001 created a program (weight loss).', NULL, NULL, NULL, '2018-08-02 03:08:24', NULL),
(28, 76, 'TRAINER_CREATE_PROGRAM', 'trainer001 created a program (p1).', NULL, NULL, NULL, '2018-08-03 07:08:51', NULL),
(29, 76, 'TRAINER_DELETE_PROGRAM', 'trainer001 deleted a program (Copy 1533281429 p1).', NULL, NULL, NULL, '2018-08-03 07:08:23', NULL),
(30, 76, 'TRAINER_DELETE_PROGRAM', 'trainer001 deleted a program (Copy 1533284932 p1-edited).', NULL, NULL, NULL, '2018-08-03 08:08:16', NULL),
(31, 70, 'GYM_CREATE_PROGRAM', 'jabsgym created a program (p2).', 70, NULL, NULL, '2018-08-03 09:08:47', NULL),
(32, 70, 'GYM_DELETE_PROGRAM', 'jabsgym deleted a program (Copy 1533287223 p1-edited).', 70, NULL, NULL, '2018-08-03 09:08:09', NULL),
(33, 76, 'TRAINER_CREATE_PROGRAM', 'trainer001 created a program (p3).', NULL, NULL, NULL, '2018-08-07 10:08:32', NULL),
(34, 76, 'TRAINER_CREATE_PROGRAM', 'trainer001 created a program (p3).', NULL, NULL, NULL, '2018-08-07 10:08:42', NULL),
(35, 76, 'TRAINER_DELETE_PROGRAM', 'trainer001 deleted a program (p3).', NULL, NULL, NULL, '2018-08-07 10:08:30', NULL),
(36, 70, 'GYM_DELETE_PROGRAM', 'jabsgym deleted a program (p3).', 70, NULL, NULL, '2018-08-07 10:08:44', NULL),
(37, 76, 'TRAINER_CREATE_PROGRAM', 'trainer001 created a program (p3).', NULL, NULL, NULL, '2018-08-07 10:08:01', NULL),
(38, 76, 'TRAINER_CREATE_PROGRAM', 'trainer001 created a program (p4).', NULL, NULL, NULL, '2018-08-07 11:08:36', NULL),
(39, 70, 'GYM_CREATE_PROGRAM', 'jabsgym created a program (P5).', 70, NULL, NULL, '2018-08-07 14:08:30', NULL),
(40, 40, 'TRAINER_CREATE_PROGRAM', 'erickminor created a program (Program 1).', NULL, 40, NULL, '2018-08-07 19:08:41', NULL),
(41, 40, 'TRAINER_CREATE_PROGRAM', 'erickminor created a program (Program 1).', NULL, 40, NULL, '2018-08-07 19:08:48', NULL),
(42, 40, 'TRAINER_CREATE_PROGRAM', 'erickminor created a program (Program 1).', NULL, 40, NULL, '2018-08-07 19:08:03', NULL),
(43, 40, 'TRAINER_CREATE_PROGRAM', 'erickminor created a program (Test).', NULL, 40, NULL, '2018-08-07 19:08:44', NULL),
(44, 101, 'GYM_CREATE_PROGRAM', 'em-gym created a program (Program 1).', 101, NULL, NULL, '2018-08-07 19:08:10', NULL),
(45, 70, 'GYM_UPDATE_PROGRAM', 'jabsgym updated a program (Copy Copy P5).', 70, NULL, NULL, '2018-08-08 12:08:01', NULL),
(46, 70, 'GYM_UPDATE_PROGRAM', 'jabsgym updated a program (Copy Copy P5).', 70, NULL, NULL, '2018-08-08 12:08:18', NULL),
(47, 76, 'TRAINER_UPDATE_PROGRAM', 'trainer001 updated a program (Copied Several Times).', NULL, 76, NULL, '2018-08-10 11:08:08', NULL),
(48, 76, 'TRAINER_UPDATE_PROGRAM', 'trainer001 updated a program (P5).', NULL, 76, NULL, '2018-08-13 05:08:39', NULL),
(49, 76, 'TRAINER_UPDATE_PROGRAM', 'trainer001 updated a program (Copied Several Times).', NULL, 76, NULL, '2018-08-13 09:08:10', NULL),
(50, 76, 'TRAINER_UPDATE_PROGRAM', 'trainer001 updated a program (Copied Several Times).', NULL, 76, NULL, '2018-08-13 09:08:27', NULL),
(51, 76, 'TRAINER_UPDATE_PROGRAM', 'trainer001 updated a program (Copied Several Times).', NULL, 76, NULL, '2018-08-13 09:08:08', NULL),
(52, 76, 'TRAINER_UPDATE_PROGRAM', 'trainer001 updated a program (Copied Several Times).', NULL, 76, NULL, '2018-08-13 09:08:58', NULL),
(53, 76, 'TRAINER_UPDATE_PROGRAM', 'trainer001 updated a program (p4).', NULL, 76, NULL, '2018-08-13 09:08:49', NULL),
(54, 101, 'GYM_UPDATE_PROGRAM', 'em-gym updated a program (Copy Program 1).', 101, NULL, NULL, '2018-08-13 11:08:19', NULL),
(55, 101, 'GYM_CREATE_PROGRAM', 'em-gym created a program (Metabolic Loading).', 101, NULL, NULL, '2018-08-13 15:08:48', NULL),
(56, 101, 'GYM_UPDATE_PROGRAM', 'em-gym updated a program (Metabolic Loading).', 101, NULL, NULL, '2018-08-13 15:08:49', NULL),
(57, 101, 'GYM_UPDATE_PROGRAM', 'em-gym updated a program (Metabolic Loading).', 101, NULL, NULL, '2018-08-13 15:08:27', NULL),
(58, 76, 'TRAINER_UPDATE_NOTE', 'trainer001 updated the program (p2) note -MWF.', NULL, 76, NULL, '2018-08-14 07:08:14', NULL),
(59, 76, 'TRAINER_UPDATE_NOTE', 'trainer001 updated the program (p2) note -Only for MWF..', NULL, 76, NULL, '2018-08-14 07:08:05', NULL),
(60, 76, 'TRAINER_UPDATE_NOTE', 'trainer001 updated the program (weight loss) note -For weight loss.', NULL, 76, NULL, '2018-08-14 07:08:46', NULL),
(61, 76, 'TRAINER_UPDATE_PROGRAM', 'trainer001 updated a program (weight loss).', NULL, 76, NULL, '2018-08-14 07:08:56', NULL),
(62, 76, 'TRAINER_UPDATE_NOTE', 'trainer001 updated the program (p2) note -Only for MWF only..', NULL, 76, NULL, '2018-08-14 07:08:26', NULL),
(63, 76, 'TRAINER_UPDATE_PROGRAM', 'trainer001 updated a program (p2).', NULL, 76, NULL, '2018-08-14 07:08:34', NULL),
(64, 76, 'TRAINER_CREATE_PROGRAM', 'trainer001 created a program (Test).', NULL, 76, NULL, '2018-08-14 09:08:59', NULL),
(65, 76, 'TRAINER_UPDATE_PROGRAM', 'trainer001 updated a program (Upper body).', NULL, 76, NULL, '2018-08-14 09:08:02', NULL),
(66, 77, 'CLIENT_MISSED_WORKOUT', 'client001 missed the workout w13.', NULL, NULL, 77, '2018-08-14 09:08:00', 82),
(67, 77, 'CLIENT_MISSED_WORKOUT', 'client001 missed the workout w2.', NULL, NULL, 77, '2018-08-14 09:08:00', 83),
(68, 77, 'CLIENT_MISSED_WORKOUT', 'client001 missed the workout w3.', NULL, NULL, 77, '2018-08-14 09:08:01', 84),
(69, 77, 'CLIENT_MISSED_WORKOUT', 'client001 missed the workout w1.', NULL, NULL, 77, '2018-08-14 09:08:02', 99),
(70, 77, 'CLIENT_MISSED_WORKOUT', 'client001 missed the workout w1.', NULL, NULL, 77, '2018-08-14 09:08:03', 101),
(71, 77, 'CLIENT_MISSED_WORKOUT', 'client001 missed the workout W1.', NULL, NULL, 77, '2018-08-14 09:08:03', 103),
(72, 87, 'CLIENT_UPDATE_PROGRESS', 'testaddclient updated his / her personal goals.', NULL, NULL, 87, '2018-08-14 09:08:00', NULL),
(73, 87, 'CLIENT_UPDATE_PROGRESS', 'testaddclient updated his / her personal goals.', NULL, NULL, 87, '2018-08-14 09:08:33', NULL),
(74, 95, 'CLIENT_MISSED_WORKOUT', 'client111 missed the workout neck.', NULL, NULL, 95, '2018-08-14 10:08:51', 79),
(75, 76, 'TRAINER_UPDATE_PROGRAM', 'trainer001 updated a program (Upper body).', NULL, 76, NULL, '2018-08-14 12:08:15', NULL),
(76, 76, 'TRAINER_UPDATE_PROGRAM', 'trainer001 updated a program (Test).', NULL, 76, NULL, '2018-08-14 12:08:05', NULL),
(77, 76, 'TRAINER_UPDATE_PROGRAM', 'trainer001 updated a program (Test).', NULL, 76, NULL, '2018-08-14 12:08:12', NULL),
(78, 76, 'TRAINER_UPDATE_PROGRAM', 'trainer001 updated a program (Test).', NULL, 76, NULL, '2018-08-14 12:08:20', NULL),
(79, 76, 'TRAINER_UPDATE_PROGRAM', 'trainer001 updated a program (Test).', NULL, 76, NULL, '2018-08-14 12:08:44', NULL),
(80, 76, 'TRAINER_UPDATE_PROGRAM', 'trainer001 updated a program (Test).', NULL, 76, NULL, '2018-08-14 12:08:48', NULL),
(81, 76, 'TRAINER_UPDATE_PROGRAM', 'trainer001 updated a program (Test).', NULL, 76, NULL, '2018-08-14 12:08:58', NULL),
(82, 76, 'TRAINER_UPDATE_PROGRAM', 'trainer001 updated a program (Test).', NULL, 76, NULL, '2018-08-14 12:08:04', NULL),
(83, 87, 'CLIENT_UPDATE_PROGRESS', 'testaddclient updated his / her personal goals.', NULL, NULL, 87, '2018-08-14 12:08:24', NULL),
(84, 76, 'TRAINER_UPDATE_PROGRAM', 'trainer001 updated a program (weight loss).', NULL, 76, NULL, '2018-08-14 12:08:01', NULL),
(85, 70, 'GYM_UPDATE_PROGRAM', 'jabsgym updated a program (p2).', 70, NULL, NULL, '2018-08-14 12:08:33', NULL),
(86, 95, 'CLIENT_UPLOAD_DOCUMENT', 'client111 uploaded health document photo_1534250557.jpg.', NULL, NULL, 95, '2018-08-14 12:08:37', NULL),
(87, 95, 'CLIENT_UPDATE_PROGRESS', 'client111 updated his / her personal goals.', NULL, NULL, 95, '2018-08-14 12:08:21', NULL),
(88, 95, 'CLIENT_UPDATE_PROGRESS', 'client111 updated his / her personal goals.', NULL, NULL, 95, '2018-08-14 12:08:37', NULL),
(89, 95, 'CLIENT_UPDATE_PROGRESS', 'client111 updated his / her personal goals.', NULL, NULL, 95, '2018-08-14 12:08:52', NULL),
(90, 95, 'CLIENT_UPDATE_PROGRESS', 'client111 updated his / her personal goals.', NULL, NULL, 95, '2018-08-14 13:08:04', NULL),
(91, 95, 'CLIENT_UPDATE_PROGRESS', 'client111 updated his / her personal goals.', NULL, NULL, 95, '2018-08-14 13:08:54', NULL),
(92, 77, 'CLIENT_UPDATE_PROGRESS', 'client001 updated his / her personal goals.', NULL, NULL, 77, '2018-08-14 13:08:04', NULL),
(93, 77, 'CLIENT_UPDATE_PROGRESS', 'client001 updated his / her personal goals.', NULL, NULL, 77, '2018-08-14 13:08:30', NULL),
(94, 95, 'CLIENT_UPDATE_PROGRESS', 'client111 updated his / her personal goals.', NULL, NULL, 95, '2018-08-14 14:08:05', NULL),
(95, 102, 'TRAINER_UPDATE_PROGRAM', 'em-trainer updated a program (Metabolic Loading).', NULL, 102, NULL, '2018-08-14 15:08:23', NULL),
(96, 102, 'TRAINER_CREATE_PROGRAM', 'em-trainer created a program (Program 1).', NULL, 102, NULL, '2018-08-14 15:08:07', NULL),
(97, 102, 'TRAINER_UPDATE_PROGRAM', 'em-trainer updated a program (Super Duper program 1).', NULL, 102, NULL, '2018-08-14 15:08:22', NULL),
(98, 102, 'TRAINER_UPDATE_PROGRAM', 'em-trainer updated a program (Super Duper program 1).', NULL, 102, NULL, '2018-08-14 15:08:09', NULL),
(99, 102, 'TRAINER_CREATE_PROGRAM', 'em-trainer created a program (Test2).', NULL, 102, NULL, '2018-08-14 15:08:31', NULL),
(100, 102, 'TRAINER_DELETE_PROGRAM', 'em-trainer deleted a program (Test2).', NULL, 102, NULL, '2018-08-14 19:08:58', NULL),
(101, 102, 'TRAINER_DELETE_PROGRAM', 'em-trainer deleted a program (Super Duper program 1).', NULL, 102, NULL, '2018-08-14 19:08:03', NULL),
(102, 76, 'SEND_MESSAGE', 'trainer001 send message to jabsgym', NULL, 76, NULL, '2018-08-15 04:08:20', NULL),
(103, 76, 'TRAINER_UPDATE_PROGRAM', 'trainer001 updated a program (P5).', NULL, 76, NULL, '2018-08-15 07:08:22', NULL),
(104, 76, 'TRAINER_UPDATE_PROGRAM', 'trainer001 updated a program (P5).', NULL, 76, NULL, '2018-08-15 07:08:03', NULL),
(105, 76, 'TRAINER_UPDATE_PROGRAM', 'trainer001 updated a program (P5).', NULL, 76, NULL, '2018-08-15 08:08:20', NULL),
(106, 76, 'TRAINER_CREATE_PROGRAM', 'trainer001 created a program (p6).', NULL, 76, NULL, '2018-08-15 08:08:52', NULL),
(107, 76, 'TRAINER_UPDATE_PROGRAM', 'trainer001 updated a program (p6).', NULL, 76, NULL, '2018-08-15 08:08:10', NULL),
(108, 77, 'CLIENT_MISSED_WORKOUT', 'client001 missed the workout Test.', NULL, NULL, 77, '2018-08-15 09:08:53', 113),
(109, 77, 'CLIENT_MISSED_WORKOUT', 'client001 missed the workout upper body.', NULL, NULL, 77, '2018-08-15 09:08:53', 80),
(110, 77, 'CLIENT_MISSED_WORKOUT', 'client001 missed the workout .', NULL, NULL, 77, '2018-08-15 09:08:53', 81),
(111, 102, 'TRAINER_CREATE_PROGRAM', 'em-trainer created a program (New).', NULL, 102, NULL, '2018-08-15 21:08:29', NULL),
(112, 102, 'TRAINER_UPDATE_PROGRAM', 'em-trainer updated a program (Metabolic Loading).', NULL, 102, NULL, '2018-08-15 21:08:34', NULL),
(113, 102, 'TRAINER_UPDATE_PROGRAM', 'em-trainer updated a program (Metabolic Loading).', NULL, 102, NULL, '2018-08-15 21:08:54', NULL),
(114, 102, 'TRAINER_UPDATE_PROGRAM', 'em-trainer updated a program (New).', NULL, 102, NULL, '2018-08-15 21:08:49', NULL),
(115, 78, 'GYM_CREATE_PROGRAM', 'john created a program (te).', 78, NULL, NULL, '2018-08-16 10:08:43', NULL),
(116, 102, 'TRAINER_UPDATE_PROGRAM', 'em-trainer updated a program (Metabolic Loading).', NULL, 102, NULL, '2018-08-16 21:08:52', NULL),
(117, 102, 'TRAINER_UPDATE_PROGRAM', 'em-trainer updated a program (Metabolic Loading).', NULL, 102, NULL, '2018-08-16 21:08:23', NULL),
(118, 77, 'CLIENT_MISSED_WORKOUT', 'client001 missed the workout p6w1.', NULL, NULL, 77, '2018-08-17 15:08:10', 117),
(119, 77, 'CLIENT_UPLOAD_DOCUMENT', 'client001 uploaded health document photo_1534518486.jpg.', NULL, NULL, 77, '2018-08-17 15:08:06', NULL),
(120, 77, 'CLIENT_UPLOAD_DOCUMENT', 'client001 uploaded health document photo_1534518947.jpg.', NULL, NULL, 77, '2018-08-17 15:08:47', NULL),
(121, 102, 'TRAINER_UPDATE_PROGRAM', 'em-trainer updated a program (Tier Training 1).', NULL, 102, NULL, '2018-08-21 13:08:35', NULL),
(122, 103, 'CLIENT_MISSED_WORKOUT', 'em-client missed the workout Workout name.', NULL, NULL, 103, '2018-08-21 13:08:28', 110),
(123, 103, 'CLIENT_MISSED_WORKOUT', 'em-client missed the workout Chest, Back.', NULL, NULL, 103, '2018-08-21 13:08:28', 118),
(124, 103, 'CLIENT_MISSED_WORKOUT', 'em-client missed the workout Circuit 2.', NULL, NULL, 103, '2018-08-21 13:08:28', 119),
(125, 76, 'TRAINER_UPDATE_PROGRAM', 'trainer001 updated a program (p6).', NULL, 76, NULL, '2018-08-23 20:08:51', NULL),
(126, 76, 'TRAINER_UPDATE_PROGRAM', 'trainer001 updated a program (p6).', NULL, 76, NULL, '2018-08-23 20:08:10', NULL),
(127, 76, 'TRAINER_UPDATE_PROGRAM', 'trainer001 updated a program (p6).', NULL, 76, NULL, '2018-08-28 18:08:40', NULL),
(128, 76, 'TRAINER_UPDATE_PROGRAM', 'trainer001 updated a program (p6).', NULL, 76, NULL, '2018-08-28 18:08:58', NULL),
(129, 101, 'GYM_UPDATE_PROGRAM', 'em-gym updated a program (Hypertrophy - basic).', 101, NULL, NULL, '2018-08-31 01:08:09', NULL),
(130, 102, 'TRAINER_DELETE_PROGRAM', 'em-trainer deleted a program (Program 1).', NULL, 102, NULL, '2018-09-01 22:09:24', NULL),
(131, 76, 'TRAINER_UPDATE_PROGRAM', 'trainer001 updated a program (p6).', NULL, 76, NULL, '2018-09-03 18:09:03', NULL),
(132, 76, 'TRAINER_UPDATE_PROGRAM', 'trainer001 updated a program (p6).', NULL, 76, NULL, '2018-09-03 18:09:57', NULL),
(133, 76, 'TRAINER_UPDATE_PROGRAM', 'trainer001 updated a program (p6).', NULL, 76, NULL, '2018-09-04 14:09:49', NULL),
(134, 76, 'TRAINER_CREATE_PROGRAM', 'trainer001 created a program (others).', NULL, 76, NULL, '2018-09-04 14:09:46', NULL),
(135, 76, 'TRAINER_DELETE_PROGRAM', 'trainer001 deleted a program (others).', NULL, 76, NULL, '2018-09-04 14:09:37', NULL),
(136, 76, 'TRAINER_CREATE_PROGRAM', 'trainer001 created a program (others).', NULL, 76, NULL, '2018-09-04 14:09:53', NULL),
(137, 76, 'TRAINER_UPDATE_PROGRAM', 'trainer001 updated a program (others).', NULL, 76, NULL, '2018-09-04 14:09:07', NULL),
(138, 76, 'TRAINER_UPDATE_PROGRAM', 'trainer001 updated a program (others).', NULL, 76, NULL, '2018-09-04 14:09:35', NULL),
(139, 76, 'TRAINER_CREATE_PROGRAM', 'trainer001 created a program (Test Program).', NULL, 76, NULL, '2018-09-04 21:09:14', NULL),
(140, 76, 'TRAINER_UPDATE_PROGRAM', 'trainer001 updated a program (Test Program).', NULL, 76, NULL, '2018-09-04 21:09:07', NULL),
(141, 76, 'TRAINER_UPDATE_PROGRAM', 'trainer001 updated a program (Test Program).', NULL, 76, NULL, '2018-09-04 21:09:00', NULL),
(142, 102, 'TRAINER_UPDATE_PROGRAM', 'em-trainer updated a program (Hypertrophy - basic).', NULL, 102, NULL, '2018-09-04 21:09:46', NULL),
(143, 102, 'TRAINER_UPDATE_PROGRAM', 'em-trainer updated a program (Hypertrophy - basic).', NULL, 102, NULL, '2018-09-04 21:09:13', NULL),
(144, 102, 'TRAINER_CREATE_PROGRAM', 'em-trainer created a program (Super Position).', NULL, 102, NULL, '2018-09-04 22:09:17', NULL),
(145, 76, 'TRAINER_UPDATE_PROGRAM', 'trainer001 updated a program (p6).', NULL, 76, NULL, '2018-09-06 16:09:51', NULL),
(146, 76, 'TRAINER_UPDATE_PROGRAM', 'trainer001 updated a program (p6).', NULL, 76, NULL, '2018-09-06 16:09:07', NULL),
(147, 76, 'TRAINER_UPDATE_PROGRAM', 'trainer001 updated a program (Test Program).', NULL, 76, NULL, '2018-09-06 16:09:51', NULL),
(148, 76, 'TRAINER_UPDATE_PROGRAM', 'trainer001 updated a program (Test Program).', NULL, 76, NULL, '2018-09-06 16:09:33', NULL),
(149, 76, 'TRAINER_UPDATE_PROGRAM', 'trainer001 updated a program (Test Program).', NULL, 76, NULL, '2018-09-06 16:09:43', NULL),
(150, 76, 'TRAINER_UPDATE_PROGRAM', 'trainer001 updated a program (Test Program).', NULL, 76, NULL, '2018-09-06 16:09:57', NULL),
(151, 102, 'TRAINER_CREATE_PROGRAM', 'em-trainer created a program (Name).', NULL, 102, NULL, '2018-09-06 21:09:11', NULL),
(152, 101, 'GYM_UPDATE_PROGRAM', 'em-gym updated a program (Tier Training 1).', 101, NULL, NULL, '2018-09-06 22:09:42', NULL),
(153, 4, 'TRAINER_CREATE_PROGRAM', 'trainer created a program (NM).', NULL, 4, NULL, '2018-09-07 01:09:41', NULL),
(154, 4, 'TRAINER_CREATE_PROGRAM', 'trainer created a program (PN).', NULL, 4, NULL, '2018-09-07 01:09:25', NULL),
(155, 104, 'CLIENT_MISSED_WORKOUT', 'em-client2 missed the workout Met Load 1.', NULL, NULL, 104, '2018-09-07 01:09:54', 112),
(156, 102, 'TRAINER_UPDATE_PROGRAM', 'em-trainer updated a program (Copy Hypertrophy - basic).', NULL, 102, NULL, '2018-09-07 02:09:55', NULL),
(157, 70, 'GYM_UPDATE_PROGRAM', 'jabsgym updated a program (Test Program).', 70, NULL, NULL, '2018-09-11 14:09:58', NULL),
(158, 70, 'GYM_UPDATE_PROGRAM', 'jabsgym updated a program (Test Program).', 70, NULL, NULL, '2018-09-11 14:09:29', NULL),
(159, 70, 'GYM_UPDATE_PROGRAM', 'jabsgym updated a program (Test Program).', 70, NULL, NULL, '2018-09-11 14:09:38', NULL),
(160, 76, 'TRAINER_CREATE_PROGRAM', 'trainer001 created a program (test p1).', NULL, 76, NULL, '2018-09-11 15:09:10', NULL),
(161, 76, 'TRAINER_UPDATE_PROGRAM', 'trainer001 updated a program (test p1).', NULL, 76, NULL, '2018-09-11 15:09:16', NULL),
(162, 76, 'TRAINER_UPDATE_PROGRAM', 'trainer001 updated a program (test p1).', NULL, 76, NULL, '2018-09-11 20:09:42', NULL),
(163, 76, 'TRAINER_UPDATE_PROGRAM', 'trainer001 updated a program (test p1).', NULL, 76, NULL, '2018-09-11 20:09:05', NULL),
(164, 102, 'TRAINER_UPDATE_PROGRAM', 'em-trainer updated a program (Copy Hypertrophy - basic).', NULL, 102, NULL, '2018-09-11 20:09:11', NULL),
(165, 76, 'TRAINER_DELETE_PROGRAM', 'trainer001 deleted a program (first).', NULL, 76, NULL, '2018-09-11 20:09:11', NULL),
(166, 76, 'TRAINER_DELETE_PROGRAM', 'trainer001 deleted a program (Upper body).', NULL, 76, NULL, '2018-09-11 20:09:18', NULL),
(167, 76, 'TRAINER_DELETE_PROGRAM', 'trainer001 deleted a program (Lower body).', NULL, 76, NULL, '2018-09-11 20:09:25', NULL),
(168, 76, 'TRAINER_DELETE_PROGRAM', 'trainer001 deleted a program (weight loss).', NULL, 76, NULL, '2018-09-11 20:09:41', NULL),
(169, 76, 'TRAINER_DELETE_PROGRAM', 'trainer001 deleted a program (p1-edited).', NULL, 76, NULL, '2018-09-11 20:09:47', NULL),
(170, 76, 'TRAINER_DELETE_PROGRAM', 'trainer001 deleted a program (p2).', NULL, 76, NULL, '2018-09-11 21:09:07', NULL),
(171, 76, 'TRAINER_DELETE_PROGRAM', 'trainer001 deleted a program (p3).', NULL, 76, NULL, '2018-09-11 21:09:14', NULL),
(172, 76, 'TRAINER_DELETE_PROGRAM', 'trainer001 deleted a program (p4).', NULL, 76, NULL, '2018-09-11 21:09:18', NULL),
(173, 76, 'TRAINER_DELETE_PROGRAM', 'trainer001 deleted a program (p4 copy).', NULL, 76, NULL, '2018-09-11 21:09:26', NULL),
(174, 76, 'TRAINER_DELETE_PROGRAM', 'trainer001 deleted a program (P5).', NULL, 76, NULL, '2018-09-11 21:09:30', NULL),
(175, 76, 'TRAINER_DELETE_PROGRAM', 'trainer001 deleted a program (Copy P5).', NULL, 76, NULL, '2018-09-11 21:09:37', NULL),
(176, 76, 'TRAINER_DELETE_PROGRAM', 'trainer001 deleted a program (Copied Several Times).', NULL, 76, NULL, '2018-09-11 21:09:42', NULL),
(177, 76, 'TRAINER_CREATE_PROGRAM', 'trainer001 created a program (pp1).', NULL, 76, NULL, '2018-09-11 21:09:03', NULL),
(178, 76, 'TRAINER_UPDATE_PROGRAM', 'trainer001 updated a program (pp1).', NULL, 76, NULL, '2018-09-11 21:09:10', NULL),
(179, 77, 'CLIENT_MISSED_WORKOUT', 'client001 missed the workout test p1w1.', NULL, NULL, 77, '2018-09-11 22:09:13', 134),
(180, 101, 'GYM_UPDATE_PROGRAM', 'em-gym updated a program (Super Position).', 101, NULL, NULL, '2018-09-12 17:09:19', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `workout_client_exercises_logs`
--

CREATE TABLE `workout_client_exercises_logs` (
  `id` int(11) NOT NULL,
  `exercise_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `day_id` int(11) NOT NULL,
  `workout_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `workout_client_exercises_logs`
--

INSERT INTO `workout_client_exercises_logs` (`id`, `exercise_id`, `client_id`, `day_id`, `workout_id`) VALUES
(2, 78, 3, 0, 11),
(7, 88, 3, 43, 13),
(8, 89, 3, 43, 13),
(9, 90, 20, 44, 14),
(10, 92, 27, 46, 15),
(11, 95, 25, 49, 17),
(12, 96, 25, 49, 17),
(13, 97, 25, 49, 17),
(17, 152, 43, 76, 20),
(24, 219, 103, 112, 50),
(25, 220, 103, 112, 50),
(26, 221, 103, 112, 50);

-- --------------------------------------------------------

--
-- Table structure for table `workout_client_exercise_assignments`
--

CREATE TABLE `workout_client_exercise_assignments` (
  `id` int(11) NOT NULL,
  `exercise_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `workout_client_exercise_assignments`
--

INSERT INTO `workout_client_exercise_assignments` (`id`, `exercise_id`, `client_id`) VALUES
(3, 55, 3),
(4, 56, 3),
(8, 58, 3),
(9, 58, 5),
(14, 59, 3),
(15, 59, 5),
(46, 62, 3),
(61, 64, 3),
(103, 57, 3),
(104, 57, 5),
(105, 60, 5),
(106, 61, 5),
(107, 60, 3),
(108, 61, 3),
(109, 63, 5),
(110, 65, 3),
(111, 66, 3),
(112, 65, 5),
(113, 66, 5),
(114, 67, 3),
(115, 72, 5),
(116, 73, 3),
(117, 74, 3),
(118, 75, 3),
(119, 75, 5),
(126, 78, 3),
(128, 79, 3),
(129, 77, 5),
(130, 80, 3),
(131, 81, 3),
(132, 82, 5),
(133, 83, 5),
(225, 84, 3),
(226, 86, 3),
(227, 85, 5),
(228, 87, 5),
(229, 85, 3),
(230, 87, 3),
(233, 88, 3),
(234, 89, 3),
(249, 90, 21),
(250, 90, 20),
(251, 91, 20),
(252, 91, 21),
(259, 92, 28),
(260, 92, 27),
(261, 94, 31),
(276, 95, 25),
(277, 96, 25),
(278, 97, 25),
(279, 103, 25),
(280, 104, 25),
(281, 105, 25),
(282, 106, 25),
(283, 107, 25),
(284, 108, 25),
(285, 109, 25),
(286, 110, 25),
(287, 111, 25),
(288, 112, 25),
(289, 117, 25),
(290, 117, 25),
(291, 119, 25),
(292, 119, 25),
(293, 121, 48),
(294, 121, 48),
(295, 123, 48),
(296, 123, 48),
(319, 131, 59),
(320, 132, 59),
(321, 133, 59),
(322, 135, 59),
(323, 135, 59),
(324, 137, 59),
(325, 138, 59),
(326, 138, 59),
(327, 138, 59),
(334, 141, 64),
(335, 142, 64),
(336, 143, 64),
(337, 144, 91),
(360, 115, 43),
(361, 116, 43),
(362, 149, 43),
(363, 152, 43),
(364, 153, 43),
(365, 102, 43),
(366, 145, 43),
(367, 146, 43),
(368, 147, 43),
(414, 148, 77),
(577, 169, 77),
(578, 170, 77),
(579, 171, 77),
(580, 172, 77),
(581, 169, 87),
(582, 170, 87),
(583, 171, 87),
(584, 172, 87),
(585, 173, 77),
(586, 174, 77),
(587, 173, 87),
(588, 174, 87),
(589, 177, 77),
(590, 178, 77),
(591, 180, 77),
(592, 177, 87),
(593, 178, 87),
(594, 180, 87),
(595, 190, 77),
(598, 192, 77),
(599, 194, 77),
(605, 198, 43),
(606, 199, 43),
(607, 200, 43),
(608, 201, 43),
(609, 202, 43),
(610, 203, 43),
(611, 204, 43),
(612, 205, 43),
(613, 206, 43),
(614, 207, 43),
(615, 208, 43),
(616, 206, 100),
(617, 207, 100),
(618, 208, 100),
(619, 209, 100),
(624, 210, 103),
(625, 211, 103),
(626, 212, 103),
(627, 213, 103),
(653, 195, 77),
(654, 196, 77),
(655, 197, 77),
(656, 218, 77),
(657, 191, 77),
(679, 150, 77),
(680, 151, 77),
(681, 158, 77),
(682, 150, 95),
(683, 151, 95),
(684, 158, 95),
(685, 159, 87),
(686, 159, 95),
(693, 223, 77),
(694, 161, 77),
(695, 162, 77),
(696, 163, 77),
(697, 164, 77),
(698, 165, 87),
(699, 166, 87),
(700, 167, 87),
(701, 167, 87),
(702, 165, 77),
(703, 166, 77),
(704, 167, 77),
(705, 167, 77),
(715, 226, 103),
(716, 227, 103),
(717, 228, 103),
(718, 229, 103),
(719, 230, 103),
(720, 231, 103),
(721, 232, 103),
(722, 233, 103),
(725, 193, 77),
(745, 219, 103),
(746, 220, 103),
(747, 221, 103),
(748, 222, 103),
(749, 219, 104),
(750, 220, 104),
(751, 221, 104),
(752, 222, 104),
(781, 249, 87),
(783, 249, 77),
(784, 249, 95),
(795, 214, 103),
(796, 215, 103),
(797, 216, 103),
(798, 217, 103),
(799, 214, 104),
(800, 215, 104),
(801, 216, 104),
(802, 217, 104),
(811, 236, 77),
(812, 236, 95),
(813, 244, 87),
(820, 250, 77),
(822, 265, 104),
(823, 237, 103),
(824, 238, 103),
(825, 239, 103),
(826, 242, 103),
(827, 237, 104),
(828, 238, 104),
(829, 239, 104),
(830, 242, 104),
(831, 240, 103),
(832, 266, 105),
(851, 264, 95),
(897, 273, 87),
(898, 274, 87),
(899, 275, 87),
(900, 276, 87),
(901, 277, 87),
(902, 273, 95),
(903, 274, 95),
(904, 275, 95),
(905, 276, 95),
(906, 277, 95),
(907, 273, 77),
(908, 274, 77),
(909, 275, 77),
(910, 276, 77),
(911, 277, 77),
(912, 278, 77),
(913, 279, 77),
(914, 279, 77),
(915, 279, 77),
(916, 282, 77),
(917, 278, 95),
(918, 279, 95),
(919, 279, 95),
(920, 279, 95),
(921, 282, 95),
(922, 268, 103),
(923, 269, 103),
(924, 270, 103),
(925, 271, 103),
(926, 268, 104),
(927, 269, 104),
(928, 270, 104),
(929, 271, 104),
(930, 283, 87),
(931, 284, 87),
(932, 285, 87),
(933, 286, 87),
(934, 287, 87),
(935, 251, 103),
(936, 252, 103),
(937, 253, 103),
(938, 254, 103),
(939, 255, 103);

-- --------------------------------------------------------

--
-- Table structure for table `workout_client_exercise_assignment_sets`
--

CREATE TABLE `workout_client_exercise_assignment_sets` (
  `id` int(11) NOT NULL,
  `assignment_id` int(11) NOT NULL,
  `reps` varchar(255) NOT NULL,
  `weight` varchar(255) NOT NULL,
  `seq` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `workout_client_exercise_assignment_sets`
--

INSERT INTO `workout_client_exercise_assignment_sets` (`id`, `assignment_id`, `reps`, `weight`, `seq`) VALUES
(7, 3, '35-40', '20lbs', 1),
(8, 3, '35-40', '15lbs', 2),
(9, 3, '35-40', '12lbs', 3),
(10, 4, '2', 'a', 1),
(11, 4, '3', 'b', 2),
(12, 4, '4', 'c', 3),
(159, 61, '4', '14', 1),
(160, 61, '4', '14', 2),
(289, 103, '9', '', 1),
(290, 103, '9', '', 2),
(291, 103, '9', '', 3),
(292, 103, '9', '', 4),
(293, 104, '1', '12', 1),
(294, 104, '1', '12', 2),
(295, 104, '1', '12', 3),
(296, 104, '1', '12', 4),
(297, 105, '4', '14', 1),
(298, 105, '4', '14', 2),
(299, 105, '4', '14', 3),
(300, 106, '2', '13', 1),
(301, 106, '2', '13', 2),
(302, 106, '2', '13', 3),
(303, 107, '4', '14', 1),
(304, 107, '4', '15', 2),
(305, 107, '4', '15', 3),
(306, 108, '4', '15', 1),
(307, 108, '4', '15', 2),
(308, 108, '4', '15', 3),
(309, 109, '1', '12', 1),
(310, 109, '1', '12', 2),
(311, 110, '14', '12', 1),
(312, 110, '14', '12', 2),
(313, 111, '2', '4', 1),
(314, 111, '2', '4', 2),
(315, 111, '2', '4', 3),
(316, 111, '2', '4', 4),
(317, 112, '4', '23', 1),
(318, 112, '4', '23', 2),
(319, 112, '4', '23', 3),
(320, 112, '4', '23', 4),
(321, 113, '4', '25', 1),
(322, 113, '4', '25', 2),
(323, 113, '4', '25', 3),
(324, 113, '4', '25', 4),
(325, 114, '4', '2', 1),
(326, 114, '4', '2', 2),
(327, 114, '4', '2', 3),
(328, 115, '3', '', 1),
(329, 115, '3', '', 2),
(330, 115, '3', '', 3),
(331, 116, '35-40', '', 1),
(332, 116, '35-40', '', 2),
(333, 116, '35-40', '', 3),
(334, 116, '35-40', '', 4),
(335, 117, '10 sec', '', 1),
(336, 117, '10 sec', '', 2),
(337, 117, '10 sec', '', 3),
(338, 117, '10 sec', '', 4),
(339, 118, '9', '', 1),
(340, 118, '9', '', 2),
(341, 118, '9', '', 3),
(342, 119, '9', '', 1),
(343, 119, '9', '', 2),
(344, 119, '9', '', 3),
(366, 128, '3', '15lbs', 1),
(367, 128, '3', '20lbs', 2),
(368, 128, '3', '30lbs', 3),
(369, 129, '8', '14lbs', 1),
(370, 129, '8', '14lbs', 2),
(371, 129, '8', '', 3),
(372, 130, '3', '20lbs', 1),
(373, 130, '3', '30lbs', 2),
(374, 130, '4', '40lbs', 3),
(375, 131, '10 sec', '', 1),
(376, 131, '10 sec', '', 2),
(377, 132, '8', '', 1),
(378, 132, '8', '', 2),
(379, 132, '8', '', 3),
(380, 132, '8', '', 4),
(381, 133, '9', '', 1),
(382, 133, '9', '', 2),
(383, 133, '9', '', 3),
(384, 133, '9', '', 4),
(597, 225, '', '12 lbs', 1),
(598, 225, '', '12 lbs', 2),
(599, 226, '', '13 lbs', 1),
(600, 226, '', '13 lbs', 2),
(601, 226, '', '16 lbs', 3),
(602, 227, '', '12 lbs', 1),
(603, 227, '', '20 lbs', 2),
(604, 228, '', '12 lbs', 1),
(605, 228, '', '12 lbs', 2),
(606, 228, '', '12 lbs', 3),
(607, 228, '', '12 lbs', 4),
(608, 228, '', '12 lbs', 5),
(609, 229, '', '12 lbs', 1),
(610, 229, '', '12 lbs', 2),
(611, 230, '', '12 lbs', 1),
(612, 230, '', '12 lbs', 2),
(613, 230, '', '12 lbs', 3),
(614, 230, '', '12 lbs', 4),
(615, 230, '', '12 lbs', 5),
(622, 233, '', '10 lbs', 1),
(623, 233, '', '12 lbs', 2),
(624, 233, '', '14 lbs', 3),
(625, 234, '', '5 lbs', 1),
(626, 234, '', '6 lbs', 2),
(627, 234, '', '7 lbs', 3),
(648, 249, '', '40 lbs', 1),
(649, 249, '', '40 lbs', 2),
(650, 250, '', '42 lbs', 1),
(651, 250, '', '42 lbs', 2),
(652, 251, '', '42 lbs', 1),
(653, 251, '', '42 lbs', 2),
(654, 252, '', '42 lbs', 1),
(655, 252, '', '42 lbs', 2),
(668, 259, '', '12 lbs', 1),
(669, 259, '', '12 lbs', 2),
(670, 260, '', '20 lbs', 1),
(671, 260, '', '20 lbs', 2),
(672, 261, '', '10', 1),
(673, 261, '', '20', 2),
(703, 276, '', '90', 1),
(704, 276, '', '80', 2),
(705, 276, '', '70', 3),
(706, 277, '', '60', 1),
(707, 277, '', '50', 2),
(708, 277, '', '40', 3),
(709, 278, '', '30', 1),
(710, 278, '', '20', 2),
(711, 278, '', '10', 3),
(712, 279, '', '100', 1),
(713, 280, '', '100', 1),
(714, 281, '', '10', 1),
(715, 282, '', '20', 1),
(716, 283, '', '10', 1),
(717, 284, '', '20', 1),
(718, 285, '', '10', 1),
(719, 286, '', '20', 1),
(720, 287, '', '10', 1),
(721, 288, '', '20', 1),
(722, 289, '', '20', 1),
(723, 290, '', '20', 1),
(724, 291, '', '20', 1),
(725, 292, '', '20', 1),
(726, 293, '', '20', 1),
(727, 294, '', '20', 1),
(728, 295, '', '20', 1),
(729, 296, '', '20', 1),
(752, 319, '', '10', 1),
(753, 320, '', '20', 1),
(754, 321, '', '10', 1),
(755, 322, '', '10', 1),
(756, 323, '', '10', 1),
(757, 325, '', '10', 1),
(758, 326, '', '20', 1),
(759, 327, '', '30', 1),
(766, 334, '', '10', 1),
(767, 335, '', '10', 1),
(768, 336, '', '10', 1),
(769, 337, '', '23', 1),
(770, 337, '', '23', 2),
(801, 360, '', '100', 1),
(802, 361, '', '200', 1),
(803, 363, '', '50', 1),
(875, 414, '', '12', 1),
(1038, 577, '', '100', 1),
(1039, 578, '', '100', 1),
(1040, 579, '', '100', 1),
(1041, 580, '', '100', 1),
(1042, 581, '', '100', 1),
(1043, 582, '', '100', 1),
(1044, 583, '', '100', 1),
(1045, 584, '', '100', 1),
(1046, 585, '', '200', 1),
(1047, 586, '', '200', 1),
(1048, 587, '', '200', 1),
(1049, 588, '', '200', 1),
(1050, 589, '', '300', 1),
(1051, 590, '', '300', 1),
(1052, 591, '', '300', 1),
(1053, 592, '', '300', 1),
(1054, 593, '', '300', 1),
(1055, 594, '', '300', 1),
(1056, 595, '', '1', 1),
(1057, 595, '', '1', 2),
(1058, 595, '', '1', 3),
(1059, 595, '', '1', 4),
(1068, 605, '', '', 1),
(1069, 605, '', '', 2),
(1070, 605, '', '', 3),
(1071, 605, '', '', 4),
(1072, 606, '', '', 1),
(1073, 606, '', '', 2),
(1074, 606, '', '', 3),
(1075, 606, '', '', 4),
(1076, 607, '', '', 1),
(1077, 607, '', '', 2),
(1078, 607, '', '', 3),
(1079, 607, '', '', 4),
(1080, 608, '', '', 1),
(1081, 608, '', '', 2),
(1082, 608, '', '', 3),
(1083, 608, '', '', 4),
(1084, 609, '', '50', 1),
(1085, 609, '', '50', 2),
(1086, 609, '', '50', 3),
(1087, 610, '', '50', 1),
(1088, 610, '', '50', 2),
(1089, 610, '', '', 3),
(1090, 611, '', '50', 1),
(1091, 611, '', '25', 2),
(1092, 611, '', '25', 3),
(1093, 612, '', '50', 1),
(1094, 612, '', '25', 2),
(1095, 612, '', '25', 3),
(1096, 613, '', '', 1),
(1097, 613, '', '', 2),
(1098, 616, '', '25', 1),
(1099, 616, '', '25', 2),
(1100, 616, '', '', 3),
(1101, 617, '', '25', 1),
(1102, 617, '', '', 2),
(1103, 617, '', '', 3),
(1104, 618, '', '25', 1),
(1105, 618, '', '25', 2),
(1106, 618, '', '25', 3),
(1107, 619, '', '25', 1),
(1118, 624, '', '50', 1),
(1119, 624, '', '50', 2),
(1120, 624, '', '50', 3),
(1121, 625, '', '50', 1),
(1122, 625, '', '50', 2),
(1123, 625, '', '50', 3),
(1124, 626, '', '50', 1),
(1125, 626, '', '50', 2),
(1126, 627, '', '50', 1),
(1127, 627, '', '50', 2),
(1156, 653, '', '100', 1),
(1157, 653, '', '1', 2),
(1158, 654, '', '2', 1),
(1159, 654, '', '2', 2),
(1160, 656, '', '2', 1),
(1161, 657, '', '1', 1),
(1162, 657, '', '2', 2),
(1188, 679, '', '10', 1),
(1189, 679, '', '22', 2),
(1190, 680, '', '30', 1),
(1191, 680, '', '40', 2),
(1192, 681, '', '50', 1),
(1193, 681, '', '60', 2),
(1194, 682, '', '10', 1),
(1195, 682, '', '20', 2),
(1196, 683, '', '30', 1),
(1197, 683, '', '40', 2),
(1198, 685, '', '100', 1),
(1199, 686, '', '200', 1),
(1206, 693, '', '22', 1),
(1207, 694, '', '1', 1),
(1208, 695, '', '1', 1),
(1209, 696, '', '1', 1),
(1210, 696, '', '1', 2),
(1211, 697, '', '1', 1),
(1212, 697, '', '1', 2),
(1213, 702, '', '1', 1),
(1214, 703, '', '1', 1),
(1215, 704, '', '1', 1),
(1216, 704, '', '1', 2),
(1217, 705, '', '1', 1),
(1218, 705, '', '1', 2),
(1248, 715, '', '55', 1),
(1249, 715, '', '55', 2),
(1250, 715, '', '55', 3),
(1251, 716, '', '55', 1),
(1252, 716, '', '55', 2),
(1253, 716, '', '55', 3),
(1254, 716, '', '55', 4),
(1255, 717, '', '55', 1),
(1256, 717, '', '55', 2),
(1257, 717, '', '55', 3),
(1258, 717, '', '55', 4),
(1259, 718, '', '55', 1),
(1260, 719, '', '55', 1),
(1261, 719, '', '55', 2),
(1262, 719, '', '55', 3),
(1263, 720, '', '50', 1),
(1264, 720, '', '50', 2),
(1265, 720, '', '50', 3),
(1266, 721, '', '50', 1),
(1267, 721, '', '50', 2),
(1268, 721, '', '50', 3),
(1269, 721, '', '50', 4),
(1270, 722, '', '50', 1),
(1271, 722, '', '50', 2),
(1272, 722, '', '50', 3),
(1273, 722, '', '50', 4),
(1278, 725, '', '10', 1),
(1279, 725, '', '10', 2),
(1331, 745, '', '50', 1),
(1332, 745, '', '50', 2),
(1333, 745, '', '50', 3),
(1334, 745, '', '50', 4),
(1335, 746, '', '50', 1),
(1336, 746, '', '50', 2),
(1337, 746, '', '50', 3),
(1338, 747, '', '50', 1),
(1339, 747, '', '50', 2),
(1340, 747, '', '50', 3),
(1341, 747, '', '50', 4),
(1342, 747, '', '5', 5),
(1343, 748, '', '50', 1),
(1344, 748, '', '50', 2),
(1345, 748, '', '50', 3),
(1383, 781, '', '20', 1),
(1384, 781, '', '20', 2),
(1387, 783, '', '10', 1),
(1388, 783, '', '20', 2),
(1420, 811, '', '12', 1),
(1421, 811, '', '12', 2),
(1422, 812, '', '15', 1),
(1423, 812, '', '15', 2),
(1424, 812, '', '15', 3),
(1427, 822, '', '', 1),
(1428, 822, '', '', 2),
(1429, 822, '', '', 3),
(1430, 832, '', '', 1),
(1431, 832, '', '', 2),
(1434, 851, '', '30 lbs', 1),
(1485, 912, '', '60', 1),
(1486, 912, '', '', 2),
(1487, 913, '', '60', 1),
(1488, 913, '', '', 2),
(1489, 914, '', '60', 1),
(1490, 914, '', '', 2),
(1491, 915, '', '60', 1),
(1492, 915, '', '', 2),
(1493, 916, '', '60', 1),
(1494, 916, '', '', 2),
(1495, 935, '', '', 1),
(1496, 935, '', '', 2),
(1497, 935, '', '', 3),
(1498, 935, '', '', 4),
(1499, 935, '', '', 5),
(1500, 936, '', '', 1),
(1501, 936, '', '', 2),
(1502, 936, '', '', 3),
(1503, 936, '', '', 4),
(1504, 936, '', '', 5),
(1505, 937, '', '', 1),
(1506, 937, '', '', 2),
(1507, 937, '', '', 3),
(1508, 937, '', '', 4),
(1509, 937, '', '', 5),
(1510, 938, '', '', 1),
(1511, 938, '', '', 2),
(1512, 938, '', '', 3),
(1513, 938, '', '', 4),
(1514, 938, '', '', 5),
(1515, 939, '', '', 1),
(1516, 939, '', '', 2),
(1517, 939, '', '', 3),
(1518, 939, '', '', 4),
(1519, 939, '', '', 5);

-- --------------------------------------------------------

--
-- Table structure for table `workout_client_set_logs`
--

CREATE TABLE `workout_client_set_logs` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `exercise_log_id` int(11) NOT NULL,
  `reps` varchar(255) NOT NULL,
  `isMet` tinyint(1) DEFAULT NULL,
  `isDone` tinyint(1) DEFAULT NULL,
  `seq` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `workout_client_set_logs`
--

INSERT INTO `workout_client_set_logs` (`id`, `client_id`, `exercise_log_id`, `reps`, `isMet`, `isDone`, `seq`) VALUES
(1, 3, 1, '35-40', NULL, NULL, 1),
(2, 3, 1, '35-40', NULL, NULL, 2),
(3, 3, 1, '35-40', NULL, NULL, 3),
(4, 3, 2, '20 sec', NULL, NULL, 1),
(5, 3, 2, '3', NULL, NULL, 2),
(6, 3, 2, '4', NULL, NULL, 3),
(7, 3, 3, '8', NULL, NULL, 1),
(8, 3, 3, '8', NULL, NULL, 2),
(9, 3, 4, '7', NULL, NULL, 1),
(10, 3, 4, '9', NULL, NULL, 2),
(11, 3, 4, '9', NULL, NULL, 3),
(12, 5, 5, '2', NULL, NULL, 1),
(13, 5, 5, '8', NULL, NULL, 2),
(14, 5, 6, '7', NULL, NULL, 1),
(15, 5, 6, '10', NULL, NULL, 2),
(16, 5, 6, '10', NULL, NULL, 3),
(17, 5, 6, '10', NULL, NULL, 4),
(18, 5, 6, '10', NULL, NULL, 5),
(19, 3, 7, '', NULL, NULL, 1),
(20, 3, 7, '', NULL, NULL, 2),
(21, 3, 7, '', NULL, NULL, 3),
(22, 3, 8, '', NULL, NULL, 1),
(23, 3, 8, '', NULL, NULL, 2),
(24, 3, 8, '', NULL, NULL, 3),
(25, 20, 9, '', NULL, NULL, 1),
(26, 20, 9, '', NULL, NULL, 2),
(27, 27, 10, '', NULL, NULL, 1),
(28, 27, 10, '', NULL, NULL, 2),
(29, 77, 14, '', NULL, NULL, 1),
(30, 77, 15, '', NULL, NULL, 1),
(31, 77, 15, '', NULL, NULL, 2),
(32, 77, 16, '', NULL, NULL, 1),
(33, 77, 16, '', NULL, NULL, 2),
(34, 43, 17, '', NULL, NULL, 1),
(35, 95, 15, '', NULL, NULL, 1),
(36, 95, 15, '', NULL, NULL, 2),
(37, 95, 16, '', NULL, NULL, 1),
(38, 95, 16, '', NULL, NULL, 2),
(39, 87, 18, '', NULL, NULL, 1),
(40, 77, 19, '', NULL, NULL, 1),
(41, 77, 19, '', NULL, NULL, 2),
(42, 103, 20, '', NULL, NULL, 1),
(43, 103, 20, '', NULL, NULL, 2),
(44, 103, 20, '', NULL, NULL, 3),
(45, 77, 21, '', NULL, NULL, 1),
(46, 77, 21, '', NULL, NULL, 2),
(47, 77, 22, '', NULL, NULL, 1),
(48, 77, 23, '', NULL, NULL, 1),
(49, 77, 23, '', NULL, NULL, 2),
(50, 103, 24, '', NULL, NULL, 1),
(51, 103, 24, '', NULL, NULL, 2),
(52, 103, 24, '', NULL, NULL, 3),
(53, 103, 24, '', NULL, NULL, 4),
(54, 103, 25, '', NULL, NULL, 1),
(55, 103, 25, '', NULL, NULL, 2),
(56, 103, 25, '', NULL, NULL, 3),
(57, 103, 26, '', NULL, NULL, 1),
(58, 103, 26, '', NULL, NULL, 2),
(59, 103, 26, '', NULL, NULL, 3),
(60, 103, 26, '', NULL, NULL, 4),
(61, 103, 26, '', NULL, NULL, 5);

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
(28, 'start', 77, '22', '32', '123', '1', '2', '3', '4', '5', '6', '7', '8', '9', 76, 76, NULL, '2018-07-25 06:07:24', '2018-08-14 13:08:30'),
(29, 'goal', 77, '30', '32', '123', '1', '2', '3', '4', '5', '6', '7', '8', '9', 76, 76, NULL, '2018-07-25 06:07:25', '2018-08-14 13:08:30'),
(30, 'result', 77, '22', '32', '123', '1', '2', '3', '4', '5', '6', '7', '8', '9', 76, 76, '2018-07-25 07:07:39', '2018-07-25 07:07:39', '2018-07-25 07:07:18'),
(31, 'start', 87, '', '', '', '', '', '1', '1', '', '', '', '', '', 76, 76, NULL, '2018-08-14 09:08:58', '2018-08-14 12:08:23'),
(32, 'goal', 87, '2', '', '', '2', '', '1', '2', '', '', '', '', '', 76, 76, NULL, '2018-08-14 09:08:59', '2018-08-14 12:08:23'),
(33, 'result', 87, '', '', '', '', '', '', '', '', '', '', '', '', 76, 76, '2018-08-14 09:08:00', '2018-08-14 09:08:00', '2018-08-14 12:08:23'),
(34, 'start', 95, '1', '20', '1', '23', '55', '', '', '', '', '', '', '', 76, 76, NULL, '2018-08-14 12:08:21', '2018-08-14 14:08:05'),
(35, 'goal', 95, '2', '8', '2', '50', '45', '', '', '', '', '', '', '', 76, 76, NULL, '2018-08-14 12:08:21', '2018-08-14 14:08:05'),
(36, 'result', 95, '1', '11', '2', '40', '46', '', '', '', '', '', '', '', 76, 76, '2018-08-14 12:08:21', '2018-08-14 12:08:21', '2018-08-14 14:08:05'),
(37, 'result', 77, '28', '32', '123', '1', '2', '3', '4', '5', '6', '7', '8', '9', 76, 76, '2018-08-14 13:08:04', '2018-08-14 13:08:04', '2018-08-14 13:08:30');

-- --------------------------------------------------------

--
-- Table structure for table `workout_days_tbl`
--

CREATE TABLE `workout_days_tbl` (
  `wday_ID` int(11) UNSIGNED NOT NULL,
  `wday_workout_ID` int(11) UNSIGNED NOT NULL,
  `wday_name` varchar(255) NOT NULL,
  `wday_order` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `workout_days_tbl`
--

INSERT INTO `workout_days_tbl` (`wday_ID`, `wday_workout_ID`, `wday_name`, `wday_order`) VALUES
(46, 15, 'Day 1', 1),
(48, 16, 'Day 1', 1),
(49, 17, 'Biceps', 1),
(50, 0, '', 0),
(51, 18, 'Posterior Chain', 1),
(52, 17, 'leg', 2),
(53, 19, 'first day', 0),
(54, 19, 'second day', 0),
(55, 19, 'third day', 0),
(56, 19, 'fourth day', 0),
(57, 0, 'Chest', 0),
(58, 0, 'Legs', 0),
(59, 20, 'Calves, Abs', 1),
(60, 21, 'leg day', 0),
(61, 21, 'upper body day', 0),
(62, 22, 'upper body day', 0),
(63, 22, 'leg day', 0),
(64, 23, 'leg day', 0),
(65, 23, 'leg 2nd day', 0),
(66, 24, 'arms day', 1),
(67, 24, 'arms day 2', 2),
(68, 24, 'arms day 3', 3),
(69, 24, 'arms day 4', 4),
(70, 25, 'upper body day', 1),
(71, 25, 'leg day', 2),
(72, 25, 'upper body day', 3),
(73, 26, 'workout #1', 1),
(76, 20, 'Chest, Back', 2),
(105, 44, 'Test WO 1', 1),
(106, 45, 'WO 1', 1),
(107, 46, 'Workout 1', 1),
(108, 47, 'w', 1),
(110, 49, 'Upper body', 1),
(112, 50, 'Met Load 1', 1),
(113, 51, 'Test', 1),
(117, 54, 'p6w1', 1),
(118, 55, 'Chest, Back', 1),
(119, 55, 'Circuit 2', 2),
(120, 56, 'te', 1),
(121, 54, 'p6w2', 2),
(122, 54, 'p6w3', 3),
(124, 58, 'othersw1', 1),
(125, 59, 'test', 1),
(126, 60, 'Day 1, 3', 1),
(127, 60, 'Day 2, 4', 2),
(128, 60, 'Day 5', 3),
(129, 59, 'Test 2', 2),
(130, 61, 'Work', 1),
(131, 62, 'WN', 1),
(132, 63, 'WN', 1),
(133, 64, 'Upper body', 1),
(134, 65, 'test p1w1', 1),
(135, 65, 'test p1w2', 2),
(136, 66, 'pp1w1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `workout_day_clients_tbl`
--

CREATE TABLE `workout_day_clients_tbl` (
  `workout_client_ID` int(11) UNSIGNED NOT NULL,
  `workout_client_dayID` int(11) NOT NULL,
  `workout_client_workout_ID` int(11) NOT NULL,
  `workout_clientID` int(11) NOT NULL,
  `workout_day_availability` int(11) NOT NULL,
  `workout_client_schedule` datetime NOT NULL,
  `workout_isDone` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `workout_day_clients_tbl`
--

INSERT INTO `workout_day_clients_tbl` (`workout_client_ID`, `workout_client_dayID`, `workout_client_workout_ID`, `workout_clientID`, `workout_day_availability`, `workout_client_schedule`, `workout_isDone`) VALUES
(34, 0, 7, 3, 0, '2018-06-12 11:46:17', 0),
(35, 0, 7, 5, 0, '2018-06-12 11:46:17', 0),
(36, 0, 7, 3, 0, '2018-06-12 11:55:05', 0),
(37, 0, 7, 5, 0, '2018-06-12 11:55:05', 0),
(40, 0, 7, 3, 0, '2018-06-12 12:13:50', 0),
(42, 0, 7, 3, 2, '2018-06-12 12:00:00', 0),
(48, 0, 9, 3, 4, '2018-06-14 12:00:00', 0),
(49, 0, 9, 5, 4, '2018-06-14 12:00:00', 0),
(51, 0, 11, 3, 1, '2018-06-18 12:00:00', 0),
(52, 0, 11, 3, 3, '2018-06-20 12:00:00', 0),
(54, 39, 0, 3, 1, '2018-06-18 12:00:00', 0),
(55, 40, 0, 5, 1, '2018-06-18 12:00:00', 0),
(59, 43, 13, 3, 0, '2018-06-20 00:00:00', 0),
(60, 44, 14, 21, 0, '2018-06-26 00:00:00', 0),
(61, 45, 14, 20, 0, '2018-06-27 00:00:00', 0),
(62, 45, 14, 21, 0, '2018-06-27 00:00:00', 0),
(63, 44, 14, 20, 0, '2018-06-26 00:00:00', 1),
(64, 46, 15, 28, 0, '2018-06-26 00:00:00', 0),
(65, 46, 15, 27, 0, '2018-06-26 00:00:00', 1),
(68, 48, 16, 31, 0, '2018-06-26 00:00:00', 0),
(69, 49, 17, 25, 0, '2018-06-29 00:00:00', 1),
(70, 52, 17, 25, 0, '2018-06-30 00:00:00', 0),
(71, 53, 19, 25, 0, '2018-06-29 12:00:00', 0),
(72, 54, 19, 25, 0, '2018-06-29 12:00:00', 0),
(73, 55, 19, 25, 0, '2018-06-29 12:00:00', 0),
(74, 56, 19, 25, 0, '2018-06-29 12:00:00', 0),
(75, 60, 21, 25, 0, '2018-07-02 12:00:00', 0),
(76, 61, 21, 25, 0, '2018-07-03 12:00:00', 0),
(77, 62, 22, 48, 0, '2018-07-02 12:00:00', 0),
(78, 63, 22, 48, 0, '2018-07-03 12:00:00', 0),
(79, 66, 24, 59, 0, '2018-07-03 00:00:00', 0),
(80, 67, 24, 59, 0, '2018-07-04 00:00:00', 0),
(81, 68, 24, 59, 0, '2018-07-03 00:00:00', 0),
(82, 69, 24, 59, 0, '2018-07-06 12:00:00', 0),
(83, 70, 25, 64, 0, '2018-07-09 00:00:00', 0),
(84, 71, 25, 64, 0, '2018-07-10 00:00:00', 0),
(85, 72, 25, 64, 0, '2018-07-11 00:00:00', 0),
(86, 73, 26, 91, 0, '2018-07-17 00:00:00', 0),
(87, 59, 20, 43, 0, '2018-07-19 00:00:00', 0),
(91, 76, 20, 43, 0, '2018-07-26 00:00:00', 1),
(92, 51, 18, 43, 0, '2018-07-27 00:00:00', 0),
(106, 105, 44, 43, 0, '0000-00-00 00:00:00', 0),
(107, 106, 45, 43, 2, '2018-08-07 12:00:00', 0),
(108, 107, 46, 43, 2, '2018-08-07 12:00:00', 0),
(109, 107, 46, 100, 2, '2018-08-07 12:00:00', 0),
(110, 108, 47, 100, 3, '2018-08-08 12:00:00', 0),
(112, 110, 49, 103, 2, '2018-09-04 01:00:00', 0),
(115, 113, 51, 77, 2, '2018-08-14 12:00:00', 0),
(119, 112, 50, 103, 4, '2018-08-16 12:00:00', 1),
(122, 117, 54, 77, 3, '2018-08-15 06:08:20', 0),
(123, 117, 54, 95, 2, '2018-08-28 09:08:20', 0),
(124, 118, 55, 103, 3, '2018-08-15 12:00:00', 0),
(125, 119, 55, 103, 3, '2018-08-15 12:00:00', 0),
(126, 112, 50, 104, 4, '2018-08-16 01:00:00', 0),
(127, 118, 55, 104, 2, '2018-08-21 02:30:00', 0),
(133, 110, 49, 104, 2, '2018-09-04 01:00:00', 0),
(134, 126, 60, 103, 2, '2018-09-04 12:09:00', 0),
(135, 121, 54, 87, 0, '0000-00-00 00:00:00', 0),
(136, 129, 59, 95, 4, '2018-09-06 12:00:00', 0),
(137, 130, 61, 104, 4, '2018-09-13 12:09:00', 0),
(138, 131, 62, 105, 0, '0000-00-00 00:00:00', 0),
(139, 133, 64, 103, 4, '2018-09-06 12:00:00', 0),
(140, 133, 64, 104, 4, '2018-09-06 12:00:00', 0),
(143, 134, 65, 87, 0, '0000-00-00 00:00:00', 0),
(144, 134, 65, 95, 0, '0000-00-00 00:00:00', 0),
(145, 134, 65, 77, 0, '0000-00-00 00:00:00', 0),
(147, 136, 66, 87, 0, '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `workout_exercises_tbl`
--

CREATE TABLE `workout_exercises_tbl` (
  `exer_ID` int(11) NOT NULL,
  `exer_day_ID` int(11) NOT NULL,
  `exer_workout_ID` int(11) NOT NULL,
  `exer_body_part` varchar(255) DEFAULT NULL,
  `exer_type` varchar(255) DEFAULT NULL,
  `exer_exercise_1` varchar(255) DEFAULT NULL,
  `exer_exercise_2` varchar(255) DEFAULT NULL,
  `exer_sq` varchar(10) DEFAULT NULL,
  `exer_sets` int(11) DEFAULT NULL,
  `exer_rep` text,
  `exer_tempo` varchar(255) DEFAULT NULL,
  `exer_rest` varchar(255) DEFAULT NULL,
  `exer_impl1` varchar(255) DEFAULT NULL,
  `hash` varchar(255) NOT NULL,
  `group_by` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `workout_exercises_tbl`
--

INSERT INTO `workout_exercises_tbl` (`exer_ID`, `exer_day_ID`, `exer_workout_ID`, `exer_body_part`, `exer_type`, `exer_exercise_1`, `exer_exercise_2`, `exer_sq`, `exer_sets`, `exer_rep`, `exer_tempo`, `exer_rest`, `exer_impl1`, `hash`, `group_by`) VALUES
(58, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '5b1fb2788d317', NULL),
(59, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '5b1fb47b00e93', NULL),
(62, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '5b1fb8f95c9a0', NULL),
(64, 0, 7, 'Calves', 'Tibialis Anterior Flexion - Standing - Machine', 'Narrow Stancer', NULL, 'H', 2, '8', '5011', '45 sec', 'Safety Bar', '5b1fcf480f6ea', NULL),
(69, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '5b20cbd3b152f', NULL),
(70, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '5b20cbdb8bf4d', NULL),
(71, 0, 8, 'Abs/Hip Flexors', 'Plank', '4 pointr', NULL, 'H', 2, '7', '4011', '45 sec', 'Dumbbell', '5b20cbe70777a', NULL),
(75, 0, 9, 'Calves', 'Tibialis Anterior Flexion - Seated - Uni-lateral w/band', 'Wide Stance', NULL, 'H', 3, '9', '2110', '45 sec', 'Barbell', '5b20cc8eb1a33', NULL),
(78, 0, 11, 'Back', 'Bent-Over Row - Pronated Grip', 'Neutral Gripr', '45u00b0  Incliner', 'H', 1, '8', '3011', '45 sec', 'T-Grip Barbell', '5b27712c710c2', NULL),
(79, 0, 11, 'Biceps', 'Incline DB Hammer Curl', 'Flat', 'Close Gripr', 'MS', 3, '3', '40X1', '60 sec', 'Barbell', '5b2772716b101', NULL),
(81, 39, 0, 'Hamstrings', 'Swiss Ball Leg Curl', 'Uni-Lateralr', NULL, 'ES', 2, '10 sec', 'fast', '30 sec', 'Barbell', '5b27827a9facc', NULL),
(82, 40, 0, 'Back', 'Bent-Over Row - Elbows Out', 'Neutral Gripr', '45u00b0  Incliner', 'H', 2, '8', '4011', '60 sec', 'T-Grip Barbell', '5b27833e8613c', NULL),
(83, 40, 0, 'Hamstrings', 'TRX Leg Curl - Alternating', 'Heels Togetherr', NULL, 'H', 4, '9', '4011', '30 sec', 'Barbell', '5b27838ecb2f6', NULL),
(88, 43, 13, 'Abs/Hip Flexors', 'Plank', '3 pointr', NULL, 'ES', 3, '10 sec', 'submaximal', '15 sec', 'Dumbbell', '5b2a1267bf047', NULL),
(89, 43, 13, 'Back', 'Bent-Over Row - Pronated Grip', 'Semi-Supinated Gripr', '45u00b0  Incliner', 'ES', 3, '5 sec', 'maximal', '15 sec', 'T-Grip Barbell', '5b2a12f40d134', NULL),
(90, 44, 14, 'Biceps', 'Incline DB Hammer Curl', '60u00b0  Incline        r', '1.25 repsr', 'H', 2, '8', '5011', '45 sec', 'Mid Pulley', '5b31f1601c106', NULL),
(91, 45, 14, 'Biceps', 'Incline DB Hammer Curl', '45u00b0  Incliner', '1.25 repsr', 'H', 2, '7', '4011', '45 sec', 'Mid Pulley', '5b31f199669d0', NULL),
(92, 46, 15, 'Back', 'Bent-Over Row - Elbows Out', 'Semi-Pronated Gripr', NULL, 'ES', 2, '10 sec', 'submaximal', '15 sec', 'Dumbbell', '5b32010d82b77', NULL),
(94, 48, 16, 'Abs/Hip Flexors', 'Plank', '4 pointr', NULL, 'ES', 2, '15 sec', 'fast', '45 sec', 'High Pulley', '5b3249e8eff5b', NULL),
(95, 49, 17, 'Back', 'Bent-Over Row - Elbows Out', 'Semi-Pronated Gripr', NULL, 'ES', 3, '20 sec', 'maximal', '45 sec', 'Dumbbell', '5b33efe38cc6a', NULL),
(96, 49, 17, 'Biceps', 'Scott DB Curl', '45u00b0  Incliner', NULL, 'ES', 3, '40 meters', 'submaximal', '30 sec', 'Dumbbell', '5b33f002c33d4', NULL),
(97, 49, 17, 'Calves', 'Tibialis Anterior Flexion - Standing', 'Uni-Lateralr', NULL, 'ES', 3, '5 sec', 'maximal', '15 sec', 'Dumbbell', '5b33f015c94ea', NULL),
(98, 0, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '5b33f02048758', NULL),
(99, 0, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '5b33f0222d4b5', NULL),
(100, 50, 0, 'Back', 'Bent-Over Row - Supinated Grip', 'Supinated Gripr', NULL, 'H', 4, NULL, '2011', '60 sec', 'Dumbbell', '5b34ceb7ab9e0', NULL),
(101, 50, 0, 'Posterior Chain/Glutes', 'Goodmorning', 'Standing  Wide Stance          ', NULL, 'H', 3, '12', '2011', '60 sec', 'Safety Bar', '5b34cf293fe4c', NULL),
(102, 51, 18, 'Posterior Chain/Glutes', 'Sumo Deadlift', 'Clean Gripr', NULL, 'H', 3, '10', '3011', '60 sec', 'Barbell', '5b34dbd6184c3', NULL),
(103, 52, 17, 'Hamstrings', 'TRX Leg Curl - Bilateral', 'Uni-Lateralr', NULL, 'ES', 1, '5 sec', 'maximal', '15 sec', 'Dumbbell', '5b35d4a2bc7b6', NULL),
(104, 52, 17, 'Posterior Chain/Glutes', 'Back Extension, 45u00b0 Incline            ', 'Offsetr', NULL, 'ES', 1, '5 sec', 'maximal', '15 sec', 'Swiss Ball', '5b35d4f742acf', NULL),
(105, 53, 19, 'Abs/Hip Flexors', 'Abs Wheel Rollout', NULL, NULL, 'ES', 1, '5 sec', 'maximal', '15 sec', 'Low Pulley', '5b35d6dea71ca', NULL),
(106, 53, 19, 'Back', 'Bent-Over Row - Pronated Grip', 'Pronated Gripr', '30u00b0  Incliner', 'ES', 1, '5 sec', 'maximal', '15 sec', 'Barbell', '5b35d6febf824', NULL),
(107, 54, 19, 'Biceps', 'Incline DB Curl', '30u00b0  Incliner', 'Offset Gripr', 'ES', 1, '5 sec', 'maximal', '15 sec', 'EZ Bar', '5b35d71d96721', NULL),
(108, 54, 19, 'Calves', 'Tibialis Anterior Flexion - Standing', 'Uni-Lateralr', NULL, 'ES', 1, '5 sec', 'maximal', '15 sec', 'Dumbbell', '5b35d73e6c063', NULL),
(109, 55, 19, 'Forearms', 'Gripper Machine', 'One-Armr', NULL, 'ES', 1, '5 sec', 'maximal', '15 sec', 'Captains of Crush', '5b35d75b8e0e8', NULL),
(110, 55, 19, 'Hamstrings', 'TRX Leg Curl - Bilateral', 'Uni-Lateralr', NULL, 'ES', 1, '5 sec', 'maximal', '15 sec', 'Dumbbell', '5b35d77268d6a', NULL),
(111, 56, 19, 'Neck', 'Neck Extension, Prone', 'Harness            r', NULL, 'ES', 1, '5 sec', 'maximal', '15 sec', 'Low Pulley', '5b35d7915f017', NULL),
(112, 56, 19, 'Pectorals', 'Incline Bench Press', '10u00b0 Incline      r', 'Close Grip - Neutralr', 'ES', 1, '5 sec', 'maximal', '15 sec', 'Barbell', '5b35d7cc512b8', NULL),
(113, 57, 0, 'Pectorals', 'Incline Bench Press', '10u00b0 Incline      r', 'Medium Grip - Pronatedr', 'H', 4, '8', '2011', '60 sec', 'T-Grip Bar', '5b390f05742b4', NULL),
(114, 58, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '5b3911be5478f', NULL),
(115, 59, 20, 'Calves', 'Donkey Calf Raise', 'Narrow Stancer', NULL, 'H', 4, '15', '2011', '30 sec', NULL, '5b3912b97e52e', NULL),
(116, 59, 20, 'Calves', 'Tibialis Anterior Flexion - Standing', 'Hip Width Stancer', NULL, 'H', 4, '10-12', '2011', '30 sec', NULL, '5b39152c0c7c4', NULL),
(117, 60, 21, 'Hamstrings', 'TRX Leg Curl - Bilateral', 'Uni-Lateralr', NULL, 'ES', 1, '5 sec', 'maximal', '15 sec', 'Dumbbell', '5b3a042bb5b66', NULL),
(118, 60, 21, 'Hamstrings', 'TRX Leg Curl - Alternating', 'Uni-Lateralr', NULL, 'ES', 1, '5 sec', 'maximal', '15 sec', 'Dumbbell', '5b3a042bb5b66', NULL),
(119, 61, 21, 'Abs/Hip Flexors', 'Abs Wheel Rollout', NULL, NULL, 'ES', 1, '5 sec', 'maximal', '15 sec', 'Low Pulley', '5b3a04805b55f', NULL),
(120, 61, 21, 'Abs/Hip Flexors', 'Plank', 'Bent-Kneer', NULL, 'ES', 1, '5 sec', 'maximal', '15 sec', 'Low Pulley', '5b3a04805b55f', NULL),
(121, 62, 22, 'Abs/Hip Flexors', 'Abs Wheel Rollout', NULL, NULL, 'ES', 1, '5 sec', 'maximal', '15 sec', 'Low Pulley', '5b3a073b65b2d', NULL),
(122, 62, 22, 'Abs/Hip Flexors', 'Plank', 'Bent-Kneer', NULL, 'ES', 1, '5 sec', 'maximal', '15 sec', 'Low Pulley', '5b3a073b65b2d', NULL),
(123, 63, 22, 'Calves', 'Tibialis Anterior Flexion - Standing', 'Uni-Lateralr', NULL, 'ES', 1, '5 sec', 'maximal', '15 sec', 'Dumbbell', '5b3a0774b739f', NULL),
(124, 63, 22, 'Calves', 'Tibialis Anterior Flexion - Standing - Machine', 'Uni-Lateralr', NULL, 'ES', 1, '5 sec', 'maximal', '15 sec', 'Dumbbell', '5b3a0774b739f', NULL),
(125, 64, 23, 'Calves', 'Tibialis Anterior Flexion - Standing', 'Uni-Lateralr', NULL, 'ES', 1, '5 sec', 'maximal', '15 sec', 'Dumbbell', '5b3b423dcc2a4', NULL),
(126, 64, 23, 'Calves', 'Tibialis Anterior Flexion - Standing - Machine', 'Uni-Lateralr', NULL, 'ES', 1, '5 sec', 'maximal', '15 sec', 'Dumbbell', '5b3b42589ddf2', NULL),
(127, 64, 23, 'Calves', 'Calf Press', 'Uni-Lateralr', NULL, 'ES', 1, '5 sec', 'maximal', '15 sec', 'Dumbbell', '5b3b426b6d2cb', NULL),
(128, 65, 23, 'Calves', 'Tibialis Anterior Flexion - Standing', 'Uni-Lateralr', NULL, 'ES', 1, '5 sec', 'maximal', '15 sec', 'Dumbbell', '5b3b428aed0de', NULL),
(129, 65, 23, 'Calves', 'Tibialis Anterior Flexion - Standing - Machine', 'Uni-Lateralr', NULL, 'ES', 1, '5 sec', 'maximal', '15 sec', 'Dumbbell', '5b3b428aed0de', NULL),
(130, 65, 23, 'Calves', 'Calf Press', 'Uni-Lateralr', NULL, 'ES', 1, '5 sec', 'maximal', '15 sec', 'Dumbbell', '5b3b428aed0de', NULL),
(131, 66, 24, 'Forearms', 'Gripper Machine', 'One-Armr', NULL, 'ES', 1, '5 sec', 'maximal', '15 sec', 'Captains of Crush', '5b3b43113f14b', NULL),
(132, 66, 24, 'Forearms', 'Gripper Machine', 'One-Armr', NULL, 'ES', 1, '5 sec', 'maximal', '15 sec', 'Leverage Bar', '5b3b433345a03', NULL),
(133, 67, 24, 'Forearms', 'Gripper Machine', 'One-Armr', NULL, 'ES', 1, '5 sec', 'maximal', '15 sec', 'Captains of Crush', '5b3b43486f7c8', NULL),
(134, 67, 24, 'Forearms', 'Gripper Machine', 'One-Armr', NULL, 'ES', 1, '5 sec', 'maximal', '15 sec', 'Leverage Bar', '5b3b43486f7c8', NULL),
(135, 68, 24, 'Forearms', 'Gripper Machine', 'One-Armr', NULL, 'ES', 1, '5 sec', 'maximal', '15 sec', 'Captains of Crush', '5b3b470a89b23', NULL),
(136, 68, 24, 'Forearms', 'Gripper Machine', 'One-Armr', NULL, 'ES', 1, '5 sec', 'maximal', '15 sec', 'Leverage Bar', '5b3b470a89b23', NULL),
(137, 68, 24, 'Forearms', 'Gripper Machine', 'One-Armr', NULL, 'ES', 1, '5 sec', 'maximal', '15 sec', 'Leverage Bar', '5b3b4affd537a', NULL),
(138, 69, 24, 'Forearms', 'Gripper Machine', 'One-Armr', NULL, 'ES', 1, '5 sec', 'maximal', '15 sec', 'Captains of Crush', '5b3b4b07dbcc0', NULL),
(139, 69, 24, 'Forearms', 'Gripper Machine', 'One-Armr', NULL, 'ES', 1, '5 sec', 'maximal', '15 sec', 'Leverage Bar', '5b3b4b07dbcc0', NULL),
(140, 69, 24, 'Forearms', 'Gripper Machine', 'One-Armr', NULL, 'ES', 1, '5 sec', 'maximal', '15 sec', 'Leverage Bar', '5b3b4b07dbcc0', NULL),
(141, 70, 25, 'Abs/Hip Flexors', 'Abs Wheel Rollout', NULL, NULL, 'ES', 1, '5 sec', 'maximal', '15 sec', 'Low Pulley', '5b43362344217', NULL),
(142, 71, 25, 'Hamstrings', 'TRX Leg Curl - Bilateral', 'Uni-Lateralr', NULL, 'ES', 1, '5 sec', 'maximal', '15 sec', 'Dumbbell', '5b43367a9c7f9', NULL),
(143, 72, 25, 'Abs/Hip Flexors', 'Abs Wheel Rollout', NULL, NULL, 'ES', 1, '5 sec', 'maximal', '15 sec', 'Low Pulley', '5b43369f450c5', NULL),
(144, 73, 26, 'Back', 'Bent-Over Row - Supinated Grip', 'Neutral Gripr', '45u00b0  Incliner', 'H', 2, '7', '3011', '30 sec', 'Dumbbell', '5b4dfa455f8fe', NULL),
(145, 51, 18, 'Quadriceps', 'Split Squat', NULL, NULL, 'H', 3, '8-10', '3011', '15 sec', 'Barbell', '5b50b2c570681', NULL),
(146, 51, 18, 'Hamstrings', 'Kneeling Leg Curl - Dorsiflexed', NULL, NULL, 'H', 3, '8-10', '3011', '15 sec', NULL, '5b50b30c96bb0', NULL),
(147, 51, 18, 'Hamstrings', 'Prone Leg Curl - Poliquin', NULL, NULL, 'H', 3, '10', '3011', '60 sec', NULL, '5b50b34913ab2', NULL),
(149, 59, 20, 'Abs/Hip Flexors', 'Leg Lowering', 'Bilateral            r', NULL, 'H', 3, '10-12', '2011', '60 sec', NULL, '5b576eed4c8a9', NULL),
(152, 76, 20, 'Pectorals', 'DB Bench Press', 'Pronated Gripr', NULL, 'H', 3, '10', '2011', '15 sec', 'Dumbbell', '5b59a7d633478', NULL),
(153, 76, 20, 'Back', 'Chin-up - Mid Grip', 'Neutral Gripr', NULL, 'H', 3, '8-10', '2011', '90 sec', NULL, '5b59a837782f2', NULL),
(198, 105, 44, 'Pectorals', 'Incline DB Bench Press - Neutral Grip', '30u00b0 Incline      r', 'Pronated Gripr', 'H', 2, '8', '4011', '75 sec', 'TRX', '5b69eedaae476', NULL),
(199, 105, 44, 'Calves', 'Tibialis Anterior Flexion - Donkey Calf ', 'Wide Stance', NULL, 'ES', 4, '15 sec', 'maximal', '30 sec', 'Band', '5b69ef0bf07ce', NULL),
(200, 105, 44, 'Pectorals', 'Chest Dip', 'Roman Rings            r', 'Narrowr', 'H', 2, '8', '4011', '75 sec', NULL, '5b69ef278b8a5', NULL),
(201, 105, 44, 'Conditioning/Calisthenics', 'Lizard Crawl', NULL, NULL, 'ES', 4, '60 sec', 'slow', '30 sec', 'Battle Ropes', '5b69ef3244c60', NULL),
(202, 106, 45, 'Biceps', 'Prone EZ Bar Reverse Curl', '45u00b0  Incliner', '1.25 repsr', 'ES', 3, '20 sec', 'slow', '30 sec', 'Mid Pulley', '5b69ef71b3439', NULL),
(203, 106, 45, 'Abs/Hip Flexors', 'Plank', '4 pointr', NULL, 'H', 2, '8', '3011', '45 sec', 'Mid Pulley', '5b69ef9504fb9', NULL),
(204, 106, 45, 'Shoulders', 'Behind the Neck Press', 'Standing            ', NULL, 'ES', 3, '5 sec', 'maximal', '15 sec', NULL, '5b69efa8c5fb7', NULL),
(205, 106, 45, 'Neck', 'Neck Extension, Prone', 'Harness            r', NULL, 'ES', 1, '5 sec', 'maximal', '15 sec', 'Low Pulley', '5b69efb743c99', NULL),
(206, 107, 46, 'Back', 'Bent-Over Row - Pronated Grip', 'Pronated Gripr', '30u00b0  Incliner', 'H', 2, '8', '4011', '45 sec', 'Dumbbell', '5b69f2c61e917', NULL),
(207, 107, 46, 'Posterior Chain/Glutes', 'Goodmorning', 'Seated  Wide Stance          r', NULL, 'H', 1, '6', '2011', '15 sec', 'Swiss Ball', '5b69f2e6acfe9', NULL),
(208, 107, 46, 'Triceps', 'Kneeling Triceps Pressdown', 'Close Grip      r', 'Pronated   r', 'H', 3, '8', '3011', '45 sec', 'T-Grip Barbell', '5b69f2f9a5e8c', NULL),
(209, 108, 47, 'Back', 'Bent-Over Row - Pronated Grip', 'Pronated Gripr', '30u00b0  Incliner', 'ES', 1, '5 sec', 'maximal', '15 sec', 'Barbell', '5b69f34b67917', NULL),
(214, 110, 49, 'Back', 'Lat Pulldown - to Chest', 'Pronated Grip', 'Medium Grip', 'H', 3, '8-10', '3011', '15 sec', 'High Pulley', '5b6c9c7ca5a11', NULL),
(215, 110, 49, 'Pectorals', 'Incline DB Bench Press - Pronated Grip', '15 deg Incline', 'Close Gripr', 'H', 3, '8-10', '2011', '60 sec', 'Dumbbell', '5b6c9c7cbe1d0', NULL),
(216, 110, 49, 'Back', 'Seated Cable Row', 'Neutral Grip', NULL, 'H', 3, '10-12', '2011', '15 sec', 'Low Pulley', '5b6c9c7cc437d', NULL),
(217, 110, 49, 'Shoulders', 'Front Raise Neutral Grip DB', 'Uni-Lateralr', NULL, 'H', 3, '10-12', '2011', '60 sec', 'Kettlebell', '5b6c9c7cca5c7', NULL),
(219, 112, 50, 'Conditioning/Calisthenics', 'Rowing Machine', NULL, NULL, 'ES', 4, '200 meters', 'Moderate', '60 sec', NULL, '5b719bd36d0ab', NULL),
(220, 112, 50, 'Conditioning/Calisthenics', 'Burpees', NULL, NULL, 'SE', 3, '20-25', '1010', '60 sec', NULL, '5b719c67de6ef', NULL),
(221, 112, 50, 'Conditioning/Calisthenics', 'Airdyne', NULL, NULL, 'ES', 5, '15 sec', 'maximal', '45 sec', NULL, '5b719cc074ef5', NULL),
(222, 112, 50, 'Abs/Hip Flexors', 'Toes to Bar', NULL, NULL, 'H', 3, '10-12', '2011', '60 sec', NULL, '5b71a1b4ccf56', NULL),
(223, 113, 51, 'Abs/Hip Flexors', 'Abs Wheel Rollout', NULL, NULL, 'ES', 1, '5 sec', 'maximal', '15 sec', 'Low Pulley', '5b729ea27876f', NULL),
(236, 117, 54, 'Biceps', 'Incline DB Supinating Curl', '45u00b0  Incliner', 'Close Gripr', 'H', 3, '6', '3x2', '15 sec', 'EZ Bar', '5b73e133665b1', NULL),
(237, 118, 55, 'Pectorals', 'Incline Bench Press - Mid Grip', '30u00b0 Incline      r', 'Pronated', 'H', 4, '6-8', '2011', '90 sec', 'add Custom', '5b749c0057141', NULL),
(238, 118, 55, 'Back', 'Pull-up -  mid Grip', 'Pronated Gripr', 'Medium Gripr', 'H', 4, '6-8', '2011', '90 sec', NULL, '5b749c16e8efc', NULL),
(239, 118, 55, 'Pectorals', 'Chest Dip', 'Gironda            r', 'Mediumr', 'H', 3, '10-12', '2010', '15 sec', NULL, '5b749c20dfb67', NULL),
(240, 119, 55, 'Biceps', 'Scott EZ Bar Reverse-Grip Curl', '45u00b0  Incliner', 'Medium Gripr', 'MS', 3, '5', '40X1', '15 sec', 'High Pulley', '5b749f691921d', NULL),
(241, 120, 56, 'Abs/Hip Flexors', 'Abs Wheel Rollout', NULL, NULL, 'ES', 1, '5 sec', 'maximal', '30 sec', 'Low Pulley', '5b754ebd596d8', NULL),
(242, 118, 55, 'Back', 'Lat Pulldown - to Chest', 'Pronated Gripr', 'Medium Gripr', 'H', 3, '10-12', '2011', '15 sec', NULL, '5b7c190c90934', NULL),
(243, 0, 54, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '5b7eb30c82798', NULL),
(244, 121, 54, 'Biceps', 'Incline DB Curl', '30 deg Incline', '1.25 reps', 'H', 1, '7-9', '32', 'rest sample', NULL, '5b7eb31a34572', NULL),
(245, 122, 54, 'Abs/Hip Flexors', 'Plank', 'Bent-Knee', NULL, 'MS', 1, '3', '3x3x3', '10sec', 'Mid Pulley', '5b8e2f7c2ffce', NULL),
(246, 122, 54, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '5b8e2fa573c51', NULL),
(247, 122, 54, 'Abs/Hip Flexors', 'Plank', 'Bent-Knee', NULL, 'MS', 1, '3', '3x3x3', '10sec', 'Mid Pulley', '5b8e2fab9dc9a', NULL),
(249, 124, 58, 'Abs/Hip Flexors', 'Abs Wheel Rollout', NULL, NULL, 'H', 2, '7', '1111', '6min', 'Low Pulley', '5b8e31f7673f2', NULL),
(250, 125, 59, 'Abs/Hip Flexors', 'Side Bridge', 'Bent-Knee', NULL, 'ES', 1, '5 sec', 'Test Tempo', '30 mins', 'High Pulley', '5b8e90d8c824a', 'A1'),
(251, 126, 60, 'Quadriceps', 'Squat Wide Stance', NULL, NULL, 'MS', 5, '5', '30X1', '90 sec', 'Barbell', '5b8ea0f9652c6', 'A1'),
(252, 126, 60, 'Hamstrings', 'Prone Leg Curl - Poliquin', NULL, NULL, 'MS', 5, '5', '30X1', '120 sec', NULL, '5b8ea18c5d830', 'A2'),
(253, 126, 60, 'Pectorals', 'Bench Press - Mid Grip', NULL, 'Pronated', 'MS', 5, '5', '30X1', '90 sec', 'Barbell', '5b8ea1cb5f8bb', 'B1'),
(254, 126, 60, 'Back', 'Chin-up - Mid Grip', 'Supinated Grip', NULL, 'MS', 5, '5', '30X1', '90 sec', NULL, '5b8ea1fe114f1', 'B2'),
(255, 126, 60, 'Mobility', 'Shoulder/Chest - Shoulder CAR', NULL, NULL, 'H', 3, '6', '1010', '15 sec', NULL, '5b8ea24a9d2fe', NULL),
(256, 127, 60, 'Posterior Chain/Glutes', 'Deadlift', 'Clean Grip', 'Podium', 'MS', 5, '5', '30X1', '3 min', 'Barbell', '5b8ea2cdbc06b', NULL),
(257, 127, 60, 'Shoulders', 'Shoulder Press Seated Neutral DB', NULL, NULL, 'MS', 5, '5', '30X1', '90 sec', NULL, '5b8ea351eb8e8', NULL),
(258, 127, 60, 'Back', 'One Arm DB Row - Split Stance', 'Neutral Grip', NULL, 'MS', 5, '5', NULL, '120 sec', NULL, '5b8ea38fc329c', NULL),
(259, 128, 60, 'Posterior Chain/Glutes', 'Side Lying Hip Abduction, Bent Knee', NULL, NULL, 'H', 3, '8-10', '2011', '30 sec', NULL, '5b8ea3c457ea4', NULL),
(260, 128, 60, 'Quadriceps', 'Split Squat', NULL, NULL, 'MS', 5, '5', '20X1', '90 sec', 'Barbell', '5b8ea41e3699f', NULL),
(261, 128, 60, 'Hamstrings', 'Kneeling Leg Curl - Poliquin', NULL, NULL, 'MS', 5, '5', '20X1', '90 sec', NULL, '5b8ea456395c3', NULL),
(262, 128, 60, 'Pectorals', 'Incline DB Bench Press - Rotating Grip', '45 deg Incline', NULL, 'MS', 5, '5', '30X1', '90 sec', 'Dumbbell', '5b8ea49387ffd', NULL),
(263, 128, 60, 'Back', 'Pull-up -  mid Grip', 'Pronated Grip', NULL, 'MS', 5, '5', '30X1', '90 sec', NULL, '5b8ea4d8b3d41', NULL),
(264, 129, 59, 'Plyometrics', 'Box Jump', NULL, NULL, 'ES', 1, '10 sec', 'submaximal', '30 sec', NULL, '5b90f90b6861f', NULL),
(265, 130, 61, 'Neck', 'Neck Flexion - Machine', 'Towel', NULL, 'ES', 3, '10 sec', 'slow', NULL, 'Bands', '5b9139ed42e5f', NULL),
(266, 131, 62, 'Biceps', 'Incline DB Curl', '30 deg Incline', 'Offset Grip', 'ES', 2, '5 sec', 'maximal', '15 sec', 'EZ Bar', '5b91748975eb3', NULL),
(267, 132, 63, 'Biceps', 'Incline DB Curl', '30 deg Incline', 'Offset Grip', 'ES', 1, '5 sec', 'maximal', '15 sec', 'EZ Bar', '5b9174bbb0c42', NULL),
(268, 133, 64, 'Back', 'Lat Pulldown - to Chest', 'Pronated Grip', 'Medium Grip', 'H', 3, '8-10', '3011', '15 sec', 'High Pulley', '5b9179703f10b', 'A2'),
(269, 133, 64, 'Pectorals', 'Incline DB Bench Press - Pronated Grip', '15 deg Incline', 'Close Gripr', 'H', 3, '8-10', '2011', '60 sec', 'Dumbbell', '5b91797058d53', 'A3'),
(270, 133, 64, 'Back', 'Seated Cable Row', 'Neutral Grip', NULL, 'H', 3, '10-12', '2011', '15 sec', 'Low Pulley', '5b9179705fb42', NULL),
(271, 133, 64, 'Shoulders', 'Front Raise Neutral Grip DB', 'Uni-Lateralr', NULL, 'H', 3, '10-12', '2011', '60 sec', 'Kettlebell', '5b91797072061', 'A1'),
(272, 125, 59, 'Back', 'Bent-Over Row - Elbows Out', 'Pronated Grip', '45 deg Incline', 'ES', 1, '10 sec', 'maximal', '15 sec', 'Dumbbell', '5b976dd11a633', 'A2'),
(273, 134, 65, 'Back', 'Bent-Over Row - Elbows Out', 'Semi-Supinated Grip', '60 deg Incline', 'H', 2, '9', '3011', '60 sec', 'T-Grip Barbell', '5b977930a91d4', 'A1'),
(274, 134, 65, 'Back', 'Bent-Over Row - Elbows Out', 'Semi-Supinated Grip', '60 deg Incline', 'H', 2, '9', '3011', '60 sec', 'T-Grip Barbell', '5b9778fc29d89', 'A2'),
(275, 134, 65, 'Back', 'Bent-Over Row - Elbows Out', 'Semi-Supinated Grip', '60 deg Incline', 'H', 2, '9', '3011', '60 sec', 'T-Grip Barbell', '5b9779329e454', 'A3'),
(276, 134, 65, 'Hamstrings', 'Swiss Ball Leg Curl - 2 up 1 down', 'Dorsiflexed', NULL, 'MS', 1, '4', '30X1', '45 sec', 'Medicine Ball', '5b977986cf292', 'B1'),
(277, 134, 65, 'Hamstrings', 'Swiss Ball Leg Curl - 2 up 1 down', 'Dorsiflexed', NULL, 'MS', 1, '4', '30X1', '45 sec', 'Medicine Ball', '5b97796817b8e', 'B2'),
(278, 135, 65, 'Back', 'Bent-Over Row - Elbows Out', 'Semi-Supinated Grip', '60 deg Incline', 'H', 2, '9', '3011', '60 sec', 'T-Grip Barbell', '5b9779bb846e6', 'A1'),
(279, 135, 65, 'Back', 'Bent-Over Row - Elbows Out', 'Semi-Supinated Grip', '60 deg Incline', 'H', 2, '9', '3011', '60 sec', 'T-Grip Barbell', '5b9779bb846f0', 'A2'),
(280, 135, 65, 'Back', 'Bent-Over Row - Elbows Out', 'Semi-Supinated Grip', '60 deg Incline', 'H', 2, '9', '3011', '60 sec', 'T-Grip Barbell', '5b9779bb846f0', 'A3'),
(281, 135, 65, 'Hamstrings', 'Swiss Ball Leg Curl - 2 up 1 down', 'Dorsiflexed', NULL, 'MS', 1, '4', '30X1', '45 sec', 'Medicine Ball', '5b9779bb846f0', 'B1'),
(282, 135, 65, 'Hamstrings', 'Swiss Ball Leg Curl - 2 up 1 down', 'Dorsiflexed', NULL, 'MS', 1, '4', '30X1', '45 sec', 'Medicine Ball', '5b9779bb846f1', 'B2'),
(283, 136, 66, 'General', 'Jumping Jacks', 'Test2', 'Test2', 'SE', 2, '35-40', '2010', '60 sec', 'Any', '5b97cbfcebbdf', 'A1'),
(284, 136, 66, 'Strongman', 'Axle Deadlift', NULL, NULL, 'SE', 2, '35-40', NULL, '60 sec', NULL, '5b97cbfac5149', 'A2'),
(285, 136, 66, 'Pectorals', NULL, NULL, NULL, 'SE', 2, '35-40', '2010', '60 sec', NULL, '5b97cbcddc8aa', 'B1'),
(286, 136, 66, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '5b97cda7bed09', 'B2'),
(287, 136, 66, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '5b97cdc24a2d5', 'B3');

-- --------------------------------------------------------

--
-- Table structure for table `workout_exercise_options_tbl`
--

CREATE TABLE `workout_exercise_options_tbl` (
  `id` int(11) NOT NULL,
  `part` varchar(255) NOT NULL,
  `options` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `workout_exercise_options_tbl`
--

INSERT INTO `workout_exercise_options_tbl` (`id`, `part`, `options`) VALUES
(1, 'Abs/Hip Flexors', '[{\"type\":\"Abs Wheel Rollout\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Dumbbell\",\"Weighted\",\"Medicine Ball\",\"Kettlebell\",\"Swiss Ball\",\"AbMat\",\"Slant Bench\",\"Ab Bench\"],\"video_link\":\"https://youtu.be/ZhM2eKqD3Pw\"},{\"type\":\"Plank\",\"exercise_1\":[\"Bent-Knee\",\"4 point\",\"3 point\",\"2 point\",\"Dynamic\"],\"exercise_2\":[],\"implementation_options\":[\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Dumbbell\",\"Weighted\",\"Medicine Ball\",\"Kettlebell\",\"Swiss Ball\",\"AbMat\",\"Slant Bench\",\"Ab Bench\"],\"video_link\":\"https://youtu.be/kWO-7kTZ6jI\"},{\"type\":\"Side Bridge\",\"exercise_1\":[\"Bent-Knee\",\"Side\",\"Rotate and reach\"],\"exercise_2\":[],\"implementation_options\":[\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Dumbbell\",\"Weighted\",\"Medicine Ball\",\"Kettlebell\",\"Swiss Ball\",\"AbMat\",\"Slant Bench\",\"Ab Bench\"],\"video_link\":\"https://youtu.be/9yPp69SdGjw\"},{\"type\":\"Core Row\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Dumbbell\",\"Weighted\",\"Medicine Ball\",\"Kettlebell\",\"Swiss Ball\",\"AbMat\",\"Slant Bench\",\"Ab Bench\"],\"video_link\":\"https://youtu.be/ElJTvQMuOGI\"},{\"type\":\"Kneeling Cable Crunch\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Dumbbell\",\"Weighted\",\"Medicine Ball\",\"Kettlebell\",\"Swiss Ball\",\"AbMat\",\"Slant Bench\",\"Ab Bench\"],\"video_link\":\"https://youtu.be/OsPA6kH1500\"},{\"type\":\"AbMat Crunch\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Dumbbell\",\"Weighted\",\"Medicine Ball\",\"Kettlebell\",\"Swiss Ball\",\"AbMat\",\"Slant Bench\",\"Ab Bench\"],\"video_link\":\"https://youtu.be/4Hx_MY4aF7w\"},{\"type\":\"Crunch\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Dumbbell\",\"Weighted\",\"Medicine Ball\",\"Kettlebell\",\"Swiss Ball\",\"AbMat\",\"Slant Bench\",\"Ab Bench\"],\"video_link\":\"https://youtu.be/Lt0BOo0UjhA\"},{\"type\":\"Swiss Ball Crunch\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Dumbbell\",\"Weighted\",\"Medicine Ball\",\"Kettlebell\",\"Swiss Ball\",\"AbMat\",\"Slant Bench\",\"Ab Bench\"],\"video_link\":\"https://youtu.be/lCHmHnPO6eQ\"},{\"type\":\"Supine Crossover Crunch\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Dumbbell\",\"Weighted\",\"Medicine Ball\",\"Kettlebell\",\"Swiss Ball\",\"AbMat\",\"Slant Bench\",\"Ab Bench\"],\"video_link\":\"https://youtu.be/-vQBxoLbGms\"},{\"type\":\"Low Cable Pull-in\",\"exercise_1\":[\"Bilateral\",\"Unilateral\"],\"exercise_2\":[],\"implementation_options\":[\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Dumbbell\",\"Weighted\",\"Medicine Ball\",\"Kettlebell\",\"Swiss Ball\",\"AbMat\",\"Slant Bench\",\"Ab Bench\"],\"video_link\":\"https://youtu.be/B3tU3N17ro8\"},{\"type\":\"Garhammer Leg Raise, Hanging\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Dumbbell\",\"Weighted\",\"Medicine Ball\",\"Kettlebell\",\"Swiss Ball\",\"AbMat\",\"Slant Bench\",\"Ab Bench\"],\"video_link\":\"https://youtu.be/gpt6g6YSJ-Q\"},{\"type\":\"Situp\",\"exercise_1\":[\"Bent-Knee, Flat\",\"Bent-Knee, decline\"],\"exercise_2\":[],\"implementation_options\":[\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Dumbbell\",\"Weighted\",\"Medicine Ball\",\"Kettlebell\",\"Swiss Ball\",\"AbMat\",\"Slant Bench\",\"Ab Bench\"],\"video_link\":\"https://youtu.be/RCVyyfnOmdc\"},{\"type\":\"GH Situp\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Dumbbell\",\"Weighted\",\"Medicine Ball\",\"Kettlebell\",\"Swiss Ball\",\"AbMat\",\"Slant Bench\",\"Ab Bench\"],\"video_link\":\"https://youtu.be/QPvH-8Sym70\"},{\"type\":\"Supine Hip Flexion\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Dumbbell\",\"Weighted\",\"Medicine Ball\",\"Kettlebell\",\"Swiss Ball\",\"AbMat\",\"Slant Bench\",\"Ab Bench\"],\"video_link\":\"https://youtu.be/k7uvYxJLg0I\"},{\"type\":\"Standing Cable Hip Flexion\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Dumbbell\",\"Weighted\",\"Medicine Ball\",\"Kettlebell\",\"Swiss Ball\",\"AbMat\",\"Slant Bench\",\"Ab Bench\"],\"video_link\":\"https://youtu.be/onTESd44jV8\"},{\"type\":\"Prone Swiss Ball Pike\",\"exercise_1\":[\"Unilateral\"],\"exercise_2\":[],\"implementation_options\":[\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Dumbbell\",\"Weighted\",\"Medicine Ball\",\"Kettlebell\",\"Swiss Ball\",\"AbMat\",\"Slant Bench\",\"Ab Bench\"],\"video_link\":\"https://youtu.be/WaFyQyUxkuk\"},{\"type\":\"Seated Knee Pull-in\",\"exercise_1\":[\"Bench\"],\"exercise_2\":[],\"implementation_options\":[\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Dumbbell\",\"Weighted\",\"Medicine Ball\",\"Kettlebell\",\"Swiss Ball\",\"AbMat\",\"Slant Bench\",\"Ab Bench\"],\"video_link\":\"https://youtu.be/jRftmWX9wRY\"},{\"type\":\"Prone TRX Knee Pull-In\",\"exercise_1\":[\"Swiss Ball\"],\"exercise_2\":[],\"implementation_options\":[\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Dumbbell\",\"Weighted\",\"Medicine Ball\",\"Kettlebell\",\"Swiss Ball\",\"AbMat\",\"Slant Bench\",\"Ab Bench\"],\"video_link\":\"https://youtu.be/YPUu7RvvvlI\"},{\"type\":\"Land Mine \",\"exercise_1\":[\"Rotation\"],\"exercise_2\":[],\"implementation_options\":[\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Dumbbell\",\"Weighted\",\"Medicine Ball\",\"Kettlebell\",\"Swiss Ball\",\"AbMat\",\"Slant Bench\",\"Ab Bench\"],\"video_link\":\"https://youtu.be/_GqmUk4ping\"},{\"type\":\"Standing Side Flexion\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Dumbbell\",\"Weighted\",\"Medicine Ball\",\"Kettlebell\",\"Swiss Ball\",\"AbMat\",\"Slant Bench\",\"Ab Bench\"],\"video_link\":\"https://youtu.be/C0qA6UsICXQ\"},{\"type\":\"45 Degree Side Flexion\",\"exercise_1\":[\"Swiss Ball\"],\"exercise_2\":[],\"implementation_options\":[\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Dumbbell\",\"Weighted\",\"Medicine Ball\",\"Kettlebell\",\"Swiss Ball\",\"AbMat\",\"Slant Bench\",\"Ab Bench\"],\"video_link\":\"https://youtu.be/iNSPDLvFyak\"},{\"type\":\"Upright Leg Raise\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Dumbbell\",\"Weighted\",\"Medicine Ball\",\"Kettlebell\",\"Swiss Ball\",\"AbMat\",\"Slant Bench\",\"Ab Bench\"],\"video_link\":\"https://youtu.be/RXp68rG4sSg\"},{\"type\":\"Hanging Leg Raise\",\"exercise_1\":[\"Twisting\",\"Straight Leg\",\"Bent-Knee\"],\"exercise_2\":[],\"implementation_options\":[\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Dumbbell\",\"Weighted\",\"Medicine Ball\",\"Kettlebell\",\"Swiss Ball\",\"AbMat\",\"Slant Bench\",\"Ab Bench\"],\"video_link\":\"https://youtu.be/qEb8CY-rdSU\"},{\"type\":\"Leg Lowering\",\"exercise_1\":[\"Bilateral\",\"Alternating\"],\"exercise_2\":[],\"implementation_options\":[\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Dumbbell\",\"Weighted\",\"Medicine Ball\",\"Kettlebell\",\"Swiss Ball\",\"AbMat\",\"Slant Bench\",\"Ab Bench\"],\"video_link\":\"https://youtu.be/veGOzWBKUrc\"},{\"type\":\"Reverse Crunch\",\"exercise_1\":[\"Incline\",\"Flat\",\"AbMat\"],\"exercise_2\":[],\"implementation_options\":[\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Dumbbell\",\"Weighted\",\"Medicine Ball\",\"Kettlebell\",\"Swiss Ball\",\"AbMat\",\"Slant Bench\",\"Ab Bench\"],\"video_link\":\"https://youtu.be/TwAIrUvCdDo\"},{\"type\":\"Toes to Bar\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Dumbbell\",\"Weighted\",\"Medicine Ball\",\"Kettlebell\",\"Swiss Ball\",\"AbMat\",\"Slant Bench\",\"Ab Bench\"],\"video_link\":\"https://youtu.be/3Owcn1KwZB4\"},{\"type\":\"Supine Windsheild Wipers\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Dumbbell\",\"Weighted\",\"Medicine Ball\",\"Kettlebell\",\"Swiss Ball\",\"AbMat\",\"Slant Bench\",\"Ab Bench\"],\"video_link\":\"https://youtu.be/FuBLXTaB4E0\"},{\"type\":\"Cable Woodchop\",\"exercise_1\":[\"Standing\"],\"exercise_2\":[\"Horizontal\"],\"implementation_options\":[\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Dumbbell\",\"Weighted\",\"Medicine Ball\",\"Kettlebell\",\"Swiss Ball\",\"AbMat\",\"Slant Bench\",\"Ab Bench\"],\"video_link\":\"https://youtu.be/MxvE2k6BLmA\"},{\"type\":\"Seated Cable Woodchop\",\"exercise_1\":[\"Kneeling\"],\"exercise_2\":[],\"implementation_options\":[\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Dumbbell\",\"Weighted\",\"Medicine Ball\",\"Kettlebell\",\"Swiss Ball\",\"AbMat\",\"Slant Bench\",\"Ab Bench\"],\"video_link\":\"https://youtu.be/hlzmmatZrfg\"},{\"type\":\"Kneeling Cable Woodchop\",\"exercise_1\":[\"Seated\"],\"exercise_2\":[],\"implementation_options\":[\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Dumbbell\",\"Weighted\",\"Medicine Ball\",\"Kettlebell\",\"Swiss Ball\",\"AbMat\",\"Slant Bench\",\"Ab Bench\"],\"video_link\":\"https://youtu.be/3ZIPmD1m_0k\"},{\"type\":\"Cable Reverse Woodchop\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Dumbbell\",\"Weighted\",\"Medicine Ball\",\"Kettlebell\",\"Swiss Ball\",\"AbMat\",\"Slant Bench\",\"Ab Bench\"],\"video_link\":\"https://youtu.be/tCIfz4ud7KM\"},{\"type\":\"Russian Twist\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Dumbbell\",\"Weighted\",\"Medicine Ball\",\"Kettlebell\",\"Swiss Ball\",\"AbMat\",\"Slant Bench\",\"Ab Bench\"],\"video_link\":\"https://youtu.be/L5q8GsNy2A8\"},{\"type\":\"Forward Ball Rollout\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Dumbbell\",\"Weighted\",\"Medicine Ball\",\"Kettlebell\",\"Swiss Ball\",\"AbMat\",\"Slant Bench\",\"Ab Bench\"],\"video_link\":\"https://youtu.be/oVXaLr2YpOM\"},{\"type\":\"TRX  Kneeling Rollout\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Dumbbell\",\"Weighted\",\"Medicine Ball\",\"Kettlebell\",\"Swiss Ball\",\"AbMat\",\"Slant Bench\",\"Ab Bench\"],\"video_link\":\"https://youtu.be/KjC0ghYVH4E\"},{\"type\":\"TRX Crunch\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Dumbbell\",\"Weighted\",\"Medicine Ball\",\"Kettlebell\",\"Swiss Ball\",\"AbMat\",\"Slant Bench\",\"Ab Bench\"],\"video_link\":\"https://youtu.be/LxdwG_zPdnc\"},{\"type\":\"Stir The Pot\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Dumbbell\",\"Weighted\",\"Medicine Ball\",\"Kettlebell\",\"Swiss Ball\",\"AbMat\",\"Slant Bench\",\"Ab Bench\"],\"video_link\":\"https://youtu.be/z3-vc8u9qSY\"}]'),
(2, 'Back', '[{\"type\":\"Bent-Over Row - Pronated Grip\",\"exercise_1\":[\"Pronated Grip\",\"Semi-Pronated Grip\",\"Neutral Grip\",\"Semi-Supinated Grip\",\"Supinated Grip\",\"Supinating Grip\"],\"exercise_2\":[\"30 deg Incline\",\"45 deg Incline\",\"60 deg Incline\",\"75 deg Incline\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Barbell\",\"Football Bar\",\"Thick Barbell\",\"TRX\",\"Kettlebell\",\"EZ Bar\",\"Log Bar\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Thick Dumbbell\",\"Cambered Bar\",\"Fat Gripz\",\"Stirrup Handles\",\"Rope Attachment\",\"add Custom\"],\"video_link\":\"https://youtu.be/g9TcmxLOd7c\"},{\"type\":\"Bent-Over Row - Elbows Out\",\"exercise_1\":[\"Pronated Grip\",\"Semi-Pronated Grip\",\"Neutral Grip\",\"Semi-Supinated Grip\",\"Supinated Grip\",\"Supinating Grip\"],\"exercise_2\":[\"30 deg Incline\",\"45 deg Incline\",\"60 deg Incline\",\"75 deg Incline\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Barbell\",\"Football Bar\",\"Thick Barbell\",\"TRX\",\"Kettlebell\",\"EZ Bar\",\"Log Bar\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Thick Dumbbell\",\"Cambered Bar\",\"Fat Gripz\",\"Stirrup Handles\",\"Rope Attachment\",\"add Custom\"],\"video_link\":\"https://youtu.be/74_vWr-JKcs\"},{\"type\":\"Bent-Over Row - Supinated Grip\",\"exercise_1\":[\"Pronated Grip\",\"Semi-Pronated Grip\",\"Neutral Grip\",\"Semi-Supinated Grip\",\"Supinated Grip\",\"Supinating Grip\"],\"exercise_2\":[\"30 deg Incline\",\"45 deg Incline\",\"60 deg Incline\",\"75 deg Incline\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Barbell\",\"Football Bar\",\"Thick Barbell\",\"TRX\",\"Kettlebell\",\"EZ Bar\",\"Log Bar\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Thick Dumbbell\",\"Cambered Bar\",\"Fat Gripz\",\"Stirrup Handles\",\"Rope Attachment\",\"add Custom\"],\"video_link\":\"https://youtu.be/6aldTWpwDew\"},{\"type\":\"Bent-Over Row - Neutral grip\",\"exercise_1\":[\"Pronated Grip\",\"Semi-Pronated Grip\",\"Neutral Grip\",\"Semi-Supinated Grip\",\"Supinated Grip\",\"Supinating Grip\"],\"exercise_2\":[\"30 deg Incline\",\"45 deg Incline\",\"60 deg Incline\",\"75 deg Incline\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Barbell\",\"Football Bar\",\"Thick Barbell\",\"TRX\",\"Kettlebell\",\"EZ Bar\",\"Log Bar\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Thick Dumbbell\",\"Cambered Bar\",\"Fat Gripz\",\"Stirrup Handles\",\"Rope Attachment\",\"add Custom\"],\"video_link\":\"https://youtu.be/5hIHWT2p3Us\"},{\"type\":\"Bent-Over DB Row - Neutral\",\"exercise_1\":[\"Pronated Grip\",\"Semi-Pronated Grip\",\"Neutral Grip\",\"Semi-Supinated Grip\",\"Supinated Grip\",\"Supinating Grip\"],\"exercise_2\":[\"30 deg Incline\",\"45 deg Incline\",\"60 deg Incline\",\"75 deg Incline\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Barbell\",\"Football Bar\",\"Thick Barbell\",\"TRX\",\"Kettlebell\",\"EZ Bar\",\"Log Bar\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Thick Dumbbell\",\"Cambered Bar\",\"Fat Gripz\",\"Stirrup Handles\",\"Rope Attachment\",\"add Custom\"],\"video_link\":\"https://youtu.be/SW4ZFr1p5QU\"},{\"type\":\"Bent-Over DB Row - Supinating\",\"exercise_1\":[\"Pronated Grip\",\"Semi-Pronated Grip\",\"Neutral Grip\",\"Semi-Supinated Grip\",\"Supinated Grip\",\"Supinating Grip\"],\"exercise_2\":[\"30 deg Incline\",\"45 deg Incline\",\"60 deg Incline\",\"75 deg Incline\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Barbell\",\"Football Bar\",\"Thick Barbell\",\"TRX\",\"Kettlebell\",\"EZ Bar\",\"Log Bar\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Thick Dumbbell\",\"Cambered Bar\",\"Fat Gripz\",\"Stirrup Handles\",\"Rope Attachment\",\"add Custom\"],\"video_link\":\"https://youtu.be/88sL8mzlYJw\"},{\"type\":\"Bent-Over DB Row - Elbows Out\",\"exercise_1\":[\"Pronated Grip\",\"Semi-Pronated Grip\",\"Neutral Grip\",\"Semi-Supinated Grip\",\"Supinated Grip\",\"Supinating Grip\"],\"exercise_2\":[\"30 deg Incline\",\"45 deg Incline\",\"60 deg Incline\",\"75 deg Incline\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Barbell\",\"Football Bar\",\"Thick Barbell\",\"TRX\",\"Kettlebell\",\"EZ Bar\",\"Log Bar\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Thick Dumbbell\",\"Cambered Bar\",\"Fat Gripz\",\"Stirrup Handles\",\"Rope Attachment\",\"add Custom\"],\"video_link\":\"https://youtu.be/9pvwe83KF_A\"},{\"type\":\"Chin-up - Close Grip\",\"exercise_1\":[\"Pronated Grip\",\"Semi-Pronated Grip\",\"Neutral Grip\",\"Semi-Supinated Grip\",\"Supinated Grip\",\"Supinating Grip\"],\"exercise_2\":[\"30 deg Incline\",\"45 deg Incline\",\"60 deg Incline\",\"75 deg Incline\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Barbell\",\"Football Bar\",\"Thick Barbell\",\"TRX\",\"Kettlebell\",\"EZ Bar\",\"Log Bar\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Thick Dumbbell\",\"Cambered Bar\",\"Fat Gripz\",\"Stirrup Handles\",\"Rope Attachment\",\"add Custom\"],\"video_link\":\"https://youtu.be/-blNXRaCyt8\"},{\"type\":\"Chin-up - Mid Grip\",\"exercise_1\":[\"Pronated Grip\",\"Semi-Pronated Grip\",\"Neutral Grip\",\"Semi-Supinated Grip\",\"Supinated Grip\",\"Supinating Grip\"],\"exercise_2\":[\"30 deg Incline\",\"45 deg Incline\",\"60 deg Incline\",\"75 deg Incline\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Barbell\",\"Football Bar\",\"Thick Barbell\",\"TRX\",\"Kettlebell\",\"EZ Bar\",\"Log Bar\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Thick Dumbbell\",\"Cambered Bar\",\"Fat Gripz\",\"Stirrup Handles\",\"Rope Attachment\",\"add Custom\"],\"video_link\":\"https://youtu.be/wr8gC2th23s\"},{\"type\":\"Chin-up - Wide Grip\",\"exercise_1\":[\"Pronated Grip\",\"Semi-Pronated Grip\",\"Neutral Grip\",\"Semi-Supinated Grip\",\"Supinated Grip\",\"Supinating Grip\"],\"exercise_2\":[\"30 deg Incline\",\"45 deg Incline\",\"60 deg Incline\",\"75 deg Incline\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Barbell\",\"Football Bar\",\"Thick Barbell\",\"TRX\",\"Kettlebell\",\"EZ Bar\",\"Log Bar\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Thick Dumbbell\",\"Cambered Bar\",\"Fat Gripz\",\"Stirrup Handles\",\"Rope Attachment\",\"add Custom\"],\"video_link\":\"https://youtu.be/PYcBRn8LRmU\"},{\"type\":\"Chin-up - Neutral - Mid Grip\",\"exercise_1\":[\"Pronated Grip\",\"Semi-Pronated Grip\",\"Neutral Grip\",\"Semi-Supinated Grip\",\"Supinated Grip\",\"Supinating Grip\"],\"exercise_2\":[\"30 deg Incline\",\"45 deg Incline\",\"60 deg Incline\",\"75 deg Incline\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Barbell\",\"Football Bar\",\"Thick Barbell\",\"TRX\",\"Kettlebell\",\"EZ Bar\",\"Log Bar\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Thick Dumbbell\",\"Cambered Bar\",\"Fat Gripz\",\"Stirrup Handles\",\"Rope Attachment\",\"add Custom\"],\"video_link\":\"https://youtu.be/Vi6WQZlOExI\"},{\"type\":\"Chin-up - Sternum - Neutral Grip\",\"exercise_1\":[\"Pronated Grip\",\"Semi-Pronated Grip\",\"Neutral Grip\",\"Semi-Supinated Grip\",\"Supinated Grip\",\"Supinating Grip\"],\"exercise_2\":[\"30 deg Incline\",\"45 deg Incline\",\"60 deg Incline\",\"75 deg Incline\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Barbell\",\"Football Bar\",\"Thick Barbell\",\"TRX\",\"Kettlebell\",\"EZ Bar\",\"Log Bar\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Thick Dumbbell\",\"Cambered Bar\",\"Fat Gripz\",\"Stirrup Handles\",\"Rope Attachment\",\"add Custom\"],\"video_link\":\"https://youtu.be/ocK465vF5GI\"},{\"type\":\"Chin-up - Side to Side - Wide Neutral\",\"exercise_1\":[\"Pronated Grip\",\"Semi-Pronated Grip\",\"Neutral Grip\",\"Semi-Supinated Grip\",\"Supinated Grip\",\"Supinating Grip\"],\"exercise_2\":[\"30 deg Incline\",\"45 deg Incline\",\"60 deg Incline\",\"75 deg Incline\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Barbell\",\"Football Bar\",\"Thick Barbell\",\"TRX\",\"Kettlebell\",\"EZ Bar\",\"Log Bar\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Thick Dumbbell\",\"Cambered Bar\",\"Fat Gripz\",\"Stirrup Handles\",\"Rope Attachment\",\"add Custom\"],\"video_link\":\"https://youtu.be/D52gxGlo8FU\"},{\"type\":\"Front Lever\",\"exercise_1\":[\"Pronated Grip\",\"Semi-Pronated Grip\",\"Neutral Grip\",\"Semi-Supinated Grip\",\"Supinated Grip\",\"Supinating Grip\"],\"exercise_2\":[\"30 deg Incline\",\"45 deg Incline\",\"60 deg Incline\",\"75 deg Incline\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Barbell\",\"Football Bar\",\"Thick Barbell\",\"TRX\",\"Kettlebell\",\"EZ Bar\",\"Log Bar\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Thick Dumbbell\",\"Cambered Bar\",\"Fat Gripz\",\"Stirrup Handles\",\"Rope Attachment\",\"add Custom\"],\"video_link\":\"https://youtu.be/XF8sAc6nMa8\"},{\"type\":\"Row - Torso Trainer\",\"exercise_1\":[\"Pronated Grip\",\"Semi-Pronated Grip\",\"Neutral Grip\",\"Semi-Supinated Grip\",\"Supinated Grip\",\"Supinating Grip\"],\"exercise_2\":[\"30 deg Incline\",\"45 deg Incline\",\"60 deg Incline\",\"75 deg Incline\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Barbell\",\"Football Bar\",\"Thick Barbell\",\"TRX\",\"Kettlebell\",\"EZ Bar\",\"Log Bar\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Thick Dumbbell\",\"Cambered Bar\",\"Fat Gripz\",\"Stirrup Handles\",\"Rope Attachment\",\"add Custom\"],\"video_link\":\"https://youtu.be/dIkyjn4vPHQ\"},{\"type\":\"Row - Machine\",\"exercise_1\":[\"Pronated Grip\",\"Semi-Pronated Grip\",\"Neutral Grip\",\"Semi-Supinated Grip\",\"Supinated Grip\",\"Supinating Grip\"],\"exercise_2\":[\"30 deg Incline\",\"45 deg Incline\",\"60 deg Incline\",\"75 deg Incline\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Barbell\",\"Football Bar\",\"Thick Barbell\",\"TRX\",\"Kettlebell\",\"EZ Bar\",\"Log Bar\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Thick Dumbbell\",\"Cambered Bar\",\"Fat Gripz\",\"Stirrup Handles\",\"Rope Attachment\",\"add Custom\"],\"video_link\":\"\"},{\"type\":\"One Arm DB Row - Split Stance\",\"exercise_1\":[\"Pronated Grip\",\"Semi-Pronated Grip\",\"Neutral Grip\",\"Semi-Supinated Grip\",\"Supinated Grip\",\"Supinating Grip\"],\"exercise_2\":[\"30 deg Incline\",\"45 deg Incline\",\"60 deg Incline\",\"75 deg Incline\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Barbell\",\"Football Bar\",\"Thick Barbell\",\"TRX\",\"Kettlebell\",\"EZ Bar\",\"Log Bar\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Thick Dumbbell\",\"Cambered Bar\",\"Fat Gripz\",\"Stirrup Handles\",\"Rope Attachment\",\"add Custom\"],\"video_link\":\"https://youtu.be/Gmuk-vmGGlY\"},{\"type\":\"One Arm DB Row - Feet Squared\",\"exercise_1\":[\"Pronated Grip\",\"Semi-Pronated Grip\",\"Neutral Grip\",\"Semi-Supinated Grip\",\"Supinated Grip\",\"Supinating Grip\"],\"exercise_2\":[\"30 deg Incline\",\"45 deg Incline\",\"60 deg Incline\",\"75 deg Incline\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Barbell\",\"Football Bar\",\"Thick Barbell\",\"TRX\",\"Kettlebell\",\"EZ Bar\",\"Log Bar\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Thick Dumbbell\",\"Cambered Bar\",\"Fat Gripz\",\"Stirrup Handles\",\"Rope Attachment\",\"add Custom\"],\"video_link\":\"https://youtu.be/EY6lVPnxk_Q\"},{\"type\":\"One Arm DB Row - Ipsilateral Split Stance\",\"exercise_1\":[\"Pronated Grip\",\"Semi-Pronated Grip\",\"Neutral Grip\",\"Semi-Supinated Grip\",\"Supinated Grip\",\"Supinating Grip\"],\"exercise_2\":[\"30 deg Incline\",\"45 deg Incline\",\"60 deg Incline\",\"75 deg Incline\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Barbell\",\"Football Bar\",\"Thick Barbell\",\"TRX\",\"Kettlebell\",\"EZ Bar\",\"Log Bar\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Thick Dumbbell\",\"Cambered Bar\",\"Fat Gripz\",\"Stirrup Handles\",\"Rope Attachment\",\"add Custom\"],\"video_link\":\"https://youtu.be/V0LuJtsodkY\"},{\"type\":\"One Arm DB Arc Row\",\"exercise_1\":[\"Pronated Grip\",\"Semi-Pronated Grip\",\"Neutral Grip\",\"Semi-Supinated Grip\",\"Supinated Grip\",\"Supinating Grip\"],\"exercise_2\":[\"30 deg Incline\",\"45 deg Incline\",\"60 deg Incline\",\"75 deg Incline\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Barbell\",\"Football Bar\",\"Thick Barbell\",\"TRX\",\"Kettlebell\",\"EZ Bar\",\"Log Bar\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Thick Dumbbell\",\"Cambered Bar\",\"Fat Gripz\",\"Stirrup Handles\",\"Rope Attachment\",\"add Custom\"],\"video_link\":\"https://youtu.be/KZnMWyfoK7E\"},{\"type\":\"Row - Prone\",\"exercise_1\":[\"Pronated Grip\",\"Semi-Pronated Grip\",\"Neutral Grip\",\"Semi-Supinated Grip\",\"Supinated Grip\",\"Supinating Grip\"],\"exercise_2\":[\"30 deg Incline\",\"45 deg Incline\",\"60 deg Incline\",\"75 deg Incline\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Barbell\",\"Football Bar\",\"Thick Barbell\",\"TRX\",\"Kettlebell\",\"EZ Bar\",\"Log Bar\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Thick Dumbbell\",\"Cambered Bar\",\"Fat Gripz\",\"Stirrup Handles\",\"Rope Attachment\",\"add Custom\"],\"video_link\":\"https://youtu.be/q6RXIhvMnn8\"},{\"type\":\"Pull-up -  mid Grip\",\"exercise_1\":[\"Pronated Grip\",\"Semi-Pronated Grip\",\"Neutral Grip\",\"Semi-Supinated Grip\",\"Supinated Grip\",\"Supinating Grip\"],\"exercise_2\":[\"30 deg Incline\",\"45 deg Incline\",\"60 deg Incline\",\"75 deg Incline\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Barbell\",\"Football Bar\",\"Thick Barbell\",\"TRX\",\"Kettlebell\",\"EZ Bar\",\"Log Bar\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Thick Dumbbell\",\"Cambered Bar\",\"Fat Gripz\",\"Stirrup Handles\",\"Rope Attachment\",\"add Custom\"],\"video_link\":\"https://youtu.be/5oysqE-FU54\"},{\"type\":\"Pull-up - close grip\",\"exercise_1\":[\"Pronated Grip\",\"Semi-Pronated Grip\",\"Neutral Grip\",\"Semi-Supinated Grip\",\"Supinated Grip\",\"Supinating Grip\"],\"exercise_2\":[\"30 deg Incline\",\"45 deg Incline\",\"60 deg Incline\",\"75 deg Incline\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Barbell\",\"Football Bar\",\"Thick Barbell\",\"TRX\",\"Kettlebell\",\"EZ Bar\",\"Log Bar\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Thick Dumbbell\",\"Cambered Bar\",\"Fat Gripz\",\"Stirrup Handles\",\"Rope Attachment\",\"add Custom\"],\"video_link\":\"https://youtu.be/3WRDW3g92lw\"},{\"type\":\"Pull-up - Wide Grip\",\"exercise_1\":[\"Pronated Grip\",\"Semi-Pronated Grip\",\"Neutral Grip\",\"Semi-Supinated Grip\",\"Supinated Grip\",\"Supinating Grip\"],\"exercise_2\":[\"30 deg Incline\",\"45 deg Incline\",\"60 deg Incline\",\"75 deg Incline\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Barbell\",\"Football Bar\",\"Thick Barbell\",\"TRX\",\"Kettlebell\",\"EZ Bar\",\"Log Bar\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Thick Dumbbell\",\"Cambered Bar\",\"Fat Gripz\",\"Stirrup Handles\",\"Rope Attachment\",\"add Custom\"],\"video_link\":\"https://youtu.be/doVWoCYd0kc\"},{\"type\":\"Pull-up - Behind the Neck\",\"exercise_1\":[\"Pronated Grip\",\"Semi-Pronated Grip\",\"Neutral Grip\",\"Semi-Supinated Grip\",\"Supinated Grip\",\"Supinating Grip\"],\"exercise_2\":[\"30 deg Incline\",\"45 deg Incline\",\"60 deg Incline\",\"75 deg Incline\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Barbell\",\"Football Bar\",\"Thick Barbell\",\"TRX\",\"Kettlebell\",\"EZ Bar\",\"Log Bar\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Thick Dumbbell\",\"Cambered Bar\",\"Fat Gripz\",\"Stirrup Handles\",\"Rope Attachment\",\"add Custom\"],\"video_link\":\"https://youtu.be/O5J3K-VOMkI\"},{\"type\":\"Pull-up - Subcapularis\",\"exercise_1\":[\"Pronated Grip\",\"Semi-Pronated Grip\",\"Neutral Grip\",\"Semi-Supinated Grip\",\"Supinated Grip\",\"Supinating Grip\"],\"exercise_2\":[\"30 deg Incline\",\"45 deg Incline\",\"60 deg Incline\",\"75 deg Incline\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Barbell\",\"Football Bar\",\"Thick Barbell\",\"TRX\",\"Kettlebell\",\"EZ Bar\",\"Log Bar\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Thick Dumbbell\",\"Cambered Bar\",\"Fat Gripz\",\"Stirrup Handles\",\"Rope Attachment\",\"add Custom\"],\"video_link\":\"https://youtu.be/SzoizC7GR38\"},{\"type\":\"Lat Pulldown - to Chest\",\"exercise_1\":[\"Pronated Grip\",\"Semi-Pronated Grip\",\"Neutral Grip\",\"Semi-Supinated Grip\",\"Supinated Grip\",\"Supinating Grip\"],\"exercise_2\":[\"30 deg Incline\",\"45 deg Incline\",\"60 deg Incline\",\"75 deg Incline\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Barbell\",\"Football Bar\",\"Thick Barbell\",\"TRX\",\"Kettlebell\",\"EZ Bar\",\"Log Bar\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Thick Dumbbell\",\"Cambered Bar\",\"Fat Gripz\",\"Stirrup Handles\",\"Rope Attachment\",\"add Custom\"],\"video_link\":\"https://youtu.be/1hw8ieNWrfo\"},{\"type\":\"Lat Pulldown - to Sternum\",\"exercise_1\":[\"Pronated Grip\",\"Semi-Pronated Grip\",\"Neutral Grip\",\"Semi-Supinated Grip\",\"Supinated Grip\",\"Supinating Grip\"],\"exercise_2\":[\"30 deg Incline\",\"45 deg Incline\",\"60 deg Incline\",\"75 deg Incline\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Barbell\",\"Football Bar\",\"Thick Barbell\",\"TRX\",\"Kettlebell\",\"EZ Bar\",\"Log Bar\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Thick Dumbbell\",\"Cambered Bar\",\"Fat Gripz\",\"Stirrup Handles\",\"Rope Attachment\",\"add Custom\"],\"video_link\":\"https://youtu.be/cqj8v5EitJ4\"},{\"type\":\"Lat Pulldown - close-grip - to Chest\",\"exercise_1\":[\"Pronated Grip\",\"Semi-Pronated Grip\",\"Neutral Grip\",\"Semi-Supinated Grip\",\"Supinated Grip\",\"Supinating Grip\"],\"exercise_2\":[\"30 deg Incline\",\"45 deg Incline\",\"60 deg Incline\",\"75 deg Incline\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Barbell\",\"Football Bar\",\"Thick Barbell\",\"TRX\",\"Kettlebell\",\"EZ Bar\",\"Log Bar\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Thick Dumbbell\",\"Cambered Bar\",\"Fat Gripz\",\"Stirrup Handles\",\"Rope Attachment\",\"add Custom\"],\"video_link\":\"https://youtu.be/fyQmF3Tqy_8\"},{\"type\":\"Lat Pulldown - Behind the Neck\",\"exercise_1\":[\"Pronated Grip\",\"Semi-Pronated Grip\",\"Neutral Grip\",\"Semi-Supinated Grip\",\"Supinated Grip\",\"Supinating Grip\"],\"exercise_2\":[\"30 deg Incline\",\"45 deg Incline\",\"60 deg Incline\",\"75 deg Incline\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Barbell\",\"Football Bar\",\"Thick Barbell\",\"TRX\",\"Kettlebell\",\"EZ Bar\",\"Log Bar\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Thick Dumbbell\",\"Cambered Bar\",\"Fat Gripz\",\"Stirrup Handles\",\"Rope Attachment\",\"add Custom\"],\"video_link\":\"https://youtu.be/HNEmS4ONfo8\"},{\"type\":\"Lat Pulldown - Uni-Lateral - wide grip\",\"exercise_1\":[\"Pronated Grip\",\"Semi-Pronated Grip\",\"Neutral Grip\",\"Semi-Supinated Grip\",\"Supinated Grip\",\"Supinating Grip\"],\"exercise_2\":[\"30 deg Incline\",\"45 deg Incline\",\"60 deg Incline\",\"75 deg Incline\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Barbell\",\"Football Bar\",\"Thick Barbell\",\"TRX\",\"Kettlebell\",\"EZ Bar\",\"Log Bar\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Thick Dumbbell\",\"Cambered Bar\",\"Fat Gripz\",\"Stirrup Handles\",\"Rope Attachment\",\"add Custom\"],\"video_link\":\"https://youtu.be/lA0HVxqvRX8\"},{\"type\":\"Lat Pulldown - One-Arm\",\"exercise_1\":[\"Pronated Grip\",\"Semi-Pronated Grip\",\"Neutral Grip\",\"Semi-Supinated Grip\",\"Supinated Grip\",\"Supinating Grip\"],\"exercise_2\":[\"30 deg Incline\",\"45 deg Incline\",\"60 deg Incline\",\"75 deg Incline\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Barbell\",\"Football Bar\",\"Thick Barbell\",\"TRX\",\"Kettlebell\",\"EZ Bar\",\"Log Bar\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Thick Dumbbell\",\"Cambered Bar\",\"Fat Gripz\",\"Stirrup Handles\",\"Rope Attachment\",\"add Custom\"],\"video_link\":\"https://youtu.be/1uzArWariAc\"},{\"type\":\"Lat Pulldown - Machine\",\"exercise_1\":[\"Pronated Grip\",\"Semi-Pronated Grip\",\"Neutral Grip\",\"Semi-Supinated Grip\",\"Supinated Grip\",\"Supinating Grip\"],\"exercise_2\":[\"30 deg Incline\",\"45 deg Incline\",\"60 deg Incline\",\"75 deg Incline\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Barbell\",\"Football Bar\",\"Thick Barbell\",\"TRX\",\"Kettlebell\",\"EZ Bar\",\"Log Bar\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Thick Dumbbell\",\"Cambered Bar\",\"Fat Gripz\",\"Stirrup Handles\",\"Rope Attachment\",\"add Custom\"],\"video_link\":\"\"},{\"type\":\"Lat Pulldown - Straight Arm\",\"exercise_1\":[\"Pronated Grip\",\"Semi-Pronated Grip\",\"Neutral Grip\",\"Semi-Supinated Grip\",\"Supinated Grip\",\"Supinating Grip\"],\"exercise_2\":[\"30 deg Incline\",\"45 deg Incline\",\"60 deg Incline\",\"75 deg Incline\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Barbell\",\"Football Bar\",\"Thick Barbell\",\"TRX\",\"Kettlebell\",\"EZ Bar\",\"Log Bar\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Thick Dumbbell\",\"Cambered Bar\",\"Fat Gripz\",\"Stirrup Handles\",\"Rope Attachment\",\"add Custom\"],\"video_link\":\"https://youtu.be/ahLhnMgdxZk\"},{\"type\":\"Pullover - Side Lying\",\"exercise_1\":[\"Pronated Grip\",\"Semi-Pronated Grip\",\"Neutral Grip\",\"Semi-Supinated Grip\",\"Supinated Grip\",\"Supinating Grip\"],\"exercise_2\":[\"30 deg Incline\",\"45 deg Incline\",\"60 deg Incline\",\"75 deg Incline\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Barbell\",\"Football Bar\",\"Thick Barbell\",\"TRX\",\"Kettlebell\",\"EZ Bar\",\"Log Bar\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Thick Dumbbell\",\"Cambered Bar\",\"Fat Gripz\",\"Stirrup Handles\",\"Rope Attachment\",\"add Custom\"],\"video_link\":\"https://youtu.be/r1JXAZclb6Q\"},{\"type\":\"Pullovers - Supine\",\"exercise_1\":[\"Pronated Grip\",\"Semi-Pronated Grip\",\"Neutral Grip\",\"Semi-Supinated Grip\",\"Supinated Grip\",\"Supinating Grip\"],\"exercise_2\":[\"30 deg Incline\",\"45 deg Incline\",\"60 deg Incline\",\"75 deg Incline\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Barbell\",\"Football Bar\",\"Thick Barbell\",\"TRX\",\"Kettlebell\",\"EZ Bar\",\"Log Bar\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Thick Dumbbell\",\"Cambered Bar\",\"Fat Gripz\",\"Stirrup Handles\",\"Rope Attachment\",\"add Custom\"],\"video_link\":\"https://youtu.be/IVum3vvTZEI\"},{\"type\":\"Pullovers - Machine\",\"exercise_1\":[\"Pronated Grip\",\"Semi-Pronated Grip\",\"Neutral Grip\",\"Semi-Supinated Grip\",\"Supinated Grip\",\"Supinating Grip\"],\"exercise_2\":[\"30 deg Incline\",\"45 deg Incline\",\"60 deg Incline\",\"75 deg Incline\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Barbell\",\"Football Bar\",\"Thick Barbell\",\"TRX\",\"Kettlebell\",\"EZ Bar\",\"Log Bar\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Thick Dumbbell\",\"Cambered Bar\",\"Fat Gripz\",\"Stirrup Handles\",\"Rope Attachment\",\"add Custom\"],\"video_link\":\"\"},{\"type\":\"Seated Scapulae Retraction\",\"exercise_1\":[\"Pronated Grip\",\"Semi-Pronated Grip\",\"Neutral Grip\",\"Semi-Supinated Grip\",\"Supinated Grip\",\"Supinating Grip\"],\"exercise_2\":[\"30 deg Incline\",\"45 deg Incline\",\"60 deg Incline\",\"75 deg Incline\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Barbell\",\"Football Bar\",\"Thick Barbell\",\"TRX\",\"Kettlebell\",\"EZ Bar\",\"Log Bar\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Thick Dumbbell\",\"Cambered Bar\",\"Fat Gripz\",\"Stirrup Handles\",\"Rope Attachment\",\"add Custom\"],\"video_link\":\"https://youtu.be/YsQE42Q04Ao\"},{\"type\":\"Seated Scapulae Retraction - One-Arm\",\"exercise_1\":[\"Pronated Grip\",\"Semi-Pronated Grip\",\"Neutral Grip\",\"Semi-Supinated Grip\",\"Supinated Grip\",\"Supinating Grip\"],\"exercise_2\":[\"30 deg Incline\",\"45 deg Incline\",\"60 deg Incline\",\"75 deg Incline\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Barbell\",\"Football Bar\",\"Thick Barbell\",\"TRX\",\"Kettlebell\",\"EZ Bar\",\"Log Bar\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Thick Dumbbell\",\"Cambered Bar\",\"Fat Gripz\",\"Stirrup Handles\",\"Rope Attachment\",\"add Custom\"],\"video_link\":\"https://youtu.be/HMPkn040i4g\"},{\"type\":\"Seated Cable Row\",\"exercise_1\":[\"Pronated Grip\",\"Semi-Pronated Grip\",\"Neutral Grip\",\"Semi-Supinated Grip\",\"Supinated Grip\",\"Supinating Grip\"],\"exercise_2\":[\"30 deg Incline\",\"45 deg Incline\",\"60 deg Incline\",\"75 deg Incline\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Barbell\",\"Football Bar\",\"Thick Barbell\",\"TRX\",\"Kettlebell\",\"EZ Bar\",\"Log Bar\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Thick Dumbbell\",\"Cambered Bar\",\"Fat Gripz\",\"Stirrup Handles\",\"Rope Attachment\",\"add Custom\"],\"video_link\":\"https://youtu.be/X8Lx-Osq_zI\"},{\"type\":\"Seated Cable Row - One-Arm\",\"exercise_1\":[\"Pronated Grip\",\"Semi-Pronated Grip\",\"Neutral Grip\",\"Semi-Supinated Grip\",\"Supinated Grip\",\"Supinating Grip\"],\"exercise_2\":[\"30 deg Incline\",\"45 deg Incline\",\"60 deg Incline\",\"75 deg Incline\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Barbell\",\"Football Bar\",\"Thick Barbell\",\"TRX\",\"Kettlebell\",\"EZ Bar\",\"Log Bar\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Thick Dumbbell\",\"Cambered Bar\",\"Fat Gripz\",\"Stirrup Handles\",\"Rope Attachment\",\"add Custom\"],\"video_link\":\"https://youtu.be/D7jg1f1oFII\"},{\"type\":\"Seated Cable Row - Face Pull\",\"exercise_1\":[\"Pronated Grip\",\"Semi-Pronated Grip\",\"Neutral Grip\",\"Semi-Supinated Grip\",\"Supinated Grip\",\"Supinating Grip\"],\"exercise_2\":[\"30 deg Incline\",\"45 deg Incline\",\"60 deg Incline\",\"75 deg Incline\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Barbell\",\"Football Bar\",\"Thick Barbell\",\"TRX\",\"Kettlebell\",\"EZ Bar\",\"Log Bar\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Thick Dumbbell\",\"Cambered Bar\",\"Fat Gripz\",\"Stirrup Handles\",\"Rope Attachment\",\"add Custom\"],\"video_link\":\"https://youtu.be/-MfFOeGPMys\"},{\"type\":\"Seated Cable Row - Telle\",\"exercise_1\":[\"Pronated Grip\",\"Semi-Pronated Grip\",\"Neutral Grip\",\"Semi-Supinated Grip\",\"Supinated Grip\",\"Supinating Grip\"],\"exercise_2\":[\"30 deg Incline\",\"45 deg Incline\",\"60 deg Incline\",\"75 deg Incline\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Barbell\",\"Football Bar\",\"Thick Barbell\",\"TRX\",\"Kettlebell\",\"EZ Bar\",\"Log Bar\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Thick Dumbbell\",\"Cambered Bar\",\"Fat Gripz\",\"Stirrup Handles\",\"Rope Attachment\",\"add Custom\"],\"video_link\":\"https://youtu.be/fhHVF5jlcsY\"},{\"type\":\"T-Bar Row\",\"exercise_1\":[\"Pronated Grip\",\"Semi-Pronated Grip\",\"Neutral Grip\",\"Semi-Supinated Grip\",\"Supinated Grip\",\"Supinating Grip\"],\"exercise_2\":[\"30 deg Incline\",\"45 deg Incline\",\"60 deg Incline\",\"75 deg Incline\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Barbell\",\"Football Bar\",\"Thick Barbell\",\"TRX\",\"Kettlebell\",\"EZ Bar\",\"Log Bar\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Thick Dumbbell\",\"Cambered Bar\",\"Fat Gripz\",\"Stirrup Handles\",\"Rope Attachment\",\"add Custom\"],\"video_link\":\"\"},{\"type\":\"Trap 3 Raise - Standing\",\"exercise_1\":[\"Pronated Grip\",\"Semi-Pronated Grip\",\"Neutral Grip\",\"Semi-Supinated Grip\",\"Supinated Grip\",\"Supinating Grip\"],\"exercise_2\":[\"30 deg Incline\",\"45 deg Incline\",\"60 deg Incline\",\"75 deg Incline\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Barbell\",\"Football Bar\",\"Thick Barbell\",\"TRX\",\"Kettlebell\",\"EZ Bar\",\"Log Bar\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Thick Dumbbell\",\"Cambered Bar\",\"Fat Gripz\",\"Stirrup Handles\",\"Rope Attachment\",\"add Custom\"],\"video_link\":\"https://youtu.be/LYm6oSQCd1s\"},{\"type\":\"Trap 3 Raise - Incline - Supported\",\"exercise_1\":[\"Pronated Grip\",\"Semi-Pronated Grip\",\"Neutral Grip\",\"Semi-Supinated Grip\",\"Supinated Grip\",\"Supinating Grip\"],\"exercise_2\":[\"30 deg Incline\",\"45 deg Incline\",\"60 deg Incline\",\"75 deg Incline\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Barbell\",\"Football Bar\",\"Thick Barbell\",\"TRX\",\"Kettlebell\",\"EZ Bar\",\"Log Bar\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Thick Dumbbell\",\"Cambered Bar\",\"Fat Gripz\",\"Stirrup Handles\",\"Rope Attachment\",\"add Custom\"],\"video_link\":\"https://youtu.be/Xkj2EbRZmCs\"}]');
INSERT INTO `workout_exercise_options_tbl` (`id`, `part`, `options`) VALUES
(3, 'Biceps', '[{\"type\":\"Incline DB Curl\",\"exercise_1\":[\"30 deg Incline\",\"45 deg Incline\",\"60 deg Incline\",\"75 deg Incline\",\"Flat\"],\"exercise_2\":[\"Offset Grip\",\"1.25 reps\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\",\"One-Armr\",\"Pronated Grip\"],\"implementation_options\":[\"EZ Bar\",\"High Pulley\",\"Mid Pulley\",\"Barbell\",\"Dumbbell\",\"Thick Barbell\",\"Thick Dumbbell\",\"Triceps Bar\",\"T-Grip Barbell\",\"Rope\"],\"video_link\":\"https://youtu.be/wQgz4BUAYFc\"},{\"type\":\"Incline DB Hammer Curl\",\"exercise_1\":[\"30 deg Incline\",\"45 deg Incline\",\"60 deg Incline\",\"75 deg Incline\",\"Flat\"],\"exercise_2\":[\"Offset Grip\",\"1.25 reps\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\",\"One-Armr\",\"Pronated Grip\"],\"implementation_options\":[\"EZ Bar\",\"High Pulley\",\"Mid Pulley\",\"Barbell\",\"Dumbbell\",\"Thick Barbell\",\"Thick Dumbbell\",\"Triceps Bar\",\"T-Grip Barbell\",\"Rope\"],\"video_link\":\"https://youtu.be/bQZgp8QyDaw\"},{\"type\":\"Incline DB Supinating Curl\",\"exercise_1\":[\"30 deg Incline\",\"45 deg Incline\",\"60 deg Incline\",\"75 deg Incline\",\"Flat\"],\"exercise_2\":[\"Offset Grip\",\"1.25 reps\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\",\"One-Armr\",\"Pronated Grip\"],\"implementation_options\":[\"EZ Bar\",\"High Pulley\",\"Mid Pulley\",\"Barbell\",\"Dumbbell\",\"Thick Barbell\",\"Thick Dumbbell\",\"Triceps Bar\",\"T-Grip Barbell\",\"Rope\"],\"video_link\":\"https://youtu.be/Nbq6ZfEaxJI\"},{\"type\":\"Incline DB Zottman Curl\",\"exercise_1\":[\"30 deg Incline\",\"45 deg Incline\",\"60 deg Incline\",\"75 deg Incline\",\"Flat\"],\"exercise_2\":[\"Offset Grip\",\"1.25 reps\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\",\"One-Armr\",\"Pronated Grip\"],\"implementation_options\":[\"EZ Bar\",\"High Pulley\",\"Mid Pulley\",\"Barbell\",\"Dumbbell\",\"Thick Barbell\",\"Thick Dumbbell\",\"Triceps Bar\",\"T-Grip Barbell\",\"Rope\"],\"video_link\":\"https://youtu.be/J3JZ80_Sn6g\"},{\"type\":\"Machine Biceps Curl\",\"exercise_1\":[\"30 deg Incline\",\"45 deg Incline\",\"60 deg Incline\",\"75 deg Incline\",\"Flat\"],\"exercise_2\":[\"Offset Grip\",\"1.25 reps\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\",\"One-Armr\",\"Pronated Grip\"],\"implementation_options\":[\"EZ Bar\",\"High Pulley\",\"Mid Pulley\",\"Barbell\",\"Dumbbell\",\"Thick Barbell\",\"Thick Dumbbell\",\"Triceps Bar\",\"T-Grip Barbell\",\"Rope\"],\"video_link\":\"\"},{\"type\":\"Prone Barbell Curl \",\"exercise_1\":[\"30 deg Incline\",\"45 deg Incline\",\"60 deg Incline\",\"75 deg Incline\",\"Flat\"],\"exercise_2\":[\"Offset Grip\",\"1.25 reps\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\",\"One-Armr\",\"Pronated Grip\"],\"implementation_options\":[\"EZ Bar\",\"High Pulley\",\"Mid Pulley\",\"Barbell\",\"Dumbbell\",\"Thick Barbell\",\"Thick Dumbbell\",\"Triceps Bar\",\"T-Grip Barbell\",\"Rope\"],\"video_link\":\"https://youtu.be/eH-Lc76AZ1k\"},{\"type\":\"Prone DB Hammer Curl\",\"exercise_1\":[\"30 deg Incline\",\"45 deg Incline\",\"60 deg Incline\",\"75 deg Incline\",\"Flat\"],\"exercise_2\":[\"Offset Grip\",\"1.25 reps\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\",\"One-Armr\",\"Pronated Grip\"],\"implementation_options\":[\"EZ Bar\",\"High Pulley\",\"Mid Pulley\",\"Barbell\",\"Dumbbell\",\"Thick Barbell\",\"Thick Dumbbell\",\"Triceps Bar\",\"T-Grip Barbell\",\"Rope\"],\"video_link\":\"https://youtu.be/qahQnQ_hlEY\"},{\"type\":\"Prone DB Supinating Curl\",\"exercise_1\":[\"30 deg Incline\",\"45 deg Incline\",\"60 deg Incline\",\"75 deg Incline\",\"Flat\"],\"exercise_2\":[\"Offset Grip\",\"1.25 reps\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\",\"One-Armr\",\"Pronated Grip\"],\"implementation_options\":[\"EZ Bar\",\"High Pulley\",\"Mid Pulley\",\"Barbell\",\"Dumbbell\",\"Thick Barbell\",\"Thick Dumbbell\",\"Triceps Bar\",\"T-Grip Barbell\",\"Rope\"],\"video_link\":\"https://youtu.be/ddGnCmFchGk\"},{\"type\":\"Prone DB Zottman Curl\",\"exercise_1\":[\"30 deg Incline\",\"45 deg Incline\",\"60 deg Incline\",\"75 deg Incline\",\"Flat\"],\"exercise_2\":[\"Offset Grip\",\"1.25 reps\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\",\"One-Armr\",\"Pronated Grip\"],\"implementation_options\":[\"EZ Bar\",\"High Pulley\",\"Mid Pulley\",\"Barbell\",\"Dumbbell\",\"Thick Barbell\",\"Thick Dumbbell\",\"Triceps Bar\",\"T-Grip Barbell\",\"Rope\"],\"video_link\":\"https://youtu.be/nFOzbz-rZRQ\"},{\"type\":\"Prone EZ Bar Curl\",\"exercise_1\":[\"30 deg Incline\",\"45 deg Incline\",\"60 deg Incline\",\"75 deg Incline\",\"Flat\"],\"exercise_2\":[\"Offset Grip\",\"1.25 reps\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\",\"One-Armr\",\"Pronated Grip\"],\"implementation_options\":[\"EZ Bar\",\"High Pulley\",\"Mid Pulley\",\"Barbell\",\"Dumbbell\",\"Thick Barbell\",\"Thick Dumbbell\",\"Triceps Bar\",\"T-Grip Barbell\",\"Rope\"],\"video_link\":\"https://youtu.be/xtsxdLiX9_Q\"},{\"type\":\"Prone EZ Bar Reverse Curl\",\"exercise_1\":[\"30 deg Incline\",\"45 deg Incline\",\"60 deg Incline\",\"75 deg Incline\",\"Flat\"],\"exercise_2\":[\"Offset Grip\",\"1.25 reps\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\",\"One-Armr\",\"Pronated Grip\"],\"implementation_options\":[\"EZ Bar\",\"High Pulley\",\"Mid Pulley\",\"Barbell\",\"Dumbbell\",\"Thick Barbell\",\"Thick Dumbbell\",\"Triceps Bar\",\"T-Grip Barbell\",\"Rope\"],\"video_link\":\"https://youtu.be/7mmi_zRJqf8\"},{\"type\":\"Scott Bench Barbell Curl\",\"exercise_1\":[\"30 deg Incline\",\"45 deg Incline\",\"60 deg Incline\",\"75 deg Incline\",\"Flat\"],\"exercise_2\":[\"Offset Grip\",\"1.25 reps\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\",\"One-Armr\",\"Pronated Grip\"],\"implementation_options\":[\"EZ Bar\",\"High Pulley\",\"Mid Pulley\",\"Barbell\",\"Dumbbell\",\"Thick Barbell\",\"Thick Dumbbell\",\"Triceps Bar\",\"T-Grip Barbell\",\"Rope\"],\"video_link\":\"https://youtu.be/Ia2JeXD7j-Q\"},{\"type\":\"Scott Bench EZ Bar Curl\",\"exercise_1\":[\"30 deg Incline\",\"45 deg Incline\",\"60 deg Incline\",\"75 deg Incline\",\"Flat\"],\"exercise_2\":[\"Offset Grip\",\"1.25 reps\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\",\"One-Armr\",\"Pronated Grip\"],\"implementation_options\":[\"EZ Bar\",\"High Pulley\",\"Mid Pulley\",\"Barbell\",\"Dumbbell\",\"Thick Barbell\",\"Thick Dumbbell\",\"Triceps Bar\",\"T-Grip Barbell\",\"Rope\"],\"video_link\":\"https://youtu.be/5EQPf6sdMgw\"},{\"type\":\"Scott EZ Bar Reverse-Grip Curl\",\"exercise_1\":[\"30 deg Incline\",\"45 deg Incline\",\"60 deg Incline\",\"75 deg Incline\",\"Flat\"],\"exercise_2\":[\"Offset Grip\",\"1.25 reps\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\",\"One-Armr\",\"Pronated Grip\"],\"implementation_options\":[\"EZ Bar\",\"High Pulley\",\"Mid Pulley\",\"Barbell\",\"Dumbbell\",\"Thick Barbell\",\"Thick Dumbbell\",\"Triceps Bar\",\"T-Grip Barbell\",\"Rope\"],\"video_link\":\"https://youtu.be/6d_Qh5w_d5k\"},{\"type\":\"Scott DB Curl\",\"exercise_1\":[\"30 deg Incline\",\"45 deg Incline\",\"60 deg Incline\",\"75 deg Incline\",\"Flat\"],\"exercise_2\":[\"Offset Grip\",\"1.25 reps\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\",\"One-Armr\",\"Pronated Grip\"],\"implementation_options\":[\"EZ Bar\",\"High Pulley\",\"Mid Pulley\",\"Barbell\",\"Dumbbell\",\"Thick Barbell\",\"Thick Dumbbell\",\"Triceps Bar\",\"T-Grip Barbell\",\"Rope\"],\"video_link\":\"https://youtu.be/5RYGoH9CfMo\"},{\"type\":\"Scott 1-Arm DB Zottman Curl\",\"exercise_1\":[\"30 deg Incline\",\"45 deg Incline\",\"60 deg Incline\",\"75 deg Incline\",\"Flat\"],\"exercise_2\":[\"Offset Grip\",\"1.25 reps\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\",\"One-Armr\",\"Pronated Grip\"],\"implementation_options\":[\"EZ Bar\",\"High Pulley\",\"Mid Pulley\",\"Barbell\",\"Dumbbell\",\"Thick Barbell\",\"Thick Dumbbell\",\"Triceps Bar\",\"T-Grip Barbell\",\"Rope\"],\"video_link\":\"https://youtu.be/u64Y2VMAawQ\"},{\"type\":\"Seated Machine Curl\",\"exercise_1\":[\"30 deg Incline\",\"45 deg Incline\",\"60 deg Incline\",\"75 deg Incline\",\"Flat\"],\"exercise_2\":[\"Offset Grip\",\"1.25 reps\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\",\"One-Armr\",\"Pronated Grip\"],\"implementation_options\":[\"EZ Bar\",\"High Pulley\",\"Mid Pulley\",\"Barbell\",\"Dumbbell\",\"Thick Barbell\",\"Thick Dumbbell\",\"Triceps Bar\",\"T-Grip Barbell\",\"Rope\"],\"video_link\":\"\"},{\"type\":\"Seated DB Biceps Curl\",\"exercise_1\":[\"30 deg Incline\",\"45 deg Incline\",\"60 deg Incline\",\"75 deg Incline\",\"Flat\"],\"exercise_2\":[\"Offset Grip\",\"1.25 reps\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\",\"One-Armr\",\"Pronated Grip\"],\"implementation_options\":[\"EZ Bar\",\"High Pulley\",\"Mid Pulley\",\"Barbell\",\"Dumbbell\",\"Thick Barbell\",\"Thick Dumbbell\",\"Triceps Bar\",\"T-Grip Barbell\",\"Rope\"],\"video_link\":\"https://youtu.be/uZi2anVGIHo\"},{\"type\":\"Seated Offset-Grip DB Curl\",\"exercise_1\":[\"30 deg Incline\",\"45 deg Incline\",\"60 deg Incline\",\"75 deg Incline\",\"Flat\"],\"exercise_2\":[\"Offset Grip\",\"1.25 reps\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\",\"One-Armr\",\"Pronated Grip\"],\"implementation_options\":[\"EZ Bar\",\"High Pulley\",\"Mid Pulley\",\"Barbell\",\"Dumbbell\",\"Thick Barbell\",\"Thick Dumbbell\",\"Triceps Bar\",\"T-Grip Barbell\",\"Rope\"],\"video_link\":\"https://youtu.be/FdW4CXvz4Xk\"},{\"type\":\"Seated DB Zottman Curls\",\"exercise_1\":[\"30 deg Incline\",\"45 deg Incline\",\"60 deg Incline\",\"75 deg Incline\",\"Flat\"],\"exercise_2\":[\"Offset Grip\",\"1.25 reps\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\",\"One-Armr\",\"Pronated Grip\"],\"implementation_options\":[\"EZ Bar\",\"High Pulley\",\"Mid Pulley\",\"Barbell\",\"Dumbbell\",\"Thick Barbell\",\"Thick Dumbbell\",\"Triceps Bar\",\"T-Grip Barbell\",\"Rope\"],\"video_link\":\"https://youtu.be/-614qJJQtGQ\"},{\"type\":\"Seated DB Hammer Curl\",\"exercise_1\":[\"30 deg Incline\",\"45 deg Incline\",\"60 deg Incline\",\"75 deg Incline\",\"Flat\"],\"exercise_2\":[\"Offset Grip\",\"1.25 reps\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\",\"One-Armr\",\"Pronated Grip\"],\"implementation_options\":[\"EZ Bar\",\"High Pulley\",\"Mid Pulley\",\"Barbell\",\"Dumbbell\",\"Thick Barbell\",\"Thick Dumbbell\",\"Triceps Bar\",\"T-Grip Barbell\",\"Rope\"],\"video_link\":\"https://youtu.be/Vf8gtwUerTw\"},{\"type\":\"Seated DB Concentration Curl\",\"exercise_1\":[\"30 deg Incline\",\"45 deg Incline\",\"60 deg Incline\",\"75 deg Incline\",\"Flat\"],\"exercise_2\":[\"Offset Grip\",\"1.25 reps\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\",\"One-Armr\",\"Pronated Grip\"],\"implementation_options\":[\"EZ Bar\",\"High Pulley\",\"Mid Pulley\",\"Barbell\",\"Dumbbell\",\"Thick Barbell\",\"Thick Dumbbell\",\"Triceps Bar\",\"T-Grip Barbell\",\"Rope\"],\"video_link\":\"https://youtu.be/k0idySkmeuU\"},{\"type\":\"Standing Barbell Curl\",\"exercise_1\":[\"30 deg Incline\",\"45 deg Incline\",\"60 deg Incline\",\"75 deg Incline\",\"Flat\"],\"exercise_2\":[\"Offset Grip\",\"1.25 reps\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\",\"One-Armr\",\"Pronated Grip\"],\"implementation_options\":[\"EZ Bar\",\"High Pulley\",\"Mid Pulley\",\"Barbell\",\"Dumbbell\",\"Thick Barbell\",\"Thick Dumbbell\",\"Triceps Bar\",\"T-Grip Barbell\",\"Rope\"],\"video_link\":\"https://youtu.be/fJi4oweYQEo\"},{\"type\":\"Standing Barbell Spider Curl\",\"exercise_1\":[\"30 deg Incline\",\"45 deg Incline\",\"60 deg Incline\",\"75 deg Incline\",\"Flat\"],\"exercise_2\":[\"Offset Grip\",\"1.25 reps\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\",\"One-Armr\",\"Pronated Grip\"],\"implementation_options\":[\"EZ Bar\",\"High Pulley\",\"Mid Pulley\",\"Barbell\",\"Dumbbell\",\"Thick Barbell\",\"Thick Dumbbell\",\"Triceps Bar\",\"T-Grip Barbell\",\"Rope\"],\"video_link\":\"https://youtu.be/Ec6D8OznfZk\"},{\"type\":\"Standing DB Curl\",\"exercise_1\":[\"30 deg Incline\",\"45 deg Incline\",\"60 deg Incline\",\"75 deg Incline\",\"Flat\"],\"exercise_2\":[\"Offset Grip\",\"1.25 reps\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\",\"One-Armr\",\"Pronated Grip\"],\"implementation_options\":[\"EZ Bar\",\"High Pulley\",\"Mid Pulley\",\"Barbell\",\"Dumbbell\",\"Thick Barbell\",\"Thick Dumbbell\",\"Triceps Bar\",\"T-Grip Barbell\",\"Rope\"],\"video_link\":\"https://youtu.be/_LieroWGJOc\"},{\"type\":\"Standing Offset-Grip DB Curl\",\"exercise_1\":[\"30 deg Incline\",\"45 deg Incline\",\"60 deg Incline\",\"75 deg Incline\",\"Flat\"],\"exercise_2\":[\"Offset Grip\",\"1.25 reps\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\",\"One-Armr\",\"Pronated Grip\"],\"implementation_options\":[\"EZ Bar\",\"High Pulley\",\"Mid Pulley\",\"Barbell\",\"Dumbbell\",\"Thick Barbell\",\"Thick Dumbbell\",\"Triceps Bar\",\"T-Grip Barbell\",\"Rope\"],\"video_link\":\"https://youtu.be/JFPc8ogfuwc\"},{\"type\":\"Standing DB Zottman Curl\",\"exercise_1\":[\"30 deg Incline\",\"45 deg Incline\",\"60 deg Incline\",\"75 deg Incline\",\"Flat\"],\"exercise_2\":[\"Offset Grip\",\"1.25 reps\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\",\"One-Armr\",\"Pronated Grip\"],\"implementation_options\":[\"EZ Bar\",\"High Pulley\",\"Mid Pulley\",\"Barbell\",\"Dumbbell\",\"Thick Barbell\",\"Thick Dumbbell\",\"Triceps Bar\",\"T-Grip Barbell\",\"Rope\"],\"video_link\":\"https://youtu.be/1W26B58N0JM\"},{\"type\":\"Standing DB Midline Hammer Curl\",\"exercise_1\":[\"30 deg Incline\",\"45 deg Incline\",\"60 deg Incline\",\"75 deg Incline\",\"Flat\"],\"exercise_2\":[\"Offset Grip\",\"1.25 reps\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\",\"One-Armr\",\"Pronated Grip\"],\"implementation_options\":[\"EZ Bar\",\"High Pulley\",\"Mid Pulley\",\"Barbell\",\"Dumbbell\",\"Thick Barbell\",\"Thick Dumbbell\",\"Triceps Bar\",\"T-Grip Barbell\",\"Rope\"],\"video_link\":\"https://youtu.be/7nnEp5xn7fY\"},{\"type\":\"Standing EZ Bar Curl\",\"exercise_1\":[\"30 deg Incline\",\"45 deg Incline\",\"60 deg Incline\",\"75 deg Incline\",\"Flat\"],\"exercise_2\":[\"Offset Grip\",\"1.25 reps\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\",\"One-Armr\",\"Pronated Grip\"],\"implementation_options\":[\"EZ Bar\",\"High Pulley\",\"Mid Pulley\",\"Barbell\",\"Dumbbell\",\"Thick Barbell\",\"Thick Dumbbell\",\"Triceps Bar\",\"T-Grip Barbell\",\"Rope\"],\"video_link\":\"https://youtu.be/O2P8Tgzw4P8\"},{\"type\":\"Standing EZ Bar Reverse-Grip Curl\",\"exercise_1\":[\"30 deg Incline\",\"45 deg Incline\",\"60 deg Incline\",\"75 deg Incline\",\"Flat\"],\"exercise_2\":[\"Offset Grip\",\"1.25 reps\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\",\"One-Armr\",\"Pronated Grip\"],\"implementation_options\":[\"EZ Bar\",\"High Pulley\",\"Mid Pulley\",\"Barbell\",\"Dumbbell\",\"Thick Barbell\",\"Thick Dumbbell\",\"Triceps Bar\",\"T-Grip Barbell\",\"Rope\"],\"video_link\":\"https://youtu.be/GfnqdgraCYQ\"},{\"type\":\"Standing Cable Curl\",\"exercise_1\":[\"30 deg Incline\",\"45 deg Incline\",\"60 deg Incline\",\"75 deg Incline\",\"Flat\"],\"exercise_2\":[\"Offset Grip\",\"1.25 reps\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\",\"One-Armr\",\"Pronated Grip\"],\"implementation_options\":[\"EZ Bar\",\"High Pulley\",\"Mid Pulley\",\"Barbell\",\"Dumbbell\",\"Thick Barbell\",\"Thick Dumbbell\",\"Triceps Bar\",\"T-Grip Barbell\",\"Rope\"],\"video_link\":\"https://youtu.be/UDGRnDXMdbY\"},{\"type\":\"Standing Cable EZ Bar Curl\",\"exercise_1\":[\"30 deg Incline\",\"45 deg Incline\",\"60 deg Incline\",\"75 deg Incline\",\"Flat\"],\"exercise_2\":[\"Offset Grip\",\"1.25 reps\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\",\"One-Armr\",\"Pronated Grip\"],\"implementation_options\":[\"EZ Bar\",\"High Pulley\",\"Mid Pulley\",\"Barbell\",\"Dumbbell\",\"Thick Barbell\",\"Thick Dumbbell\",\"Triceps Bar\",\"T-Grip Barbell\",\"Rope\"],\"video_link\":\"https://youtu.be/8Ry33dvmvYA\"},{\"type\":\"Standing Cable EZ Bar Reverse-Grip Curl\",\"exercise_1\":[\"30 deg Incline\",\"45 deg Incline\",\"60 deg Incline\",\"75 deg Incline\",\"Flat\"],\"exercise_2\":[\"Offset Grip\",\"1.25 reps\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\",\"One-Armr\",\"Pronated Grip\"],\"implementation_options\":[\"EZ Bar\",\"High Pulley\",\"Mid Pulley\",\"Barbell\",\"Dumbbell\",\"Thick Barbell\",\"Thick Dumbbell\",\"Triceps Bar\",\"T-Grip Barbell\",\"Rope\"],\"video_link\":\"https://youtu.be/QbQcUdX7rqA\"},{\"type\":\"Supine Cable Curl\",\"exercise_1\":[\"30 deg Incline\",\"45 deg Incline\",\"60 deg Incline\",\"75 deg Incline\",\"Flat\"],\"exercise_2\":[\"Offset Grip\",\"1.25 reps\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\",\"One-Armr\",\"Pronated Grip\"],\"implementation_options\":[\"EZ Bar\",\"High Pulley\",\"Mid Pulley\",\"Barbell\",\"Dumbbell\",\"Thick Barbell\",\"Thick Dumbbell\",\"Triceps Bar\",\"T-Grip Barbell\",\"Rope\"],\"video_link\":\"https://youtu.be/1IGLqAel31o\"},{\"type\":\"Supine EZ Bar Reverse-Grip  Cable Curl\",\"exercise_1\":[\"30 deg Incline\",\"45 deg Incline\",\"60 deg Incline\",\"75 deg Incline\",\"Flat\"],\"exercise_2\":[\"Offset Grip\",\"1.25 reps\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\",\"One-Armr\",\"Pronated Grip\"],\"implementation_options\":[\"EZ Bar\",\"High Pulley\",\"Mid Pulley\",\"Barbell\",\"Dumbbell\",\"Thick Barbell\",\"Thick Dumbbell\",\"Triceps Bar\",\"T-Grip Barbell\",\"Rope\"],\"video_link\":\"https://youtu.be/YqT7Nx-hSDU\"}]'),
(4, 'Calves', '[{\"type\":\"Tibialis Anterior Flexion - Standing\",\"exercise_1\":[\"Uni-Lateral\",\"Narrow Stance\",\"Hip Width Stance\",\"Wide Stance\"],\"exercise_2\":[],\"implementation_options\":[\"Dumbbell\",\"Kettlebell\",\"Sandbag\",\"Barbell\",\"Safety Bar\",\"Band\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Chains\",\"Weighted Vest\"],\"video_link\":\"https://youtu.be/r2_WEikqrKs\"},{\"type\":\"Tibialis Anterior Flexion - Standing - Machine\",\"exercise_1\":[\"Uni-Lateral\",\"Narrow Stance\",\"Hip Width Stance\",\"Wide Stance\"],\"exercise_2\":[],\"implementation_options\":[\"Dumbbell\",\"Kettlebell\",\"Sandbag\",\"Barbell\",\"Safety Bar\",\"Band\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Chains\",\"Weighted Vest\"],\"video_link\":\"https://youtu.be/zhhTSWeUxvY\"},{\"type\":\"Tibialis Anterior Flexion - Seated - Uni-lateral w/band\",\"exercise_1\":[\"Uni-Lateral\",\"Narrow Stance\",\"Hip Width Stance\",\"Wide Stance\"],\"exercise_2\":[],\"implementation_options\":[\"Dumbbell\",\"Kettlebell\",\"Sandbag\",\"Barbell\",\"Safety Bar\",\"Band\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Chains\",\"Weighted Vest\"],\"video_link\":\"https://youtu.be/BwynADSQIzE\"},{\"type\":\"Tibialis Anterior Flexion - Donkey Calf \",\"exercise_1\":[\"Uni-Lateral\",\"Narrow Stance\",\"Hip Width Stance\",\"Wide Stance\"],\"exercise_2\":[],\"implementation_options\":[\"Dumbbell\",\"Kettlebell\",\"Sandbag\",\"Barbell\",\"Safety Bar\",\"Band\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Chains\",\"Weighted Vest\"],\"video_link\":\"https://youtu.be/Wq2MSwF8em4\"},{\"type\":\"Tibialis Anterior Flexion - Seated - Machine\",\"exercise_1\":[\"Uni-Lateral\",\"Narrow Stance\",\"Hip Width Stance\",\"Wide Stance\"],\"exercise_2\":[],\"implementation_options\":[\"Dumbbell\",\"Kettlebell\",\"Sandbag\",\"Barbell\",\"Safety Bar\",\"Band\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Chains\",\"Weighted Vest\"],\"video_link\":\"\"},{\"type\":\"Calf Press\",\"exercise_1\":[\"Uni-Lateral\",\"Narrow Stance\",\"Hip Width Stance\",\"Wide Stance\"],\"exercise_2\":[],\"implementation_options\":[\"Dumbbell\",\"Kettlebell\",\"Sandbag\",\"Barbell\",\"Safety Bar\",\"Band\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Chains\",\"Weighted Vest\"],\"video_link\":\"\"},{\"type\":\"Donkey Calf Raise\",\"exercise_1\":[\"Uni-Lateral\",\"Narrow Stance\",\"Hip Width Stance\",\"Wide Stance\"],\"exercise_2\":[],\"implementation_options\":[\"Dumbbell\",\"Kettlebell\",\"Sandbag\",\"Barbell\",\"Safety Bar\",\"Band\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Chains\",\"Weighted Vest\"],\"video_link\":\"https://youtu.be/LBq75cT_3Lk\"},{\"type\":\"Donkey Calf Raise - Machine\",\"exercise_1\":[\"Uni-Lateral\",\"Narrow Stance\",\"Hip Width Stance\",\"Wide Stance\"],\"exercise_2\":[],\"implementation_options\":[\"Dumbbell\",\"Kettlebell\",\"Sandbag\",\"Barbell\",\"Safety Bar\",\"Band\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Chains\",\"Weighted Vest\"],\"video_link\":\"https://youtu.be/Hf_HQ6wAssQ\"},{\"type\":\"Standing Calf Raise - Machine\",\"exercise_1\":[\"Uni-Lateral\",\"Narrow Stance\",\"Hip Width Stance\",\"Wide Stance\"],\"exercise_2\":[],\"implementation_options\":[\"Dumbbell\",\"Kettlebell\",\"Sandbag\",\"Barbell\",\"Safety Bar\",\"Band\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Chains\",\"Weighted Vest\"],\"video_link\":\"https://youtu.be/lbSYkeLnsXM\"},{\"type\":\"Standing Calf Raise - Unilateral\",\"exercise_1\":[\"Uni-Lateral\",\"Narrow Stance\",\"Hip Width Stance\",\"Wide Stance\"],\"exercise_2\":[],\"implementation_options\":[\"Dumbbell\",\"Kettlebell\",\"Sandbag\",\"Barbell\",\"Safety Bar\",\"Band\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Chains\",\"Weighted Vest\"],\"video_link\":\"https://youtu.be/zCejjSCvNdc\"},{\"type\":\"Seated Calf Raise - Machine\",\"exercise_1\":[\"Uni-Lateral\",\"Narrow Stance\",\"Hip Width Stance\",\"Wide Stance\"],\"exercise_2\":[],\"implementation_options\":[\"Dumbbell\",\"Kettlebell\",\"Sandbag\",\"Barbell\",\"Safety Bar\",\"Band\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Chains\",\"Weighted Vest\"],\"video_link\":\"\"},{\"type\":\"Seated Calf Raise - DB - Unilateral\",\"exercise_1\":[\"Uni-Lateral\",\"Narrow Stance\",\"Hip Width Stance\",\"Wide Stance\"],\"exercise_2\":[],\"implementation_options\":[\"Dumbbell\",\"Kettlebell\",\"Sandbag\",\"Barbell\",\"Safety Bar\",\"Band\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Chains\",\"Weighted Vest\"],\"video_link\":\"\"}]'),
(5, 'Forearms', '[{\"type\":\"Gripper Machine\",\"exercise_1\":[\"One-Arm\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\",\"Triceps Rope\",\"Hammer Rope\"],\"exercise_2\":[],\"implementation_options\":[\"Captains of Crush\",\"Leverage Bar\",\"Clubbell\",\"Dumbbell\",\"Barbell\",\"Kettlebell\",\"Fat Grip Barbell\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Zenith Gripper\"],\"video_link\":\"\"},{\"type\":\"Spring Gripper\",\"exercise_1\":[\"One-Arm\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\",\"Triceps Rope\",\"Hammer Rope\"],\"exercise_2\":[],\"implementation_options\":[\"Captains of Crush\",\"Leverage Bar\",\"Clubbell\",\"Dumbbell\",\"Barbell\",\"Kettlebell\",\"Fat Grip Barbell\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Zenith Gripper\"],\"video_link\":\"\"},{\"type\":\"Radial Flexion\",\"exercise_1\":[\"One-Arm\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\",\"Triceps Rope\",\"Hammer Rope\"],\"exercise_2\":[],\"implementation_options\":[\"Captains of Crush\",\"Leverage Bar\",\"Clubbell\",\"Dumbbell\",\"Barbell\",\"Kettlebell\",\"Fat Grip Barbell\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Zenith Gripper\"],\"video_link\":\"https://youtu.be/eYl5aqtpx4A\"},{\"type\":\"Ulnar Flexion\",\"exercise_1\":[\"One-Arm\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\",\"Triceps Rope\",\"Hammer Rope\"],\"exercise_2\":[],\"implementation_options\":[\"Captains of Crush\",\"Leverage Bar\",\"Clubbell\",\"Dumbbell\",\"Barbell\",\"Kettlebell\",\"Fat Grip Barbell\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Zenith Gripper\"],\"video_link\":\"https://youtu.be/CWDl3Gegk34\"},{\"type\":\"Wrist Curl - Forearm bench - Barbell\",\"exercise_1\":[\"One-Arm\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\",\"Triceps Rope\",\"Hammer Rope\"],\"exercise_2\":[],\"implementation_options\":[\"Captains of Crush\",\"Leverage Bar\",\"Clubbell\",\"Dumbbell\",\"Barbell\",\"Kettlebell\",\"Fat Grip Barbell\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Zenith Gripper\"],\"video_link\":\"https://youtu.be/AOtIDd-sDpc\"},{\"type\":\"Wrist Curl - Forearm Bench- DB\",\"exercise_1\":[\"One-Arm\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\",\"Triceps Rope\",\"Hammer Rope\"],\"exercise_2\":[],\"implementation_options\":[\"Captains of Crush\",\"Leverage Bar\",\"Clubbell\",\"Dumbbell\",\"Barbell\",\"Kettlebell\",\"Fat Grip Barbell\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Zenith Gripper\"],\"video_link\":\"https://youtu.be/4xuFvlYQCx0\"},{\"type\":\"Wrist Curl - Flat Bench - Cable\",\"exercise_1\":[\"One-Arm\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\",\"Triceps Rope\",\"Hammer Rope\"],\"exercise_2\":[],\"implementation_options\":[\"Captains of Crush\",\"Leverage Bar\",\"Clubbell\",\"Dumbbell\",\"Barbell\",\"Kettlebell\",\"Fat Grip Barbell\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Zenith Gripper\"],\"video_link\":\"https://youtu.be/txFFtWBoNfk\"},{\"type\":\"Wrist Curl - Standing - Behind the Back\",\"exercise_1\":[\"One-Arm\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\",\"Triceps Rope\",\"Hammer Rope\"],\"exercise_2\":[],\"implementation_options\":[\"Captains of Crush\",\"Leverage Bar\",\"Clubbell\",\"Dumbbell\",\"Barbell\",\"Kettlebell\",\"Fat Grip Barbell\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Zenith Gripper\"],\"video_link\":\"https://youtu.be/o5sPEDFGkhM\"},{\"type\":\"Wrist Extension - Forearm Bench - Barbell\",\"exercise_1\":[\"One-Arm\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\",\"Triceps Rope\",\"Hammer Rope\"],\"exercise_2\":[],\"implementation_options\":[\"Captains of Crush\",\"Leverage Bar\",\"Clubbell\",\"Dumbbell\",\"Barbell\",\"Kettlebell\",\"Fat Grip Barbell\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Zenith Gripper\"],\"video_link\":\"https://youtu.be/qL3gicc7C1w\"},{\"type\":\"Wrist Extension - Forearm Bench - DB\",\"exercise_1\":[\"One-Arm\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\",\"Triceps Rope\",\"Hammer Rope\"],\"exercise_2\":[],\"implementation_options\":[\"Captains of Crush\",\"Leverage Bar\",\"Clubbell\",\"Dumbbell\",\"Barbell\",\"Kettlebell\",\"Fat Grip Barbell\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Zenith Gripper\"],\"video_link\":\"https://youtu.be/TEWE284Kfio\"},{\"type\":\"Wrist Extension - Incline Bench - One-Arm Cable\",\"exercise_1\":[\"One-Arm\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\",\"Triceps Rope\",\"Hammer Rope\"],\"exercise_2\":[],\"implementation_options\":[\"Captains of Crush\",\"Leverage Bar\",\"Clubbell\",\"Dumbbell\",\"Barbell\",\"Kettlebell\",\"Fat Grip Barbell\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Zenith Gripper\"],\"video_link\":\"https://youtu.be/57zun7SMNsw\"},{\"type\":\"Wrist Pronation - Hammer Rope - Cable\",\"exercise_1\":[\"One-Arm\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\",\"Triceps Rope\",\"Hammer Rope\"],\"exercise_2\":[],\"implementation_options\":[\"Captains of Crush\",\"Leverage Bar\",\"Clubbell\",\"Dumbbell\",\"Barbell\",\"Kettlebell\",\"Fat Grip Barbell\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Zenith Gripper\"],\"video_link\":\"https://youtu.be/h7w9NB0WavQ\"},{\"type\":\"Wrist Supination - Hammer Rope - Cable\",\"exercise_1\":[\"One-Arm\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\",\"Triceps Rope\",\"Hammer Rope\"],\"exercise_2\":[],\"implementation_options\":[\"Captains of Crush\",\"Leverage Bar\",\"Clubbell\",\"Dumbbell\",\"Barbell\",\"Kettlebell\",\"Fat Grip Barbell\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Zenith Gripper\"],\"video_link\":\"https://youtu.be/A8uNSW-viAc\"},{\"type\":\"Wrist Supination - DB\",\"exercise_1\":[\"One-Arm\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\",\"Triceps Rope\",\"Hammer Rope\"],\"exercise_2\":[],\"implementation_options\":[\"Captains of Crush\",\"Leverage Bar\",\"Clubbell\",\"Dumbbell\",\"Barbell\",\"Kettlebell\",\"Fat Grip Barbell\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Zenith Gripper\"],\"video_link\":\"https://youtu.be/GG_2MYnmCwM\"},{\"type\":\"Wrist Roller\",\"exercise_1\":[\"One-Arm\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\",\"Triceps Rope\",\"Hammer Rope\"],\"exercise_2\":[],\"implementation_options\":[\"Captains of Crush\",\"Leverage Bar\",\"Clubbell\",\"Dumbbell\",\"Barbell\",\"Kettlebell\",\"Fat Grip Barbell\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Zenith Gripper\"],\"video_link\":\"\"},{\"type\":\"Wrist Extension - Squatting Low Pulley\",\"exercise_1\":[\"One-Arm\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\",\"Triceps Rope\",\"Hammer Rope\"],\"exercise_2\":[],\"implementation_options\":[\"Captains of Crush\",\"Leverage Bar\",\"Clubbell\",\"Dumbbell\",\"Barbell\",\"Kettlebell\",\"Fat Grip Barbell\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Zenith Gripper\"],\"video_link\":\"https://youtu.be/HhXDzUUBQlQ\"},{\"type\":\"Wrist Supination - Kneeling Low Pulley\",\"exercise_1\":[\"One-Arm\",\"Close Grip\",\"Medium Grip\",\"Wide Grip\",\"Triceps Rope\",\"Hammer Rope\"],\"exercise_2\":[],\"implementation_options\":[\"Captains of Crush\",\"Leverage Bar\",\"Clubbell\",\"Dumbbell\",\"Barbell\",\"Kettlebell\",\"Fat Grip Barbell\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Zenith Gripper\"],\"video_link\":\"https://youtu.be/bMgxVk5bby0\"}]'),
(6, 'Hamstrings', '[{\"type\":\"TRX Leg Curl - Bilateral\",\"exercise_1\":[\"Uni-Lateral\",\"Heels Together\",\"Hip Width Stance\",\"Wide Stance\",\"Dorsiflexed\",\"Plantarflexed\",\"Poliquin\",\"2 up 1 down\",\"1.25 reps\",\"\"],\"exercise_2\":[],\"implementation_options\":[\"Dumbbell\",\"Kettlebell\",\"Barbell\",\"Banded\",\"Medicine Ball\",\"weight vest\",\"Chains\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\"],\"video_link\":\"https:\\/\\/youtu.be\\/3LmIDgLsHmg\"},{\"type\":\"TRX Leg Curl - Alternating\",\"exercise_1\":[\"Uni-Lateral\",\"Heels Together\",\"Hip Width Stance\",\"Wide Stance\",\"Dorsiflexed\",\"Plantarflexed\",\"Poliquin\",\"2 up 1 down\",\"1.25 reps\",\"\"],\"exercise_2\":[],\"implementation_options\":[\"Dumbbell\",\"Kettlebell\",\"Barbell\",\"Banded\",\"Medicine Ball\",\"weight vest\",\"Chains\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\"],\"video_link\":\"https:\\/\\/youtu.be\\/nKZR_bWAcJo\"},{\"type\":\"Swiss Ball Leg Curl\",\"exercise_1\":[\"Uni-Lateral\",\"Heels Together\",\"Hip Width Stance\",\"Wide Stance\",\"Dorsiflexed\",\"Plantarflexed\",\"Poliquin\",\"2 up 1 down\",\"1.25 reps\",\"\"],\"exercise_2\":[],\"implementation_options\":[\"Dumbbell\",\"Kettlebell\",\"Barbell\",\"Banded\",\"Medicine Ball\",\"weight vest\",\"Chains\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\"],\"video_link\":\"https:\\/\\/youtu.be\\/FM80gwaMkeU\"},{\"type\":\"Swiss Ball Leg Curl - 2 up 1 down\",\"exercise_1\":[\"Uni-Lateral\",\"Heels Together\",\"Hip Width Stance\",\"Wide Stance\",\"Dorsiflexed\",\"Plantarflexed\",\"Poliquin\",\"2 up 1 down\",\"1.25 reps\",\"\"],\"exercise_2\":[],\"implementation_options\":[\"Dumbbell\",\"Kettlebell\",\"Barbell\",\"Banded\",\"Medicine Ball\",\"weight vest\",\"Chains\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\"],\"video_link\":\"https:\\/\\/youtu.be\\/XHqHxlqU3N0\"},{\"type\":\"Kneeling Leg Curl - Dorsiflexed\",\"exercise_1\":[\"Uni-Lateral\",\"Heels Together\",\"Hip Width Stance\",\"Wide Stance\",\"Dorsiflexed\",\"Plantarflexed\",\"Poliquin\",\"2 up 1 down\",\"1.25 reps\",\"\"],\"exercise_2\":[],\"implementation_options\":[\"Dumbbell\",\"Kettlebell\",\"Barbell\",\"Banded\",\"Medicine Ball\",\"weight vest\",\"Chains\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\"],\"video_link\":\"https:\\/\\/youtu.be\\/sKxxNOkrr44\"},{\"type\":\"Kneeling Leg Curl - Plantarflexed\",\"exercise_1\":[\"Uni-Lateral\",\"Heels Together\",\"Hip Width Stance\",\"Wide Stance\",\"Dorsiflexed\",\"Plantarflexed\",\"Poliquin\",\"2 up 1 down\",\"1.25 reps\",\"\"],\"exercise_2\":[],\"implementation_options\":[\"Dumbbell\",\"Kettlebell\",\"Barbell\",\"Banded\",\"Medicine Ball\",\"weight vest\",\"Chains\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\"],\"video_link\":\"https:\\/\\/youtu.be\\/NC7m1_1U5w0\"},{\"type\":\"Kneeling Leg Curl - Poliquin\",\"exercise_1\":[\"Uni-Lateral\",\"Heels Together\",\"Hip Width Stance\",\"Wide Stance\",\"Dorsiflexed\",\"Plantarflexed\",\"Poliquin\",\"2 up 1 down\",\"1.25 reps\",\"\"],\"exercise_2\":[],\"implementation_options\":[\"Dumbbell\",\"Kettlebell\",\"Barbell\",\"Banded\",\"Medicine Ball\",\"weight vest\",\"Chains\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\"],\"video_link\":\"https:\\/\\/youtu.be\\/9O4-MxNzDkA\"},{\"type\":\"Prone Leg Curl - Dorsiflexed\",\"exercise_1\":[\"Uni-Lateral\",\"Heels Together\",\"Hip Width Stance\",\"Wide Stance\",\"Dorsiflexed\",\"Plantarflexed\",\"Poliquin\",\"2 up 1 down\",\"1.25 reps\",\"\"],\"exercise_2\":[],\"implementation_options\":[\"Dumbbell\",\"Kettlebell\",\"Barbell\",\"Banded\",\"Medicine Ball\",\"weight vest\",\"Chains\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\"],\"video_link\":\"https:\\/\\/youtu.be\\/3kWbnM3quDc\"},{\"type\":\"Prone Leg Curl - Plantarflexed\",\"exercise_1\":[\"Uni-Lateral\",\"Heels Together\",\"Hip Width Stance\",\"Wide Stance\",\"Dorsiflexed\",\"Plantarflexed\",\"Poliquin\",\"2 up 1 down\",\"1.25 reps\",\"\"],\"exercise_2\":[],\"implementation_options\":[\"Dumbbell\",\"Kettlebell\",\"Barbell\",\"Banded\",\"Medicine Ball\",\"weight vest\",\"Chains\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\"],\"video_link\":\"https:\\/\\/youtu.be\\/xmWWvFmUtKU\"},{\"type\":\"Prone Leg Curl - Poliquin\",\"exercise_1\":[\"Uni-Lateral\",\"Heels Together\",\"Hip Width Stance\",\"Wide Stance\",\"Dorsiflexed\",\"Plantarflexed\",\"Poliquin\",\"2 up 1 down\",\"1.25 reps\",\"\"],\"exercise_2\":[],\"implementation_options\":[\"Dumbbell\",\"Kettlebell\",\"Barbell\",\"Banded\",\"Medicine Ball\",\"weight vest\",\"Chains\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\"],\"video_link\":\"https:\\/\\/youtu.be\\/267gWQFb5HI\"},{\"type\":\"Prone Leg Curl - 2 up 1 down\",\"exercise_1\":[\"Uni-Lateral\",\"Heels Together\",\"Hip Width Stance\",\"Wide Stance\",\"Dorsiflexed\",\"Plantarflexed\",\"Poliquin\",\"2 up 1 down\",\"1.25 reps\",\"\"],\"exercise_2\":[],\"implementation_options\":[\"Dumbbell\",\"Kettlebell\",\"Barbell\",\"Banded\",\"Medicine Ball\",\"weight vest\",\"Chains\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\"],\"video_link\":\"https:\\/\\/youtu.be\\/qV2T6YXeRe8\"},{\"type\":\"Glute-Hamstrings Raise\",\"exercise_1\":[\"Uni-Lateral\",\"Heels Together\",\"Hip Width Stance\",\"Wide Stance\",\"Dorsiflexed\",\"Plantarflexed\",\"Poliquin\",\"2 up 1 down\",\"1.25 reps\",\"\"],\"exercise_2\":[],\"implementation_options\":[\"Dumbbell\",\"Kettlebell\",\"Barbell\",\"Banded\",\"Medicine Ball\",\"weight vest\",\"Chains\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\"],\"video_link\":\"https:\\/\\/youtu.be\\/VWbLyfj3i_k\"},{\"type\":\"Nordic Eccentric Hamstrings Curl\",\"exercise_1\":[\"Uni-Lateral\",\"Heels Together\",\"Hip Width Stance\",\"Wide Stance\",\"Dorsiflexed\",\"Plantarflexed\",\"Poliquin\",\"2 up 1 down\",\"1.25 reps\",\"\"],\"exercise_2\":[],\"implementation_options\":[\"Dumbbell\",\"Kettlebell\",\"Barbell\",\"Banded\",\"Medicine Ball\",\"weight vest\",\"Chains\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\"],\"video_link\":\"https:\\/\\/youtu.be\\/hNINeB4zXkI\"},{\"type\":\"Seated Leg Curl \",\"exercise_1\":[\"Uni-Lateral\",\"Heels Together\",\"Hip Width Stance\",\"Wide Stance\",\"Dorsiflexed\",\"Plantarflexed\",\"Poliquin\",\"2 up 1 down\",\"1.25 reps\",\"\"],\"exercise_2\":[],\"implementation_options\":[\"Dumbbell\",\"Kettlebell\",\"Barbell\",\"Banded\",\"Medicine Ball\",\"weight vest\",\"Chains\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\"],\"video_link\":\"\"},{\"type\":\"Standing Leg Curl\",\"exercise_1\":[\"Uni-Lateral\",\"Heels Together\",\"Hip Width Stance\",\"Wide Stance\",\"Dorsiflexed\",\"Plantarflexed\",\"Poliquin\",\"2 up 1 down\",\"1.25 reps\",\"\"],\"exercise_2\":[],\"implementation_options\":[\"Dumbbell\",\"Kettlebell\",\"Barbell\",\"Banded\",\"Medicine Ball\",\"weight vest\",\"Chains\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\"],\"video_link\":\"\"},{\"type\":\"Jumping Jack\",\"exercise_1\":[\"Short\",\"Long\"],\"exercise_2\":[],\"implementation_options\":null,\"video_link\":\"link\"}]'),
(7, 'Neck', '[{\"type\":\"Neck Extension, Prone\",\"exercise_1\":[\"Harness\",\"Machine\",\"Standing  Swiss Ball\",\"Supine  Swiss Ball\",\"Towel\",\"Isometric\",\"Kneeling\"],\"exercise_2\":[],\"implementation_options\":[\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Bands\",\"Dumbbell\",\"weight plate\",\"Band \"],\"video_link\":\"https://youtu.be/5TTLC-Bmafg\"},{\"type\":\"Neck Extension, Machine\",\"exercise_1\":[\"Harness\",\"Machine\",\"Standing  Swiss Ball\",\"Supine  Swiss Ball\",\"Towel\",\"Isometric\",\"Kneeling\"],\"exercise_2\":[],\"implementation_options\":[\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Bands\",\"Dumbbell\",\"weight plate\",\"Band \"],\"video_link\":\"https://youtu.be/S1XQTCTb8hY\"},{\"type\":\"Neck Extension - Standing - Swiss Ball\",\"exercise_1\":[\"Harness\",\"Machine\",\"Standing  Swiss Ball\",\"Supine  Swiss Ball\",\"Towel\",\"Isometric\",\"Kneeling\"],\"exercise_2\":[],\"implementation_options\":[\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Bands\",\"Dumbbell\",\"weight plate\",\"Band \"],\"video_link\":\"https://youtu.be/5u5WFLoIR24\"},{\"type\":\"Neck Extension - Supine - Swiss Ball\",\"exercise_1\":[\"Harness\",\"Machine\",\"Standing  Swiss Ball\",\"Supine  Swiss Ball\",\"Towel\",\"Isometric\",\"Kneeling\"],\"exercise_2\":[],\"implementation_options\":[\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Bands\",\"Dumbbell\",\"weight plate\",\"Band \"],\"video_link\":\"https://youtu.be/GDQz8x4McJI\"},{\"type\":\"Neck Extension - Harness\",\"exercise_1\":[\"Harness\",\"Machine\",\"Standing  Swiss Ball\",\"Supine  Swiss Ball\",\"Towel\",\"Isometric\",\"Kneeling\"],\"exercise_2\":[],\"implementation_options\":[\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Bands\",\"Dumbbell\",\"weight plate\",\"Band \"],\"video_link\":\"\"},{\"type\":\"Neck Flexion - Supine\",\"exercise_1\":[\"Harness\",\"Machine\",\"Standing  Swiss Ball\",\"Supine  Swiss Ball\",\"Towel\",\"Isometric\",\"Kneeling\"],\"exercise_2\":[],\"implementation_options\":[\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Bands\",\"Dumbbell\",\"weight plate\",\"Band \"],\"video_link\":\"https://youtu.be/ZSY6p9X2zGo\"},{\"type\":\"Neck Flexion - Machine\",\"exercise_1\":[\"Harness\",\"Machine\",\"Standing  Swiss Ball\",\"Supine  Swiss Ball\",\"Towel\",\"Isometric\",\"Kneeling\"],\"exercise_2\":[],\"implementation_options\":[\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Bands\",\"Dumbbell\",\"weight plate\",\"Band \"],\"video_link\":\"\"},{\"type\":\"Neck Flexion - Standing - Swiss Ball\",\"exercise_1\":[\"Harness\",\"Machine\",\"Standing  Swiss Ball\",\"Supine  Swiss Ball\",\"Towel\",\"Isometric\",\"Kneeling\"],\"exercise_2\":[],\"implementation_options\":[\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Bands\",\"Dumbbell\",\"weight plate\",\"Band \"],\"video_link\":\"\"},{\"type\":\"Neck Flexion - Kneeling - Swiss Ball\",\"exercise_1\":[\"Harness\",\"Machine\",\"Standing  Swiss Ball\",\"Supine  Swiss Ball\",\"Towel\",\"Isometric\",\"Kneeling\"],\"exercise_2\":[],\"implementation_options\":[\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Bands\",\"Dumbbell\",\"weight plate\",\"Band \"],\"video_link\":\"\"},{\"type\":\"Neck Lateral Flexion - Swiss Ball\",\"exercise_1\":[\"Harness\",\"Machine\",\"Standing  Swiss Ball\",\"Supine  Swiss Ball\",\"Towel\",\"Isometric\",\"Kneeling\"],\"exercise_2\":[],\"implementation_options\":[\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Bands\",\"Dumbbell\",\"weight plate\",\"Band \"],\"video_link\":\"https://youtu.be/vq_URF2BpxY\"},{\"type\":\"Neck Lateral Flexion - Machine\",\"exercise_1\":[\"Harness\",\"Machine\",\"Standing  Swiss Ball\",\"Supine  Swiss Ball\",\"Towel\",\"Isometric\",\"Kneeling\"],\"exercise_2\":[],\"implementation_options\":[\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Bands\",\"Dumbbell\",\"weight plate\",\"Band \"],\"video_link\":\"https://youtu.be/_slfSI6CR7E\"},{\"type\":\"Neck Lateral Flexion - Harness\",\"exercise_1\":[\"Harness\",\"Machine\",\"Standing  Swiss Ball\",\"Supine  Swiss Ball\",\"Towel\",\"Isometric\",\"Kneeling\"],\"exercise_2\":[],\"implementation_options\":[\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Bands\",\"Dumbbell\",\"weight plate\",\"Band \"],\"video_link\":\"\"}]');
INSERT INTO `workout_exercise_options_tbl` (`id`, `part`, `options`) VALUES
(8, 'Pectorals', '[{\"type\":\"Incline Bench Press\",\"exercise_1\":[\"10 deg Incline\",\"15 deg Incline\",\"30 deg Incline\",\"45 deg Incline\",\"60 deg Incline\",\"75 deg Incline\"],\"exercise_2\":[\"Neutral\",\"Pronated\",\"Semi Pronated\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Bar\",\"Football Bar\",\"Thick Bar\",\"TRX\",\"Kettlebell\",\"EZ Bar\",\"Log Bar\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Thick Dumbbell\",\"Cambered Bar\",\"Fat Gripz\",\"Multi-Grip Bar\",\"add Custom\"],\"video_link\":\"https://youtu.be/gpiFIJefGKI\"},{\"type\":\"Incline Bench Press - Close Grip\",\"exercise_1\":[\"10 deg Incline\",\"15 deg Incline\",\"30 deg Incline\",\"45 deg Incline\",\"60 deg Incline\",\"75 deg Incline\"],\"exercise_2\":[\"Neutral\",\"Pronated\",\"Semi Pronated\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Bar\",\"Football Bar\",\"Thick Bar\",\"TRX\",\"Kettlebell\",\"EZ Bar\",\"Log Bar\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Thick Dumbbell\",\"Cambered Bar\",\"Fat Gripz\",\"Multi-Grip Bar\",\"add Custom\"],\"video_link\":\"\"},{\"type\":\"Incline Bench Press - Mid Grip\",\"exercise_1\":[\"10 deg Incline\",\"15 deg Incline\",\"30 deg Incline\",\"45 deg Incline\",\"60 deg Incline\",\"75 deg Incline\"],\"exercise_2\":[\"Neutral\",\"Pronated\",\"Semi Pronated\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Bar\",\"Football Bar\",\"Thick Bar\",\"TRX\",\"Kettlebell\",\"EZ Bar\",\"Log Bar\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Thick Dumbbell\",\"Cambered Bar\",\"Fat Gripz\",\"Multi-Grip Bar\",\"add Custom\"],\"video_link\":\"https://youtu.be/ddkCB2BlKXQ\"},{\"type\":\"Incline Bench Press - Wide Grip\",\"exercise_1\":[\"10 deg Incline\",\"15 deg Incline\",\"30 deg Incline\",\"45 deg Incline\",\"60 deg Incline\",\"75 deg Incline\"],\"exercise_2\":[\"Neutral\",\"Pronated\",\"Semi Pronated\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Bar\",\"Football Bar\",\"Thick Bar\",\"TRX\",\"Kettlebell\",\"EZ Bar\",\"Log Bar\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Thick Dumbbell\",\"Cambered Bar\",\"Fat Gripz\",\"Multi-Grip Bar\",\"add Custom\"],\"video_link\":\"https://youtu.be/D_Xg7Br-eq4\"},{\"type\":\"Incline Bench Press - Neutral Grip\",\"exercise_1\":[\"10 deg Incline\",\"15 deg Incline\",\"30 deg Incline\",\"45 deg Incline\",\"60 deg Incline\",\"75 deg Incline\"],\"exercise_2\":[\"Neutral\",\"Pronated\",\"Semi Pronated\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Bar\",\"Football Bar\",\"Thick Bar\",\"TRX\",\"Kettlebell\",\"EZ Bar\",\"Log Bar\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Thick Dumbbell\",\"Cambered Bar\",\"Fat Gripz\",\"Multi-Grip Bar\",\"add Custom\"],\"video_link\":\"\"},{\"type\":\"Incline DB Bench Press - Neutral Grip\",\"exercise_1\":[\"10 deg Incline\",\"15 deg Incline\",\"30 deg Incline\",\"45 deg Incline\",\"60 deg Incline\",\"75 deg Incline\"],\"exercise_2\":[],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Bar\",\"Football Bar\",\"Thick Bar\",\"TRX\",\"Kettlebell\",\"EZ Bar\",\"Log Bar\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Thick Dumbbell\",\"Cambered Bar\",\"Fat Gripz\",\"Multi-Grip Bar\",\"add Custom\"],\"video_link\":\"\"},{\"type\":\"Incline DB Bench Press - Pronated Grip\",\"exercise_1\":[\"10 deg Incline\",\"15 deg Incline\",\"30 deg Incline\",\"45 deg Incline\",\"60 deg Incline\",\"75 deg Incline\"],\"exercise_2\":[],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Bar\",\"Football Bar\",\"Thick Bar\",\"TRX\",\"Kettlebell\",\"EZ Bar\",\"Log Bar\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Thick Dumbbell\",\"Cambered Bar\",\"Fat Gripz\",\"Multi-Grip Bar\",\"add Custom\"],\"video_link\":\"https://youtu.be/kRQMiKMjRWQ\"},{\"type\":\"Incline DB Bench Press - Rotating Grip\",\"exercise_1\":[\"10 deg Incline\",\"15 deg Incline\",\"30 deg Incline\",\"45 deg Incline\",\"60 deg Incline\",\"75 deg Incline\"],\"exercise_2\":[],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Bar\",\"Football Bar\",\"Thick Bar\",\"TRX\",\"Kettlebell\",\"EZ Bar\",\"Log Bar\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Thick Dumbbell\",\"Cambered Bar\",\"Fat Gripz\",\"Multi-Grip Bar\",\"add Custom\"],\"video_link\":\"https://youtu.be/SCMf6Iy8_eo\"},{\"type\":\"Incline DB Bench Press - Semi-Pronated Grip\",\"exercise_1\":[\"10 deg Incline\",\"15 deg Incline\",\"30 deg Incline\",\"45 deg Incline\",\"60 deg Incline\",\"75 deg Incline\"],\"exercise_2\":[],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Bar\",\"Football Bar\",\"Thick Bar\",\"TRX\",\"Kettlebell\",\"EZ Bar\",\"Log Bar\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Thick Dumbbell\",\"Cambered Bar\",\"Fat Gripz\",\"Multi-Grip Bar\",\"add Custom\"],\"video_link\":\"https://youtu.be/SOajJvt4a9Q\"},{\"type\":\"Incline DB Bench Press - Semi-Supinated Grip\",\"exercise_1\":[\"10 deg Incline\",\"15 deg Incline\",\"30 deg Incline\",\"45 deg Incline\",\"60 deg Incline\",\"75 deg Incline\"],\"exercise_2\":[],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Bar\",\"Football Bar\",\"Thick Bar\",\"TRX\",\"Kettlebell\",\"EZ Bar\",\"Log Bar\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Thick Dumbbell\",\"Cambered Bar\",\"Fat Gripz\",\"Multi-Grip Bar\",\"add Custom\"],\"video_link\":\"https://youtu.be/c1mZBZpIcVQ\"},{\"type\":\"Bench Press\",\"exercise_1\":[],\"exercise_2\":[\"Neutral\",\"Pronated\",\"Semi-Pronated\",\"Semi-Supinated\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Bar\",\"Football Bar\",\"Thick Bar\",\"TRX\",\"Kettlebell\",\"EZ Bar\",\"Log Bar\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Thick Dumbbell\",\"Cambered Bar\",\"Fat Gripz\",\"Multi-Grip Bar\",\"add Custom\"],\"video_link\":\"https://youtu.be/QpiJjKxQkO0\"},{\"type\":\"Bench Press - Close Grip\",\"exercise_1\":[],\"exercise_2\":[\"Neutral\",\"Pronated\",\"Semi-Pronated\",\"Semi-Supinated\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Bar\",\"Football Bar\",\"Thick Bar\",\"TRX\",\"Kettlebell\",\"EZ Bar\",\"Log Bar\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Thick Dumbbell\",\"Cambered Bar\",\"Fat Gripz\",\"Multi-Grip Bar\",\"add Custom\"],\"video_link\":\"\"},{\"type\":\"Bench Press - Mid Grip\",\"exercise_1\":[],\"exercise_2\":[\"Neutral\",\"Pronated\",\"Semi-Pronated\",\"Semi-Supinated\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Bar\",\"Football Bar\",\"Thick Bar\",\"TRX\",\"Kettlebell\",\"EZ Bar\",\"Log Bar\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Thick Dumbbell\",\"Cambered Bar\",\"Fat Gripz\",\"Multi-Grip Bar\",\"add Custom\"],\"video_link\":\"https://youtu.be/Jd71xqb2n8s\"},{\"type\":\"Bench Press - Wide Grip\",\"exercise_1\":[],\"exercise_2\":[\"Neutral\",\"Pronated\",\"Semi-Pronated\",\"Semi-Supinated\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Bar\",\"Football Bar\",\"Thick Bar\",\"TRX\",\"Kettlebell\",\"EZ Bar\",\"Log Bar\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Thick Dumbbell\",\"Cambered Bar\",\"Fat Gripz\",\"Multi-Grip Bar\",\"add Custom\"],\"video_link\":\"https://youtu.be/OSTvGLjZZzg\"},{\"type\":\"Bench Press - Neutral Grip\",\"exercise_1\":[],\"exercise_2\":[\"Neutral\",\"Pronated\",\"Semi-Pronated\",\"Semi-Supinated\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Bar\",\"Football Bar\",\"Thick Bar\",\"TRX\",\"Kettlebell\",\"EZ Bar\",\"Log Bar\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Thick Dumbbell\",\"Cambered Bar\",\"Fat Gripz\",\"Multi-Grip Bar\",\"add Custom\"],\"video_link\":\"https://youtu.be/VJasFDt3ZZ8\"},{\"type\":\"Bench Press to the Neck - Wide Grip\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Bar\",\"Football Bar\",\"Thick Bar\",\"TRX\",\"Kettlebell\",\"EZ Bar\",\"Log Bar\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Thick Dumbbell\",\"Cambered Bar\",\"Fat Gripz\",\"Multi-Grip Bar\",\"add Custom\"],\"video_link\":\"https://youtu.be/5sWxovUqKxo\"},{\"type\":\"Bench Press to the Neck - Neutral Grip\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Bar\",\"Football Bar\",\"Thick Bar\",\"TRX\",\"Kettlebell\",\"EZ Bar\",\"Log Bar\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Thick Dumbbell\",\"Cambered Bar\",\"Fat Gripz\",\"Multi-Grip Bar\",\"add Custom\"],\"video_link\":\"https://youtu.be/5UXzh5Y_o_M\"},{\"type\":\"Bench Press to the Neck - Mid Grip\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Bar\",\"Football Bar\",\"Thick Bar\",\"TRX\",\"Kettlebell\",\"EZ Bar\",\"Log Bar\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Thick Dumbbell\",\"Cambered Bar\",\"Fat Gripz\",\"Multi-Grip Bar\",\"add Custom\"],\"video_link\":\"\"},{\"type\":\"DB Bench Press - Neutral Grip\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Bar\",\"Football Bar\",\"Thick Bar\",\"TRX\",\"Kettlebell\",\"EZ Bar\",\"Log Bar\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Thick Dumbbell\",\"Cambered Bar\",\"Fat Gripz\",\"Multi-Grip Bar\",\"add Custom\"],\"video_link\":\"https://youtu.be/1vAc-uj9jCc\"},{\"type\":\"DB Bench Press - Pronated Grip\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Bar\",\"Football Bar\",\"Thick Bar\",\"TRX\",\"Kettlebell\",\"EZ Bar\",\"Log Bar\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Thick Dumbbell\",\"Cambered Bar\",\"Fat Gripz\",\"Multi-Grip Bar\",\"add Custom\"],\"video_link\":\"https://youtu.be/sPPYzew2xaU\"},{\"type\":\"DB Bench Press - Rotating Grip\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Bar\",\"Football Bar\",\"Thick Bar\",\"TRX\",\"Kettlebell\",\"EZ Bar\",\"Log Bar\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Thick Dumbbell\",\"Cambered Bar\",\"Fat Gripz\",\"Multi-Grip Bar\",\"add Custom\"],\"video_link\":\"https://youtu.be/VKh286B5tQU\"},{\"type\":\"DB Bench Press - Semi-Pronated Grip\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Bar\",\"Football Bar\",\"Thick Bar\",\"TRX\",\"Kettlebell\",\"EZ Bar\",\"Log Bar\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Thick Dumbbell\",\"Cambered Bar\",\"Fat Gripz\",\"Multi-Grip Bar\",\"add Custom\"],\"video_link\":\"https://youtu.be/iCdq8CJxsGk\"},{\"type\":\"DB Bench Press - Semi-Supinated Grip\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Bar\",\"Football Bar\",\"Thick Bar\",\"TRX\",\"Kettlebell\",\"EZ Bar\",\"Log Bar\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Thick Dumbbell\",\"Cambered Bar\",\"Fat Gripz\",\"Multi-Grip Bar\",\"add Custom\"],\"video_link\":\"https://youtu.be/aN5xn9AZ5Eo\"},{\"type\":\"Decline Bench Press\",\"exercise_1\":[],\"exercise_2\":[\"Neutral\",\"Pronated\",\"Semi-Pronated\",\"Semi-Supinated\",\"Rotating\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Bar\",\"Football Bar\",\"Thick Bar\",\"TRX\",\"Kettlebell\",\"EZ Bar\",\"Log Bar\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Thick Dumbbell\",\"Cambered Bar\",\"Fat Gripz\",\"Multi-Grip Bar\",\"add Custom\"],\"video_link\":\"https://youtu.be/aodA5LCz6cU\"},{\"type\":\"Decline Bench Press - Mid Grip\",\"exercise_1\":[],\"exercise_2\":[\"Neutral\",\"Pronated\",\"Semi-Pronated\",\"Semi-Supinated\",\"Rotating\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Bar\",\"Football Bar\",\"Thick Bar\",\"TRX\",\"Kettlebell\",\"EZ Bar\",\"Log Bar\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Thick Dumbbell\",\"Cambered Bar\",\"Fat Gripz\",\"Multi-Grip Bar\",\"add Custom\"],\"video_link\":\"https://youtu.be/ZHJVwXVUNoc\"},{\"type\":\"Decline Bench Press - Wide Grip\",\"exercise_1\":[],\"exercise_2\":[\"Neutral\",\"Pronated\",\"Semi-Pronated\",\"Semi-Supinated\",\"Rotating\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Bar\",\"Football Bar\",\"Thick Bar\",\"TRX\",\"Kettlebell\",\"EZ Bar\",\"Log Bar\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Thick Dumbbell\",\"Cambered Bar\",\"Fat Gripz\",\"Multi-Grip Bar\",\"add Custom\"],\"video_link\":\"https://youtu.be/RyBc_Mk-Qvg\"},{\"type\":\"Decline Bench Press - Neutral Grip\",\"exercise_1\":[],\"exercise_2\":[\"Neutral\",\"Pronated\",\"Semi-Pronated\",\"Semi-Supinated\",\"Rotating\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Bar\",\"Football Bar\",\"Thick Bar\",\"TRX\",\"Kettlebell\",\"EZ Bar\",\"Log Bar\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Thick Dumbbell\",\"Cambered Bar\",\"Fat Gripz\",\"Multi-Grip Bar\",\"add Custom\"],\"video_link\":\"https://youtu.be/8J_qvGekyaw\"},{\"type\":\"Decline DB Bench Press - Neutral Grip\",\"exercise_1\":[],\"exercise_2\":[\"Neutral\",\"Pronated\",\"Semi-Pronated\",\"Semi-Supinated\",\"Rotating\"],\"implementation_options\":[],\"video_link\":\"https://youtu.be/l0VmqEFz1Bg\"},{\"type\":\"Decline DB Bench Press - Pronated Grip\",\"exercise_1\":[],\"exercise_2\":[\"Neutral\",\"Pronated\",\"Semi-Pronated\",\"Semi-Supinated\",\"Rotating\"],\"implementation_options\":[],\"video_link\":\"https://youtu.be/rHveW65KqTg\"},{\"type\":\"Decline DB Bench Press - Rotating Grip\",\"exercise_1\":[],\"exercise_2\":[\"Neutral\",\"Pronated\",\"Semi-Pronated\",\"Semi-Supinated\",\"Rotating\"],\"implementation_options\":[],\"video_link\":\"https://youtu.be/3eX1gtbiwts\"},{\"type\":\"Decline DB Bench Press - Semi-Pronated Grip\",\"exercise_1\":[],\"exercise_2\":[\"Neutral\",\"Pronated\",\"Semi-Pronated\",\"Semi-Supinated\",\"Rotating\"],\"implementation_options\":[],\"video_link\":\"https://youtu.be/jjJBW2sFrCw\"},{\"type\":\"Decline DB Bench Press - Semi-Supinated Grip\",\"exercise_1\":[],\"exercise_2\":[\"Neutral\",\"Pronated\",\"Semi-Pronated\",\"Semi-Supinated\",\"Rotating\"],\"implementation_options\":[],\"video_link\":\"https://youtu.be/VK8wo4IU1Nc\"},{\"type\":\"Rack Bench Press - Close Grip\",\"exercise_1\":[],\"exercise_2\":[\"top 1/4 lockout\",\"top 1/3 lockout\",\"top 1/2 lockout\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Bar\",\"Football Bar\",\"Thick Bar\",\"TRX\",\"Kettlebell\",\"EZ Bar\",\"Log Bar\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Thick Dumbbell\",\"Cambered Bar\",\"Fat Gripz\",\"Multi-Grip Bar\",\"add Custom\"],\"video_link\":\"\"},{\"type\":\"Rack Bench Press - Mid Grip\",\"exercise_1\":[],\"exercise_2\":[\"top 1/4 lockout\",\"top 1/3 lockout\",\"top 1/2 lockout\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Bar\",\"Football Bar\",\"Thick Bar\",\"TRX\",\"Kettlebell\",\"EZ Bar\",\"Log Bar\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Thick Dumbbell\",\"Cambered Bar\",\"Fat Gripz\",\"Multi-Grip Bar\",\"add Custom\"],\"video_link\":\"https://youtu.be/FdbDE60bJVk\"},{\"type\":\"Rack Bench Press - Wide grip\",\"exercise_1\":[],\"exercise_2\":[\"top 1/4 lockout\",\"top 1/3 lockout\",\"top 1/2 lockout\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Bar\",\"Football Bar\",\"Thick Bar\",\"TRX\",\"Kettlebell\",\"EZ Bar\",\"Log Bar\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Thick Dumbbell\",\"Cambered Bar\",\"Fat Gripz\",\"Multi-Grip Bar\",\"add Custom\"],\"video_link\":\"\"},{\"type\":\"Chest Dip\",\"exercise_1\":[\"Gironda\",\"Parallel Bar\",\"Roman Rings\",\"V Bar\"],\"exercise_2\":[\"Narrow\",\"Medium\",\"Wide\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Bar\",\"Football Bar\",\"Thick Bar\",\"TRX\",\"Kettlebell\",\"EZ Bar\",\"Log Bar\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Thick Dumbbell\",\"Cambered Bar\",\"Fat Gripz\",\"Multi-Grip Bar\",\"add Custom\"],\"video_link\":\"https://youtu.be/1U6i9CfgsbU\"},{\"type\":\"Cable Chest Fly\",\"exercise_1\":[\"Flat\",\"Incline\",\"Decline\",\"Standing\",\"Kneeling\"],\"exercise_2\":[\"Neutral Grip\",\"Pronated Grip\",\"Semi-Pronated Grip\",\"Semi-Supinated Grip\",\"Rotating Grip\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Bar\",\"Football Bar\",\"Thick Bar\",\"TRX\",\"Kettlebell\",\"EZ Bar\",\"Log Bar\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Thick Dumbbell\",\"Cambered Bar\",\"Fat Gripz\",\"Multi-Grip Bar\",\"add Custom\"],\"video_link\":\"\"},{\"type\":\"Supine Low Cable Chest Fly\",\"exercise_1\":[],\"exercise_2\":[\"Neutral Grip\",\"Pronated Grip\",\"Semi-Pronated Grip\",\"Semi-Supinated Grip\",\"Rotating Grip\"],\"implementation_options\":[],\"video_link\":\"https://youtu.be/PBLcP-bp0nw\"},{\"type\":\"Standing Cable Crossover\",\"exercise_1\":[],\"exercise_2\":[\"Neutral Grip\",\"Pronated Grip\",\"Semi-Pronated Grip\",\"Semi-Supinated Grip\",\"Rotating Grip\"],\"implementation_options\":[],\"video_link\":\"https://youtu.be/BwUQigYKrtU\"},{\"type\":\"DB Chest Fly\",\"exercise_1\":[\"Flat\",\"10 deg Incline\",\"15 deg Incline\",\"30 deg Incline\",\"45 deg Incline\",\"60 deg Incline\",\"75 deg Incline\",\"Decline\"],\"exercise_2\":[\"Neutral Grip\",\"Pronated Grip\",\"Semi-Pronated Grip\",\"Semi-Supinated Grip\",\"Rotating Grip\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Bar\",\"Football Bar\",\"Thick Bar\",\"TRX\",\"Kettlebell\",\"EZ Bar\",\"Log Bar\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Thick Dumbbell\",\"Cambered Bar\",\"Fat Gripz\",\"Multi-Grip Bar\",\"add Custom\"],\"video_link\":\"https://youtu.be/-FRDe3qBqfw\"},{\"type\":\"DB Chest Telle-Flyaway\",\"exercise_1\":[],\"exercise_2\":[\"Neutral Grip\",\"Pronated Grip\",\"Semi-Pronated Grip\",\"Semi-Supinated Grip\",\"Rotating Grip\"],\"implementation_options\":[],\"video_link\":\"https://youtu.be/m9C4hOax4jc\"},{\"type\":\"Machine Chest Fly\",\"exercise_1\":[\"Neutral\",\"Pronated\"],\"exercise_2\":[],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Bar\",\"Football Bar\",\"Thick Bar\",\"TRX\",\"Kettlebell\",\"EZ Bar\",\"Log Bar\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Thick Dumbbell\",\"Cambered Bar\",\"Fat Gripz\",\"Multi-Grip Bar\",\"add Custom\"],\"video_link\":\"\"},{\"type\":\"Machine Chest Press\",\"exercise_1\":[\"Flat\",\"10 deg Incline\",\"15 deg Incline\",\"30 deg Incline\",\"45 deg Incline\",\"60 deg Incline\",\"75 deg Incline\",\"Decline\"],\"exercise_2\":[\"Neutral Grip\",\"Pronated Grip\",\"Semi-Pronated Grip\",\"Semi-Supinated Grip\",\"Rotating Grip\",\"Converging\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Bar\",\"Football Bar\",\"Thick Bar\",\"TRX\",\"Kettlebell\",\"EZ Bar\",\"Log Bar\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Thick Dumbbell\",\"Cambered Bar\",\"Fat Gripz\",\"Multi-Grip Bar\",\"add Custom\"],\"video_link\":\"\"},{\"type\":\"Push-up\",\"exercise_1\":[\"Decline\",\"clapping\",\"Feet on Ball\",\"Feet on Bench\",\"Roman Rings\",\"Rack\",\"Bench\"],\"exercise_2\":[\"Hands Close\",\"Hands Chest Width\",\"Hands Wide\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Bar\",\"Football Bar\",\"Thick Bar\",\"TRX\",\"Kettlebell\",\"EZ Bar\",\"Log Bar\",\"Low Pulley\",\"Mid Pulley\",\"High Pulley\",\"Thick Dumbbell\",\"Cambered Bar\",\"Fat Gripz\",\"Multi-Grip Bar\",\"add Custom\"],\"video_link\":\"https://youtu.be/uNfmsy0tEqM\"},{\"type\":\"Push-ups on bars\",\"exercise_1\":[],\"exercise_2\":[\"Hands Close\",\"Hands Chest Width\",\"Hands Wide\"],\"implementation_options\":[],\"video_link\":\"https://youtu.be/gcbTWAPnG40\"},{\"type\":\"Push-up - Eccentric\",\"exercise_1\":[],\"exercise_2\":[\"Hands Close\",\"Hands Chest Width\",\"Hands Wide\"],\"implementation_options\":[],\"video_link\":\"https://youtu.be/6dwvrdFgnNg\"}]'),
(9, 'Posterior Chain/Glutes', '[{\"type\":\"Back Extension, 45 deg Incline            \",\"exercise_1\":[\"Offset\",\"Uni-Lateral\"],\"exercise_2\":[],\"implementation_options\":[\"Swiss Ball\",\"Barbell\",\"Dumbbells \",\"Kettlebell\",\"Buffalo Bar\",\"Cambered Bar\",\"Safety Bar\",\"Band\",\"High Pulley\",\"Low pulley\",\"Mid Pulley\"],\"video_link\":\"\"},{\"type\":\"Back Extension, Horizontal\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Swiss Ball\",\"Barbell\",\"Dumbbells \",\"Kettlebell\",\"Buffalo Bar\",\"Cambered Bar\",\"Safety Bar\",\"Band\",\"High Pulley\",\"Low pulley\",\"Mid Pulley\"],\"video_link\":\"\"},{\"type\":\"Seated Back Extension, Machine\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Swiss Ball\",\"Barbell\",\"Dumbbells \",\"Kettlebell\",\"Buffalo Bar\",\"Cambered Bar\",\"Safety Bar\",\"Band\",\"High Pulley\",\"Low pulley\",\"Mid Pulley\"],\"video_link\":\"\"},{\"type\":\"Low Back Extension, Incline\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[],\"video_link\":\"https://youtu.be/p4iiAmt8qSA\"},{\"type\":\"Low Back Extension, Horizontal\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[],\"video_link\":\"https://youtu.be/qRCukjm0VvI\"},{\"type\":\"Low Back Extension, Machine, seated\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[],\"video_link\":\"https://youtu.be/26GejO6Z-vs\"},{\"type\":\"Deadlift\",\"exercise_1\":[\"Clean Grip\",\"Snatch Grip\"],\"exercise_2\":[\"Podium\",\"Rack Above Knee\",\"Rack Below Knee\",\"Blocks\"],\"implementation_options\":[\"Swiss Ball\",\"Barbell\",\"Dumbbells \",\"Kettlebell\",\"Buffalo Bar\",\"Cambered Bar\",\"Safety Bar\",\"Band\",\"High Pulley\",\"Low pulley\",\"Mid Pulley\"],\"video_link\":\"https://youtu.be/oX30bN4pfC0\"},{\"type\":\"Deadlift - Dumbbell\",\"exercise_1\":[],\"exercise_2\":[\"Podium\",\"Rack Above Knee\",\"Rack Below Knee\",\"Blocks\"],\"implementation_options\":[],\"video_link\":\"https://youtu.be/v0FPERfP0HY\"},{\"type\":\"Deadlift - Trap Bar\",\"exercise_1\":[],\"exercise_2\":[\"Podium\",\"Rack Above Knee\",\"Rack Below Knee\",\"Blocks\"],\"implementation_options\":[],\"video_link\":\"https://youtu.be/gHQAa8-JzPM\"},{\"type\":\"Romanian Deadlift\",\"exercise_1\":[\"Clean Grip\",\"Snatch Grip\",\"1-Leg\"],\"exercise_2\":[\"Podium\",\"Rack Above Knee\",\"Rack Below Knee\",\"Blocks\"],\"implementation_options\":[\"Swiss Ball\",\"Barbell\",\"Buffalo Bar\",\"Cambered Bar\",\"Safety Bar\",\"Band\",\"High Pulley\",\"Low pulley\",\"Mid Pulley\"],\"video_link\":\"https://youtu.be/YxyppgpirCc\"},{\"type\":\"Romanian Deadlift - Dumbbell\",\"exercise_1\":[],\"exercise_2\":[\"Podium\",\"Rack Above Knee\",\"Rack Below Knee\",\"Blocks\"],\"implementation_options\":[],\"video_link\":\"https://www.youtube.com/watch?v=OaTPKEZwM7s\"},{\"type\":\"Romanian Deadlift - One Leg\",\"exercise_1\":[],\"exercise_2\":[\"Podium\",\"Rack Above Knee\",\"Rack Below Knee\",\"Blocks\"],\"implementation_options\":[],\"video_link\":\"https://www.youtube.com/watch?v=nRwwd3sJEo0\"},{\"type\":\"Romanian Deadlift - Kettlebell\",\"exercise_1\":[],\"exercise_2\":[\"Podium\",\"Rack Above Knee\",\"Rack Below Knee\",\"Blocks\"],\"implementation_options\":[],\"video_link\":\"https://www.youtube.com/watch?v=ppP5k1mRBmU\"},{\"type\":\"Sumo Deadlift\",\"exercise_1\":[\"Clean Grip\",\"Over-Under grip\",\"Straps\"],\"exercise_2\":[\"Podium\",\"Rack at Knee\",\"Rack Below Knee\"],\"implementation_options\":[\"Swiss Ball\",\"Barbell\",\"Dumbbells \",\"Buffalo Bar\",\"Cambered Bar\",\"Safety Bar\",\"Band\",\"High Pulley\",\"Low pulley\",\"Mid Pulley\"],\"video_link\":\"https://www.youtube.com/watch?v=_CZP77cNMIE\"},{\"type\":\"Sumo Deadlift - Kettlebell\",\"exercise_1\":[],\"exercise_2\":[\"Podium\",\"Rack at Knee\",\"Rack Below Knee\"],\"implementation_options\":[],\"video_link\":\"https://www.youtube.com/watch?v=lxeV8bbrR60\"},{\"type\":\"Glute-ham Raise\",\"exercise_1\":[\"close stance\",\"medium stance\",\"wide stance\"],\"exercise_2\":[],\"implementation_options\":[\"Barbell\",\"Dumbbells \",\"Kettlebell\",\"Buffalo Bar\",\"Cambered Bar\",\"Safety Bar\",\"Band\",\"High Pulley\",\"Low pulley\",\"Mid Pulley\"],\"video_link\":\"\"},{\"type\":\"Glute-ham Raise - Machine\",\"exercise_1\":[\"close stance\",\"medium stance\",\"wide stance\"],\"exercise_2\":[],\"implementation_options\":[],\"video_link\":\"https://www.youtube.com/watch?v=DLPHbaQ98Qw\"},{\"type\":\"Glute-ham Raise - Swiss Ball\",\"exercise_1\":[\"close stance\",\"medium stance\",\"wide stance\"],\"exercise_2\":[],\"implementation_options\":[],\"video_link\":\"https://www.youtube.com/watch?v=tgCjdrTrZek\"},{\"type\":\"Goodmorning\",\"exercise_1\":[\"Seated  Medium Stance\",\"Seated  Wide Stance\",\"Standing  Medium Stance\",\"Standing  Wide Stance\"],\"exercise_2\":[],\"implementation_options\":[\"Swiss Ball\",\"Barbell\",\"Dumbbells \",\"Kettlebell\",\"Buffalo Bar\",\"Cambered Bar\",\"Safety Bar\",\"Band\",\"High Pulley\",\"Low pulley\",\"Mid Pulley\"],\"video_link\":\"\"},{\"type\":\"Goodmorning - Seated - Sumo Stance\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[],\"video_link\":\"https://www.youtube.com/watch?v=3znzhaDptbk\"},{\"type\":\"Goodmorning - Hip Width Stance\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[],\"video_link\":\"https://www.youtube.com/watch?v=qHNxxrylTss\"},{\"type\":\"Goodmorning - One Leg\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[],\"video_link\":\"https://www.youtube.com/watch?v=laegKxNp_7k\"},{\"type\":\"Hip Bridge\",\"exercise_1\":[\"Supine\",\"Supine  Unilateral\",\"Swiss Ball\",\"Swiss Ball  Unilateral\"],\"exercise_2\":[],\"implementation_options\":[\"Swiss Ball\",\"Barbell\",\"Dumbbells \",\"Kettlebell\",\"Buffalo Bar\",\"Cambered Bar\",\"Safety Bar\",\"Band\",\"High Pulley\",\"Low pulley\",\"Mid Pulley\"],\"video_link\":\"\"},{\"type\":\"Hip Bridge + Knee Flexion Combo\",\"exercise_1\":[\"Swiss Ball\",\"Swiss Ball  Unilateral          \"],\"exercise_2\":[],\"implementation_options\":[\"Swiss Ball\",\"Barbell\",\"Dumbbells \",\"Kettlebell\",\"Buffalo Bar\",\"Cambered Bar\",\"Safety Bar\",\"Band\",\"High Pulley\",\"Low pulley\",\"Mid Pulley\"],\"video_link\":\"\"},{\"type\":\"Kettlebell Swings\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Swiss Ball\",\"Barbell\",\"Dumbbells \",\"Kettlebell\",\"Buffalo Bar\",\"Cambered Bar\",\"Safety Bar\",\"Band\",\"High Pulley\",\"Low pulley\",\"Mid Pulley\"],\"video_link\":\"\"},{\"type\":\"Cable Pull-Through\",\"exercise_1\":[\"Medium Stance \",\"Wide Stance  \"],\"exercise_2\":[],\"implementation_options\":[\"Swiss Ball\",\"Barbell\",\"Dumbbells \",\"Kettlebell\",\"Buffalo Bar\",\"Cambered Bar\",\"Safety Bar\",\"Band\",\"High Pulley\",\"Low pulley\",\"Mid Pulley\"],\"video_link\":\"https://www.youtube.com/watch?v=EhDz7NjBO2k\"},{\"type\":\"Reverse Hip Extension\",\"exercise_1\":[\"Feet Medium\",\"Feet Narrow\",\"Feet Wide                     \"],\"exercise_2\":[],\"implementation_options\":[\"Swiss Ball\",\"Barbell\",\"Dumbbells \",\"Kettlebell\",\"Buffalo Bar\",\"Cambered Bar\",\"Safety Bar\",\"Band\",\"High Pulley\",\"Low pulley\",\"Mid Pulley\"],\"video_link\":\"\"},{\"type\":\"Reverse Hip Extension - Machine\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[],\"video_link\":\"https://www.youtube.com/watch?v=hThG65m6yBo\"},{\"type\":\"Reverse Hip Extension - Swiss Ball\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[],\"video_link\":\"https://www.youtube.com/watch?v=p7iJSBNB7Uo\"},{\"type\":\"Hip Thrust - Barbell\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[],\"video_link\":\"https://www.youtube.com/watch?v=afmpHHS0d3s\"},{\"type\":\"Hip Thrust - Machine\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[],\"video_link\":\"https://www.youtube.com/watch?v=ST25yCmZ2Pw\"},{\"type\":\"Hip Extension, Incline\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[],\"video_link\":\"https://youtu.be/MwumduCFzG4\"},{\"type\":\"Hip Extension, Horizontal\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[],\"video_link\":\"https://youtu.be/9_7eR1XeQMM\"},{\"type\":\"Alternating Superman\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[],\"video_link\":\"https://www.youtube.com/watch?v=-dbCs94pTsw\"},{\"type\":\"Monster Walk\",\"exercise_1\":[\"Seated\",\"Standing\"],\"exercise_2\":[\"Machine\",\"Band\"],\"implementation_options\":[\"Swiss Ball\",\"Barbell\",\"Dumbbells \",\"Kettlebell\",\"Buffalo Bar\",\"Cambered Bar\",\"Safety Bar\",\"Band\",\"High Pulley\",\"Low pulley\",\"Mid Pulley\"],\"video_link\":\"https://www.youtube.com/watch?v=vA1uI3fBJ24\"},{\"type\":\"Side Lying Hip Abduction, Bent Knee\",\"exercise_1\":[\"Side Lying\"],\"exercise_2\":[\"Cable\"],\"implementation_options\":[\"Swiss Ball\",\"Barbell\",\"Dumbbells \",\"Kettlebell\",\"Buffalo Bar\",\"Cambered Bar\",\"Safety Bar\",\"Band\",\"High Pulley\",\"Low pulley\",\"Mid Pulley\"],\"video_link\":\"\"},{\"type\":\"Side Lying Hip Abduction\",\"exercise_1\":[],\"exercise_2\":[\"Cable\"],\"implementation_options\":[],\"video_link\":\"https://www.youtube.com/watch?v=aTzeNolKXs0\"},{\"type\":\"Cable Hip Abduction\",\"exercise_1\":[\"Seated\",\"Standing\",\"Side Lying\"],\"exercise_2\":[\"Machine\",\"Band\",\"Cable\"],\"implementation_options\":[\"Swiss Ball\",\"Barbell\",\"Dumbbells \",\"Kettlebell\",\"Buffalo Bar\",\"Cambered Bar\",\"Safety Bar\",\"Band\",\"High Pulley\",\"Low pulley\",\"Mid Pulley\"],\"video_link\":\"https://www.youtube.com/watch?v=-EeGv0Jku0g\"},{\"type\":\"Cable Hip Adduction 2\",\"exercise_1\":[],\"exercise_2\":[\"Machine\",\"Band\",\"Cable\"],\"implementation_options\":[],\"video_link\":\"https://www.youtube.com/watch?v=6XLR4iS31f8\"},{\"type\":\"Side Lying Hip Bridge, Bent Knee\",\"exercise_1\":[],\"exercise_2\":[\"Machine\",\"Band\",\"Cable\"],\"implementation_options\":[],\"video_link\":\"https://www.youtube.com/watch?v=bT7uo9RpKEY\"},{\"type\":\"Side Lying Hip Bridge, Straight leg\",\"exercise_1\":[],\"exercise_2\":[\"Machine\",\"Band\",\"Cable\"],\"implementation_options\":[],\"video_link\":\"https://www.youtube.com/watch?v=FrIBa-qhozw\"},{\"type\":\"Supine Hip Bridge\",\"exercise_1\":[\"Dynamic\"],\"exercise_2\":[],\"implementation_options\":[\"Swiss Ball\",\"Barbell\",\"Dumbbells \",\"Kettlebell\",\"Buffalo Bar\",\"Cambered Bar\",\"Safety Bar\",\"Band\",\"High Pulley\",\"Low pulley\",\"Mid Pulley\"],\"video_link\":\"\"},{\"type\":\"Supine Hip Bridge - Bent Knee\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[],\"video_link\":\"https://www.youtube.com/watch?v=ef2C0ht4hLM\"},{\"type\":\"Supine Hip Bridge - Bent Knee - Unilateral\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[],\"video_link\":\"https://www.youtube.com/watch?v=hopYJ1tJH4w\"},{\"type\":\"Supine Hip Bridge - Swiss Ball\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[],\"video_link\":\"https://www.youtube.com/watch?v=1Fymjd4dFuA\"},{\"type\":\"Supine Hip Bridge - Swiss Ball - Unilateral\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[],\"video_link\":\"https://www.youtube.com/watch?v=fYxYphbM_yA\"},{\"type\":\"Hip Hinge - Kneeling\",\"exercise_1\":[],\"exercise_2\":[\"Banded\"],\"implementation_options\":[\"Swiss Ball\",\"Barbell\",\"Dumbbells \",\"Kettlebell\",\"Buffalo Bar\",\"Cambered Bar\",\"Safety Bar\",\"Band\",\"High Pulley\",\"Low pulley\",\"Mid Pulley\"],\"video_link\":\"https://www.youtube.com/watch?v=PPaJUDFzWpw\"},{\"type\":\"Hip Hinge - Standing\",\"exercise_1\":[],\"exercise_2\":[\"Banded\"],\"implementation_options\":[\"Swiss Ball\",\"Barbell\",\"Dumbbells \",\"Kettlebell\",\"Buffalo Bar\",\"Cambered Bar\",\"Safety Bar\",\"Band\",\"High Pulley\",\"Low pulley\",\"Mid Pulley\"],\"video_link\":\"https://www.youtube.com/watch?v=TMhgqqYyopU\"},{\"type\":\"Kettlebell Swings - Hip Hinge\",\"exercise_1\":[],\"exercise_2\":[\"Banded\"],\"implementation_options\":[],\"video_link\":\"https://www.youtube.com/watch?v=sW_KJ6jerGM\"},{\"type\":\"McKenzie Press-up\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Swiss Ball\",\"Barbell\",\"Dumbbells \",\"Kettlebell\",\"Buffalo Bar\",\"Cambered Bar\",\"Safety Bar\",\"Band\",\"High Pulley\",\"Low pulley\",\"Mid Pulley\"],\"video_link\":\"\"},{\"type\":\"Prone Cobra\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Swiss Ball\",\"Barbell\",\"Dumbbells \",\"Kettlebell\",\"Buffalo Bar\",\"Cambered Bar\",\"Safety Bar\",\"Band\",\"High Pulley\",\"Low pulley\",\"Mid Pulley\"],\"video_link\":\"\"}]');
INSERT INTO `workout_exercise_options_tbl` (`id`, `part`, `options`) VALUES
(10, 'Quadriceps', '[{\"type\":\"Cossack Squat\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Buffalo Bar\"],\"video_link\":\"https://www.youtube.com/watch?v=jLv77repu1w\"},{\"type\":\"Goblet Squat\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Safety Bar\"],\"video_link\":\"https://www.youtube.com/watch?v=hfMEtl4PnDY\"},{\"type\":\"Machine Hack Squat\",\"exercise_1\":[\"Feet High\",\"Feet Low\",\"Feet Middle\"],\"exercise_2\":[\"Narrow Stance\",\"Medium Stance\",\"Wide Stance\",\"Duck Stance\",\"Platz Stance\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"Trap Bar\",\"Kettlebell\",\"Axle\",\"Cambered Bar\",\"Rocker Board            \",\"Sitfit            \",\"Wobble Board            \"],\"video_link\":\"\"},{\"type\":\"Barbell Hack Squat\",\"exercise_1\":[\"Heels Elevated\"],\"exercise_2\":[],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"Trap Bar\",\"Kettlebell\",\"Axle\",\"Cambered Bar\",\"Rocker Board            \",\"Sitfit            \",\"Wobble Board            \"],\"video_link\":\"https://www.youtube.com/watch?v=wrHErEAyWLQ\"},{\"type\":\"Leg Extension\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"Trap Bar\",\"Kettlebell\",\"Axle\",\"Cambered Bar\",\"Rocker Board            \",\"Sitfit            \",\"Wobble Board            \"],\"video_link\":\"https://www.youtube.com/watch?v=DuwF8uBfwzU\"},{\"type\":\"Leg Extension\",\"exercise_1\":[\"Unilateral            \"],\"exercise_2\":[],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"Trap Bar\",\"Kettlebell\",\"Axle\",\"Cambered Bar\",\"Rocker Board            \",\"Sitfit            \",\"Wobble Board            \"],\"video_link\":\"\"},{\"type\":\"Horizontal Leg Press\",\"exercise_1\":[\"Feet High\",\"Feet Low\",\"Feet Middle\",\"Uni-Lateral\",\"Platz Stance\"],\"exercise_2\":[\"Narrow Stance\",\"Medium Stance\",\"Wide Stance\",\"Duck Stance\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"Trap Bar\",\"Kettlebell\",\"Axle\",\"Cambered Bar\",\"Rocker Board            \",\"Sitfit            \",\"Wobble Board            \"],\"video_link\":\"\"},{\"type\":\"Incline Leg Press\",\"exercise_1\":[\"Feet High\",\"Feet Low\",\"Feet Middle\",\"Uni-Lateral\",\"Platz Stance\"],\"exercise_2\":[\"Narrow Stance\",\"Medium Stance\",\"Wide Stance\",\"Duck Stance\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"Trap Bar\",\"Kettlebell\",\"Axle\",\"Cambered Bar\",\"Rocker Board            \",\"Sitfit            \",\"Wobble Board            \"],\"video_link\":\"\"},{\"type\":\"Lunge Forward\",\"exercise_1\":[],\"exercise_2\":[\"Alternating\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"Trap Bar\",\"Kettlebell\",\"Axle\",\"Cambered Bar\",\"Rocker Board            \",\"Sitfit            \",\"Wobble Board            \"],\"video_link\":\"https://www.youtube.com/watch?v=V8J3L5k94rA\"},{\"type\":\"Lunge Reverse\",\"exercise_1\":[],\"exercise_2\":[\"Alternating\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"Trap Bar\",\"Kettlebell\",\"Axle\",\"Cambered Bar\",\"Rocker Board            \",\"Sitfit            \",\"Wobble Board            \"],\"video_link\":\"https://www.youtube.com/watch?v=5-Nl38YdG5o\"},{\"type\":\"Lunge Walking\",\"exercise_1\":[],\"exercise_2\":[\"Alternating\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"Trap Bar\",\"Kettlebell\",\"Axle\",\"Cambered Bar\",\"Rocker Board            \",\"Sitfit            \",\"Wobble Board            \"],\"video_link\":\"https://www.youtube.com/watch?v=29Smf7eP7R4\"},{\"type\":\"Lunge Walking Backward\",\"exercise_1\":[],\"exercise_2\":[\"Alternating\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"Trap Bar\",\"Kettlebell\",\"Axle\",\"Cambered Bar\",\"Rocker Board            \",\"Sitfit            \",\"Wobble Board            \"],\"video_link\":\"\"},{\"type\":\"Lunge Drop\",\"exercise_1\":[],\"exercise_2\":[\"Alternating\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"Trap Bar\",\"Kettlebell\",\"Axle\",\"Cambered Bar\",\"Rocker Board            \",\"Sitfit            \",\"Wobble Board            \"],\"video_link\":\"https://www.youtube.com/watch?v=9WBLttJPk84\"},{\"type\":\"Pendulum Squat\",\"exercise_1\":[\"Duck Stance\",\"Narrow Stance\",\"Medium Stance\",\"Wide Stance\"],\"exercise_2\":[],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"Trap Bar\",\"Kettlebell\",\"Axle\",\"Cambered Bar\",\"Rocker Board            \",\"Sitfit            \",\"Wobble Board            \"],\"video_link\":\"\"},{\"type\":\"Power Squat Machine\",\"exercise_1\":[\"Facing In\",\"Facing Out\"],\"exercise_2\":[\"Narrow Stance\",\"Medium Stance\",\"Wide Stance\",\"Duck Stance\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"Trap Bar\",\"Kettlebell\",\"Axle\",\"Cambered Bar\",\"Rocker Board            \",\"Sitfit            \",\"Wobble Board            \"],\"video_link\":\"\"},{\"type\":\"Split Squat\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"Trap Bar\",\"Kettlebell\",\"Axle\",\"Cambered Bar\",\"Rocker Board            \",\"Sitfit            \",\"Wobble Board            \"],\"video_link\":\"https://www.youtube.com/watch?v=Lm3b2S2JPPg\"},{\"type\":\"Split Squat, Front Foot Elevated\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"Trap Bar\",\"Kettlebell\",\"Axle\",\"Cambered Bar\",\"Rocker Board            \",\"Sitfit            \",\"Wobble Board            \"],\"video_link\":\"https://www.youtube.com/watch?v=gCg4gNKN1Gw\"},{\"type\":\"Split Squat, Rear Foot Elevated\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"Trap Bar\",\"Kettlebell\",\"Axle\",\"Cambered Bar\",\"Rocker Board            \",\"Sitfit            \",\"Wobble Board            \"],\"video_link\":\"https://www.youtube.com/watch?v=qTOlbsE3P2s\"},{\"type\":\"Split Squat, 1.25 reps\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"Trap Bar\",\"Kettlebell\",\"Axle\",\"Cambered Bar\",\"Rocker Board            \",\"Sitfit            \",\"Wobble Board            \"],\"video_link\":\"https://www.youtube.com/watch?v=J31GJ21SZcM\"},{\"type\":\"Front Split Squat\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"Trap Bar\",\"Kettlebell\",\"Axle\",\"Cambered Bar\",\"Rocker Board            \",\"Sitfit            \",\"Wobble Board            \"],\"video_link\":\"https://www.youtube.com/watch?v=AUyTamy63ew\"},{\"type\":\"Low Bar Squat\",\"exercise_1\":[\"Narrow Stance\",\"Medium Stance\",\"Wide Stance\"],\"exercise_2\":[\"Top 1/3 range\",\"Top 1/4 range\",\"Isometronic\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"Trap Bar\",\"Kettlebell\",\"Axle\",\"Cambered Bar\",\"Rocker Board            \",\"Sitfit            \",\"Wobble Board            \"],\"video_link\":\"\"},{\"type\":\"Squat\",\"exercise_1\":[\"Narrow Stance\",\"Medium Stance\",\"Wide Stance\",\"Duck Stance\"],\"exercise_2\":[\"Heels elevated\",\"Isometronic\",\"w/ankle extension\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"Trap Bar\",\"Kettlebell\",\"Axle\",\"Cambered Bar\",\"Rocker Board            \",\"Sitfit            \",\"Wobble Board            \"],\"video_link\":\"https://www.youtube.com/watch?v=AzTKDqebtGY\"},{\"type\":\"Squat Heels Elevated\",\"exercise_1\":[\"Narrow Stance\",\"Medium Stance\",\"Wide Stance\",\"Duck Stance\"],\"exercise_2\":[\"Heels elevated\",\"Isometronic\",\"w/ankle extension\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"Trap Bar\",\"Kettlebell\",\"Axle\",\"Cambered Bar\",\"Rocker Board            \",\"Sitfit            \",\"Wobble Board            \"],\"video_link\":\"https://www.youtube.com/watch?v=qt59JGrxGa4\"},{\"type\":\"Squat Narrow Stance\",\"exercise_1\":[\"Narrow Stance\",\"Medium Stance\",\"Wide Stance\",\"Duck Stance\"],\"exercise_2\":[\"Heels elevated\",\"Isometronic\",\"w/ankle extension\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"Trap Bar\",\"Kettlebell\",\"Axle\",\"Cambered Bar\",\"Rocker Board            \",\"Sitfit            \",\"Wobble Board            \"],\"video_link\":\"https://www.youtube.com/watch?v=cxI-r3mx1zU\"},{\"type\":\"Squat Platz Stance\",\"exercise_1\":[\"Narrow Stance\",\"Medium Stance\",\"Wide Stance\",\"Duck Stance\"],\"exercise_2\":[\"Heels elevated\",\"Isometronic\",\"w/ankle extension\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"Trap Bar\",\"Kettlebell\",\"Axle\",\"Cambered Bar\",\"Rocker Board            \",\"Sitfit            \",\"Wobble Board            \"],\"video_link\":\"https://www.youtube.com/watch?v=__uViluG7Qs\"},{\"type\":\"Squat Wide Stance\",\"exercise_1\":[\"Narrow Stance\",\"Medium Stance\",\"Wide Stance\",\"Duck Stance\"],\"exercise_2\":[\"Heels elevated\",\"Isometronic\",\"w/ankle extension\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"Trap Bar\",\"Kettlebell\",\"Axle\",\"Cambered Bar\",\"Rocker Board            \",\"Sitfit            \",\"Wobble Board            \"],\"video_link\":\"https://www.youtube.com/watch?v=sYOaREvLB6s\"},{\"type\":\"Squat 1.25 reps\",\"exercise_1\":[\"Narrow Stance\",\"Medium Stance\",\"Wide Stance\",\"Duck Stance\"],\"exercise_2\":[\"Heels elevated\",\"Isometronic\",\"w/ankle extension\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"Trap Bar\",\"Kettlebell\",\"Axle\",\"Cambered Bar\",\"Rocker Board            \",\"Sitfit            \",\"Wobble Board            \"],\"video_link\":\"https://www.youtube.com/watch?v=RLfq46qAt3s\"},{\"type\":\"Squat w/ Ankle Extension\",\"exercise_1\":[\"Narrow Stance\",\"Medium Stance\",\"Wide Stance\",\"Duck Stance\"],\"exercise_2\":[\"Heels elevated\",\"Isometronic\",\"w/ankle extension\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"Trap Bar\",\"Kettlebell\",\"Axle\",\"Cambered Bar\",\"Rocker Board            \",\"Sitfit            \",\"Wobble Board            \"],\"video_link\":\"https://www.youtube.com/watch?v=8Py3OX8DUGg\"},{\"type\":\"Cyclist Squat\",\"exercise_1\":[\"Narrow Stance\",\"Medium Stance\",\"Wide Stance\",\"Duck Stance\",\"Front Narrow Stance\",\"Front Medium Stance\",\"Front Wide Stance\",\"Front Duck Stance\"],\"exercise_2\":[\"Top 1/4 range\",\"Top 1/3 range\",\"Top 1/2 range\",\"Top 1/4 range w/ankle extension\",\"Top 1/3 range w/ankle extension\",\"Top 1/2 range w/ankle extension\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"Trap Bar\",\"Kettlebell\",\"Axle\",\"Cambered Bar\",\"Rocker Board            \",\"Sitfit            \",\"Wobble Board            \"],\"video_link\":\"https://www.youtube.com/watch?v=wxAGpTX5dOA\"},{\"type\":\"Inertia Squat\",\"exercise_1\":[\"Narrow Stance\",\"Medium Stance\",\"Wide Stance\",\"Duck Stance\",\"Front Narrow Stance\",\"Front Medium Stance\",\"Front Wide Stance\",\"Front Duck Stance\"],\"exercise_2\":[\"Top 1/4 range\",\"Top 1/3 range\",\"Top 1/2 range\",\"Top 1/4 range w/ankle extension\",\"Top 1/3 range w/ankle extension\",\"Top 1/2 range w/ankle extension\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"Trap Bar\",\"Kettlebell\",\"Axle\",\"Cambered Bar\",\"Rocker Board            \",\"Sitfit            \",\"Wobble Board            \"],\"video_link\":\"https://www.youtube.com/watch?v=JggnRrq1tuM\"},{\"type\":\"Inertia Front Squat\",\"exercise_1\":[\"Narrow Stance\",\"Medium Stance\",\"Wide Stance\",\"Duck Stance\",\"Front Narrow Stance\",\"Front Medium Stance\",\"Front Wide Stance\",\"Front Duck Stance\"],\"exercise_2\":[\"Top 1/4 range\",\"Top 1/3 range\",\"Top 1/2 range\",\"Top 1/4 range w/ankle extension\",\"Top 1/3 range w/ankle extension\",\"Top 1/2 range w/ankle extension\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"Trap Bar\",\"Kettlebell\",\"Axle\",\"Cambered Bar\",\"Rocker Board            \",\"Sitfit            \",\"Wobble Board            \"],\"video_link\":\"https://www.youtube.com/watch?v=TULK_etcNwU\"},{\"type\":\"Front Squat\",\"exercise_1\":[\"Narrow Stance\",\"Medium Stance\",\"Wide Stance\",\"Duck Stance\"],\"exercise_2\":[\"Heels elevated\",\"Isometronic\",\"w/ankle extension\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"Trap Bar\",\"Kettlebell\",\"Axle\",\"Cambered Bar\",\"Rocker Board            \",\"Sitfit            \",\"Wobble Board            \"],\"video_link\":\"https://www.youtube.com/watch?v=3baCEqriYAs\"},{\"type\":\"Front Squat Heels Elevated\",\"exercise_1\":[\"Narrow Stance\",\"Medium Stance\",\"Wide Stance\",\"Duck Stance\"],\"exercise_2\":[\"Heels elevated\",\"Isometronic\",\"w/ankle extension\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"Trap Bar\",\"Kettlebell\",\"Axle\",\"Cambered Bar\",\"Rocker Board            \",\"Sitfit            \",\"Wobble Board            \"],\"video_link\":\"https://www.youtube.com/watch?v=3baCEqriYAs\"},{\"type\":\"Front Squat Narrow Stance\",\"exercise_1\":[\"Narrow Stance\",\"Medium Stance\",\"Wide Stance\",\"Duck Stance\"],\"exercise_2\":[\"Heels elevated\",\"Isometronic\",\"w/ankle extension\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"Trap Bar\",\"Kettlebell\",\"Axle\",\"Cambered Bar\",\"Rocker Board            \",\"Sitfit            \",\"Wobble Board            \"],\"video_link\":\"https://www.youtube.com/watch?v=2feO9P57R5I\"},{\"type\":\"Front Squat Platz Stance\",\"exercise_1\":[\"Narrow Stance\",\"Medium Stance\",\"Wide Stance\",\"Duck Stance\"],\"exercise_2\":[\"Heels elevated\",\"Isometronic\",\"w/ankle extension\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"Trap Bar\",\"Kettlebell\",\"Axle\",\"Cambered Bar\",\"Rocker Board            \",\"Sitfit            \",\"Wobble Board            \"],\"video_link\":\"https://www.youtube.com/watch?v=jbXTGZxSU9o\"},{\"type\":\"Front Squat Wide Stance\",\"exercise_1\":[\"Narrow Stance\",\"Medium Stance\",\"Wide Stance\",\"Duck Stance\"],\"exercise_2\":[\"Heels elevated\",\"Isometronic\",\"w/ankle extension\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"Trap Bar\",\"Kettlebell\",\"Axle\",\"Cambered Bar\",\"Rocker Board            \",\"Sitfit            \",\"Wobble Board            \"],\"video_link\":\"https://www.youtube.com/watch?v=V3KugI2UW4k\"},{\"type\":\"Front Squat 1.25 reps\",\"exercise_1\":[\"Narrow Stance\",\"Medium Stance\",\"Wide Stance\",\"Duck Stance\"],\"exercise_2\":[\"Heels elevated\",\"Isometronic\",\"w/ankle extension\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"Trap Bar\",\"Kettlebell\",\"Axle\",\"Cambered Bar\",\"Rocker Board            \",\"Sitfit            \",\"Wobble Board            \"],\"video_link\":\"https://www.youtube.com/watch?v=ztdkvSOMp6w\"},{\"type\":\"Front Squat w/ ankle Extension\",\"exercise_1\":[\"Narrow Stance\",\"Medium Stance\",\"Wide Stance\",\"Duck Stance\"],\"exercise_2\":[\"Heels elevated\",\"Isometronic\",\"w/ankle extension\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"Trap Bar\",\"Kettlebell\",\"Axle\",\"Cambered Bar\",\"Rocker Board            \",\"Sitfit            \",\"Wobble Board            \"],\"video_link\":\"https://www.youtube.com/watch?v=I3daBUE1WjA\"},{\"type\":\"Cyclist Front Squat\",\"exercise_1\":[\"Narrow Stance\",\"Medium Stance\",\"Wide Stance\",\"Duck Stance\"],\"exercise_2\":[\"Heels elevated\",\"Isometronic\",\"w/ankle extension\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"Trap Bar\",\"Kettlebell\",\"Axle\",\"Cambered Bar\",\"Rocker Board            \",\"Sitfit            \",\"Wobble Board            \"],\"video_link\":\"https://www.youtube.com/watch?v=zepulAtsO3I\"},{\"type\":\"Single Leg Squat\",\"exercise_1\":[\"Crouching\",\"Bench Get up\"],\"exercise_2\":[],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"Trap Bar\",\"Kettlebell\",\"Axle\",\"Cambered Bar\",\"Rocker Board            \",\"Sitfit            \",\"Wobble Board            \"],\"video_link\":\"\"},{\"type\":\"Single Leg Squat on Step\",\"exercise_1\":[\"Crouching\",\"Bench Get up\"],\"exercise_2\":[],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"Trap Bar\",\"Kettlebell\",\"Axle\",\"Cambered Bar\",\"Rocker Board            \",\"Sitfit            \",\"Wobble Board            \"],\"video_link\":\"https://www.youtube.com/watch?v=pf7JBIvix18\"},{\"type\":\"Single Leg Squat Kneeling\",\"exercise_1\":[\"Crouching\",\"Bench Get up\"],\"exercise_2\":[],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"Trap Bar\",\"Kettlebell\",\"Axle\",\"Cambered Bar\",\"Rocker Board            \",\"Sitfit            \",\"Wobble Board            \"],\"video_link\":\"https://www.youtube.com/watch?v=odtC1WEmtrc\"},{\"type\":\"Pistol Squat\",\"exercise_1\":[\"heel elevated\"],\"exercise_2\":[],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"Trap Bar\",\"Kettlebell\",\"Axle\",\"Cambered Bar\",\"Rocker Board            \",\"Sitfit            \",\"Wobble Board            \"],\"video_link\":\"https://www.youtube.com/watch?v=PknB-7oh3qQ\"},{\"type\":\"Jump Squat\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"Trap Bar\",\"Kettlebell\",\"Axle\",\"Cambered Bar\",\"Rocker Board            \",\"Sitfit            \",\"Wobble Board            \"],\"video_link\":\"https://www.youtube.com/watch?v=zbSuMKeKWlc\"},{\"type\":\"Machine Squat\",\"exercise_1\":[\"Feet High\",\"Feet Low\",\"Feet Middle\",\"Uni-Lateral\",\"Platz Stance\"],\"exercise_2\":[\"Narrow Stance\",\"Medium Stance\",\"Wide Stance\",\"Duck Stance\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"Trap Bar\",\"Kettlebell\",\"Axle\",\"Cambered Bar\",\"Rocker Board            \",\"Sitfit            \",\"Wobble Board            \"],\"video_link\":\"\"},{\"type\":\"FreeMotion Squat\",\"exercise_1\":[],\"exercise_2\":[\"Narrow Stance\",\"Medium Stance\",\"Wide Stance\",\"Duck Stance\"],\"implementation_options\":[],\"video_link\":\"https://www.youtube.com/watch?v=p88I9PqO3uA\"},{\"type\":\"FreeMotion Squat off Pad\",\"exercise_1\":[],\"exercise_2\":[\"Narrow Stance\",\"Medium Stance\",\"Wide Stance\",\"Duck Stance\"],\"implementation_options\":[],\"video_link\":\"https://www.youtube.com/watch?v=oNdhMHtbX8k\"},{\"type\":\"Trap Bar Squat\",\"exercise_1\":[\"Narrow Stance\",\"Medium Stance\",\"Wide Stance\",\"Duck Stance\"],\"exercise_2\":[\"Heels elevated\",\"Isometronic\"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"Trap Bar\",\"Kettlebell\",\"Axle\",\"Cambered Bar\",\"Rocker Board            \",\"Sitfit            \",\"Wobble Board            \"],\"video_link\":\"https://www.youtube.com/watch?v=gITDm8dCa8E\"},{\"type\":\"Trap Bar Squat w/ Ankle Extension\",\"exercise_1\":[\"Narrow Stance\",\"Medium Stance\",\"Wide Stance\",\"Duck Stance\"],\"exercise_2\":[],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"Trap Bar\",\"Kettlebell\",\"Axle\",\"Cambered Bar\",\"Rocker Board            \",\"Sitfit            \",\"Wobble Board            \"],\"video_link\":\"https://www.youtube.com/watch?v=xQ_zVHk7q0I\"},{\"type\":\"Overhead Squat\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"Trap Bar\",\"Kettlebell\",\"Axle\",\"Cambered Bar\",\"Rocker Board            \",\"Sitfit            \",\"Wobble Board            \"],\"video_link\":\"https://www.youtube.com/watch?v=Z-c7QP4WFM4\"},{\"type\":\"Telemark Squat\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"Trap Bar\",\"Kettlebell\",\"Axle\",\"Cambered Bar\",\"Rocker Board            \",\"Sitfit            \",\"Wobble Board            \"],\"video_link\":\"\"},{\"type\":\"Step-up\",\"exercise_1\":[\"Front  Low Box        \",\"Poliquin          \",\"Russian  Alternating        \",\"Side  Low Box          \"],\"exercise_2\":[],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"Trap Bar\",\"Kettlebell\",\"Axle\",\"Cambered Bar\",\"Rocker Board            \",\"Sitfit            \",\"Wobble Board            \"],\"video_link\":\"\"},{\"type\":\"Step-Up Front\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"Trap Bar\",\"Kettlebell\",\"Axle\",\"Cambered Bar\",\"Rocker Board            \",\"Sitfit            \",\"Wobble Board            \"],\"video_link\":\"https://www.youtube.com/watch?v=2XTkvQNaw-4\"},{\"type\":\"Step-Up Front Alternating\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"Trap Bar\",\"Kettlebell\",\"Axle\",\"Cambered Bar\",\"Rocker Board            \",\"Sitfit            \",\"Wobble Board            \"],\"video_link\":\"https://www.youtube.com/watch?v=swwfTi4SPto\"},{\"type\":\"Step-Up Petersen\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"Trap Bar\",\"Kettlebell\",\"Axle\",\"Cambered Bar\",\"Rocker Board            \",\"Sitfit            \",\"Wobble Board            \"],\"video_link\":\"https://www.youtube.com/watch?v=GtMu8Ao4Qfw\"},{\"type\":\"Step-Up Side\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"Trap Bar\",\"Kettlebell\",\"Axle\",\"Cambered Bar\",\"Rocker Board            \",\"Sitfit            \",\"Wobble Board            \"],\"video_link\":\"https://www.youtube.com/watch?v=cZSo8Hru_vo\"},{\"type\":\"Step-Up Russian\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"Trap Bar\",\"Kettlebell\",\"Axle\",\"Cambered Bar\",\"Rocker Board            \",\"Sitfit            \",\"Wobble Board            \"],\"video_link\":\"https://www.youtube.com/watch?v=cLeTwCPGr2A\"}]'),
(11, 'Shoulders', '[{\"type\":\"Arnold Press Seated\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[],\"video_link\":\"https://www.youtube.com/watch?v=o59p20ZFj6A\"},{\"type\":\"Arnold Press Standing\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[],\"video_link\":\"https://www.youtube.com/watch?v=uTuePGuhWLs\"},{\"type\":\"Band Pull Aparts to Neck\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[],\"video_link\":\"https://www.youtube.com/watch?v=ju-DX1QH6Jk\"},{\"type\":\"Behind the Neck Press Seated\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[],\"video_link\":\"https://www.youtube.com/watch?v=70osN2Y81kQ\"},{\"type\":\"Behind the Neck Press Standing\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[],\"video_link\":\"https://www.youtube.com/watch?v=2_vHDk_xu4I\"},{\"type\":\"External Rotation\",\"exercise_1\":[\"Arm Extended and Abducted in Front\",\"Arm Extended and Abducted Overhead\",\"Arm Extended and Abducted to Side\",\"Arm Extended and Adducted to Side\",\"Arm Abducted in Front\",\"Arm Abducted to Side\",\"Arm Adducted to Side  Low Pulley\",\"Arm Adducted to Side  Mid Pulley\",\"Sidelying\",\"Cobra\",\"Cuban Press\",\"Elbow on Knee\",\"Muscle Snatch          \"],\"exercise_2\":[\"Seated\",\"Standing\",\"Kneeling\"],\"implementation_options\":[],\"video_link\":\"\"},{\"type\":\"External Rotation Seated Elbow on Knee\",\"exercise_1\":[],\"exercise_2\":[\"Seated\",\"Standing\",\"Kneeling\"],\"implementation_options\":[],\"video_link\":\"https://www.youtube.com/watch?v=16PMW9d0XoA\"},{\"type\":\"External Roration Preacher Bench Arm Horizontal Abducted\",\"exercise_1\":[],\"exercise_2\":[\"Seated\",\"Standing\",\"Kneeling\"],\"implementation_options\":[],\"video_link\":\"https://www.youtube.com/watch?v=S_tVliqcYH4\"},{\"type\":\"External Rotation Mid Pulley Arm Abducted to Side\",\"exercise_1\":[],\"exercise_2\":[\"Seated\",\"Standing\",\"Kneeling\"],\"implementation_options\":[],\"video_link\":\"https://www.youtube.com/watch?v=1KT_SHpVer4\"},{\"type\":\"External Rotation Low Pulley Arm Abducted to Side\",\"exercise_1\":[],\"exercise_2\":[\"Seated\",\"Standing\",\"Kneeling\"],\"implementation_options\":[],\"video_link\":\"https://www.youtube.com/watch?v=qsXcju8wRKY\"},{\"type\":\"External Rotation Low Pulley Pulling the Sword\",\"exercise_1\":[],\"exercise_2\":[\"Seated\",\"Standing\",\"Kneeling\"],\"implementation_options\":[],\"video_link\":\"https://www.youtube.com/watch?v=X992w6MeZhs\"},{\"type\":\"External Rotation Sidelying\",\"exercise_1\":[],\"exercise_2\":[\"Seated\",\"Standing\",\"Kneeling\"],\"implementation_options\":[],\"video_link\":\"https://www.youtube.com/watch?v=W8JBxtp0WaY\"},{\"type\":\"External Rotation Standing Cobra\",\"exercise_1\":[],\"exercise_2\":[\"Seated\",\"Standing\",\"Kneeling\"],\"implementation_options\":[],\"video_link\":\"https://www.youtube.com/watch?v=BtyTsElNmOI\"},{\"type\":\"External Rotation Cuban Press \",\"exercise_1\":[],\"exercise_2\":[\"Seated\",\"Standing\",\"Kneeling\"],\"implementation_options\":[],\"video_link\":\"https://www.youtube.com/watch?v=NxfeYpAuiao\"},{\"type\":\"Internal Rotation Mid Pulley Arm Adducted\",\"exercise_1\":[],\"exercise_2\":[\"Seated\",\"Standing\",\"Kneeling\"],\"implementation_options\":[],\"video_link\":\"https://www.youtube.com/watch?v=GEbVqZskCLI\"},{\"type\":\"Internal Rotation High Pulley Sheathing the Sword\",\"exercise_1\":[],\"exercise_2\":[\"Seated\",\"Standing\",\"Kneeling\"],\"implementation_options\":[],\"video_link\":\"https://www.youtube.com/watch?v=hU6yzBZQuAY\"},{\"type\":\"Front Raise\",\"exercise_1\":[\"15 deg Incline  Narrow Grip\",\"15 deg Incline  Medium Grip\",\"15 deg Incline  Wide Grip\",\"15 deg Incline  One Arm\",\"30 deg Incline  Narrow Grip\",\"30 deg Incline  Medium Grip\",\"30 deg Incline  Wide Grip\",\"30 deg Incline  One-Arm\",\"45 deg Incline   Narrow Grip\",\"45 deg Incline  Medium Grip\",\"45 deg Incline  Wide Grip\",\"45 deg Incline  One-Arm\",\"60 deg Incline   Narrow Grip\",\"60 deg Incline  Medium Grip\",\"60 deg Incline  Wide Grip\",\"60 deg Incline  One-Arm\",\"Chest Supported  Scott Bench\",\"Seated  Narrow\",\"Seated  Medium Grip\",\"Seated  Wide Grip\",\"Seated  One-Arm\",\"Standing  Narrow Grip\",\"Standing  Medium Grip\",\"Standing  Wide Grip\",\"Standing  One-Arm  \"],\"exercise_2\":[\"Neutral\",\"Pronated\",\"Pronating\",\"Pronated\",\"Supinating\",\"Semi-Pronated\",\"Semi-Supinated\"],\"implementation_options\":[],\"video_link\":\"\"},{\"type\":\"Front Raise Barbell \",\"exercise_1\":[],\"exercise_2\":[\"Neutral\",\"Pronated\",\"Pronating\",\"Pronated\",\"Supinating\",\"Semi-Pronated\",\"Semi-Supinated\"],\"implementation_options\":[],\"video_link\":\"https://www.youtube.com/watch?v=UyGkehERcjc\"},{\"type\":\"Front Raise Narrow Grip Barbell\",\"exercise_1\":[],\"exercise_2\":[\"Neutral\",\"Pronated\",\"Pronating\",\"Pronated\",\"Supinating\",\"Semi-Pronated\",\"Semi-Supinated\"],\"implementation_options\":[],\"video_link\":\"https://www.youtube.com/watch?v=LNGNPiepo1g\"},{\"type\":\"Front Raise Wide Grip Barbell\",\"exercise_1\":[],\"exercise_2\":[\"Neutral\",\"Pronated\",\"Pronating\",\"Pronated\",\"Supinating\",\"Semi-Pronated\",\"Semi-Supinated\"],\"implementation_options\":[],\"video_link\":\"https://www.youtube.com/watch?v=diavRSNVPKE\"},{\"type\":\"Front Raise Pronated Grip DB\",\"exercise_1\":[],\"exercise_2\":[\"Neutral\",\"Pronated\",\"Pronating\",\"Pronated\",\"Supinating\",\"Semi-Pronated\",\"Semi-Supinated\"],\"implementation_options\":[],\"video_link\":\"https://www.youtube.com/watch?v=QnPULQ0zPCg\"},{\"type\":\"Front Raise Neutral Grip DB\",\"exercise_1\":[],\"exercise_2\":[\"Neutral\",\"Pronated\",\"Pronating\",\"Pronated\",\"Supinating\",\"Semi-Pronated\",\"Semi-Supinated\"],\"implementation_options\":[],\"video_link\":\"https://www.youtube.com/watch?v=XbLSw8-WtOc\"},{\"type\":\"Front Raise Around the World Forward DB\",\"exercise_1\":[],\"exercise_2\":[\"Neutral\",\"Pronated\",\"Pronating\",\"Pronated\",\"Supinating\",\"Semi-Pronated\",\"Semi-Supinated\"],\"implementation_options\":[],\"video_link\":\"https://www.youtube.com/watch?v=hcbE-ZPzUjc\"},{\"type\":\"Front Raise Around the World Backward DB\",\"exercise_1\":[],\"exercise_2\":[\"Neutral\",\"Pronated\",\"Pronating\",\"Pronated\",\"Supinating\",\"Semi-Pronated\",\"Semi-Supinated\"],\"implementation_options\":[],\"video_link\":\"https://www.youtube.com/watch?v=rW3yubc3Wjs\"},{\"type\":\"Front Raise Seated Pronated grip DB\",\"exercise_1\":[],\"exercise_2\":[\"Neutral\",\"Pronated\",\"Pronating\",\"Pronated\",\"Supinating\",\"Semi-Pronated\",\"Semi-Supinated\"],\"implementation_options\":[],\"video_link\":\"https://www.youtube.com/watch?v=yLaI-EPKv1k\"},{\"type\":\"Front Raise Seated Neutral grip DB\",\"exercise_1\":[],\"exercise_2\":[\"Neutral\",\"Pronated\",\"Pronating\",\"Pronated\",\"Supinating\",\"Semi-Pronated\",\"Semi-Supinated\"],\"implementation_options\":[],\"video_link\":\"https://youtu.be/MTd1Nfsk-oE\"},{\"type\":\"Front Raise Preacher Bench DB\",\"exercise_1\":[],\"exercise_2\":[\"Neutral\",\"Pronated\",\"Pronating\",\"Pronated\",\"Supinating\",\"Semi-Pronated\",\"Semi-Supinated\"],\"implementation_options\":[],\"video_link\":\"https://youtu.be/DWRRq_johNA\"},{\"type\":\"Horizontal Abduction\",\"exercise_1\":[\"Seated\",\"Standing\",\"Kneeling\"],\"exercise_2\":[\"Neutral\",\"Pronated\",\"Semi-Pronated\",\"Pronated\",\"Supinating\",\"Semi-Supinated\"],\"implementation_options\":[],\"video_link\":\"\"},{\"type\":\"Landmine Press\",\"exercise_1\":[\"Neutral\",\"Pronated\"],\"exercise_2\":[\"Neutral\",\"Pronated\",\"Semi-Pronated\",\"Pronated\",\"Supinating\",\"Semi-Supinated\"],\"implementation_options\":[],\"video_link\":\"\"},{\"type\":\"Landmine Press One Arm\",\"exercise_1\":[],\"exercise_2\":[\"Neutral\",\"Pronated\",\"Semi-Pronated\",\"Pronated\",\"Supinating\",\"Semi-Supinated\"],\"implementation_options\":[],\"video_link\":\"https://youtu.be/xPp_ASF9BQc\"},{\"type\":\"Lateral Raise\",\"exercise_1\":[\"Bent-over\",\"Machine\",\"Prone  15 deg Incline\",\"Prone  30 deg Incline\",\"Prone  45 deg Incline\",\"Prone  60 deg Incline\",\"Prone  75 deg Incline\",\"Prone  Flat\",\"Seated\",\"Seated  L-Lateral\",\"Standing\",\"Standing L-Lateral\"],\"exercise_2\":[\"One-Arm\"],\"implementation_options\":[],\"video_link\":\"\"},{\"type\":\"Lateral Raise Standing DB\",\"exercise_1\":[],\"exercise_2\":[\"One-Arm\"],\"implementation_options\":[],\"video_link\":\"https://youtu.be/I60hdvMazyA\"},{\"type\":\"Lateral Raise Standing 1 arm DB\",\"exercise_1\":[],\"exercise_2\":[\"One-Arm\"],\"implementation_options\":[],\"video_link\":\"https://youtu.be/BMXFVETe08M\"},{\"type\":\"Lateral Raise Seated DB\",\"exercise_1\":[],\"exercise_2\":[\"One-Arm\"],\"implementation_options\":[],\"video_link\":\"https://youtu.be/drk4b9ltCWM\"},{\"type\":\"Lateral Raise Sidelying 1 arm DB\",\"exercise_1\":[],\"exercise_2\":[\"One-Arm\"],\"implementation_options\":[],\"video_link\":\"https://youtu.be/3sNVHTbSHX8\"},{\"type\":\"Lateral Raise Prone Incline DB\",\"exercise_1\":[],\"exercise_2\":[\"One-Arm\"],\"implementation_options\":[],\"video_link\":\"https://youtu.be/xSru_61j0q0\"},{\"type\":\"Lateral RaiseL Lateral Standing DB\",\"exercise_1\":[],\"exercise_2\":[\"One-Arm\"],\"implementation_options\":[],\"video_link\":\"https://youtu.be/epq2rnkPtfM\"},{\"type\":\"Lateral RaiseL Lateral Seated DB\",\"exercise_1\":[],\"exercise_2\":[\"One-Arm\"],\"implementation_options\":[],\"video_link\":\"https://youtu.be/IIC3hj_dm4k\"},{\"type\":\"Lateral RaiseL Lateral Seated Eccentric enhanced DB\",\"exercise_1\":[],\"exercise_2\":[\"One-Arm\"],\"implementation_options\":[],\"video_link\":\"https://youtu.be/y4_kiEy7E3g\"},{\"type\":\"Lateral RaiseBent Over DB \",\"exercise_1\":[],\"exercise_2\":[\"One-Arm\"],\"implementation_options\":[],\"video_link\":\"https://youtu.be/xLg2d4M3yiA\"},{\"type\":\"Lateral Rasie Prone Flat DB\",\"exercise_1\":[],\"exercise_2\":[\"One-Arm\"],\"implementation_options\":[],\"video_link\":\"https://youtu.be/fXfQYgRoTuw\"},{\"type\":\"Sidelying Lateral Raise\",\"exercise_1\":[\"on Forearm\",\"15 deg Incline\",\"30 deg Incline\",\"45 deg Incline           \"],\"exercise_2\":[\"Neutral\",\"Pronated\",\"Semi-Pronated\",\"Pronated\",\"Supinating\",\"Semi-Supinated\"],\"implementation_options\":[],\"video_link\":\"\"},{\"type\":\"One-arm Land Mine Press\",\"exercise_1\":[],\"exercise_2\":[\"Neutral\",\"Pronated\",\"Semi-Pronated\",\"Pronated\",\"Supinating\",\"Semi-Supinated\"],\"implementation_options\":[],\"video_link\":\"\"},{\"type\":\"Powell Raise\",\"exercise_1\":[\"15 deg Incline\",\"30 deg Incline\",\"45 deg Incline\",\"Flat\",\"Floor\",\"Swiss Ball            \"],\"exercise_2\":[\"Neutral\",\"Pronated\",\"Semi-Pronated\",\"Pronated\",\"Supinating\",\"Semi-Supinated\"],\"implementation_options\":[],\"video_link\":\"\"},{\"type\":\"Powell Raise Side Lying Flat DB\",\"exercise_1\":[],\"exercise_2\":[\"Neutral\",\"Pronated\",\"Semi-Pronated\",\"Pronated\",\"Supinating\",\"Semi-Supinated\"],\"implementation_options\":[],\"video_link\":\"https://youtu.be/gK4f-3qh_FU\"},{\"type\":\"Powell Raise Side Lying Incline DB\",\"exercise_1\":[],\"exercise_2\":[\"Neutral\",\"Pronated\",\"Semi-Pronated\",\"Pronated\",\"Supinating\",\"Semi-Supinated\"],\"implementation_options\":[],\"video_link\":\"https://youtu.be/7Eaq0gp0COo\"},{\"type\":\"Push Press Medium Grip \",\"exercise_1\":[],\"exercise_2\":[\"Neutral\",\"Pronated\",\"Semi-Pronated\",\"Pronated\",\"Supinating\",\"Semi-Supinated\"],\"implementation_options\":[],\"video_link\":\"https://youtu.be/4b2PjO2H6ZY\"},{\"type\":\"Push Press Wide Grip \",\"exercise_1\":[],\"exercise_2\":[\"Neutral\",\"Pronated\",\"Semi-Pronated\",\"Pronated\",\"Supinating\",\"Semi-Supinated\"],\"implementation_options\":[],\"video_link\":\"https://youtu.be/poL4s1p1rpk\"},{\"type\":\"Rear Delt Fly 1 arm mid pulley\",\"exercise_1\":[],\"exercise_2\":[\"Neutral\",\"Pronated\",\"Semi-Pronated\",\"Pronated\",\"Supinating\",\"Semi-Supinated\"],\"implementation_options\":[],\"video_link\":\"https://youtu.be/tY2WaqB2-p0\"},{\"type\":\"Reverse Flye\",\"exercise_1\":[\"Machine  Seated  Neutral\",\"Machine  Seated  Pronated        \"],\"exercise_2\":[\"Neutral\",\"Pronated\",\"Semi-Pronated\",\"Pronated\",\"Supinating\",\"Semi-Supinated\"],\"implementation_options\":[],\"video_link\":\"\"},{\"type\":\"Scott Press\",\"exercise_1\":[\"Seated\",\"Standing            \"],\"exercise_2\":[\"Neutral\",\"Pronated\",\"Semi-Pronated\",\"Pronated\",\"Supinating\",\"Semi-Supinated\"],\"implementation_options\":[],\"video_link\":\"\"},{\"type\":\"Shoulder Press\",\"exercise_1\":[\"Machine  Seated  Neutral\",\"Machine Seated\",\"Seated\",\"Seated Unsupportedr\",\"Standing\",\"Standing one arm anchored\"],\"exercise_2\":[\"Neutral\",\"Pronated\",\"Semi-Pronated\",\"Pronated\",\"Supinating\",\"Semi-Pronated\",\"One-Arm Neutral\",\"One-Arm Pronated\",\"One-Arm Rotating\"],\"implementation_options\":[],\"video_link\":\"\"},{\"type\":\"Shoulder Press Seated DB\",\"exercise_1\":[],\"exercise_2\":[\"Neutral\",\"Pronated\",\"Semi-Pronated\",\"Pronated\",\"Supinating\",\"Semi-Pronated\",\"One-Arm Neutral\",\"One-Arm Pronated\",\"One-Arm Rotating\"],\"implementation_options\":[],\"video_link\":\"https://youtu.be/JORr81ZOU1w\"},{\"type\":\"Shoulder Press Seated Neutral DB\",\"exercise_1\":[],\"exercise_2\":[\"Neutral\",\"Pronated\",\"Semi-Pronated\",\"Pronated\",\"Supinating\",\"Semi-Pronated\",\"One-Arm Neutral\",\"One-Arm Pronated\",\"One-Arm Rotating\"],\"implementation_options\":[],\"video_link\":\"https://youtu.be/UfKGpSFjqP0\"},{\"type\":\"Shoulder Press Seated Pronating DB\",\"exercise_1\":[],\"exercise_2\":[\"Neutral\",\"Pronated\",\"Semi-Pronated\",\"Pronated\",\"Supinating\",\"Semi-Pronated\",\"One-Arm Neutral\",\"One-Arm Pronated\",\"One-Arm Rotating\"],\"implementation_options\":[],\"video_link\":\"https://youtu.be/A9ctfpn7ZKg\"},{\"type\":\"Shoulder Press Seated SeeSaw\",\"exercise_1\":[],\"exercise_2\":[\"Neutral\",\"Pronated\",\"Semi-Pronated\",\"Pronated\",\"Supinating\",\"Semi-Pronated\",\"One-Arm Neutral\",\"One-Arm Pronated\",\"One-Arm Rotating\"],\"implementation_options\":[],\"video_link\":\"https://youtu.be/TsNP0DVQ6jI\"},{\"type\":\"Shoulder Press Seated Unsupported DB\",\"exercise_1\":[],\"exercise_2\":[\"Neutral\",\"Pronated\",\"Semi-Pronated\",\"Pronated\",\"Supinating\",\"Semi-Pronated\",\"One-Arm Neutral\",\"One-Arm Pronated\",\"One-Arm Rotating\"],\"implementation_options\":[],\"video_link\":\"https://youtu.be/2JLoz6PDNQc\"},{\"type\":\"Shoulder Press Seated Unsupported DB\",\"exercise_1\":[],\"exercise_2\":[\"Neutral\",\"Pronated\",\"Semi-Pronated\",\"Pronated\",\"Supinating\",\"Semi-Pronated\",\"One-Arm Neutral\",\"One-Arm Pronated\",\"One-Arm Rotating\"],\"implementation_options\":[],\"video_link\":\"https://youtu.be/pjwXyw_4jwU\"},{\"type\":\"Shoulder Press Seated Unsupported Pronated DB\",\"exercise_1\":[],\"exercise_2\":[\"Neutral\",\"Pronated\",\"Semi-Pronated\",\"Pronated\",\"Supinating\",\"Semi-Pronated\",\"One-Arm Neutral\",\"One-Arm Pronated\",\"One-Arm Rotating\"],\"implementation_options\":[],\"video_link\":\"https://youtu.be/fbNE9KPuDu8\"},{\"type\":\"Shoulder Press Seated Unsupported SeeSaw\",\"exercise_1\":[],\"exercise_2\":[\"Neutral\",\"Pronated\",\"Semi-Pronated\",\"Pronated\",\"Supinating\",\"Semi-Pronated\",\"One-Arm Neutral\",\"One-Arm Pronated\",\"One-Arm Rotating\"],\"implementation_options\":[],\"video_link\":\"https://youtu.be/FAK5bcAXxn8\"},{\"type\":\"Shoulder Press Standing 1 arm\",\"exercise_1\":[],\"exercise_2\":[\"Neutral\",\"Pronated\",\"Semi-Pronated\",\"Pronated\",\"Supinating\",\"Semi-Pronated\",\"One-Arm Neutral\",\"One-Arm Pronated\",\"One-Arm Rotating\"],\"implementation_options\":[],\"video_link\":\"https://youtu.be/vfdQsUoUpXw\"},{\"type\":\"Shoulder Press Standing 1 arm Neutral\",\"exercise_1\":[],\"exercise_2\":[\"Neutral\",\"Pronated\",\"Semi-Pronated\",\"Pronated\",\"Supinating\",\"Semi-Pronated\",\"One-Arm Neutral\",\"One-Arm Pronated\",\"One-Arm Rotating\"],\"implementation_options\":[],\"video_link\":\"https://youtu.be/EMLwtthBLO0\"},{\"type\":\"Shoulder Press Standing DB\",\"exercise_1\":[],\"exercise_2\":[\"Neutral\",\"Pronated\",\"Semi-Pronated\",\"Pronated\",\"Supinating\",\"Semi-Pronated\",\"One-Arm Neutral\",\"One-Arm Pronated\",\"One-Arm Rotating\"],\"implementation_options\":[],\"video_link\":\"https://youtu.be/GhEs1JcRwUY\"},{\"type\":\"Shoulder Press Standing Neutral DB\",\"exercise_1\":[],\"exercise_2\":[\"Neutral\",\"Pronated\",\"Semi-Pronated\",\"Pronated\",\"Supinating\",\"Semi-Pronated\",\"One-Arm Neutral\",\"One-Arm Pronated\",\"One-Arm Rotating\"],\"implementation_options\":[],\"video_link\":\"https://youtu.be/rDKkxmp8ty0\"},{\"type\":\"Shoulder Press Standing Barbell\",\"exercise_1\":[],\"exercise_2\":[\"Neutral\",\"Pronated\",\"Semi-Pronated\",\"Pronated\",\"Supinating\",\"Semi-Pronated\",\"One-Arm Neutral\",\"One-Arm Pronated\",\"One-Arm Rotating\"],\"implementation_options\":[],\"video_link\":\"https://youtu.be/5p_-s-rBbPM\"},{\"type\":\"Shoulder Press Standing Neutral Grip Barbell\",\"exercise_1\":[],\"exercise_2\":[\"Neutral\",\"Pronated\",\"Semi-Pronated\",\"Pronated\",\"Supinating\",\"Semi-Pronated\",\"One-Arm Neutral\",\"One-Arm Pronated\",\"One-Arm Rotating\"],\"implementation_options\":[],\"video_link\":\"https://youtu.be/SMPFCdA1kcQ\"},{\"type\":\"Shrug\",\"exercise_1\":[\"Prone  45 deg Incline\",\"Prone  60 deg Incline\",\"Prone  75 deg Incline\",\"Seated  Machine\",\"Seated\",\"Seated  One-arm\",\"Standing  Machine\",\"Standing\",\"Standing  One-arm        \"],\"exercise_2\":[\"Neutral\",\"Pronated\",\"Semi-Pronated\",\"Pronated\",\"Supinating\",\"Semi-Pronated\",\"One-Arm Neutral\",\"One-Arm Pronated\",\"One-Arm Rotating\"],\"implementation_options\":[],\"video_link\":\"\"},{\"type\":\"Shrug Standing Barbell\",\"exercise_1\":[],\"exercise_2\":[\"Neutral\",\"Pronated\",\"Semi-Pronated\",\"Pronated\",\"Supinating\",\"Semi-Pronated\",\"One-Arm Neutral\",\"One-Arm Pronated\",\"One-Arm Rotating\"],\"implementation_options\":[],\"video_link\":\"https://youtu.be/TNLZLGP-m-w\"},{\"type\":\"Shrug Standing Trap Bar\",\"exercise_1\":[],\"exercise_2\":[\"Neutral\",\"Pronated\",\"Semi-Pronated\",\"Pronated\",\"Supinating\",\"Semi-Pronated\",\"One-Arm Neutral\",\"One-Arm Pronated\",\"One-Arm Rotating\"],\"implementation_options\":[],\"video_link\":\"https://youtu.be/2B1Ztai52r8\"},{\"type\":\"Shrug Standing DB\",\"exercise_1\":[],\"exercise_2\":[\"Neutral\",\"Pronated\",\"Semi-Pronated\",\"Pronated\",\"Supinating\",\"Semi-Pronated\",\"One-Arm Neutral\",\"One-Arm Pronated\",\"One-Arm Rotating\"],\"implementation_options\":[],\"video_link\":\"https://youtu.be/B8kUBNvUrRo\"},{\"type\":\"Shrug Seated DB\",\"exercise_1\":[],\"exercise_2\":[\"Neutral\",\"Pronated\",\"Semi-Pronated\",\"Pronated\",\"Supinating\",\"Semi-Pronated\",\"One-Arm Neutral\",\"One-Arm Pronated\",\"One-Arm Rotating\"],\"implementation_options\":[],\"video_link\":\"https://youtu.be/5GsHzG9gQ1Q\"},{\"type\":\"Shrug 1 arm anchored\",\"exercise_1\":[],\"exercise_2\":[\"Neutral\",\"Pronated\",\"Semi-Pronated\",\"Pronated\",\"Supinating\",\"Semi-Pronated\",\"One-Arm Neutral\",\"One-Arm Pronated\",\"One-Arm Rotating\"],\"implementation_options\":[],\"video_link\":\"https://youtu.be/PiyOflnPR6A\"},{\"type\":\"Shrug Prone Incline DB\",\"exercise_1\":[],\"exercise_2\":[\"Neutral\",\"Pronated\",\"Semi-Pronated\",\"Pronated\",\"Supinating\",\"Semi-Pronated\",\"One-Arm Neutral\",\"One-Arm Pronated\",\"One-Arm Rotating\"],\"implementation_options\":[],\"video_link\":\"https://youtu.be/x2Q9e3cj_X4\"},{\"type\":\"Sots Press\",\"exercise_1\":[],\"exercise_2\":[\"Neutral\",\"Pronated\",\"Semi-Pronated\",\"Pronated\",\"Supinating\",\"Semi-Pronated\",\"One-Arm Neutral\",\"One-Arm Pronated\",\"One-Arm Rotating\"],\"implementation_options\":[],\"video_link\":\"\"},{\"type\":\"Turkish Getup\",\"exercise_1\":[],\"exercise_2\":[\"Neutral\",\"Pronated\",\"Semi-Pronated\",\"Pronated\",\"Supinating\",\"Semi-Pronated\",\"One-Arm Neutral\",\"One-Arm Pronated\",\"One-Arm Rotating\"],\"implementation_options\":[],\"video_link\":\"\"},{\"type\":\"Upright Row\",\"exercise_1\":[\"Close grip\",\"Medium Grip\",\"Wide Grip\"],\"exercise_2\":[\"Neutral\",\"Pronated\",\"Semi-Pronated\",\"Pronated\",\"Supinating\",\"Semi-Pronated\",\"One-Arm Neutral\",\"One-Arm Pronated\",\"One-Arm Rotating\"],\"implementation_options\":[],\"video_link\":\"\"},{\"type\":\"Upright Row DB\",\"exercise_1\":[],\"exercise_2\":[\"Neutral\",\"Pronated\",\"Semi-Pronated\",\"Pronated\",\"Supinating\",\"Semi-Pronated\",\"One-Arm Neutral\",\"One-Arm Pronated\",\"One-Arm Rotating\"],\"implementation_options\":[],\"video_link\":\"https://youtu.be/n3e7z7Z85qo\"},{\"type\":\"Upright Row Mid Grip Barbell\",\"exercise_1\":[],\"exercise_2\":[\"Neutral\",\"Pronated\",\"Semi-Pronated\",\"Pronated\",\"Supinating\",\"Semi-Pronated\",\"One-Arm Neutral\",\"One-Arm Pronated\",\"One-Arm Rotating\"],\"implementation_options\":[],\"video_link\":\"https://youtu.be/DTUiEde9ysE\"},{\"type\":\"Upright Row Wide Grip Barbell\",\"exercise_1\":[],\"exercise_2\":[\"Neutral\",\"Pronated\",\"Semi-Pronated\",\"Pronated\",\"Supinating\",\"Semi-Pronated\",\"One-Arm Neutral\",\"One-Arm Pronated\",\"One-Arm Rotating\"],\"implementation_options\":[],\"video_link\":\"https://youtu.be/CCFFiHs1NDY\"},{\"type\":\"Upright Row EZ Bar\",\"exercise_1\":[],\"exercise_2\":[\"Neutral\",\"Pronated\",\"Semi-Pronated\",\"Pronated\",\"Supinating\",\"Semi-Pronated\",\"One-Arm Neutral\",\"One-Arm Pronated\",\"One-Arm Rotating\"],\"implementation_options\":[],\"video_link\":\"https://youtu.be/M0p8kVs7cV0\"},{\"type\":\"Upright Row Low Pulley EZ Bar\",\"exercise_1\":[],\"exercise_2\":[\"Neutral\",\"Pronated\",\"Semi-Pronated\",\"Pronated\",\"Supinating\",\"Semi-Pronated\",\"One-Arm Neutral\",\"One-Arm Pronated\",\"One-Arm Rotating\"],\"implementation_options\":[],\"video_link\":\"https://youtu.be/AWKS8c6HhGk\"}]');
INSERT INTO `workout_exercise_options_tbl` (`id`, `part`, `options`) VALUES
(12, 'Triceps', '[{\"type\":\"Close Grip Bench Press\",\"exercise_1\":[\"15 deg Incline\",\"30 deg Incline\",\"45 deg Incline\",\"60 deg Incline\",\"Decline\",\"Flat \"],\"exercise_2\":[\"Neutral  \",\"Pronated  \",\"Semi-Pronated\",\"Semi-Supinated\",\"Supinated   \"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Barbell\",\"Football Bar\",\"Thick Bar\",\"EZ Bar\",\"Triceps Bar\",\"Triceps Rope\",\"Multi-Grip Bar\"],\"video_link\":\"https://youtu.be/T392SuEdLaM\"},{\"type\":\"Close Grip Incline Bench\",\"exercise_1\":[],\"exercise_2\":[\"Neutral  \",\"Pronated  \",\"Semi-Pronated\",\"Semi-Supinated\",\"Supinated   \"],\"implementation_options\":[],\"video_link\":\"https://youtu.be/fCrw_2kQr5U\"},{\"type\":\"California Press\",\"exercise_1\":[\"Flat            \"],\"exercise_2\":[\"Neutral  \",\"Pronated  \",\"Semi-Pronated\",\"Semi-Supinated\",\"Supinated   \"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Barbell\",\"Football Bar\",\"Thick Bar\",\"EZ Bar\",\"Triceps Bar\",\"Triceps Rope\",\"Multi-Grip Bar\"],\"video_link\":\"https://youtu.be/APxrv5f_0kM\"},{\"type\":\"California Press DB\",\"exercise_1\":[],\"exercise_2\":[\"Neutral  \",\"Pronated  \",\"Semi-Pronated\",\"Semi-Supinated\",\"Supinated   \"],\"implementation_options\":[],\"video_link\":\"https://youtu.be/_HE1vrb4yXc\"},{\"type\":\"Triceps Dips\",\"exercise_1\":[\"Machine\",\"V-Bar\",\"Parallel Bar\",\"Rings\"],\"exercise_2\":[],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Barbell\",\"Football Bar\",\"Thick Bar\",\"EZ Bar\",\"Triceps Bar\",\"Triceps Rope\",\"Multi-Grip Bar\"],\"video_link\":\"https://youtu.be/0sEsfIzGyEY\"},{\"type\":\"Floor Press\",\"exercise_1\":[\"Close grip\",\"Medium Grip\",\"Wide Grip\"],\"exercise_2\":[\"Neutral  \",\"Pronated  \",\"Semi-Pronated\",\"Semi-Supinated\",\"Supinated   \"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Barbell\",\"Football Bar\",\"Thick Bar\",\"EZ Bar\",\"Triceps Bar\",\"Triceps Rope\",\"Multi-Grip Bar\"],\"video_link\":\"\"},{\"type\":\"Machine French Press\",\"exercise_1\":[\"Close Grip\",\"Medium Grip\",\"One-Arm\"],\"exercise_2\":[\"Neutral  \",\"Pronated  \",\"Semi-Pronated\",\"Semi-Supinated\",\"Supinated   \"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Barbell\",\"Football Bar\",\"Thick Bar\",\"EZ Bar\",\"Triceps Bar\",\"Triceps Rope\",\"Multi-Grip Bar\"],\"video_link\":\"\"},{\"type\":\"Seated French Press\",\"exercise_1\":[\"Close Grip\",\"Medium Grip\",\"One-Arm\"],\"exercise_2\":[\"Neutral  \",\"Pronated  \",\"Semi-Pronated\",\"Semi-Supinated\",\"Supinated   \"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Barbell\",\"Football Bar\",\"Thick Bar\",\"EZ Bar\",\"Triceps Bar\",\"Triceps Rope\",\"Multi-Grip Bar\"],\"video_link\":\"\"},{\"type\":\"Standing French Press\",\"exercise_1\":[\"Close Grip\",\"Medium Grip\",\"One-Arm\"],\"exercise_2\":[\"Neutral  \",\"Pronated  \",\"Semi-Pronated\",\"Semi-Supinated\",\"Supinated   \"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Barbell\",\"Football Bar\",\"Thick Bar\",\"EZ Bar\",\"Triceps Bar\",\"Triceps Rope\",\"Multi-Grip Bar\"],\"video_link\":\"\"},{\"type\":\"French Press Seated EZ Bar\",\"exercise_1\":[],\"exercise_2\":[\"Neutral  \",\"Pronated  \",\"Semi-Pronated\",\"Semi-Supinated\",\"Supinated   \"],\"implementation_options\":[],\"video_link\":\"https://youtu.be/cc2Yv1RXA7w\"},{\"type\":\"French Press Seated One Arm\",\"exercise_1\":[],\"exercise_2\":[\"Neutral  \",\"Pronated  \",\"Semi-Pronated\",\"Semi-Supinated\",\"Supinated   \"],\"implementation_options\":[],\"video_link\":\"https://youtu.be/pgbJbyqhNmw\"},{\"type\":\"French Press Standing EZ Bar\",\"exercise_1\":[],\"exercise_2\":[\"Neutral  \",\"Pronated  \",\"Semi-Pronated\",\"Semi-Supinated\",\"Supinated   \"],\"implementation_options\":[],\"video_link\":\"https://youtu.be/VznhQb6fhjI\"},{\"type\":\"French Press Standing One Arm\",\"exercise_1\":[],\"exercise_2\":[\"Neutral  \",\"Pronated  \",\"Semi-Pronated\",\"Semi-Supinated\",\"Supinated   \"],\"implementation_options\":[],\"video_link\":\"https://youtu.be/oa_ZCoZuP2Q\"},{\"type\":\"French Press Standing One Arm Low Pulley\",\"exercise_1\":[],\"exercise_2\":[\"Neutral  \",\"Pronated  \",\"Semi-Pronated\",\"Semi-Supinated\",\"Supinated   \"],\"implementation_options\":[],\"video_link\":\"https://youtu.be/x74OF95mIK0\"},{\"type\":\"Seated Half Press in rack\",\"exercise_1\":[\"Seated  Medium Grip  Pronated        \"],\"exercise_2\":[],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Barbell\",\"Football Bar\",\"Thick Bar\",\"EZ Bar\",\"Triceps Bar\",\"Triceps Rope\",\"Multi-Grip Bar\"],\"video_link\":\"https://youtu.be/oLNv1i7q77o\"},{\"type\":\"Kneeling Triceps Pressdown\",\"exercise_1\":[\"Close Grip     \",\"Medium Grip\",\"Wide Grip\",\"One arm\"],\"exercise_2\":[\"Neutral  \",\"Pronated  \",\"Semi-Pronated\",\"Semi-Supinated\",\"Supinated   \"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Barbell\",\"Football Bar\",\"Thick Bar\",\"EZ Bar\",\"Triceps Bar\",\"Triceps Rope\",\"Multi-Grip Bar\"],\"video_link\":\"https://youtu.be/5fI8mwtv-r4\"},{\"type\":\"Prone Triceps Pressdown\",\"exercise_1\":[\"45 deg Incline  Close Grip       \",\"45 deg Incline  Medium Grip       \",\"45 deg Incline  Wide Grip\"],\"exercise_2\":[\"Neutral  \",\"Pronated  \",\"Semi-Pronated\",\"Semi-Supinated\",\"Supinated   \"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Barbell\",\"Football Bar\",\"Thick Bar\",\"EZ Bar\",\"Triceps Bar\",\"Triceps Rope\",\"Multi-Grip Bar\"],\"video_link\":\"https://youtu.be/3uOhhffW_MQ\"},{\"type\":\"Triceps Pressdown Standing Close grip\",\"exercise_1\":[],\"exercise_2\":[\"Neutral  \",\"Pronated  \",\"Semi-Pronated\",\"Semi-Supinated\",\"Supinated   \"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Barbell\",\"Football Bar\",\"Thick Bar\",\"EZ Bar\",\"Triceps Bar\",\"Triceps Rope\",\"Multi-Grip Bar\"],\"video_link\":\"https://youtu.be/xdSdlOCBe1g\"},{\"type\":\"Triceps Pressdown Standing Wide grip\",\"exercise_1\":[],\"exercise_2\":[\"Neutral  \",\"Pronated  \",\"Semi-Pronated\",\"Semi-Supinated\",\"Supinated   \"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Barbell\",\"Football Bar\",\"Thick Bar\",\"EZ Bar\",\"Triceps Bar\",\"Triceps Rope\",\"Multi-Grip Bar\"],\"video_link\":\"https://youtu.be/BnNZpA0B6Hs\"},{\"type\":\"Triceps Pressdown Standing Rope\",\"exercise_1\":[],\"exercise_2\":[\"Neutral  \",\"Pronated  \",\"Semi-Pronated\",\"Semi-Supinated\",\"Supinated   \"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Barbell\",\"Football Bar\",\"Thick Bar\",\"EZ Bar\",\"Triceps Bar\",\"Triceps Rope\",\"Multi-Grip Bar\"],\"video_link\":\"https://youtu.be/FIGjpC6tlXQ\"},{\"type\":\"Triceps Pressdown Standing One Arm\",\"exercise_1\":[],\"exercise_2\":[\"Neutral  \",\"Pronated  \",\"Semi-Pronated\",\"Semi-Supinated\",\"Supinated   \"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Barbell\",\"Football Bar\",\"Thick Bar\",\"EZ Bar\",\"Triceps Bar\",\"Triceps Rope\",\"Multi-Grip Bar\"],\"video_link\":\"https://youtu.be/ufUZNPD9_wQ\"},{\"type\":\"Triceps Pressdown Standing Overhead\",\"exercise_1\":[],\"exercise_2\":[\"Neutral  \",\"Pronated  \",\"Semi-Pronated\",\"Semi-Supinated\",\"Supinated   \"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Barbell\",\"Football Bar\",\"Thick Bar\",\"EZ Bar\",\"Triceps Bar\",\"Triceps Rope\",\"Multi-Grip Bar\"],\"video_link\":\"https://youtu.be/ypd50Pq2UZc\"},{\"type\":\"Triceps Extension\",\"exercise_1\":[\"Flat Close Grip\",\"Flat Medium Grip\",\"15 deg Incline\",\"15 deg Incline  Close Grip\",\"15 deg Incline  Medium Grip       \",\"30 deg Incline\",\"30 deg Incline  Close Grip\",\"30 deg Incline  Medium Grip     \",\"45 deg Incline        \",\"45 deg Incline  Close Grip\",\"45 deg Incline  Medium Grip     \",\"Decline Close Grip\",\"Decline Medium Grip\",\"Machine\"],\"exercise_2\":[\"Neutral  \",\"Pronated  \",\"Semi-Pronated\",\"Semi-Supinated\",\"Supinated   \"],\"implementation_options\":[\"Barbell\",\"Dumbbell\",\"T-Grip Barbell\",\"Football Bar\",\"Thick Bar\",\"EZ Bar\",\"Triceps Bar\",\"Triceps Rope\",\"Multi-Grip Bar\"],\"video_link\":\"\"},{\"type\":\"Supine Triceps Extension EZ Bar\",\"exercise_1\":[],\"exercise_2\":[\"Neutral  \",\"Pronated  \",\"Semi-Pronated\",\"Semi-Supinated\",\"Supinated   \"],\"implementation_options\":[],\"video_link\":\"https://youtu.be/2XSfjcMPLK8\"},{\"type\":\"Supine Triceps Extension Triceps Bar\",\"exercise_1\":[],\"exercise_2\":[\"Neutral  \",\"Pronated  \",\"Semi-Pronated\",\"Semi-Supinated\",\"Supinated   \"],\"implementation_options\":[],\"video_link\":\"https://youtu.be/kh96l9Yn75M\"},{\"type\":\"Supine Triceps Extension DB\",\"exercise_1\":[],\"exercise_2\":[\"Neutral  \",\"Pronated  \",\"Semi-Pronated\",\"Semi-Supinated\",\"Supinated   \"],\"implementation_options\":[],\"video_link\":\"https://youtu.be/fXAi99Ay5w4\"},{\"type\":\"Supine Triceps Extension Floor Press\",\"exercise_1\":[],\"exercise_2\":[\"Neutral  \",\"Pronated  \",\"Semi-Pronated\",\"Semi-Supinated\",\"Supinated   \"],\"implementation_options\":[],\"video_link\":\"https://youtu.be/eVC2eHb9Oxo\"}]'),
(13, 'Olympic Lifts', '[{\"type\":\"Clean\",\"exercise_1\":[\"Floor\",\"Blocks\",\"Podium\"],\"exercise_2\":[],\"implementation_options\":[\"Barbell\",\"15 Kg Barbell\",\"20 Kg Barbell\"],\"video_link\":\"\"},{\"type\":\"Clean and Jerk\",\"exercise_1\":[\"Mid Thigh\",\"Above Knee\",\"Below Knee\"],\"exercise_2\":[],\"implementation_options\":[\"Barbell\",\"15 Kg Barbell\",\"20 Kg Barbell\"],\"video_link\":\"\"},{\"type\":\"Clean and Press\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Barbell\",\"15 Kg Barbell\",\"20 Kg Barbell\"],\"video_link\":\"\"},{\"type\":\"Hang Clean\",\"exercise_1\":[\"Mid Thigh\",\"Above Knee\",\"Knee\",\"Below the Knee            \"],\"exercise_2\":[],\"implementation_options\":[\"Barbell\",\"15 Kg Barbell\",\"20 Kg Barbell\"],\"video_link\":\"\"},{\"type\":\"Power Clean\",\"exercise_1\":[\"Floor\",\"Mid Thigh           \",\"Knee\",\"Below Knee\"],\"exercise_2\":[],\"implementation_options\":[\"Barbell\",\"15 Kg Barbell\",\"20 Kg Barbell\"],\"video_link\":\"\"},{\"type\":\"Power Clean + Front Squat + Push Press\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Barbell\",\"15 Kg Barbell\",\"20 Kg Barbell\"],\"video_link\":\"\"},{\"type\":\"Power Clean + Front Squat  \",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Barbell\",\"15 Kg Barbell\",\"20 Kg Barbell\"],\"video_link\":\"\"},{\"type\":\"Power Clean + Push Press\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Barbell\",\"15 Kg Barbell\",\"20 Kg Barbell\"],\"video_link\":\"\"},{\"type\":\"Power Clean + Clean Pull\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Barbell\",\"15 Kg Barbell\",\"20 Kg Barbell\"],\"video_link\":\"\"},{\"type\":\"Clean Pull\",\"exercise_1\":[\"Floor\",\"Mid Thigh\",\"Above Knee\",\"Knee\",\"Below Knee\"],\"exercise_2\":[\"Power Rack\",\"Blocks\",\"Hang\",\"Podium\"],\"implementation_options\":[\"Barbell\",\"15 Kg Barbell\",\"20 Kg Barbell\"],\"video_link\":\"\"},{\"type\":\"Snatch\",\"exercise_1\":[\"Floor\",\"Mid Thigh\",\"Above Knee\",\"Knee\",\"Below Knee\"],\"exercise_2\":[\"Blocks\",\"Podium\"],\"implementation_options\":[\"Barbell\",\"15 Kg Barbell\",\"20 Kg Barbell\"],\"video_link\":\"\"},{\"type\":\"Power Snatch\",\"exercise_1\":[\"blocks\",\"Above the Knee           \",\"Below the Knee           \",\"Mid Thigh           \",\"Podium            \"],\"exercise_2\":[],\"implementation_options\":[\"Barbell\",\"15 Kg Barbell\",\"20 Kg Barbell\"],\"video_link\":\"\"},{\"type\":\"Hang Snatch\",\"exercise_1\":[\"Mid Thigh\",\"Above Knee\",\"Knee\",\"Below the Knee            \"],\"exercise_2\":[],\"implementation_options\":[\"Barbell\",\"15 Kg Barbell\",\"20 Kg Barbell\"],\"video_link\":\"\"},{\"type\":\"Power Snatch + Overhead Squat\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Barbell\",\"15 Kg Barbell\",\"20 Kg Barbell\"],\"video_link\":\"\"},{\"type\":\"Push Jerk behind the Neck\",\"exercise_1\":[\"Clean Grip\",\"Snatch Grip\"],\"exercise_2\":[],\"implementation_options\":[\"Barbell\",\"15 Kg Barbell\",\"20 Kg Barbell\"],\"video_link\":\"\"},{\"type\":\"Overhead Squat\",\"exercise_1\":[\"Clean grip\",\"Snatch Grip\"],\"exercise_2\":[],\"implementation_options\":[\"Barbell\",\"15 Kg Barbell\",\"20 Kg Barbell\"],\"video_link\":\"\"},{\"type\":\"Sots Press\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Barbell\",\"15 Kg Barbell\",\"20 Kg Barbell\"],\"video_link\":\"\"},{\"type\":\"Split Jerk\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Barbell\",\"15 Kg Barbell\",\"20 Kg Barbell\"],\"video_link\":\"\"}]'),
(14, 'Plyometrics', '[{\"type\":\"Box Jump\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[],\"video_link\":\"https://youtu.be/t49k96Oemdg\"},{\"type\":\"Squat Jump\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[],\"video_link\":\"https://youtu.be/K-pmZQGs3-s\"},{\"type\":\"Tuck Jump\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[],\"video_link\":\"https://youtu.be/AsvlrOYFdsM\"},{\"type\":\"Split Jump\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[],\"video_link\":\"\"},{\"type\":\"Split Squat Jumps\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[],\"video_link\":\"https://youtu.be/Is3mzwuNneE\"},{\"type\":\"Split Squat Scissor Jumps\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[],\"video_link\":\"https://youtu.be/QXaeNWQflfo\"},{\"type\":\"Ankle Jumps\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[],\"video_link\":\"\"},{\"type\":\"Standing Broad Jump\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[],\"video_link\":\"https://youtu.be/0jBBINViRN0\"},{\"type\":\"Jump Rope\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[],\"video_link\":\"https://youtu.be/lTen2YBI4s8\"},{\"type\":\"Depth Jump\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[],\"video_link\":\"https://youtu.be/mXx7OlBD8C4\"},{\"type\":\"Hurdle Jump\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[],\"video_link\":\"https://youtu.be/Ri5hRCs1YAE\"},{\"type\":\"Lateral Jump\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[],\"video_link\":\"\"},{\"type\":\"Penta Jump\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[],\"video_link\":\"\"},{\"type\":\"Broad Jump\",\"exercise_1\":[\"Forward and Lateral            \"],\"exercise_2\":[],\"implementation_options\":[],\"video_link\":\"\"},{\"type\":\"Depth Drop\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[],\"video_link\":\"https://youtu.be/ZKUI-dXHjPQ\"},{\"type\":\"Med Ball\",\"exercise_1\":[\"Side Toss with Rotation            \",\"Slam      \"],\"exercise_2\":[],\"implementation_options\":[],\"video_link\":\"\"},{\"type\":\"Medicine Ball Chest Pass\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[],\"video_link\":\"https://youtu.be/nd8-2eXRFG0\"},{\"type\":\"Medicine Ball Overhead Pass\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[],\"video_link\":\"https://youtu.be/rT39fc0jPXU\"},{\"type\":\"Medicine Ball Pullover Pass\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[],\"video_link\":\"https://youtu.be/UkHqZ1DkkFk\"},{\"type\":\"Medicine Ball Side Throw\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[],\"video_link\":\"https://youtu.be/AssAmhqiFzo\"},{\"type\":\"Medicine Ball Supine Chest Press\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[],\"video_link\":\"https://youtu.be/15OBfWZ1bFI\"},{\"type\":\"Medicine Ball Overhead Toss\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[],\"video_link\":\"https://youtu.be/m8QIjHyV1SU\"}]'),
(15, 'Strongman', '[{\"type\":\"Axle Clean + Press\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[],\"video_link\":\"\"},{\"type\":\"Axle Clean & Press\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[],\"video_link\":\"\"},{\"type\":\"Axle Deadlift\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[],\"video_link\":\"\"},{\"type\":\"Axle Press\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[],\"video_link\":\"\"},{\"type\":\"Car Deadlift\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[],\"video_link\":\"\"},{\"type\":\"Circus Dumbbell Clean & Press \",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[],\"video_link\":\"\"},{\"type\":\"Circus Dumbbell Press\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[],\"video_link\":\"\"},{\"type\":\"Conan\'s Wheel\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[],\"video_link\":\"\"},{\"type\":\"Farmer\'s Handle Deadlift\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[],\"video_link\":\"\"},{\"type\":\"Farmer\'s Walk\",\"exercise_1\":[\"Forward Start and Stops           \",\"Forward with Turn\",\"Reverse Start and Stops           \",\"Side Bend            \"],\"exercise_2\":[],\"implementation_options\":[],\"video_link\":\"\"},{\"type\":\"Frame Carry\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[],\"video_link\":\"\"},{\"type\":\"Frame Deadlift\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[],\"video_link\":\"\"},{\"type\":\"Husafel Carry\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[],\"video_link\":\"\"},{\"type\":\"Keg Carry\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[],\"video_link\":\"\"},{\"type\":\"Keg Clean & Press Away\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[],\"video_link\":\"\"},{\"type\":\"Keg Clean & Press Every Rep\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[],\"video_link\":\"\"},{\"type\":\"Keg Over Bar\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[],\"video_link\":\"\"},{\"type\":\"Log Press\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[],\"video_link\":\"\"},{\"type\":\"Log Inertia press\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[],\"video_link\":\"\"},{\"type\":\"Log Incline Press\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[],\"video_link\":\"\"},{\"type\":\"Log Clean + Press\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[],\"video_link\":\"\"},{\"type\":\"Log Clean & Press \",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[],\"video_link\":\"\"},{\"type\":\"Log Push Press\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[],\"video_link\":\"\"},{\"type\":\"Prowler Push\",\"exercise_1\":[\"Shoulder Harness\"],\"exercise_2\":[],\"implementation_options\":[],\"video_link\":\"\"},{\"type\":\"Sandbag Carry\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[],\"video_link\":\"\"},{\"type\":\"Sandbag Over Bar\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[],\"video_link\":\"\"},{\"type\":\"Sled Drag\",\"exercise_1\":[\"Backwards           \",\"Backwards Walk           \",\"Bear Crawl\",\"Bent-Over Hamstring           \",\"Bent-Over Sideways Ankle           \",\"Carioca           \",\"Arms Extended Forward Drag        \",\"Claw Walk           \",\"Face Pull           \",\"Lunge Walk           \",\"Nose-to-Sky Backwards           \",\"Petersen           \",\"Pull-Through           \",\"Push           \",\"Row           \",\"Sideways Ankle           \",\"Sideways  Hand Hold         \",\"Single-Arm Backwards           \",\"Single-Arm Hamstring           \",\"Thick Rope Pull           \",\"Tow with Harness            \"],\"exercise_2\":[],\"implementation_options\":[],\"video_link\":\"\"},{\"type\":\"Sledge Hammer\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[],\"video_link\":\"\"},{\"type\":\"Atlas Stone\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[],\"video_link\":\"\"},{\"type\":\"Atlas Stone Carry\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[],\"video_link\":\"\"},{\"type\":\"Atlas Stone Over Bar\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[],\"video_link\":\"\"},{\"type\":\"Atlas Stone Series\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[],\"video_link\":\"\"},{\"type\":\"Atlas Stone to Platform\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[],\"video_link\":\"\"},{\"type\":\"Tire Flip\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[],\"video_link\":\"\"},{\"type\":\"Viking Press\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[],\"video_link\":\"\"},{\"type\":\"Super Yolk\",\"exercise_1\":[\"Bottom Position Squat           \",\"Forward Start and Stops           \",\"Reverse Start and Stops           \",\"Walk           \",\"Zercher Carry            \"],\"exercise_2\":[],\"implementation_options\":[],\"video_link\":\"\"}]'),
(16, 'Conditioning/Calisthenics', '[{\"type\":\"Airdyne\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Weight Vest\",\"Med Ball\",\"Battle Ropes\",\"Sandbag\",\"Shoulder Harness\",\"Sled Harness\"],\"video_link\":\"\"},{\"type\":\"Pushups\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Weight Vest\",\"Med Ball\",\"Battle Ropes\",\"Sandbag\",\"Shoulder Harness\",\"Sled Harness\"],\"video_link\":\"https://youtu.be/uNfmsy0tEqM\"},{\"type\":\"Burpees\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Weight Vest\",\"Med Ball\",\"Battle Ropes\",\"Sandbag\",\"Shoulder Harness\",\"Sled Harness\"],\"video_link\":\"\"},{\"type\":\"Jumping Jacks\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Weight Vest\",\"Med Ball\",\"Battle Ropes\",\"Sandbag\",\"Shoulder Harness\",\"Sled Harness\"],\"video_link\":\"\"},{\"type\":\"Bear Crawl\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Weight Vest\",\"Med Ball\",\"Battle Ropes\",\"Sandbag\",\"Shoulder Harness\",\"Sled Harness\"],\"video_link\":\"\"},{\"type\":\"Lizard Crawl\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Weight Vest\",\"Med Ball\",\"Battle Ropes\",\"Sandbag\",\"Shoulder Harness\",\"Sled Harness\"],\"video_link\":\"\"},{\"type\":\"Jump Rope\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Weight Vest\",\"Med Ball\",\"Battle Ropes\",\"Sandbag\",\"Shoulder Harness\",\"Sled Harness\"],\"video_link\":\"https://youtu.be/lTen2YBI4s8\"},{\"type\":\"Sprints\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Weight Vest\",\"Med Ball\",\"Battle Ropes\",\"Sandbag\",\"Shoulder Harness\",\"Sled Harness\"],\"video_link\":\"\"},{\"type\":\"Hill Run\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Weight Vest\",\"Med Ball\",\"Battle Ropes\",\"Sandbag\",\"Shoulder Harness\",\"Sled Harness\"],\"video_link\":\"\"},{\"type\":\"Backpedal Run\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Weight Vest\",\"Med Ball\",\"Battle Ropes\",\"Sandbag\",\"Shoulder Harness\",\"Sled Harness\"],\"video_link\":\"\"},{\"type\":\"Double Unders\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Weight Vest\",\"Med Ball\",\"Battle Ropes\",\"Sandbag\",\"Shoulder Harness\",\"Sled Harness\"],\"video_link\":\"https://youtu.be/amnNgZDeU_Y\"},{\"type\":\"Ankle Hops\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[],\"video_link\":\"https://youtu.be/wnGekPOHOU0\"},{\"type\":\"Sled Drag\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Weight Vest\",\"Med Ball\",\"Battle Ropes\",\"Sandbag\",\"Shoulder Harness\",\"Sled Harness\"],\"video_link\":\"\"},{\"type\":\"Battling Ropes\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Weight Vest\",\"Med Ball\",\"Battle Ropes\",\"Sandbag\",\"Shoulder Harness\",\"Sled Harness\"],\"video_link\":\"\"},{\"type\":\"Weighted Run\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Weight Vest\",\"Med Ball\",\"Battle Ropes\",\"Sandbag\",\"Shoulder Harness\",\"Sled Harness\"],\"video_link\":\"\"},{\"type\":\"Rowing Machine\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Weight Vest\",\"Med Ball\",\"Battle Ropes\",\"Sandbag\",\"Shoulder Harness\",\"Sled Harness\"],\"video_link\":\"\"},{\"type\":\"Sledge Hammer\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Weight Vest\",\"Med Ball\",\"Battle Ropes\",\"Sandbag\",\"Shoulder Harness\",\"Sled Harness\"],\"video_link\":\"\"},{\"type\":\"Prowler Push\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Weight Vest\",\"Med Ball\",\"Battle Ropes\",\"Sandbag\",\"Shoulder Harness\",\"Sled Harness\"],\"video_link\":\"\"}]'),
(17, 'Mobility', '[{\"type\":\"Neck - Side Flexion\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Active Isolated\",\"Static\",\"PNF\"],\"video_link\":\"\"},{\"type\":\"Neck - Suboccipital stretch\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Active Isolated\",\"Static\",\"PNF\"],\"video_link\":\"\"},{\"type\":\"Neck - Upper Trap Stretch\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Active Isolated\",\"Static\",\"PNF\"],\"video_link\":\"\"},{\"type\":\"Neck - Sternocleidomastoid stretch\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Active Isolated\",\"Static\",\"PNF\"],\"video_link\":\"\"},{\"type\":\"Neck - Neck CAR\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Active Isolated\",\"Static\",\"PNF\"],\"video_link\":\"\"},{\"type\":\"Thoracic\\/Lumbar\\/Abs - Cat\\/Camel\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Active Isolated\",\"Static\",\"PNF\"],\"video_link\":\"\"},{\"type\":\"Thoracic\\/Lumbar\\/Abs - Abdominal stretch on Swiss Ball\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Active Isolated\",\"Static\",\"PNF\"],\"video_link\":\"\"},{\"type\":\"Thoracic\\/Lumbar\\/Abs - Oblique Stretch on Swiss Ball\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Active Isolated\",\"Static\",\"PNF\"],\"video_link\":\"\"},{\"type\":\"Thoracic\\/Lumbar\\/Abs - McKenzie Press-up\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Active Isolated\",\"Static\",\"PNF\"],\"video_link\":\"\"},{\"type\":\"Thoracic\\/Lumbar\\/Abs - Seated Quadratus Lumborum\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Active Isolated\",\"Static\",\"PNF\"],\"video_link\":\"\"},{\"type\":\"Thoracic\\/Lumbar\\/Abs - Thoracic CAR\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Active Isolated\",\"Static\",\"PNF\"],\"video_link\":\"\"},{\"type\":\"Shoulder\\/Chest - Standing Chest Stretch\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Active Isolated\",\"Static\",\"PNF\"],\"video_link\":\"\"},{\"type\":\"Shoulder\\/Chest - Supine Trunk Rotation\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Active Isolated\",\"Static\",\"PNF\"],\"video_link\":\"\"},{\"type\":\"Shoulder\\/Chest - Side Lying Shoulder External Rotation\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Active Isolated\",\"Static\",\"PNF\"],\"video_link\":\"\"},{\"type\":\"Shoulder\\/Chest - Side Lying Shoulder Internal Rotation\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Active Isolated\",\"Static\",\"PNF\"],\"video_link\":\"\"},{\"type\":\"Shoulder\\/Chest - Shoulder CAR\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Active Isolated\",\"Static\",\"PNF\"],\"video_link\":\"\"},{\"type\":\"Arms - Standing biceps\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Active Isolated\",\"Static\",\"PNF\"],\"video_link\":\"\"},{\"type\":\"Arms - Overhead Triceps\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Active Isolated\",\"Static\",\"PNF\"],\"video_link\":\"\"},{\"type\":\"Arms - Elbow CAR\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Active Isolated\",\"Static\",\"PNF\"],\"video_link\":\"\"},{\"type\":\"Arms - Wrist CAR\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Active Isolated\",\"Static\",\"PNF\"],\"video_link\":\"\"},{\"type\":\"Arms - Wrist Flexion\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Active Isolated\",\"Static\",\"PNF\"],\"video_link\":\"\"},{\"type\":\"Arms - Wrist Extension\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Active Isolated\",\"Static\",\"PNF\"],\"video_link\":\"\"},{\"type\":\"Upper Back\\/Lats - Rhomboid Stretch\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Active Isolated\",\"Static\",\"PNF\"],\"video_link\":\"\"},{\"type\":\"Upper Back\\/Lats - Lat stretch\\/Table Top\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Active Isolated\",\"Static\",\"PNF\"],\"video_link\":\"\"},{\"type\":\"Upper Back\\/Lats - Posterior Shoulder \",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Active Isolated\",\"Static\",\"PNF\"],\"video_link\":\"\"},{\"type\":\"Upper Back\\/Lats - Scapulae CAR\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Active Isolated\",\"Static\",\"PNF\"],\"video_link\":\"\"},{\"type\":\"Hips - 90\\/90 hip external rotation\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Active Isolated\",\"Static\",\"PNF\"],\"video_link\":\"\"},{\"type\":\"Hips - 90\\/90 hip internal rotation\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Active Isolated\",\"Static\",\"PNF\"],\"video_link\":\"\"},{\"type\":\"Hips - 90\\/90 QL\\/Latissimus Dorsi\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Active Isolated\",\"Static\",\"PNF\"],\"video_link\":\"\"},{\"type\":\"Hips - Kneeling Hip Flexor \",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Active Isolated\",\"Static\",\"PNF\"],\"video_link\":\"\"},{\"type\":\"Hips - Kneeling Short Adductor \",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Active Isolated\",\"Static\",\"PNF\"],\"video_link\":\"\"},{\"type\":\"Hips - Standing HIp Abductor\\/TFL stretch\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Active Isolated\",\"Static\",\"PNF\"],\"video_link\":\"\"},{\"type\":\"Hips - Prone Groin stretch\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Active Isolated\",\"Static\",\"PNF\"],\"video_link\":\"\"},{\"type\":\"Hips - Passive Full Squat\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Active Isolated\",\"Static\",\"PNF\"],\"video_link\":\"\"},{\"type\":\"Hips - Hip CAR\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Active Isolated\",\"Static\",\"PNF\"],\"video_link\":\"\"},{\"type\":\"Legs - Kneeling Quadriceps Stretch\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Active Isolated\",\"Static\",\"PNF\"],\"video_link\":\"\"},{\"type\":\"Legs - Supine Hamstrings\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Active Isolated\",\"Static\",\"PNF\"],\"video_link\":\"\"},{\"type\":\"Legs - Knee CAR\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Active Isolated\",\"Static\",\"PNF\"],\"video_link\":\"\"},{\"type\":\"Legs - Kneecap CAR\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Active Isolated\",\"Static\",\"PNF\"],\"video_link\":\"\"},{\"type\":\"Legs - Sidelying Quadriceps\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Active Isolated\",\"Static\",\"PNF\"],\"video_link\":\"\"},{\"type\":\"Ankle - Ankle Circles\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Active Isolated\",\"Static\",\"PNF\"],\"video_link\":\"\"},{\"type\":\"Ankle - Tibialis Anterior, Kneeling\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Active Isolated\",\"Static\",\"PNF\"],\"video_link\":\"\"},{\"type\":\"Ankle - Soleus Stretch\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Active Isolated\",\"Static\",\"PNF\"],\"video_link\":\"\"},{\"type\":\"Ankle - Gastrocnemius Stretch, Standing\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Active Isolated\",\"Static\",\"PNF\"],\"video_link\":\"\"},{\"type\":\"Ankle - Ankle CAR\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Active Isolated\",\"Static\",\"PNF\"],\"video_link\":\"\"},{\"type\":\"Foot - Toe CAR\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Active Isolated\",\"Static\",\"PNF\"],\"video_link\":\"\"},{\"type\":\"Foot - Toe Dorsiflexion\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Active Isolated\",\"Static\",\"PNF\"],\"video_link\":\"\"},{\"type\":\"Foot - Toe Plantarflexion\",\"exercise_1\":[],\"exercise_2\":[],\"implementation_options\":[\"Active Isolated\",\"Static\",\"PNF\"],\"video_link\":\"\"},{\"type\":\"123\",\"exercise_1\":null,\"exercise_2\":null,\"implementation_options\":null,\"video_link\":\"\"}]'),
(19, 'General', '[{\"type\":\"Jumping Jacks\",\"exercise_1\":[\"Test\",\"Test2\",\"Test3\",\"Test4\"],\"exercise_2\":[\"Test\",\"Test2\"],\"implementation_options\":[\"Any\"],\"video_link\":\"https:\\/\\/youtu.be\\/-614qJJQtGQ\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `workout_exercise_strength_qualities_tbl`
--

CREATE TABLE `workout_exercise_strength_qualities_tbl` (
  `id` int(11) NOT NULL,
  `name` varchar(10) NOT NULL,
  `options` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `workout_exercise_strength_qualities_tbl`
--

INSERT INTO `workout_exercise_strength_qualities_tbl` (`id`, `name`, `options`) VALUES
(1, 'ES', '{\"set_options\":[1,2,3,4,5,6,7,8,9,10],\"rep_options\":[\"5 sec\",\"10 sec\",\"15 sec\",\"20 sec\",\"30 sec\",\"45 sec\",\"60 sec\",\"75 sec\",\"90 sec\",\"5 meter\",\"10 meters\",\"15 meters\",\"20 meters\",\"25 meters\",\"30 meters\",\"40 meters\",\"50 meters\",\"60 meters\",\"100 meters\",\"200 meters\",\"300 meters\",\"400 meters\",\"800 meters\",\"25 feet\",\"50 feet\",\"75 feet\",\"100 feet\"],\"tempo\":[\"maximal\",\"submaximal\",\"fast\",\"slow\",\"Moderate\"],\"rest\":[\"15 sec\",\"30 sec\",\"45 sec\",\"60 sec\",\"75 sec\",\"90 sec\",\"120 sec\",\"150 sec\",\"3 min\",\"4 min\",\"5 min\"]}'),
(2, 'H', '{\"set_options\":[1,2,3,4,5,6,7,8,9,10],\"rep_options\":[\"6\",\"7\",\"8\",\"9\",\"10\",\"12\",\"15\",\"20\",\"6-8\",\"7-9\",\"8-10\",\"10-12\",\"12-15\",\"15-20\",\"(6,x,x)*\",\"(8,x,x)*\",\"(6,6,6)**\",\"(8,8,8)**\",\"(10,6,4)**\",\"12,10,8\",\"15,12,10\",\"20,15,12\",\"8,6,4,4,6,8\",\"8,6,4,20\",\"7,5,3,7,5,3\",\"AMRAP\"],\"tempo\":[\"2011\",\"3011\",\"4011\",\"5011\",\"2110\",\"3110\",\"4110\",\"5110\"],\"rest\":[\"15 sec\",\"30 sec\",\"45 sec\",\"60 sec\",\"75 sec\",\"90 sec\",\"120 sec\",\"150 sec\",\"3 min\",\"4 min\",\"5 min\"],\"repetition_pattern\":[\"*rest-pause\",\"**drop set\",\"Cluster\",\"Ascending Load\",\"Constant Load\",\"Descending Load*\",\"Pyramid Load\",\"Wave Load\",\"Step Load\",\"AMRAP(as many reps as possible)\"],\"tempo_explained\":[\"The First Number - Using the squat as an example, the 3 will represent the amount of time (in seconds) it takes you to descend to the bottom position.\",\"The Second Number - The second number refers to the time spent in the bottom/transition between eccentric(lowering) and the concentric(ascending) portion of the exercise. The 0 means the trainee immediately begins their ascent after they reach the bottom postion. If the prescription were 32X0, the trainee would pause for 2 seconds at the bottom position.\",\"The Third Number - The third number refers to ascending (concentric) phase of the lift. The X  indicates that the trainee must EXPLODE at the initiation of the concentric action and try to accelerate the load throughout the entire range of motion. Intent is vital; the load may move slowly but you must try to move as fast as possible. If number is 2, it should take 2 seconds to complete the lift even if they are capable of moving it faster.\",\"The Fourth Number - The fourth number indicates the pause at the moment before the start of the next repetition of the lift. For a 45 degree back extension with a tempo of 2012, the trainee will hold an isometric contraction in the extended position for two seconds before lowering.\"]}'),
(3, 'MS', '{\"set_options\":[1,2,3,4,5,6,7,8,9,10],\"rep_options\":[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"2-4\",\"3-5\",\"4-6\",\"(1-1-1-1-1)\",\"(4,x,x)*\",\"(4,4,4)**\",\"5,3,2,2,3,5\",\"6,4,2,2,4,6\",\"5,4,3,2,1\",\"3,2,1,1,2,3\"],\"tempo\":[\"20X1\",\"30X1\",\"40X1\",\"50X1\",\"21X0\",\"31X0\",\"41X0\",\"51X0\"],\"rest\":[\"15 sec\",\"30 sec\",\"45 sec\",\"60 sec\",\"75 sec\",\"90 sec\",\"120 sec\",\"150 sec\",\"3 min\",\"4 min\",\"5 min\"],\"repetition_pattern\":[\"*rest-pause\",\"**drop set\",\"Cluster\",\"Ascending Load*\",\"Constant Load*\",\"Descending Load*\",\"Pyramid Load\",\"Wave Load\",\"Step Load\"],\"tempo_explained\":[\"The First Number - Using the squat as an example, the 3 will represent the amount of time (in seconds) it takes you to descend to the bottom position.\",\"The Second Number - The second number refers to the time spent in the bottom/transition between eccentric(lowering) and the concentric(ascending) portion of the exercise. The 0 means the trainee immediately begins their ascent after they reach the bottom postion. If the prescription were 32X0, the trainee would pause for 2 seconds at the bottom position.\",\"The Third Number - The third number refers to ascending (concentric) phase of the lift. The X  indicates that the trainee must EXPLODE at the initiation of the concentric action and try to accelerate the load throughout the entire range of motion. Intent is vital; the load may move slowly but you must try to move as fast as possible. If number is 2, it should take 2 seconds to complete the lift even if they are capable of moving it faster.\",\"The Fourth Number u2013 The fourth number indicates the pause at the moment before the start of the next repetition of the lift. For a 45 degree back extension with a tempo of 2012, the trainee will hold an isometric contraction in the extended position for two seconds before lowering.\",\"*Ascending Load: Load is increased upon each successful set all while maintaining repetition range\",\"*Constant Load: load is slightly below your maximal performance for the prescribed repetitions, allows completition of all prescribed sets and reps\",\"*Descending Load: Initial load is at rep maximum, load is decrease after each set in order to maintain rep range\",\"*Pyramid Load: load is increased and repetitions decreased with each successive set\"]}'),
(4, 'SE', '{\"set_options\":[1,2,3,4,5,6,7,8,9,10],\"rep_options\":[\"20-25\",\"25-30\",\"35-40\",\"45-50\",\"50\",\"75\",\"100\",\"AMRAP\"],\"tempo\":[\"1010\",\"2010\",\"3010\",\"2011\",\"2110\",\"3011\",\"3110\"],\"rest\":[\"15 sec\",\"30 sec\",\"45 sec\",\"60 sec\",\"75 sec\",\"90 sec\",\"120 sec\",\"150 sec\",\"3 min\",\"4 min\",\"5 min\"],\"repetition_pattern\":[\"rest-pause\",\"drop set\",\"Cluster\",\"Ascending Load\",\"Constant Load\",\"Descending Load\",\"Pyramid Load\",\"Wave Load\",\"Step Load\"]}');

-- --------------------------------------------------------

--
-- Table structure for table `workout_notes`
--

CREATE TABLE `workout_notes` (
  `id` int(11) NOT NULL,
  `workout_id` int(11) NOT NULL,
  `detail` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `workout_notes`
--

INSERT INTO `workout_notes` (`id`, `workout_id`, `detail`, `created_at`, `updated_at`) VALUES
(11, 29, 'This program is not for clients with heart problems.', '2018-07-31 09:07:53', '2018-07-31 09:07:53'),
(12, 29, 'This program is not for clients with heart and lung problems.', '2018-07-31 14:07:49', '2018-07-31 14:07:49'),
(13, 31, 'This program is for Mondays, Wednesdays, and Thursdays.', '2018-08-03 07:08:38', '2018-08-03 07:08:38'),
(14, 38, 'Sample Program', '2018-08-07 10:08:58', '2018-08-07 10:08:58'),
(15, 41, 'Test Program', '2018-08-07 14:08:30', '2018-08-07 14:08:30'),
(16, 44, 'NOTE 1', '2018-08-07 19:08:37', '2018-08-07 19:08:37'),
(17, 48, 'This is a note for Workout 1', '2018-08-07 19:08:10', '2018-08-07 19:08:10'),
(18, 35, 'MWF', '2018-08-14 07:08:13', '2018-08-14 07:08:13'),
(19, 35, 'Only for MWF.', '2018-08-14 07:08:05', '2018-08-14 07:08:05'),
(20, 30, 'For weight loss', '2018-08-14 07:08:46', '2018-08-14 07:08:46'),
(21, 35, 'Only for MWF only.', '2018-08-14 07:08:26', '2018-08-14 07:08:26'),
(22, 65, 'This is a test note.', '2018-09-11 15:09:08', '2018-09-11 15:09:08');

-- --------------------------------------------------------

--
-- Table structure for table `workout_tbl`
--

CREATE TABLE `workout_tbl` (
  `workout_ID` int(11) UNSIGNED NOT NULL,
  `workout_name` varchar(255) NOT NULL,
  `workout_description` text,
  `workout_gym_ID` int(11) NOT NULL,
  `workout_trainer_ID` int(10) UNSIGNED NOT NULL,
  `workout_date` date DEFAULT NULL,
  `workout_time` datetime DEFAULT NULL,
  `workout_created_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `workout_tbl`
--

INSERT INTO `workout_tbl` (`workout_ID`, `workout_name`, `workout_description`, `workout_gym_ID`, `workout_trainer_ID`, `workout_date`, `workout_time`, `workout_created_by`) VALUES
(15, 'June Workout', NULL, 0, 26, NULL, NULL, 26),
(16, 'Workout example', NULL, 0, 30, NULL, NULL, 30),
(17, 'Susan', NULL, 0, 4, NULL, NULL, 4),
(18, 'Deadlift', NULL, 0, 40, NULL, NULL, 40),
(19, 'test one', NULL, 0, 4, NULL, NULL, 4),
(20, '3 day Split', NULL, 0, 40, NULL, NULL, 40),
(21, '1st week july', NULL, 0, 4, NULL, NULL, 4),
(22, '1st week of july', NULL, 0, 47, NULL, NULL, 47),
(23, 'july', NULL, 0, 58, NULL, NULL, 58),
(24, '1st week of july', NULL, 0, 58, NULL, NULL, 58),
(25, 'week 1', NULL, 0, 63, NULL, NULL, 63),
(26, 'Plan 0001', NULL, 0, 90, NULL, NULL, 90),
(44, 'Program 1', NULL, 0, 40, NULL, NULL, 40),
(45, 'Program 1', NULL, 0, 40, NULL, NULL, 40),
(46, 'Program 1', NULL, 0, 40, NULL, NULL, 40),
(47, 'Test', NULL, 0, 40, NULL, NULL, 40),
(49, 'Hypertrophy - basic', NULL, 0, 102, NULL, NULL, 102),
(50, 'Metabolic Loading', NULL, 0, 101, NULL, NULL, 101),
(51, 'Test', NULL, 0, 76, NULL, NULL, 76),
(54, 'p6', NULL, 0, 76, NULL, NULL, 76),
(55, 'Tier Training 1', NULL, 0, 102, NULL, NULL, 102),
(56, 'te', NULL, 0, 78, NULL, NULL, 78),
(58, 'others', NULL, 0, 76, NULL, NULL, 76),
(59, 'Test Program', NULL, 0, 76, NULL, NULL, 76),
(60, 'Super Position', NULL, 0, 102, NULL, NULL, 102),
(61, 'Name', NULL, 0, 102, NULL, NULL, 102),
(62, 'NM', NULL, 0, 4, NULL, NULL, 4),
(63, 'PN', NULL, 0, 4, NULL, NULL, 4),
(64, 'Copy Hypertrophy - basic', NULL, 0, 102, NULL, NULL, 102),
(65, 'test p1', NULL, 0, 76, NULL, NULL, 76),
(66, 'pp1', NULL, 0, 76, NULL, NULL, 76);

-- --------------------------------------------------------

--
-- Table structure for table `workout_user_files`
--

CREATE TABLE `workout_user_files` (
  `id` int(11) NOT NULL,
  `file` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `uploaded_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `workout_user_files`
--

INSERT INTO `workout_user_files` (`id`, `file`, `type`, `user_id`, `uploaded_at`) VALUES
(17, 'photo_1532592626.jpg', 'image_gym_landscape', 70, '2018-07-26'),
(18, 'photo_1532592637.jpg', 'image_gym_portrait', 70, '2018-07-26'),
(21, 'Strength Metrix Breakdown of Features.xlsx', 'file', 77, '2018-07-31'),
(22, 'photo_1534250306.jpg', 'image_trainer', 76, '2018-08-14'),
(23, 'photo_1534250557.jpg', 'image', 95, '2018-08-14'),
(24, 'photo_1534524462.jpg', 'image', 77, '2018-08-17'),
(25, 'photo_1535654342.jpg', 'image_gym_landscape', 101, '2018-08-30'),
(26, 'photo_1535654380.jpg', 'image_gym_landscape', 101, '2018-08-30'),
(27, 'photo_1535654394.jpg', 'image_gym_landscape', 101, '2018-08-30'),
(28, 'photo_1535654402.jpg', 'image_gym_portrait', 101, '2018-08-30');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `workout_activity_logs`
--
ALTER TABLE `workout_activity_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `workout_client_exercises_logs`
--
ALTER TABLE `workout_client_exercises_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `workout_client_exercise_assignments`
--
ALTER TABLE `workout_client_exercise_assignments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `workout_client_exercise_assignment_sets`
--
ALTER TABLE `workout_client_exercise_assignment_sets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `workout_client_set_logs`
--
ALTER TABLE `workout_client_set_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `workout_client_stats`
--
ALTER TABLE `workout_client_stats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `workout_days_tbl`
--
ALTER TABLE `workout_days_tbl`
  ADD PRIMARY KEY (`wday_ID`);

--
-- Indexes for table `workout_day_clients_tbl`
--
ALTER TABLE `workout_day_clients_tbl`
  ADD PRIMARY KEY (`workout_client_ID`);

--
-- Indexes for table `workout_exercises_tbl`
--
ALTER TABLE `workout_exercises_tbl`
  ADD PRIMARY KEY (`exer_ID`);

--
-- Indexes for table `workout_exercise_options_tbl`
--
ALTER TABLE `workout_exercise_options_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `workout_exercise_strength_qualities_tbl`
--
ALTER TABLE `workout_exercise_strength_qualities_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `workout_notes`
--
ALTER TABLE `workout_notes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `workout_tbl`
--
ALTER TABLE `workout_tbl`
  ADD PRIMARY KEY (`workout_ID`);

--
-- Indexes for table `workout_user_files`
--
ALTER TABLE `workout_user_files`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `workout_activity_logs`
--
ALTER TABLE `workout_activity_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=181;

--
-- AUTO_INCREMENT for table `workout_client_exercises_logs`
--
ALTER TABLE `workout_client_exercises_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `workout_client_exercise_assignments`
--
ALTER TABLE `workout_client_exercise_assignments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=940;

--
-- AUTO_INCREMENT for table `workout_client_exercise_assignment_sets`
--
ALTER TABLE `workout_client_exercise_assignment_sets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1520;

--
-- AUTO_INCREMENT for table `workout_client_set_logs`
--
ALTER TABLE `workout_client_set_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `workout_client_stats`
--
ALTER TABLE `workout_client_stats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `workout_days_tbl`
--
ALTER TABLE `workout_days_tbl`
  MODIFY `wday_ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=137;

--
-- AUTO_INCREMENT for table `workout_day_clients_tbl`
--
ALTER TABLE `workout_day_clients_tbl`
  MODIFY `workout_client_ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=148;

--
-- AUTO_INCREMENT for table `workout_exercises_tbl`
--
ALTER TABLE `workout_exercises_tbl`
  MODIFY `exer_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=288;

--
-- AUTO_INCREMENT for table `workout_exercise_options_tbl`
--
ALTER TABLE `workout_exercise_options_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `workout_exercise_strength_qualities_tbl`
--
ALTER TABLE `workout_exercise_strength_qualities_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `workout_notes`
--
ALTER TABLE `workout_notes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `workout_tbl`
--
ALTER TABLE `workout_tbl`
  MODIFY `workout_ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `workout_user_files`
--
ALTER TABLE `workout_user_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
