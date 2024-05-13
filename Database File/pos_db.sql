-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 13, 2024 at 11:40 AM
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
  `date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `audit_trail`
--

INSERT INTO `audit_trail` (`id`, `user_id`, `source`, `action`, `details`, `date`) VALUES
(26, 6, 'Products', 'ADD', 'Product: Mousepad (Keqing)\nQty: 10\nPrice: Unknown Price\nCategory: School Supplies', '2024-05-11 10:05:34'),
(27, 6, 'Products', 'ADD', 'Product: Mousepad (Raiden Ei)\nQty: 8\nPrice: Unknown Price\nCategory: School Supplies', '2024-05-11 10:06:13'),
(28, 6, 'Products', 'ADD', 'Product: Sticker\nQty: 45\nPrice: Unknown Price \nCategory: School Supplies', '2024-05-11 10:11:14'),
(29, 6, 'Products', 'ADD', 'Product: Kumu \nQty: 1 \nPrice: 8999 \nCategory: Snacks', '2024-05-11 10:19:04'),
(30, 9, 'Products', 'ADD', 'Product: Sticker (hu tao ghost) \nQty: 3 \nPrice: 9 \nCategory: Snacks', '2024-05-11 11:21:20'),
(35, 9, 'Products', 'UPDATE', 'CHANGES:\nProduct Name: Sticker (BuTao Ghost) to Sticker (Hu Tao Ghost)', '2024-05-11 12:22:06'),
(36, 9, 'Products', 'UPDATE', 'CHANGES:\nStock: 3 to 5\nPrice: 9.00 to 10.00\nCategory: Snacks to Sauces', '2024-05-11 12:22:42'),
(38, 9, 'Products', 'UPDATE', 'CHANGES:\nProduct Name: Sticker to Sticker (2D-Kun)\nPrice: 9.00 to 10\nProduct Image: Changed', '2024-05-11 12:27:27'),
(40, 9, 'Products', 'UPDATE', 'CHANGES:\nProduct Name: Mousepad (Raiden Ei Genshin) → Mousepad (Raiden Ei)', '2024-05-11 12:31:49'),
(41, 9, 'Products', 'ADD', 'NEW ITEM \nProduct: Homa Pixel Sticker \nQty: 5 \nPrice: 6 \nCategory: Sauces', '2024-05-11 12:41:52'),
(43, 9, 'Products', 'UPDATE', 'CHANGES:\nProduct Name: Pixel Homa Sticker → Pixel Staff of Homa Sticker\nStock: 4 → 6\nCategory: Seafood → Snacks', '2024-05-11 15:00:16'),
(44, 9, 'Products', 'UPDATE', 'CHANGES:\nStock: 6 → 2', '2024-05-11 15:01:05'),
(45, 7, 'Products', 'UPDATE', 'CHANGES:\nProduct Name: Kumu → Kumu Cat', '2024-05-11 15:13:25'),
(46, 7, 'Products', 'ADD', 'NEW ITEM: \nProduct: Sticker Ghost \nQty: 6 \nPrice: 8 \nCategory: Seafood', '2024-05-11 15:21:06'),
(47, 7, 'Products', 'UPDATE', 'CHANGES:\nCategory: Seafood → Snacks', '2024-05-11 15:31:07'),
(48, 1, 'Products', 'UPDATE', 'CHANGES:\nStock: 6 → 7\nPrice: 8.00 → 9.00', '2024-05-11 15:51:33'),
(49, 1, 'Products', 'DELETE', 'DELETED ITEM: Unknown Product', '2024-05-11 15:58:47'),
(50, 1, 'Products', 'DELETE', 'DELETED ITEM: \nProduct Barcode: 2223825049710 \nProduct Name: 2D-kun Stickers', '2024-05-11 16:02:12'),
(51, 1, 'Products', 'DELETE', 'DELETED ITEM: \nProduct Barcode: 2223960767820 \nProduct Name: Yoru Wallpaper', '2024-05-11 16:03:27'),
(52, 7, 'Products', 'DELETE', 'DELETED ITEM: \nProduct Barcode: 2223738483638 \nProduct Name: KLEE', '2024-05-11 17:07:10'),
(53, 7, 'Products', 'UPDATE', 'CHANGES:\nPrice: 9.00 → 10', '2024-05-11 17:17:19'),
(54, 7, 'Products', 'UPDATE', 'CHANGES:\nCategory: Snacks → Vegetables', '2024-05-11 17:29:23'),
(55, 7, 'Products', 'UPDATE', 'CHANGES:\nProduct Name: Sticker Ghost → Hu Tao Ghost Plushie\nStock: 7 → 20\nCategory: Vegetables → Baby Items', '2024-05-11 18:31:20'),
(56, 7, 'Products', 'ADD', 'NEW ITEM: \nProduct: mouse pad archons \nQty: 45 \nPrice: 489 \nCategory: ', '2024-05-11 18:35:57'),
(57, 6, 'Products', 'ADD', 'NEW ITEM: \nProduct: Plushie \nQty: 89 \nPrice: 164 \nCategory: ', '2024-05-11 19:01:25'),
(59, 6, 'Products', 'UPDATE', 'CHANGES:\nProduct Name: Plushie → Plushie Genshin Impact', '2024-05-11 19:05:55'),
(60, 6, 'Products', 'UPDATE', 'CHANGES:\nCategory:  → ---', '2024-05-11 19:39:53'),
(61, 6, 'Products', 'UPDATE', 'CHANGES:\nCategory: --- → Snacks', '2024-05-12 06:39:00'),
(62, 6, 'Products', 'UPDATE', 'CHANGES:\nCategory:  → ---', '2024-05-12 06:39:07'),
(63, 6, 'Products', 'UPDATE', 'CHANGES:\nItem: Plushie Genshin Impact\nCategory: Snacks → ---', '2024-05-12 06:41:05'),
(64, 6, 'Products', 'UPDATE', 'CHANGES in Item: Plushie Genshin Impact Hu Tao\nProduct Name: Plushie Genshin Impact → Plushie Genshin Impact Hu Tao', '2024-05-12 06:41:55'),
(65, 6, 'Products', 'ADD', 'NEW ITEM: \nProduct: ME \nQty: 1 \nPrice: 1000000 \nCategory: Snacks', '2024-05-12 06:44:19'),
(66, 6, 'Products', 'DELETE', 'DELETED ITEM: \nProduct Barcode: 2223643397385 \nProduct Name: ME', '2024-05-12 06:45:24'),
(67, 6, 'Products', 'ADD', 'NEW ITEM: 2223274334309\nProduct: Me \nQty: 1 \nPrice: 100000000 \nCategory: Personal Care', '2024-05-12 06:45:44'),
(68, 6, 'Products', 'DELETE', 'DELETED ITEM: 2223908542761 \nProduct Name: Sticker (Hu Tao Ghost)', '2024-05-12 06:49:30'),
(69, 6, 'Products', 'DELETE', 'DELETED ITEM: Unknown Barcode \nProduct Name: Unknown Product \nQty: Unknown Stock \nPrice: Unknown Price \nCategory: Unknown Category', '2024-05-12 06:53:03'),
(70, 6, 'Products', 'DELETE', 'DELETED ITEM: 222320955530 \nProduct Name: Mousepad (Keqing)', '2024-05-12 06:53:58'),
(71, 6, 'Products', 'UPDATE', 'UPDATED ITEM: 2223261733634\nStock: 45 → 65\nCategory: School Supplies → ---', '2024-05-12 06:56:52'),
(72, 6, 'Products', 'DELETE', 'DELETED ITEM: 2223261733634 \nProduct Name: Sticker (2D-Kun) \nQty: 65 \nPrice: 10.00\n Category: ---', '2024-05-12 06:57:16'),
(73, 6, 'Products', 'DELETE', 'DELETED ITEM: 2223274334309 \nProduct Name: Me \nQty: 1 \nPrice: 99999999.99\n Category: Personal Care', '2024-05-12 07:32:35'),
(74, 6, 'Products', 'ADD', 'NEW ITEM: 222313281847\nProduct: Me \nQty: 1 \nPrice: 101236456 \nCategory: Baby Items', '2024-05-12 07:50:48'),
(75, 6, 'Products', 'UPDATE', 'UPDATED ITEM: 222313281847\nPrice: 99999999.99 → 4.99\nCategory: Baby Items → ---', '2024-05-12 07:51:42'),
(76, 6, 'Products', 'UPDATE', 'UPDATED ITEM: 222313281847\nCategory: --- → Baby Items', '2024-05-12 07:52:04'),
(77, 6, 'Categories', 'ADD', 'NEW CATEGORY: Beverages \nDescription: Mousepad (Keqing)', '2024-05-12 14:43:40'),
(78, 6, 'Categories', 'UPDATE', 'UPDATED CATEGORY: fafea\nBarcode: Beverages → fafea\nProduct Name: drinks, coffee, tea, alcohol, juice, soda, etc. → dfadfaefa', '2024-05-12 14:44:13'),
(79, 6, 'Categories', 'UPDATE', 'UPDATED CATEGORY: Baby Items\nDescription: Baby food, diapers, wet wipes, lotion, etcSSS → Baby food, diapers, wet wipes, lotion, etc.', '2024-05-12 14:45:28'),
(80, 6, 'Categories', 'UPDATE', 'UPDATED CATEGORY: Baby Itemssss\nCategory Name: Baby Items → Baby Itemssss', '2024-05-12 14:45:47'),
(81, 6, 'Categories', 'DELETE', 'DELETED CATEGORY: Canned Goods', '2024-05-12 14:46:06'),
(82, 6, 'Categories', 'DELETE', 'DELETED CATEGORY: Canned Goods', '2024-05-12 14:46:11'),
(83, 6, 'Categories', 'DELETE', 'DELETED CATEGORY: Canned Goods', '2024-05-12 14:46:13'),
(84, 6, 'Categories', 'UPDATE', 'UPDATED CATEGORY: Baby Items\nCategory Name: Baby Itemssss → Baby Items', '2024-05-12 14:46:18'),
(85, 6, 'Categories', 'DELETE', 'DELETED CATEGORY: Beverages', '2024-05-12 14:46:22'),
(86, 6, 'Products', 'UPDATE', 'UPDATED ITEM: 222313281847\nPrice: 4.99 → 5', '2024-05-12 15:09:39'),
(87, 6, 'Products', 'UPDATE', 'UPDATED ITEM: 2223919165645\nCategory: --- → Pet Care', '2024-05-12 15:10:47'),
(88, 6, 'Products', 'ADD', 'NEW ITEM: 2223472701704\nProduct: try \nQty: 45 \nPrice: 455 \nCategory: Fruits ', '2024-05-12 15:18:45'),
(89, 6, 'Categories', 'DELETE', 'DELETED CATEGORY: fafea', '2024-05-12 15:19:07'),
(90, 6, 'Products', 'DELETE', 'DELETED ITEM: 2223919165645 \nProduct Name: mouse pad genshin \nQty: 45 \nPrice: 489.00\n Category: Pet Care', '2024-05-12 15:19:12'),
(91, 6, 'Products', 'DELETE', 'DELETED ITEM: 2223223805205 \nProduct Name: Mousepad (Raiden Ei) \nQty: 8 \nPrice: 459.00\n Category: School Supplies', '2024-05-12 15:19:17'),
(92, 6, 'Products', 'DELETE', 'DELETED ITEM: 2223759833161 \nProduct Name: Hu Tao Ghost Plushie \nQty: 20 \nPrice: 10.00\n Category: Baby Items', '2024-05-12 15:19:20'),
(93, 9, 'Products', 'DELETE', 'DELETED ITEM: 2223472701704 \nProduct Name: try \nQty: 45 \nPrice: 455.00\n Category: Fruits ', '2024-05-12 15:20:00'),
(94, 9, 'Products', 'DELETE', 'DELETED ITEM: 222313281847 \nProduct Name: Me \nQty: 1 \nPrice: 5.00\n Category: Baby Items', '2024-05-12 15:20:04'),
(95, 9, 'Products', 'DELETE', 'DELETED ITEM: 2223400312027 \nProduct Name: Pixel Staff of Homa Sticker \nQty: 2 \nPrice: 6.00\n Category: Snacks', '2024-05-12 15:20:08'),
(96, 9, 'Products', 'UPDATE', 'UPDATED ITEM: 2223780889232\nStock: 50 → 53\nCategory: School Supplies → Baby Items', '2024-05-12 15:22:35'),
(97, 9, 'Products', 'ADD', 'NEW ITEM: 2223729731061\nProduct: Trick \nQty: 1 \nPrice: 123123123 \nCategory: Baby Items', '2024-05-12 15:44:30'),
(98, 9, 'Products', 'UPDATE', 'UPDATED ITEM: 2223729731061\nPrice: 99999999.99 → 1', '2024-05-12 15:44:40'),
(99, 9, 'Products', 'DELETE', 'DELETED ITEM: 2223729731061 \nProduct Name: Trick \nQty: 1 \nPrice: 1.00\n Category: Baby Items', '2024-05-12 15:44:53'),
(100, 9, 'Categories', 'UPDATE', 'UPDATED CATEGORY: Baby Items\nDescription: Baby food, diapers, wet wipes, lotion, etc. → Baby food, diapers, wet wipes, lotion, etc.s', '2024-05-12 15:47:28'),
(101, 9, 'Categories', 'UPDATE', 'UPDATED CATEGORY: Baby Items\nDescription: Baby food, diapers, wet wipes, lotion, etc.s → Baby food, diapers, wet wipes, lotion, etc', '2024-05-12 15:47:45'),
(102, 9, 'Categories', 'ADD', 'NEW CATEGORY: School Supplies \nDescription: School tools and equipment for students', '2024-05-12 15:55:46'),
(103, 9, 'Products', 'UPDATE', 'UPDATED ITEM: 2223780889232\nCategory: Baby Items → School Supplies', '2024-05-12 15:56:00'),
(104, 9, 'Categories', 'ADD', 'NEW CATEGORY: Clothing \nDescription: Personal Clothes, styles, appearance, outfit', '2024-05-12 15:56:54'),
(105, 7, 'Products', 'UPDATE', 'UPDATED ITEM: 2223434399143', '2024-05-12 15:57:35'),
(106, 7, 'Products', 'UPDATE', 'UPDATED ITEM: 2223636584775', '2024-05-12 15:58:30'),
(107, 7, 'Categories', 'ADD', 'NEW CATEGORY: Fruits \nDescription: Apples, bananas,  grapes, oranges, strawberries, avocados, peaches, etc.', '2024-05-12 15:59:30'),
(108, 7, 'Categories', 'ADD', 'NEW CATEGORY: Vegetables \nDescription: Potatoes, onions, carrots, salad greens, broccoli, peppers, tomatoes, cucumbers, etc.', '2024-05-12 15:59:42'),
(109, 7, 'Categories', 'ADD', 'NEW CATEGORY: Dairy \nDescription: Butter, cheese, eggs, milk, yogurt, etc.', '2024-05-12 15:59:56'),
(110, 7, 'Categories', 'ADD', 'NEW CATEGORY: Snacks \nDescription: Chips, pretzels, popcorn, crackers, nuts, etc.', '2024-05-12 16:01:50'),
(111, 7, 'Categories', 'DELETE', 'DELETED CATEGORY: Snacks', '2024-05-12 16:01:55'),
(112, 7, 'Categories', 'ADD', 'NEW CATEGORY: Bread & Bakery \nDescription: Bread, tortillas, pies, muffins, bagels, cookies, etc.', '2024-05-12 16:02:14'),
(113, 7, 'Categories', 'DELETE', 'DELETED CATEGORY: Fruits', '2024-05-12 16:02:37'),
(115, 13, 'Users', 'ADD', 'NEW USER: Yani \nEmail: yani@gmail.com \nGender: male \nRole: user', '2024-05-12 16:31:35'),
(123, 13, 'Users', 'UPDATE', 'UPDATED USER: Yani\nRole: supervisor → cashier', '2024-05-12 17:23:51'),
(124, 13, 'Users', 'UPDATE', 'UPDATED USER: Yani\nPassword: Modified', '2024-05-12 17:24:07'),
(125, 13, 'Users', 'DELETE', 'DELETED USER: example \nEmail: example@gmail.com \nGender: male \nRole: user', '2024-05-12 17:24:34'),
(126, 13, 'Users', 'UPDATE', 'UPDATED USER: Hitori Gotoh\nUsername: bocchi → Hitori Gotoh', '2024-05-12 17:25:22'),
(127, 13, 'Products', 'UPDATE', 'UPDATED ITEM: 2223434399143\nStock: 0 → 7', '2024-05-12 17:49:03'),
(128, 13, 'Users', 'UPDATE', 'UPDATED USER: Kobe', '2024-05-12 17:52:40'),
(129, 13, 'Users', 'UPDATE', 'UPDATED USER: Leynald Kobe\nUsername: Kobe → Leynald Kobe\nUser Image: User Image Changed', '2024-05-13 01:07:08'),
(130, 13, 'Users', 'UPDATE', 'UPDATED USER: Llyle Prince\nUsername: Llyle → Llyle Prince\nRole: cashier → admin\nUser Image: User Image Changed', '2024-05-13 01:07:53'),
(131, 13, 'Users', 'UPDATE', 'UPDATED USER: Samantha Maurice\nUsername: sam → Samantha Maurice\nRole: supervisor → cashier\nUser Image: User Image Changed', '2024-05-13 01:08:37'),
(132, 8, 'Users', 'UPDATE', 'UPDATED USER: Wednesday\nRole: supervisor → cashier', '2024-05-13 01:09:54'),
(133, 8, 'Users', 'ADD', 'NEW USER: Rhayli \nEmail: rhayli@gmail.com \nGender: male \nRole: user', '2024-05-13 01:10:16'),
(134, 20, 'Users', 'UPDATE', 'UPDATED USER: Rhayli\nUser Image: User Image Changed', '2024-05-13 01:11:04'),
(138, 20, 'Users', 'UPDATE', 'UPDATED USER: Rhayli\nUsername: Rhayli S → Rhayli', '2024-05-13 02:05:56'),
(140, 20, 'Users', 'UPDATE', 'UPDATED USER: Rhayli\nUsername: Rhayli Silongan → Rhayli', '2024-05-13 02:16:38'),
(141, 14, 'Users', 'UPDATE', 'UPDATED USER: Zhara\nUsername: zharagon → Zhara', '2024-05-13 02:18:12'),
(142, 6, 'Users', 'DELETE', 'DELETED USER: tryexample \nEmail: tryexample@email.com \nGender: male \nRole: user', '2024-05-13 02:18:35'),
(143, 6, 'Users', 'UPDATE', 'UPDATED USER: Rhayli Silongan\nUsername: Rhayli → Rhayli Silongan', '2024-05-13 02:34:16'),
(144, 6, 'Users', 'DELETE', 'DELETED USER: Yani \nEmail: yani@gmail.com \nGender: male \nRole: cashier', '2024-05-13 02:36:44'),
(145, 6, 'Products', 'UPDATE', 'UPDATED ITEM: 2223686064536\nStock: 100 → 110', '2024-05-13 06:48:34');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`) VALUES
(3, 'Frozen Foods', 'vegetables, individual meals, ice cream'),
(5, 'Meat', 'chicken, beef, pork, sausage, bacon etc'),
(6, 'Snacks', 'Chips, pretzels, popcorn, crackers, nuts, etc.'),
(8, 'Personal Care', 'Shampoo, conditioner, deodorant, toothpaste, dental floss, etc.'),
(9, 'Baby Items', 'Baby food, diapers, wet wipes, lotion, etc'),
(11, 'Condiments & Spices', 'peppers, oregano, cinnamon, sugar, olive oil, ketchup, mayonnaise, etc.'),
(12, 'Fruits ', 'Apples, bananas,  grapes, oranges, strawberries, avocados, peaches, etc.'),
(13, 'Pasta, Rice & Cereal', 'Oats, granola, brown rice, white rice, macaroni, noodles, etc.'),
(14, 'Pet Care', 'Pet food, kitty litter, chew toys, pet treats, pet shampoo, etc.'),
(18, 'Canned Goods', 'Soup, tuna, fruit, beans, vegetables, pasta sauce, etc.'),
(21, 'Beverages', 'Cheese, salami, ham, turkey, etc.'),
(23, 'School Supplies', 'School tools and equipment for students'),
(24, 'Clothing', 'Personal Clothes, styles, appearance, outfit'),
(26, 'Vegetables', 'Potatoes, onions, carrots, salad greens, broccoli, peppers, tomatoes, cucumbers, etc.'),
(27, 'Dairy', 'Butter, cheese, eggs, milk, yogurt, etc.'),
(29, 'Bread & Bakery', 'Bread, tortillas, pies, muffins, bagels, cookies, etc.');

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
  `category` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `barcode`, `description`, `stock`, `amount`, `image`, `user_id`, `date`, `views`, `category`) VALUES
(3, '2222947895764', 'Crisps', 193, 4.95, 'uploads/a376a3a3f34dc21971ca40ac6dd6664585c197a6_4817.jpg', '1', '2022-01-09 08:46:29', 59, 'Snacks'),
(4, '2222881344444', 'Burger', 200, 10.00, 'uploads/c322c54a3249e75ca46347a2c4ec9385672cb8e3_5698.jpg', '1', '2022-01-09 08:47:02', 14, 'Snacks'),
(5, '1234', 'So good milk', 92, 20.00, 'uploads/e149b8702ddb43e5cda3c10803c563203b27cfc0_6896.jpg', '1', '2022-01-09 08:47:54', 22, 'Dairy Products'),
(6, '2222925913231', 'OMO SOFTENER', 82, 50.00, 'uploads/e80200cc753ea342725ba080f668144fe4c763b9_7977.jpg', 'Unknown', '2022-01-16 08:35:24', 56, 'Detergent'),
(8, '2222595564534', '7 UP', 46, 34.00, 'uploads/a6f424034ca00dc2c3b55761f2b1c31d689ca215_6797.jpg', '6', '2023-07-01 12:15:13', 3, 'Beverages'),
(10, '2222974243584', 'Caramel Moolatte', 22, 5.00, 'uploads/7efe697d3a3cafad54574764253c1c4e5ee3de93_3723.png', '1', '2023-07-01 12:59:42', 6, 'Frozen Foods'),
(11, '2222123200968', 'Monster', 200, 45.00, 'uploads/40fbc31c9795970c2b93419196a07354829db713_1986.jpg', '6', '2023-07-01 16:25:41', 3, 'Beverages'),
(15, '2222135063866', 'Cola Zero in can', 25, 39.00, 'uploads/a54741bf6d71e0b52ce6cd34d0d526c6dd4e94a6_4751.jpg', '6', '2023-07-03 11:07:15', 1, 'Beverages'),
(16, '2222877211304', 'Mirinda', 29, 35.00, 'uploads/e5bc61c49ab567c8e2a921d735f77c19955571c1_5489.jpg', '6', '2023-07-03 11:08:04', 1, 'Beverages'),
(17, '2222774991043', 'Spindrift', 10, 50.00, 'uploads/5e07651f0573ad1d5851ce6ea26eae85d59b67dc_2952.jpg', '6', '2023-07-03 11:08:40', 0, 'Beverages'),
(18, '2222794658425', 'Boost Energy', 45, 50.00, 'uploads/5edd64c0e275bd3cb6e9940773da659adfb228dc_9357.jpg', '6', '2023-07-03 13:20:21', 0, 'Beverages'),
(19, '2222893703661', 'Fifa', 53, 23.00, 'uploads/product/a5ff699d375e9743390192ba1674647dfc51025d_2043.jpg', '6', '2023-07-03 14:11:53', 1, 'Beverages'),
(23, '2223519322434', 'CDO Luncheon Meat 350g', 100, 150.00, 'uploads/product85853e6e9d47bdb7286d1076c1aeabdb0ebe74bc_9138.jpg', '1', '2024-03-26 07:16:38', 0, 'Canned Goods'),
(24, '2223375580155', 'Lucky Me Beef Noodles', 100, 25.00, 'uploads/product7eb433368ec83423b493eb98b515917409b145f7_8232.jpg', '1', '2024-03-26 07:21:19', 0, 'Pasta & Noodles'),
(25, '2223686064536', 'ID Lace', 110, 25.00, 'uploads/product6f21ec36b38e2139a8b5a643e1fcb6b5330e45d1_6010.jfif', '1', '2024-04-02 02:33:17', 0, 'School Supplies'),
(26, '2223155520988', 'Black T-Shirt', 100, 150.00, 'uploads/product5ea1733a8d127449fd3ad4ed51938de31dd3e668_2079.jpg', '1', '2024-04-02 02:33:45', 0, 'Clothing'),
(27, '2223636584775', 'White T-Shirt', 100, 150.00, 'uploads/productf57de05611fffd9ab731fb1ee845793193845dc0_9018.jpg', '1', '2024-04-02 02:34:19', 0, 'Clothing'),
(30, '2223434399143', 'Snapback Hat', 7, 75.00, 'uploads/product3e434d486cd8acf99a8cd93bf97c966f5009d804_9935.jpg', '1', '2024-04-02 02:41:19', 0, 'Clothing'),
(31, '2223780889232', 'Long Envelope', 53, 25.00, 'uploads/product/dd8fbb1526220739db2497422c95f6cf5268c389_4126.jpg', '6', '2024-04-02 02:41:48', 0, 'School Supplies');

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
  `date` datetime DEFAULT NULL,
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
(209, '1234', 10, 'So good milk', 3, 20.00, 60.00, '2024-04-02 20:00:02', '1', '');

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
  `void_code` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `date`, `image`, `role`, `gender`, `deletable`, `void_code`) VALUES
(1, 'TUP Admin', 'tup@tup.com', '$2y$10$nah2kwq0IHoepQc/JDV78OgQVfz5fS3X3qZRhqnP5qc7LOYJKS.Yi', '2021-12-28 09:33:15', 'uploads/b9f374a1b62b51b3ded23d37248aa8ab5f9d34fc_3518.png', 'admin', 'male', 0, '12345'),
(2, 'Keqing', 'keqing@email.com', '$2y$10$nah2kwq0IHoepQc/JDV78OgQVfz5fS3X3qZRhqnP5qc7LOYJKS.Yi', '2021-12-28 10:39:58', 'uploads/user/c73cac02fb8be32cd2d07a65c6092db6c04a074e_7337.png', 'cashier', 'female', 1, ''),
(5, 'some user', 'mail@mail.com', '$2y$10$nah2kwq0IHoepQc/JDV78OgQVfz5fS3X3qZRhqnP5qc7LOYJKS.Yi', '2022-02-17 19:13:49', NULL, 'user', 'male', 0, ''),
(6, 'Trick', 'jhypsss@gmail.com', '$2y$10$VJanESVTpnaT0JyiTgKPGOTeP8Yps7gbF6T0vB1aoS7hEzlGcSSBS', '2023-07-01 09:30:31', 'uploads/user/07524a465c5686c33c39f99fe955173b8d2d3431_9044.jpg', 'admin', 'male', 0, '54321'),
(7, 'Hitori Gotoh', 'bocchi@gmail.com', '$2y$10$MGfAr8fNoCLlPlh6dQOYDejX3oq92DJBkULiXhapGTx4Hc3Dd.LkS', '2023-07-01 09:31:07', 'uploads/71266d5faa035f21973b3dc9e234bac0cc299bab_8219.jpg', 'supervisor', 'female', 1, ''),
(8, 'Llyle Prince', 'llyle@gmail.com', '$2y$10$.hmG6inoH3GJIQ.NVUqRuO4iGBHAv9ZJrgafR9L/f.vrMWV/ROPCW', '2023-07-02 19:53:31', 'uploads/user/41135b00337c48abc6723931acc19e81f0efff4b_9247.png', 'admin', 'male', 1, ''),
(9, 'Leynald Kobe', 'kobe@gmail.com', '$2y$10$nxdd5sAJfIjgp5tckk7oN.TFD4w5AEbWuU3Zn8918De95xOyEZcNu', '2023-07-02 19:56:28', 'uploads/user/95b033c5a6e93b626077b1eb2f76eadde3e61862_9029.png', 'supervisor', 'male', 1, ''),
(10, 'Samantha Maurice', 'sam@gmail.com', '$2y$10$8Ysz5pGB0j/ngy3VS2qUWufO4kZstqgvZU8gAWQ3IRNMnruqxiRc2', '2023-07-02 19:57:29', 'uploads/user/8f2b4473247bbc703272ebc8b49362cf3c54e1b8_3280.png', 'cashier', 'female', 1, ''),
(12, 'Wednesday', 'wednesday@gmail.com', '$2y$10$UtXmSXM03dnnp51mwFGYVuz5F46aeAdTQi3FnUz95iBMxlepbr3Zy', '2023-07-03 12:02:31', 'uploads/188e2135e926173ebb76e6894cce1f51e1b3b42d_2500.jpg', 'cashier', 'female', 1, ''),
(13, 'Power', 'power@gmail.com', '$2y$10$UaaxmelZNHzmRUYG2EtRjuCprMsPOCmxjpClBz68rY1tDv6o8sX1W', '2023-07-03 12:09:34', 'uploads/97aa685e4581bf69b223f762454fd338c019f816_9114.jpg', 'admin', 'female', 1, ''),
(14, 'Zhara', 'zharagon@gmail.com', '$2y$10$W9tl/OeBHy4GNWxxlgOLYeKbPYmpxSMSwVppgCy3UddG9M3OnAQVu', '2024-05-10 06:15:17', NULL, 'supervisor', 'female', 1, ''),
(20, 'Rhayli Silongan', 'rhayli@gmail.com', '$2y$10$ONdTq41AaJ6HKdluYkK7M.AtJTrK.B34KzHW/Q5N6D8vJFScwP5Zq', '2024-05-13 03:10:16', 'uploads/user/727cfe0614525a64ae2b68f61ea2ad2810ac0ba7_1552.png', 'user', 'male', 1, '');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=146;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=210;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `void_items`
--
ALTER TABLE `void_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
