-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 30, 2024 at 04:17 AM
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
  `source` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
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
(57, 4, 'Suppliers', 'ADD', 'NEW SUPPLIER: Expressions Stationery Shop, Inc. \nCompany Address: Unit 2310, Cityland 10 Tower II, H.V. Dela Costa St., Salcedo Village, Makati City 1227, Philippines', '2024-05-22 10:14:06'),
(58, 5, 'Products', 'DELETE', 'DELETED ITEM: 2223362259212 \nProduct Name: Nova \nQty: 5 \nPrice: 17.00\n Category: Snacks', '2024-05-23 22:43:22'),
(59, 5, 'Categories', 'DELETE', 'DELETED CATEGORY: Snacks', '2024-05-23 22:43:25'),
(60, 5, 'Products', 'RESTORE', 'RESTORED ITEM: 2223362259212 \nProduct Name: Nova \nQty: 5 \nPrice: 17.00\n Category: Snacks', '2024-05-23 22:44:41'),
(61, 5, 'Products', 'DELETE', 'DELETED ITEM: 2223989316961 \nProduct Name: Index Card (1 pack) \nQty: 94 \nPrice: 30.00\n Category: School Supplies', '2024-05-23 22:45:12'),
(62, 5, 'Products', 'RESTORE', 'RESTORED ITEM: 2223989316961 \nProduct Name: Index Card (1 pack) \nQty: 94 \nPrice: 30.00\n Category: School Supplies', '2024-05-23 22:45:28'),
(63, 5, 'Categories', 'RESTORE', 'RESTORED CATEGORY: Snacks', '2024-05-23 22:45:58'),
(64, 5, 'Products', 'DELETE', 'DELETED ITEM: 2223828501872 \nProduct Name: Piattos \nQty: 15 \nPrice: 20.00\n Category: Snacks', '2024-05-23 22:53:48'),
(65, 2, 'Users', 'UPDATE', 'UPDATED USER: TUPM-20-1209\nUsername: rhaylisilongan → TUPM-20-1209', '2024-05-23 23:01:42'),
(66, 2, 'Products', 'RESTORE', 'RESTORED ITEM: 2223679136953 \nProduct Name: P.E Pants \nQty: 100 \nPrice: 200.00\n Category: School Merch', '2024-05-23 23:05:49'),
(67, 2, 'Products', 'RESTORE', 'RESTORED ITEM: 2223828501872 \nProduct Name: Piattos \nQty: 15 \nPrice: 20.00\n Category: Snacks', '2024-05-23 23:05:59'),
(68, 4, 'Users', 'ADD', 'NEW USER: TUPM-24-1003 \nName: Sample \nEmail: sample@tup.edu.ph \nGender: Female \nRole: User', '2024-05-23 23:28:47'),
(69, 4, 'Users', 'UPDATE', 'UPDATED USER: TUPM-24-1003\nUsername: Sample → Klee\nEmail: sample@tup.edu.ph → klee@tup.edu.ph\nRole: User → Manager\nUser Image: User Image Updated', '2024-05-23 23:29:18'),
(70, 6, 'Users', 'ADD', 'NEW USER: TUPM-20-2002 \nName: May Garcia \nEmail: maygarcia@tup.edu.ph \nGender: Female \nRole: User', '2024-05-24 15:30:23'),
(71, 6, 'Users', 'UPDATE', 'UPDATED USER: TUPM-20-2002\nRole: User → Cashier', '2024-05-24 15:32:22'),
(72, 4, 'Products', 'ADD', 'NEW ITEM: 2223367498386\nProduct: Coca Cola Zero \nQty: 50 \nPrice: 45 \nCategory: Beverage', '2024-05-24 16:31:51'),
(73, 4, 'Products', 'UPDATE', 'UPDATED ITEM: 2223367498386\nCurrent Stock: 50 + 20 = 70', '2024-05-24 16:35:16'),
(74, 4, 'Users', 'DELETE', 'DELETED USER: TUPM-24-1002\n Name: Power \nEmail: power@tup.edu.ph \nGender: Female \nRole: Admin', '2024-05-24 16:49:11'),
(75, 4, 'Suppliers', 'DELETE', 'DELETED SUPPLIER: National Book Store', '2024-05-24 16:50:43'),
(76, 4, 'Suppliers', 'RESTORE', 'RESTORED SUPPLIER: National Book Store', '2024-05-24 16:50:49'),
(77, 6, 'Products', 'DELETE', 'DELETED ITEM: 2223752926390 \nProduct Name: C2  \nQty: 0 \nPrice: 35.00\n Category: Beverage', '2024-05-25 17:38:41'),
(78, 6, 'Products', 'UPDATE', 'UPDATED ITEM: 2223731757377\nBarcode: 2223539392362 → 2223731757377', '2024-05-25 17:44:05'),
(79, 6, 'Products', 'UPDATE', 'UPDATED ITEM: 2223913899478\nBarcode: 2223605679101 → 2223913899478', '2024-05-25 17:44:25'),
(80, 6, 'Products', 'UPDATE', 'UPDATED ITEM: 2223139224839\nBarcode: 2223446997863 → 2223139224839', '2024-05-25 17:44:43'),
(81, 6, 'Products', 'UPDATE', 'UPDATED ITEM: 2223432329015\nBarcode: 2223744340436 → 2223432329015', '2024-05-25 17:45:09'),
(82, 6, 'Products', 'UPDATE', 'UPDATED ITEM: 2223913899478\nBarcode: 2223898209592 → 2223913899478', '2024-05-25 17:45:26'),
(83, 6, 'Products', 'UPDATE', 'UPDATED ITEM: 2223442023546\nBarcode: 2223130175859 → 2223442023546', '2024-05-25 17:45:39'),
(84, 6, 'Products', 'RESTORE', 'RESTORED ITEM: 2223752926390 \nProduct Name: C2  \nQty: 0 \nPrice: 35.00\n Category: Beverage', '2024-05-25 17:45:51'),
(85, 6, 'Products', 'UPDATE', 'UPDATED ITEM: 2223752926390', '2024-05-25 17:46:02'),
(86, 6, 'Products', 'UPDATE', 'UPDATED ITEM: 2223752926390\nCurrent Stock: 0 + 50 = 50', '2024-05-25 18:16:14'),
(87, 6, 'Products', 'UPDATE', 'UPDATED ITEM: 2223752926390\nProduct Name: C2  → C2 Apple Green Tea', '2024-05-25 18:17:09'),
(88, 6, 'Products', 'DELETE', 'DELETED ITEM: 2223752926390 \nProduct Name: C2 Apple Green Tea \nQty: 50 \nPrice: 35.00\n Category: Beverage', '2024-05-25 21:15:10'),
(91, 6, 'Sales', 'REFUND', 'REFUNDED ITEM: 2223824388896\nReceipt No: 2151-117\nProduct Name: Pillows (Chocolate)\nProduct Price: 15.00\nRefund Qty: 3\nTotal Amount: 45\nStatus: Damaged\nRemarks: 1 - expired', '2024-05-28 15:38:33'),
(92, 6, 'Sales', 'REFUND', 'REFUNDED ITEM: 2223824388896\nReceipt No: 2151-117\nProduct Name: Pillows (Chocolate)\nProduct Price: 15.00\nRefund Qty: 3\nTotal Amount: 45\nStatus: Damaged\nRemarks: 1 - expired, 2 - with hole', '2024-05-28 15:38:57'),
(93, 6, 'Sales', 'REFUND', 'REFUNDED ITEM: 2223367498386\nReceipt No: 2151-117\nProduct Name: Coca Cola Zero\nProduct Price: 45.00\nRefund Qty: 3\nTotal Amount: 135\nStatus: Damaged\nRemarks: Yupi', '2024-05-28 15:40:30'),
(94, 6, 'Sales', 'REFUND', 'REFUNDED ITEM: 2223804737259\nReceipt No: 2151-118\nProduct Name: Bread Pan\nProduct Price: 20.00\nProduct Sold: 10 | ₱200.00\nRefund Qty: 1\nTotal Amount: 20\nStatus: Damaged\nRemarks: damaged', '2024-05-28 15:44:55'),
(95, 6, 'Sales', 'REFUND', 'REFUNDED ITEM: 2223367498386\nReceipt No: 2151-117\nProduct Name: Coca Cola Zero\nProduct Price: 45.00\nProduct Sold: 12 (₱540.00)\nRefund Qty: 2\nTotal Amount: ₱90\nStatus: Damaged\nRemarks: with dents', '2024-05-28 15:49:57'),
(96, 6, 'Users', 'UPDATE', 'UPDATED USER: TUPM-20-2003\nUsername: TUPM-20-2002 → TUPM-20-2003', '2024-05-28 15:55:03'),
(97, 6, 'Users', 'DELETE', 'DELETED USER: TUPM-20-2003\n Name: May Garcia \nEmail: maygarcia@tup.edu.ph \nGender: Female \nRole: Cashier', '2024-05-28 15:55:16');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
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
(6, 7, 'Users', 4, '2024-05-24 16:49:11'),
(9, 1, 'Products', 6, '2024-05-25 21:15:10'),
(10, 9, 'Users', 6, '2024-05-28 15:55:16');

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
  `date` datetime NOT NULL,
  `views` int(11) NOT NULL DEFAULT 0,
  `if_deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `barcode`, `description`, `category_id`, `stock`, `amount`, `image`, `user_id`, `date`, `views`, `if_deleted`) VALUES
(1, '2223752926390', 'C2 Apple Green Tea', 3, 50, 35.00, 'uploads/products/ee99c0765e47dad751ee1f36a824500b87e93228_1762.png', 4, '2024-05-22 03:51:41', 1, 1),
(2, '2223432329015', 'Mogu Mogu', 3, 0, 40.00, 'uploads/products/5176a899e03349d9b21d3ab3aeccc234d5e11411_7468.png', 4, '2024-05-22 03:53:44', 11, 0),
(3, '2223913899478', 'Mountain Dew', 3, 0, 50.00, 'uploads/products/bdf5b690f4227caa3a3349af4658df4999a75dfe_8378.png', 4, '2024-05-22 03:54:06', 15, 0),
(4, '2223442023546', 'Pocari Sweat', 3, 36, 30.00, 'uploads/products/a1e06012c907a49fab1c46aa8125f54ab0055b73_1657.jpg', 4, '2024-05-22 03:54:46', 42, 0),
(5, '2223286700590', 'Red Bull', 3, 33, 75.00, 'uploads/products/47b4ea9d37abe38f6aafea9aa0c599f6a9510182_1304.png', 4, '2024-05-22 03:55:08', 19, 0),
(6, '2223330048837', 'Brown Envelope', 4, 35, 15.00, 'uploads/products/c0498136027142a1f643d77e198b1834f2c2a06d_4465.jpg', 4, '2024-05-22 03:57:55', 37, 0),
(7, '2223474402290', 'Long Folder', 4, 5, 16.00, 'uploads/products/c3b666f45d0963af9f1eaaeac0959142812e8ea3_8965.jpg', 4, '2024-05-22 03:58:20', 66, 0),
(8, '2223989316961', 'Index Card (1 pack)', 4, 70, 30.00, 'uploads/products/7bbfdc0f0a92ffefa17b8465772ecebac87c1cda_5399.jpg', 4, '2024-05-22 03:58:51', 17, 0),
(9, '2223136144858', 'Scientific Calculator', 4, 42, 250.00, 'uploads/products/b110624b898fdea1e08a4d4e05611f0e0b10f218_6886.jpg', 4, '2024-05-22 03:59:47', 3, 0),
(10, '2223562053126', 'Yellow Pad Paper', 4, 93, 25.00, 'uploads/products/624bb0011f9ff7a38b31dacd4102b8d65f114146_8469.jpg', 4, '2024-05-22 04:00:13', 3, 0),
(11, '2223804737259', 'Bread Pan', 2, 454, 20.00, 'uploads/products/6e417b0bd74b08668c9c8b97067c85353a89e6a4_4122.png', 4, '2024-05-22 04:00:51', 8, 0),
(12, '2223362259212', 'Nova', 2, 0, 17.00, 'uploads/products/3441c55c6bf3a2bb75953cd1667e14c42e84879d_3478.png', 4, '2024-05-22 04:01:09', 2, 0),
(13, '2223795298756', 'Oishi Prawn Crackers', 2, 33, 20.00, 'uploads/products/63bdaee2b95e3eed8c11c22eae23aee66b09f121_6015.png', 4, '2024-05-22 04:01:30', 4, 0),
(14, '2223828501872', 'Piattos', 2, 12, 20.00, 'uploads/products/f8cbf31c273bcd1c3e10dc85a5cd28b089069ae4_7580.png', 4, '2024-05-22 04:01:57', 2, 0),
(15, '2223824388896', 'Pillows (Chocolate)', 2, 9, 15.00, 'uploads/products/5746ef55100159ed2f74f20c94466285655dd8e4_1551.png', 4, '2024-05-22 04:02:20', 7, 0),
(16, '2223344887351', 'COS Polo Shirt (Red)', 1, 20, 300.00, 'uploads/products/95f53ed9c1b07bcb452d709fbf1409ef75e17303_9644.jpg', 4, '2024-05-22 04:03:14', 0, 0),
(17, '2223344114763', 'Gear Track Jacket', 1, 18, 450.00, 'uploads/products/677021edb5091a5ed17c3d3c95ccf7d57b16089c_2263.jpg', 4, '2024-05-22 04:03:54', 2, 0),
(18, '2223731757377', 'Gear Jersey', 1, 17, 350.00, 'uploads/products/62292992bb680000371f7ed44287e6b602c4f6e5_4575.jpg', 4, '2024-05-22 04:04:24', 3, 0),
(19, '2223913899478', 'TUP T-Shirt (White)', 1, 25, 150.00, 'uploads/products/c64fd75924944e3d03c61a67b5f5bc05a6930fed_4590.jpg', 4, '2024-05-22 04:05:16', 4, 0),
(20, '2223139224839', 'TUP T-Shirt (Black)', 1, 26, 150.00, 'uploads/products/4cef0742a325f6a9847506f5e5f8f45841292574_3486.jpg', 4, '2024-05-22 04:05:37', 4, 0),
(21, '2223679136953', 'P.E Pants', 1, 96, 200.00, 'uploads/products/1aca206759ffe7635a6c332c2e1663e8f85b396b_1094.png', 4, '2024-05-22 04:07:01', 2, 0),
(22, '2223367498386', 'Coca Cola Zero', 3, 38, 45.00, 'uploads/products/687e1a398648d588c5090b99c75dc2e0cf9fb25f_4074.jpg', 4, '2024-05-24 16:31:51', 5, 0);

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

--
-- Dumping data for table `refunded_items`
--

INSERT INTO `refunded_items` (`id`, `product_id`, `barcode`, `receipt_no`, `description`, `category_id`, `qty`, `amount`, `total`, `user_id`, `status`, `remarks`, `date`) VALUES
(1, 4, '2223442023546', '2185-115', 'Pocari Sweat', 3, 1, 30.00, 30.00, 6, 'Item error', 'not full water', '2024-05-28 13:28:32'),
(2, 6, '2223330048837', '2185-115', 'Brown Envelope', 4, 1, 15.00, 15.00, 6, 'Damaged', 'Ripped', '2024-05-28 14:44:17'),
(3, 0, '2223679136953', '2151-111', 'P.E Pants', 1, 1, 200.00, 200.00, 6, 'Damaged pants', 'There\'s a hole', '2024-05-28 14:45:43'),
(4, 6, '2223330048837', '2185-116', 'Brown Envelope', 4, 2, 15.00, 30.00, 6, 'Damaged', 'Ripped and wet envelope', '2024-05-28 14:53:16'),
(5, 11, '2223804737259', '2151-117', 'Bread Pan', 2, 3, 20.00, 60.00, 6, 'Expired', 'expired may 22, 2024', '2024-05-28 14:56:57'),
(6, 11, '2223804737259', '2151-118', 'Bread Pan', 2, 2, 20.00, 40.00, 6, 'Expired', 'expired at may 23, 2024', '2024-05-28 15:02:43'),
(7, 22, '2223367498386', '2151-118', 'Coca Cola Zero', 3, 2, 45.00, 90.00, 6, 'Damaged', 'nayupi', '2024-05-28 15:03:04'),
(8, 13, '2223795298756', '2151-118', 'Oishi Prawn Crackers', 2, 2, 20.00, 40.00, 6, 'Damaged', 'butas', '2024-05-28 15:29:17'),
(9, 15, '2223824388896', '2151-117', 'Pillows (Chocolate)', 2, 2, 15.00, 30.00, 6, 'damaged', 'with hole', '2024-05-28 15:33:42'),
(10, 15, '2223824388896', '2151-117', 'Pillows (Chocolate)', 2, 3, 15.00, 45.00, 6, 'Damaged', '1 - expired', '2024-05-28 15:38:33'),
(11, 15, '2223824388896', '2151-117', 'Pillows (Chocolate)', 2, 3, 15.00, 45.00, 6, 'Damaged', '1 - expired, 2 - with hole', '2024-05-28 15:38:57'),
(12, 22, '2223367498386', '2151-117', 'Coca Cola Zero', 3, 3, 45.00, 135.00, 6, 'Damaged', 'Yupi', '2024-05-28 15:40:30'),
(13, 11, '2223804737259', '2151-118', 'Bread Pan', 2, 1, 20.00, 20.00, 6, 'Damaged', 'damaged', '2024-05-28 15:44:55'),
(14, 22, '2223367498386', '2151-117', 'Coca Cola Zero', 3, 2, 45.00, 90.00, 6, 'Damaged', 'with dents', '2024-05-28 15:49:57');

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

--
-- Dumping data for table `restored_items`
--

INSERT INTO `restored_items` (`id`, `restored_id`, `from_table`, `user_id`, `date_restored`) VALUES
(1, 12, 'Products', 5, '2024-05-23 22:44:41'),
(2, 8, 'Products', 5, '2024-05-23 22:45:28'),
(3, 2, 'Categories', 5, '2024-05-23 22:45:58'),
(4, 21, 'Products', 2, '2024-05-23 23:05:49'),
(5, 14, 'Products', 2, '2024-05-23 23:05:59'),
(6, 1, 'Suppliers', 4, '2024-05-24 16:50:49'),
(7, 1, 'Products', 6, '2024-05-25 17:45:51');

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

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `product_id`, `barcode`, `receipt_no`, `description`, `category_id`, `qty`, `amount`, `total`, `date`, `user_id`) VALUES
(1, 0, '2223752926390', '2185-1', 'C2 ', 3, 5, 35.00, 175.00, '2024-05-23 17:22:46', 6),
(2, 0, '2223744340436', '2185-1', 'Mogu Mogu', 3, 2, 40.00, 80.00, '2024-05-23 17:22:46', 6),
(3, 0, '2223744340436', '2185-2', 'Mogu Mogu', 3, 3, 40.00, 120.00, '2024-05-23 17:24:31', 6),
(4, 0, '2223898209592', '2185-2', 'Mountain Dew', 3, 1, 50.00, 50.00, '2024-05-23 17:24:31', 6),
(5, 0, '2223130175859', '2185-3', 'Pocari Sweat', 3, 1, 30.00, 30.00, '2024-05-23 22:09:04', 6),
(6, 0, '2223898209592', '2185-3', 'Mountain Dew', 3, 2, 50.00, 100.00, '2024-05-23 22:09:04', 6),
(7, 0, '2223474402290', '2185-3', 'Long Folder', 4, 2, 16.00, 32.00, '2024-05-23 22:09:04', 6),
(8, 0, '2223898209592', '2185-4', 'Mountain Dew', 3, 1, 50.00, 50.00, '2024-05-23 22:09:11', 6),
(9, 0, '2223286700590', '2185-4', 'Red Bull', 3, 1, 75.00, 75.00, '2024-05-23 22:09:11', 6),
(10, 0, '2223330048837', '2185-4', 'Brown Envelope', 4, 1, 15.00, 15.00, '2024-05-23 22:09:11', 6),
(11, 0, '2223989316961', '2185-4', 'Index Card (1 pack)', 4, 1, 30.00, 30.00, '2024-05-23 22:09:11', 6),
(12, 0, '2223898209592', '2151-5', 'Mountain Dew', 3, 6, 50.00, 300.00, '2024-05-23 22:11:05', 5),
(13, 0, '2223898209592', '2151-6', 'Mountain Dew', 3, 2, 50.00, 100.00, '2024-05-23 22:12:28', 5),
(14, 0, '2223744340436', '2151-6', 'Mogu Mogu', 3, 2, 40.00, 80.00, '2024-05-23 22:12:28', 5),
(15, 0, '2223130175859', '2151-6', 'Pocari Sweat', 3, 1, 30.00, 30.00, '2024-05-23 22:12:28', 5),
(16, 0, '2223330048837', '2152-7', 'Brown Envelope', 4, 4, 15.00, 60.00, '2024-05-23 22:12:29', 3),
(17, 0, '2223474402290', '2152-7', 'Long Folder', 4, 1, 16.00, 16.00, '2024-05-23 22:12:29', 3),
(18, 0, '2223286700590', '2152-7', 'Red Bull', 3, 1, 75.00, 75.00, '2024-05-23 22:12:29', 3),
(19, 0, '2223744340436', '2151-8', 'Mogu Mogu', 3, 3, 40.00, 120.00, '2024-05-23 22:16:03', 5),
(20, 0, '2223474402290', '2151-8', 'Long Folder', 4, 1, 16.00, 16.00, '2024-05-23 22:16:03', 5),
(21, 0, '2223898209592', '2185-9', 'Mountain Dew', 3, 2, 50.00, 100.00, '2024-05-23 22:16:03', 6),
(22, 0, '2223744340436', '2185-10', 'Mogu Mogu', 3, 3, 40.00, 120.00, '2024-05-23 22:19:45', 6),
(23, 0, '2223744340436', '2185-11', 'Mogu Mogu', 3, 2, 40.00, 80.00, '2024-05-23 22:20:03', 6),
(24, 0, '2223898209592', '2185-11', 'Mountain Dew', 3, 1, 50.00, 50.00, '2024-05-23 22:20:03', 6),
(25, 0, '2223898209592', '2185-12', 'Mountain Dew', 3, 3, 50.00, 150.00, '2024-05-23 22:21:38', 6),
(26, 0, '2223898209592', '2185-13', 'Mountain Dew', 3, 2, 50.00, 100.00, '2024-05-23 22:21:48', 6),
(27, 0, '2223898209592', '2185-14', 'Mountain Dew', 3, 3, 50.00, 150.00, '2024-05-23 22:22:28', 6),
(28, 0, '2223130175859', '2151-15', 'Pocari Sweat', 3, 2, 30.00, 60.00, '2024-05-23 22:24:26', 5),
(29, 0, '2223474402290', '2151-15', 'Long Folder', 4, 2, 16.00, 32.00, '2024-05-23 22:24:26', 5),
(30, 0, '2223744340436', '2185-15', 'Mogu Mogu', 3, 3, 40.00, 120.00, '2024-05-23 22:24:26', 6),
(31, 0, '2223898209592', '2185-15', 'Mountain Dew', 3, 2, 50.00, 100.00, '2024-05-23 22:24:26', 6),
(32, 0, '2223804737259', '2185-15', 'Bread Pan', 2, 3, 20.00, 60.00, '2024-05-23 22:24:26', 6),
(33, 0, '2223330048837', '2151-16', 'Brown Envelope', 4, 3, 15.00, 45.00, '2024-05-23 22:25:57', 5),
(34, 0, '2223989316961', '2151-16', 'Index Card (1 pack)', 4, 5, 30.00, 150.00, '2024-05-23 22:25:57', 5),
(35, 0, '2223130175859', '2151-16', 'Pocari Sweat', 3, 3, 30.00, 90.00, '2024-05-23 22:25:57', 5),
(36, 0, '2223824388896', '2185-17', 'Pillows (Chocolate)', 2, 3, 15.00, 45.00, '2024-05-23 22:25:57', 6),
(37, 0, '2223474402290', '2151-16', 'Long Folder', 0, 2, 16.00, 32.00, '2024-05-23 22:25:57', 5),
(38, 0, '2223344114763', '2185-17', 'Gear Track Jacket', 1, 1, 450.00, 450.00, '2024-05-23 22:25:57', 6),
(39, 0, '2223539392362', '2185-17', 'Gear Jersey', 1, 1, 350.00, 350.00, '2024-05-23 22:25:57', 6),
(40, 0, '2223446997863', '2185-17', 'TUP T-Shirt (Black)', 1, 1, 150.00, 150.00, '2024-05-23 22:25:57', 6),
(41, 0, '2223898209592', '2151-18', 'Mountain Dew', 3, 5, 50.00, 250.00, '2024-05-23 22:27:15', 5),
(42, 0, '2223286700590', '2151-18', 'Red Bull', 3, 3, 75.00, 225.00, '2024-05-23 22:27:15', 5),
(43, 0, '2223824388896', '2151-18', 'Pillows (Chocolate)', 2, 1, 15.00, 15.00, '2024-05-23 22:27:15', 5),
(44, 0, '2223744340436', '2185-19', 'Mogu Mogu', 3, 3, 40.00, 120.00, '2024-05-23 22:27:16', 6),
(45, 0, '2223130175859', '2185-19', 'Pocari Sweat', 3, 1, 30.00, 30.00, '2024-05-23 22:27:16', 6),
(46, 0, '2223474402290', '2185-19', 'Long Folder', 4, 1, 16.00, 16.00, '2024-05-23 22:27:16', 6),
(47, 0, '2223286700590', '2185-19', 'Red Bull', 3, 1, 75.00, 75.00, '2024-05-23 22:27:16', 6),
(48, 0, '2223898209592', '2151-20', 'Mountain Dew', 3, 5, 50.00, 250.00, '2024-05-23 22:31:10', 5),
(49, 0, '2223744340436', '1209-21', 'Mogu Mogu', 3, 3, 40.00, 120.00, '2024-05-23 23:02:19', 2),
(50, 0, '2223330048837', '2185-22', 'Brown Envelope', 4, 1, 15.00, 15.00, '2024-05-23 23:46:06', 6),
(51, 0, '2223898209592', '2185-23', 'Mountain Dew', 3, 5, 50.00, 250.00, '2024-05-23 23:47:06', 6),
(52, 0, '2223898209592', '2185-24', 'Mountain Dew', 3, 10, 50.00, 500.00, '2024-05-23 23:48:04', 6),
(53, 0, '2223744340436', '2185-25', 'Mogu Mogu', 3, 5, 40.00, 200.00, '2024-05-24 00:37:39', 6),
(54, 0, '2223744340436', '2185-26', 'Mogu Mogu', 3, 1, 40.00, 40.00, '2024-05-24 00:39:02', 6),
(55, 0, '2223362259212', '2185-27', 'Nova', 2, 4, 17.00, 68.00, '2024-05-24 00:40:05', 6),
(56, 0, '2223474402290', '2185-28', 'Long Folder', 4, 3, 16.00, 48.00, '2024-05-24 00:52:02', 6),
(57, 0, '2223989316961', '2151-29', 'Index Card (1 pack)', 4, 2, 30.00, 60.00, '2024-05-24 01:38:02', 5),
(58, 0, '2223330048837', '2151-29', 'Brown Envelope', 4, 2, 15.00, 30.00, '2024-05-24 01:38:02', 5),
(59, 0, '2223130175859', '2151-29', 'Pocari Sweat', 3, 1, 30.00, 30.00, '2024-05-24 01:38:02', 5),
(60, 0, '2223474402290', '2151-29', 'Long Folder', 4, 1, 16.00, 16.00, '2024-05-24 01:38:02', 5),
(61, 0, '2223474402290', '2151-30', 'Long Folder', 4, 1, 16.00, 16.00, '2024-05-24 01:38:30', 5),
(62, 0, '2223130175859', '2151-30', 'Pocari Sweat', 3, 1, 30.00, 30.00, '2024-05-24 01:38:30', 5),
(63, 0, '2223474402290', '2151-31', 'Long Folder', 4, 2, 16.00, 32.00, '2024-05-24 01:39:10', 5),
(64, 0, '2223130175859', '2151-31', 'Pocari Sweat', 3, 1, 30.00, 30.00, '2024-05-24 01:39:10', 5),
(65, 0, '2223989316961', '2151-31', 'Index Card (1 pack)', 4, 1, 30.00, 30.00, '2024-05-24 01:39:10', 5),
(66, 0, '2223130175859', '2185-32', 'Pocari Sweat', 3, 3, 30.00, 90.00, '2024-05-24 01:40:40', 6),
(67, 0, '2223474402290', '2185-32', 'Long Folder', 4, 2, 16.00, 32.00, '2024-05-24 01:40:40', 6),
(68, 0, '2223330048837', '2185-32', 'Brown Envelope', 4, 1, 15.00, 15.00, '2024-05-24 01:40:40', 6),
(69, 0, '2223286700590', '2185-32', 'Red Bull', 3, 2, 75.00, 150.00, '2024-05-24 01:40:40', 6),
(70, 0, '2223474402290', '2151-33', 'Long Folder', 4, 3, 16.00, 48.00, '2024-05-24 01:41:06', 5),
(71, 0, '2223989316961', '2151-33', 'Index Card (1 pack)', 4, 2, 30.00, 60.00, '2024-05-24 01:41:06', 5),
(72, 0, '2223286700590', '2151-33', 'Red Bull', 3, 1, 75.00, 75.00, '2024-05-24 01:41:06', 5),
(73, 0, '2223474402290', '2185-34', 'Long Folder', 4, 2, 16.00, 32.00, '2024-05-24 01:41:06', 6),
(74, 0, '2223286700590', '2185-34', 'Red Bull', 3, 1, 75.00, 75.00, '2024-05-24 01:41:06', 6),
(75, 0, '2223474402290', '2151-35', 'Long Folder', 4, 3, 16.00, 48.00, '2024-05-24 01:42:03', 5),
(76, 0, '2223330048837', '2151-35', 'Brown Envelope', 4, 1, 15.00, 15.00, '2024-05-24 01:42:03', 5),
(77, 0, '2223989316961', '2151-35', 'Index Card (1 pack)', 4, 1, 30.00, 30.00, '2024-05-24 01:42:03', 5),
(78, 0, '2223130175859', '2151-35', 'Pocari Sweat', 3, 1, 30.00, 30.00, '2024-05-24 01:42:03', 5),
(79, 0, '2223474402290', '2185-36', 'Long Folder', 4, 1, 16.00, 16.00, '2024-05-24 01:42:03', 6),
(80, 0, '2223130175859', '2185-36', 'Pocari Sweat', 3, 2, 30.00, 60.00, '2024-05-24 01:42:03', 6),
(81, 0, '2223286700590', '2185-36', 'Red Bull', 3, 1, 75.00, 75.00, '2024-05-24 01:42:03', 6),
(82, 0, '2223330048837', '2185-36', 'Brown Envelope', 4, 1, 15.00, 15.00, '2024-05-24 01:42:03', 6),
(83, 0, '2223474402290', '2151-37', 'Long Folder', 4, 1, 16.00, 16.00, '2024-05-24 01:42:29', 5),
(84, 0, '2223130175859', '2151-38', 'Pocari Sweat', 3, 1, 30.00, 30.00, '2024-05-24 01:42:37', 5),
(85, 0, '2223130175859', '2151-39', 'Pocari Sweat', 3, 2, 30.00, 60.00, '2024-05-24 01:45:28', 5),
(86, 0, '2223989316961', '2151-39', 'Index Card (1 pack)', 4, 1, 30.00, 30.00, '2024-05-24 01:45:28', 5),
(87, 0, '2223130175859', '2151-40', 'Pocari Sweat', 3, 2, 30.00, 60.00, '2024-05-24 01:45:37', 5),
(88, 0, '2223989316961', '2151-40', 'Index Card (1 pack)', 4, 1, 30.00, 30.00, '2024-05-24 01:45:37', 5),
(89, 0, '2223130175859', '2151-41', 'Pocari Sweat', 3, 1, 30.00, 30.00, '2024-05-24 01:45:51', 5),
(90, 0, '2223989316961', '2151-41', 'Index Card (1 pack)', 4, 1, 30.00, 30.00, '2024-05-24 01:45:51', 5),
(91, 0, '2223824388896', '2151-41', 'Pillows (Chocolate)', 2, 1, 15.00, 15.00, '2024-05-24 01:45:51', 5),
(92, 0, '2223130175859', '2151-42', 'Pocari Sweat', 3, 2, 30.00, 60.00, '2024-05-24 01:47:17', 5),
(93, 0, '2223330048837', '2151-42', 'Brown Envelope', 4, 1, 15.00, 15.00, '2024-05-24 01:47:17', 5),
(94, 0, '2223824388896', '2151-42', 'Pillows (Chocolate)', 2, 1, 15.00, 15.00, '2024-05-24 01:47:17', 5),
(95, 0, '2223474402290', '2151-43', 'Long Folder', 4, 1, 16.00, 16.00, '2024-05-24 01:51:04', 5),
(96, 0, '2223474402290', '2151-44', 'Long Folder', 4, 1, 16.00, 16.00, '2024-05-24 01:51:30', 5),
(97, 0, '2223130175859', '2151-44', 'Pocari Sweat', 3, 1, 30.00, 30.00, '2024-05-24 01:51:30', 5),
(98, 0, '2223130175859', '2151-45', 'Pocari Sweat', 3, 4, 30.00, 120.00, '2024-05-24 13:01:28', 5),
(99, 0, '2223824388896', '2151-45', 'Pillows (Chocolate)', 2, 2, 15.00, 30.00, '2024-05-24 13:01:28', 5),
(100, 0, '2223474402290', '2151-46', 'Long Folder', 4, 3, 16.00, 48.00, '2024-05-24 13:04:02', 5),
(101, 0, '2223474402290', '2151-47', 'Long Folder', 4, 2, 16.00, 32.00, '2024-05-24 13:05:03', 5),
(102, 0, '2223286700590', '2151-47', 'Red Bull', 3, 1, 75.00, 75.00, '2024-05-24 13:05:03', 5),
(103, 0, '2223804737259', '2151-47', 'Bread Pan', 2, 1, 20.00, 20.00, '2024-05-24 13:05:03', 5),
(104, 0, '2223474402290', '2002-48', 'Long Folder', 4, 2, 16.00, 32.00, '2024-05-24 16:15:00', 9),
(105, 0, '2223330048837', '2002-48', 'Brown Envelope', 4, 2, 15.00, 30.00, '2024-05-24 16:15:00', 9),
(106, 0, '2223989316961', '2002-48', 'Index Card (1 pack)', 4, 1, 30.00, 30.00, '2024-05-24 16:15:00', 9),
(107, 0, '2223474402290', '2002-49', 'Long Folder', 4, 3, 16.00, 48.00, '2024-05-24 16:24:54', 9),
(108, 0, '2223286700590', '2002-49', 'Red Bull', 3, 1, 75.00, 75.00, '2024-05-24 16:24:54', 9),
(109, 0, '2223824388896', '2002-49', 'Pillows (Chocolate)', 2, 1, 15.00, 15.00, '2024-05-24 16:24:54', 9),
(110, 0, '2223442023546', '2185-50', 'Pocari Sweat', 3, 2, 30.00, 60.00, '2024-05-25 18:30:18', 6),
(111, 0, '2223474402290', '2185-50', 'Long Folder', 4, 2, 16.00, 32.00, '2024-05-25 18:30:18', 6),
(112, 0, '2223442023546', '2185-51', 'Pocari Sweat', 3, 1, 30.00, 30.00, '2024-05-25 18:34:06', 6),
(113, 0, '2223474402290', '2185-51', 'Long Folder', 4, 1, 16.00, 16.00, '2024-05-25 18:34:06', 6),
(114, 0, '2223330048837', '2185-51', 'Brown Envelope', 4, 1, 15.00, 15.00, '2024-05-25 18:34:06', 6),
(115, 0, '2223474402290', '2185-52', 'Long Folder', 4, 1, 16.00, 16.00, '2024-05-25 18:35:22', 6),
(116, 0, '2223286700590', '2185-52', 'Red Bull', 3, 1, 75.00, 75.00, '2024-05-25 18:35:22', 6),
(117, 0, '2223442023546', '2185-52', 'Pocari Sweat', 3, 1, 30.00, 30.00, '2024-05-25 18:35:22', 6),
(118, 0, '2223474402290', '2185-53', 'Long Folder', 4, 1, 16.00, 16.00, '2024-05-25 18:35:31', 6),
(119, 0, '2223286700590', '2185-53', 'Red Bull', 3, 1, 75.00, 75.00, '2024-05-25 18:35:31', 6),
(120, 0, '2223442023546', '2185-53', 'Pocari Sweat', 3, 1, 30.00, 30.00, '2024-05-25 18:35:31', 6),
(121, 0, '2223474402290', '2185-54', 'Long Folder', 4, 1, 16.00, 16.00, '2024-05-25 18:36:46', 6),
(122, 0, '2223442023546', '2185-54', 'Pocari Sweat', 3, 1, 30.00, 30.00, '2024-05-25 18:36:46', 6),
(123, 0, '2223330048837', '2185-54', 'Brown Envelope', 4, 1, 15.00, 15.00, '2024-05-25 18:36:46', 6),
(124, 0, '2223442023546', '2185-55', 'Pocari Sweat', 3, 4, 30.00, 120.00, '2024-05-25 18:37:21', 6),
(125, 0, '2223286700590', '2185-55', 'Red Bull', 3, 5, 75.00, 375.00, '2024-05-25 18:37:21', 6),
(126, 0, '2223330048837', '2185-55', 'Brown Envelope', 4, 11, 15.00, 165.00, '2024-05-25 18:37:21', 6),
(127, 0, '2223989316961', '2185-55', 'Index Card (1 pack)', 4, 4, 30.00, 120.00, '2024-05-25 18:37:21', 6),
(128, 0, '2223474402290', '2185-56', 'Long Folder', 4, 2, 16.00, 32.00, '2024-05-25 20:10:38', 6),
(129, 0, '2223330048837', '2185-56', 'Brown Envelope', 4, 1, 15.00, 15.00, '2024-05-25 20:10:38', 6),
(130, 0, '2223474402290', '2185-57', 'Long Folder', 4, 1, 16.00, 16.00, '2024-05-25 20:10:53', 6),
(131, 0, '2223286700590', '2185-57', 'Red Bull', 3, 1, 75.00, 75.00, '2024-05-25 20:10:53', 6),
(132, 0, '2223989316961', '2185-57', 'Index Card (1 pack)', 4, 1, 30.00, 30.00, '2024-05-25 20:10:53', 6),
(133, 0, '2223474402290', '2185-58', 'Long Folder', 4, 1, 16.00, 16.00, '2024-05-25 20:11:03', 6),
(134, 0, '2223330048837', '2185-58', 'Brown Envelope', 4, 1, 15.00, 15.00, '2024-05-25 20:11:03', 6),
(135, 0, '2223474402290', '2185-59', 'Long Folder', 4, 1, 16.00, 16.00, '2024-05-25 21:59:13', 6),
(136, 0, '2223442023546', '2185-59', 'Pocari Sweat', 3, 1, 30.00, 30.00, '2024-05-25 21:59:13', 6),
(137, 0, '2223474402290', '2185-60', 'Long Folder', 4, 1, 16.00, 16.00, '2024-05-25 21:59:25', 6),
(138, 0, '2223286700590', '2185-60', 'Red Bull', 3, 1, 75.00, 75.00, '2024-05-25 21:59:25', 6),
(139, 0, '2223474402290', '2185-61', 'Long Folder', 4, 1, 16.00, 16.00, '2024-05-25 21:59:32', 6),
(140, 0, '2223474402290', '2185-62', 'Long Folder', 4, 1, 16.00, 16.00, '2024-05-25 22:02:52', 6),
(141, 0, '2223330048837', '2185-62', 'Brown Envelope', 4, 1, 15.00, 15.00, '2024-05-25 22:02:52', 6),
(142, 0, '2223442023546', '2185-62', 'Pocari Sweat', 3, 1, 30.00, 30.00, '2024-05-25 22:02:52', 6),
(143, 0, '2223442023546', '2151-63', 'Pocari Sweat', 3, 1, 30.00, 30.00, '2024-05-25 22:05:09', 5),
(144, 0, '2223474402290', '2151-63', 'Long Folder', 4, 1, 16.00, 16.00, '2024-05-25 22:05:09', 5),
(145, 0, '2223330048837', '2151-63', 'Brown Envelope', 4, 1, 15.00, 15.00, '2024-05-25 22:05:09', 5),
(146, 0, '2223442023546', '2151-64', 'Pocari Sweat', 3, 1, 30.00, 30.00, '2024-05-25 22:09:12', 5),
(147, 0, '2223474402290', '2151-64', 'Long Folder', 4, 1, 16.00, 16.00, '2024-05-25 22:09:12', 5),
(148, 0, '2223442023546', '2151-65', 'Pocari Sweat', 3, 2, 30.00, 60.00, '2024-05-25 22:10:25', 5),
(149, 0, '2223474402290', '2151-66', 'Long Folder', 4, 1, 16.00, 16.00, '2024-05-25 22:12:07', 5),
(150, 0, '2223442023546', '2151-66', 'Pocari Sweat', 3, 1, 30.00, 30.00, '2024-05-25 22:12:07', 5),
(151, 0, '2223474402290', '2151-67', 'Long Folder', 4, 2, 16.00, 32.00, '2024-05-25 22:14:17', 5),
(152, 0, '2223474402290', '2151-68', 'Long Folder', 4, 2, 16.00, 32.00, '2024-05-25 22:16:01', 5),
(153, 0, '2223474402290', '2151-69', 'Long Folder', 4, 1, 16.00, 16.00, '2024-05-25 22:31:56', 5),
(154, 0, '2223330048837', '2151-69', 'Brown Envelope', 4, 1, 15.00, 15.00, '2024-05-25 22:31:56', 5),
(155, 0, '2223474402290', '2151-70', 'Long Folder', 4, 1, 16.00, 16.00, '2024-05-25 22:32:23', 5),
(156, 0, '2223330048837', '2151-70', 'Brown Envelope', 4, 1, 15.00, 15.00, '2024-05-25 22:32:23', 5),
(157, 0, '2223474402290', '2151-71', 'Long Folder', 4, 1, 16.00, 16.00, '2024-05-25 22:33:43', 5),
(158, 0, '2223474402290', '2151-72', 'Long Folder', 4, 1, 16.00, 16.00, '2024-05-25 22:34:24', 5),
(159, 0, '2223474402290', '2151-73', 'Long Folder', 4, 1, 16.00, 16.00, '2024-05-25 22:41:02', 5),
(160, 0, '2223330048837', '2151-73', 'Brown Envelope', 4, 1, 15.00, 15.00, '2024-05-25 22:41:02', 5),
(161, 0, '2223442023546', '2151-74', 'Pocari Sweat', 3, 1, 30.00, 30.00, '2024-05-25 22:43:27', 5),
(162, 0, '2223474402290', '2151-74', 'Long Folder', 4, 1, 16.00, 16.00, '2024-05-25 22:43:27', 5),
(163, 0, '2223474402290', '2151-75', 'Long Folder', 4, 2, 16.00, 32.00, '2024-05-25 22:44:42', 5),
(164, 0, '2223474402290', '2151-76', 'Long Folder', 4, 1, 16.00, 16.00, '2024-05-25 22:48:30', 5),
(165, 0, '2223330048837', '2151-76', 'Brown Envelope', 4, 1, 15.00, 15.00, '2024-05-25 22:48:30', 5),
(166, 0, '2223474402290', '2151-77', 'Long Folder', 4, 1, 16.00, 16.00, '2024-05-25 22:49:11', 5),
(167, 0, '2223442023546', '2151-77', 'Pocari Sweat', 3, 1, 30.00, 30.00, '2024-05-25 22:49:11', 5),
(168, 0, '2223330048837', '2151-77', 'Brown Envelope', 4, 1, 15.00, 15.00, '2024-05-25 22:49:11', 5),
(169, 0, '2223474402290', '2151-78', 'Long Folder', 4, 1, 16.00, 16.00, '2024-05-25 22:52:51', 5),
(170, 0, '2223330048837', '2151-78', 'Brown Envelope', 4, 1, 15.00, 15.00, '2024-05-25 22:52:51', 5),
(171, 0, '2223442023546', '2151-79', 'Pocari Sweat', 3, 1, 30.00, 30.00, '2024-05-25 23:00:38', 5),
(172, 0, '2223442023546', '2151-80', 'Pocari Sweat', 3, 2, 30.00, 60.00, '2024-05-25 23:02:59', 5),
(173, 0, '2223474402290', '2151-81', 'Long Folder', 4, 1, 16.00, 16.00, '2024-05-25 23:08:16', 5),
(174, 0, '2223474402290', '2151-82', 'Long Folder', 4, 1, 16.00, 16.00, '2024-05-25 23:13:44', 5),
(175, 0, '2223442023546', '2151-82', 'Pocari Sweat', 3, 1, 30.00, 30.00, '2024-05-25 23:13:44', 5),
(176, 0, '2223474402290', '2151-83', 'Long Folder', 4, 1, 16.00, 16.00, '2024-05-25 23:15:13', 5),
(177, 0, '2223474402290', '2151-84', 'Long Folder', 4, 1, 16.00, 16.00, '2024-05-25 23:15:34', 5),
(178, 0, '2223330048837', '2151-85', 'Brown Envelope', 4, 1, 15.00, 15.00, '2024-05-25 23:16:02', 5),
(179, 0, '2223474402290', '2151-86', 'Long Folder', 4, 1, 16.00, 16.00, '2024-05-25 23:21:36', 5),
(180, 0, '2223330048837', '2151-86', 'Brown Envelope', 4, 1, 15.00, 15.00, '2024-05-25 23:21:36', 5),
(181, 0, '2223474402290', '2151-87', 'Long Folder', 4, 2, 16.00, 32.00, '2024-05-25 23:22:09', 5),
(182, 0, '2223330048837', '2151-87', 'Brown Envelope', 4, 1, 15.00, 15.00, '2024-05-25 23:22:09', 5),
(183, 0, '2223474402290', '2151-88', 'Long Folder', 4, 1, 16.00, 16.00, '2024-05-25 23:23:32', 5),
(184, 0, '2223330048837', '2151-88', 'Brown Envelope', 4, 1, 15.00, 15.00, '2024-05-25 23:23:32', 5),
(185, 0, '2223286700590', '2151-89', 'Red Bull', 3, 3, 75.00, 225.00, '2024-05-25 23:25:20', 5),
(186, 0, '2223804737259', '2151-90', 'Bread Pan', 2, 1, 20.00, 20.00, '2024-05-25 23:25:59', 5),
(187, 0, '2223474402290', '2151-91', 'Long Folder', 4, 1, 16.00, 16.00, '2024-05-25 23:34:44', 5),
(188, 0, '2223330048837', '2151-91', 'Brown Envelope', 4, 1, 15.00, 15.00, '2024-05-25 23:34:44', 5),
(189, 0, '2223474402290', '2151-92', 'Long Folder', 4, 1, 16.00, 16.00, '2024-05-25 23:36:47', 5),
(190, 0, '2223330048837', '2151-92', 'Brown Envelope', 4, 1, 15.00, 15.00, '2024-05-25 23:36:47', 5),
(191, 0, '2223474402290', '2151-93', 'Long Folder', 4, 2, 16.00, 32.00, '2024-05-25 23:37:29', 5),
(192, 0, '2223330048837', '2151-93', 'Brown Envelope', 4, 1, 15.00, 15.00, '2024-05-25 23:37:29', 5),
(193, 0, '2223474402290', '2151-94', 'Long Folder', 4, 2, 16.00, 32.00, '2024-05-25 23:38:07', 5),
(194, 0, '2223330048837', '2151-94', 'Brown Envelope', 4, 1, 15.00, 15.00, '2024-05-25 23:38:07', 5),
(195, 0, '2223989316961', '2151-95', 'Index Card (1 pack)', 4, 3, 30.00, 90.00, '2024-05-25 23:39:28', 5),
(196, 0, '2223330048837', '2151-96', 'Brown Envelope', 4, 1, 15.00, 15.00, '2024-05-25 23:41:30', 5),
(197, 0, '2223442023546', '2151-96', 'Pocari Sweat', 3, 1, 30.00, 30.00, '2024-05-25 23:41:30', 5),
(198, 0, '2223989316961', '2151-96', 'Index Card (1 pack)', 4, 1, 30.00, 30.00, '2024-05-25 23:41:30', 5),
(199, 0, '2223442023546', '2151-97', 'Pocari Sweat', 3, 1, 30.00, 30.00, '2024-05-25 23:41:42', 5),
(200, 0, '2223330048837', '2151-97', 'Brown Envelope', 4, 1, 15.00, 15.00, '2024-05-25 23:41:42', 5),
(201, 0, '2223286700590', '2151-97', 'Red Bull', 3, 1, 75.00, 75.00, '2024-05-25 23:41:42', 5),
(202, 0, '2223286700590', '2151-98', 'Red Bull', 3, 15, 75.00, 1125.00, '2024-05-26 00:02:04', 5),
(203, 0, '2223474402290', '2151-98', 'Long Folder', 4, 3, 16.00, 48.00, '2024-05-26 00:02:04', 5),
(204, 0, '2223136144858', '2151-98', 'Scientific Calculator', 4, 4, 250.00, 1000.00, '2024-05-26 00:02:04', 5),
(205, 0, '2223804737259', '2151-98', 'Bread Pan', 2, 5, 20.00, 100.00, '2024-05-26 00:02:04', 5),
(206, 0, '2223362259212', '2151-98', 'Nova', 2, 1, 17.00, 17.00, '2024-05-26 00:02:04', 5),
(207, 0, '2223474402290', '2151-99', 'Long Folder', 4, 1, 16.00, 16.00, '2024-05-26 00:05:51', 5),
(208, 0, '2223442023546', '2151-99', 'Pocari Sweat', 3, 2, 30.00, 60.00, '2024-05-26 00:05:51', 5),
(209, 0, '2223474402290', '2151-100', 'Long Folder', 4, 1, 16.00, 16.00, '2024-05-26 00:06:34', 5),
(210, 0, '2223989316961', '2151-100', 'Index Card (1 pack)', 4, 1, 30.00, 30.00, '2024-05-26 00:06:34', 5),
(211, 0, '2223989316961', '2151-101', 'Index Card (1 pack)', 4, 2, 30.00, 60.00, '2024-05-26 00:07:22', 5),
(212, 0, '2223136144858', '2151-101', 'Scientific Calculator', 4, 1, 250.00, 250.00, '2024-05-26 00:07:22', 5),
(213, 0, '2223136144858', '2151-102', 'Scientific Calculator', 4, 3, 250.00, 750.00, '2024-05-26 00:08:10', 5),
(214, 0, '2223804737259', '2151-102', 'Bread Pan', 2, 4, 20.00, 80.00, '2024-05-26 00:08:10', 5),
(215, 0, '2223474402290', '2151-103', 'Long Folder', 4, 2, 16.00, 32.00, '2024-05-26 00:08:40', 5),
(216, 0, '2223442023546', '2151-103', 'Pocari Sweat', 3, 1, 30.00, 30.00, '2024-05-26 00:08:40', 5),
(217, 0, '2223731757377', '2151-103', 'Gear Jersey', 1, 1, 350.00, 350.00, '2024-05-26 00:08:40', 5),
(218, 0, '2223139224839', '2151-103', 'TUP T-Shirt (Black)', 1, 1, 150.00, 150.00, '2024-05-26 00:08:40', 5),
(219, 0, '2223562053126', '2151-103', 'Yellow Pad Paper', 4, 1, 25.00, 25.00, '2024-05-26 00:08:40', 5),
(220, 0, '2223139224839', '2151-104', 'TUP T-Shirt (Black)', 1, 1, 150.00, 150.00, '2024-05-26 00:11:36', 5),
(221, 0, '2223562053126', '2151-104', 'Yellow Pad Paper', 4, 3, 25.00, 75.00, '2024-05-26 00:11:36', 5),
(222, 0, '2223731757377', '2151-105', 'Gear Jersey', 1, 1, 350.00, 350.00, '2024-05-26 00:13:06', 5),
(223, 0, '2223344114763', '2151-105', 'Gear Track Jacket', 1, 1, 450.00, 450.00, '2024-05-26 00:13:06', 5),
(224, 0, '2223989316961', '2151-106', 'Index Card (1 pack)', 4, 2, 30.00, 60.00, '2024-05-26 00:13:45', 5),
(225, 0, '2223804737259', '2151-107', 'Bread Pan', 2, 5, 20.00, 100.00, '2024-05-26 00:14:52', 5),
(226, 0, '2223562053126', '2151-108', 'Yellow Pad Paper', 4, 3, 25.00, 75.00, '2024-05-26 00:15:58', 5),
(227, 0, '2223913899478', '2151-108', 'TUP T-Shirt (White)', 1, 1, 150.00, 150.00, '2024-05-26 00:15:58', 5),
(228, 0, '2223679136953', '2151-108', 'P.E Pants', 1, 2, 200.00, 400.00, '2024-05-26 00:15:58', 5),
(229, 0, '2223367498386', '2151-108', 'Coca Cola Zero', 3, 1, 45.00, 45.00, '2024-05-26 00:15:58', 5),
(230, 0, '2223828501872', '2151-109', 'Piattos', 2, 2, 20.00, 40.00, '2024-05-26 00:17:05', 5),
(231, 0, '2223795298756', '2151-109', 'Oishi Prawn Crackers', 2, 1, 20.00, 20.00, '2024-05-26 00:17:05', 5),
(232, 0, '2223367498386', '2151-109', 'Coca Cola Zero', 3, 2, 45.00, 90.00, '2024-05-26 00:17:05', 5),
(233, 0, '2223828501872', '2151-110', 'Piattos', 2, 1, 20.00, 20.00, '2024-05-26 00:17:56', 5),
(234, 0, '2223795298756', '2151-110', 'Oishi Prawn Crackers', 2, 2, 20.00, 40.00, '2024-05-26 00:17:56', 5),
(235, 0, '2223913899478', '2151-110', 'TUP T-Shirt (White)', 1, 1, 150.00, 150.00, '2024-05-26 00:17:56', 5),
(236, 0, '2223913899478', '2151-111', 'TUP T-Shirt (White)', 1, 2, 150.00, 300.00, '2024-05-26 00:21:54', 5),
(237, 0, '2223679136953', '2151-111', 'P.E Pants', 1, 1, 200.00, 200.00, '2024-05-26 00:21:54', 5),
(238, 0, '2223139224839', '2151-112', 'TUP T-Shirt (Black)', 1, 1, 150.00, 150.00, '2024-05-26 00:22:11', 5),
(239, 0, '2223913899478', '2151-112', 'TUP T-Shirt (White)', 1, 1, 150.00, 150.00, '2024-05-26 00:22:11', 5),
(240, 0, '2223367498386', '2151-112', 'Coca Cola Zero', 3, 2, 45.00, 90.00, '2024-05-26 00:22:11', 5),
(241, 0, '2223795298756', '2151-112', 'Oishi Prawn Crackers', 2, 2, 20.00, 40.00, '2024-05-26 00:22:11', 5),
(242, 0, '2223474402290', '2185-113', 'Long Folder', 4, 1, 16.00, 16.00, '2024-05-28 08:25:33', 6),
(243, 7, '2223474402290', '2185-114', 'Long Folder', 4, 1, 16.00, 16.00, '2024-05-28 09:55:02', 6),
(244, 4, '2223442023546', '2185-114', 'Pocari Sweat', 3, 1, 30.00, 30.00, '2024-05-28 09:55:02', 6),
(245, 6, '2223330048837', '2185-114', 'Brown Envelope', 4, 1, 15.00, 15.00, '2024-05-28 09:55:02', 6),
(246, 5, '2223286700590', '2185-114', 'Red Bull', 3, 1, 75.00, 75.00, '2024-05-28 09:55:02', 6),
(247, 4, '2223442023546', '2185-115', 'Pocari Sweat', 3, 3, 30.00, 90.00, '2024-05-28 10:14:10', 6),
(248, 6, '2223330048837', '2185-115', 'Brown Envelope', 4, 2, 15.00, 30.00, '2024-05-28 10:14:10', 6),
(249, 6, '2223330048837', '2185-116', 'Brown Envelope', 4, 8, 15.00, 120.00, '2024-05-28 14:52:17', 6),
(250, 11, '2223804737259', '2151-117', 'Bread Pan', 2, 12, 20.00, 240.00, '2024-05-28 14:55:38', 5),
(251, 22, '2223367498386', '2151-117', 'Coca Cola Zero', 3, 10, 45.00, 450.00, '2024-05-28 14:55:38', 5),
(252, 15, '2223824388896', '2151-117', 'Pillows (Chocolate)', 2, 2, 15.00, 30.00, '2024-05-28 14:55:38', 5),
(253, 11, '2223804737259', '2151-118', 'Bread Pan', 2, 9, 20.00, 180.00, '2024-05-28 15:01:50', 5),
(254, 22, '2223367498386', '2151-118', 'Coca Cola Zero', 3, 10, 45.00, 450.00, '2024-05-28 15:01:50', 5),
(255, 13, '2223795298756', '2151-118', 'Oishi Prawn Crackers', 2, 10, 20.00, 200.00, '2024-05-28 15:01:50', 5),
(256, 6, '2223330048837', '1001-119', 'Brown Envelope', 4, 1, 15.00, 15.00, '2024-05-30 04:16:48', 1),
(257, 4, '2223442023546', '1001-119', 'Pocari Sweat', 3, 1, 30.00, 30.00, '2024-05-30 04:16:48', 1);

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
  `userid` varchar(15) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `date` datetime NOT NULL,
  `image` varchar(500) DEFAULT NULL,
  `role` varchar(20) NOT NULL,
  `gender` varchar(15) NOT NULL DEFAULT 'male',
  `deletable` tinyint(1) NOT NULL DEFAULT 1,
  `void_code` varchar(15) DEFAULT NULL,
  `if_deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `userid`, `username`, `email`, `password`, `date`, `image`, `role`, `gender`, `deletable`, `void_code`, `if_deleted`) VALUES
(1, 'TUPM-24-1001', 'TUPMMPC Admin', 'tup@tup.edu.ph', '$2y$10$C2VrsXkhpf2eq.Uq4Rwav.R7NnzlAWe2aiIkx0kU4aO', '2024-05-21 19:56:10', 'uploads/user/7c8ae669ad62d6260638510ab5831e33b979489f_4519.png', 'Admin', 'Male', 0, '', 0),
(2, 'TUPM-20-1209', 'Rhayli Silongan', 'rhayli@tup.edu.ph', '$2y$10$KJgWTJ3w7o4.RfLM1vjzZej0wChKkRhC7nf8Q3lLzwe', '2024-05-21 21:23:21', 'uploads/user/4c2362f9cf42fdf72bc241f71412ce50988ae303_4333.png', 'Supervisor', 'Male', 1, '12345', 0),
(3, 'TUPM-20-2152', 'Samantha Berin', 'samantha@tup.edu.ph', '$2y$10$ZGUKuUYrUKzr0cSSZlzxruREwiv28Ui/Pb6s2KQOU6a', '2024-05-21 21:24:08', 'uploads/user/8e285f23ebabe5c537a545b12fd4d1dec0329ef5_7272.png', 'Cashier', 'Female', 1, '', 0),
(4, 'TUPM-20-1196', 'Lordirene Llyle Prince Sanchez', 'llyle@tup.edu.ph', '$2y$10$DT2d7.cz1ruKDSBf1xnEA.DU0ypH9VBh17WkfvpIlya', '2024-05-21 21:29:33', 'uploads/user/8f25b2c94d032f844f1fdf7d55aa67de67ff144d_1436.png', 'Admin', 'Male', 1, '', 0),
(5, 'TUPM-20-2151', 'Leynald Kobe Fundario', 'kobe@tup.edu.ph', '$2y$10$3gR5H6TAiC.X40R0n/1g0.GLMNs5rzX8MWoYwnJQBCh', '2024-05-21 21:31:19', 'uploads/user/443adc1abe449b577d19f4d7fd2a12bd5cd2b674_2857.png', 'Manager', 'Male', 1, '', 0),
(6, 'TUPM-20-2185', 'Jhon Patrick Torres', 'trick@tup.edu.ph', '$2y$10$0zjnm0hW13/mkEQjlvyyEePjQv51EvD1ECSSkY1ylfk', '2024-05-21 21:31:55', 'uploads/user/93926f66b00e835986c093465e0413e9449ee10c_3178.png', 'Admin', 'Male', 0, '', 0),
(7, 'TUPM-24-1002', 'Power', 'power@tup.edu.ph', '$2y$10$NR3yAvnlk.LiDwikWAGzteMDW0eRPTmx3L2Bvxjnw79', '2024-05-21 21:34:50', 'uploads/user/a6dd6720ffcb97b1116785a90ba4977373f9002e_8520.jpg', 'Admin', 'Female', 1, '', 1),
(8, 'TUPM-24-1003', 'Klee', 'klee@tup.edu.ph', '$2y$10$UQY2nR.QWbrju7vF2qHlR.KvIfu0En4nF9Xe3c4OgDD', '2024-05-23 23:28:46', 'uploads/users/28c4b2956d298331d24b54860d7257627a3af901_6217.png', 'Manager', 'Female', 1, '', 0),
(9, 'TUPM-20-2003', 'May Garcia', 'maygarcia@tup.edu.ph', '$2y$10$plXX/lBOppEa4.yYePDwXea4FH6D4zqjcrfvJyail55', '2024-05-24 15:30:23', NULL, 'Cashier', 'Female', 1, '', 1);

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
-- Indexes for table `refunded_items`
--
ALTER TABLE `refunded_items`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `deleted_items`
--
ALTER TABLE `deleted_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `refunded_items`
--
ALTER TABLE `refunded_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `restored_items`
--
ALTER TABLE `restored_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=258;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
