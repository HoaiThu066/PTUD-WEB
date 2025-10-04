-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 24, 2025 at 06:22 PM
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
-- Database: `theater_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `booking_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `performance_id` int(11) DEFAULT NULL,
  `total_amount` decimal(10,3) NOT NULL,
  `booking_status` enum('pending','confirmed','cancelled') DEFAULT 'pending',
  `payment_status` enum('pending','paid','failed','refunded') DEFAULT 'pending',
  `booking_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `genres`
--

CREATE TABLE `genres` (
  `genre_id` int(11) NOT NULL,
  `genre_name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `genres`
--

INSERT INTO `genres` (`genre_id`, `genre_name`, `description`, `created_at`) VALUES
(1, 'Kịch', 'Thể loại kịch nói truyền thống, tập trung vào câu chuyện và diễn xuất', '2025-09-24 16:17:19'),
(2, 'Lịch Sử', 'Kịch tái hiện các sự kiện lịch sử hoặc nhân vật lịch sử', '2025-09-24 16:17:19'),
(3, 'Nhạc Kịch', 'Kịch kết hợp với âm nhạc và múa, mang tính biểu cảm cao', '2025-09-24 16:17:19'),
(4, 'Cải Lương', 'Thể loại sân khấu truyền thống Việt Nam với âm nhạc dân tộc', '2025-09-24 16:17:19'),
(5, 'Cổ Trang', 'Kịch lấy bối cảnh thời xưa, thường dựa trên văn học cổ điển', '2025-09-24 16:17:19');

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
(1, 1, 1, '2025-10-01', '20:00:00', '22:30:00', 'scheduled', 400.000, '2025-09-24 16:18:42', '2025-09-24 16:18:42'),
(2, 1, 1, '2025-10-02', '20:00:00', '22:30:00', 'scheduled', 400.000, '2025-09-24 16:18:42', '2025-09-24 16:18:42'),
(3, 1, 1, '2025-10-03', '15:00:00', '17:30:00', 'scheduled', 400.000, '2025-09-24 16:18:42', '2025-09-24 16:18:42'),
(4, 1, 1, '2025-10-05', '20:00:00', '22:30:00', 'scheduled', 350.000, '2025-09-24 16:18:42', '2025-09-24 16:18:42'),
(5, 2, 3, '2025-09-28', '20:00:00', '22:00:00', 'scheduled', 300.000, '2025-09-24 16:18:42', '2025-09-24 16:18:42'),
(6, 2, 3, '2025-09-29', '20:00:00', '22:00:00', 'scheduled', 250.000, '2025-09-24 16:18:42', '2025-09-24 16:18:42'),
(7, 2, 3, '2025-09-30', '15:00:00', '17:00:00', 'scheduled', 250.000, '2025-09-24 16:18:42', '2025-09-24 16:18:42'),
(8, 4, 2, '2025-10-10', '19:30:00', '21:45:00', 'scheduled', 400.000, '2025-09-24 16:18:42', '2025-09-24 16:18:42'),
(9, 4, 2, '2025-10-11', '19:30:00', '21:45:00', 'scheduled', 400.000, '2025-09-24 16:18:42', '2025-09-24 16:18:42'),
(10, 4, 2, '2025-10-12', '15:00:00', '17:15:00', 'scheduled', 350.000, '2025-09-24 16:18:42', '2025-09-24 16:18:42'),
(11, 4, 2, '2025-10-13', '19:30:00', '21:45:00', 'scheduled', 400.000, '2025-09-24 16:18:42', '2025-09-24 16:18:42'),
(12, 6, 1, '2025-10-05', '20:00:00', '22:20:00', 'scheduled', 350.000, '2025-09-24 16:18:42', '2025-09-24 16:18:42'),
(13, 6, 1, '2025-10-06', '20:00:00', '22:20:00', 'scheduled', 250.000, '2025-09-24 16:18:42', '2025-09-24 16:18:42'),
(14, 6, 1, '2025-10-07', '15:00:00', '17:20:00', 'scheduled', 250.000, '2025-09-24 16:18:42', '2025-09-24 16:18:42');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `review_id` int(11) NOT NULL,
  `show_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL CHECK (`rating` >= 1 and `rating` <= 5),
  `content` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `seats`
--

CREATE TABLE `seats` (
  `seat_id` int(11) NOT NULL,
  `theater_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `row_number` varchar(10) NOT NULL,
  `seat_number` int(11) NOT NULL,
  `status` enum('available','blocked','booked') DEFAULT 'available',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `seats`
--

INSERT INTO `seats` (`seat_id`, `theater_id`, `category_id`, `row_number`, `seat_number`, `status`, `created_at`) VALUES
(1, 1, 1, 'A', 1, 'available', '2025-09-24 16:19:02'),
(2, 1, 1, 'A', 2, 'available', '2025-09-24 16:19:02'),
(3, 1, 1, 'A', 3, 'available', '2025-09-24 16:19:02'),
(4, 1, 1, 'A', 4, 'available', '2025-09-24 16:19:02'),
(5, 1, 1, 'A', 5, 'available', '2025-09-24 16:19:02'),
(6, 1, 1, 'A', 6, 'available', '2025-09-24 16:19:02'),
(7, 1, 1, 'A', 7, 'available', '2025-09-24 16:19:02'),
(8, 1, 1, 'A', 8, 'available', '2025-09-24 16:19:02'),
(9, 1, 1, 'A', 9, 'available', '2025-09-24 16:19:02'),
(10, 1, 1, 'A', 10, 'available', '2025-09-24 16:19:02'),
(11, 1, 1, 'A', 11, 'available', '2025-09-24 16:19:02'),
(12, 1, 1, 'A', 12, 'available', '2025-09-24 16:19:02'),
(13, 1, 1, 'A', 13, 'available', '2025-09-24 16:19:02'),
(14, 1, 1, 'A', 14, 'available', '2025-09-24 16:19:02'),
(15, 1, 1, 'A', 15, 'available', '2025-09-24 16:19:02'),
(16, 1, 1, 'B', 1, 'available', '2025-09-24 16:19:02'),
(17, 1, 1, 'B', 2, 'available', '2025-09-24 16:19:02'),
(18, 1, 1, 'B', 3, 'available', '2025-09-24 16:19:02'),
(19, 1, 1, 'B', 4, 'available', '2025-09-24 16:19:02'),
(20, 1, 1, 'B', 5, 'available', '2025-09-24 16:19:02'),
(21, 1, 1, 'B', 6, 'available', '2025-09-24 16:19:02'),
(22, 1, 1, 'B', 7, 'available', '2025-09-24 16:19:02'),
(23, 1, 1, 'B', 8, 'available', '2025-09-24 16:19:02'),
(24, 1, 1, 'B', 9, 'available', '2025-09-24 16:19:02'),
(25, 1, 1, 'B', 10, 'available', '2025-09-24 16:19:02'),
(26, 1, 1, 'B', 11, 'available', '2025-09-24 16:19:02'),
(27, 1, 1, 'B', 12, 'available', '2025-09-24 16:19:02'),
(28, 1, 1, 'B', 13, 'available', '2025-09-24 16:19:02'),
(29, 1, 1, 'B', 14, 'available', '2025-09-24 16:19:02'),
(30, 1, 1, 'B', 15, 'available', '2025-09-24 16:19:02'),
(31, 1, 2, 'C', 1, 'available', '2025-09-24 16:19:02'),
(32, 1, 2, 'C', 2, 'available', '2025-09-24 16:19:02'),
(33, 1, 2, 'C', 3, 'available', '2025-09-24 16:19:02'),
(34, 1, 2, 'C', 4, 'available', '2025-09-24 16:19:02'),
(35, 1, 2, 'C', 5, 'available', '2025-09-24 16:19:02'),
(36, 1, 2, 'C', 6, 'available', '2025-09-24 16:19:02'),
(37, 1, 2, 'C', 7, 'available', '2025-09-24 16:19:02'),
(38, 1, 2, 'C', 8, 'available', '2025-09-24 16:19:02'),
(39, 1, 2, 'C', 9, 'available', '2025-09-24 16:19:02'),
(40, 1, 2, 'C', 10, 'available', '2025-09-24 16:19:02'),
(41, 1, 2, 'C', 11, 'available', '2025-09-24 16:19:02'),
(42, 1, 2, 'C', 12, 'available', '2025-09-24 16:19:02'),
(43, 1, 2, 'C', 13, 'available', '2025-09-24 16:19:02'),
(44, 1, 2, 'C', 14, 'available', '2025-09-24 16:19:02'),
(45, 1, 2, 'C', 15, 'available', '2025-09-24 16:19:02'),
(46, 1, 2, 'D', 1, 'available', '2025-09-24 16:19:02'),
(47, 1, 2, 'D', 2, 'available', '2025-09-24 16:19:02'),
(48, 1, 2, 'D', 3, 'available', '2025-09-24 16:19:02'),
(49, 1, 2, 'D', 4, 'available', '2025-09-24 16:19:02'),
(50, 1, 2, 'D', 5, 'available', '2025-09-24 16:19:02'),
(51, 1, 2, 'D', 6, 'available', '2025-09-24 16:19:02'),
(52, 1, 2, 'D', 7, 'available', '2025-09-24 16:19:02'),
(53, 1, 2, 'D', 8, 'available', '2025-09-24 16:19:02'),
(54, 1, 2, 'D', 9, 'available', '2025-09-24 16:19:02'),
(55, 1, 2, 'D', 10, 'available', '2025-09-24 16:19:02'),
(56, 1, 2, 'D', 11, 'available', '2025-09-24 16:19:02'),
(57, 1, 2, 'D', 12, 'available', '2025-09-24 16:19:02'),
(58, 1, 2, 'D', 13, 'available', '2025-09-24 16:19:02'),
(59, 1, 2, 'D', 14, 'available', '2025-09-24 16:19:02'),
(60, 1, 2, 'D', 15, 'available', '2025-09-24 16:19:02'),
(61, 1, 3, 'E', 1, 'available', '2025-09-24 16:19:02'),
(62, 1, 3, 'E', 2, 'available', '2025-09-24 16:19:02'),
(63, 1, 3, 'E', 3, 'available', '2025-09-24 16:19:02'),
(64, 1, 3, 'E', 4, 'available', '2025-09-24 16:19:02'),
(65, 1, 3, 'E', 5, 'available', '2025-09-24 16:19:02'),
(66, 1, 3, 'E', 6, 'available', '2025-09-24 16:19:02'),
(67, 1, 3, 'E', 7, 'available', '2025-09-24 16:19:02'),
(68, 1, 3, 'E', 8, 'available', '2025-09-24 16:19:02'),
(69, 1, 3, 'E', 9, 'available', '2025-09-24 16:19:02'),
(70, 1, 3, 'E', 10, 'available', '2025-09-24 16:19:02'),
(71, 1, 3, 'E', 11, 'available', '2025-09-24 16:19:02'),
(72, 1, 3, 'E', 12, 'available', '2025-09-24 16:19:02'),
(73, 1, 3, 'E', 13, 'available', '2025-09-24 16:19:02'),
(74, 1, 3, 'E', 14, 'available', '2025-09-24 16:19:02'),
(75, 1, 3, 'E', 15, 'available', '2025-09-24 16:19:02'),
(76, 1, 3, 'E', 16, 'available', '2025-09-24 16:19:02'),
(77, 1, 3, 'E', 17, 'available', '2025-09-24 16:19:02'),
(78, 1, 3, 'E', 18, 'available', '2025-09-24 16:19:02'),
(79, 1, 3, 'E', 19, 'available', '2025-09-24 16:19:02'),
(80, 1, 3, 'E', 20, 'available', '2025-09-24 16:19:02'),
(81, 1, 3, 'F', 1, 'available', '2025-09-24 16:19:02'),
(82, 1, 3, 'F', 2, 'available', '2025-09-24 16:19:02'),
(83, 1, 3, 'F', 3, 'available', '2025-09-24 16:19:02'),
(84, 1, 3, 'F', 4, 'available', '2025-09-24 16:19:02'),
(85, 1, 3, 'F', 5, 'available', '2025-09-24 16:19:02'),
(86, 1, 3, 'F', 6, 'available', '2025-09-24 16:19:02'),
(87, 1, 3, 'F', 7, 'available', '2025-09-24 16:19:02'),
(88, 1, 3, 'F', 8, 'available', '2025-09-24 16:19:02'),
(89, 1, 3, 'F', 9, 'available', '2025-09-24 16:19:02'),
(90, 1, 3, 'F', 10, 'available', '2025-09-24 16:19:02'),
(91, 1, 3, 'F', 11, 'available', '2025-09-24 16:19:02'),
(92, 1, 3, 'F', 12, 'available', '2025-09-24 16:19:02'),
(93, 1, 3, 'F', 13, 'available', '2025-09-24 16:19:02'),
(94, 1, 3, 'F', 14, 'available', '2025-09-24 16:19:02'),
(95, 1, 3, 'F', 15, 'available', '2025-09-24 16:19:02'),
(96, 1, 3, 'F', 16, 'available', '2025-09-24 16:19:02'),
(97, 1, 3, 'F', 17, 'available', '2025-09-24 16:19:02'),
(98, 1, 3, 'F', 18, 'available', '2025-09-24 16:19:02'),
(99, 1, 3, 'F', 19, 'available', '2025-09-24 16:19:02'),
(100, 1, 3, 'F', 20, 'available', '2025-09-24 16:19:02'),
(101, 2, 1, 'A', 1, 'available', '2025-09-24 16:19:02'),
(102, 2, 1, 'A', 2, 'available', '2025-09-24 16:19:02'),
(103, 2, 1, 'A', 3, 'available', '2025-09-24 16:19:02'),
(104, 2, 1, 'A', 4, 'available', '2025-09-24 16:19:02'),
(105, 2, 1, 'A', 5, 'available', '2025-09-24 16:19:02'),
(106, 2, 1, 'A', 6, 'available', '2025-09-24 16:19:02'),
(107, 2, 1, 'A', 7, 'available', '2025-09-24 16:19:02'),
(108, 2, 1, 'A', 8, 'available', '2025-09-24 16:19:02'),
(109, 2, 1, 'B', 1, 'available', '2025-09-24 16:19:02'),
(110, 2, 1, 'B', 2, 'available', '2025-09-24 16:19:02'),
(111, 2, 1, 'B', 3, 'available', '2025-09-24 16:19:02'),
(112, 2, 1, 'B', 4, 'available', '2025-09-24 16:19:02'),
(113, 2, 1, 'B', 5, 'available', '2025-09-24 16:19:02'),
(114, 2, 1, 'B', 6, 'available', '2025-09-24 16:19:02'),
(115, 2, 1, 'B', 7, 'available', '2025-09-24 16:19:02'),
(116, 2, 1, 'B', 8, 'available', '2025-09-24 16:19:02'),
(117, 2, 2, 'C', 1, 'available', '2025-09-24 16:19:02'),
(118, 2, 2, 'C', 2, 'available', '2025-09-24 16:19:02'),
(119, 2, 2, 'C', 3, 'available', '2025-09-24 16:19:02'),
(120, 2, 2, 'C', 4, 'available', '2025-09-24 16:19:02'),
(121, 2, 2, 'C', 5, 'available', '2025-09-24 16:19:02'),
(122, 2, 2, 'C', 6, 'available', '2025-09-24 16:19:02'),
(123, 2, 2, 'C', 7, 'available', '2025-09-24 16:19:02'),
(124, 2, 2, 'C', 8, 'available', '2025-09-24 16:19:02'),
(125, 2, 2, 'C', 9, 'available', '2025-09-24 16:19:02'),
(126, 2, 2, 'C', 10, 'available', '2025-09-24 16:19:02'),
(127, 2, 2, 'C', 11, 'available', '2025-09-24 16:19:02'),
(128, 2, 2, 'C', 12, 'available', '2025-09-24 16:19:02'),
(129, 2, 2, 'D', 1, 'available', '2025-09-24 16:19:02'),
(130, 2, 2, 'D', 2, 'available', '2025-09-24 16:19:02'),
(131, 2, 2, 'D', 3, 'available', '2025-09-24 16:19:02'),
(132, 2, 2, 'D', 4, 'available', '2025-09-24 16:19:02'),
(133, 2, 2, 'D', 5, 'available', '2025-09-24 16:19:02'),
(134, 2, 2, 'D', 6, 'available', '2025-09-24 16:19:02'),
(135, 2, 2, 'D', 7, 'available', '2025-09-24 16:19:02'),
(136, 2, 2, 'D', 8, 'available', '2025-09-24 16:19:02'),
(137, 2, 2, 'D', 9, 'available', '2025-09-24 16:19:02'),
(138, 2, 2, 'D', 10, 'available', '2025-09-24 16:19:02'),
(139, 2, 2, 'D', 11, 'available', '2025-09-24 16:19:02'),
(140, 2, 2, 'D', 12, 'available', '2025-09-24 16:19:02'),
(141, 2, 3, 'E', 1, 'available', '2025-09-24 16:19:02'),
(142, 2, 3, 'E', 2, 'available', '2025-09-24 16:19:02'),
(143, 2, 3, 'E', 3, 'available', '2025-09-24 16:19:02'),
(144, 2, 3, 'E', 4, 'available', '2025-09-24 16:19:02'),
(145, 2, 3, 'E', 5, 'available', '2025-09-24 16:19:02'),
(146, 2, 3, 'E', 6, 'available', '2025-09-24 16:19:02'),
(147, 2, 3, 'E', 7, 'available', '2025-09-24 16:19:02'),
(148, 2, 3, 'E', 8, 'available', '2025-09-24 16:19:02'),
(149, 2, 3, 'E', 9, 'available', '2025-09-24 16:19:02'),
(150, 2, 3, 'E', 10, 'available', '2025-09-24 16:19:02'),
(151, 2, 3, 'E', 11, 'available', '2025-09-24 16:19:02'),
(152, 2, 3, 'E', 12, 'available', '2025-09-24 16:19:02'),
(153, 2, 3, 'E', 13, 'available', '2025-09-24 16:19:02'),
(154, 2, 3, 'E', 14, 'available', '2025-09-24 16:19:02'),
(155, 2, 3, 'E', 15, 'available', '2025-09-24 16:19:02'),
(156, 2, 3, 'F', 1, 'available', '2025-09-24 16:19:02'),
(157, 2, 3, 'F', 2, 'available', '2025-09-24 16:19:02'),
(158, 2, 3, 'F', 3, 'available', '2025-09-24 16:19:02'),
(159, 2, 3, 'F', 4, 'available', '2025-09-24 16:19:02'),
(160, 2, 3, 'F', 5, 'available', '2025-09-24 16:19:02'),
(161, 2, 3, 'F', 6, 'available', '2025-09-24 16:19:02'),
(162, 2, 3, 'F', 7, 'available', '2025-09-24 16:19:02'),
(163, 2, 3, 'F', 8, 'available', '2025-09-24 16:19:02'),
(164, 2, 3, 'F', 9, 'available', '2025-09-24 16:19:02'),
(165, 2, 3, 'F', 10, 'available', '2025-09-24 16:19:02'),
(166, 2, 3, 'F', 11, 'available', '2025-09-24 16:19:02'),
(167, 2, 3, 'F', 12, 'available', '2025-09-24 16:19:02'),
(168, 2, 3, 'F', 13, 'available', '2025-09-24 16:19:02'),
(169, 2, 3, 'F', 14, 'available', '2025-09-24 16:19:02'),
(170, 2, 3, 'F', 15, 'available', '2025-09-24 16:19:02'),
(171, 3, 1, 'A', 1, 'available', '2025-09-24 16:19:02'),
(172, 3, 1, 'A', 2, 'available', '2025-09-24 16:19:02'),
(173, 3, 1, 'A', 3, 'available', '2025-09-24 16:19:02'),
(174, 3, 1, 'A', 4, 'available', '2025-09-24 16:19:02'),
(175, 3, 1, 'A', 5, 'available', '2025-09-24 16:19:02'),
(176, 3, 1, 'A', 6, 'available', '2025-09-24 16:19:02'),
(177, 3, 1, 'B', 1, 'available', '2025-09-24 16:19:02'),
(178, 3, 1, 'B', 2, 'available', '2025-09-24 16:19:02'),
(179, 3, 1, 'B', 3, 'available', '2025-09-24 16:19:02'),
(180, 3, 1, 'B', 4, 'available', '2025-09-24 16:19:02'),
(181, 3, 1, 'B', 5, 'available', '2025-09-24 16:19:02'),
(182, 3, 1, 'B', 6, 'available', '2025-09-24 16:19:02'),
(183, 3, 2, 'C', 1, 'available', '2025-09-24 16:19:02'),
(184, 3, 2, 'C', 2, 'available', '2025-09-24 16:19:02'),
(185, 3, 2, 'C', 3, 'available', '2025-09-24 16:19:02'),
(186, 3, 2, 'C', 4, 'available', '2025-09-24 16:19:02'),
(187, 3, 2, 'C', 5, 'available', '2025-09-24 16:19:02'),
(188, 3, 2, 'C', 6, 'available', '2025-09-24 16:19:02'),
(189, 3, 2, 'C', 7, 'available', '2025-09-24 16:19:02'),
(190, 3, 2, 'C', 8, 'available', '2025-09-24 16:19:02'),
(191, 3, 2, 'D', 1, 'available', '2025-09-24 16:19:02'),
(192, 3, 2, 'D', 2, 'available', '2025-09-24 16:19:02'),
(193, 3, 2, 'D', 3, 'available', '2025-09-24 16:19:02'),
(194, 3, 2, 'D', 4, 'available', '2025-09-24 16:19:02'),
(195, 3, 2, 'D', 5, 'available', '2025-09-24 16:19:02'),
(196, 3, 2, 'D', 6, 'available', '2025-09-24 16:19:02'),
(197, 3, 2, 'D', 7, 'available', '2025-09-24 16:19:02'),
(198, 3, 2, 'D', 8, 'available', '2025-09-24 16:19:02'),
(199, 3, 3, 'E', 1, 'available', '2025-09-24 16:19:02'),
(200, 3, 3, 'E', 2, 'available', '2025-09-24 16:19:02'),
(201, 3, 3, 'E', 3, 'available', '2025-09-24 16:19:02'),
(202, 3, 3, 'E', 4, 'available', '2025-09-24 16:19:02'),
(203, 3, 3, 'E', 5, 'available', '2025-09-24 16:19:02'),
(204, 3, 3, 'E', 6, 'available', '2025-09-24 16:19:02'),
(205, 3, 3, 'E', 7, 'available', '2025-09-24 16:19:02'),
(206, 3, 3, 'E', 8, 'available', '2025-09-24 16:19:02'),
(207, 3, 3, 'E', 9, 'available', '2025-09-24 16:19:02'),
(208, 3, 3, 'E', 10, 'available', '2025-09-24 16:19:02'),
(209, 3, 3, 'E', 11, 'available', '2025-09-24 16:19:02'),
(210, 3, 3, 'F', 1, 'available', '2025-09-24 16:19:02'),
(211, 3, 3, 'F', 2, 'available', '2025-09-24 16:19:02'),
(212, 3, 3, 'F', 3, 'available', '2025-09-24 16:19:02'),
(213, 3, 3, 'F', 4, 'available', '2025-09-24 16:19:02'),
(214, 3, 3, 'F', 5, 'available', '2025-09-24 16:19:02'),
(215, 3, 3, 'F', 6, 'available', '2025-09-24 16:19:02'),
(216, 3, 3, 'F', 7, 'available', '2025-09-24 16:19:02'),
(217, 3, 3, 'F', 8, 'available', '2025-09-24 16:19:02'),
(218, 3, 3, 'F', 9, 'available', '2025-09-24 16:19:02'),
(219, 3, 3, 'F', 10, 'available', '2025-09-24 16:19:02'),
(220, 3, 3, 'F', 11, 'available', '2025-09-24 16:19:02');

-- --------------------------------------------------------

--
-- Table structure for table `seat_categories`
--

CREATE TABLE `seat_categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(100) NOT NULL,
  `surcharge_amount` decimal(10,3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `seat_categories`
--

INSERT INTO `seat_categories` (`category_id`, `category_name`, `surcharge_amount`) VALUES
(1, 'Hạng A', 100.000),
(2, 'Hạng B', 75.000),
(3, 'Hạng C', 0.000);

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
(1, 'Số Đỏ', 'Kiệt tác của nhà văn Vũ Trọng Phụng về cuộc sống người Hà Nội thời thuộc địa. Câu chuyện về Xuân Tóc Đỏ và những mâu thuẫn xã hội sâu sắc trong xã hội cũ.', 150, 'Lê Hùng', '/images/so-do-poster.jpg', 'current', '2025-09-24 16:17:44', '2025-09-24 16:17:44'),
(2, 'Người Mẹ Hội An', 'Vở kịch ca ngợi tình mẫu tử thiêng liêng qua hình ảnh người mẹ Hội An chờ đợi con trai từ chiến trường về. Tác phẩm đầy cảm xúc về tình yêu và hy sinh.', 120, 'Nguyễn Minh Anh', '/images/me-hoi-an-poster.jpg', 'current', '2025-09-24 16:17:44', '2025-09-24 16:17:44'),
(3, 'Làng Vua', 'Vở kịch lịch sử tái hiện cuộc đời vua Quang Trung - Nguyễn Huệ và cuộc chiến chống quân Thanh. Tác phẩm thể hiện khí phách dân tộc và lòng yêu nước.', 180, 'Trần Thanh Hóa', '/images/lang-vua-poster.jpg', 'upcoming', '2025-09-24 16:17:44', '2025-09-24 16:17:44'),
(4, 'Tấm Cám', 'Phiên bản sân khấu hiện đại của câu chuyện cổ tích nổi tiếng. Kết hợp múa, hát và kịch nói tạo nên một tác phẩm nghệ thuật đa sắc màu dành cho cả gia đình.', 135, 'Đỗ Minh Tuấn', '/images/tam-cam-poster.jpg', 'current', '2025-09-24 16:17:44', '2025-09-24 16:17:44'),
(5, 'Tiếng Trống Mê Linh', 'Vở kịch ca ngợi hai bà Trưng và cuộc khởi nghĩa chống Bắc thuộc. Thể hiện tinh thần bất khuất của dân tộc Việt Nam và vai trò của phụ nữ trong lịch sử.', 165, 'Lê Minh Sơn', '/images/me-linh-poster.jpg', 'upcoming', '2025-09-24 16:17:44', '2025-09-24 16:17:44'),
(6, 'Dạ Cổ Hoài Lang', 'Vở cải lương kinh điển về tình yêu đau khổ của Cung Tiện và Thúy Kiều. Âm nhạc truyền thống kết hợp với kỹ thuật sân khấu hiện đại.', 140, 'Thanh Kim Huệ', '/images/da-co-hoai-lang-poster.jpg', 'current', '2025-09-24 16:17:44', '2025-09-24 16:17:44'),
(7, 'Lục Vân Tiên', 'Chuyển thể sân khấu từ tác phẩm cổ điển của Nguyễn Đình Chiểu. Câu chuyện về nghĩa hiệp, tình yêu và lòng trung thành với màu sắc văn hóa dân gian đậm đà.', 155, 'Nguyễn Văn Tùng', '/images/luc-van-tien-poster.jpg', 'upcoming', '2025-09-24 16:17:44', '2025-09-24 16:17:44');

-- --------------------------------------------------------

--
-- Table structure for table `show_genres`
--

CREATE TABLE `show_genres` (
  `show_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `show_genres`
--

INSERT INTO `show_genres` (`show_id`, `genre_id`, `created_at`) VALUES
(1, 1, '2025-09-24 16:18:03'),
(2, 1, '2025-09-24 16:18:03'),
(3, 1, '2025-09-24 16:18:03'),
(3, 2, '2025-09-24 16:18:03'),
(4, 3, '2025-09-24 16:18:03'),
(5, 1, '2025-09-24 16:18:03'),
(5, 2, '2025-09-24 16:18:03'),
(6, 4, '2025-09-24 16:18:03'),
(7, 1, '2025-09-24 16:18:03'),
(7, 5, '2025-09-24 16:18:03');

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
  `booking_id` int(11) DEFAULT NULL,
  `seat_id` int(11) DEFAULT NULL,
  `status` enum('pending','valid','used','cancelled') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `user_type` enum('customer','admin') DEFAULT 'customer',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `email`, `password`, `name`, `phone`, `date_of_birth`, `user_type`, `created_at`, `updated_at`) VALUES
(1, 'admin@theater.com', '12345admin', 'Theater Admin', '555-0001', '2000-01-15', 'admin', '2025-09-24 16:15:17', '2025-09-24 16:15:17'),
(2, 'trang.le@email.com', 'trangle12345', 'Le Thi My Trang', '555-0123', '1999-06-20', 'customer', '2025-09-24 16:15:17', '2025-09-24 16:15:17'),
(3, 'trang.nguyen@email.com', 'trangnguyen12345', 'Nguyen Thi Thuy Trang', '555-0124', '1990-03-15', 'customer', '2025-09-24 16:15:17', '2025-09-24 16:15:17'),
(4, 'thu.nguyen@email.com', 'thunguyen12345', 'Nguyen Hoai Thu', '555-0125', '1997-09-10', 'customer', '2025-09-24 16:15:17', '2025-09-24 16:15:17'),
(5, 'ngoc.duong@email.com', 'ngocduong12345', 'Duong Thanh Ngoc', '555-0002', '1992-12-05', 'customer', '2025-09-24 16:15:17', '2025-09-24 16:15:17'),
(6, 'minh.nguyen@email.com', 'minhnguyen12345', 'Nguyen Van Minh', '555-1314', '2005-04-17', 'customer', '2025-09-24 16:15:17', '2025-09-24 16:15:17'),
(7, 'hoa.tran@email.com', 'hoatran12345', 'Tran Thi Hoa', '555-5402', '1994-12-01', 'customer', '2025-09-24 16:15:17', '2025-09-24 16:15:17');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `performance_id` (`performance_id`);

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
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `show_id` (`show_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `seats`
--
ALTER TABLE `seats`
  ADD PRIMARY KEY (`seat_id`),
  ADD UNIQUE KEY `unique_theater_seat` (`theater_id`,`row_number`,`seat_number`),
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
  ADD PRIMARY KEY (`show_id`,`genre_id`),
  ADD KEY `genre_id` (`genre_id`);

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
  ADD KEY `booking_id` (`booking_id`),
  ADD KEY `seat_id` (`seat_id`);

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
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `genres`
--
ALTER TABLE `genres`
  MODIFY `genre_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `performances`
--
ALTER TABLE `performances`
  MODIFY `performance_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `show_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`performance_id`) REFERENCES `performances` (`performance_id`);

--
-- Constraints for table `performances`
--
ALTER TABLE `performances`
  ADD CONSTRAINT `performances_ibfk_1` FOREIGN KEY (`show_id`) REFERENCES `shows` (`show_id`),
  ADD CONSTRAINT `performances_ibfk_2` FOREIGN KEY (`theater_id`) REFERENCES `theaters` (`theater_id`);

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`show_id`) REFERENCES `shows` (`show_id`),
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `seats`
--
ALTER TABLE `seats`
  ADD CONSTRAINT `seats_ibfk_1` FOREIGN KEY (`theater_id`) REFERENCES `theaters` (`theater_id`),
  ADD CONSTRAINT `seats_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `seat_categories` (`category_id`);

--
-- Constraints for table `show_genres`
--
ALTER TABLE `show_genres`
  ADD CONSTRAINT `show_genres_ibfk_1` FOREIGN KEY (`show_id`) REFERENCES `shows` (`show_id`),
  ADD CONSTRAINT `show_genres_ibfk_2` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`genre_id`);

--
-- Constraints for table `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`booking_id`),
  ADD CONSTRAINT `tickets_ibfk_2` FOREIGN KEY (`seat_id`) REFERENCES `seats` (`seat_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
