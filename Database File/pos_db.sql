-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 08, 2024 at 02:28 PM
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

--
-- Dumping data for table `audit_trail`
--

INSERT INTO `audit_trail` (`id`, `user_id`, `source`, `action`, `details`, `date`) VALUES
(1, 6, 'Categories', 'ADD', 'NEW CATEGORY: Beverages \nDescription: Coffee, teabags, milk, juice, soda, beer, wine, etc.', '2024-06-07 21:40:37'),
(2, 6, 'Users', 'UPDATE', 'UPDATED USER: TUPM-24-1002\nRole: Admin → Manager', '2024-06-07 21:42:15'),
(3, 7, 'Products', 'ADD', 'NEW ITEM: 2223426366325\nProduct: Coca Cola Zero \nQty: 0 \nPrice: 37 \nCategory: Beverages', '2024-06-07 21:44:17'),
(4, 5, 'Categories', 'UPDATE', 'UPDATED CATEGORY: Beverages\nDescription: Coffee, teabags, milk, juice, soda, beer, wine, etc. → Water, Sports Drink, Juice, Tea, Coffee, Milk, Smoothie, Energy Drinks, Lemonade', '2024-06-07 21:44:23'),
(5, 5, 'Categories', 'ADD', 'NEW CATEGORY: School Merch \nDescription: Apparel, Accessories, Stationery, Drinkware, Tech Accessories, Miscellaneous Items', '2024-06-07 21:44:53'),
(6, 5, 'Categories', 'ADD', 'NEW CATEGORY: School Supplies \nDescription: Writing Instruments, Paper Products, Organizational Tools, Technology and Accessories, Art Supplies, Classroom Essentials, Backpack and Bags, Study Aids, Health and Hygiene, Miscellaneous Supplies', '2024-06-07 21:45:04'),
(7, 5, 'Categories', 'ADD', 'NEW CATEGORY: Snacks \nDescription: Salty Snacks, Sweet Snacks, Healthy Snacks, Protein-Rich Snacks, Dairy Snacks, Baked Snacks, Specialty Snacks', '2024-06-07 21:45:32'),
(8, 5, 'Suppliers', 'ADD', 'NEW SUPPLIER: Metro Retail Stores Group, Inc. \nCompany Address: Vicsal Building, Ouano Avenue cor. E.O. Perez Street, Subangdaku, Mandaue City, Cebu 6014, Philippines', '2024-06-07 21:51:43'),
(9, 5, 'Suppliers', 'ADD', 'NEW SUPPLIER: Metro Retail Stores Group, Inc. \nCompany Address: Vicsal Building, Ouano Avenue cor. E.O. Perez Street, Subangdaku, Mandaue City, Cebu 6014, Philippines', '2024-06-07 21:53:24'),
(10, 7, 'Suppliers', 'ADD', 'NEW SUPPLIER: Global Supplies Inc. \nCompany Address: 1234 Business Park Road Makati City, 1226 Metro Manila, Philippines', '2024-06-07 21:55:37'),
(11, 7, 'Suppliers', 'ADD', 'NEW SUPPLIER: Global Supplies Inc. \nCompany Address: 1234 Business Park Road Makati City, 1226 Metro Manila, Philippines', '2024-06-07 21:57:05'),
(12, 7, 'Products', 'ADD', 'NEW ITEM: 2223337259246\nProduct: 7-UP  \nQty: 0 \nPrice: 35 \nCategory: Beverages', '2024-06-07 22:00:18'),
(13, 5, 'Categories', 'ADD', 'NEW CATEGORY: Personal Care \nDescription:  Hand sanitizers, tissues, face masks, lip balm, sunscreen, hand lotion, hair ties, combs, deodorant.', '2024-06-07 22:01:00'),
(14, 5, 'Categories', 'ADD', 'NEW CATEGORY: Cleaning Supplies \nDescription: Disinfectant wipes, all-purpose cleaners, broom and dustpan, trash bags, sponges, dish soap, mop, hand soap.', '2024-06-07 22:01:25'),
(15, 5, 'Categories', 'UPDATE', 'UPDATED CATEGORY: Cleaning Supplies\nDescription: Disinfectant wipes, all-purpose cleaners, broom and dustpan, trash bags, sponges, dish soap, mop, hand soap. → Disinfectant Wipes, All-Purpose Cleaners,  Broom and Dustpan, Trash Bags, Sponges, Dish Soap, Mop, Hand Soap.', '2024-06-07 22:02:55'),
(16, 7, 'Products', 'ADD', 'NEW ITEM: 2223225640412\nProduct: Mountain Dew Carbonated Drink in can 320ml \nQty: 0 \nPrice: 35 \nCategory: Beverages', '2024-06-07 22:03:10'),
(17, 5, 'Categories', 'UPDATE', 'UPDATED CATEGORY: Personal Care\nDescription:  Hand sanitizers, tissues, face masks, lip balm, sunscreen, hand lotion, hair ties, combs, deodorant. →  Hand Sanitizers, Tissues, Face Masks, Lip Balm, Sunscreen, Hand Lotion, Hair Ties, Combs, Deodorant.', '2024-06-07 22:03:48'),
(18, 7, 'Products', 'UPDATE', 'UPDATED ITEM: 2223225640412\nProduct Name: Mountain Dew Carbonated Drink in can 320ml → Mountain Dew Carbonated Drink in can 330ml', '2024-06-07 22:03:49'),
(19, 5, 'Categories', 'ADD', 'NEW CATEGORY: Gifts And Souvenirs \nDescription: Keychains, Mugs, T-Shirts, Tote Bags, Postcards, Magnets, Photo Frames, Decorative Items, Memorabilia.', '2024-06-07 22:04:05'),
(20, 7, 'Products', 'UPDATE', 'UPDATED ITEM: 2223426366325\nProduct Name: Coca Cola Zero → Coca Cola Zero 325ml', '2024-06-07 22:04:12'),
(21, 5, 'Categories', 'ADD', 'NEW CATEGORY: Health And Wellness \nDescription:  Vitamins, Supplements, First Aid Kits, Health Monitors, Fitness Equipment, Essential Oils, Yoga Mats, Exercise Bands.', '2024-06-07 22:04:26'),
(22, 5, 'Categories', 'ADD', 'NEW CATEGORY: Books And Magazines \nDescription: Textbooks, Novels, Reference Books, Magazines, Journals, Educational Guides, Comic Books, Workbooks.', '2024-06-07 22:04:42'),
(23, 5, 'Categories', 'ADD', 'NEW CATEGORY: Sports Equipment \nDescription: Balls (Basketball, Soccer, Volleyball), Sportswear, Water Bottles, Gym Bags, Protective Gear, Fitness Trackers, Sports Shoes.', '2024-06-07 22:05:07'),
(24, 5, 'Categories', 'ADD', 'NEW CATEGORY: Art Supplies \nDescription:  Paints, Brushes, Sketchbooks, Colored Pencils, Markers, Clay, Easels, Canvas, Glue, Crafting Kits.', '2024-06-07 22:05:23'),
(25, 5, 'Categories', 'ADD', 'NEW CATEGORY: Electronics \nDescription: Chargers, USB Drives, Headphones, Calculators, Batteries, Power Banks, Laptop Accessories, Screen Protectors, Adapters.', '2024-06-07 22:05:39'),
(26, 7, 'Products', 'ADD', 'NEW ITEM: 2223467683847\nProduct: Royal Tru Orange \nQty: 0 \nPrice: 36 \nCategory: Beverages', '2024-06-07 22:06:26'),
(27, 5, 'Categories', 'ADD', 'NEW CATEGORY: Toys And Games \nDescription: Board Games, Puzzles, Action Figures, Dolls, Educational Toys, Outdoor Toys, Card Games, Video Games.', '2024-06-07 22:07:39'),
(28, 7, 'Products', 'ADD', 'NEW ITEM: 2223532342884\nProduct: Boy Bawang Cornick Garlic Flavor 90g \nQty: 0 \nPrice: 20 \nCategory: Snacks', '2024-06-07 22:09:23'),
(29, 5, 'Suppliers', 'ADD', 'NEW SUPPLIER: Metro Retail Stores Group, Inc. \nCompany Address: Vicsal Building, Ouano Avenue cor. E.O. Perez Street, Subangdaku, Mandaue City, Cebu 6014, Philippines', '2024-06-07 22:10:10'),
(30, 7, 'Products', 'ADD', 'NEW ITEM: 2223877671221\nProduct: Jack N Jill Piattos Cheese 85g \nQty: 0 \nPrice: 45 \nCategory: Snacks', '2024-06-07 22:10:29'),
(31, 5, 'Suppliers', 'ADD', 'NEW SUPPLIER:  Puregold Price Club, Inc. \nCompany Address: Tabacalera Compound, E. Rodriguez Jr. Avenue, Barangay Ugong, Pasig City 1604, Philippines', '2024-06-07 22:11:01'),
(32, 7, 'Products', 'ADD', 'NEW ITEM: 222358413372\nProduct: Jack N Jill Mang Juan Espesyal Suka\'t Sili 90g \nQty: 0 \nPrice: 25 \nCategory: Snacks', '2024-06-07 22:11:37'),
(33, 5, 'Suppliers', 'ADD', 'NEW SUPPLIER: Wilcon Depot, Inc. \nCompany Address: Wilcon Center, 121 Visayas Avenue, Quezon City 1128, Philippines', '2024-06-07 22:11:43'),
(34, 5, 'Suppliers', 'ADD', 'NEW SUPPLIER: Mercury Drug Corporation \nCompany Address:  7 Mercury Avenue, Bagumbayan, Quezon City 1110, Philippines', '2024-06-07 22:12:18'),
(35, 7, 'Products', 'ADD', 'NEW ITEM: 2223854954396\nProduct: Jack N Jill Piattos Roadhouse Barbecue 85g \nQty: 0 \nPrice: 45 \nCategory: Snacks', '2024-06-07 22:12:49'),
(36, 5, 'Suppliers', 'ADD', 'NEW SUPPLIER: National Book Store \nCompany Address: Quad Alpha Centrum Building, 125 Pioneer Street, Mandaluyong City 1550, Philippines', '2024-06-07 22:14:29'),
(37, 5, 'Suppliers', 'ADD', 'NEW SUPPLIER: Office Warehouse, Inc. \nCompany Address:  2316 Chino Roces Avenue Extension, Makati City 1231, Philippines', '2024-06-07 22:15:01'),
(38, 7, 'Products', 'ADD', 'NEW ITEM: 2223885790815\nProduct: Brown Envelope Short \nQty: 0 \nPrice: 10 \nCategory: School Supplies', '2024-06-07 22:15:22'),
(39, 5, 'Suppliers', 'ADD', 'NEW SUPPLIER: Sterling Paper Products Enterprises, Inc. \nCompany Address: 2302 Sterling Place, Pasong Tamo Extension, Makati City 1231, Philippines', '2024-06-07 22:16:00'),
(40, 7, 'Products', 'ADD', 'NEW ITEM: 2223913989232\nProduct: Brown Envelope Long \nQty: 0 \nPrice: 15 \nCategory: School Supplies', '2024-06-07 22:16:41'),
(41, 5, 'Suppliers', 'ADD', 'NEW SUPPLIER: Pandayan Bookshop, Inc. \nCompany Address: 810 Aurora Boulevard, Cubao, Quezon City 1109, Philippines', '2024-06-07 22:17:18'),
(42, 7, 'Products', 'ADD', 'NEW ITEM: 2223738610543\nProduct: Plastic Ruler 12\"x1\" \nQty: 0 \nPrice: 15 \nCategory: School Supplies', '2024-06-07 22:18:21'),
(43, 4, 'Products', 'ADD', 'NEW ITEM: 222352056946\nProduct: Toblerone Milk 35g \nQty: 0 \nPrice: 60 \nCategory: Snacks', '2024-06-07 22:18:25'),
(44, 7, 'Products', 'UPDATE', 'UPDATED ITEM: 2223426366325\nCurrent Stock Increased: 0 → 50(+50)', '2024-06-07 22:19:12'),
(45, 5, 'Suppliers', 'ADD', 'NEW SUPPLIER: Booksale \nCompany Address:  341 N. Domingo Street, San Juan City 1500, Philippines', '2024-06-07 22:19:43'),
(46, 6, 'Products', 'UPDATE', 'UPDATED ITEM: 2223225640412\nProduct Name: Mountain Dew Carbonated Drink in can 330ml → Mountain Dew 330ml', '2024-06-07 22:25:08'),
(47, 6, 'Products', 'UPDATE', 'UPDATED ITEM: 2223854954396\nProduct Name: Jack N Jill Piattos Roadhouse Barbecue 85g → Piattos Roadhouse Barbecue 85g', '2024-06-07 22:25:16'),
(48, 6, 'Products', 'UPDATE', 'UPDATED ITEM: 222358413372\nProduct Name: Jack N Jill Mang Juan Espesyal Suka\'t Sili 90g → Mang Juan Espesyal Suka\'t Sili 90g', '2024-06-07 22:25:24'),
(49, 4, 'Products', 'ADD', 'NEW ITEM: 2223562280728\nProduct: Oishi Choco Chug 250 ml \nQty: 0 \nPrice: 35 \nCategory: Beverages', '2024-06-07 22:25:29'),
(50, 6, 'Products', 'UPDATE', 'UPDATED ITEM: 2223877671221\nProduct Name: Jack N Jill Piattos Cheese 85g → Piattos Cheese 85g', '2024-06-07 22:25:33'),
(51, 6, 'Products', 'UPDATE', 'UPDATED ITEM: 2223337259246\nCurrent Stock Increased: 0 → 50(+50)', '2024-06-07 22:26:58'),
(52, 4, 'Products', 'ADD', 'NEW ITEM: 2223207025516\nProduct: Pocari Sweat 350mL \nQty: 0 \nPrice: 40 \nCategory: Beverages', '2024-06-07 22:27:09'),
(53, 5, 'Products', 'UPDATE', 'UPDATED ITEM: 222352056946\nCurrent Stock Increased: 0 → 45(+45)', '2024-06-07 22:27:19'),
(54, 6, 'Products', 'UPDATE', 'UPDATED ITEM: 2223225640412\nCurrent Stock Increased: 0 → 40(+40)', '2024-06-07 22:28:00'),
(55, 6, 'Products', 'UPDATE', 'UPDATED ITEM: 2223225640412\nCurrent Stock Increased: 40 → 80(+40)', '2024-06-07 22:29:36'),
(56, 5, 'Products', 'UPDATE', 'UPDATED ITEM: 2223207025516\nCurrent Stock Increased: 0 → 150(+150)', '2024-06-07 22:29:58'),
(57, 6, 'Products', 'UPDATE', 'UPDATED ITEM: 2223885790815\nCurrent Stock Increased: 0 → 100(+100)', '2024-06-07 22:31:29'),
(58, 5, 'Products', 'UPDATE', 'UPDATED ITEM: 2223207025516\nCurrent Stock Decreased: 150 → 100(-50)', '2024-06-07 22:31:32'),
(59, 6, 'Products', 'UPDATE', 'UPDATED ITEM: 2223913989232\nCurrent Stock Increased: 0 → 100(+100)', '2024-06-07 22:31:37'),
(60, 6, 'Products', 'UPDATE', 'UPDATED ITEM: 2223738610543\nProduct Name: Plastic Ruler 12\"x1\" → Plastic Ruler 12\nCurrent Stock Increased: 0 → 50(+50)', '2024-06-07 22:31:52'),
(61, 5, 'Products', 'UPDATE', 'UPDATED ITEM: 2223913989232\nCurrent Stock Decreased: 100 → 75(-25)', '2024-06-07 22:33:32'),
(62, 4, 'Products', 'ADD', 'NEW ITEM: 2223779806324\nProduct: Best Buy Clipboard-Long-Pink \nQty: 0 \nPrice: 85 \nCategory: School Supplies', '2024-06-07 22:35:08'),
(63, 4, 'Products', 'ADD', 'NEW ITEM: 2223997216704\nProduct: Best Buy Clipboard-Short-Yellow \nQty: 0 \nPrice: 65 \nCategory: School Supplies', '2024-06-07 22:36:12'),
(64, 4, 'Products', 'ADD', 'NEW ITEM: 2223391247611\nProduct: K94 Face Mask-White 10\'s \nQty: 0 \nPrice: 100 \nCategory: Health And Wellness', '2024-06-07 22:37:14'),
(65, 6, 'Products', 'ADD', 'NEW ITEM: 22231014331\nProduct: Art Paper Assorted Colors \nQty: 0 \nPrice: 28 \nCategory: Art Supplies', '2024-06-07 22:37:50'),
(66, 4, 'Products', 'ADD', 'NEW ITEM: 2223483946514\nProduct: K94 Face Mask-Beige 10\'s \nQty: 0 \nPrice: 100 \nCategory: Health And Wellness', '2024-06-07 22:37:52'),
(67, 6, 'Products', 'UPDATE', 'UPDATED ITEM: 22231014331\nCurrent Stock Increased: 0 → 20(+20)', '2024-06-07 22:38:03'),
(68, 6, 'Products', 'UPDATE', 'UPDATED ITEM: 22231014331\nProduct Name: Art Paper Assorted Colors → Art Paper Assorted (1Pack)', '2024-06-07 22:38:17'),
(69, 5, 'Products', 'ADD', 'NEW ITEM: 2223890225879\nProduct: Hand Sanitizer \nQty: 0 \nPrice: 250 \nCategory: Personal Care', '2024-06-07 22:39:28'),
(70, 6, 'Products', 'ADD', 'NEW ITEM: 2223915292235\nProduct: Crayola Crayon (48 Colors) \nQty: 0 \nPrice: 180 \nCategory: Art Supplies', '2024-06-07 22:39:46'),
(71, 6, 'Products', 'UPDATE', 'UPDATED ITEM: 2223915292235\nCurrent Stock Increased: 0 → 20(+20)', '2024-06-07 22:40:00'),
(72, 5, 'Products', 'UPDATE', 'UPDATED ITEM: 2223890225879\nCurrent Stock Increased: 0 → 25(+25)', '2024-06-07 22:40:23'),
(73, 6, 'Products', 'UPDATE', 'UPDATED ITEM: 222358413372\nCurrent Stock Increased: 0 → 50(+50)', '2024-06-07 22:40:56'),
(74, 6, 'Products', 'UPDATE', 'UPDATED ITEM: 2223467683847\nCurrent Stock Increased: 0 → 40(+40)', '2024-06-07 22:41:26'),
(75, 4, 'Products', 'ADD', 'NEW ITEM: 2223278107346\nProduct: Flex Office Whiteboard Marker-Black \nQty: 0 \nPrice: 32 \nCategory: School Supplies', '2024-06-07 22:41:35'),
(76, 6, 'Products', 'UPDATE', 'UPDATED ITEM: 2223532342884\nCurrent Stock Increased: 0 → 60(+60)', '2024-06-07 22:41:46'),
(77, 6, 'Products', 'UPDATE', 'UPDATED ITEM: 2223877671221\nCurrent Stock Increased: 0 → 60(+60)', '2024-06-07 22:42:04'),
(78, 6, 'Products', 'UPDATE', 'UPDATED ITEM: 2223854954396\nCurrent Stock Increased: 0 → 60(+60)', '2024-06-07 22:42:17'),
(79, 6, 'Products', 'UPDATE', 'UPDATED ITEM: 2223779806324\nCurrent Stock Increased: 0 → 30(+30)', '2024-06-07 22:42:49'),
(80, 6, 'Products', 'UPDATE', 'UPDATED ITEM: 2223997216704\nCurrent Stock Increased: 0 → 30(+30)', '2024-06-07 22:43:03'),
(81, 6, 'Products', 'UPDATE', 'UPDATED ITEM: 2223562280728\nCurrent Stock Increased: 0 → 50(+50)', '2024-06-07 22:43:15'),
(82, 6, 'Products', 'UPDATE', 'UPDATED ITEM: 2223483946514\nCurrent Stock Increased: 0 → 50(+50)', '2024-06-07 22:43:35'),
(83, 6, 'Products', 'UPDATE', 'UPDATED ITEM: 2223391247611\nCurrent Stock Increased: 0 → 50(+50)', '2024-06-07 22:43:44'),
(84, 6, 'Products', 'UPDATE', 'UPDATED ITEM: 2223278107346\nCurrent Stock Increased: 0 → 100(+100)', '2024-06-07 22:44:19'),
(85, 5, 'Products', 'ADD', 'NEW ITEM: 222392454496\nProduct: Badminton Racket \nQty: 0 \nPrice: 449 \nCategory: Sports Equipment', '2024-06-07 22:46:15'),
(86, 5, 'Products', 'UPDATE', 'UPDATED ITEM: 222392454496\nCurrent Stock Increased: 0 → 10(+10)', '2024-06-07 22:47:04'),
(87, 4, 'Products', 'ADD', 'NEW ITEM: 2223147140815\nProduct: Superstix Choco Jr 55s 350g \nQty: 0 \nPrice: 80 \nCategory: Snacks', '2024-06-07 22:48:43'),
(88, 4, 'Products', 'DELETE', 'DELETED ITEM: 2223147140815 \nProduct Name: Superstix Choco Jr 55s 350g \nQty: 0 \nPrice: 80.00\n Category: Snacks', '2024-06-07 22:48:53'),
(89, 4, 'Products', 'ADD', 'NEW ITEM: 2223249887728\nProduct: Superstix Choco Jr 55s 350g \nQty: 0 \nPrice: 80 \nCategory: Snacks', '2024-06-07 22:50:18'),
(90, 5, 'Products', 'ADD', 'NEW ITEM: 2223185832550\nProduct: Voltz Micro Charger \nQty: 0 \nPrice: 199 \nCategory: Electronics', '2024-06-07 22:50:52'),
(91, 5, 'Products', 'UPDATE', 'UPDATED ITEM: 2223185832550\nCurrent Stock Increased: 0 → 25(+25)', '2024-06-07 22:51:07'),
(92, 4, 'Products', 'ADD', 'NEW ITEM: 2223785686043\nProduct: Mega Prime Dried Mangoes 100g \nQty: 0 \nPrice: 140 \nCategory: Snacks', '2024-06-07 22:52:08'),
(93, 5, 'Products', 'ADD', 'NEW ITEM: 2223776408243\nProduct: Voltz \nQty: 0 \nPrice: 99 \nCategory: Electronics', '2024-06-07 22:52:22'),
(94, 5, 'Products', 'UPDATE', 'UPDATED ITEM: 2223776408243\nCurrent Stock Increased: 0 → 10(+10)', '2024-06-07 22:53:04'),
(95, 4, 'Products', 'ADD', 'NEW ITEM: 2223546152688\nProduct: Coke Zero Sugar Vanilla 320ml \nQty: 0 \nPrice: 38 \nCategory: Beverages', '2024-06-07 22:53:27'),
(96, 5, 'Products', 'ADD', 'NEW ITEM: 2223145835111\nProduct: Gear Jersey \nQty: 0 \nPrice: 350 \nCategory: School Merch', '2024-06-07 22:58:22'),
(97, 5, 'Products', 'ADD', 'NEW ITEM: 2223357280018\nProduct: TUP T-Shirt Black \nQty: 0 \nPrice: 199 \nCategory: School Merch', '2024-06-07 22:59:08'),
(98, 5, 'Products', 'ADD', 'NEW ITEM: 2223496494075\nProduct: TUP T-Shirt White \nQty: 0 \nPrice: 199 \nCategory: Unknown Category', '2024-06-07 22:59:28'),
(99, 5, 'Products', 'ADD', 'NEW ITEM: 2223177053785\nProduct: TUP T-Shirt White \nQty: 0 \nPrice: 199 \nCategory: School Merch', '2024-06-07 22:59:51'),
(100, 5, 'Products', 'ADD', 'NEW ITEM: 2223504339695\nProduct: Gear - Track Jacket \nQty: 0 \nPrice: 450 \nCategory: School Merch', '2024-06-07 23:00:40'),
(101, 5, 'Products', 'ADD', 'NEW ITEM: 2223250828667\nProduct: Pillows \nQty: 0 \nPrice: 15 \nCategory: Snacks', '2024-06-07 23:01:52'),
(102, 5, 'Products', 'ADD', 'NEW ITEM: 2223978865099\nProduct: Yellow Pad Paper \nQty: 0 \nPrice: 60 \nCategory: School Supplies', '2024-06-07 23:02:38'),
(103, 4, 'Products', 'ADD', 'NEW ITEM: 2223662440624\nProduct: Potchi Strawberry Cream 50s \nQty: 0 \nPrice: 45 \nCategory: Snacks', '2024-06-07 23:03:21'),
(104, 4, 'Products', 'ADD', 'NEW ITEM: 222385273909\nProduct: Oil Control Sheet-Charcoal 100s \nQty: 0 \nPrice: 60 \nCategory: Personal Care', '2024-06-07 23:04:22'),
(105, 4, 'Products', 'ADD', 'NEW ITEM: 2223493349143\nProduct: Pocky Strawberry Mini 19g \nQty: 0 \nPrice: 35 \nCategory: Snacks', '2024-06-07 23:05:35'),
(106, 5, 'Products', 'ADD', 'NEW ITEM: 222313904187\nProduct: Piattos (Cheese) \nQty: 0 \nPrice: 20 \nCategory: Snacks', '2024-06-07 23:06:04'),
(107, 5, 'Products', 'DELETE', 'DELETED ITEM: 222313904187 \nProduct Name: Piattos (Cheese) \nQty: 0 \nPrice: 20.00\n Category: Snacks', '2024-06-07 23:06:25'),
(108, 4, 'Products', 'ADD', 'NEW ITEM: 2223173021619\nProduct: Century Tuna Flakes 155g \nQty: 0 \nPrice: 45 \nCategory: Snacks', '2024-06-07 23:07:24');

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

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `if_deleted`) VALUES
(1, 'Beverages', 'Water, Sports Drink, Juice, Tea, Coffee, Milk, Smoothie, Energy Drinks, Lemonade', 0),
(2, 'School Merch', 'Apparel, Accessories, Stationery, Drinkware, Tech Accessories, Miscellaneous Items', 0),
(3, 'School Supplies', 'Writing Instruments, Paper Products, Organizational Tools, Technology and Accessories, Art Supplies, Classroom Essentials, Backpack and Bags, Study Aids, Health and Hygiene, Miscellaneous Supplies', 0),
(4, 'Snacks', 'Salty Snacks, Sweet Snacks, Healthy Snacks, Protein-Rich Snacks, Dairy Snacks, Baked Snacks, Specialty Snacks', 0),
(5, 'Personal Care', ' Hand Sanitizers, Tissues, Face Masks, Lip Balm, Sunscreen, Hand Lotion, Hair Ties, Combs, Deodorant.', 0),
(6, 'Cleaning Supplies', 'Disinfectant Wipes, All-Purpose Cleaners,  Broom and Dustpan, Trash Bags, Sponges, Dish Soap, Mop, Hand Soap.', 0),
(7, 'Gifts And Souvenirs', 'Keychains, Mugs, T-Shirts, Tote Bags, Postcards, Magnets, Photo Frames, Decorative Items, Memorabilia.', 0),
(8, 'Health And Wellness', ' Vitamins, Supplements, First Aid Kits, Health Monitors, Fitness Equipment, Essential Oils, Yoga Mats, Exercise Bands.', 0),
(9, 'Books And Magazines', 'Textbooks, Novels, Reference Books, Magazines, Journals, Educational Guides, Comic Books, Workbooks.', 0),
(10, 'Sports Equipment', 'Balls (Basketball, Soccer, Volleyball), Sportswear, Water Bottles, Gym Bags, Protective Gear, Fitness Trackers, Sports Shoes.', 0),
(11, 'Art Supplies', ' Paints, Brushes, Sketchbooks, Colored Pencils, Markers, Clay, Easels, Canvas, Glue, Crafting Kits.', 0),
(12, 'Electronics', 'Chargers, USB Drives, Headphones, Calculators, Batteries, Power Banks, Laptop Accessories, Screen Protectors, Adapters.', 0),
(13, 'Toys And Games', 'Board Games, Puzzles, Action Figures, Dolls, Educational Toys, Outdoor Toys, Card Games, Video Games.', 0);

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

--
-- Dumping data for table `deleted_items`
--

INSERT INTO `deleted_items` (`id`, `deleted_id`, `from_table`, `user_id`, `date_deleted`, `if_restored`) VALUES
(1, 24, 'Products', 4, '2024-06-07 22:48:53', 0),
(2, 40, 'Products', 5, '2024-06-07 23:06:25', 0);

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

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `barcode`, `description`, `category_id`, `stock`, `amount`, `image`, `user_id`, `date`, `date_modified`, `views`, `if_deleted`) VALUES
(1, '2223426366325', 'Coca Cola Zero 325ml', 1, 49, 37.00, 'uploads/products/4f3237887533bb9a2fb7d3eff403f5cca88feb69_1719.jpg', 7, '2024-06-07 21:44:17', '2024-06-07 22:19:12', 1, 0),
(2, '2223337259246', '7-UP ', 1, 48, 35.00, 'uploads/products/09192d7ecf76988702bf9a0e1b508043661147a3_7317.jpg', 7, '2024-06-07 22:00:18', '2024-06-07 22:26:58', 1, 0),
(3, '2223225640412', 'Mountain Dew 330ml', 1, 78, 35.00, 'uploads/products/5b49c4bf248611bee0f1f53dbb946dfbcb2da9c8_3476.png', 7, '2024-06-07 22:03:10', '2024-06-07 22:29:36', 1, 0),
(4, '2223467683847', 'Royal Tru Orange', 1, 39, 36.00, 'uploads/products/fe774f093158cee93866a03c94b375d235976997_6425.png', 7, '2024-06-07 22:06:26', '2024-06-07 22:41:26', 1, 0),
(5, '2223532342884', 'Boy Bawang Cornick Garlic Flavor 90g', 4, 58, 20.00, 'uploads/products/d867b9463b135d7d80ef828dfb14463e2a6d4818_4239.jpg', 7, '2024-06-07 22:09:23', '2024-06-07 22:41:46', 1, 0),
(6, '2223877671221', 'Piattos Cheese 85g', 4, 55, 45.00, 'uploads/products/e6ef59a3a3eecb4fcd8eb711aeb95bb96af0540e_5069.jpg', 7, '2024-06-07 22:10:29', '2024-06-07 22:42:04', 2, 0),
(7, '222358413372', 'Mang Juan Espesyal Suka\'t Sili 90g', 4, 47, 25.00, 'uploads/products/3d5bcff88d569680c736665854304f6fd3867359_6167.jpg', 7, '2024-06-07 22:11:37', '2024-06-07 22:40:56', 1, 0),
(8, '2223854954396', 'Piattos Roadhouse Barbecue 85g', 4, 58, 45.00, 'uploads/products/f6c615e294dfd39e2d40d31966220b75421c719e_6354.jpg', 7, '2024-06-07 22:12:49', '2024-06-07 22:42:17', 1, 0),
(9, '2223885790815', 'Brown Envelope Short', 3, 100, 10.00, 'uploads/products/5f59f33850d63c739f980cbc2fb02b197d924ed7_3327.jpg', 7, '2024-06-07 22:15:22', '2024-06-07 22:31:29', 0, 0),
(10, '2223913989232', 'Brown Envelope Long', 3, 70, 15.00, 'uploads/products/2adefe70c025b7f265bbadf8682589afeeec4a59_3653.jpg', 7, '2024-06-07 22:16:41', '2024-06-07 22:33:32', 1, 0),
(11, '2223738610543', 'Plastic Ruler 12\"x1\"', 3, 45, 15.00, 'uploads/products/98b52d5582233118c3f54c2399d3ec9ed5739e7d_9409.jpg', 7, '2024-06-07 22:18:21', '2024-06-07 22:31:52', 2, 0),
(12, '222352056946', 'Toblerone Milk 35g', 4, 45, 60.00, 'uploads/products/d099a10f54262832cd05a69bb6ecb1498b732e74_6685.jpg', 4, '2024-06-07 22:18:25', '2024-06-07 22:27:19', 0, 0),
(13, '2223562280728', 'Oishi Choco Chug 250 ml', 1, 50, 35.00, 'uploads/products/8ea99d73a54de4fb62a27b691e082541c7981a29_4162.jpg', 4, '2024-06-07 22:25:29', '2024-06-07 22:43:15', 0, 0),
(14, '2223207025516', 'Pocari Sweat 350mL', 1, 99, 40.00, 'uploads/products/46a3575b11b746000b45c3b88bab367a32bd9757_2278.jpg', 4, '2024-06-07 22:27:09', '2024-06-07 22:31:32', 1, 0),
(15, '2223779806324', 'Best Buy Clipboard-Long-Pink', 3, 29, 85.00, 'uploads/products/fad6b797148d13be385717ebd14e653e728cae5c_5316.jpg', 4, '2024-06-07 22:35:08', '2024-06-07 22:42:49', 1, 0),
(16, '2223997216704', 'Best Buy Clipboard-Short-Yellow', 3, 30, 65.00, 'uploads/products/ce67cfe6bab2ae8567a5e04f0bb912a45ff9e521_9638.jpg', 4, '2024-06-07 22:36:12', '2024-06-07 22:43:03', 0, 0),
(17, '2223391247611', 'K94 Face Mask-White 10\'s', 8, 50, 100.00, 'uploads/products/2655a1f84c7e37a995ee04c98ad4cbe8b250a7a6_9066.jpg', 4, '2024-06-07 22:37:14', '2024-06-07 22:43:44', 0, 0),
(18, '22231014331', 'Art Paper Assorted (1Pack)', 11, 19, 28.00, 'uploads/products/c6f1f2d80f7c7d76a5fa58dd6024edb3b639ab59_9647.jpg', 6, '2024-06-07 22:37:50', '2024-06-07 22:38:17', 1, 0),
(19, '2223483946514', 'K94 Face Mask-Beige 10\'s', 8, 50, 100.00, 'uploads/products/d3955d0121b50bc79938eaf6c41d214d18be7cdb_1795.jpg', 4, '2024-06-07 22:37:52', '2024-06-07 22:43:35', 0, 0),
(20, '2223890225879', 'Hand Sanitizer', 5, 23, 250.00, 'uploads/products/6dae852ada29e3edb9006cc2feab54484c14bdf5_7756.jpg', 5, '2024-06-07 22:39:28', '2024-06-07 22:40:23', 1, 0),
(21, '2223915292235', 'Crayola Crayon (48 Colors)', 11, 18, 180.00, 'uploads/products/42a45c40b6c73664cae2a0df4ff8b845e95465bd_7328.jpg', 6, '2024-06-07 22:39:46', '2024-06-07 22:40:00', 2, 0),
(22, '2223278107346', 'Flex Office Whiteboard Marker-Black', 3, 98, 32.00, 'uploads/products/8a984374f0118ccb6a48826b3c8db8c6d62d5225_3720.jpg', 4, '2024-06-07 22:41:35', '2024-06-07 22:44:19', 1, 0),
(23, '222392454496', 'Badminton Racket', 10, 9, 449.00, 'uploads/products/0f2ea94de896ffb4cdd056cfaf318cdf112de59c_3272.jpg', 5, '2024-06-07 22:46:15', '2024-06-07 22:47:04', 1, 0),
(24, '2223147140815', 'Superstix Choco Jr 55s 350g', 4, 0, 80.00, 'uploads/products/7b390caf664b5bdb41589f769449453b8429a3c3_1810.png', 4, '2024-06-07 22:48:43', NULL, 0, 1),
(25, '2223249887728', 'Superstix Choco Jr 55s 350g', 4, 0, 80.00, 'uploads/products/22ce1f1fe8b3179c203a5c538550c83d27d9a2a5_3582.jpg', 4, '2024-06-07 22:50:18', NULL, 0, 0),
(26, '2223185832550', 'Voltz Micro Charger', 12, 25, 199.00, 'uploads/products/abbf87d5a8989b72f76210bbb12cafab56db730d_3239.jpg', 5, '2024-06-07 22:50:52', '2024-06-07 22:51:07', 0, 0),
(27, '2223785686043', 'Mega Prime Dried Mangoes 100g', 4, 0, 140.00, 'uploads/products/a23747a87364a1e619c09b53a8622546e7e2265e_3940.jpg', 4, '2024-06-07 22:52:08', NULL, 0, 0),
(28, '2223776408243', 'Voltz', 12, 10, 99.00, 'uploads/products/614c40f67a9831d48dbcb9ebaeb1c22bbfdba9d1_4836.jpg', 5, '2024-06-07 22:52:22', '2024-06-07 22:53:04', 0, 0),
(29, '2223546152688', 'Coke Zero Sugar Vanilla 320ml', 1, 0, 38.00, 'uploads/products/b8841ca40b73bdba52d8c9cb2c21f4fa0ae5c6bb_4838.jpg', 4, '2024-06-07 22:53:27', NULL, 0, 0),
(30, '2223145835111', 'Gear Jersey', 2, 0, 350.00, 'uploads/products/7a0fe41eae4ad56412659142372083b0e20b1182_1669.jpg', 5, '2024-06-07 22:58:22', NULL, 0, 0),
(31, '2223357280018', 'TUP T-Shirt Black', 2, 0, 199.00, 'uploads/products/429ebe8f9af3c49ad020dd9276d91db2e353a393_2381.jpg', 5, '2024-06-07 22:59:08', NULL, 0, 0),
(33, '2223177053785', 'TUP T-Shirt White', 2, 0, 199.00, 'uploads/products/7ed9d6637c1564aa674879fc63421035ae5405e0_2542.jpg', 5, '2024-06-07 22:59:51', NULL, 0, 0),
(34, '2223504339695', 'Gear - Track Jacket', 2, 0, 450.00, 'uploads/products/088fa1f2b7e89b7fff63b059d9221695f53653bb_8634.jpg', 5, '2024-06-07 23:00:40', NULL, 0, 0),
(35, '2223250828667', 'Pillows', 4, 0, 15.00, 'uploads/products/cc5e421b223d41439835a532e7f60cf66001f724_1836.png', 5, '2024-06-07 23:01:52', NULL, 0, 0),
(36, '2223978865099', 'Yellow Pad Paper', 3, 0, 60.00, 'uploads/products/406f6ddf917d464224b9e6abf54a6d648f0421ad_2070.jpg', 5, '2024-06-07 23:02:38', NULL, 0, 0),
(37, '2223662440624', 'Potchi Strawberry Cream 50s', 4, 0, 45.00, 'uploads/products/1dd3e0b6cad054eb2bbc6e09cbce2165f04554ca_2620.jpg', 4, '2024-06-07 23:03:21', NULL, 0, 0),
(38, '222385273909', 'Oil Control Sheet-Charcoal 100s', 5, 0, 60.00, 'uploads/products/a2bbfecae69b7efbf3942e2eeb711e3e791cc5cf_2387.jpg', 4, '2024-06-07 23:04:22', NULL, 0, 0),
(39, '2223493349143', 'Pocky Strawberry Mini 19g', 4, 0, 35.00, 'uploads/products/6f515708bdde265447928b563f8be53e351c92e8_6049.jpg', 4, '2024-06-07 23:05:35', NULL, 0, 0),
(40, '222313904187', 'Piattos (Cheese)', 4, 0, 20.00, 'uploads/products/e91836e4765b3294e896230ee7e4c9450e16f751_5146.png', 5, '2024-06-07 23:06:04', NULL, 0, 1),
(41, '2223173021619', 'Century Tuna Flakes 155g', 4, 0, 45.00, 'uploads/products/de06377c9e797c57fa74804f0d37ea6f2a51ead7_7080.jpg', 4, '2024-06-07 23:07:24', NULL, 0, 0);

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

--
-- Dumping data for table `removed_stocks`
--

INSERT INTO `removed_stocks` (`id`, `product_id`, `removed_qty`, `status`, `remarks`, `user_id`, `date`) VALUES
(1, 14, 50, 'Expired', 'Please throw asap', 5, '2024-06-07 22:31:32'),
(2, 10, 25, 'Damaged', 'Return to supplier', 5, '2024-06-07 22:33:32');

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

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `product_id`, `barcode`, `receipt_no`, `description`, `category_id`, `qty`, `amount`, `total`, `date`, `user_id`) VALUES
(1, 10, '2223913989232', '2152-1', 'Brown Envelope Long', 3, 5, 15.00, 75.00, '2024-06-07 22:48:23', 3),
(2, 11, '2223738610543', '2152-1', 'Plastic Ruler 12\"x1\"', 3, 3, 15.00, 45.00, '2024-06-07 22:48:23', 3),
(3, 22, '2223278107346', '2152-1', 'Flex Office Whiteboard Marker-Black', 3, 2, 32.00, 64.00, '2024-06-07 22:48:23', 3),
(4, 15, '2223779806324', '2152-2', 'Best Buy Clipboard-Long-Pink', 3, 1, 85.00, 85.00, '2024-06-07 22:48:43', 3),
(5, 2, '2223337259246', '2152-3', '7-UP ', 1, 2, 35.00, 70.00, '2024-06-07 22:49:11', 3),
(6, 3, '2223225640412', '2152-3', 'Mountain Dew 330ml', 1, 2, 35.00, 70.00, '2024-06-07 22:49:11', 3),
(7, 4, '2223467683847', '2152-3', 'Royal Tru Orange', 1, 1, 36.00, 36.00, '2024-06-07 22:49:11', 3),
(8, 1, '2223426366325', '2152-3', 'Coca Cola Zero 325ml', 1, 1, 37.00, 37.00, '2024-06-07 22:49:11', 3),
(9, 6, '2223877671221', '2152-4', 'Piattos Cheese 85g', 4, 4, 45.00, 180.00, '2024-06-07 22:49:29', 3),
(10, 7, '222358413372', '2152-4', 'Mang Juan Espesyal Suka\'t Sili 90g', 4, 3, 25.00, 75.00, '2024-06-07 22:49:29', 3),
(11, 8, '2223854954396', '2152-4', 'Piattos Roadhouse Barbecue 85g', 4, 2, 45.00, 90.00, '2024-06-07 22:49:29', 3),
(12, 5, '2223532342884', '2152-4', 'Boy Bawang Cornick Garlic Flavor 90g', 4, 2, 20.00, 40.00, '2024-06-07 22:49:29', 3),
(13, 14, '2223207025516', '2152-5', 'Pocari Sweat 350mL', 1, 1, 40.00, 40.00, '2024-06-07 22:49:58', 3),
(14, 6, '2223877671221', '2152-5', 'Piattos Cheese 85g', 4, 1, 45.00, 45.00, '2024-06-07 22:49:58', 3),
(15, 20, '2223890225879', '2152-6', 'Hand Sanitizer', 5, 2, 250.00, 500.00, '2024-06-07 22:51:55', 3),
(16, 21, '2223915292235', '2152-6', 'Crayola Crayon (48 Colors)', 11, 1, 180.00, 180.00, '2024-06-07 22:51:55', 3),
(17, 18, '22231014331', '2152-6', 'Art Paper Assorted (1Pack)', 11, 1, 28.00, 28.00, '2024-06-07 22:51:55', 3),
(18, 11, '2223738610543', '2152-6', 'Plastic Ruler 12\"x1\"', 3, 2, 15.00, 30.00, '2024-06-07 22:51:55', 3),
(19, 23, '222392454496', '2152-7', 'Badminton Racket', 10, 1, 449.00, 449.00, '2024-06-07 22:52:40', 3),
(20, 21, '2223915292235', '2151-8', 'Crayola Crayon (48 Colors)', 11, 1, 180.00, 180.00, '2024-06-07 22:54:03', 5);

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

--
-- Dumping data for table `stock_inventory`
--

INSERT INTO `stock_inventory` (`id`, `product_id`, `category_id`, `stock_in`, `stock_out`, `date_updated`) VALUES
(1, 1, 1, 50, 0, '2024-06-07 22:19:12'),
(2, 2, 1, 50, 0, '2024-06-07 22:26:58'),
(3, 12, 4, 45, 0, '2024-06-07 22:27:19'),
(4, 3, 1, 40, 0, '2024-06-07 22:28:00'),
(5, 3, 1, 40, 0, '2024-06-07 22:29:36'),
(6, 14, 1, 150, 0, '2024-06-07 22:29:58'),
(7, 9, 3, 100, 0, '2024-06-07 22:31:29'),
(8, 14, 1, 0, 50, '2024-06-07 22:31:32'),
(9, 10, 3, 100, 0, '2024-06-07 22:31:37'),
(10, 11, 3, 50, 0, '2024-06-07 22:31:52'),
(11, 10, 3, 0, 25, '2024-06-07 22:33:32'),
(12, 18, 11, 20, 0, '2024-06-07 22:38:03'),
(13, 21, 11, 20, 0, '2024-06-07 22:40:00'),
(14, 20, 5, 25, 0, '2024-06-07 22:40:23'),
(15, 7, 4, 50, 0, '2024-06-07 22:40:56'),
(16, 4, 1, 40, 0, '2024-06-07 22:41:26'),
(17, 5, 4, 60, 0, '2024-06-07 22:41:46'),
(18, 6, 4, 60, 0, '2024-06-07 22:42:04'),
(19, 8, 4, 60, 0, '2024-06-07 22:42:17'),
(20, 15, 3, 30, 0, '2024-06-07 22:42:49'),
(21, 16, 3, 30, 0, '2024-06-07 22:43:03'),
(22, 13, 1, 50, 0, '2024-06-07 22:43:15'),
(23, 19, 8, 50, 0, '2024-06-07 22:43:35'),
(24, 17, 8, 50, 0, '2024-06-07 22:43:44'),
(25, 22, 3, 100, 0, '2024-06-07 22:44:19'),
(26, 23, 10, 10, 0, '2024-06-07 22:47:04'),
(27, 26, 12, 25, 0, '2024-06-07 22:51:07'),
(28, 28, 12, 10, 0, '2024-06-07 22:53:04');

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
  `if_deleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `company_name`, `company_address`, `contact_person`, `contact_number`, `contact_email`, `business_type`, `if_deleted`) VALUES
(1, 'Global Supplies Inc.', '1234 Business Park Road Makati City, 1226 Metro Manila, Philippines', 'Maria Santos', '+63 912 345 6789', 'm.santos@globalsupplies.com', 'Wholesale', 0),
(2, 'Metro Retail Stores Group, Inc.', 'Vicsal Building, Ouano Avenue cor. E.O. Perez Street, Subangdaku, Mandaue City, Cebu 6014, Philippines', ' Frank S. Gaisano', '+63-32-236-8390', 'frank.gaisano@metroretail.com.ph', 'Retails', 0),
(3, ' Puregold Price Club, Inc.', 'Tabacalera Compound, E. Rodriguez Jr. Avenue, Barangay Ugong, Pasig City 1604, Philippines', 'Leonardo B. Dayao', '+63-2-8650-0731', ' leonardo.dayao@puregold.com.ph', 'Wholesale', 0),
(4, 'Wilcon Depot, Inc.', 'Wilcon Center, 121 Visayas Avenue, Quezon City 1128, Philippines', 'William T. Belo', '+63-2-8277-9888', 'william.belo@wilcon.com.ph', 'Vendor', 0),
(5, 'Mercury Drug Corporation', ' 7 Mercury Avenue, Bagumbayan, Quezon City 1110, Philippines', ' Vivian Q. Azcona', '+63-2-8539-2021', 'vivian.azcona@mercurydrug.com', 'Wholesale', 0),
(6, 'National Book Store', 'Quad Alpha Centrum Building, 125 Pioneer Street, Mandaluyong City 1550, Philippines', 'Adrian Ramos', '+63-2-8888-6272', 'adrian.ramos@nationalbookstore.com', 'Wholesale', 0),
(7, 'Office Warehouse, Inc.', ' 2316 Chino Roces Avenue Extension, Makati City 1231, Philippines', 'Jennifer Lim', '+63-2-8898-1333', ' jennifer.lim@officewarehouse.com.ph', 'Vendor', 0),
(8, 'Sterling Paper Products Enterprises, Inc.', '2302 Sterling Place, Pasong Tamo Extension, Makati City 1231, Philippines', 'Henry Lim Bon Liong', ' +63-2-8888-4777', ' henry.lim@sterlingpaper.com', 'Importers', 0),
(9, 'Pandayan Bookshop, Inc.', '810 Aurora Boulevard, Cubao, Quezon City 1109, Philippines', 'Isagani Hizon', '+63-2-8911-8771', 'isagani.hizon@pandayan.com.ph', 'Importers', 0),
(10, 'Booksale', ' 341 N. Domingo Street, San Juan City 1500, Philippines', 'Roberto Ramos', '+63-2-8725-6139', ' roberto.ramos@booksale.com.ph', 'Raw Materials', 0);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `deleted_items`
--
ALTER TABLE `deleted_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `refunded_items`
--
ALTER TABLE `refunded_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `removed_stocks`
--
ALTER TABLE `removed_stocks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `restored_items`
--
ALTER TABLE `restored_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `stock_inventory`
--
ALTER TABLE `stock_inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

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
