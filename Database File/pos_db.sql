-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 23, 2024 at 05:26 PM
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
(29, 6, 'Users', 'UPDATE', 'UPDATED USER: kobefundario\nRole: User → Manager', '2024-05-21 21:51:49'),
(30, 4, 'Categories', 'ADD', 'NEW CATEGORY: School Merch \nDescription: Apparel, Accessories, Stationery, Drinkware, Tech Accessories, Miscellaneous Items', '2024-05-22 08:21:41'),
(31, 4, 'Categories', 'ADD', 'NEW CATEGORY: Snacks \nDescription: Salty Snacks, Sweet Snacks, Healthy Snacks, Protein-Rich Snacks, Dairy Snacks, Baked Snacks, Specialty Snacks', '2024-05-22 08:24:25'),
(32, 4, 'Categories', 'ADD', 'NEW CATEGORY: Beverage \nDescription: Water, Sports Drink, Juice, Tea, Coffee, Milk, Smoothie, Energy Drinks, Lemonade', '2024-05-22 08:28:36'),
(33, 4, 'Categories', 'ADD', 'NEW CATEGORY: School Supplies \nDescription: Writing Instruments, Paper Products, Organizational Tools, Technology and Accessories, Art Supplies, Classroom Essentials, Backpack and Bags, Study Aids, Health and Hygiene, Miscellaneous Supplies', '2024-05-22 09:49:00'),
(34, 4, 'Products', 'ADD', 'NEW ITEM: 2223752926390\nProduct: C2  \nQty: 5 \nPrice: 35 \nCategory: Beverage', '2024-05-22 09:51:41'),
(35, 4, 'Products', 'ADD', 'NEW ITEM: 2223744340436\nProduct: Mogu Mogu \nQty: 30 \nPrice: 40 \nCategory: Beverage', '2024-05-22 09:53:44'),
(36, 4, 'Products', 'ADD', 'NEW ITEM: 2223898209592\nProduct: Mountain Dew \nQty: 50 \nPrice: 50 \nCategory: Beverage', '2024-05-22 09:54:06'),
(37, 4, 'Products', 'ADD', 'NEW ITEM: 2223130175859\nProduct: Pocari Sweat \nQty: 100 \nPrice: 30 \nCategory: Beverage', '2024-05-22 09:54:46'),
(38, 4, 'Products', 'ADD', 'NEW ITEM: 2223286700590\nProduct: Red Bull \nQty: 75 \nPrice: 75 \nCategory: Beverage', '2024-05-22 09:55:08'),
(39, 4, 'Products', 'ADD', 'NEW ITEM: 2223330048837\nProduct: Brown Envelope \nQty: 100 \nPrice: 15 \nCategory: School Supplies', '2024-05-22 09:57:55'),
(40, 4, 'Products', 'ADD', 'NEW ITEM: 2223474402290\nProduct: Long Folder \nQty: 100 \nPrice: 16 \nCategory: School Supplies', '2024-05-22 09:58:20'),
(41, 4, 'Products', 'ADD', 'NEW ITEM: 2223989316961\nProduct: Index Card (1 pack) \nQty: 100 \nPrice: 30 \nCategory: School Supplies', '2024-05-22 09:58:51'),
(42, 4, 'Products', 'ADD', 'NEW ITEM: 2223136144858\nProduct: Scientific Calculator \nQty: 50 \nPrice: 250 \nCategory: School Supplies', '2024-05-22 09:59:47'),
(43, 4, 'Products', 'ADD', 'NEW ITEM: 2223562053126\nProduct: Yellow Pad Paper \nQty: 100 \nPrice: 25 \nCategory: School Supplies', '2024-05-22 10:00:13'),
(44, 4, 'Products', 'ADD', 'NEW ITEM: 2223804737259\nProduct: Bread Pan \nQty: 500 \nPrice: 20 \nCategory: Snacks', '2024-05-22 10:00:51'),
(45, 4, 'Products', 'ADD', 'NEW ITEM: 2223362259212\nProduct: Nova \nQty: 5 \nPrice: 17 \nCategory: Snacks', '2024-05-22 10:01:09'),
(46, 4, 'Products', 'ADD', 'NEW ITEM: 2223795298756\nProduct: Oishi Prawn Crackers \nQty: 50 \nPrice: 20 \nCategory: Snacks', '2024-05-22 10:01:30'),
(47, 4, 'Products', 'ADD', 'NEW ITEM: 2223828501872\nProduct: Piattos \nQty: 15 \nPrice: 20 \nCategory: Snacks', '2024-05-22 10:01:57'),
(48, 4, 'Products', 'ADD', 'NEW ITEM: 2223824388896\nProduct: Pillows (Chocolate) \nQty: 28 \nPrice: 15 \nCategory: Snacks', '2024-05-22 10:02:20'),
(49, 4, 'Products', 'ADD', 'NEW ITEM: 2223344887351\nProduct: COS Polo Shirt (Red) \nQty: 20 \nPrice: 300 \nCategory: School Merch', '2024-05-22 10:03:14'),
(50, 4, 'Products', 'ADD', 'NEW ITEM: 2223344114763\nProduct: Gear Track Jacket \nQty: 20 \nPrice: 450 \nCategory: School Merch', '2024-05-22 10:03:54'),
(51, 4, 'Products', 'ADD', 'NEW ITEM: 2223539392362\nProduct: Gear Jersey \nQty: 20 \nPrice: 350 \nCategory: School Merch', '2024-05-22 10:04:25'),
(52, 4, 'Products', 'ADD', 'NEW ITEM: 2223605679101\nProduct: TUP T-Shirt (White) \nQty: 30 \nPrice: 150 \nCategory: School Merch', '2024-05-22 10:05:16'),
(53, 4, 'Products', 'ADD', 'NEW ITEM: 2223446997863\nProduct: TUP T-Shirt (Black) \nQty: 30 \nPrice: 150 \nCategory: School Merch', '2024-05-22 10:05:37'),
(54, 4, 'Products', 'ADD', 'NEW ITEM: 2223679136953\nProduct: P.E Pants \nQty: 100 \nPrice: 200 \nCategory: School Merch', '2024-05-22 10:07:01'),
(55, 4, 'Products', 'DELETE', 'DELETED ITEM: 2223679136953 \nProduct Name: P.E Pants \nQty: 100 \nPrice: 200.00\n Category: School Merch', '2024-05-22 10:07:13'),
(56, 4, 'Suppliers', 'ADD', 'NEW SUPPLIER: National Book Store \nCompany Address: 4th Floor, Quad Alpha Centrum Building, 125 Pioneer Street, Mandaluyong City 1550, Philippines', '2024-05-22 10:10:36'),
(57, 4, 'Suppliers', 'ADD', 'NEW SUPPLIER: Expressions Stationery Shop, Inc. \nCompany Address: Unit 2310, Cityland 10 Tower II, H.V. Dela Costa St., Salcedo Village, Makati City 1227, Philippines', '2024-05-22 10:14:06');

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

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `if_deleted`) VALUES
(1, 'School Merch', 'Apparel, Accessories, Stationery, Drinkware, Tech Accessories, Miscellaneous Items', 0),
(2, 'Snacks', 'Salty Snacks, Sweet Snacks, Healthy Snacks, Protein-Rich Snacks, Dairy Snacks, Baked Snacks, Specialty Snacks', 0),
(3, 'Beverage', 'Water, Sports Drink, Juice, Tea, Coffee, Milk, Smoothie, Energy Drinks, Lemonade', 0),
(4, 'School Supplies', 'Writing Instruments, Paper Products, Organizational Tools, Technology and Accessories, Art Supplies, Classroom Essentials, Backpack and Bags, Study Aids, Health and Hygiene, Miscellaneous Supplies', 0);

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

--
-- Dumping data for table `deleted_items`
--

INSERT INTO `deleted_items` (`id`, `deleted_id`, `from_table`, `user_id`, `date_deleted`) VALUES
(1, 21, 'Products', 4, '2024-05-22 10:07:13');

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

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `barcode`, `description`, `stock`, `amount`, `image`, `user_id`, `date`, `views`, `category_id`, `if_deleted`) VALUES
(1, '2223752926390', 'C2 ', 0, 35.00, 'uploads/products/ee99c0765e47dad751ee1f36a824500b87e93228_1762.png', '4', '2024-05-22 03:51:41', 1, 3, 0),
(2, '2223744340436', 'Mogu Mogu', 25, 40.00, 'uploads/products/5176a899e03349d9b21d3ab3aeccc234d5e11411_7468.png', '4', '2024-05-22 03:53:44', 2, 3, 0),
(3, '2223898209592', 'Mountain Dew', 49, 50.00, 'uploads/products/bdf5b690f4227caa3a3349af4658df4999a75dfe_8378.png', '4', '2024-05-22 03:54:06', 1, 3, 0),
(4, '2223130175859', 'Pocari Sweat', 100, 30.00, 'uploads/products/a1e06012c907a49fab1c46aa8125f54ab0055b73_1657.jpg', '4', '2024-05-22 03:54:46', 0, 3, 0),
(5, '2223286700590', 'Red Bull', 75, 75.00, 'uploads/products/47b4ea9d37abe38f6aafea9aa0c599f6a9510182_1304.png', '4', '2024-05-22 03:55:08', 0, 3, 0),
(6, '2223330048837', 'Brown Envelope', 100, 15.00, 'uploads/products/c0498136027142a1f643d77e198b1834f2c2a06d_4465.jpg', '4', '2024-05-22 03:57:55', 0, 4, 0),
(7, '2223474402290', 'Long Folder', 100, 16.00, 'uploads/products/c3b666f45d0963af9f1eaaeac0959142812e8ea3_8965.jpg', '4', '2024-05-22 03:58:20', 0, 4, 0),
(8, '2223989316961', 'Index Card (1 pack)', 100, 30.00, 'uploads/products/7bbfdc0f0a92ffefa17b8465772ecebac87c1cda_5399.jpg', '4', '2024-05-22 03:58:51', 0, 4, 0),
(9, '2223136144858', 'Scientific Calculator', 50, 250.00, 'uploads/products/b110624b898fdea1e08a4d4e05611f0e0b10f218_6886.jpg', '4', '2024-05-22 03:59:47', 0, 4, 0),
(10, '2223562053126', 'Yellow Pad Paper', 100, 25.00, 'uploads/products/624bb0011f9ff7a38b31dacd4102b8d65f114146_8469.jpg', '4', '2024-05-22 04:00:13', 0, 4, 0),
(11, '2223804737259', 'Bread Pan', 500, 20.00, 'uploads/products/6e417b0bd74b08668c9c8b97067c85353a89e6a4_4122.png', '4', '2024-05-22 04:00:51', 0, 2, 0),
(12, '2223362259212', 'Nova', 5, 17.00, 'uploads/products/3441c55c6bf3a2bb75953cd1667e14c42e84879d_3478.png', '4', '2024-05-22 04:01:09', 0, 2, 0),
(13, '2223795298756', 'Oishi Prawn Crackers', 50, 20.00, 'uploads/products/63bdaee2b95e3eed8c11c22eae23aee66b09f121_6015.png', '4', '2024-05-22 04:01:30', 0, 2, 0),
(14, '2223828501872', 'Piattos', 15, 20.00, 'uploads/products/f8cbf31c273bcd1c3e10dc85a5cd28b089069ae4_7580.png', '4', '2024-05-22 04:01:57', 0, 2, 0),
(15, '2223824388896', 'Pillows (Chocolate)', 28, 15.00, 'uploads/products/5746ef55100159ed2f74f20c94466285655dd8e4_1551.png', '4', '2024-05-22 04:02:20', 0, 2, 0),
(16, '2223344887351', 'COS Polo Shirt (Red)', 20, 300.00, 'uploads/products/95f53ed9c1b07bcb452d709fbf1409ef75e17303_9644.jpg', '4', '2024-05-22 04:03:14', 0, 1, 0),
(17, '2223344114763', 'Gear Track Jacket', 20, 450.00, 'uploads/products/677021edb5091a5ed17c3d3c95ccf7d57b16089c_2263.jpg', '4', '2024-05-22 04:03:54', 0, 1, 0),
(18, '2223539392362', 'Gear Jersey', 20, 350.00, 'uploads/products/62292992bb680000371f7ed44287e6b602c4f6e5_4575.jpg', '4', '2024-05-22 04:04:24', 0, 1, 0),
(19, '2223605679101', 'TUP T-Shirt (White)', 30, 150.00, 'uploads/products/c64fd75924944e3d03c61a67b5f5bc05a6930fed_4590.jpg', '4', '2024-05-22 04:05:16', 0, 1, 0),
(20, '2223446997863', 'TUP T-Shirt (Black)', 30, 150.00, 'uploads/products/4cef0742a325f6a9847506f5e5f8f45841292574_3486.jpg', '4', '2024-05-22 04:05:37', 0, 1, 0),
(21, '2223679136953', 'P.E Pants', 100, 200.00, 'uploads/products/1aca206759ffe7635a6c332c2e1663e8f85b396b_1094.png', '4', '2024-05-22 04:07:01', 0, 1, 1);

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
  `receipt_no` varchar(11) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `qty` int(11) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `date` datetime DEFAULT current_timestamp(),
  `user_id` varchar(60) DEFAULT NULL,
  `payment_method` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `barcode`, `receipt_no`, `description`, `category_id`, `qty`, `amount`, `total`, `date`, `user_id`, `payment_method`) VALUES
(1, '2223752926390', '2185-1', 'C2 ', 3, 5, 35.00, 175.00, '2024-05-23 17:22:46', '6', ' '),
(2, '2223744340436', '2185-1', 'Mogu Mogu', 3, 2, 40.00, 80.00, '2024-05-23 17:22:46', '6', ' '),
(3, '2223744340436', '2185-2', 'Mogu Mogu', 3, 3, 40.00, 120.00, '2024-05-23 17:24:31', '6', ' '),
(4, '2223898209592', '2185-2', 'Mountain Dew', 3, 1, 50.00, 50.00, '2024-05-23 17:24:31', '6', ' ');

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

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `company_name`, `company_address`, `contact_person`, `contact_number`, `contact_email`, `business_type`, `if_deleted`) VALUES
(1, 'National Book Store', '4th Floor, Quad Alpha Centrum Building, 125 Pioneer Street, Mandaluyong City 1550, Philippines', 'Ana Cruz, Sales Manager', '+63 (2) 8888-8627', 'ana.cruz@nationalbookstore.com', 'Distributor', 0),
(2, 'Expressions Stationery Shop, Inc.', 'Unit 2310, Cityland 10 Tower II, H.V. Dela Costa St., Salcedo Village, Makati City 1227, Philippines', 'Maria Rivera, Operations Manager', '+63 (2) 8886-8888', 'maria.rivera@expressions.com.ph', 'Retails', 0);

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
(1, 'TUPM-24-1001', 'TUPMMPC Admin', 'tup@tup.edu.ph', '$2y$10$C2VrsXkhpf2eq.Uq4Rwav.R7NnzlAWe2aiIkx0kU4aOhhDdcZNh4q', '2024-05-21 19:56:10', 'uploads/user/7c8ae669ad62d6260638510ab5831e33b979489f_4519.png', 'Admin', 'Male', 0, '', 0),
(2, 'rhaylisilongan', 'Rhayli Silongan', 'rhayli@tup.edu.ph', '$2y$10$KJgWTJ3w7o4.RfLM1vjzZej0wChKkRhC7nf8Q3lLzwe0SPqbsTa52', '2024-05-21 21:23:21', 'uploads/user/4c2362f9cf42fdf72bc241f71412ce50988ae303_4333.png', 'Supervisor', 'Male', 1, '', 0),
(3, 'TUPM-20-2152', 'Samantha Berin', 'samantha@tup.edu.ph', '$2y$10$ZGUKuUYrUKzr0cSSZlzxruREwiv28Ui/Pb6s2KQOU6avs7PgELWtC', '2024-05-21 21:24:08', 'uploads/user/8e285f23ebabe5c537a545b12fd4d1dec0329ef5_7272.png', 'Cashier', 'Female', 1, '', 0),
(4, 'TUPM-20-1196', 'Lordirene Llyle Prince Sanchez', 'llyle@tup.edu.ph', '$2y$10$DT2d7.cz1ruKDSBf1xnEA.DU0ypH9VBh17WkfvpIlyaZYsvJ5kBQa', '2024-05-21 21:29:33', 'uploads/user/8f25b2c94d032f844f1fdf7d55aa67de67ff144d_1436.png', 'Admin', 'Male', 1, '', 0),
(5, 'TUPM-20-2151', 'Leynald Kobe Fundario', 'kobe@tup.edu.ph', '$2y$10$3gR5H6TAiC.X40R0n/1g0.GLMNs5rzX8MWoYwnJQBCh4KU2aISDw6', '2024-05-21 21:31:19', 'uploads/user/443adc1abe449b577d19f4d7fd2a12bd5cd2b674_2857.png', 'Manager', 'Male', 1, '', 0),
(6, 'TUPM-20-2185', 'Jhon Patrick Torres', 'trick@tup.edu.ph', '$2y$10$0zjnm0hW13/mkEQjlvyyEePjQv51EvD1ECSSkY1ylfkTqenH9JwRC', '2024-05-21 21:31:55', 'uploads/user/93926f66b00e835986c093465e0413e9449ee10c_3178.png', 'Admin', 'Male', 0, '', 0),
(7, 'TUPM-24-1002', 'Power', 'power@tup.edu.ph', '$2y$10$NR3yAvnlk.LiDwikWAGzteMDW0eRPTmx3L2Bvxjnw794N687E8n0e', '2024-05-21 21:34:50', 'uploads/user/a6dd6720ffcb97b1116785a90ba4977373f9002e_8520.jpg', 'Admin', 'Female', 1, '', 0);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `deleted_items`
--
ALTER TABLE `deleted_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
