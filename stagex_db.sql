-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 03, 2025 at 08:17 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `stagex_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `booking_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `performance_id` int(11) NOT NULL,
  `total_amount` decimal(10,3) NOT NULL,
  `booking_status` enum('pending','completed','cancelled') NOT NULL DEFAULT 'pending',
  `payment_status` enum('pending','paid','failed') NOT NULL DEFAULT 'pending',
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `genres`
--

CREATE TABLE `genres` (
  `genre_id` int(11) NOT NULL,
  `genre_name` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `genres`
--

INSERT INTO `genres` (`genre_id`, `genre_name`, `created_at`) VALUES
(6, 'Bi kịch', '2025-10-03 16:00:14'),
(7, 'Hài kịch', '2025-10-03 16:00:24'),
(8, 'Tâm lý - Xã hội', '2025-10-03 16:00:33'),
(9, 'Hiện thực', '2025-10-03 16:00:41'),
(10, 'Dân gian', '2025-10-03 16:00:49'),
(11, 'Lãng mạn', '2025-10-03 16:01:04'),
(12, 'Giả tưởng - huyền ảo', '2025-10-03 16:01:15'),
(13, 'Huyền bí', '2025-10-03 16:01:22'),
(14, 'Chuyển thể cổ tích', '2025-10-03 16:01:35'),
(15, 'Kinh điển', '2025-10-03 16:01:42');

-- --------------------------------------------------------

--
-- Table structure for table `performances`
--

CREATE TABLE `performances` (
  `performance_id` int(11) NOT NULL,
  `show_id` int(11) DEFAULT NULL,
  `theater_id` int(11) DEFAULT NULL,
  `performance_date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time DEFAULT NULL,
  `status` enum('scheduled','cancelled','completed') DEFAULT 'scheduled',
  `price` decimal(10,3) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `performances`
--

INSERT INTO `performances` (`performance_id`, `show_id`, `theater_id`, `performance_date`, `start_time`, `end_time`, `status`, `price`, `created_at`, `updated_at`) VALUES
(15, 8, 1, '2025-10-10', '19:30:00', NULL, 'scheduled', 180000.000, '2025-10-03 16:17:33', '2025-10-03 16:17:33'),
(16, 8, 2, '2025-10-12', '20:00:00', NULL, 'scheduled', 180000.000, '2025-10-03 16:18:16', '2025-10-03 16:18:16'),
(17, 8, 1, '2025-10-17', '19:30:00', NULL, 'scheduled', 200000.000, '2025-10-03 16:18:38', '2025-10-03 16:18:38'),
(18, 8, 3, '2025-10-20', '18:00:00', NULL, 'scheduled', 180000.000, '2025-10-03 16:18:58', '2025-10-03 16:18:58'),
(19, 9, 2, '2025-10-11', '19:00:00', NULL, 'scheduled', 150000.000, '2025-10-03 16:19:17', '2025-10-03 16:19:17'),
(20, 9, 3, '2025-10-13', '20:00:00', NULL, 'scheduled', 160000.000, '2025-10-03 16:19:51', '2025-10-03 16:19:51'),
(21, 9, 1, '2025-10-18', '19:00:00', NULL, 'scheduled', 150000.000, '2025-10-03 16:20:52', '2025-10-03 16:20:52'),
(22, 9, 2, '2025-10-21', '18:30:00', NULL, 'scheduled', 160000.000, '2025-10-03 16:21:16', '2025-10-03 16:21:16'),
(23, 10, 3, '2025-10-14', '19:00:00', NULL, 'scheduled', 170000.000, '2025-10-03 16:21:47', '2025-10-03 16:21:47'),
(24, 10, 1, '2025-10-15', '20:00:00', NULL, 'scheduled', 170000.000, '2025-10-03 16:22:33', '2025-10-03 16:22:33'),
(25, 10, 2, '2025-10-19', '19:00:00', NULL, 'scheduled', 180000.000, '2025-10-03 16:22:52', '2025-10-03 16:22:52'),
(26, 10, 1, '2025-10-15', '20:00:00', NULL, 'scheduled', 170000.000, '2025-10-03 16:24:30', '2025-10-03 16:24:30'),
(27, 10, 3, '2025-10-22', '18:30:00', NULL, 'scheduled', 170000.000, '2025-10-03 16:24:55', '2025-10-03 16:24:55'),
(28, 11, 1, '2025-10-16', '19:30:00', NULL, 'scheduled', 200000.000, '2025-10-03 16:25:14', '2025-10-03 16:25:14'),
(29, 11, 2, '2025-10-20', '20:00:00', NULL, 'scheduled', 220000.000, '2025-10-03 16:25:34', '2025-10-03 16:25:34'),
(30, 11, 1, '2025-10-23', '19:00:00', NULL, 'scheduled', 200000.000, '2025-10-03 16:25:55', '2025-10-03 16:25:55'),
(31, 10, 3, '2025-10-25', '18:30:00', NULL, 'scheduled', 220000.000, '2025-10-03 16:26:13', '2025-10-03 16:26:13'),
(32, 12, 2, '2025-10-17', '19:00:00', NULL, 'scheduled', 160000.000, '2025-10-03 16:26:35', '2025-10-03 16:26:35'),
(33, 12, 1, '2025-10-19', '20:00:00', NULL, 'scheduled', 160000.000, '2025-10-03 16:26:57', '2025-10-03 16:26:57'),
(34, 12, 3, '2025-10-24', '20:00:00', NULL, 'scheduled', 170000.000, '2025-10-03 16:27:12', '2025-10-03 16:27:12'),
(35, 12, 2, '2025-10-26', '19:00:00', NULL, 'scheduled', 160000.000, '2025-10-03 16:27:32', '2025-10-03 16:27:32'),
(36, 13, 3, '2025-10-18', '19:00:00', NULL, 'scheduled', 140000.000, '2025-10-03 16:28:37', '2025-10-03 16:28:37'),
(37, 13, 1, '2025-10-21', '20:00:00', NULL, 'scheduled', 150000.000, '2025-10-03 16:29:29', '2025-10-03 16:29:29'),
(38, 13, 2, '2025-10-27', '18:30:00', NULL, 'scheduled', 150000.000, '2025-10-03 16:29:48', '2025-10-03 16:29:48'),
(39, 13, 3, '2025-10-28', '19:00:00', NULL, 'scheduled', 140000.000, '2025-10-03 16:30:07', '2025-10-03 16:30:07');

-- --------------------------------------------------------

--
-- Table structure for table `seats`
--

CREATE TABLE `seats` (
  `seat_id` int(11) NOT NULL,
  `theater_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `row_char` varchar(5) NOT NULL,
  `seat_number` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `seats`
--

INSERT INTO `seats` (`seat_id`, `theater_id`, `category_id`, `row_char`, `seat_number`, `created_at`) VALUES
(1, 1, 1, 'A', 1, '2025-09-24 16:19:02'),
(2, 1, 1, 'A', 2, '2025-09-24 16:19:02'),
(3, 1, 1, 'A', 3, '2025-09-24 16:19:02'),
(4, 1, 1, 'A', 4, '2025-09-24 16:19:02'),
(5, 1, 1, 'A', 5, '2025-09-24 16:19:02'),
(6, 1, 1, 'A', 6, '2025-09-24 16:19:02'),
(7, 1, 1, 'A', 7, '2025-09-24 16:19:02'),
(8, 1, 1, 'A', 8, '2025-09-24 16:19:02'),
(9, 1, 1, 'A', 9, '2025-09-24 16:19:02'),
(10, 1, 1, 'A', 10, '2025-09-24 16:19:02'),
(11, 1, 1, 'A', 11, '2025-09-24 16:19:02'),
(12, 1, 1, 'A', 12, '2025-09-24 16:19:02'),
(13, 1, 1, 'A', 13, '2025-09-24 16:19:02'),
(14, 1, 1, 'A', 14, '2025-09-24 16:19:02'),
(15, 1, 1, 'A', 15, '2025-09-24 16:19:02'),
(16, 1, 1, 'B', 1, '2025-09-24 16:19:02'),
(17, 1, 1, 'B', 2, '2025-09-24 16:19:02'),
(18, 1, 1, 'B', 3, '2025-09-24 16:19:02'),
(19, 1, 1, 'B', 4, '2025-09-24 16:19:02'),
(20, 1, 1, 'B', 5, '2025-09-24 16:19:02'),
(21, 1, 1, 'B', 6, '2025-09-24 16:19:02'),
(22, 1, 1, 'B', 7, '2025-09-24 16:19:02'),
(23, 1, 1, 'B', 8, '2025-09-24 16:19:02'),
(24, 1, 1, 'B', 9, '2025-09-24 16:19:02'),
(25, 1, 1, 'B', 10, '2025-09-24 16:19:02'),
(26, 1, 1, 'B', 11, '2025-09-24 16:19:02'),
(27, 1, 1, 'B', 12, '2025-09-24 16:19:02'),
(28, 1, 1, 'B', 13, '2025-09-24 16:19:02'),
(29, 1, 1, 'B', 14, '2025-09-24 16:19:02'),
(30, 1, 1, 'B', 15, '2025-09-24 16:19:02'),
(31, 1, 2, 'C', 1, '2025-09-24 16:19:02'),
(32, 1, 2, 'C', 2, '2025-09-24 16:19:02'),
(33, 1, 2, 'C', 3, '2025-09-24 16:19:02'),
(34, 1, 2, 'C', 4, '2025-09-24 16:19:02'),
(35, 1, 2, 'C', 5, '2025-09-24 16:19:02'),
(36, 1, 2, 'C', 6, '2025-09-24 16:19:02'),
(37, 1, 2, 'C', 7, '2025-09-24 16:19:02'),
(38, 1, 2, 'C', 8, '2025-09-24 16:19:02'),
(39, 1, 2, 'C', 9, '2025-09-24 16:19:02'),
(40, 1, 2, 'C', 10, '2025-09-24 16:19:02'),
(41, 1, 2, 'C', 11, '2025-09-24 16:19:02'),
(42, 1, 2, 'C', 12, '2025-09-24 16:19:02'),
(43, 1, 2, 'C', 13, '2025-09-24 16:19:02'),
(44, 1, 2, 'C', 14, '2025-09-24 16:19:02'),
(45, 1, 2, 'C', 15, '2025-09-24 16:19:02'),
(46, 1, 2, 'D', 1, '2025-09-24 16:19:02'),
(47, 1, 2, 'D', 2, '2025-09-24 16:19:02'),
(48, 1, 2, 'D', 3, '2025-09-24 16:19:02'),
(49, 1, 2, 'D', 4, '2025-09-24 16:19:02'),
(50, 1, 2, 'D', 5, '2025-09-24 16:19:02'),
(51, 1, 2, 'D', 6, '2025-09-24 16:19:02'),
(52, 1, 2, 'D', 7, '2025-09-24 16:19:02'),
(53, 1, 2, 'D', 8, '2025-09-24 16:19:02'),
(54, 1, 2, 'D', 9, '2025-09-24 16:19:02'),
(55, 1, 2, 'D', 10, '2025-09-24 16:19:02'),
(56, 1, 2, 'D', 11, '2025-09-24 16:19:02'),
(57, 1, 2, 'D', 12, '2025-09-24 16:19:02'),
(58, 1, 2, 'D', 13, '2025-09-24 16:19:02'),
(59, 1, 2, 'D', 14, '2025-09-24 16:19:02'),
(60, 1, 2, 'D', 15, '2025-09-24 16:19:02'),
(61, 1, 3, 'E', 1, '2025-09-24 16:19:02'),
(62, 1, 3, 'E', 2, '2025-09-24 16:19:02'),
(63, 1, 3, 'E', 3, '2025-09-24 16:19:02'),
(64, 1, 3, 'E', 4, '2025-09-24 16:19:02'),
(65, 1, 3, 'E', 5, '2025-09-24 16:19:02'),
(66, 1, 3, 'E', 6, '2025-09-24 16:19:02'),
(67, 1, 3, 'E', 7, '2025-09-24 16:19:02'),
(68, 1, 3, 'E', 8, '2025-09-24 16:19:02'),
(69, 1, 3, 'E', 9, '2025-09-24 16:19:02'),
(70, 1, 3, 'E', 10, '2025-09-24 16:19:02'),
(71, 1, 3, 'E', 11, '2025-09-24 16:19:02'),
(72, 1, 3, 'E', 12, '2025-09-24 16:19:02'),
(73, 1, 3, 'E', 13, '2025-09-24 16:19:02'),
(74, 1, 3, 'E', 14, '2025-09-24 16:19:02'),
(75, 1, 3, 'E', 15, '2025-09-24 16:19:02'),
(76, 1, 3, 'E', 16, '2025-09-24 16:19:02'),
(77, 1, 3, 'E', 17, '2025-09-24 16:19:02'),
(78, 1, 3, 'E', 18, '2025-09-24 16:19:02'),
(79, 1, 3, 'E', 19, '2025-09-24 16:19:02'),
(80, 1, 3, 'E', 20, '2025-09-24 16:19:02'),
(81, 1, 3, 'F', 1, '2025-09-24 16:19:02'),
(82, 1, 3, 'F', 2, '2025-09-24 16:19:02'),
(83, 1, 3, 'F', 3, '2025-09-24 16:19:02'),
(84, 1, 3, 'F', 4, '2025-09-24 16:19:02'),
(85, 1, 3, 'F', 5, '2025-09-24 16:19:02'),
(86, 1, 3, 'F', 6, '2025-09-24 16:19:02'),
(87, 1, 3, 'F', 7, '2025-09-24 16:19:02'),
(88, 1, 3, 'F', 8, '2025-09-24 16:19:02'),
(89, 1, 3, 'F', 9, '2025-09-24 16:19:02'),
(90, 1, 3, 'F', 10, '2025-09-24 16:19:02'),
(91, 1, 3, 'F', 11, '2025-09-24 16:19:02'),
(92, 1, 3, 'F', 12, '2025-09-24 16:19:02'),
(93, 1, 3, 'F', 13, '2025-09-24 16:19:02'),
(94, 1, 3, 'F', 14, '2025-09-24 16:19:02'),
(95, 1, 3, 'F', 15, '2025-09-24 16:19:02'),
(96, 1, 3, 'F', 16, '2025-09-24 16:19:02'),
(97, 1, 3, 'F', 17, '2025-09-24 16:19:02'),
(98, 1, 3, 'F', 18, '2025-09-24 16:19:02'),
(99, 1, 3, 'F', 19, '2025-09-24 16:19:02'),
(100, 1, 3, 'F', 20, '2025-09-24 16:19:02'),
(101, 2, 1, 'A', 1, '2025-09-24 16:19:02'),
(102, 2, 1, 'A', 2, '2025-09-24 16:19:02'),
(103, 2, 1, 'A', 3, '2025-09-24 16:19:02'),
(104, 2, 1, 'A', 4, '2025-09-24 16:19:02'),
(105, 2, 1, 'A', 5, '2025-09-24 16:19:02'),
(106, 2, 1, 'A', 6, '2025-09-24 16:19:02'),
(107, 2, 1, 'A', 7, '2025-09-24 16:19:02'),
(108, 2, 1, 'A', 8, '2025-09-24 16:19:02'),
(109, 2, 1, 'B', 1, '2025-09-24 16:19:02'),
(110, 2, 1, 'B', 2, '2025-09-24 16:19:02'),
(111, 2, 1, 'B', 3, '2025-09-24 16:19:02'),
(112, 2, 1, 'B', 4, '2025-09-24 16:19:02'),
(113, 2, 1, 'B', 5, '2025-09-24 16:19:02'),
(114, 2, 1, 'B', 6, '2025-09-24 16:19:02'),
(115, 2, 1, 'B', 7, '2025-09-24 16:19:02'),
(116, 2, 1, 'B', 8, '2025-09-24 16:19:02'),
(117, 2, 2, 'C', 1, '2025-09-24 16:19:02'),
(118, 2, 2, 'C', 2, '2025-09-24 16:19:02'),
(119, 2, 2, 'C', 3, '2025-09-24 16:19:02'),
(120, 2, 2, 'C', 4, '2025-09-24 16:19:02'),
(121, 2, 2, 'C', 5, '2025-09-24 16:19:02'),
(122, 2, 2, 'C', 6, '2025-09-24 16:19:02'),
(123, 2, 2, 'C', 7, '2025-09-24 16:19:02'),
(124, 2, 2, 'C', 8, '2025-09-24 16:19:02'),
(125, 2, 2, 'C', 9, '2025-09-24 16:19:02'),
(126, 2, 2, 'C', 10, '2025-09-24 16:19:02'),
(127, 2, 2, 'C', 11, '2025-09-24 16:19:02'),
(128, 2, 2, 'C', 12, '2025-09-24 16:19:02'),
(129, 2, 2, 'D', 1, '2025-09-24 16:19:02'),
(130, 2, 2, 'D', 2, '2025-09-24 16:19:02'),
(131, 2, 2, 'D', 3, '2025-09-24 16:19:02'),
(132, 2, 2, 'D', 4, '2025-09-24 16:19:02'),
(133, 2, 2, 'D', 5, '2025-09-24 16:19:02'),
(134, 2, 2, 'D', 6, '2025-09-24 16:19:02'),
(135, 2, 2, 'D', 7, '2025-09-24 16:19:02'),
(136, 2, 2, 'D', 8, '2025-09-24 16:19:02'),
(137, 2, 2, 'D', 9, '2025-09-24 16:19:02'),
(138, 2, 2, 'D', 10, '2025-09-24 16:19:02'),
(139, 2, 2, 'D', 11, '2025-09-24 16:19:02'),
(140, 2, 2, 'D', 12, '2025-09-24 16:19:02'),
(141, 2, 3, 'E', 1, '2025-09-24 16:19:02'),
(142, 2, 3, 'E', 2, '2025-09-24 16:19:02'),
(143, 2, 3, 'E', 3, '2025-09-24 16:19:02'),
(144, 2, 3, 'E', 4, '2025-09-24 16:19:02'),
(145, 2, 3, 'E', 5, '2025-09-24 16:19:02'),
(146, 2, 3, 'E', 6, '2025-09-24 16:19:02'),
(147, 2, 3, 'E', 7, '2025-09-24 16:19:02'),
(148, 2, 3, 'E', 8, '2025-09-24 16:19:02'),
(149, 2, 3, 'E', 9, '2025-09-24 16:19:02'),
(150, 2, 3, 'E', 10, '2025-09-24 16:19:02'),
(151, 2, 3, 'E', 11, '2025-09-24 16:19:02'),
(152, 2, 3, 'E', 12, '2025-09-24 16:19:02'),
(153, 2, 3, 'E', 13, '2025-09-24 16:19:02'),
(154, 2, 3, 'E', 14, '2025-09-24 16:19:02'),
(155, 2, 3, 'E', 15, '2025-09-24 16:19:02'),
(156, 2, 3, 'F', 1, '2025-09-24 16:19:02'),
(157, 2, 3, 'F', 2, '2025-09-24 16:19:02'),
(158, 2, 3, 'F', 3, '2025-09-24 16:19:02'),
(159, 2, 3, 'F', 4, '2025-09-24 16:19:02'),
(160, 2, 3, 'F', 5, '2025-09-24 16:19:02'),
(161, 2, 3, 'F', 6, '2025-09-24 16:19:02'),
(162, 2, 3, 'F', 7, '2025-09-24 16:19:02'),
(163, 2, 3, 'F', 8, '2025-09-24 16:19:02'),
(164, 2, 3, 'F', 9, '2025-09-24 16:19:02'),
(165, 2, 3, 'F', 10, '2025-09-24 16:19:02'),
(166, 2, 3, 'F', 11, '2025-09-24 16:19:02'),
(167, 2, 3, 'F', 12, '2025-09-24 16:19:02'),
(168, 2, 3, 'F', 13, '2025-09-24 16:19:02'),
(169, 2, 3, 'F', 14, '2025-09-24 16:19:02'),
(170, 2, 3, 'F', 15, '2025-09-24 16:19:02'),
(171, 3, 1, 'A', 1, '2025-09-24 16:19:02'),
(172, 3, 1, 'A', 2, '2025-09-24 16:19:02'),
(173, 3, 1, 'A', 3, '2025-09-24 16:19:02'),
(174, 3, 1, 'A', 4, '2025-09-24 16:19:02'),
(175, 3, 1, 'A', 5, '2025-09-24 16:19:02'),
(176, 3, 1, 'A', 6, '2025-09-24 16:19:02'),
(177, 3, 1, 'B', 1, '2025-09-24 16:19:02'),
(178, 3, 1, 'B', 2, '2025-09-24 16:19:02'),
(179, 3, 1, 'B', 3, '2025-09-24 16:19:02'),
(180, 3, 1, 'B', 4, '2025-09-24 16:19:02'),
(181, 3, 1, 'B', 5, '2025-09-24 16:19:02'),
(182, 3, 1, 'B', 6, '2025-09-24 16:19:02'),
(183, 3, 2, 'C', 1, '2025-09-24 16:19:02'),
(184, 3, 2, 'C', 2, '2025-09-24 16:19:02'),
(185, 3, 2, 'C', 3, '2025-09-24 16:19:02'),
(186, 3, 2, 'C', 4, '2025-09-24 16:19:02'),
(187, 3, 2, 'C', 5, '2025-09-24 16:19:02'),
(188, 3, 2, 'C', 6, '2025-09-24 16:19:02'),
(189, 3, 2, 'C', 7, '2025-09-24 16:19:02'),
(190, 3, 2, 'C', 8, '2025-09-24 16:19:02'),
(191, 3, 2, 'D', 1, '2025-09-24 16:19:02'),
(192, 3, 2, 'D', 2, '2025-09-24 16:19:02'),
(193, 3, 2, 'D', 3, '2025-09-24 16:19:02'),
(194, 3, 2, 'D', 4, '2025-09-24 16:19:02'),
(195, 3, 2, 'D', 5, '2025-09-24 16:19:02'),
(196, 3, 2, 'D', 6, '2025-09-24 16:19:02'),
(197, 3, 2, 'D', 7, '2025-09-24 16:19:02'),
(198, 3, 2, 'D', 8, '2025-09-24 16:19:02'),
(199, 3, 3, 'E', 1, '2025-09-24 16:19:02'),
(200, 3, 3, 'E', 2, '2025-09-24 16:19:02'),
(201, 3, 3, 'E', 3, '2025-09-24 16:19:02'),
(202, 3, 3, 'E', 4, '2025-09-24 16:19:02'),
(203, 3, 3, 'E', 5, '2025-09-24 16:19:02'),
(204, 3, 3, 'E', 6, '2025-09-24 16:19:02'),
(205, 3, 3, 'E', 7, '2025-09-24 16:19:02'),
(206, 3, 3, 'E', 8, '2025-09-24 16:19:02'),
(207, 3, 3, 'E', 9, '2025-09-24 16:19:02'),
(208, 3, 3, 'E', 10, '2025-09-24 16:19:02'),
(209, 3, 3, 'E', 11, '2025-09-24 16:19:02'),
(210, 3, 3, 'F', 1, '2025-09-24 16:19:02'),
(211, 3, 3, 'F', 2, '2025-09-24 16:19:02'),
(212, 3, 3, 'F', 3, '2025-09-24 16:19:02'),
(213, 3, 3, 'F', 4, '2025-09-24 16:19:02'),
(214, 3, 3, 'F', 5, '2025-09-24 16:19:02'),
(215, 3, 3, 'F', 6, '2025-09-24 16:19:02'),
(216, 3, 3, 'F', 7, '2025-09-24 16:19:02'),
(217, 3, 3, 'F', 8, '2025-09-24 16:19:02'),
(218, 3, 3, 'F', 9, '2025-09-24 16:19:02'),
(219, 3, 3, 'F', 10, '2025-09-24 16:19:02'),
(220, 3, 3, 'F', 11, '2025-09-24 16:19:02');

-- --------------------------------------------------------

--
-- Table structure for table `seat_categories`
--

CREATE TABLE `seat_categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(100) NOT NULL,
  `base_price` decimal(10,3) NOT NULL,
  `color_class` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `seat_categories`
--

INSERT INTO `seat_categories` (`category_id`, `category_name`, `base_price`, `color_class`) VALUES
(1, 'Hạng A', 100.000, 'A'),
(2, 'Hạng B', 75.000, 'B'),
(3, 'Hạng C', 0.000, 'C');

-- --------------------------------------------------------

--
-- Table structure for table `shows`
--

CREATE TABLE `shows` (
  `show_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `duration_minutes` int(11) DEFAULT NULL,
  `director` varchar(255) DEFAULT NULL,
  `poster_image_url` varchar(500) DEFAULT NULL,
  `status` enum('upcoming','current','ended') DEFAULT 'upcoming',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `shows`
--

INSERT INTO `shows` (`show_id`, `title`, `description`, `duration_minutes`, `director`, `poster_image_url`, `status`, `created_at`, `updated_at`) VALUES
(8, 'Đứt dây tơ chùng', 'Câu chuyện xoay quanh những giằng xé trong tình yêu, danh vọng và số phận. Sợi dây tình cảm tưởng chừng bền chặt nhưng lại mong manh trước thử thách của lòng người.', 120, 'Nguyễn Văn Khánh', 'images/dut-day-to-chung-poster.jpg', 'upcoming', '2025-10-03 16:06:09', '2025-10-03 16:06:49'),
(9, 'Gánh Cỏ Sông Hàn', 'Lấy bối cảnh miền Trung những năm sau chiến tranh, vở kịch khắc họa số phận những con người mưu sinh bên bến sông Hàn, với tình người chan chứa giữa cuộc đời đầy nhọc nhằn.', 110, 'Trần Thị Mai', 'images/ganh-co-poster.jpg', 'upcoming', '2025-10-03 16:08:17', '2025-10-03 16:08:43'),
(10, 'Làng Song Sinh', 'Một ngôi làng kỳ bí nơi những cặp song sinh liên tục chào đời. Bí mật phía sau sự trùng hợp ấy dần hé lộ, để rồi đẩy người xem vào những tình huống ly kỳ và ám ảnh.', 100, 'Lê Hoàng Nam', 'images/lang-song-sinh-poster.jpg', 'upcoming', '2025-10-03 16:10:17', '2025-10-03 16:10:17'),
(11, 'Lôi Vũ', 'Một trong những vở kịch nổi tiếng nhất thế kỷ XX, “Lôi Vũ” phơi bày những mâu thuẫn giai cấp, đạo đức và gia đình trong xã hội cũ. Vở diễn mang đến sự lay động mạnh mẽ và dư âm lâu dài.', 140, 'Phạm Quang Dũng', 'images/loi-vu.jpg', 'upcoming', '2025-10-03 16:11:34', '2025-10-03 16:11:34'),
(12, 'Ngôi Nhà Trong Mây', 'Một câu chuyện thơ mộng về tình yêu và khát vọng sống, nơi con người tìm đến “ngôi nhà trong mây” để trốn chạy thực tại. Nhưng rồi họ nhận ra: hạnh phúc thật sự chỉ đến khi dám đối diện với chính mình.', 104, 'Vũ Thảo My', 'images/ngoi-nha-trong-may-poster.jpg', 'upcoming', '2025-10-03 16:12:37', '2025-10-03 16:12:37'),
(13, 'Tấm Cám Đại Chiến', 'Phiên bản hiện đại, vui nhộn và đầy sáng tạo của truyện cổ tích “Tấm Cám”. Với yếu tố gây cười, châm biếm và bất ngờ, vở diễn mang đến những phút giây giải trí thú vị cho cả gia đình.', 95, 'Hoàng Anh Tú', 'images/tam-cam-poster.jpg', 'upcoming', '2025-10-03 16:13:39', '2025-10-03 16:13:39');

-- --------------------------------------------------------

--
-- Table structure for table `show_genres`
--

CREATE TABLE `show_genres` (
  `show_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `show_genres`
--

INSERT INTO `show_genres` (`show_id`, `genre_id`) VALUES
(8, 6),
(8, 8),
(9, 8),
(9, 9),
(9, 10),
(10, 8),
(10, 13),
(11, 6),
(11, 8),
(11, 15),
(12, 11),
(12, 12),
(13, 7),
(13, 14);

-- --------------------------------------------------------

--
-- Table structure for table `theaters`
--

CREATE TABLE `theaters` (
  `theater_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_seats` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `theaters`
--

INSERT INTO `theaters` (`theater_id`, `name`, `total_seats`, `created_at`) VALUES
(1, 'Rạp 1', 100, '2025-09-24 16:18:17'),
(2, 'Rạp 2', 70, '2025-09-24 16:18:17'),
(3, 'Rạp 3', 50, '2025-09-24 16:18:17');

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `ticket_id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `seat_id` int(11) NOT NULL,
  `ticket_code` varchar(20) NOT NULL,
  `status` enum('issued','used','invalid') NOT NULL DEFAULT 'issued'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `user_type` enum('customer','staff') NOT NULL DEFAULT 'customer',
  `status` enum('active','banned','deleted') NOT NULL DEFAULT 'active',
  `banned_until` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`booking_id`);

--
-- Indexes for table `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`genre_id`),
  ADD UNIQUE KEY `genre_name` (`genre_name`);

--
-- Indexes for table `performances`
--
ALTER TABLE `performances`
  ADD PRIMARY KEY (`performance_id`),
  ADD KEY `show_id` (`show_id`),
  ADD KEY `theater_id` (`theater_id`);

--
-- Indexes for table `seats`
--
ALTER TABLE `seats`
  ADD PRIMARY KEY (`seat_id`),
  ADD UNIQUE KEY `unique_theater_seat` (`theater_id`,`row_char`,`seat_number`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `seat_categories`
--
ALTER TABLE `seat_categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `shows`
--
ALTER TABLE `shows`
  ADD PRIMARY KEY (`show_id`);

--
-- Indexes for table `show_genres`
--
ALTER TABLE `show_genres`
  ADD PRIMARY KEY (`show_id`,`genre_id`);

--
-- Indexes for table `theaters`
--
ALTER TABLE `theaters`
  ADD PRIMARY KEY (`theater_id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`ticket_id`),
  ADD UNIQUE KEY `ticket_code` (`ticket_code`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `genres`
--
ALTER TABLE `genres`
  MODIFY `genre_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `performances`
--
ALTER TABLE `performances`
  MODIFY `performance_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `seats`
--
ALTER TABLE `seats`
  MODIFY `seat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=221;

--
-- AUTO_INCREMENT for table `seat_categories`
--
ALTER TABLE `seat_categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `shows`
--
ALTER TABLE `shows`
  MODIFY `show_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `theaters`
--
ALTER TABLE `theaters`
  MODIFY `theater_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `ticket_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `performances`
--
ALTER TABLE `performances`
  ADD CONSTRAINT `performances_ibfk_1` FOREIGN KEY (`show_id`) REFERENCES `shows` (`show_id`),
  ADD CONSTRAINT `performances_ibfk_2` FOREIGN KEY (`theater_id`) REFERENCES `theaters` (`theater_id`);

--
-- Constraints for table `seats`
--
ALTER TABLE `seats`
  ADD CONSTRAINT `seats_ibfk_1` FOREIGN KEY (`theater_id`) REFERENCES `theaters` (`theater_id`),
  ADD CONSTRAINT `seats_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `seat_categories` (`category_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
