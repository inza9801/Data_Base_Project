-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 19, 2025 at 06:54 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `transit_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(11) NOT NULL,
  `booking_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `start_stop` varchar(255) NOT NULL,
  `end_stop` varchar(255) NOT NULL,
  `fare` decimal(10,2) DEFAULT NULL,
  `transit_company` varchar(255) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `date` date DEFAULT curdate()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `booking_time`, `start_stop`, `end_stop`, `fare`, `transit_company`, `user_id`, `date`) VALUES
(5, '2025-01-12 21:43:13', 'Mirpur 10', 'Motijheel', 40.00, 'Dhaka Chaka', 5, '2025-01-13'),
(6, '2025-01-12 21:43:27', 'X', 'Y', 200.00, 'Rapid Metro Services', 5, '2025-01-13'),
(7, '2025-01-12 22:02:50', 'Mirpur 10', 'Motijheel', 40.00, 'Dhaka Chaka', 5, '2025-01-13'),
(8, '2025-01-12 22:03:06', 'X', 'Y', 200.00, 'Rapid Metro Services', 5, '2025-01-13'),
(9, '2025-01-12 22:28:49', 'Mirpur 10', 'Motijheel', 40.00, 'Dhaka Chaka', 5, '2025-01-13'),
(10, '2025-01-12 22:29:00', 'X', 'Y', 200.00, 'Rapid Metro Services', 5, '2025-01-13'),
(11, '2025-01-13 03:17:07', 'Mirpur 10', 'Motijheel', 40.00, 'Dhaka Chaka', 5, '2025-01-13'),
(12, '2025-01-13 03:17:16', 'X', 'Y', 200.00, 'Rapid Metro Services', 5, '2025-01-13'),
(13, '2025-01-13 03:51:30', 'Mirpur 10', 'Motijheel', 40.00, 'Dhaka Chaka', 5, '2025-01-13'),
(14, '2025-01-13 03:51:55', 'X', 'Y', 200.00, 'Rapid Metro Services', 5, '2025-01-13'),
(15, '2025-01-13 03:52:40', 'Mirpur 10', 'Motijheel', 40.00, 'Dhaka Chaka', 5, '2025-01-13'),
(16, '2025-01-13 21:46:33', 'Mirpur 10', 'Motijheel', 40.00, 'Dhaka Chaka', 5, '2025-01-14'),
(17, '2025-01-13 22:01:31', 'Mirpur 10', 'Motijheel', 40.00, 'Dhaka Chaka', 5, '2025-01-14'),
(18, '2025-01-13 23:16:34', 'Mirpur 10', 'X', 380.00, 'Bus company not found', 5, '2025-01-14'),
(19, '2025-01-13 23:16:54', 'Mirpur 10', 'X', 380.00, 'Bus company not found', 5, '2025-01-14'),
(20, '2025-01-13 23:17:39', 'Mirpur 10', 'Motijheel', 170.00, 'Bus company not found', 5, '2025-01-14'),
(21, '2025-01-13 23:18:44', 'Mirpur 10', 'X', 380.00, 'Bus company not found', 5, '2025-01-14'),
(22, '2025-01-13 23:19:10', 'Mirpur 10', 'Motijheel', 170.00, 'Bus company not found', 5, '2025-01-14'),
(23, '2025-01-13 23:20:01', 'X', 'Y', 200.00, 'Rapid Metro Services', 5, '2025-01-14'),
(24, '2025-01-13 23:25:46', 'Mirpur 10', 'Motijheel', 40.00, 'Dhaka Chaka', 5, '2025-01-14'),
(25, '2025-01-14 00:02:23', 'X', 'Y', 200.00, 'Projapati Paribahan', 5, '2025-01-14'),
(26, '2025-01-14 00:04:14', 'X', 'Y', 200.00, 'Projapati Paribahan', 5, '2025-01-14'),
(27, '2025-01-14 17:52:33', 'X', 'Y', 1200.00, 'Projapati Paribahan', 5, '2025-01-14'),
(28, '2025-01-14 17:53:50', 'X', 'Y', 1200.00, 'Projapati Paribahan', 5, '2025-01-14'),
(29, '2025-01-15 11:13:45', 'X', 'Y', 1200.00, 'Projapati Paribahan', 5, '2025-01-15'),
(30, '2025-01-16 14:43:30', 'Y', 'X', 40.00, 'Trust', 5, '2025-01-16'),
(31, '2025-01-16 14:44:18', 'Mirpur 10', 'Farmgate', 140.00, 'Raida', 5, '2025-01-16'),
(32, '2025-01-16 15:40:41', 'X', 'Y', 40.00, 'Trust', 5, '2025-01-16'),
(33, '2025-01-16 15:40:56', 'Mirpur 10', 'Motijheel', 40.00, 'Raida', 5, '2025-01-16'),
(34, '2025-01-16 15:41:31', 'Mirpur 10', 'Farmgate', 140.00, 'Raida', 5, '2025-01-16'),
(35, '2025-01-16 15:46:10', 'X', 'y', 80.00, 'Raida', 5, '2025-01-16'),
(36, '2025-01-16 15:46:40', 'X', 'Y', 80.00, 'Raida', 5, '2025-01-16'),
(37, '2025-01-16 16:00:26', 'X', 'Y', 80.00, 'Raida', 5, '2025-01-16'),
(38, '2025-01-16 16:00:41', 'X', 'Y', 80.00, 'Raida', 5, '2025-01-16'),
(39, '2025-01-16 16:07:53', 'X', 'Y', 50.00, 'Asim', 5, '2025-01-16'),
(40, '2025-01-16 16:08:23', 'X', 'Y', 40.00, 'Trust', 5, '2025-01-16'),
(41, '2025-01-16 16:08:30', 'X', 'Y', 40.00, 'BRTC', 5, '2025-01-16'),
(42, '2025-01-16 16:09:03', 'X', 'Y', 70.00, 'Victor Classic', 5, '2025-01-16'),
(43, '2025-01-16 16:25:08', 'X', 'Y', 40.00, 'Trust', 5, '2025-01-16'),
(44, '2025-01-16 16:25:26', 'Mirpur 10', 'Motijheel', 40.00, 'Raida', 5, '2025-01-16'),
(45, '2025-01-16 16:25:38', 'Mirpur 10', 'Farmgate', 20.00, 'Raida', 5, '2025-01-16'),
(46, '2025-01-16 16:26:37', 'Mohammadpur', '3', 70.00, 'Asim', 5, '2025-01-16'),
(47, '2025-01-16 17:28:46', 'X', 'Y', 40.00, 'Trust', 5, '2025-01-16'),
(48, '2025-01-16 17:54:53', 'Station 5', 'Station 8', 60.00, 'Cityline Rapid Transit', 5, '2025-01-16'),
(49, '2025-01-16 17:59:12', 'Station 1', 'Station 4', 40.00, 'Urban Metro Services', 5, '2025-01-16'),
(50, '2025-01-16 18:10:15', 'Mirpur 10', 'Farmgate', 20.00, 'Raida', 5, '2025-01-17'),
(51, '2025-01-16 18:16:35', 'Station 1', 'Station 4', 40.00, 'Urban Metro Services', 5, '2025-01-17'),
(52, '2025-01-16 18:19:51', 'Station 5', 'Station 8', 60.00, 'Cityline Rapid Transit', 5, '2025-01-17'),
(53, '2025-01-16 18:24:53', 'Station 5', 'Station 6', 20.00, 'Rapid Transit Company', 5, '2025-01-17'),
(54, '2025-01-16 18:29:07', 'Station 1', 'Station 4', 40.00, 'Urban Metro Services', 5, '2025-01-17'),
(55, '2025-01-16 18:36:22', 'Station 5', 'Station 8', 60.00, 'Cityline Rapid Transit', 5, '2025-01-17'),
(56, '2025-01-16 18:45:15', 'X', 'Y', 40.00, 'Trust', 5, '2025-01-17'),
(57, '2025-01-16 19:15:21', 'z', 'xx', 20.00, 'Victor Classic', 5, '2025-01-17'),
(58, '2025-01-16 19:29:02', 'Station 1', 'Station 2', 20.00, 'Metro Rail Dhaka', 5, '2025-01-17'),
(59, '2025-01-16 19:35:35', 'Station 1', 'Station 2', 20.00, 'Metro Rail Dhaka', 5, '2025-01-17'),
(60, '2025-01-16 19:35:56', 'Station 5', 'Station 8', 60.00, 'Cityline Rapid Transit', 5, '2025-01-17'),
(61, '2025-01-16 20:04:21', 'Station 1', 'Station 4', 40.00, 'Urban Metro Services', 5, '2025-01-17'),
(62, '2025-01-16 20:57:41', 'Station 5', 'Station 8', 60.00, 'Cityline Rapid Transit', 5, '2025-01-17'),
(63, '2025-01-17 16:13:03', 'Mirpur 10', 'Farmgate', 20.00, 'Raida', 5, '2025-01-17'),
(64, '2025-01-17 17:43:08', 'Mirpur 10', 'Farmgate', 20.00, 'Raida', 5, '2025-01-17'),
(65, '2025-01-17 17:43:22', 'Station 1', 'Station 4', 40.00, 'Urban Metro Services', 5, '2025-01-17'),
(66, '2025-01-19 14:11:04', 'Mirpur 10', 'Farmgate', 20.00, 'Raida', 5, '2025-01-19'),
(67, '2025-01-19 17:28:33', 'Mirpur 10', 'Farmgate', 20.00, 'Raida', 5, '2025-01-19');

-- --------------------------------------------------------

--
-- Table structure for table `buses`
--

CREATE TABLE `buses` (
  `bus_id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `route_id` int(11) DEFAULT NULL,
  `company_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `buses`
--

INSERT INTO `buses` (`bus_id`, `company_id`, `route_id`, `company_name`) VALUES
(1, 1, 1, 'Raida'),
(2, 2, 2, 'Victor Classic'),
(3, 3, 3, 'Asim'),
(4, 4, 4, 'BRTC'),
(5, 4, 4, 'BRTC'),
(6, 3, 3, 'Asim'),
(7, 3, 3, 'Asim'),
(8, 5, 5, 'Trust'),
(9, 5, 5, 'Trust'),
(10, 5, 5, 'Trust'),
(11, 5, 5, 'Trust');

-- --------------------------------------------------------

--
-- Table structure for table `bus_companies`
--

CREATE TABLE `bus_companies` (
  `company_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `contact_info` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bus_companies`
--

INSERT INTO `bus_companies` (`company_id`, `name`, `contact_info`, `password`) VALUES
(1, 'Raida', 'info@raida.com', 'password1'),
(2, 'Victor Classic', 'info@victorclassic.com', 'password2'),
(3, 'Asim', 'info@asim.com', 'password3'),
(4, 'BRTC', 'info@brtc.com', 'password4'),
(5, 'Trust', 'info@trust.com', 'securepassword5');

-- --------------------------------------------------------

--
-- Table structure for table `bus_income`
--

CREATE TABLE `bus_income` (
  `income_id` int(11) NOT NULL,
  `bus_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `income_amount` decimal(10,2) NOT NULL,
  `company_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bus_income`
--

INSERT INTO `bus_income` (`income_id`, `bus_id`, `date`, `income_amount`, `company_id`) VALUES
(25, 8, '2025-01-16', 40.00, 5),
(26, 1, '2025-01-16', 140.00, 1),
(27, 8, '2025-01-16', 40.00, 5),
(28, 1, '2025-01-16', 40.00, 1),
(29, 1, '2025-01-16', 140.00, 1),
(30, 1, '2025-01-16', 80.00, 1),
(31, 1, '2025-01-16', 80.00, 1),
(32, 1, '2025-01-16', 80.00, 1),
(33, 1, '2025-01-16', 80.00, 1),
(34, 7, '2025-01-16', 50.00, 3),
(35, 10, '2025-01-16', 40.00, 5),
(36, 4, '2025-01-16', 40.00, 4),
(37, 2, '2025-01-16', 70.00, 2),
(38, 9, '2025-01-16', 40.00, 5),
(39, 1, '2025-01-16', 40.00, 1),
(40, 1, '2025-01-16', 20.00, 1),
(41, 6, '2025-01-16', 70.00, 3),
(42, 10, '2025-01-16', 40.00, 5),
(43, 1, '2025-01-17', 20.00, 1),
(44, 11, '2025-01-17', 40.00, 5),
(45, 2, '2025-01-17', 20.00, 2),
(46, 1, '2025-01-17', 20.00, 1),
(47, 1, '2025-01-17', 20.00, 1),
(48, 1, '2025-01-19', 20.00, 1),
(49, 1, '2025-01-19', 20.00, 1);

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `emp_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `contact_info` varchar(255) DEFAULT NULL,
  `position` varchar(100) NOT NULL,
  `transit_type` enum('Bus','Metro') NOT NULL,
  `company_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`emp_id`, `name`, `contact_info`, `position`, `transit_type`, `company_id`) VALUES
(1, 'Rahim Hossain', 'rahim@metro.com', 'Manager', 'Metro', 1),
(2, 'Karim Ahmed', 'karim@metro.com', 'Driver', 'Metro', 1),
(3, 'Abdul Latif', 'abdul@metro.com', 'Technician', 'Metro', 1),
(4, 'Shafik Khan', 'shafik@metro.com', 'Ticket Collector', 'Metro', 1),
(5, 'Nur Jahan', 'nur@metro.com', 'Cleaner', 'Metro', 1),
(6, 'Sultan Mahmud', 'sultan@metro.com', 'Manager', 'Metro', 2),
(7, 'Jamal Uddin', 'jamal@metro.com', 'Driver', 'Metro', 2),
(8, 'Mokbul Rahman', 'mokbul@metro.com', 'Technician', 'Metro', 2),
(9, 'Rashed Mia', 'rashed@metro.com', 'Ticket Collector', 'Metro', 2),
(10, 'Rehana Akhter', 'rehana@metro.com', 'Cleaner', 'Metro', 2),
(11, 'Shahin Alam', 'shahin@metro.com', 'Manager', 'Metro', 3),
(12, 'Sabbir Rahman', 'sabbir@metro.com', 'Driver', 'Metro', 3),
(13, 'Rakibul Islam', 'rakibul@metro.com', 'Technician', 'Metro', 3),
(14, 'Tariqul Hasan', 'tariqul@metro.com', 'Ticket Collector', 'Metro', 3),
(15, 'Shila Begum', 'shila@metro.com', 'Cleaner', 'Metro', 3),
(16, 'Hasanuzzaman', 'hasan@metro.com', 'Manager', 'Metro', 4),
(17, 'Faisal Mahmud', 'faisal@metro.com', 'Driver', 'Metro', 4),
(18, 'Sazzad Hossain', 'sazzad@metro.com', 'Technician', 'Metro', 4),
(19, 'Tanvir Alam', 'tanvir@metro.com', 'Ticket Collector', 'Metro', 4),
(20, 'Nazma Sultana', 'nazma@metro.com', 'Cleaner', 'Metro', 4),
(21, 'Riaz Hossain', 'riaz@bus.com', 'Manager', 'Bus', 1),
(22, 'Shafayet Karim', 'shafayet@bus.com', 'Driver', 'Bus', 1),
(23, 'Khalid Hasan', 'khalid@bus.com', 'Conductor', 'Bus', 1),
(24, 'Shakila Jahan', 'shakila@bus.com', 'Cleaner', 'Bus', 1),
(25, 'Mizanur Rahman', 'mizan@bus.com', 'Manager', 'Bus', 2),
(26, 'Tanvir Hossain', 'tanvir@bus.com', 'Driver', 'Bus', 2),
(27, 'Mahfuzur Rahman', 'mahfuzur@bus.com', 'Conductor', 'Bus', 2),
(28, 'Rupali Akhter', 'rupali@bus.com', 'Cleaner', 'Bus', 2),
(29, 'Nasir Ahmed', 'nasir@bus.com', 'Manager', 'Bus', 3),
(30, 'Sohail Rana', 'sohail@bus.com', 'Driver', 'Bus', 3),
(31, 'Asaduzzaman', 'asaduzzaman@bus.com', 'Conductor', 'Bus', 3),
(32, 'Sumi Akhter', 'sumi@bus.com', 'Cleaner', 'Bus', 3),
(33, 'Rubel Hossain', 'rubel@bus.com', 'Manager', 'Bus', 4),
(34, 'Imran Kabir', 'imran@bus.com', 'Driver', 'Bus', 4),
(35, 'Jubair Alam', 'jubair@bus.com', 'Conductor', 'Bus', 4),
(36, 'Nusrat Jahan', 'nusrat@bus.com', 'Cleaner', 'Bus', 4),
(37, 'Tarek Aziz', 'tarek@bus.com', 'Manager', 'Bus', 5),
(38, 'Shahin Mia', 'shahin@bus.com', 'Driver', 'Bus', 5),
(39, 'Anwar Hossain', 'anwar@bus.com', 'Conductor', 'Bus', 5),
(40, 'Mim Rahman', 'mim@bus.com', 'Cleaner', 'Bus', 5),
(41, 'Anisul Haque', 'anisul@bus.com', 'Driver', 'Bus', 1),
(42, 'Jashim Uddin', 'jashim@bus.com', 'Driver', 'Bus', 1),
(43, 'Maruf Hasan', 'maruf@bus.com', 'Driver', 'Bus', 1),
(44, 'Kamal Khan', 'kamal@bus.com', 'Driver', 'Bus', 1),
(45, 'Firoz Alam', 'firoz@bus.com', 'Conductor', 'Bus', 1),
(46, 'Bashir Ahmed', 'bashir@bus.com', 'Conductor', 'Bus', 1),
(47, 'Kabir Mia', 'kabir@bus.com', 'Conductor', 'Bus', 1),
(48, 'Saiful Islam', 'saiful@bus.com', 'Conductor', 'Bus', 1),
(49, 'Rubina Akhter', 'rubina@bus.com', 'Cleaner', 'Bus', 1),
(50, 'Parvin Sultana', 'parvin@bus.com', 'Cleaner', 'Bus', 1),
(51, 'Hasina Begum', 'hasina@bus.com', 'Cleaner', 'Bus', 1),
(52, 'Latifa Jahan', 'latifa@bus.com', 'Cleaner', 'Bus', 1);

-- --------------------------------------------------------

--
-- Table structure for table `emp_attendance`
--

CREATE TABLE `emp_attendance` (
  `attendance_id` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `attendance_date` date NOT NULL,
  `status` enum('Present','Absent','Leave') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `emp_attendance`
--

INSERT INTO `emp_attendance` (`attendance_id`, `emp_id`, `attendance_date`, `status`) VALUES
(146, 16, '2025-01-07', 'Present'),
(147, 17, '2025-01-07', 'Present'),
(148, 18, '2025-01-07', 'Present'),
(149, 19, '2025-01-07', 'Present'),
(150, 20, '2025-01-07', 'Present'),
(151, 33, '2025-01-07', 'Present'),
(152, 34, '2025-01-07', 'Present'),
(153, 35, '2025-01-07', 'Absent'),
(154, 36, '2025-01-07', 'Absent'),
(155, 1, '2025-01-07', 'Leave'),
(156, 2, '2025-01-07', 'Leave'),
(157, 3, '2025-01-07', 'Present'),
(158, 4, '2025-01-07', 'Present'),
(159, 5, '2025-01-07', 'Present'),
(160, 21, '2025-01-07', 'Present'),
(161, 22, '2025-01-07', 'Present'),
(162, 23, '2025-01-07', 'Present'),
(163, 24, '2025-01-07', 'Present'),
(164, 1, '2025-01-07', 'Leave'),
(165, 2, '2025-01-07', 'Leave'),
(166, 3, '2025-01-07', 'Present'),
(167, 4, '2025-01-07', 'Present'),
(168, 5, '2025-01-07', 'Present'),
(169, 21, '2025-01-07', 'Present'),
(170, 22, '2025-01-07', 'Present'),
(171, 23, '2025-01-07', 'Present'),
(172, 24, '2025-01-07', 'Present'),
(173, 21, '2025-02-01', 'Present'),
(174, 22, '2025-02-01', 'Present'),
(175, 23, '2025-02-01', 'Present'),
(176, 24, '2025-02-01', 'Present'),
(177, 41, '2025-02-01', 'Present'),
(178, 42, '2025-02-01', 'Present'),
(179, 43, '2025-02-01', 'Present'),
(180, 44, '2025-02-01', 'Present'),
(181, 45, '2025-02-01', 'Present'),
(182, 46, '2025-02-01', 'Present'),
(183, 47, '2025-02-01', 'Present'),
(184, 48, '2025-02-01', 'Present'),
(185, 49, '2025-02-01', 'Present'),
(186, 50, '2025-02-01', 'Present'),
(187, 51, '2025-02-01', 'Present'),
(188, 52, '2025-02-01', 'Present'),
(189, 21, '2025-02-02', 'Present'),
(190, 22, '2025-02-02', 'Present'),
(191, 23, '2025-02-02', 'Present'),
(192, 24, '2025-02-02', 'Present'),
(193, 41, '2025-02-02', 'Present'),
(194, 42, '2025-02-02', 'Present'),
(195, 43, '2025-02-02', 'Present'),
(196, 44, '2025-02-02', 'Present'),
(197, 45, '2025-02-02', 'Present'),
(198, 46, '2025-02-02', 'Present'),
(199, 47, '2025-02-02', 'Present'),
(200, 48, '2025-02-02', 'Present'),
(201, 49, '2025-02-02', 'Present'),
(202, 50, '2025-02-02', 'Present'),
(203, 51, '2025-02-02', 'Present'),
(204, 52, '2025-02-02', 'Present'),
(205, 21, '2025-01-26', 'Present'),
(206, 22, '2025-01-26', 'Present'),
(207, 23, '2025-01-26', 'Present'),
(208, 24, '2025-01-26', 'Present'),
(209, 41, '2025-01-26', 'Present'),
(210, 42, '2025-01-26', 'Present'),
(211, 43, '2025-01-26', 'Present'),
(212, 44, '2025-01-26', 'Present'),
(213, 45, '2025-01-26', 'Present'),
(214, 46, '2025-01-26', 'Present'),
(215, 47, '2025-01-26', 'Present'),
(216, 48, '2025-01-26', 'Present'),
(217, 49, '2025-01-26', 'Present'),
(218, 50, '2025-01-26', 'Present'),
(219, 51, '2025-01-26', 'Present'),
(220, 52, '2025-01-26', 'Present'),
(221, 21, '2025-01-30', 'Present'),
(222, 22, '2025-01-30', 'Present'),
(223, 23, '2025-01-30', 'Present'),
(224, 24, '2025-01-30', 'Present'),
(225, 41, '2025-01-30', 'Present'),
(226, 42, '2025-01-30', 'Present'),
(227, 43, '2025-01-30', 'Present'),
(228, 44, '2025-01-30', 'Present'),
(229, 45, '2025-01-30', 'Present'),
(230, 46, '2025-01-30', 'Present'),
(231, 47, '2025-01-30', 'Present'),
(232, 48, '2025-01-30', 'Present'),
(233, 49, '2025-01-30', 'Present'),
(234, 50, '2025-01-30', 'Present'),
(235, 51, '2025-01-30', 'Present'),
(236, 52, '2025-01-30', 'Present'),
(237, 21, '2025-01-25', 'Absent'),
(238, 22, '2025-01-25', 'Absent'),
(239, 23, '2025-01-25', 'Absent'),
(240, 24, '2025-01-25', 'Absent'),
(241, 41, '2025-01-25', 'Absent'),
(242, 42, '2025-01-25', 'Absent'),
(243, 43, '2025-01-25', 'Absent'),
(244, 44, '2025-01-25', 'Absent'),
(245, 45, '2025-01-25', 'Absent'),
(246, 46, '2025-01-25', 'Absent'),
(247, 47, '2025-01-25', 'Absent'),
(248, 48, '2025-01-25', 'Absent'),
(249, 49, '2025-01-25', 'Absent'),
(250, 50, '2025-01-25', 'Absent'),
(251, 51, '2025-01-25', 'Present'),
(252, 52, '2025-01-25', 'Present'),
(253, 21, '2025-01-19', 'Present'),
(254, 22, '2025-01-19', 'Present'),
(255, 23, '2025-01-19', 'Present'),
(256, 24, '2025-01-19', 'Present'),
(257, 41, '2025-01-19', 'Present'),
(258, 42, '2025-01-19', 'Present'),
(259, 43, '2025-01-19', 'Present'),
(260, 44, '2025-01-19', 'Present'),
(261, 45, '2025-01-19', 'Present'),
(262, 46, '2025-01-19', 'Present'),
(263, 47, '2025-01-19', 'Present'),
(264, 48, '2025-01-19', 'Present'),
(265, 49, '2025-01-19', 'Present'),
(266, 50, '2025-01-19', 'Present'),
(267, 51, '2025-01-19', 'Present'),
(268, 52, '2025-01-19', 'Present'),
(269, 21, '2025-01-23', 'Present'),
(270, 22, '2025-01-23', 'Present'),
(271, 23, '2025-01-23', 'Present'),
(272, 24, '2025-01-23', 'Present'),
(273, 41, '2025-01-23', 'Present'),
(274, 42, '2025-01-23', 'Present'),
(275, 43, '2025-01-23', 'Present'),
(276, 44, '2025-01-23', 'Present'),
(277, 45, '2025-01-23', 'Present'),
(278, 46, '2025-01-23', 'Present'),
(279, 47, '2025-01-23', 'Present'),
(280, 48, '2025-01-23', 'Present'),
(281, 49, '2025-01-23', 'Present'),
(282, 50, '2025-01-23', 'Present'),
(283, 51, '2025-01-23', 'Present'),
(284, 52, '2025-01-23', 'Present');

-- --------------------------------------------------------

--
-- Table structure for table `emp_salary`
--

CREATE TABLE `emp_salary` (
  `salary_id` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `salary_amount` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `emp_salary`
--

INSERT INTO `emp_salary` (`salary_id`, `emp_id`, `salary_amount`) VALUES
(11, 1, 50000.00),
(12, 2, 25000.00),
(13, 3, 30000.00),
(14, 4, 20000.00),
(15, 5, 15000.00),
(16, 6, 50000.00),
(17, 7, 25000.00),
(18, 8, 30000.00),
(19, 9, 20000.00),
(20, 10, 15000.00),
(21, 11, 50000.00),
(22, 12, 25000.00),
(23, 13, 30000.00),
(24, 14, 20000.00),
(25, 15, 15000.00),
(26, 16, 50000.00),
(27, 17, 25000.00),
(28, 18, 30000.00),
(29, 19, 20000.00),
(30, 20, 15000.00),
(31, 21, 45000.00),
(32, 22, 20000.00),
(33, 23, 18000.00),
(34, 24, 12000.00),
(35, 25, 45000.00),
(36, 26, 20000.00),
(37, 27, 18000.00),
(38, 28, 12000.00),
(39, 29, 45000.00),
(40, 30, 20000.00),
(41, 31, 18000.00),
(42, 32, 12000.00),
(43, 33, 45000.00),
(44, 34, 20000.00),
(45, 35, 18000.00),
(46, 36, 12000.00),
(47, 37, 45000.00),
(48, 38, 20000.00),
(49, 39, 18000.00),
(50, 40, 12000.00),
(51, 41, 20000.00),
(52, 42, 20000.00),
(53, 43, 20000.00),
(54, 44, 20000.00),
(55, 45, 18000.00),
(56, 46, 18000.00),
(57, 47, 18000.00),
(58, 48, 18000.00),
(59, 49, 12000.00),
(60, 50, 12000.00),
(61, 51, 12000.00),
(62, 52, 12000.00);

-- --------------------------------------------------------

--
-- Table structure for table `metro_companies`
--

CREATE TABLE `metro_companies` (
  `company_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `contact_info` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `metro_companies`
--

INSERT INTO `metro_companies` (`company_id`, `name`, `contact_info`, `password`) VALUES
(1, 'Metro Rail Dhaka', 'dhaka@metro.com', 'securepassword1'),
(2, 'Rapid Transit Company', 'rtc@metro.com', 'securepassword2'),
(3, 'Urban Metro Services', 'urban@metro.com', 'securepassword3'),
(4, 'Cityline Rapid Transit', 'cityline@metro.com', 'securepassword4');

-- --------------------------------------------------------

--
-- Table structure for table `metro_income`
--

CREATE TABLE `metro_income` (
  `income_id` int(11) NOT NULL,
  `train_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `income_amount` decimal(10,2) NOT NULL,
  `company_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `metro_income`
--

INSERT INTO `metro_income` (`income_id`, `train_id`, `date`, `income_amount`, `company_id`) VALUES
(16, 9, '2025-01-16', 60.00, 4),
(17, 6, '2025-01-16', 40.00, 3),
(18, 6, '2025-01-17', 40.00, 3),
(19, 9, '2025-01-17', 60.00, 4),
(20, 4, '2025-01-17', 20.00, 2),
(21, 5, '2025-01-17', 40.00, 3),
(22, 9, '2025-01-17', 60.00, 4),
(23, 2, '2025-01-17', 20.00, 1),
(24, 2, '2025-01-17', 20.00, 1),
(25, 7, '2025-01-17', 60.00, 4),
(26, 6, '2025-01-17', 40.00, 3),
(27, 9, '2025-01-17', 60.00, 4),
(28, 5, '2025-01-17', 40.00, 3);

-- --------------------------------------------------------

--
-- Table structure for table `metro_routes`
--

CREATE TABLE `metro_routes` (
  `route_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `company_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `metro_routes`
--

INSERT INTO `metro_routes` (`route_id`, `name`, `company_id`) VALUES
(1, 'Route A', 1),
(2, 'Route B', 2),
(3, 'Route C', 3),
(4, 'Route D', 4);

-- --------------------------------------------------------

--
-- Table structure for table `metro_stops`
--

CREATE TABLE `metro_stops` (
  `stop_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `route_id` int(11) DEFAULT NULL,
  `stop_number` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `metro_stops`
--

INSERT INTO `metro_stops` (`stop_id`, `name`, `route_id`, `stop_number`) VALUES
(1, 'Station 1', 1, 1),
(2, 'Station 2', 1, 2),
(3, 'Station 3', 1, 3),
(4, 'Station 4', 1, 4),
(5, 'Station 5', 2, 1),
(6, 'Station 6', 2, 2),
(7, 'Station 7', 2, 3),
(8, 'Station 8', 2, 4),
(9, 'Station 1', 3, 1),
(10, 'Station 10', 3, 2),
(11, 'Station 4', 3, 3),
(12, 'Station 12', 3, 4),
(13, 'Station 5', 4, 1),
(14, 'Station 14', 4, 2),
(15, 'Station 15', 4, 3),
(16, 'Station 8', 4, 4);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `payment_date` date DEFAULT NULL,
  `bonus` decimal(10,2) DEFAULT 0.00,
  `bonus_added_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`payment_id`, `emp_id`, `payment_date`, `bonus`, `bonus_added_date`) VALUES
(197, 24, '2025-01-19', 1200.00, '2025-01-19'),
(198, 51, NULL, 1200.00, '2025-01-19'),
(199, 52, NULL, 1200.00, '2025-01-19'),
(200, 23, NULL, 1800.00, '2025-01-19'),
(201, 45, NULL, 1800.00, '2025-01-19'),
(202, 46, NULL, 1800.00, '2025-01-19'),
(203, 22, NULL, 2000.00, '2025-01-19'),
(204, 41, NULL, 2000.00, '2025-01-19'),
(205, 42, NULL, 2000.00, '2025-01-19');

-- --------------------------------------------------------

--
-- Table structure for table `routes`
--

CREATE TABLE `routes` (
  `route_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `company_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `routes`
--

INSERT INTO `routes` (`route_id`, `name`, `company_id`) VALUES
(1, 'Route 1', 1),
(2, 'Route 2', 2),
(3, 'Route 3', 3),
(4, 'Route 4', 4),
(5, 'Route 5', 5);

-- --------------------------------------------------------

--
-- Table structure for table `stops`
--

CREATE TABLE `stops` (
  `stop_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `route_id` int(11) DEFAULT NULL,
  `stop_number` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stops`
--

INSERT INTO `stops` (`stop_id`, `name`, `route_id`, `stop_number`) VALUES
(1, 'Mirpur 10', 1, 1),
(2, 'X', 1, 2),
(3, 'Farmgate', 1, 3),
(4, 'Shahbagh', 1, 4),
(5, 'Motijheel', 1, 5),
(6, 'A', 1, 6),
(7, 'B', 1, 7),
(8, 'C', 1, 8),
(9, 'D', 1, 9),
(10, 'Y', 1, 10),
(11, 'E', 1, 11),
(12, 'Uttara', 2, 1),
(13, 'X', 2, 2),
(14, 'Banani', 2, 3),
(15, 'Farmgate', 2, 4),
(16, 'Sadarghat', 2, 5),
(17, 'V', 2, 6),
(18, 'W', 2, 7),
(19, 'XX', 2, 8),
(20, 'Y', 2, 9),
(21, 'Z', 2, 10),
(22, 'Mohammadpur', 3, 1),
(23, 'X', 3, 2),
(24, 'Science Lab', 3, 3),
(25, 'Hatirjheel', 3, 4),
(26, 'Rampura', 3, 5),
(27, '2', 3, 6),
(28, 'Y', 3, 7),
(29, '3', 3, 8),
(30, 'Gulshan 2', 4, 1),
(31, 'X', 4, 2),
(32, 'Moghbazar', 4, 3),
(33, 'Malibagh', 4, 4),
(34, 'Jatrabari', 4, 5),
(35, 'Y', 4, 6),
(36, 'Airport', 5, 1),
(37, 'X', 5, 2),
(38, 'Khilgaon', 5, 3),
(39, 'Banasree', 5, 4),
(40, 'Rampura', 5, 5),
(41, 'Y', 5, 6);

-- --------------------------------------------------------

--
-- Table structure for table `trains`
--

CREATE TABLE `trains` (
  `train_id` int(11) NOT NULL,
  `company_name` varchar(100) NOT NULL,
  `route_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `trains`
--

INSERT INTO `trains` (`train_id`, `company_name`, `route_id`, `company_id`) VALUES
(1, 'Metro Rail Dhaka', 1, 1),
(2, 'Metro Rail Dhaka', 1, 1),
(3, 'Rapid Transit Company', 2, 2),
(4, 'Rapid Transit Company', 2, 2),
(5, 'Urban Metro Services', 3, 3),
(6, 'Urban Metro Services', 3, 3),
(7, 'Cityline Rapid Transit', 4, 4),
(8, 'Cityline Rapid Transit', 4, 4),
(9, 'Cityline Rapid Transit', 4, 4);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` enum('user','admin') DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `email`, `name`, `password`, `role`) VALUES
(3, 'user1@example.com', 'User One', 'password123', 'user'),
(5, 'inzamam11@gmail.com', 'inzamam', '$2y$10$MN8diGzwgcl2k6bnhePJauQDE.z97moVXtQjyDo6bjheraWl.5pci', 'user'),
(6, 'ftjdty@gmail.com', 'admin', '$2y$10$WLPtS7PLA2e2LCZD1RhcW.MSNiHEqMebkACcXv6LADpFQVfF9Q652', 'admin'),
(7, 'rakib.hasan@example.com', 'Rakib Hasan', 'password123', 'user'),
(8, 'tasnim.rahman@example.com', 'Tasnim Rahman', 'password456', 'admin'),
(9, 'mehedi.alam@example.com', 'Mehedi Alam', 'password789', 'user'),
(10, 'farzana.khan@example.com', 'Farzana Khan', 'password101', 'user'),
(11, 'sabbir.hossain@example.com', 'Sabbir Hossain', 'password202', 'admin'),
(12, 'sumaiya.akhtar@example.com', 'Sumaiya Akhtar', 'password303', 'user'),
(13, 'arif.ahmed@example.com', 'Arif Ahmed', 'password404', 'user'),
(14, 'sharmin.nahar@example.com', 'Sharmin Nahar', 'password505', 'user'),
(15, 'nafisa.akter@example.com', 'Nafisa Akter', 'password606', 'admin'),
(16, 'imtiaz.kabir@example.com', 'Imtiaz Kabir', 'password707', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `buses`
--
ALTER TABLE `buses`
  ADD PRIMARY KEY (`bus_id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `route_id` (`route_id`),
  ADD KEY `fk_company_name` (`company_name`);

--
-- Indexes for table `bus_companies`
--
ALTER TABLE `bus_companies`
  ADD PRIMARY KEY (`company_id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `bus_income`
--
ALTER TABLE `bus_income`
  ADD PRIMARY KEY (`income_id`),
  ADD KEY `bus_id` (`bus_id`),
  ADD KEY `company_id` (`company_id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`emp_id`);

--
-- Indexes for table `emp_attendance`
--
ALTER TABLE `emp_attendance`
  ADD PRIMARY KEY (`attendance_id`),
  ADD KEY `emp_id` (`emp_id`);

--
-- Indexes for table `emp_salary`
--
ALTER TABLE `emp_salary`
  ADD PRIMARY KEY (`salary_id`),
  ADD KEY `emp_id` (`emp_id`);

--
-- Indexes for table `metro_companies`
--
ALTER TABLE `metro_companies`
  ADD PRIMARY KEY (`company_id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `metro_income`
--
ALTER TABLE `metro_income`
  ADD PRIMARY KEY (`income_id`),
  ADD KEY `train_id` (`train_id`),
  ADD KEY `company_id` (`company_id`);

--
-- Indexes for table `metro_routes`
--
ALTER TABLE `metro_routes`
  ADD PRIMARY KEY (`route_id`),
  ADD KEY `company_id` (`company_id`);

--
-- Indexes for table `metro_stops`
--
ALTER TABLE `metro_stops`
  ADD PRIMARY KEY (`stop_id`),
  ADD KEY `route_id` (`route_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`),
  ADD UNIQUE KEY `emp_id` (`emp_id`,`payment_date`);

--
-- Indexes for table `routes`
--
ALTER TABLE `routes`
  ADD PRIMARY KEY (`route_id`),
  ADD KEY `company_id` (`company_id`);

--
-- Indexes for table `stops`
--
ALTER TABLE `stops`
  ADD PRIMARY KEY (`stop_id`),
  ADD KEY `route_id` (`route_id`);

--
-- Indexes for table `trains`
--
ALTER TABLE `trains`
  ADD PRIMARY KEY (`train_id`),
  ADD KEY `route_id` (`route_id`),
  ADD KEY `company_id` (`company_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `buses`
--
ALTER TABLE `buses`
  MODIFY `bus_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `bus_companies`
--
ALTER TABLE `bus_companies`
  MODIFY `company_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `bus_income`
--
ALTER TABLE `bus_income`
  MODIFY `income_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `emp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `emp_attendance`
--
ALTER TABLE `emp_attendance`
  MODIFY `attendance_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=285;

--
-- AUTO_INCREMENT for table `emp_salary`
--
ALTER TABLE `emp_salary`
  MODIFY `salary_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `metro_companies`
--
ALTER TABLE `metro_companies`
  MODIFY `company_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `metro_income`
--
ALTER TABLE `metro_income`
  MODIFY `income_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `metro_routes`
--
ALTER TABLE `metro_routes`
  MODIFY `route_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `metro_stops`
--
ALTER TABLE `metro_stops`
  MODIFY `stop_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=206;

--
-- AUTO_INCREMENT for table `routes`
--
ALTER TABLE `routes`
  MODIFY `route_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `stops`
--
ALTER TABLE `stops`
  MODIFY `stop_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `trains`
--
ALTER TABLE `trains`
  MODIFY `train_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `buses`
--
ALTER TABLE `buses`
  ADD CONSTRAINT `buses_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `bus_companies` (`company_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `buses_ibfk_2` FOREIGN KEY (`route_id`) REFERENCES `routes` (`route_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_company_name` FOREIGN KEY (`company_name`) REFERENCES `bus_companies` (`name`) ON DELETE CASCADE;

--
-- Constraints for table `bus_income`
--
ALTER TABLE `bus_income`
  ADD CONSTRAINT `bus_income_ibfk_1` FOREIGN KEY (`bus_id`) REFERENCES `buses` (`bus_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bus_income_ibfk_2` FOREIGN KEY (`company_id`) REFERENCES `bus_companies` (`company_id`) ON DELETE CASCADE;

--
-- Constraints for table `emp_attendance`
--
ALTER TABLE `emp_attendance`
  ADD CONSTRAINT `emp_attendance_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `employees` (`emp_id`) ON DELETE CASCADE;

--
-- Constraints for table `emp_salary`
--
ALTER TABLE `emp_salary`
  ADD CONSTRAINT `emp_salary_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `employees` (`emp_id`) ON DELETE CASCADE;

--
-- Constraints for table `metro_income`
--
ALTER TABLE `metro_income`
  ADD CONSTRAINT `metro_income_ibfk_1` FOREIGN KEY (`train_id`) REFERENCES `trains` (`train_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `metro_income_ibfk_2` FOREIGN KEY (`company_id`) REFERENCES `metro_companies` (`company_id`) ON DELETE CASCADE;

--
-- Constraints for table `metro_routes`
--
ALTER TABLE `metro_routes`
  ADD CONSTRAINT `metro_routes_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `metro_companies` (`company_id`) ON DELETE CASCADE;

--
-- Constraints for table `metro_stops`
--
ALTER TABLE `metro_stops`
  ADD CONSTRAINT `metro_stops_ibfk_1` FOREIGN KEY (`route_id`) REFERENCES `metro_routes` (`route_id`) ON DELETE CASCADE;

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `employees` (`emp_id`) ON DELETE CASCADE;

--
-- Constraints for table `routes`
--
ALTER TABLE `routes`
  ADD CONSTRAINT `routes_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `bus_companies` (`company_id`) ON DELETE CASCADE;

--
-- Constraints for table `stops`
--
ALTER TABLE `stops`
  ADD CONSTRAINT `stops_ibfk_1` FOREIGN KEY (`route_id`) REFERENCES `routes` (`route_id`) ON DELETE CASCADE;

--
-- Constraints for table `trains`
--
ALTER TABLE `trains`
  ADD CONSTRAINT `trains_ibfk_1` FOREIGN KEY (`route_id`) REFERENCES `metro_routes` (`route_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `trains_ibfk_2` FOREIGN KEY (`company_id`) REFERENCES `metro_companies` (`company_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
