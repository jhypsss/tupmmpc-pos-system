-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 19, 2024 at 11:01 PM
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
(255, 13, 'Suppliers', 'DELETE', 'DELETED SUPPLIER: Try change', '2024-05-16 00:16:14'),
(256, 13, 'Products', 'ADD', 'NEW ITEM: 2223682510867\nProduct: sample \nQty: 1 \nPrice: 43 \nCategory: Clothing', '2024-05-16 12:39:26'),
(257, 1, 'Products', 'UPDATE', 'UPDATED ITEM: 2223443576258\nBarcode: 2222595564534 → 2223443576258', '2024-05-16 12:57:50'),
(258, 1, 'Products', 'UPDATE', 'UPDATED ITEM: 2223960714790\nBarcode: 2222893703661 → 2223960714790', '2024-05-16 12:58:04'),
(259, 1, 'Products', 'UPDATE', 'UPDATED ITEM: 2223388047139\nBarcode: 2222794658425 → 2223388047139', '2024-05-16 12:58:16'),
(260, 1, 'Products', 'UPDATE', 'UPDATED ITEM: 2223731757377\nBarcode: 2222135063866 → 2223731757377', '2024-05-16 12:58:28'),
(261, 1, 'Products', 'UPDATE', 'UPDATED ITEM: 2223442023546\nBarcode: 2222774991043 → 2223442023546', '2024-05-16 12:59:14'),
(262, 1, 'Products', 'UPDATE', 'UPDATED ITEM: 8998666001702\nBarcode: 2223682510867 → 8998666001702\nProduct Name: sample → Coffee Sample\nCategory: Clothing → Beverages', '2024-05-16 12:59:53'),
(263, 13, 'Products', 'UPDATE', 'UPDATED ITEM: 8998666001702\nCurrent Stock: 0 + 25 = 25', '2024-05-16 14:12:05'),
(264, 13, 'Suppliers', 'ADD', 'NEW SUPPLIER: isa pa  \nCompany Address: isapang company', '2024-05-16 14:50:35'),
(265, 13, 'Suppliers', 'UPDATE', 'UPDATED SUPPLIER: isa pa \nContact Email: kunyare@email.ito → maibanamanto@email.ito', '2024-05-16 14:58:15'),
(266, 1, 'Users', 'DELETE', 'DELETED USER: tryexample \nEmail: tryexample@email.com \nGender: Female \nRole: Cashier', '2024-05-16 15:09:17'),
(267, 6, 'Users', 'UPDATE', 'UPDATED USER: Rhayli\nGender: Male → <?$row[\'gender\']?>', '2024-05-16 15:37:24'),
(268, 6, 'Users', 'UPDATE', 'UPDATED USER: Rhayli\nGender: <?$row → Male', '2024-05-16 15:37:36'),
(269, 6, 'Products', 'UPDATE', 'UPDATED ITEM: 8998666001702\nProduct Image: Modified', '2024-05-16 16:52:07'),
(270, 6, 'Products', 'UPDATE', 'UPDATED ITEM: 8998666001702\nProduct Name: Coffee Sample → Kopiko 3 in One\nPrice: 43.00 → 25.00', '2024-05-16 16:52:26'),
(271, 6, 'Products', 'DELETE', 'DELETED ITEM: 2222881344444 \nProduct Name: Burger \nQty: 196 \nPrice: 10.00\n Category: Snacks', '2024-05-16 16:52:36'),
(272, 6, 'Suppliers', 'UPDATE', 'UPDATED SUPPLIER: sample\nCompany Name: kunyare → sample', '2024-05-16 16:54:34'),
(273, 6, 'Suppliers', 'UPDATE', 'UPDATED SUPPLIER: sample\nCompany Address: feaf → sample address\nContact Person: ito lang nabago → Juan Dela Cruz\nContact Number: 456789 → 0965487123', '2024-05-16 16:54:55'),
(274, 8, 'Categories', 'ADD', 'NEW CATEGORY: Sample Category \nDescription: Category Desc', '2024-05-16 17:03:50'),
(275, 13, 'Users', 'ADD', 'NEW USER: Samantha Berin \nEmail: sam@gmail.com \nGender: Female \nRole: User', '2024-05-16 17:06:13'),
(276, 13, 'Users', 'UPDATE', 'UPDATED USER: Samantha Berin\nGender: Female → <?$row[\'gender\']?>\nRole: User → Cashier', '2024-05-16 17:06:58'),
(277, 13, 'Products', 'ADD', 'NEW ITEM: 2223525334763\nProduct: Tango \nQty: 50 \nPrice: 39 \nCategory: Beverages', '2024-05-16 17:08:00'),
(278, 13, 'Products', 'DELETE', 'DELETED ITEM: 2223780889232 \nProduct Name: Long Envelope \nQty: 61 \nPrice: 25.00\n Category: School Supplies', '2024-05-16 17:08:55'),
(279, 13, 'Users', 'UPDATE', 'UPDATED USER: Samantha Berin\nGender: <?$row → Female', '2024-05-17 15:55:52'),
(280, 13, 'Users', 'UPDATE', 'UPDATED USER: Samantha Berin\nGender: Female → <?$row[\'gender\']?>', '2024-05-17 15:55:58'),
(281, 13, 'Users', 'UPDATE', 'UPDATED USER: Samantha Berin\nGender: <?$row → Female', '2024-05-17 15:56:25'),
(282, 13, 'Users', 'UPDATE', 'UPDATED USER: Samantha Berin', '2024-05-17 15:56:29'),
(283, 13, 'Users', 'UPDATE', 'UPDATED USER: Samantha Berin', '2024-05-17 15:56:52'),
(284, 6, 'Users', 'DELETE', 'DELETED USER: Samantha Berin \nEmail: sam@gmail.com \nGender: Female \nRole: Cashier', '2024-05-18 00:15:40'),
(285, 6, 'Users', 'UPDATE', 'UPDATED USER: Keqing\nPassword: Modified', '2024-05-18 01:14:47'),
(286, 6, 'Users', 'UPDATE', 'UPDATED USER: Keqing\nGender: female → Female\nRole: cashier → Cashier', '2024-05-18 01:14:54'),
(287, 6, 'Users', 'UPDATE', 'UPDATED USER: Keqing\nEmail: keqing@email.com → keqing@gmail.com', '2024-05-18 01:15:58'),
(288, 6, 'Users', 'UPDATE', 'UPDATED USER: Keqing\nRole: Cashier → User', '2024-05-18 01:16:11'),
(289, 6, 'Users', 'UPDATE', 'UPDATED USER: Rhayli\nRole: Supervisor → Manager', '2024-05-18 01:28:55'),
(290, 6, 'Products', 'UPDATE', 'UPDATED ITEM: 8998666001702\nProduct Name: Kopiko 3 in One → Kopiko 3 in 1', '2024-05-18 17:06:03'),
(291, 6, 'Users', 'UPDATE', 'UPDATED USER: Samantha Maurice\nRole: Cashier → Manager', '2024-05-18 22:57:43');

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
(26, 'Vegetables', 'Potatoes, onions, carrots, salad greens, broccoli, peppers, tomatoes, cucumbers, etc.', 0),
(30, 'Sample Category', 'Category Desc', 0);

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
(23, 3, 'Suppliers', 13, '2024-05-16 00:16:14'),
(24, 21, 'Users', 1, '2024-05-16 15:09:17'),
(25, 4, 'Products', 6, '2024-05-16 16:52:36'),
(26, 31, 'Products', 13, '2024-05-16 17:08:55'),
(27, 22, 'Users', 6, '2024-05-18 00:15:40');

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
(3, '2222947895764', 'Crisps', 176, 4.95, 'uploads/a376a3a3f34dc21971ca40ac6dd6664585c197a6_4817.jpg', '1', '2022-01-09 08:46:29', 69, 'Snacks', 0),
(4, '2222881344444', 'Burger', 196, 10.00, 'uploads/c322c54a3249e75ca46347a2c4ec9385672cb8e3_5698.jpg', '1', '2022-01-09 08:47:02', 18, 'Snacks', 1),
(5, '1234', 'So good milk', 62, 20.00, 'uploads/e149b8702ddb43e5cda3c10803c563203b27cfc0_6896.jpg', '1', '2022-01-09 08:47:54', 47, 'Dairy Products', 0),
(6, '2222925913231', 'OMO SOFTENER', 64, 50.00, 'uploads/e80200cc753ea342725ba080f668144fe4c763b9_7977.jpg', 'Unknown', '2022-01-16 08:35:24', 69, 'Detergent', 0),
(8, '2223443576258', '7 UP', 0, 34.00, 'uploads/a6f424034ca00dc2c3b55761f2b1c31d689ca215_6797.jpg', '6', '2023-07-01 12:15:13', 36, 'Beverages', 0),
(10, '2222974243584', 'Caramel Moolatte', 0, 5.00, 'uploads/7efe697d3a3cafad54574764253c1c4e5ee3de93_3723.png', '1', '2023-07-01 12:59:42', 13, 'Frozen Foods', 0),
(11, '2222123200968', 'Monster', 159, 45.00, 'uploads/40fbc31c9795970c2b93419196a07354829db713_1986.jpg', '6', '2023-07-01 16:25:41', 33, 'Beverages', 0),
(15, '2223731757377', 'Cola Zero in can', 0, 39.00, 'uploads/a54741bf6d71e0b52ce6cd34d0d526c6dd4e94a6_4751.jpg', '6', '2023-07-03 11:07:15', 23, 'Beverages', 0),
(16, '2222877211304', 'Mirinda', 0, 35.00, 'uploads/e5bc61c49ab567c8e2a921d735f77c19955571c1_5489.jpg', '6', '2023-07-03 11:08:04', 3, 'Beverages', 0),
(17, '2223442023546', 'Spindrift', 93, 50.00, 'uploads/5e07651f0573ad1d5851ce6ea26eae85d59b67dc_2952.jpg', '6', '2023-07-03 11:08:40', 3, 'Beverages', 0),
(18, '2223388047139', 'Boost Energy', 44, 50.00, 'uploads/5edd64c0e275bd3cb6e9940773da659adfb228dc_9357.jpg', '6', '2023-07-03 13:20:21', 5, 'Beverages', 0),
(19, '2223960714790', 'Fifa', 5, 23.00, 'uploads/product/a5ff699d375e9743390192ba1674647dfc51025d_2043.jpg', '6', '2023-07-03 14:11:53', 33, 'Beverages', 0),
(23, '2223519322434', 'CDO Luncheon Meat 350g', 67, 150.00, 'uploads/product85853e6e9d47bdb7286d1076c1aeabdb0ebe74bc_9138.jpg', '1', '2024-03-26 07:16:38', 22, 'Canned Goods', 0),
(24, '2223375580155', 'Lucky Me Beef Noodles', 95, 25.00, 'uploads/product7eb433368ec83423b493eb98b515917409b145f7_8232.jpg', '1', '2024-03-26 07:21:19', 1, 'Pasta & Noodles', 1),
(25, '2223686064536', 'ID Lace', 100, 25.00, 'uploads/product6f21ec36b38e2139a8b5a643e1fcb6b5330e45d1_6010.jfif', '1', '2024-04-02 02:33:17', 0, 'School Supplies', 1),
(26, '2223155520988', 'Black T-Shirt', 96, 150.00, 'uploads/product5ea1733a8d127449fd3ad4ed51938de31dd3e668_2079.jpg', '1', '2024-04-02 02:33:45', 2, 'Clothing', 0),
(27, '2223636584775', 'White T-Shirt', 23, 150.00, 'uploads/productf57de05611fffd9ab731fb1ee845793193845dc0_9018.jpg', '1', '2024-04-02 02:34:19', 2, 'Clothing', 0),
(30, '2223434399143', 'Snapback Hat', 53, 75.00, 'uploads/product3e434d486cd8acf99a8cd93bf97c966f5009d804_9935.jpg', '1', '2024-04-02 02:41:19', 0, 'Clothing', 1),
(31, '2223780889232', 'Long Envelope', 61, 25.00, 'uploads/product/a7dd6ef7ce24f5af8f33242b463fac7e72630816_6287.jpg', '6', '2024-04-02 02:41:48', 0, 'School Supplies', 1),
(70, '2223921386792', 'alfadogs', 2, 45.00, 'uploads/product2e97d71d6565dd572ff5f0c9d85630eb43475ffd_7100.jpg', '13', '2024-05-14 19:12:56', 0, 'Snacks', 1),
(71, '2223180878842', '2Dkun sticker', 12, 15.00, 'uploads/product886eb2a3918f07e75438af918699640273d1e423_5736.jpg', '6', '2024-05-15 10:38:10', 0, '---', 1),
(72, '222378939232', 'Alfadogs', 1, 55.00, 'uploads/product/775a7935b90d0f0f9a20c772fbb18ce8d22861d0_5907.png', '6', '2024-05-15 14:58:31', 0, 'Snacks', 1),
(73, '8998666001702', 'Kopiko 3 in 1', 24, 25.00, 'uploads/product/5e4e4c01fefe22e5f14717ecd70dd58bcc2da777_2060.jpg', '13', '2024-05-16 12:39:26', 2, 'Beverages', 0),
(74, '2223525334763', 'Tango', 49, 39.00, 'uploads/product1498ec696e35eb4f91eb6f8d2c3d391653b815c4_4689.png', '13', '2024-05-16 17:08:00', 1, 'Beverages', 0);

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
  `category` varchar(255) NOT NULL,
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

INSERT INTO `sales` (`id`, `barcode`, `receipt_no`, `description`, `category`, `qty`, `amount`, `total`, `date`, `user_id`, `payment_method`) VALUES
(7, '1234', 3, 'So good milk', 'Dairy Producs', 1, 20.00, 20.00, '2024-02-17 11:11:37', '1', ''),
(8, '2222472108593', 4, 'Biscuits', '', 2, 10.95, 21.90, '2024-02-17 19:50:49', '1', ''),
(9, '2222472108593', 5, 'Biscuits', '', 2, 10.95, 21.90, '2024-03-17 19:52:19', '1', ''),
(10, '2222472108593', 6, 'Biscuits', '', 1, 10.95, 10.95, '2024-03-17 19:52:40', '1', ''),
(11, '2222925913231', 7, 'OMO SOFTENER', 'Detergent', 1, 50.00, 50.00, '2023-01-17 19:56:02', '1', ''),
(12, '1234', 8, 'So good milk', 'Dairy Producs', 2, 20.00, 40.00, '2023-01-17 20:00:02', '1', ''),
(13, '1234', 9, 'So good milk', 'Dairy Producs', 1, 20.00, 20.00, '2023-04-17 19:57:44', '1', ''),
(14, '1234', 10, 'So good milk', 'Dairy Producs', 3, 20.00, 60.00, '2023-04-17 19:57:53', '1', ''),
(207, '1234', 8, 'So good milk', 'Dairy Producs', 2, 20.00, 40.00, '2024-04-01 20:00:02', '1', ''),
(208, '1234', 9, 'So good milk', 'Dairy Producs', 1, 20.00, 20.00, '2024-04-01 20:00:02', '1', ''),
(209, '1234', 10, 'So good milk', 'Dairy Producs', 3, 20.00, 60.00, '2024-04-02 20:00:02', '1', ''),
(210, '2222925913231', 11, 'OMO SOFTENER', 'Detergent', 1, 50.00, 50.00, '2024-05-15 14:04:05', '13', 'CASH '),
(211, '2222595564534', 11, '7 UP', 'Beverages', 1, 34.00, 34.00, '2024-05-15 14:04:05', '13', 'CASH '),
(212, '2222925913231', 12, 'OMO SOFTENER', 'Detergent', 1, 50.00, 50.00, '2024-05-15 14:06:43', '6', 'CASH '),
(213, '2222974243584', 12, 'Caramel Moolatte', 'Beverages', 1, 5.00, 5.00, '2024-05-15 14:06:43', '6', 'CASH '),
(214, '2223519322434', 12, 'CDO Luncheon Meat 350g', 'Canned Goods', 2, 150.00, 300.00, '2024-05-15 14:06:43', '6', 'CASH '),
(215, '2222925913231', 13, 'OMO SOFTENER', 'Detergent', 1, 50.00, 50.00, '2024-05-15 15:15:31', '13', 'CASH '),
(216, '1234', 13, 'So good milk', 'Dairy Producs', 1, 20.00, 20.00, '2024-05-15 15:15:31', '13', 'CASH '),
(217, '2222881344444', 14, 'Burger', '', 1, 10.00, 10.00, '2024-05-15 15:16:57', '13', 'CASH '),
(218, '1234', 14, 'So good milk', 'Dairy Producs', 1, 20.00, 20.00, '2024-05-15 15:16:57', '13', 'CASH '),
(219, '2222123200968', 14, 'Monster', 'Beverages', 1, 45.00, 45.00, '2024-05-15 15:16:57', '13', 'CASH '),
(220, '2222881344444', 15, 'Burger', '', 1, 10.00, 10.00, '2024-05-15 15:17:47', '13', 'CASH '),
(221, '1234', 16, 'So good milk', 'Dairy Producs', 1, 20.00, 20.00, '2024-05-15 15:18:17', '13', 'CASH '),
(222, '2222123200968', 16, 'Monster', 'Beverages', 1, 45.00, 45.00, '2024-05-15 15:18:17', '13', 'CASH '),
(223, '2222881344444', 17, 'Burger', '', 1, 10.00, 10.00, '2024-05-15 15:18:39', '13', 'CASH '),
(224, '1234', 18, 'So good milk', 'Dairy Producs', 1, 20.00, 20.00, '2024-05-15 15:22:23', '13', 'CASH '),
(225, '2222881344444', 19, 'Burger', '', 1, 10.00, 10.00, '2024-05-15 15:23:29', '13', 'CASH '),
(226, '2223375580155', 20, 'Lucky Me Beef Noodles', '', 5, 25.00, 125.00, '2024-05-15 22:44:20', '6', 'CASH '),
(227, '2223519322434', 20, 'CDO Luncheon Meat 350g', 'Canned Goods', 3, 150.00, 450.00, '2024-05-15 22:44:20', '6', 'CASH '),
(228, '2223519322434', 21, 'CDO Luncheon Meat 350g', 'Canned Goods', 3, 150.00, 450.00, '2024-05-15 22:46:17', '6', 'CASH '),
(229, '2222595564534', 21, '7 UP', 'Beverages', 5, 34.00, 170.00, '2024-05-15 22:46:17', '6', 'CASH '),
(230, '2223519322434', 22, 'CDO Luncheon Meat 350g', 'Canned Goods', 1, 150.00, 150.00, '2024-05-16 09:17:00', '1', 'CASH '),
(231, '8998666001702', 23, 'Coffee Sample', 'Beverages', 1, 43.00, 43.00, '2024-05-16 13:07:22', '12', 'CASH '),
(232, '2223960714790', 24, 'Fifa', 'Beverages', 1, 23.00, 23.00, '2024-05-16 15:41:04', '9', 'CASH '),
(233, '2222877211304', 24, 'Mirinda', '', 1, 35.00, 35.00, '2024-05-16 15:41:04', '9', 'CASH '),
(234, '2222123200968', 25, 'Monster', 'Beverages', 1, 45.00, 45.00, '2024-05-16 15:44:17', '9', 'CASH '),
(235, '2223519322434', 25, 'CDO Luncheon Meat 350g', 'Canned Goods', 2, 150.00, 300.00, '2024-05-16 15:44:17', '9', 'CASH '),
(236, '1234', 26, 'So good milk', 'Dairy Producs', 1, 20.00, 20.00, '2024-05-16 16:00:28', '13', 'CASH '),
(237, '2223443576258', 26, '7 UP', 'Beverages', 2, 34.00, 68.00, '2024-05-16 16:00:28', '13', 'CASH '),
(238, '2222974243584', 27, 'Caramel Moolatte', 'Beverages', 15, 5.00, 75.00, '2024-05-16 16:59:01', '8', 'CASH '),
(239, '2222877211304', 28, 'Mirinda', '', 28, 35.00, 980.00, '2024-05-16 16:59:57', '8', 'CASH '),
(240, '1234', 29, 'So good milk', 'Dairy Producs', 1, 20.00, 20.00, '2024-05-17 16:24:33', '13', 'CASH '),
(241, '2223519322434', 29, 'CDO Luncheon Meat 350g', 'Canned Goods', 2, 150.00, 300.00, '2024-05-17 16:24:33', '13', 'CASH '),
(242, '2222123200968', 29, 'Monster', 'Beverages', 1, 45.00, 45.00, '2024-05-17 16:24:33', '13', 'CASH '),
(243, '2222925913231', 29, 'OMO SOFTENER', 'Detergent', 4, 50.00, 200.00, '2024-05-17 16:24:33', '13', 'CASH '),
(244, '2223960714790', 29, 'Fifa', 'Beverages', 2, 23.00, 46.00, '2024-05-17 16:24:33', '13', 'CASH '),
(245, '2222974243584', 30, 'Caramel Moolatte', 'Beverages', 2, 5.00, 10.00, '2024-05-17 16:44:17', '13', 'CASH '),
(246, '2223960714790', 30, 'Fifa', 'Beverages', 1, 23.00, 23.00, '2024-05-17 16:44:17', '13', 'CASH '),
(247, '2223519322434', 30, 'CDO Luncheon Meat 350g', 'Canned Goods', 1, 150.00, 150.00, '2024-05-17 16:44:17', '13', 'CASH '),
(248, '2223443576258', 30, '7 UP', 'Beverages', 1, 34.00, 34.00, '2024-05-17 16:44:17', '13', 'CASH '),
(249, '2222123200968', 30, 'Monster', 'Beverages', 1, 45.00, 45.00, '2024-05-17 16:44:17', '13', 'CASH '),
(250, '2222974243584', 31, 'Caramel Moolatte', 'Beverages', 1, 5.00, 5.00, '2024-05-17 16:49:41', '13', 'CASH '),
(251, '1234', 31, 'So good milk', 'Dairy Producs', 1, 20.00, 20.00, '2024-05-17 16:49:41', '13', 'CASH '),
(252, '2222947895764', 31, 'Crisps', '', 1, 4.95, 4.95, '2024-05-17 16:49:41', '13', 'CASH '),
(253, '2223443576258', 31, '7 UP', 'Beverages', 1, 34.00, 34.00, '2024-05-17 16:49:41', '13', 'CASH '),
(254, '2223519322434', 31, 'CDO Luncheon Meat 350g', 'Canned Goods', 1, 150.00, 150.00, '2024-05-17 16:49:41', '13', 'CASH '),
(255, '2223960714790', 31, 'Fifa', 'Beverages', 1, 23.00, 23.00, '2024-05-17 16:49:41', '13', 'CASH '),
(256, '2222974243584', 32, 'Caramel Moolatte', 'Beverages', 1, 5.00, 5.00, '2024-05-17 16:56:50', '13', 'CASH '),
(257, '1234', 32, 'So good milk', 'Dairy Producs', 1, 20.00, 20.00, '2024-05-17 16:56:50', '13', 'CASH '),
(258, '2222925913231', 32, 'OMO SOFTENER', 'Detergent', 1, 50.00, 50.00, '2024-05-17 16:56:50', '13', 'CASH '),
(259, '2222974243584', 33, 'Caramel Moolatte', 'Beverages', 1, 5.00, 5.00, '2024-05-17 17:05:37', '13', 'CASH '),
(260, '1234', 33, 'So good milk', 'Dairy Producs', 1, 20.00, 20.00, '2024-05-17 17:05:37', '13', 'CASH '),
(261, '2223519322434', 33, 'CDO Luncheon Meat 350g', 'Canned Goods', 1, 150.00, 150.00, '2024-05-17 17:05:37', '13', 'CASH '),
(262, '2223960714790', 33, 'Fifa', 'Beverages', 1, 23.00, 23.00, '2024-05-17 17:05:37', '13', 'CASH '),
(263, '2222123200968', 34, 'Monster', 'Beverages', 1, 45.00, 45.00, '2024-05-17 17:05:58', '13', 'CASH '),
(264, '2223960714790', 34, 'Fifa', 'Beverages', 1, 23.00, 23.00, '2024-05-17 17:05:58', '13', 'CASH '),
(265, '2222925913231', 35, 'OMO SOFTENER', 'Detergent', 1, 50.00, 50.00, '2024-05-17 17:09:29', '13', 'CASH '),
(266, '2223519322434', 35, 'CDO Luncheon Meat 350g', 'Canned Goods', 1, 150.00, 150.00, '2024-05-17 17:09:29', '13', 'CASH '),
(267, '2223443576258', 35, '7 UP', 'Beverages', 1, 34.00, 34.00, '2024-05-17 17:09:29', '13', 'CASH '),
(268, '2222947895764', 35, 'Crisps', '', 1, 4.95, 4.95, '2024-05-17 17:09:29', '13', 'CASH '),
(269, '1234', 36, 'So good milk', 'Dairy Producs', 1, 20.00, 20.00, '2024-05-17 17:10:01', '13', 'CASH '),
(270, '2222123200968', 36, 'Monster', 'Beverages', 1, 45.00, 45.00, '2024-05-17 17:10:01', '13', 'CASH '),
(271, '2223960714790', 36, 'Fifa', 'Beverages', 1, 23.00, 23.00, '2024-05-17 17:10:01', '13', 'CASH '),
(272, '2222974243584', 37, 'Caramel Moolatte', 'Beverages', 1, 5.00, 5.00, '2024-05-17 17:10:44', '13', 'CASH '),
(273, '1234', 37, 'So good milk', 'Dairy Producs', 1, 20.00, 20.00, '2024-05-17 17:10:44', '13', 'CASH '),
(274, '2223443576258', 37, '7 UP', 'Beverages', 1, 34.00, 34.00, '2024-05-17 17:10:44', '13', 'CASH '),
(275, '1234', 38, 'So good milk', 'Dairy Producs', 1, 20.00, 20.00, '2024-05-17 17:13:22', '13', 'CASH '),
(276, '2223960714790', 38, 'Fifa', 'Beverages', 2, 23.00, 46.00, '2024-05-17 17:13:22', '13', 'CASH '),
(277, '2223443576258', 38, '7 UP', 'Beverages', 1, 34.00, 34.00, '2024-05-17 17:15:02', '9', 'CASH '),
(278, '2223731757377', 38, 'Cola Zero in can', 'Beverages', 1, 39.00, 39.00, '2024-05-17 17:15:02', '9', 'CASH '),
(279, '2223960714790', 38, 'Fifa', 'Beverages', 1, 23.00, 23.00, '2024-05-17 17:15:02', '9', 'CASH '),
(280, '2223443576258', 38, '7 UP', 'Beverages', 1, 34.00, 34.00, '2024-05-17 17:16:24', '9', 'CASH '),
(281, '1234', 38, 'So good milk', 'Dairy Producs', 1, 20.00, 20.00, '2024-05-17 17:16:24', '9', 'CASH '),
(282, '2223731757377', 38, 'Cola Zero in can', 'Beverages', 1, 39.00, 39.00, '2024-05-17 17:16:24', '9', 'CASH '),
(283, '2223519322434', 38, 'CDO Luncheon Meat 350g', 'Canned Goods', 1, 150.00, 150.00, '2024-05-17 17:16:24', '9', 'CASH '),
(284, '2223960714790', 38, 'Fifa', 'Beverages', 1, 23.00, 23.00, '2024-05-17 17:16:24', '9', 'CASH '),
(285, '1234', 39, 'So good milk', 'Dairy Producs', 1, 20.00, 20.00, '2024-05-17 17:16:48', '9', 'CASH '),
(286, '2222123200968', 39, 'Monster', 'Beverages', 1, 45.00, 45.00, '2024-05-17 17:16:48', '9', 'CASH '),
(287, '2223443576258', 39, '7 UP', 'Beverages', 2, 34.00, 68.00, '2024-05-17 17:16:48', '9', 'CASH '),
(288, '2223731757377', 39, 'Cola Zero in can', 'Beverages', 1, 39.00, 39.00, '2024-05-17 17:20:38', '9', 'CASH '),
(289, '2223443576258', 39, '7 UP', 'Beverages', 1, 34.00, 34.00, '2024-05-17 17:20:38', '9', 'CASH '),
(290, '2223960714790', 39, 'Fifa', 'Beverages', 1, 23.00, 23.00, '2024-05-17 17:20:38', '9', 'CASH '),
(291, '1234', 41, 'So good milk', 'Dairy Producs', 1, 20.00, 20.00, '2024-05-17 17:25:29', '9', 'CASH '),
(292, '2223443576258', 42, '7 UP', 'Beverages', 1, 34.00, 34.00, '2024-05-17 17:25:29', '9', 'CASH '),
(293, '2223731757377', 43, 'Cola Zero in can', 'Beverages', 1, 39.00, 39.00, '2024-05-17 17:25:29', '9', 'CASH '),
(294, '2223443576258', 44, '7 UP', 'Beverages', 1, 34.00, 34.00, '2024-05-17 17:27:31', '9', 'CASH '),
(295, '2223731757377', 44, 'Cola Zero in can', 'Beverages', 2, 39.00, 78.00, '2024-05-17 17:27:31', '9', 'CASH '),
(296, '2223519322434', 44, 'CDO Luncheon Meat 350g', 'Canned Goods', 1, 150.00, 150.00, '2024-05-17 17:27:31', '9', 'CASH '),
(297, '2223443576258', 45, '7 UP', 'Beverages', 1, 34.00, 34.00, '2024-05-17 18:37:24', '9', 'CASH '),
(298, '1234', 45, 'So good milk', 'Dairy Producs', 1, 20.00, 20.00, '2024-05-17 18:37:24', '9', 'CASH '),
(299, '2222123200968', 45, 'Monster', 'Beverages', 1, 45.00, 45.00, '2024-05-17 18:37:24', '9', 'CASH '),
(300, '2223731757377', 45, 'Cola Zero in can', 'Beverages', 1, 39.00, 39.00, '2024-05-17 18:37:24', '9', 'CASH '),
(301, '2222947895764', 46, 'Crisps', '', 1, 4.95, 4.95, '2024-05-17 18:40:22', '13', 'CASH '),
(302, '2223960714790', 46, 'Fifa', 'Beverages', 1, 23.00, 23.00, '2024-05-17 18:40:22', '13', 'CASH '),
(303, '2223519322434', 46, 'CDO Luncheon Meat 350g', 'Canned Goods', 1, 150.00, 150.00, '2024-05-17 18:40:22', '13', 'CASH '),
(304, '1234', 46, 'So good milk', 'Dairy Producs', 1, 20.00, 20.00, '2024-05-17 18:40:22', '13', 'CASH '),
(305, '2223731757377', 47, 'Cola Zero in can', 'Beverages', 3, 39.00, 117.00, '2024-05-17 18:42:40', '9', 'CASH '),
(306, '2222123200968', 47, 'Monster', 'Beverages', 2, 45.00, 90.00, '2024-05-17 18:42:40', '9', 'CASH '),
(307, '2223731757377', 48, 'Cola Zero in can', 'Beverages', 1, 39.00, 39.00, '2024-05-17 18:49:46', '9', 'CASH '),
(308, '2223960714790', 48, 'Fifa', 'Beverages', 1, 23.00, 23.00, '2024-05-17 18:49:46', '9', 'CASH '),
(309, '2222123200968', 48, 'Monster', 'Beverages', 1, 45.00, 45.00, '2024-05-17 18:49:46', '9', 'CASH '),
(310, '2223443576258', 48, '7 UP', 'Beverages', 1, 34.00, 34.00, '2024-05-17 18:49:46', '9', 'CASH '),
(311, '2223731757377', 49, 'Cola Zero in can', 'Beverages', 1, 39.00, 39.00, '2024-05-17 18:50:09', '9', 'CASH '),
(312, '2223960714790', 49, 'Fifa', 'Beverages', 1, 23.00, 23.00, '2024-05-17 18:50:09', '9', 'CASH '),
(313, '2223519322434', 49, 'CDO Luncheon Meat 350g', 'Canned Goods', 1, 150.00, 150.00, '2024-05-17 18:50:09', '9', 'CASH '),
(314, '2223443576258', 49, '7 UP', 'Beverages', 1, 34.00, 34.00, '2024-05-17 18:50:09', '9', 'CASH '),
(315, '2223443576258', 50, '7 UP', 'Beverages', 1, 34.00, 34.00, '2024-05-17 19:02:18', '9', 'CASH '),
(316, '2222123200968', 50, 'Monster', 'Beverages', 1, 45.00, 45.00, '2024-05-17 19:02:18', '9', 'CASH '),
(317, '2223519322434', 50, 'CDO Luncheon Meat 350g', 'Canned Goods', 1, 150.00, 150.00, '2024-05-17 19:02:18', '9', 'CASH '),
(318, '2223731757377', 50, 'Cola Zero in can', 'Beverages', 1, 39.00, 39.00, '2024-05-17 19:02:18', '9', 'CASH '),
(319, '2223731757377', 51, 'Cola Zero in can', 'Beverages', 1, 39.00, 39.00, '2024-05-17 19:02:48', '9', 'CASH '),
(320, '2223960714790', 51, 'Fifa', 'Beverages', 1, 23.00, 23.00, '2024-05-17 19:02:48', '9', 'CASH '),
(321, '2223443576258', 51, '7 UP', 'Beverages', 1, 34.00, 34.00, '2024-05-17 19:02:48', '9', 'CASH '),
(322, '2223443576258', 52, '7 UP', 'Beverages', 1, 34.00, 34.00, '2024-05-17 19:03:03', '13', 'CASH '),
(323, '2223519322434', 52, 'CDO Luncheon Meat 350g', 'Canned Goods', 1, 150.00, 150.00, '2024-05-17 19:03:03', '13', 'CASH '),
(324, '2222123200968', 52, 'Monster', 'Beverages', 1, 45.00, 45.00, '2024-05-17 19:03:03', '13', 'CASH '),
(325, '2223731757377', 53, 'Cola Zero in can', 'Beverages', 1, 39.00, 39.00, '2024-05-17 19:03:17', '13', 'CASH '),
(326, '2223443576258', 53, '7 UP', 'Beverages', 1, 34.00, 34.00, '2024-05-17 19:03:17', '13', 'CASH '),
(327, '2223519322434', 53, 'CDO Luncheon Meat 350g', 'Canned Goods', 1, 150.00, 150.00, '2024-05-17 19:03:17', '13', 'CASH '),
(328, '2222123200968', 54, 'Monster', 'Beverages', 2, 45.00, 90.00, '2024-05-17 19:05:44', '9', 'CASH '),
(329, '2223731757377', 54, 'Cola Zero in can', 'Beverages', 1, 39.00, 39.00, '2024-05-17 19:05:44', '9', 'CASH '),
(330, '2223443576258', 54, '7 UP', 'Beverages', 1, 34.00, 34.00, '2024-05-17 19:05:44', '9', 'CASH '),
(331, '2223443576258', 55, '7 UP', 'Beverages', 1, 34.00, 34.00, '2024-05-17 19:09:35', '9', 'CASH '),
(332, '2223960714790', 55, 'Fifa', 'Beverages', 1, 23.00, 23.00, '2024-05-17 19:09:35', '9', 'CASH '),
(333, '2223731757377', 55, 'Cola Zero in can', 'Beverages', 1, 39.00, 39.00, '2024-05-17 19:09:35', '9', 'CASH '),
(334, '2223519322434', 55, 'CDO Luncheon Meat 350g', 'Canned Goods', 1, 150.00, 150.00, '2024-05-17 19:09:35', '9', 'CASH '),
(335, '2223443576258', 56, '7 UP', 'Beverages', 1, 34.00, 34.00, '2024-05-17 19:10:34', '9', 'CASH '),
(336, '2223960714790', 56, 'Fifa', 'Beverages', 1, 23.00, 23.00, '2024-05-17 19:10:34', '9', 'CASH '),
(337, '1234', 57, 'So good milk', 'Dairy Producs', 1, 20.00, 20.00, '2024-05-17 19:10:48', '9', 'CASH '),
(338, '2223731757377', 57, 'Cola Zero in can', 'Beverages', 1, 39.00, 39.00, '2024-05-17 19:10:48', '9', 'CASH '),
(339, '2223443576258', 58, '7 UP', 'Beverages', 2, 34.00, 68.00, '2024-05-17 19:11:10', '9', 'CASH '),
(340, '2223731757377', 58, 'Cola Zero in can', 'Beverages', 1, 39.00, 39.00, '2024-05-17 19:11:10', '9', 'CASH '),
(341, '2223443576258', 59, '7 UP', 'Beverages', 3, 34.00, 102.00, '2024-05-17 19:16:20', '13', 'CASH '),
(342, '2222925913231', 60, 'OMO SOFTENER', 'Detergent', 1, 50.00, 50.00, '2024-05-17 19:22:08', '13', 'CASH '),
(343, '2222123200968', 60, 'Monster', 'Beverages', 1, 45.00, 45.00, '2024-05-17 19:22:08', '13', 'CASH '),
(344, '2223731757377', 61, 'Cola Zero in can', 'Beverages', 1, 39.00, 39.00, '2024-05-17 19:23:54', '13', 'CASH '),
(345, '2223443576258', 61, '7 UP', 'Beverages', 1, 34.00, 34.00, '2024-05-17 19:23:54', '13', 'CASH '),
(346, '2223443576258', 62, '7 UP', 'Beverages', 1, 34.00, 34.00, '2024-05-17 19:45:41', '13', 'CASH '),
(347, '2223960714790', 62, 'Fifa', 'Beverages', 1, 23.00, 23.00, '2024-05-17 19:45:41', '13', 'CASH '),
(348, '2223519322434', 62, 'CDO Luncheon Meat 350g', 'Canned Goods', 1, 150.00, 150.00, '2024-05-17 19:45:41', '13', 'CASH '),
(349, '2223731757377', 62, 'Cola Zero in can', 'Beverages', 1, 39.00, 39.00, '2024-05-17 19:45:41', '13', 'CASH '),
(350, '1234', 63, 'So good milk', 'Dairy Producs', 1, 20.00, 20.00, '2024-05-17 19:48:33', '13', 'CASH '),
(351, '2222123200968', 64, 'Monster', 'Beverages', 2, 45.00, 90.00, '2024-05-17 19:49:33', '13', 'CASH '),
(352, '2223443576258', 64, '7 UP', 'Beverages', 1, 34.00, 34.00, '2024-05-17 19:49:33', '13', 'CASH '),
(353, '2223960714790', 65, 'Fifa', 'Beverages', 1, 23.00, 23.00, '2024-05-17 19:50:27', '13', 'CASH '),
(354, '2223731757377', 65, 'Cola Zero in can', 'Beverages', 1, 39.00, 39.00, '2024-05-17 19:50:27', '13', 'CASH '),
(355, '2223443576258', 65, '7 UP', 'Beverages', 1, 34.00, 34.00, '2024-05-17 19:50:27', '13', 'CASH '),
(356, '2223443576258', 66, '7 UP', 'Beverages', 2, 34.00, 68.00, '2024-05-17 19:51:58', '13', 'CASH '),
(357, '2223519322434', 66, 'CDO Luncheon Meat 350g', 'Canned Goods', 3, 150.00, 450.00, '2024-05-17 19:51:58', '13', 'CASH '),
(358, '1234', 66, 'So good milk', 'Dairy Producs', 1, 20.00, 20.00, '2024-05-17 19:51:58', '13', 'CASH '),
(359, '2222123200968', 66, 'Monster', 'Beverages', 1, 45.00, 45.00, '2024-05-17 19:51:58', '13', 'CASH '),
(360, '2223388047139', 66, 'Boost Energy', 'Beverages', 1, 50.00, 50.00, '2024-05-17 19:51:58', '13', 'CASH '),
(361, '2223155520988', 66, 'Black T-Shirt', 'Clothing', 2, 150.00, 300.00, '2024-05-17 19:51:58', '13', 'CASH '),
(362, '2223636584775', 66, 'White T-Shirt', 'Clothing', 2, 150.00, 300.00, '2024-05-17 19:51:58', '13', 'CASH '),
(363, '2223443576258', 67, '7 UP', 'Beverages', 1, 34.00, 34.00, '2024-05-17 20:09:54', '13', 'CASH '),
(364, '2223960714790', 67, 'Fifa', 'Beverages', 1, 23.00, 23.00, '2024-05-17 20:09:54', '13', 'CASH '),
(365, '2222123200968', 67, 'Monster', 'Beverages', 1, 45.00, 45.00, '2024-05-17 20:09:54', '13', 'CASH '),
(366, '2223731757377', 67, 'Cola Zero in can', 'Beverages', 1, 39.00, 39.00, '2024-05-17 20:09:54', '13', 'CASH '),
(367, '2222947895764', 68, 'Crisps', '', 1, 4.95, 4.95, '2024-05-17 20:14:20', '13', ' '),
(368, '2223960714790', 68, 'Fifa', 'Beverages', 1, 23.00, 23.00, '2024-05-17 20:14:20', '13', ' '),
(369, '2223443576258', 68, '7 UP', 'Beverages', 2, 34.00, 68.00, '2024-05-17 20:14:20', '13', ' '),
(370, '2223731757377', 68, 'Cola Zero in can', 'Beverages', 1, 39.00, 39.00, '2024-05-17 20:14:20', '13', ' '),
(371, '2223443576258', 69, '7 UP', 'Beverages', 3, 34.00, 102.00, '2024-05-18 17:54:30', '9', ' '),
(372, '2222925913231', 70, 'OMO SOFTENER', 'Detergent', 1, 50.00, 50.00, '2024-05-18 18:23:40', '6', ' '),
(373, '2223960714790', 70, 'Fifa', 'Beverages', 1, 23.00, 23.00, '2024-05-18 18:23:40', '6', ' '),
(374, '2222123200968', 70, 'Monster', 'Beverages', 1, 45.00, 45.00, '2024-05-18 18:23:40', '6', ' '),
(375, '2223731757377', 71, 'Cola Zero in can', 'Beverages', 1, 39.00, 39.00, '2024-05-18 18:35:22', '6', ' '),
(376, '2222123200968', 71, 'Monster', 'Beverages', 1, 45.00, 45.00, '2024-05-18 18:35:22', '6', ' '),
(377, '2223960714790', 72, 'Fifa', 'Beverages', 4, 23.00, 92.00, '2024-05-18 18:42:36', '6', ' '),
(378, '1234', 72, 'So good milk', 'Dairy Producs', 5, 20.00, 100.00, '2024-05-18 18:42:36', '6', ' '),
(379, '2222947895764', 72, 'Crisps', '', 1, 4.95, 4.95, '2024-05-18 18:42:36', '6', ' '),
(380, '2223519322434', 73, 'CDO Luncheon Meat 350g', 'Canned Goods', 3, 150.00, 450.00, '2024-05-18 20:04:52', '9', ' '),
(381, '1234', 73, 'So good milk', 'Dairy Producs', 1, 20.00, 20.00, '2024-05-18 20:04:52', '9', ' '),
(382, '2222925913231', 73, 'OMO SOFTENER', 'Detergent', 1, 50.00, 50.00, '2024-05-18 20:04:52', '9', ' '),
(383, '2222123200968', 73, 'Monster', 'Beverages', 1, 45.00, 45.00, '2024-05-18 20:04:52', '9', ' '),
(384, '1234', 74, 'So good milk', 'Dairy Producs', 1, 20.00, 20.00, '2024-05-18 20:45:35', '6', ' '),
(385, '2222947895764', 74, 'Crisps', '', 2, 4.95, 9.90, '2024-05-18 20:45:35', '6', ' '),
(386, '2222123200968', 74, 'Monster', 'Beverages', 1, 45.00, 45.00, '2024-05-18 20:45:35', '6', ' '),
(387, '2223960714790', 75, 'Fifa', 'Beverages', 2, 23.00, 46.00, '2024-05-18 20:46:11', '6', ' '),
(388, '2222123200968', 75, 'Monster', 'Beverages', 1, 45.00, 45.00, '2024-05-18 20:46:11', '6', ' '),
(389, '2223960714790', 76, 'Fifa', 'Beverages', 4, 23.00, 92.00, '2024-05-18 20:51:51', '6', ' '),
(390, '2222123200968', 76, 'Monster', 'Beverages', 6, 45.00, 270.00, '2024-05-18 20:51:51', '6', ' '),
(391, '2222123200968', 77, 'Monster', 'Beverages', 4, 45.00, 180.00, '2024-05-18 20:52:08', '6', ' '),
(392, '2223960714790', 78, 'Fifa', 'Beverages', 3, 23.00, 69.00, '2024-05-18 21:06:08', '9', ' '),
(393, '2222123200968', 78, 'Monster', 'Beverages', 1, 45.00, 45.00, '2024-05-18 21:06:08', '9', ' '),
(394, '2223960714790', 79, 'Fifa', 'Beverages', 2, 23.00, 46.00, '2024-05-18 21:06:52', '9', ' '),
(395, '2222123200968', 79, 'Monster', 'Beverages', 1, 45.00, 45.00, '2024-05-18 21:06:52', '9', ' '),
(396, '2223960714790', 80, 'Fifa', 'Beverages', 2, 23.00, 46.00, '2024-05-18 21:07:52', '9', ' '),
(397, '2222947895764', 81, 'Crisps', '', 1, 4.95, 4.95, '2024-05-18 21:08:41', '9', ' '),
(398, '2222123200968', 81, 'Monster', 'Beverages', 1, 45.00, 45.00, '2024-05-18 21:08:41', '9', ' '),
(399, '2223960714790', 81, 'Fifa', 'Beverages', 1, 23.00, 23.00, '2024-05-18 21:08:41', '9', ' '),
(400, '2222925913231', 81, 'OMO SOFTENER', 'Detergent', 1, 50.00, 50.00, '2024-05-18 21:08:41', '9', ' '),
(401, '2222925913231', 82, 'OMO SOFTENER', 'Detergent', 2, 50.00, 100.00, '2024-05-18 21:18:35', '9', ' '),
(402, '2223960714790', 82, 'Fifa', 'Beverages', 1, 23.00, 23.00, '2024-05-18 21:18:35', '9', ' '),
(403, '2223388047139', 82, 'Boost Energy', 'Beverages', 1, 50.00, 50.00, '2024-05-18 21:18:35', '9', ' '),
(404, '2223442023546', 82, 'Spindrift', 'Beverages', 2, 50.00, 100.00, '2024-05-18 21:18:35', '9', ' '),
(405, '2223388047139', 83, 'Boost Energy', 'Beverages', 3, 50.00, 150.00, '2024-05-18 21:26:05', '9', ' '),
(406, '2223442023546', 83, 'Spindrift', 'Beverages', 4, 50.00, 200.00, '2024-05-18 21:26:05', '9', ' '),
(407, '1234', 84, 'So good milk', 'Dairy Producs', 2, 20.00, 40.00, '2024-05-18 23:02:49', '6', ' '),
(408, '2222947895764', 84, 'Crisps', '', 3, 4.95, 14.85, '2024-05-18 23:02:49', '6', ' '),
(409, '2222925913231', 84, 'OMO SOFTENER', 'Detergent', 2, 50.00, 100.00, '2024-05-18 23:02:49', '6', ' '),
(410, '2222123200968', 84, 'Monster', 'Beverages', 1, 45.00, 45.00, '2024-05-18 23:02:49', '6', ' '),
(411, '2223960714790', 84, 'Fifa', 'Beverages', 1, 23.00, 23.00, '2024-05-18 23:02:49', '6', ' '),
(412, '2222947895764', 85, 'Crisps', 'Snacks', 5, 4.95, 24.75, '2024-05-19 16:37:37', '6', ' '),
(413, '1234', 86, 'So good milk', 'Dairy Producs', 1, 20.00, 20.00, '2024-05-19 17:07:17', '6', ' '),
(414, '2222925913231', 86, 'OMO SOFTENER', 'Detergent', 1, 50.00, 50.00, '2024-05-19 17:07:17', '6', ' '),
(415, '2222947895764', 87, 'Crisps', 'Snacks', 1, 4.95, 4.95, '2024-05-19 18:18:45', '6', ' '),
(416, '2223960714790', 87, 'Fifa', 'Beverages', 1, 23.00, 23.00, '2024-05-19 18:18:45', '6', ' '),
(417, '2222123200968', 87, 'Monster', 'Beverages', 1, 45.00, 45.00, '2024-05-19 18:18:45', '6', ' '),
(418, '2223519322434', 87, 'CDO Luncheon Meat 350g', 'Canned Goods', 1, 150.00, 150.00, '2024-05-19 18:18:45', '6', ' '),
(419, '2223442023546', 87, 'Spindrift', 'Beverages', 1, 50.00, 50.00, '2024-05-19 18:18:45', '6', ' '),
(420, '2223388047139', 87, 'Boost Energy', 'Beverages', 1, 50.00, 50.00, '2024-05-19 18:18:45', '6', ' '),
(421, '8998666001702', 87, 'Kopiko 3 in 1', 'Beverages', 1, 25.00, 25.00, '2024-05-19 18:18:45', '6', ' '),
(422, '2223525334763', 87, 'Tango', 'Beverages', 1, 39.00, 39.00, '2024-05-19 18:18:45', '6', ' '),
(423, '2223636584775', 87, 'White T-Shirt', 'Clothing', 1, 150.00, 150.00, '2024-05-19 18:18:45', '6', ' '),
(424, '2223155520988', 87, 'Black T-Shirt', 'Clothing', 2, 150.00, 300.00, '2024-05-19 18:18:45', '6', ' '),
(425, '2223388047139', 88, 'Boost Energy', 'Beverages', 5, 50.00, 250.00, '2024-05-19 19:02:20', '6', ' ');

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
(2, 'sample', 'sample address', 'Juan Dela Cruz', '0965487123', 'faf@aefae.com', 'Manufacturer', 0),
(3, 'Try change', 'try address edit', 'kunyare lang na edit', '10123456', 'naibakunyaretry@gmail.com', 'Wholesale', 1),
(4, 'isa pa ', 'isapang company', 'Llyle', '09123456789', 'maibanamanto@email.ito', 'Manufacturer', 0);

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
(1, 'TUP Admin', 'tup@tup.com', '$2y$10$nah2kwq0IHoepQc/JDV78OgQVfz5fS3X3qZRhqnP5qc7LOYJKS.Yi', '2021-12-28 09:33:15', 'uploads/b9f374a1b62b51b3ded23d37248aa8ab5f9d34fc_3518.png', 'admin', 'male', 0, '12345', 0),
(2, 'Keqing', 'keqing@gmail.com', '$2y$10$dphVYgQBThDc6JQR40XMH.TNDpcdglALdvq.WL4WcB.ox3MiCT6Ci', '2021-12-28 10:39:58', 'uploads/user/c73cac02fb8be32cd2d07a65c6092db6c04a074e_7337.png', 'User', 'Female', 1, '', 0),
(5, 'some user', 'mail@mail.com', '$2y$10$nah2kwq0IHoepQc/JDV78OgQVfz5fS3X3qZRhqnP5qc7LOYJKS.Yi', '2022-02-17 19:13:49', NULL, 'User', 'male', 1, '', 1),
(6, 'Trick', 'jhypsss@gmail.com', '$2y$10$VJanESVTpnaT0JyiTgKPGOTeP8Yps7gbF6T0vB1aoS7hEzlGcSSBS', '2023-07-01 09:30:31', 'uploads/user/07524a465c5686c33c39f99fe955173b8d2d3431_9044.jpg', 'Admin', 'Male', 0, '54321', 0),
(7, 'Hitori Gotoh', 'bocchi@gmail.com', '$2y$10$MGfAr8fNoCLlPlh6dQOYDejX3oq92DJBkULiXhapGTx4Hc3Dd.LkS', '2023-07-01 09:31:07', 'uploads/71266d5faa035f21973b3dc9e234bac0cc299bab_8219.jpg', 'Supervisor', 'Female', 1, '', 0),
(8, 'Llyle Prince', 'llyle@gmail.com', '$2y$10$.hmG6inoH3GJIQ.NVUqRuO4iGBHAv9ZJrgafR9L/f.vrMWV/ROPCW', '2023-07-02 19:53:31', 'uploads/user/41135b00337c48abc6723931acc19e81f0efff4b_9247.png', 'Supervisor', 'Male', 1, '121212', 0),
(9, 'Leynald Kobe', 'kobe@gmail.com', '$2y$10$nxdd5sAJfIjgp5tckk7oN.TFD4w5AEbWuU3Zn8918De95xOyEZcNu', '2023-07-02 19:56:28', 'uploads/user/95b033c5a6e93b626077b1eb2f76eadde3e61862_9029.png', 'Cashier', 'Male', 1, '', 0),
(10, 'Samantha Maurice', 'sam@gmail.com', '$2y$10$8Ysz5pGB0j/ngy3VS2qUWufO4kZstqgvZU8gAWQ3IRNMnruqxiRc2', '2023-07-02 19:57:29', 'uploads/user/8f2b4473247bbc703272ebc8b49362cf3c54e1b8_3280.png', 'Manager', 'Female', 1, '', 0),
(12, 'Wednesday', 'wednesday@gmail.com', '$2y$10$dgJz2vbwYuVDh0TM7zn7BunzW9jpJQaS6HExB2P3EwOgo43lP098i', '2023-07-03 12:02:31', 'uploads/188e2135e926173ebb76e6894cce1f51e1b3b42d_2500.jpg', 'Cashier', 'Female', 1, '', 0),
(13, 'Power', 'power@gmail.com', '$2y$10$UaaxmelZNHzmRUYG2EtRjuCprMsPOCmxjpClBz68rY1tDv6o8sX1W', '2023-07-03 12:09:34', 'uploads/user/c74fc9e325c707e0f7c4e5bcf94f1bde505985f1_2149.jpg', 'Admin', 'Male', 1, '', 0),
(14, 'Zhara Gonzales', 'zharagon@gmail.com', '$2y$10$W9tl/OeBHy4GNWxxlgOLYeKbPYmpxSMSwVppgCy3UddG9M3OnAQVu', '2024-05-10 06:15:17', NULL, 'Supervisor', 'Female', 1, '', 0),
(20, 'Rhayli', 'rhayli@gmail.com', '$2y$10$ONdTq41AaJ6HKdluYkK7M.AtJTrK.B34KzHW/Q5N6D8vJFScwP5Zq', '2024-05-13 03:10:16', 'uploads/user/727cfe0614525a64ae2b68f61ea2ad2810ac0ba7_1552.png', 'Manager', 'Male', 1, '111222', 0),
(21, 'tryexample', 'tryexample@email.com', '$2y$10$J3LeBmQ8iPWBo1XYABw8.uCvF4wRfgCTjkphNk.HAihThMlIsqr.C', '2024-05-15 09:27:33', NULL, 'Cashier', 'Female', 1, '', 1),
(22, 'Samantha Berin', 'sam@gmail.com', '$2y$10$igAqUXgMQ/Va.kByjGzZvO4m3k43EzDN89u9aHUmDkwQ07acP8OA6', '2024-05-16 17:06:13', NULL, 'Cashier', 'Female', 1, '', 1);

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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `audit_trail`
--
ALTER TABLE `audit_trail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=292;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `deleted_items`
--
ALTER TABLE `deleted_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=426;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
