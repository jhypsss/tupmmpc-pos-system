-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 21, 2024 at 10:13 PM
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
-- Database: `pos_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `audit_trail`
--

CREATE TABLE `audit_trail` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `source` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `details` text NOT NULL,
  `date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `audit_trail`
--

INSERT INTO `audit_trail` (`id`, `user_id`, `source`, `action`, `details`, `date`) VALUES
(1, 1, 'Users', 'UPDATE', 'UPDATED USER: TUPMMPC Admin\nUsername: TUPMMPC admin → TUPMMPC Admin\nUser Image: User Image Updated', '2024-05-21 20:03:10'),
(2, 1, 'Users', 'UPDATE', 'UPDATED USER: TUPMMPC Admin', '2024-05-21 20:30:21'),
(3, 1, 'Users', 'UPDATE', 'UPDATED USER: tupmmpcadmin', '2024-05-21 20:35:49'),
(4, 1, 'Users', 'UPDATE', 'UPDATED USER: tupmanila\nUsername: tupmmpcadmin → tupmanila', '2024-05-21 20:36:06'),
(5, 1, 'Users', 'UPDATE', 'UPDATED USER: tupmanila', '2024-05-21 20:37:37'),
(6, 1, 'Users', 'UPDATE', 'UPDATED USER: tupmanila', '2024-05-21 20:49:23'),
(7, 1, 'Users', 'UPDATE', 'UPDATED USER: tupmanila', '2024-05-21 20:51:12'),
(8, 1, 'Users', 'UPDATE', 'UPDATED USER: tupmanila', '2024-05-21 20:52:37'),
(9, 1, 'Users', 'UPDATE', 'UPDATED USER: tupmanila', '2024-05-21 20:55:52'),
(10, 1, 'Users', 'ADD', 'NEW USER: rhaylisilongan \nName: Rhayli Silongan \nEmail: rhayli@tup.edu.ph \nGender: Male \nRole: User', '2024-05-21 21:23:21'),
(11, 1, 'Users', 'ADD', 'NEW USER: samberin \nName: Samantha Berin \nEmail: samantha@tup.edu.ph \nGender: unset \nRole: User', '2024-05-21 21:24:08'),
(12, 1, 'Users', 'UPDATE', 'UPDATED USER: samberin\nGender: unset → Female', '2024-05-21 21:24:39'),
(13, 1, 'Users', 'ADD', 'NEW USER: lyllesanchez \nName: Lordirene Llyle Prince Sanchez \nEmail: llyle@tup.edu.ph \nGender: unset \nRole: User', '2024-05-21 21:29:33'),
(14, 1, 'Users', 'UPDATE', 'UPDATED USER: lyllesanchez\nGender: unset → Male', '2024-05-21 21:30:12'),
(15, 1, 'Users', 'UPDATE', 'UPDATED USER: llylesanchez\nUsername: lyllesanchez → llylesanchez', '2024-05-21 21:30:53'),
(16, 1, 'Users', 'ADD', 'NEW USER: kobefundario \nName: Leynald Kobe Fundario \nEmail: kobe@tup.edu.ph \nGender: Male \nRole: User', '2024-05-21 21:31:19'),
(17, 1, 'Users', 'ADD', 'NEW USER: tricktorres \nName: Jhon Patrick Torres \nEmail: trick@tup.edu.ph \nGender: Male \nRole: User', '2024-05-21 21:31:55'),
(18, 1, 'Users', 'ADD', 'NEW USER: power \nName: Power \nEmail: power@tup.edu.ph \nGender: Female \nRole: User', '2024-05-21 21:34:50'),
(19, 1, 'Users', 'UPDATE', 'UPDATED USER: power\nRole: User → Supervisor\nUser Image: User Image Updated', '2024-05-21 21:35:58'),
(20, 1, 'Users', 'UPDATE', 'UPDATED USER: power\nRole: Supervisor → Admin', '2024-05-21 21:36:37'),
(21, 1, 'Users', 'UPDATE', 'UPDATED USER: tricktorres\nRole: User → Admin\nUser Image: User Image Updated', '2024-05-21 21:49:17'),
(22, 1, 'Users', 'UPDATE', 'UPDATED USER: kobefundario\nUser Image: User Image Updated', '2024-05-21 21:49:40'),
(23, 6, 'Users', 'UPDATE', 'UPDATED USER: llylesanchez\nUser Image: User Image Updated', '2024-05-21 21:50:33'),
(24, 6, 'Users', 'UPDATE', 'UPDATED USER: llylesanchez\nRole: User → Supervisor', '2024-05-21 21:50:43'),
(25, 6, 'Users', 'UPDATE', 'UPDATED USER: llylesanchez\nRole: Supervisor → Admin', '2024-05-21 21:50:47'),
(26, 6, 'Users', 'UPDATE', 'UPDATED USER: samberin\nRole: User → Cashier', '2024-05-21 21:50:56'),
(27, 6, 'Users', 'UPDATE', 'UPDATED USER: samberin\nUser Image: User Image Updated', '2024-05-21 21:51:05'),
(28, 6, 'Users', 'UPDATE', 'UPDATED USER: rhaylisilongan\nRole: User → Supervisor\nUser Image: User Image Updated', '2024-05-21 21:51:39'),
(29, 6, 'Users', 'UPDATE', 'UPDATED USER: kobefundario\nRole: User → Manager', '2024-05-21 21:51:49');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `if_deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deleted_items`
--

CREATE TABLE `deleted_items` (
  `id` int(11) NOT NULL,
  `deleted_id` int(11) NOT NULL,
  `from_table` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date_deleted` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `barcode` varchar(15) NOT NULL,
  `description` varchar(50) NOT NULL,
  `stock` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `image` varchar(500) NOT NULL,
  `user_id` varchar(60) NOT NULL,
  `date` datetime NOT NULL,
  `views` int(11) NOT NULL DEFAULT 0,
  `category_id` int(11) NOT NULL,
  `if_deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `restored_items`
--

CREATE TABLE `restored_items` (
  `id` int(11) NOT NULL,
  `restored_id` int(11) NOT NULL,
  `from_table` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date_restored` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `role_name` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `role_name`) VALUES
(1, 'Admin'),
(2, 'Supervisor'),
(3, 'Manager'),
(4, 'Cashier'),
(5, 'User');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(11) NOT NULL,
  `barcode` varchar(15) DEFAULT NULL,
  `receipt_no` int(11) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `qty` int(11) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `date` datetime DEFAULT current_timestamp(),
  `user_id` varchar(60) DEFAULT NULL,
  `payment_method` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` int(11) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `company_address` varchar(255) NOT NULL,
  `contact_person` varchar(255) NOT NULL,
  `contact_number` varchar(255) NOT NULL,
  `contact_email` varchar(255) NOT NULL,
  `business_type` varchar(255) NOT NULL,
  `if_deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `userid` varchar(255) NOT NULL,
  `username` varchar(30) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `image` varchar(500) DEFAULT NULL,
  `role` varchar(20) NOT NULL,
  `gender` varchar(6) NOT NULL DEFAULT 'male',
  `deletable` tinyint(1) NOT NULL DEFAULT 1,
  `void_code` varchar(255) DEFAULT NULL,
  `if_deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `userid`, `username`, `email`, `password`, `date`, `image`, `role`, `gender`, `deletable`, `void_code`, `if_deleted`) VALUES
(1, 'tupmanila', 'TUPMMPC Admin', 'tup@tup.edu.ph', '$2y$10$C2VrsXkhpf2eq.Uq4Rwav.R7NnzlAWe2aiIkx0kU4aOhhDdcZNh4q', '2024-05-21 19:56:10', 'uploads/user/7c8ae669ad62d6260638510ab5831e33b979489f_4519.png', 'Admin', 'Male', 0, '', 0),
(2, 'rhaylisilongan', 'Rhayli Silongan', 'rhayli@tup.edu.ph', '$2y$10$KJgWTJ3w7o4.RfLM1vjzZej0wChKkRhC7nf8Q3lLzwe0SPqbsTa52', '2024-05-21 21:23:21', 'uploads/user/4c2362f9cf42fdf72bc241f71412ce50988ae303_4333.png', 'Supervisor', 'Male', 1, '', 0),
(3, 'samberin', 'Samantha Berin', 'samantha@tup.edu.ph', '$2y$10$ZGUKuUYrUKzr0cSSZlzxruREwiv28Ui/Pb6s2KQOU6avs7PgELWtC', '2024-05-21 21:24:08', 'uploads/user/8e285f23ebabe5c537a545b12fd4d1dec0329ef5_7272.png', 'Cashier', 'Female', 1, '', 0),
(4, 'llylesanchez', 'Lordirene Llyle Prince Sanchez', 'llyle@tup.edu.ph', '$2y$10$DT2d7.cz1ruKDSBf1xnEA.DU0ypH9VBh17WkfvpIlyaZYsvJ5kBQa', '2024-05-21 21:29:33', 'uploads/user/8f25b2c94d032f844f1fdf7d55aa67de67ff144d_1436.png', 'Admin', 'Male', 1, '', 0),
(5, 'kobefundario', 'Leynald Kobe Fundario', 'kobe@tup.edu.ph', '$2y$10$3gR5H6TAiC.X40R0n/1g0.GLMNs5rzX8MWoYwnJQBCh4KU2aISDw6', '2024-05-21 21:31:19', 'uploads/user/443adc1abe449b577d19f4d7fd2a12bd5cd2b674_2857.png', 'Manager', 'Male', 1, '', 0),
(6, 'tricktorres', 'Jhon Patrick Torres', 'trick@tup.edu.ph', '$2y$10$0zjnm0hW13/mkEQjlvyyEePjQv51EvD1ECSSkY1ylfkTqenH9JwRC', '2024-05-21 21:31:55', 'uploads/user/93926f66b00e835986c093465e0413e9449ee10c_3178.png', 'Admin', 'Male', 0, '', 0),
(7, 'power', 'Power', 'power@tup.edu.ph', '$2y$10$NR3yAvnlk.LiDwikWAGzteMDW0eRPTmx3L2Bvxjnw794N687E8n0e', '2024-05-21 21:34:50', 'uploads/user/a6dd6720ffcb97b1116785a90ba4977373f9002e_8520.jpg', 'Admin', 'Female', 1, '', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `audit_trail`
--
ALTER TABLE `audit_trail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deleted_items`
--
ALTER TABLE `deleted_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deleted_id` (`deleted_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `barcode` (`barcode`),
  ADD KEY `description` (`description`),
  ADD KEY `qty` (`stock`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `date` (`date`),
  ADD KEY `views` (`views`);

--
-- Indexes for table `restored_items`
--
ALTER TABLE `restored_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `restored_id` (`restored_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `barcode` (`barcode`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `date` (`date`),
  ADD KEY `description` (`description`),
  ADD KEY `receipt_no` (`receipt_no`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `userid` (`userid`),
  ADD UNIQUE KEY `email_2` (`email`),
  ADD KEY `email` (`email`),
  ADD KEY `date` (`date`),
  ADD KEY `role` (`role`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `audit_trail`
--
ALTER TABLE `audit_trail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deleted_items`
--
ALTER TABLE `deleted_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `restored_items`
--
ALTER TABLE `restored_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
