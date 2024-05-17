-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 16, 2024 at 12:35 AM
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
(26, 6, 'Products', 'ADD', 'Product: Mousepad (Keqing)\nQty: 10\nPrice: Unknown Price\nCategory: School Supplies', '2024-05-11 18:05:34'),
(27, 6, 'Products', 'ADD', 'Product: Mousepad (Raiden Ei)\nQty: 8\nPrice: Unknown Price\nCategory: School Supplies', '2024-05-11 18:06:13'),
(28, 6, 'Products', 'ADD', 'Product: Sticker\nQty: 45\nPrice: Unknown Price \nCategory: School Supplies', '2024-05-11 18:11:14'),
(29, 6, 'Products', 'ADD', 'Product: Kumu \nQty: 1 \nPrice: 8999 \nCategory: Snacks', '2024-05-11 18:19:04'),
(30, 9, 'Products', 'ADD', 'Product: Sticker (hu tao ghost) \nQty: 3 \nPrice: 9 \nCategory: Snacks', '2024-05-11 19:21:20'),
(35, 9, 'Products', 'UPDATE', 'CHANGES:\nProduct Name: Sticker (BuTao Ghost) to Sticker (Hu Tao Ghost)', '2024-05-11 20:22:06'),
(36, 9, 'Products', 'UPDATE', 'CHANGES:\nStock: 3 to 5\nPrice: 9.00 to 10.00\nCategory: Snacks to Sauces', '2024-05-11 20:22:42'),
(38, 9, 'Products', 'UPDATE', 'CHANGES:\nProduct Name: Sticker to Sticker (2D-Kun)\nPrice: 9.00 to 10\nProduct Image: Changed', '2024-05-11 20:27:27'),
(40, 9, 'Products', 'UPDATE', 'CHANGES:\nProduct Name: Mousepad (Raiden Ei Genshin) → Mousepad (Raiden Ei)', '2024-05-11 20:31:49'),
(41, 9, 'Products', 'ADD', 'NEW ITEM \nProduct: Homa Pixel Sticker \nQty: 5 \nPrice: 6 \nCategory: Sauces', '2024-05-11 20:41:52'),
(43, 9, 'Products', 'UPDATE', 'CHANGES:\nProduct Name: Pixel Homa Sticker → Pixel Staff of Homa Sticker\nStock: 4 → 6\nCategory: Seafood → Snacks', '2024-05-11 23:00:16'),
(44, 9, 'Products', 'UPDATE', 'CHANGES:\nStock: 6 → 2', '2024-05-11 23:01:05'),
(45, 7, 'Products', 'UPDATE', 'CHANGES:\nProduct Name: Kumu → Kumu Cat', '2024-05-11 23:13:25'),
(46, 7, 'Products', 'ADD', 'NEW ITEM: \nProduct: Sticker Ghost \nQty: 6 \nPrice: 8 \nCategory: Seafood', '2024-05-11 23:21:06'),
(47, 7, 'Products', 'UPDATE', 'CHANGES:\nCategory: Seafood → Snacks', '2024-05-11 23:31:07'),
(48, 1, 'Products', 'UPDATE', 'CHANGES:\nStock: 6 → 7\nPrice: 8.00 → 9.00', '2024-05-11 23:51:33'),
(49, 1, 'Products', 'DELETE', 'DELETED ITEM: Unknown Product', '2024-05-11 23:58:47'),
(50, 1, 'Products', 'DELETE', 'DELETED ITEM: \nProduct Barcode: 2223825049710 \nProduct Name: 2D-kun Stickers', '2024-05-12 00:02:12'),
(51, 1, 'Products', 'DELETE', 'DELETED ITEM: \nProduct Barcode: 2223960767820 \nProduct Name: Yoru Wallpaper', '2024-05-12 00:03:27'),
(52, 7, 'Products', 'DELETE', 'DELETED ITEM: \nProduct Barcode: 2223738483638 \nProduct Name: KLEE', '2024-05-12 01:07:10'),
(53, 7, 'Products', 'UPDATE', 'CHANGES:\nPrice: 9.00 → 10', '2024-05-12 01:17:19'),
(54, 7, 'Products', 'UPDATE', 'CHANGES:\nCategory: Snacks → Vegetables', '2024-05-12 01:29:23'),
(55, 7, 'Products', 'UPDATE', 'CHANGES:\nProduct Name: Sticker Ghost → Hu Tao Ghost Plushie\nStock: 7 → 20\nCategory: Vegetables → Baby Items', '2024-05-12 02:31:20'),
(56, 7, 'Products', 'ADD', 'NEW ITEM: \nProduct: mouse pad archons \nQty: 45 \nPrice: 489 \nCategory: ', '2024-05-12 02:35:57'),
(57, 6, 'Products', 'ADD', 'NEW ITEM: \nProduct: Plushie \nQty: 89 \nPrice: 164 \nCategory: ', '2024-05-12 03:01:25'),
(59, 6, 'Products', 'UPDATE', 'CHANGES:\nProduct Name: Plushie → Plushie Genshin Impact', '2024-05-12 03:05:55'),
(60, 6, 'Products', 'UPDATE', 'CHANGES:\nCategory:  → ---', '2024-05-12 03:39:53'),
(61, 6, 'Products', 'UPDATE', 'CHANGES:\nCategory: --- → Snacks', '2024-05-12 14:39:00'),
(62, 6, 'Products', 'UPDATE', 'CHANGES:\nCategory:  → ---', '2024-05-12 14:39:07'),
(63, 6, 'Products', 'UPDATE', 'CHANGES:\nItem: Plushie Genshin Impact\nCategory: Snacks → ---', '2024-05-12 14:41:05'),
(64, 6, 'Products', 'UPDATE', 'CHANGES in Item: Plushie Genshin Impact Hu Tao\nProduct Name: Plushie Genshin Impact → Plushie Genshin Impact Hu Tao', '2024-05-12 14:41:55'),
(65, 6, 'Products', 'ADD', 'NEW ITEM: \nProduct: ME \nQty: 1 \nPrice: 1000000 \nCategory: Snacks', '2024-05-12 14:44:19'),
(66, 6, 'Products', 'DELETE', 'DELETED ITEM: \nProduct Barcode: 2223643397385 \nProduct Name: ME', '2024-05-12 14:45:24'),
(67, 6, 'Products', 'ADD', 'NEW ITEM: 2223274334309\nProduct: Me \nQty: 1 \nPrice: 100000000 \nCategory: Personal Care', '2024-05-12 14:45:44'),
(68, 6, 'Products', 'DELETE', 'DELETED ITEM: 2223908542761 \nProduct Name: Sticker (Hu Tao Ghost)', '2024-05-12 14:49:30'),
(69, 6, 'Products', 'DELETE', 'DELETED ITEM: Unknown Barcode \nProduct Name: Unknown Product \nQty: Unknown Stock \nPrice: Unknown Price \nCategory: Unknown Category', '2024-05-12 14:53:03'),
(70, 6, 'Products', 'DELETE', 'DELETED ITEM: 222320955530 \nProduct Name: Mousepad (Keqing)', '2024-05-12 14:53:58'),
(71, 6, 'Products', 'UPDATE', 'UPDATED ITEM: 2223261733634\nStock: 45 → 65\nCategory: School Supplies → ---', '2024-05-12 14:56:52'),
(72, 6, 'Products', 'DELETE', 'DELETED ITEM: 2223261733634 \nProduct Name: Sticker (2D-Kun) \nQty: 65 \nPrice: 10.00\n Category: ---', '2024-05-12 14:57:16'),
(73, 6, 'Products', 'DELETE', 'DELETED ITEM: 2223274334309 \nProduct Name: Me \nQty: 1 \nPrice: 99999999.99\n Category: Personal Care', '2024-05-12 15:32:35'),
(74, 6, 'Products', 'ADD', 'NEW ITEM: 222313281847\nProduct: Me \nQty: 1 \nPrice: 101236456 \nCategory: Baby Items', '2024-05-12 15:50:48'),
(75, 6, 'Products', 'UPDATE', 'UPDATED ITEM: 222313281847\nPrice: 99999999.99 → 4.99\nCategory: Baby Items → ---', '2024-05-12 15:51:42'),
(76, 6, 'Products', 'UPDATE', 'UPDATED ITEM: 222313281847\nCategory: --- → Baby Items', '2024-05-12 15:52:04'),
(77, 6, 'Categories', 'ADD', 'NEW CATEGORY: Beverages \nDescription: Mousepad (Keqing)', '2024-05-12 22:43:40'),
(78, 6, 'Categories', 'UPDATE', 'UPDATED CATEGORY: fafea\nBarcode: Beverages → fafea\nProduct Name: drinks, coffee, tea, alcohol, juice, soda, etc. → dfadfaefa', '2024-05-12 22:44:13'),
(79, 6, 'Categories', 'UPDATE', 'UPDATED CATEGORY: Baby Items\nDescription: Baby food, diapers, wet wipes, lotion, etcSSS → Baby food, diapers, wet wipes, lotion, etc.', '2024-05-12 22:45:28'),
(80, 6, 'Categories', 'UPDATE', 'UPDATED CATEGORY: Baby Itemssss\nCategory Name: Baby Items → Baby Itemssss', '2024-05-12 22:45:47'),
(81, 6, 'Categories', 'DELETE', 'DELETED CATEGORY: Canned Goods', '2024-05-12 22:46:06'),
(82, 6, 'Categories', 'DELETE', 'DELETED CATEGORY: Canned Goods', '2024-05-12 22:46:11'),
(83, 6, 'Categories', 'DELETE', 'DELETED CATEGORY: Canned Goods', '2024-05-12 22:46:13'),
(84, 6, 'Categories', 'UPDATE', 'UPDATED CATEGORY: Baby Items\nCategory Name: Baby Itemssss → Baby Items', '2024-05-12 22:46:18'),
(85, 6, 'Categories', 'DELETE', 'DELETED CATEGORY: Beverages', '2024-05-12 22:46:22'),
(86, 6, 'Products', 'UPDATE', 'UPDATED ITEM: 222313281847\nPrice: 4.99 → 5', '2024-05-12 23:09:39'),
(87, 6, 'Products', 'UPDATE', 'UPDATED ITEM: 2223919165645\nCategory: --- → Pet Care', '2024-05-12 23:10:47'),
(88, 6, 'Products', 'ADD', 'NEW ITEM: 2223472701704\nProduct: try \nQty: 45 \nPrice: 455 \nCategory: Fruits ', '2024-05-12 23:18:45'),
(89, 6, 'Categories', 'DELETE', 'DELETED CATEGORY: fafea', '2024-05-12 23:19:07'),
(90, 6, 'Products', 'DELETE', 'DELETED ITEM: 2223919165645 \nProduct Name: mouse pad genshin \nQty: 45 \nPrice: 489.00\n Category: Pet Care', '2024-05-12 23:19:12'),
(91, 6, 'Products', 'DELETE', 'DELETED ITEM: 2223223805205 \nProduct Name: Mousepad (Raiden Ei) \nQty: 8 \nPrice: 459.00\n Category: School Supplies', '2024-05-12 23:19:17'),
(92, 6, 'Products', 'DELETE', 'DELETED ITEM: 2223759833161 \nProduct Name: Hu Tao Ghost Plushie \nQty: 20 \nPrice: 10.00\n Category: Baby Items', '2024-05-12 23:19:20'),
(93, 9, 'Products', 'DELETE', 'DELETED ITEM: 2223472701704 \nProduct Name: try \nQty: 45 \nPrice: 455.00\n Category: Fruits ', '2024-05-12 23:20:00'),
(94, 9, 'Products', 'DELETE', 'DELETED ITEM: 222313281847 \nProduct Name: Me \nQty: 1 \nPrice: 5.00\n Category: Baby Items', '2024-05-12 23:20:04'),
(95, 9, 'Products', 'DELETE', 'DELETED ITEM: 2223400312027 \nProduct Name: Pixel Staff of Homa Sticker \nQty: 2 \nPrice: 6.00\n Category: Snacks', '2024-05-12 23:20:08'),
(96, 9, 'Products', 'UPDATE', 'UPDATED ITEM: 2223780889232\nStock: 50 → 53\nCategory: School Supplies → Baby Items', '2024-05-12 23:22:35'),
(97, 9, 'Products', 'ADD', 'NEW ITEM: 2223729731061\nProduct: Trick \nQty: 1 \nPrice: 123123123 \nCategory: Baby Items', '2024-05-12 23:44:30'),
(98, 9, 'Products', 'UPDATE', 'UPDATED ITEM: 2223729731061\nPrice: 99999999.99 → 1', '2024-05-12 23:44:40'),
(99, 9, 'Products', 'DELETE', 'DELETED ITEM: 2223729731061 \nProduct Name: Trick \nQty: 1 \nPrice: 1.00\n Category: Baby Items', '2024-05-12 23:44:53'),
(100, 9, 'Categories', 'UPDATE', 'UPDATED CATEGORY: Baby Items\nDescription: Baby food, diapers, wet wipes, lotion, etc. → Baby food, diapers, wet wipes, lotion, etc.s', '2024-05-12 23:47:28'),
(101, 9, 'Categories', 'UPDATE', 'UPDATED CATEGORY: Baby Items\nDescription: Baby food, diapers, wet wipes, lotion, etc.s → Baby food, diapers, wet wipes, lotion, etc', '2024-05-12 23:47:45'),
(102, 9, 'Categories', 'ADD', 'NEW CATEGORY: School Supplies \nDescription: School tools and equipment for students', '2024-05-12 23:55:46'),
(103, 9, 'Products', 'UPDATE', 'UPDATED ITEM: 2223780889232\nCategory: Baby Items → School Supplies', '2024-05-12 23:56:00'),
(104, 9, 'Categories', 'ADD', 'NEW CATEGORY: Clothing \nDescription: Personal Clothes, styles, appearance, outfit', '2024-05-12 23:56:54'),
(105, 7, 'Products', 'UPDATE', 'UPDATED ITEM: 2223434399143', '2024-05-12 23:57:35'),
(106, 7, 'Products', 'UPDATE', 'UPDATED ITEM: 2223636584775', '2024-05-12 23:58:30'),
(107, 7, 'Categories', 'ADD', 'NEW CATEGORY: Fruits \nDescription: Apples, bananas,  grapes, oranges, strawberries, avocados, peaches, etc.', '2024-05-12 23:59:30'),
(108, 7, 'Categories', 'ADD', 'NEW CATEGORY: Vegetables \nDescription: Potatoes, onions, carrots, salad greens, broccoli, peppers, tomatoes, cucumbers, etc.', '2024-05-12 23:59:42'),
(109, 7, 'Categories', 'ADD', 'NEW CATEGORY: Dairy \nDescription: Butter, cheese, eggs, milk, yogurt, etc.', '2024-05-12 23:59:56'),
(110, 7, 'Categories', 'ADD', 'NEW CATEGORY: Snacks \nDescription: Chips, pretzels, popcorn, crackers, nuts, etc.', '2024-05-13 00:01:50'),
(111, 7, 'Categories', 'DELETE', 'DELETED CATEGORY: Snacks', '2024-05-13 00:01:55'),
(112, 7, 'Categories', 'ADD', 'NEW CATEGORY: Bread & Bakery \nDescription: Bread, tortillas, pies, muffins, bagels, cookies, etc.', '2024-05-13 00:02:14'),
(113, 7, 'Categories', 'DELETE', 'DELETED CATEGORY: Fruits', '2024-05-13 00:02:37'),
(115, 13, 'Users', 'ADD', 'NEW USER: Yani \nEmail: yani@gmail.com \nGender: male \nRole: user', '2024-05-13 00:31:35'),
(123, 13, 'Users', 'UPDATE', 'UPDATED USER: Yani\nRole: supervisor → cashier', '2024-05-13 01:23:51'),
(124, 13, 'Users', 'UPDATE', 'UPDATED USER: Yani\nPassword: Modified', '2024-05-13 01:24:07'),
(125, 13, 'Users', 'DELETE', 'DELETED USER: example \nEmail: example@gmail.com \nGender: male \nRole: user', '2024-05-13 01:24:34'),
(126, 13, 'Users', 'UPDATE', 'UPDATED USER: Hitori Gotoh\nUsername: bocchi → Hitori Gotoh', '2024-05-13 01:25:22'),
(127, 13, 'Products', 'UPDATE', 'UPDATED ITEM: 2223434399143\nStock: 0 → 7', '2024-05-13 01:49:03'),
(128, 13, 'Users', 'UPDATE', 'UPDATED USER: Kobe', '2024-05-13 01:52:40'),
(129, 13, 'Users', 'UPDATE', 'UPDATED USER: Leynald Kobe\nUsername: Kobe → Leynald Kobe\nUser Image: User Image Changed', '2024-05-13 09:07:08'),
(130, 13, 'Users', 'UPDATE', 'UPDATED USER: Llyle Prince\nUsername: Llyle → Llyle Prince\nRole: cashier → admin\nUser Image: User Image Changed', '2024-05-13 09:07:53'),
(131, 13, 'Users', 'UPDATE', 'UPDATED USER: Samantha Maurice\nUsername: sam → Samantha Maurice\nRole: supervisor → cashier\nUser Image: User Image Changed', '2024-05-13 09:08:37'),
(132, 8, 'Users', 'UPDATE', 'UPDATED USER: Wednesday\nRole: supervisor → cashier', '2024-05-13 09:09:54'),
(133, 8, 'Users', 'ADD', 'NEW USER: Rhayli \nEmail: rhayli@gmail.com \nGender: male \nRole: user', '2024-05-13 09:10:16'),
(134, 20, 'Users', 'UPDATE', 'UPDATED USER: Rhayli\nUser Image: User Image Changed', '2024-05-13 09:11:04'),
(138, 20, 'Users', 'UPDATE', 'UPDATED USER: Rhayli\nUsername: Rhayli S → Rhayli', '2024-05-13 10:05:56'),
(140, 20, 'Users', 'UPDATE', 'UPDATED USER: Rhayli\nUsername: Rhayli Silongan → Rhayli', '2024-05-13 10:16:38'),
(141, 14, 'Users', 'UPDATE', 'UPDATED USER: Zhara\nUsername: zharagon → Zhara', '2024-05-13 10:18:12'),
(142, 6, 'Users', 'DELETE', 'DELETED USER: tryexample \nEmail: tryexample@email.com \nGender: male \nRole: user', '2024-05-13 10:18:35'),
(143, 6, 'Users', 'UPDATE', 'UPDATED USER: Rhayli Silongan\nUsername: Rhayli → Rhayli Silongan', '2024-05-13 10:34:16'),
(144, 6, 'Users', 'DELETE', 'DELETED USER: Yani \nEmail: yani@gmail.com \nGender: male \nRole: cashier', '2024-05-13 10:36:44'),
(145, 6, 'Products', 'UPDATE', 'UPDATED ITEM: 2223686064536\nStock: 100 → 110', '2024-05-13 14:48:34'),
(146, 6, 'Users', 'UPDATE', 'UPDATED USER: Leynald Kobe\nRole: supervisor → cashier', '2024-05-13 22:14:18'),
(147, 6, 'Users', 'UPDATE', 'UPDATED USER: Rhayli Silongan\nRole: user → cashier', '2024-05-13 22:14:38'),
(148, 6, 'Users', 'UPDATE', 'UPDATED USER: Rhayli Silongan\nRole: cashier → supervisor', '2024-05-13 22:14:58'),
(149, 6, 'Users', 'UPDATE', 'UPDATED USER: Rhayli Silongan', '2024-05-13 22:15:15'),
(150, 6, 'Users', 'UPDATE', 'UPDATED USER: Llyle Prince\nRole: admin → supervisor', '2024-05-13 22:15:52'),
(151, 8, 'Products', 'UPDATE', 'UPDATED ITEM: 2222893703661\nStock: 53 → 0', '2024-05-13 23:33:28'),
(152, 8, 'Products', 'UPDATE', 'UPDATED ITEM: 2223434399143\nStock: 7 → 11', '2024-05-13 23:34:40'),
(153, 9, 'Products', 'UPDATE', 'UPDATED ITEM: 2222893703661', '2024-05-13 23:50:33'),
(154, 8, 'Products', 'UPDATE', 'UPDATED ITEM: 2223434399143\nStock: 11 → 5', '2024-05-14 00:41:22'),
(155, 8, 'Products', 'UPDATE', 'UPDATED ITEM: 2223434399143\nStock: 5 → 11', '2024-05-14 00:42:00'),
(156, 8, 'Products', 'UPDATE', 'UPDATED ITEM: 2222893703661\nStock: 0 → 50', '2024-05-14 00:43:37'),
(157, 8, 'Products', 'UPDATE', 'UPDATED ITEM: 2223636584775\nStock: 100 → 17', '2024-05-14 00:43:49'),
(158, 8, 'Products', 'UPDATE', 'UPDATED ITEM: 2223155520988\nStock: 100 → 0', '2024-05-14 00:43:58'),
(159, 8, 'Products', 'UPDATE', 'UPDATED ITEM: 2223686064536\nStock: 110 → 0', '2024-05-14 00:44:08'),
(160, 8, 'Products', 'UPDATE', 'UPDATED ITEM: 2223434399143\nStock: 11 → 50', '2024-05-14 00:46:52'),
(161, 8, 'Products', 'UPDATE', 'UPDATED ITEM: 2223636584775\nStock: 17 → 21', '2024-05-14 00:46:59'),
(162, 8, 'Products', 'UPDATE', 'UPDATED ITEM: 2223155520988\nStock: 0 → 100', '2024-05-14 00:47:05'),
(163, 8, 'Products', 'UPDATE', 'UPDATED ITEM: 2223686064536\nStock: 0 → 100', '2024-05-14 00:47:10'),
(164, 8, 'Products', 'UPDATE', 'UPDATED ITEM: 2222774991043\nStock: 10 → 100', '2024-05-14 00:47:20'),
(167, 8, 'Products', 'UPDATE', 'UPDATED ITEM: 2222794658425\nCurrent Stock: 45 + 10 = 55', '2024-05-14 14:06:46'),
(168, 8, 'Products', 'UPDATE', 'UPDATED ITEM: 2223434399143\nCurrent Stock: 50 + 3 = 53', '2024-05-14 14:07:02'),
(169, 8, 'Categories', 'DELETE', 'DELETED CATEGORY: ', '2024-05-14 15:52:23'),
(170, 8, 'Categories', 'DELETE', 'DELETED CATEGORY: ', '2024-05-14 15:55:18'),
(171, 8, 'Categories', 'DELETE', 'DELETED CATEGORY: ', '2024-05-14 16:01:19'),
(172, 8, 'Categories', 'DELETE', 'DELETED CATEGORY: ', '2024-05-14 16:02:15'),
(173, 8, 'Categories', 'DELETE', 'DELETED CATEGORY: ', '2024-05-14 16:02:38'),
(174, 8, 'Categories', 'DELETE', 'DELETED CATEGORY: Frozen Foods', '2024-05-14 16:04:02'),
(175, 8, 'Categories', 'DELETE', 'DELETED CATEGORY: Canned Goods', '2024-05-14 16:05:51'),
(176, 8, 'Categories', 'DELETE', 'DELETED CATEGORY: Canned Goods', '2024-05-14 16:09:18'),
(177, 8, 'Categories', 'DELETE', 'DELETED CATEGORY: Canned Goods', '2024-05-14 16:10:33'),
(178, 8, 'Categories', 'DELETE', 'DELETED CATEGORY: Beverages', '2024-05-14 16:10:38'),
(179, 8, 'Categories', 'DELETE', 'DELETED CATEGORY: Beverages', '2024-05-14 16:21:34'),
(180, 8, 'Categories', 'DELETE', 'DELETED CATEGORY: Pet Care', '2024-05-14 17:31:56'),
(181, 8, 'Products', 'DELETE', 'DELETED ITEM: 2223375580155 \nProduct Name: Lucky Me Beef Noodles \nQty: 100 \nPrice: 25.00\n Category: Pasta & Noodles', '2024-05-14 17:34:26'),
(182, 13, 'Categories', 'DELETE', 'DELETED CATEGORY: Fruits ', '2024-05-14 17:52:16'),
(183, 13, 'Products', 'DELETE', 'DELETED ITEM: 2222881344444 \nProduct Name: Burger \nQty: 200 \nPrice: 10.00\n Category: Snacks', '2024-05-14 17:52:44'),
(184, 13, 'Users', 'DELETE', 'DELETED USER: some user \nEmail: mail@mail.com \nGender: male \nRole: user', '2024-05-14 18:01:11'),
(185, 13, 'Categories', 'DELETE', 'DELETED CATEGORY: Pasta, Rice & Cereal', '2024-05-14 18:34:21'),
(186, 13, 'Users', 'DELETE', 'DELETED USER: some user \nEmail: mail@mail.com \nGender: male \nRole: user', '2024-05-14 18:41:15'),
(187, 13, 'Users', 'DELETE', 'DELETED USER: some user \nEmail: mail@mail.com \nGender: male \nRole: user', '2024-05-14 19:00:51'),
(188, 13, 'Products', 'DELETE', 'DELETED ITEM: 2223434399143 \nProduct Name: Snapback Hat \nQty: 53 \nPrice: 75.00\n Category: Clothing', NULL),
(189, 13, 'Products', 'DELETE', 'DELETED ITEM: 2223686064536 \nProduct Name: ID Lace \nQty: 100 \nPrice: 25.00\n Category: School Supplies', '2024-05-14 19:03:20'),
(190, 13, 'Categories', 'DELETE', 'DELETED CATEGORY: Beverages', '2024-05-14 19:04:25'),
(191, 13, 'Products', 'ADD', 'NEW ITEM: 2223921386792\nProduct: alfadogs \nQty: 1 \nPrice: 45 \nCategory: Snacks', '2024-05-14 19:12:56'),
(192, 13, 'Products', 'UPDATE', 'UPDATED ITEM: 2223921386792\nCurrent Stock: 1 + 1 = 2', '2024-05-14 19:29:20'),
(193, 13, 'Users', 'UPDATE', 'UPDATED USER: zhara\nUsername: Zhara → zhara', '2024-05-15 09:15:59'),
(194, 13, 'Users', 'UPDATE', 'UPDATED USER: Zhara Gonzales\nUsername: zhara → Zhara Gonzales', '2024-05-15 09:16:24'),
(195, 13, 'Users', 'ADD', 'NEW USER: tryexample \nEmail: tryexample@email.com \nGender: Female \nRole: user', '2024-05-15 09:27:33'),
(196, 13, 'Users', 'UPDATE', 'UPDATED USER: tryexample\nRole: user → Admin', '2024-05-15 09:28:11'),
(197, 13, 'Users', 'UPDATE', 'UPDATED USER: Zhara Gonzales\nGender: female → Female\nRole: supervisor → Supervisor', '2024-05-15 09:29:13'),
(198, 13, 'Users', 'UPDATE', 'UPDATED USER: Power\nRole: admin → Admin', '2024-05-15 09:29:31'),
(199, 6, 'Users', 'UPDATE', 'UPDATED USER: Trick\nRole: admin → Admin', '2024-05-15 09:30:16'),
(200, 1, 'Users', 'UPDATE', 'UPDATED USER: Rhayli Silongan\nGender: male → Male', '2024-05-15 09:45:30'),
(201, 1, 'Users', 'UPDATE', 'UPDATED USER: Power\nGender: female → Female', '2024-05-15 09:45:43'),
(202, 1, 'Users', 'UPDATE', 'UPDATED USER: Wednesday\nGender: female → Female', '2024-05-15 09:45:56'),
(203, 6, 'Products', 'ADD', 'NEW ITEM: 2223180878842\nProduct: 2Dkun sticker \nQty: 12 \nPrice: 15 \nCategory: ---', '2024-05-15 10:38:10'),
(204, 13, 'Products', 'DELETE', 'DELETED ITEM: 2223180878842 \nProduct Name: 2Dkun sticker \nQty: 12 \nPrice: 15.00\n Category: ---', '2024-05-15 11:54:37'),
(205, 1, 'Users', 'UPDATE', 'UPDATED USER: Leynald Kobe', '2024-05-15 12:37:53'),
(206, 1, 'Users', 'UPDATE', 'UPDATED USER: Leynald Kobe', '2024-05-15 12:38:04'),
(207, 1, 'Users', 'UPDATE', 'UPDATED USER: Leynald Kobe', '2024-05-15 12:38:10'),
(208, 1, 'Users', 'UPDATE', 'UPDATED USER: Llyle Prince', '2024-05-15 12:38:33'),
(209, 1, 'Users', 'UPDATE', 'UPDATED USER: Leynald Kobe', '2024-05-15 12:40:47'),
(210, 1, 'Users', 'UPDATE', 'UPDATED USER: Leynald Kobe', '2024-05-15 12:40:55'),
(211, 13, 'Users', 'UPDATE', 'UPDATED USER: Rhayli\nUsername: Rhayli Silongan → Rhayli', '2024-05-15 12:42:02'),
(212, 13, 'Users', 'UPDATE', 'UPDATED USER: tryexample', '2024-05-15 12:43:50'),
(213, 13, 'Users', 'UPDATE', 'UPDATED USER: tryexample\nRole: Admin → cashier', '2024-05-15 12:45:34'),
(214, 13, 'Users', 'UPDATE', 'UPDATED USER: tryexample\nRole: cashier → Admin', '2024-05-15 12:46:10'),
(215, 13, 'Users', 'UPDATE', 'UPDATED USER: tryexample\nRole: Admin → Supervisor', '2024-05-15 12:46:16'),
(216, 13, 'Users', 'UPDATE', 'UPDATED USER: Samantha Maurice\nRole: cashier → Cashier', '2024-05-15 12:46:32'),
(217, 13, 'Users', 'UPDATE', 'UPDATED USER: Samantha Maurice\nGender: female → Female', '2024-05-15 12:47:28'),
(218, 13, 'Users', 'UPDATE', 'UPDATED USER: Leynald Kobe\nGender: male → Male\nRole: cashier → Cashier', '2024-05-15 12:47:44'),
(219, 13, 'Users', 'UPDATE', 'UPDATED USER: Llyle Prince\nGender: male → Male', '2024-05-15 12:48:06'),
(220, 13, 'Users', 'UPDATE', 'UPDATED USER: Hitori Gotoh\nGender: female → Female', '2024-05-15 12:48:19'),
(221, 13, 'Users', 'UPDATE', 'UPDATED USER: Trick\nGender: male → Male', '2024-05-15 12:48:29'),
(222, 13, 'Products', 'DELETE', 'DELETED ITEM: 2223921386792 \nProduct Name: alfadogs \nQty: 2 \nPrice: 45.00\n Category: Snacks', '2024-05-15 13:52:44'),
(223, 13, 'Users', 'UPDATE', 'UPDATED USER: tryexample\nGender: Female → <?$row[\'gender\']?>\nRole: Supervisor → Cashier', '2024-05-15 14:18:24'),
(224, 13, 'Users', 'UPDATE', 'UPDATED USER: tryexample\nGender: <?$row → Male', '2024-05-15 14:19:11'),
(225, 13, 'Users', 'UPDATE', 'UPDATED USER: tryexample\nGender: Male → <?$row[\'gender\']?>', '2024-05-15 14:19:26'),
(226, 13, 'Users', 'UPDATE', 'UPDATED USER: tryexample\nGender: <?$row → Male', '2024-05-15 14:19:31'),
(227, 13, 'Users', 'UPDATE', 'UPDATED USER: tryexample\nGender: Male → Female', '2024-05-15 14:19:54'),
(228, 6, 'Products', 'UPDATE', 'UPDATED ITEM: 2223636584775\nCurrent Stock: 25 + 1 = 26', '2024-05-15 14:29:22'),
(229, 6, 'Products', 'UPDATE', 'UPDATED ITEM: 2223780889232', '2024-05-15 14:31:36'),
(230, 6, 'Products', 'UPDATE', 'UPDATED ITEM: 2223780889232', '2024-05-15 14:31:41'),
(231, 6, 'Products', 'UPDATE', 'UPDATED ITEM: 2223636584775', '2024-05-15 14:31:52'),
(232, 6, 'Products', 'UPDATE', 'UPDATED ITEM: 2223780889232', '2024-05-15 14:32:09'),
(233, 6, 'Products', 'UPDATE', 'UPDATED ITEM: 2223780889232\nCurrent Stock: 55 + 1 = 56', '2024-05-15 14:32:16'),
(234, 6, 'Users', 'UPDATE', 'UPDATED USER: Power\nGender: Female → Male\nUser Image: User Image Changed', '2024-05-15 14:56:50'),
(235, 6, 'Products', 'UPDATE', 'UPDATED ITEM: 2223780889232\nProduct Image: Modified', '2024-05-15 14:57:22'),
(236, 6, 'Products', 'UPDATE', 'UPDATED ITEM: 2223780889232\nProduct Image: Modified', '2024-05-15 14:57:50'),
(237, 6, 'Products', 'ADD', 'NEW ITEM: 222378939232\nProduct: Alfadogs \nQty: 1 \nPrice: 55 \nCategory: Snacks', '2024-05-15 14:58:31'),
(238, 6, 'Products', 'UPDATE', 'UPDATED ITEM: 222378939232\nProduct Image: Modified', '2024-05-15 14:59:54'),
(239, 6, 'Products', 'DELETE', 'DELETED ITEM: 222378939232 \nProduct Name: Alfadogs \nQty: 1 \nPrice: 55.00\n Category: Snacks', '2024-05-15 15:02:52'),
(240, 13, 'Products', 'UPDATE', 'UPDATED ITEM: 2223780889232\nCurrent Stock: 56 + 5 = 61', '2024-05-15 15:03:04'),
(241, 6, 'Users', 'UPDATE', 'UPDATED USER: Wednesday\nPassword: Modified\nGender: Female → Male\nRole: cashier → Cashier', '2024-05-15 21:03:22'),
(242, 6, 'Users', 'UPDATE', 'UPDATED USER: Wednesday\nGender: Male → Female', '2024-05-15 21:03:34'),
(243, 6, 'Suppliers', 'ADD', 'NEW SUPPLIER: Sample Company Name \nCompany Address: 123 Sample Address St. Manila, Philippines', '2024-05-15 22:27:48'),
(244, 6, 'Suppliers', 'DELETE', 'DELETED SUPPLIER: Sample Company Name', '2024-05-15 23:09:10'),
(245, 6, 'Suppliers', 'UPDATE', 'UPDATED SUPPLIER: Sample Company Name\nBusiness Type: Producers → Importers', '2024-05-15 23:46:43'),
(246, 6, 'Suppliers', 'UPDATE', 'UPDATED SUPPLIER: Sample Company\nCompany Name: Sample Company Name → Sample Company\nCompany Address: 123 Sample Address St. Manila, Philippines → 1234 Sample Address St. Manila, Philippines\nContact Person: Sample Person Name → Sample Name\nContact Number: 09123456798 → 09123456799\nContact Email: sample@email.com → example@email.com\nBusiness Type: Importers → Service', '2024-05-15 23:47:25'),
(247, 6, 'Suppliers', 'ADD', 'NEW SUPPLIER: faefa \nCompany Address: feaf', '2024-05-15 23:48:20'),
(248, 6, 'Products', 'DELETE', 'DELETED ITEM: 222378939232 \nProduct Name: Alfadogs \nQty: 1 \nPrice: 55.00\n Category: Snacks', '2024-05-16 00:07:19'),
(249, 6, 'Products', 'DELETE', 'DELETED ITEM: 222378939232 \nProduct Name: Alfadogs \nQty: 1 \nPrice: 55.00\n Category: Snacks', '2024-05-16 00:07:24'),
(250, 6, 'Products', 'DELETE', 'DELETED ITEM: 222378939232 \nProduct Name: Alfadogs \nQty: 1 \nPrice: 55.00\n Category: Snacks', '2024-05-16 00:07:25'),
(251, 6, 'Products', 'DELETE', 'DELETED ITEM: 2223375580155 \nProduct Name: Lucky Me Beef Noodles \nQty: 95 \nPrice: 25.00\n Category: Pasta & Noodles', '2024-05-16 00:08:53'),
(252, 13, 'Suppliers', 'ADD', 'NEW SUPPLIER: Try \nCompany Address: try address', '2024-05-16 00:14:55'),
(253, 13, 'Suppliers', 'UPDATE', 'UPDATED SUPPLIER: Try change\nCompany Name: Try → Try change\nCompany Address: try address → try address edit\nContact Person: kunyare lang → kunyare lang na edit\nContact Number: 123456789 → 10123456\nContact Email: try@gmail.com → naibakunyaretry@gmail.com\nBusiness Type: Vendor → Wholesale', '2024-05-16 00:15:36'),
(254, 13, 'Suppliers', 'UPDATE', 'UPDATED SUPPLIER: kunyare\nCompany Name: faefa → kunyare\nContact Person: feaf → ito lang nabago\nContact Number: 4154 → 456789', '2024-05-16 00:16:00'),
(255, 13, 'Suppliers', 'DELETE', 'DELETED SUPPLIER: Try change', '2024-05-16 00:16:14');

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
(5, 'Meat', 'chicken, beef, pork, sausage, bacon etc', 0),
(6, 'Snacks', 'Chips, pretzels, popcorn, crackers, nuts, etc.', 0),
(8, 'Personal Care', 'Shampoo, conditioner, deodorant, toothpaste, dental floss, etc.', 0),
(9, 'Baby Items', 'Baby food, diapers, wet wipes, lotion, etc', 0),
(11, 'Condiments & Spices', 'peppers, oregano, cinnamon, sugar, olive oil, ketchup, mayonnaise, etc.', 0),
(12, 'Fruits ', 'Apples, bananas,  grapes, oranges, strawberries, avocados, peaches, etc.', 0),
(13, 'Pasta, Rice & Cereal', 'Oats, granola, brown rice, white rice, macaroni, noodles, etc.', 0),
(14, 'Pet Care', 'Pet food, kitty litter, chew toys, pet treats, pet shampoo, etc.', 0),
(18, 'Canned Goods', 'Soup, tuna, fruit, beans, vegetables, pasta sauce, etc.', 0),
(21, 'Beverages', 'Cheese, salami, ham, turkey, etc.', 1),
(23, 'School Supplies', 'School tools and equipment for students', 0),
(24, 'Clothing', 'Personal Clothes, styles, appearance, outfit', 0),
(26, 'Vegetables', 'Potatoes, onions, carrots, salad greens, broccoli, peppers, tomatoes, cucumbers, etc.', 0);

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
(11, 5, 'Users', 13, '2024-05-14 19:00:51'),
(12, 30, 'Products', 13, '2024-05-14 19:02:26'),
(13, 25, 'Products', 13, '2024-05-14 19:03:20'),
(14, 21, 'Categories', 13, '2024-05-14 19:04:25'),
(15, 71, 'Products', 13, '2024-05-15 11:54:37'),
(16, 70, 'Products', 13, '2024-05-15 13:52:44'),
(17, 72, 'Products', 6, '2024-05-15 15:02:52'),
(19, 72, 'Products', 6, '2024-05-16 00:07:19'),
(20, 72, 'Products', 6, '2024-05-16 00:07:24'),
(21, 72, 'Products', 6, '2024-05-16 00:07:25'),
(22, 24, 'Products', 6, '2024-05-16 00:08:53'),
(23, 3, 'Suppliers', 13, '2024-05-16 00:16:14');

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
  `category` varchar(255) NOT NULL,
  `if_deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `barcode`, `description`, `stock`, `amount`, `image`, `user_id`, `date`, `views`, `category`, `if_deleted`) VALUES
(3, '2222947895764', 'Crisps', 193, 4.95, 'uploads/a376a3a3f34dc21971ca40ac6dd6664585c197a6_4817.jpg', '1', '2022-01-09 08:46:29', 59, 'Snacks', 0),
(4, '2222881344444', 'Burger', 196, 10.00, 'uploads/c322c54a3249e75ca46347a2c4ec9385672cb8e3_5698.jpg', '1', '2022-01-09 08:47:02', 18, 'Snacks', 0),
(5, '1234', 'So good milk', 88, 20.00, 'uploads/e149b8702ddb43e5cda3c10803c563203b27cfc0_6896.jpg', '1', '2022-01-09 08:47:54', 26, 'Dairy Products', 0),
(6, '2222925913231', 'OMO SOFTENER', 79, 50.00, 'uploads/e80200cc753ea342725ba080f668144fe4c763b9_7977.jpg', 'Unknown', '2022-01-16 08:35:24', 59, 'Detergent', 0),
(8, '2222595564534', '7 UP', 40, 34.00, 'uploads/a6f424034ca00dc2c3b55761f2b1c31d689ca215_6797.jpg', '6', '2023-07-01 12:15:13', 5, 'Beverages', 0),
(10, '2222974243584', 'Caramel Moolatte', 21, 5.00, 'uploads/7efe697d3a3cafad54574764253c1c4e5ee3de93_3723.png', '1', '2023-07-01 12:59:42', 7, 'Frozen Foods', 0),
(11, '2222123200968', 'Monster', 198, 45.00, 'uploads/40fbc31c9795970c2b93419196a07354829db713_1986.jpg', '6', '2023-07-01 16:25:41', 5, 'Beverages', 0),
(15, '2222135063866', 'Cola Zero in can', 25, 39.00, 'uploads/a54741bf6d71e0b52ce6cd34d0d526c6dd4e94a6_4751.jpg', '6', '2023-07-03 11:07:15', 1, 'Beverages', 0),
(16, '2222877211304', 'Mirinda', 29, 35.00, 'uploads/e5bc61c49ab567c8e2a921d735f77c19955571c1_5489.jpg', '6', '2023-07-03 11:08:04', 1, 'Beverages', 0),
(17, '2222774991043', 'Spindrift', 100, 50.00, 'uploads/5e07651f0573ad1d5851ce6ea26eae85d59b67dc_2952.jpg', '6', '2023-07-03 11:08:40', 0, 'Beverages', 0),
(18, '2222794658425', 'Boost Energy', 55, 50.00, 'uploads/5edd64c0e275bd3cb6e9940773da659adfb228dc_9357.jpg', '6', '2023-07-03 13:20:21', 0, 'Beverages', 0),
(19, '2222893703661', 'Fifa', 50, 23.00, 'uploads/product/a5ff699d375e9743390192ba1674647dfc51025d_2043.jpg', '6', '2023-07-03 14:11:53', 1, 'Beverages', 0),
(23, '2223519322434', 'CDO Luncheon Meat 350g', 92, 150.00, 'uploads/product85853e6e9d47bdb7286d1076c1aeabdb0ebe74bc_9138.jpg', '1', '2024-03-26 07:16:38', 3, 'Canned Goods', 0),
(24, '2223375580155', 'Lucky Me Beef Noodles', 95, 25.00, 'uploads/product7eb433368ec83423b493eb98b515917409b145f7_8232.jpg', '1', '2024-03-26 07:21:19', 1, 'Pasta & Noodles', 1),
(25, '2223686064536', 'ID Lace', 100, 25.00, 'uploads/product6f21ec36b38e2139a8b5a643e1fcb6b5330e45d1_6010.jfif', '1', '2024-04-02 02:33:17', 0, 'School Supplies', 1),
(26, '2223155520988', 'Black T-Shirt', 100, 150.00, 'uploads/product5ea1733a8d127449fd3ad4ed51938de31dd3e668_2079.jpg', '1', '2024-04-02 02:33:45', 0, 'Clothing', 0),
(27, '2223636584775', 'White T-Shirt', 26, 150.00, 'uploads/productf57de05611fffd9ab731fb1ee845793193845dc0_9018.jpg', '1', '2024-04-02 02:34:19', 0, 'Clothing', 0),
(30, '2223434399143', 'Snapback Hat', 53, 75.00, 'uploads/product3e434d486cd8acf99a8cd93bf97c966f5009d804_9935.jpg', '1', '2024-04-02 02:41:19', 0, 'Clothing', 1),
(31, '2223780889232', 'Long Envelope', 61, 25.00, 'uploads/product/a7dd6ef7ce24f5af8f33242b463fac7e72630816_6287.jpg', '6', '2024-04-02 02:41:48', 0, 'School Supplies', 0),
(70, '2223921386792', 'alfadogs', 2, 45.00, 'uploads/product2e97d71d6565dd572ff5f0c9d85630eb43475ffd_7100.jpg', '13', '2024-05-14 19:12:56', 0, 'Snacks', 1),
(71, '2223180878842', '2Dkun sticker', 12, 15.00, 'uploads/product886eb2a3918f07e75438af918699640273d1e423_5736.jpg', '6', '2024-05-15 10:38:10', 0, '---', 1),
(72, '222378939232', 'Alfadogs', 1, 55.00, 'uploads/product/775a7935b90d0f0f9a20c772fbb18ce8d22861d0_5907.png', '6', '2024-05-15 14:58:31', 0, 'Snacks', 1);

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
(1, 'admin'),
(2, 'supervisor'),
(3, 'manager'),
(4, 'cashier'),
(5, 'user');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(11) NOT NULL,
  `barcode` varchar(15) DEFAULT NULL,
  `receipt_no` int(11) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
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

INSERT INTO `sales` (`id`, `barcode`, `receipt_no`, `description`, `qty`, `amount`, `total`, `date`, `user_id`, `payment_method`) VALUES
(7, '1234', 3, 'So good milk', 1, 20.00, 20.00, '2024-02-17 11:11:37', '1', ''),
(8, '2222472108593', 4, 'Biscuits', 2, 10.95, 21.90, '2024-02-17 19:50:49', '1', ''),
(9, '2222472108593', 5, 'Biscuits', 2, 10.95, 21.90, '2024-03-17 19:52:19', '1', ''),
(10, '2222472108593', 6, 'Biscuits', 1, 10.95, 10.95, '2024-03-17 19:52:40', '1', ''),
(11, '2222925913231', 7, 'OMO SOFTENER', 1, 50.00, 50.00, '2023-01-17 19:56:02', '1', ''),
(12, '1234', 8, 'So good milk', 2, 20.00, 40.00, '2023-01-17 20:00:02', '1', ''),
(13, '1234', 9, 'So good milk', 1, 20.00, 20.00, '2023-04-17 19:57:44', '1', ''),
(14, '1234', 10, 'So good milk', 3, 20.00, 60.00, '2023-04-17 19:57:53', '1', ''),
(207, '1234', 8, 'So good milk', 2, 20.00, 40.00, '2024-04-01 20:00:02', '1', ''),
(208, '1234', 9, 'So good milk', 1, 20.00, 20.00, '2024-04-01 20:00:02', '1', ''),
(209, '1234', 10, 'So good milk', 3, 20.00, 60.00, '2024-04-02 20:00:02', '1', ''),
(210, '2222925913231', 11, 'OMO SOFTENER', 1, 50.00, 50.00, '2024-05-15 14:04:05', '13', 'CASH '),
(211, '2222595564534', 11, '7 UP', 1, 34.00, 34.00, '2024-05-15 14:04:05', '13', 'CASH '),
(212, '2222925913231', 12, 'OMO SOFTENER', 1, 50.00, 50.00, '2024-05-15 14:06:43', '6', 'CASH '),
(213, '2222974243584', 12, 'Caramel Moolatte', 1, 5.00, 5.00, '2024-05-15 14:06:43', '6', 'CASH '),
(214, '2223519322434', 12, 'CDO Luncheon Meat 350g', 2, 150.00, 300.00, '2024-05-15 14:06:43', '6', 'CASH '),
(215, '2222925913231', 13, 'OMO SOFTENER', 1, 50.00, 50.00, '2024-05-15 15:15:31', '13', 'CASH '),
(216, '1234', 13, 'So good milk', 1, 20.00, 20.00, '2024-05-15 15:15:31', '13', 'CASH '),
(217, '2222881344444', 14, 'Burger', 1, 10.00, 10.00, '2024-05-15 15:16:57', '13', 'CASH '),
(218, '1234', 14, 'So good milk', 1, 20.00, 20.00, '2024-05-15 15:16:57', '13', 'CASH '),
(219, '2222123200968', 14, 'Monster', 1, 45.00, 45.00, '2024-05-15 15:16:57', '13', 'CASH '),
(220, '2222881344444', 15, 'Burger', 1, 10.00, 10.00, '2024-05-15 15:17:47', '13', 'CASH '),
(221, '1234', 16, 'So good milk', 1, 20.00, 20.00, '2024-05-15 15:18:17', '13', 'CASH '),
(222, '2222123200968', 16, 'Monster', 1, 45.00, 45.00, '2024-05-15 15:18:17', '13', 'CASH '),
(223, '2222881344444', 17, 'Burger', 1, 10.00, 10.00, '2024-05-15 15:18:39', '13', 'CASH '),
(224, '1234', 18, 'So good milk', 1, 20.00, 20.00, '2024-05-15 15:22:23', '13', 'CASH '),
(225, '2222881344444', 19, 'Burger', 1, 10.00, 10.00, '2024-05-15 15:23:29', '13', 'CASH '),
(226, '2223375580155', 20, 'Lucky Me Beef Noodles', 5, 25.00, 125.00, '2024-05-15 22:44:20', '6', 'CASH '),
(227, '2223519322434', 20, 'CDO Luncheon Meat 350g', 3, 150.00, 450.00, '2024-05-15 22:44:20', '6', 'CASH '),
(228, '2223519322434', 21, 'CDO Luncheon Meat 350g', 3, 150.00, 450.00, '2024-05-15 22:46:17', '6', 'CASH '),
(229, '2222595564534', 21, '7 UP', 5, 34.00, 170.00, '2024-05-15 22:46:17', '6', 'CASH ');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `id` int(11) NOT NULL,
  `supplier_name` varchar(255) NOT NULL,
  `contact_person` varchar(255) NOT NULL,
  `contact_number` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `business_type` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`id`, `supplier_name`, `contact_person`, `contact_number`, `email`, `business_type`) VALUES
(5, 'School Supplies', 'John Ramos', '098765432132', 'john@gmail.com', 'Distributor'),
(6, 'Food Supplies', 'Vincent Ilaya', '09345678543', 'vincent@gmail.com', 'Wholesale');

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
(1, 'Sample Company', '1234 Sample Address St. Manila, Philippines', 'Sample Name', '09123456799', 'example@email.com', 'Service', 0),
(2, 'kunyare', 'feaf', 'ito lang nabago', '456789', 'faf@aefae.com', 'Manufacturer', 0),
(3, 'Try change', 'try address edit', 'kunyare lang na edit', '10123456', 'naibakunyaretry@gmail.com', 'Wholesale', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
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

INSERT INTO `users` (`id`, `username`, `email`, `password`, `date`, `image`, `role`, `gender`, `deletable`, `void_code`, `if_deleted`) VALUES
(1, 'TUP Admin', 'tup@tup.com', '$2y$10$nah2kwq0IHoepQc/JDV78OgQVfz5fS3X3qZRhqnP5qc7LOYJKS.Yi', '2021-12-28 09:33:15', 'uploads/b9f374a1b62b51b3ded23d37248aa8ab5f9d34fc_3518.png', 'Admin', 'male', 0, '12345', 0),
(2, 'Keqing', 'keqing@email.com', '$2y$10$nah2kwq0IHoepQc/JDV78OgQVfz5fS3X3qZRhqnP5qc7LOYJKS.Yi', '2021-12-28 10:39:58', 'uploads/user/c73cac02fb8be32cd2d07a65c6092db6c04a074e_7337.png', 'cashier', 'female', 1, '', 0),
(5, 'some user', 'mail@mail.com', '$2y$10$nah2kwq0IHoepQc/JDV78OgQVfz5fS3X3qZRhqnP5qc7LOYJKS.Yi', '2022-02-17 19:13:49', NULL, 'User', 'male', 1, '', 1),
(6, 'Trick', 'jhypsss@gmail.com', '$2y$10$VJanESVTpnaT0JyiTgKPGOTeP8Yps7gbF6T0vB1aoS7hEzlGcSSBS', '2023-07-01 09:30:31', 'uploads/user/07524a465c5686c33c39f99fe955173b8d2d3431_9044.jpg', 'Admin', 'Male', 0, '54321', 0),
(7, 'Hitori Gotoh', 'bocchi@gmail.com', '$2y$10$MGfAr8fNoCLlPlh6dQOYDejX3oq92DJBkULiXhapGTx4Hc3Dd.LkS', '2023-07-01 09:31:07', 'uploads/71266d5faa035f21973b3dc9e234bac0cc299bab_8219.jpg', 'Supervisor', 'Female', 1, '', 0),
(8, 'Llyle Prince', 'llyle@gmail.com', '$2y$10$.hmG6inoH3GJIQ.NVUqRuO4iGBHAv9ZJrgafR9L/f.vrMWV/ROPCW', '2023-07-02 19:53:31', 'uploads/user/41135b00337c48abc6723931acc19e81f0efff4b_9247.png', 'Supervisor', 'Male', 1, '121212', 0),
(9, 'Leynald Kobe', 'kobe@gmail.com', '$2y$10$nxdd5sAJfIjgp5tckk7oN.TFD4w5AEbWuU3Zn8918De95xOyEZcNu', '2023-07-02 19:56:28', 'uploads/user/95b033c5a6e93b626077b1eb2f76eadde3e61862_9029.png', 'Cashier', 'Male', 1, '', 0),
(10, 'Samantha Maurice', 'sam@gmail.com', '$2y$10$8Ysz5pGB0j/ngy3VS2qUWufO4kZstqgvZU8gAWQ3IRNMnruqxiRc2', '2023-07-02 19:57:29', 'uploads/user/8f2b4473247bbc703272ebc8b49362cf3c54e1b8_3280.png', 'Cashier', 'Female', 1, '', 0),
(12, 'Wednesday', 'wednesday@gmail.com', '$2y$10$dgJz2vbwYuVDh0TM7zn7BunzW9jpJQaS6HExB2P3EwOgo43lP098i', '2023-07-03 12:02:31', 'uploads/188e2135e926173ebb76e6894cce1f51e1b3b42d_2500.jpg', 'Cashier', 'Female', 1, '', 0),
(13, 'Power', 'power@gmail.com', '$2y$10$UaaxmelZNHzmRUYG2EtRjuCprMsPOCmxjpClBz68rY1tDv6o8sX1W', '2023-07-03 12:09:34', 'uploads/user/c74fc9e325c707e0f7c4e5bcf94f1bde505985f1_2149.jpg', 'Admin', 'Male', 1, '', 0),
(14, 'Zhara Gonzales', 'zharagon@gmail.com', '$2y$10$W9tl/OeBHy4GNWxxlgOLYeKbPYmpxSMSwVppgCy3UddG9M3OnAQVu', '2024-05-10 06:15:17', NULL, 'Supervisor', 'Female', 1, '', 0),
(20, 'Rhayli', 'rhayli@gmail.com', '$2y$10$ONdTq41AaJ6HKdluYkK7M.AtJTrK.B34KzHW/Q5N6D8vJFScwP5Zq', '2024-05-13 03:10:16', 'uploads/user/727cfe0614525a64ae2b68f61ea2ad2810ac0ba7_1552.png', 'Supervisor', 'Male', 1, '111222', 0),
(21, 'tryexample', 'tryexample@email.com', '$2y$10$J3LeBmQ8iPWBo1XYABw8.uCvF4wRfgCTjkphNk.HAihThMlIsqr.C', '2024-05-15 09:27:33', NULL, 'Cashier', 'Female', 1, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `void_items`
--

CREATE TABLE `void_items` (
  `id` int(11) NOT NULL,
  `barcode` varchar(15) NOT NULL,
  `receipt_no` int(11) NOT NULL,
  `category` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `amount` decimal(10,0) NOT NULL,
  `total` decimal(10,0) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id`);

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
  ADD KEY `email` (`email`),
  ADD KEY `date` (`date`),
  ADD KEY `role` (`role`);

--
-- Indexes for table `void_items`
--
ALTER TABLE `void_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `receipt_no` (`receipt_no`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD KEY `barcode` (`barcode`),
  ADD KEY `date` (`date`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `audit_trail`
--
ALTER TABLE `audit_trail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=256;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `deleted_items`
--
ALTER TABLE `deleted_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=230;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `void_items`
--
ALTER TABLE `void_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;