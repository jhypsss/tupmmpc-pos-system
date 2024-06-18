-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 07, 2024 at 06:36 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+08:00";


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
  `source` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `details` text NOT NULL,
  `date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `if_deleted` tinyint(1) NOT NULL DEFAULT 0
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
  `date_deleted` datetime NOT NULL DEFAULT current_timestamp(),
  `if_restored` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `barcode` varchar(15) NOT NULL,
  `description` varchar(50) NOT NULL,
  `category_id` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `image` varchar(500) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `date_modified` datetime DEFAULT NULL,
  `views` int(11) NOT NULL DEFAULT 0,
  `if_deleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `refunded_items`
--

CREATE TABLE `refunded_items` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `barcode` varchar(15) NOT NULL,
  `receipt_no` varchar(15) NOT NULL,
  `description` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` varchar(50) NOT NULL,
  `remarks` varchar(255) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `removed_stocks`
--

CREATE TABLE `removed_stocks` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `removed_qty` int(11) NOT NULL,
  `status` varchar(50) NOT NULL,
  `remarks` varchar(50) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `restored_items`
--

CREATE TABLE `restored_items` (
  `id` int(11) NOT NULL,
  `restored_id` int(11) NOT NULL,
  `from_table` varchar(50) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date_restored` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `role_name` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `role_name`) VALUES
(1, 'Admin'),
(4, 'Cashier'),
(3, 'Manager'),
(2, 'Supervisor'),
(5, 'User');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `barcode` varchar(15) DEFAULT NULL,
  `receipt_no` varchar(15) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `qty` int(11) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `date` datetime DEFAULT current_timestamp(),
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_inventory`
--

CREATE TABLE `stock_inventory` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `stock_in` int(11) NOT NULL DEFAULT 0,
  `stock_out` int(11) NOT NULL DEFAULT 0,
  `date_updated` datetime NOT NULL
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
  `userid` varchar(15) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(500) NOT NULL,
  `date` datetime NOT NULL,
  `image` varchar(500) DEFAULT NULL,
  `role` varchar(20) NOT NULL,
  `gender` varchar(15) NOT NULL DEFAULT 'male',
  `deletable` tinyint(1) NOT NULL DEFAULT 1,
  `void_code` varchar(15) DEFAULT NULL,
  `if_deleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `userid`, `username`, `email`, `password`, `date`, `image`, `role`, `gender`, `deletable`, `void_code`, `if_deleted`) VALUES
(1, 'TUPM-24-1001', 'TUPMMPC Admin', 'tup@tup.edu.ph', '$2y$10$lLzstQOHG6gkW1JcgGqBnONy5xGOT2LCBg5n5yWqjSLMAxBTNhGNe', '2024-05-21 19:56:10', 'uploads/user/7c8ae669ad62d6260638510ab5831e33b979489f_4519.png', 'Admin', 'Male', 0, '', 0),
(2, 'TUPM-20-1209', 'Rhayli Silongan', 'rhayli@tup.edu.ph', '$2y$10$IBYL71Us6.fFSZSNsyfqXOAgw6fP8ofoxHWJ/9NlxFIYoSxSUXxAu', '2024-05-21 21:23:21', 'uploads/user/4c2362f9cf42fdf72bc241f71412ce50988ae303_4333.png', 'Supervisor', 'Male', 1, '12345', 0),
(3, 'TUPM-20-2152', 'Samantha Berin', 'samantha@tup.edu.ph', '$2y$10$kkYjptQPIt8GK/mYtFt0V.jfx.gJrGQOB4hYwxFqPmcCeYm/kTDFi', '2024-05-21 21:24:08', 'uploads/user/8e285f23ebabe5c537a545b12fd4d1dec0329ef5_7272.png', 'Cashier', 'Female', 1, '', 0),
(4, 'TUPM-20-1196', 'Lordirene Llyle Prince Sanchez', 'llyle@tup.edu.ph', '$2y$10$NSY6YLjl/KfGE9k6E6VwReomD9uAgeK/Rr.NP2ZvM41noBFrAEyGC', '2024-05-21 21:29:33', 'uploads/users/23ec3a362d74b513e015582df9f5f9a39b2c4940_9732.png', 'Supervisor', 'Male', 1, '', 0),
(5, 'TUPM-20-2151', 'Leynald Kobe Fundario', 'kobe@tup.edu.ph', '$2y$10$f4K.ypylbPAOGy7eHDkiz..9Rd7kpNyMAoyQ0CA8soSmpF1iy5Jui', '2024-05-21 21:31:19', 'uploads/user/443adc1abe449b577d19f4d7fd2a12bd5cd2b674_2857.png', 'Manager', 'Male', 1, '', 0),
(6, 'TUPM-20-2185', 'Jhon Patrick Torres', 'trick@tup.edu.ph', '$2y$10$ciSnJuzRljRuVUxhVCTwxu.nPnwN1O1oq3F2288ryv23dtEHOoRzC', '2024-05-21 21:31:55', 'uploads/user/93926f66b00e835986c093465e0413e9449ee10c_3178.png', 'Admin', 'Male', 0, '', 0),
(7, 'TUPM-24-1002', 'Power', 'power@tup.edu.ph', '$2y$10$72FErCJc70uOehbU.2/Afe8AHl5Ulek/PLuStQR/rvU0r1yzTlaES', '2024-05-21 21:34:50', 'uploads/user/a6dd6720ffcb97b1116785a90ba4977373f9002e_8520.jpg', 'Admin', 'Female', 1, '', 0),
(8, 'TUPM-24-1003', 'Klee Dodoco', 'klee@tup.edu.ph', '$2y$10$lomJSziV4bsMMZ7TvbHnQeypFKDXkHHmPElTiEjIqfbhcvX31mS.G', '2024-05-23 23:28:46', 'uploads/users/28c4b2956d298331d24b54860d7257627a3af901_6217.png', 'Supervisor', 'Female', 1, '', 0),
(9, 'TUPM-20-2003', 'May Garcia', 'maygarcia@tup.edu.ph', '$2y$10$fbaQvsT75HgTLV9LuSSGC.6BZrXS4aqU5ro1TO/Mhq2f/QfUr.O3K', '2024-05-24 15:30:23', NULL, 'Cashier', 'Female', 1, '', 0);

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
  ADD KEY `views` (`views`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `refunded_items`
--
ALTER TABLE `refunded_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `receipt_no` (`receipt_no`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `removed_stocks`
--
ALTER TABLE `removed_stocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_name` (`role_name`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `barcode` (`barcode`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `date` (`date`),
  ADD KEY `description` (`description`),
  ADD KEY `receipt_no` (`receipt_no`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `stock_inventory`
--
ALTER TABLE `stock_inventory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `category_id` (`category_id`);

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
  ADD KEY `role` (`role`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `audit_trail`
--
ALTER TABLE `audit_trail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
-- AUTO_INCREMENT for table `refunded_items`
--
ALTER TABLE `refunded_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `removed_stocks`
--
ALTER TABLE `removed_stocks`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock_inventory`
--
ALTER TABLE `stock_inventory`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `audit_trail`
--
ALTER TABLE `audit_trail`
  ADD CONSTRAINT `audit_trail_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `deleted_items`
--
ALTER TABLE `deleted_items`
  ADD CONSTRAINT `deleted_items_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `refunded_items`
--
ALTER TABLE `refunded_items`
  ADD CONSTRAINT `refunded_items_ibfk_1` FOREIGN KEY (`receipt_no`) REFERENCES `sales` (`receipt_no`),
  ADD CONSTRAINT `refunded_items_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `sales` (`category_id`),
  ADD CONSTRAINT `refunded_items_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `refunded_items_ibfk_4` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `removed_stocks`
--
ALTER TABLE `removed_stocks`
  ADD CONSTRAINT `removed_stocks_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `removed_stocks_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `restored_items`
--
ALTER TABLE `restored_items`
  ADD CONSTRAINT `restored_items_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `restored_items_ibfk_2` FOREIGN KEY (`restored_id`) REFERENCES `deleted_items` (`deleted_id`);

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `products` (`category_id`),
  ADD CONSTRAINT `sales_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `stock_inventory`
--
ALTER TABLE `stock_inventory`
  ADD CONSTRAINT `stock_inventory_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role`) REFERENCES `roles` (`role_name`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
