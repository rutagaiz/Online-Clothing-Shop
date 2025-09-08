-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 21, 2025 at 11:29 PM
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
-- Database: `e-shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id_CATEGORY` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `fk_SELECTION` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id_CATEGORY`, `name`, `fk_SELECTION`) VALUES
(1, 'Clothing', NULL),
(2, 'Outerwear', NULL),
(3, 'Footwear', NULL),
(4, 'Jackets', NULL),
(5, 'Rain Gear', NULL),
(6, 'Dresses', 2),
(7, 'Accessories', NULL),
(8, 'Shirts', NULL),
(9, 'Hats', NULL),
(10, 'Bags', 2),
(11, 'Pants', NULL),
(12, 'Workout Gear', NULL),
(13, 'Swimwear', NULL),
(14, 'Sleepwear', NULL),
(15, 'Activewear', NULL),
(16, 'Underwear', NULL),
(17, 'Socks', NULL),
(18, 'Belt Accessories', NULL),
(19, 'Ties and Scarves', 1),
(20, 'Gloves', NULL),
(21, 'Kelnės', 1),
(22, 'Marškiniai', 2),
(23, 'Suknelės', 2),
(24, 'Švarkai', 1),
(25, 'Vaikiški megztiniai', 3),
(26, 'Sportinė apranga', 1),
(27, 'Sportinės suknelės', 2),
(28, 'Vaikiškos striukės', 3),
(29, 'Pižamos', 2);

-- --------------------------------------------------------

--
-- Table structure for table `colours`
--

CREATE TABLE `colours` (
  `id_COLOUR` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `colourShade` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `colours`
--

INSERT INTO `colours` (`id_COLOUR`, `name`, `colourShade`) VALUES
(1, 'Red', 'Bright'),
(2, 'Blue', 'Dark'),
(3, 'Green', 'Forest'),
(4, 'Yellow', 'Sunny'),
(5, 'Black', 'Matte'),
(6, 'White', 'Pearl'),
(7, 'Purple', 'Royal'),
(8, 'Orange', 'Neon'),
(9, 'Pink', 'Pastel'),
(10, 'Brown', 'Chocolate'),
(11, 'Brown', 'Cinnamon'),
(12, 'Beige', 'Sand'),
(13, 'Turquoise', 'Ocean'),
(14, 'Teal', 'Dark Teal'),
(15, 'Violet', 'Deep Violet'),
(16, 'Indigo', 'Midnight'),
(17, 'Gold', 'Shiny'),
(18, 'Silver', 'Sterling'),
(19, 'Copper', 'Burnished'),
(20, 'Emerald', 'Bright Green'),
(22, 'sfefe', 'fefefe'),
(23, 'fwefefefe', 'fefefefefe'),
(24, 'AA', 'AA'),
(25, '1', '1'),
(26, 'Color-100', '1'),
(27, 'Color-101', '2'),
(28, 'Color-102', '3'),
(29, 'Color-103', '4'),
(30, 'Color-104', '5'),
(31, 'Color-105', '6'),
(32, 'Color-106', '7'),
(33, 'Color-107', '8'),
(34, 'Color-108', '9'),
(35, 'Color-109', '10'),
(36, 'Color-110', '1'),
(37, 'Color-111', '2'),
(38, 'Color-112', '3'),
(39, 'Color-113', '4'),
(40, 'Color-114', '5'),
(41, 'Color-115', '6'),
(42, 'Color-116', '7'),
(43, 'Color-117', '8'),
(44, 'Color-118', '9'),
(45, 'Color-119', '10'),
(46, 'Juoda', 'Tamsi'),
(47, 'Balta', 'Šviesi'),
(48, 'Raudona', 'Tamsi'),
(49, 'Mėlyna', 'Šalta'),
(50, 'Žalia', 'Gamta'),
(51, 'Geltona', 'Ryški'),
(52, 'Rožinė', 'Pastelinė'),
(53, 'Oranžinė', 'Vasariška'),
(54, 'Pilka', 'Neutrali'),
(55, 'Ruda', 'Natūrali'),
(216, 'Color-10', '1'),
(217, 'Color-11', '2'),
(218, 'Color-12', '3'),
(219, 'Color-13', '4'),
(220, 'Color-14', '5'),
(221, 'Color-15', '6'),
(222, 'Color-16', '7'),
(223, 'Color-17', '8'),
(224, 'Color-18', '9'),
(225, 'Color-19', '10'),
(226, 'Color-20', '1'),
(227, 'Color-21', '2'),
(228, 'Color-22', '3'),
(229, 'Color-23', '4'),
(230, 'Color-24', '5'),
(231, 'Color-25', '6'),
(232, 'Color-26', '7'),
(233, 'Color-27', '8'),
(234, 'Color-28', '9'),
(235, 'Color-29', '10'),
(236, 'Color-10', '1'),
(237, 'Color-11', '2'),
(238, 'Color-12', '3'),
(239, 'Color-13', '4'),
(240, 'Color-14', '5'),
(241, 'Color-15', '6'),
(242, 'Color-16', '7'),
(243, 'Color-17', '8'),
(244, 'Color-18', '9'),
(245, 'Color-19', '10'),
(246, 'Color-20', '1'),
(247, 'Color-21', '2'),
(248, 'Color-22', '3'),
(249, 'Color-23', '4'),
(250, 'Color-24', '5'),
(251, 'Color-25', '6'),
(252, 'Color-26', '7'),
(253, 'Color-27', '8'),
(254, 'Color-28', '9'),
(255, 'Color-29', '10'),
(256, 'Color-10', '1'),
(257, 'Color-11', '2'),
(258, 'Color-12', '3'),
(259, 'Color-13', '4'),
(260, 'Color-14', '5'),
(261, 'Color-15', '6'),
(262, 'Color-16', '7'),
(263, 'Color-17', '8'),
(264, 'Color-18', '9'),
(265, 'Color-19', '10'),
(266, 'Color-20', '1'),
(267, 'Color-21', '2'),
(268, 'Color-22', '3'),
(269, 'Color-23', '4'),
(270, 'Color-24', '5'),
(271, 'Color-25', '6'),
(272, 'Color-26', '7'),
(273, 'Color-27', '8'),
(274, 'Color-28', '9'),
(275, 'Color-29', '10'),
(276, 'Color-10', '1'),
(277, 'Color-11', '2'),
(278, 'Color-12', '3'),
(279, 'Color-13', '4'),
(280, 'Color-14', '5'),
(281, 'Color-15', '6'),
(282, 'Color-16', '7'),
(283, 'Color-17', '8'),
(284, 'Color-18', '9'),
(285, 'Color-19', '10'),
(286, 'Color-20', '1'),
(287, 'Color-21', '2'),
(288, 'Color-22', '3'),
(289, 'Color-23', '4'),
(290, 'Color-24', '5'),
(291, 'Color-25', '6'),
(292, 'Color-26', '7'),
(293, 'Color-27', '8'),
(294, 'Color-28', '9'),
(295, 'Color-29', '10'),
(296, 'Color-10', '1'),
(297, 'Color-11', '2'),
(298, 'Color-12', '3'),
(299, 'Color-13', '4'),
(300, 'Color-14', '5'),
(301, 'Color-15', '6'),
(302, 'Color-16', '7'),
(303, 'Color-17', '8'),
(304, 'Color-18', '9'),
(305, 'Color-19', '10'),
(306, 'Color-20', '1'),
(307, 'Color-21', '2'),
(308, 'Color-22', '3'),
(309, 'Color-23', '4'),
(310, 'Color-24', '5'),
(311, 'Color-25', '6'),
(312, 'Color-26', '7'),
(313, 'Color-27', '8'),
(314, 'Color-28', '9'),
(315, 'Color-29', '10'),
(316, 'Color-10', '1'),
(317, 'Color-11', '2'),
(318, 'Color-12', '3'),
(319, 'Color-13', '4'),
(320, 'Color-14', '5'),
(321, 'Color-15', '6'),
(322, 'Color-16', '7'),
(323, 'Color-17', '8'),
(324, 'Color-18', '9'),
(325, 'Color-19', '10'),
(326, 'Color-20', '1'),
(327, 'Color-21', '2'),
(328, 'Color-22', '3'),
(329, 'Color-23', '4'),
(330, 'Color-24', '5'),
(331, 'Color-25', '6'),
(332, 'Color-26', '7'),
(333, 'Color-27', '8'),
(334, 'Color-28', '9'),
(335, 'Color-29', '10'),
(336, 'Color-10', '1'),
(337, 'Color-11', '2'),
(338, 'Color-12', '3'),
(339, 'Color-13', '4'),
(340, 'Color-14', '5'),
(341, 'Color-15', '6'),
(342, 'Color-16', '7'),
(343, 'Color-17', '8'),
(344, 'Color-18', '9'),
(345, 'Color-19', '10'),
(346, 'Color-20', '1'),
(347, 'Color-21', '2'),
(348, 'Color-22', '3'),
(349, 'Color-23', '4'),
(350, 'Color-24', '5'),
(351, 'Color-25', '6'),
(352, 'Color-26', '7'),
(353, 'Color-27', '8'),
(354, 'Color-28', '9'),
(355, 'Color-29', '10'),
(356, 'Color-10', '1'),
(357, 'Color-11', '2'),
(358, 'Color-12', '3'),
(359, 'Color-13', '4'),
(360, 'Color-14', '5'),
(361, 'Color-15', '6'),
(362, 'Color-16', '7'),
(363, 'Color-17', '8'),
(364, 'Color-18', '9'),
(365, 'Color-19', '10'),
(366, 'Color-20', '1'),
(367, 'Color-21', '2'),
(368, 'Color-22', '3'),
(369, 'Color-23', '4'),
(370, 'Color-24', '5'),
(371, 'Color-25', '6'),
(372, 'Color-26', '7'),
(373, 'Color-27', '8'),
(374, 'Color-28', '9'),
(375, 'Color-29', '10'),
(376, 'Color-10', '1'),
(377, 'Color-11', '2'),
(378, 'Color-12', '3'),
(379, 'Color-13', '4'),
(380, 'Color-14', '5'),
(381, 'Color-15', '6'),
(382, 'Color-16', '7'),
(383, 'Color-17', '8'),
(384, 'Color-18', '9'),
(385, 'Color-19', '10'),
(386, 'Color-20', '1'),
(387, 'Color-21', '2'),
(388, 'Color-22', '3'),
(389, 'Color-23', '4'),
(390, 'Color-24', '5'),
(391, 'Color-25', '6'),
(392, 'Color-26', '7'),
(393, 'Color-27', '8'),
(394, 'Color-28', '9'),
(395, 'Color-29', '10'),
(396, 'Color-10', '1'),
(397, 'Color-11', '2'),
(398, 'Color-12', '3'),
(399, 'Color-13', '4'),
(400, 'Color-14', '5'),
(401, 'Color-15', '6'),
(402, 'Color-16', '7'),
(403, 'Color-17', '8'),
(404, 'Color-18', '9'),
(405, 'Color-19', '10'),
(406, 'Color-20', '1'),
(407, 'Color-21', '2'),
(408, 'Color-22', '3'),
(409, 'Color-23', '4'),
(410, 'Color-24', '5'),
(411, 'Color-25', '6'),
(412, 'Color-26', '7'),
(413, 'Color-27', '8'),
(414, 'Color-28', '9'),
(415, 'Color-29', '10'),
(416, 'Color-10', '1'),
(417, 'Color-11', '2'),
(418, 'Color-12', '3'),
(419, 'Color-13', '4'),
(420, 'Color-14', '5'),
(421, 'Color-15', '6'),
(422, 'Color-16', '7'),
(423, 'Color-17', '8'),
(424, 'Color-18', '9'),
(425, 'Color-19', '10'),
(426, 'Color-20', '1'),
(427, 'Color-21', '2'),
(428, 'Color-22', '3'),
(429, 'Color-23', '4'),
(430, 'Color-24', '5'),
(431, 'Color-25', '6'),
(432, 'Color-26', '7'),
(433, 'Color-27', '8'),
(434, 'Color-28', '9'),
(435, 'Color-29', '10'),
(436, 'Color-10', '1'),
(437, 'Color-11', '2'),
(438, 'Color-12', '3'),
(439, 'Color-13', '4'),
(440, 'Color-14', '5'),
(441, 'Color-15', '6'),
(442, 'Color-16', '7'),
(443, 'Color-17', '8'),
(444, 'Color-18', '9'),
(445, 'Color-19', '10'),
(446, 'Color-20', '1'),
(447, 'Color-21', '2'),
(448, 'Color-22', '3'),
(449, 'Color-23', '4'),
(450, 'Color-24', '5'),
(451, 'Color-25', '6'),
(452, 'Color-26', '7'),
(453, 'Color-27', '8'),
(454, 'Color-28', '9'),
(455, 'Color-29', '10');

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id_INVOICE` int(11) NOT NULL,
  `fk_ORDER` int(11) NOT NULL,
  `date` date NOT NULL,
  `PVM` float NOT NULL,
  `cost` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id_INVOICE`, `fk_ORDER`, `date`, `PVM`, `cost`) VALUES
(4, 4, '2025-03-04', 2025, 120),
(5, 5, '2025-03-05', 2025, 45.99),
(7, 7, '2025-03-07', 2025, 200),
(8, 8, '2025-03-08', 2025, 99.99),
(9, 9, '2025-03-09', 2025, 85),
(10, 10, '2025-03-10', 2025, 120),
(11, 11, '2025-03-11', 2025, 65),
(12, 12, '2025-03-12', 2025, 80),
(13, 13, '2025-03-13', 2025, 150),
(14, 14, '2025-03-14', 2025, 55),
(15, 15, '2025-03-15', 2025, 90),
(16, 16, '2025-03-16', 2025, 100),
(17, 17, '2025-03-17', 2025, 130),
(18, 18, '2025-03-18', 2025, 140),
(19, 19, '2025-03-19', 2025, 110),
(20, 20, '2025-03-20', 2025, 125),
(26, 40, '2024-01-15', 5, 55),
(27, 41, '2024-01-16', 6, 36),
(28, 4, '2024-01-17', 9, 99),
(29, 4, '2024-01-18', 5, 30),
(30, 5, '2024-01-19', 6, 63);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id_ORDER` int(11) NOT NULL,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL,
  `numberOfItems` int(11) NOT NULL,
  `totalPrice` int(11) NOT NULL,
  `costOfDelivery` float NOT NULL,
  `estimatedDeliveryDate` date NOT NULL,
  `orderState` char(9) NOT NULL,
  `discount` int(11) DEFAULT NULL,
  `discountCode` varchar(30) DEFAULT NULL,
  `fk_USER` int(11) NOT NULL
) ;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id_ORDER`, `startDate`, `endDate`, `numberOfItems`, `totalPrice`, `costOfDelivery`, `estimatedDeliveryDate`, `orderState`, `discount`, `discountCode`, `fk_USER`) VALUES
(4, '2025-03-16', '2025-03-23', 2, 80, 8, '2025-03-21', 'inTransit', NULL, NULL, 3),
(5, '2025-03-18', '2025-03-24', 4, 160, 9, '2025-03-22', 'delivered', NULL, NULL, 4),
(7, '2025-03-16', '2025-03-20', 3, 120, 10, '2025-03-18', 'ordered', NULL, NULL, 6),
(8, '2025-03-17', '2025-03-22', 4, 160, 15, '2025-03-19', 'confirmed', NULL, NULL, 7),
(9, '2025-03-16', '2025-03-20', 2, 90, 7, '2025-03-18', 'inTransit', NULL, NULL, 8),
(10, '2025-03-19', '2025-03-25', 5, 200, 10, '2025-03-23', 'delivered', NULL, NULL, 9),
(11, '2025-03-16', '2025-03-22', 3, 130, 12, '2025-03-18', 'ordered', NULL, NULL, 10),
(12, '2025-03-20', '2025-03-26', 4, 160, 8, '2025-03-24', 'confirmed', NULL, NULL, 11),
(13, '2025-03-21', '2025-03-27', 3, 120, 10, '2025-03-23', 'inTransit', NULL, NULL, 12),
(14, '2025-03-19', '2025-03-24', 2, 80, 9, '2025-03-21', 'delivered', NULL, NULL, 13),
(15, '2025-03-16', '2025-03-22', 4, 140, 11, '2025-03-19', 'cancelled', NULL, NULL, 14),
(16, '2025-03-20', '2025-03-25', 3, 135, 10, '2025-03-22', 'ordered', NULL, NULL, 15),
(17, '2025-03-18', '2025-03-24', 5, 210, 12, '2025-03-21', 'confirmed', NULL, NULL, 16),
(18, '2025-03-17', '2025-03-23', 4, 160, 10, '2025-03-20', 'inTransit', NULL, NULL, 17),
(19, '2025-03-20', '2025-03-26', 3, 120, 8, '2025-03-23', 'delivered', NULL, NULL, 18),
(20, '2025-03-19', '2025-03-25', 5, 200, 10, '2025-03-22', 'cancelled', NULL, NULL, 19),
(21, '2025-03-16', '2025-03-21', 6, 240, 14, '2025-03-18', 'ordered', NULL, NULL, 20),
(32, '2025-04-14', '0001-01-01', 0, 0, 0, '2025-04-19', 'confirmed', NULL, NULL, 7),
(33, '2025-04-14', '0001-01-01', 0, 0, 0, '2025-04-19', 'delivered', NULL, NULL, 7),
(34, '2025-04-14', '0001-01-01', 0, 0, 0, '2025-04-19', 'ordered', NULL, NULL, 7),
(35, '2025-04-14', '0001-01-01', 0, 0, 0, '2025-04-19', 'inTransit', NULL, NULL, 7),
(36, '2025-04-14', '0001-01-01', 0, 0, 0, '2025-04-19', 'ordered', NULL, NULL, 7),
(37, '2025-04-16', '0001-01-01', 0, 0, 0, '2025-04-21', 'confirmed', 0, NULL, 7),
(38, '2024-01-10', '2024-01-15', 2, 50, 5, '2024-01-14', 'ordered', NULL, NULL, 1),
(39, '2024-01-11', '2024-01-16', 1, 30, 5, '2024-01-15', 'confirmed', 5, 'WINTER5', 2),
(40, '2024-01-12', '2024-01-17', 3, 90, 0, '2024-01-16', 'inTransit', 10, 'SHIP10', 3),
(41, '2024-01-13', '2024-01-18', 1, 25, 5, '2024-01-17', 'delivered', NULL, NULL, 4),
(42, '2024-01-14', '2024-01-19', 2, 60, 3, '2024-01-18', 'cancelled', NULL, NULL, 5),
(43, '2024-01-10', '2024-01-15', 2, 50, 5, '2024-01-14', 'ordered', NULL, NULL, 1),
(44, '2024-01-11', '2024-01-04', 0, 30, 5, '2024-01-15', 'confirmed', 5, 'WINTER5', 2),
(45, '2024-01-12', '2024-01-17', 3, 90, 0, '2024-01-16', 'inTransit', 10, 'SHIP10', 3),
(46, '2024-01-13', '2024-01-18', 1, 25, 5, '2024-01-17', 'delivered', NULL, NULL, 4),
(47, '2024-01-14', '2023-11-20', 0, 60, 3, '2024-01-18', 'cancelled', 0, NULL, 5);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `quantity` int(11) NOT NULL,
  `subTotal` float NOT NULL,
  `fk_PRODUCT` int(11) NOT NULL,
  `fk_ORDER` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`quantity`, `subTotal`, `fk_PRODUCT`, `fk_ORDER`) VALUES
(1, 25, 1, 38),
(1, 25, 2, 38),
(1, 30, 3, 39),
(1, 95, 4, 4),
(2, 60, 4, 40),
(1, 30, 4, 42),
(4, 183.96, 5, 5),
(1, 25, 5, 38),
(1, 30, 5, 39),
(1, 30, 5, 40),
(2, 60, 6, 40),
(1, 25, 6, 41),
(5, 354.95, 7, 7),
(1, 30, 7, 40),
(1, 30, 7, 42),
(3, 165, 8, 8),
(1, 25, 8, 38),
(1, 25, 8, 41),
(1, 30, 8, 42),
(2, 51, 9, 9),
(1, 30, 9, 42),
(1, 39.99, 10, 10),
(3, 55.5, 11, 11),
(1, 18.5, 11, 37),
(2, 170, 12, 12),
(4, 280, 13, 13),
(1, 55, 14, 14),
(3, 105, 15, 15),
(2, 80, 15, 32),
(2, 120, 16, 16),
(2, 51.98, 17, 17),
(69, 696969, 17, 33),
(24, 24442, 17, 34),
(2444, 44444, 17, 35),
(13, 13, 17, 36),
(1, 25.99, 18, 18),
(5, 550, 19, 19),
(3, 150, 20, 20);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id_PAYMENT` int(11) NOT NULL,
  `fk_INVOICE` int(11) NOT NULL,
  `fk_USER` int(11) NOT NULL,
  `paymentStatus` char(9) NOT NULL CHECK (`paymentStatus` in ('pending','completed','failed','refunded')),
  `methodOfPayment` char(12) DEFAULT NULL CHECK (`methodOfPayment` in ('bankTransfer','card')),
  `totalSum` float DEFAULT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id_PAYMENT`, `fk_INVOICE`, `fk_USER`, `paymentStatus`, `methodOfPayment`, `totalSum`, `date`) VALUES
(4, 4, 4, 'failed', 'card', 120, '2025-03-04'),
(5, 5, 5, 'completed', 'bankTransfer', 45.99, '2025-03-05'),
(7, 7, 7, 'completed', 'card', 80, '2025-03-07'),
(8, 8, 8, 'refunded', 'card', 35.99, '2025-03-08'),
(9, 9, 9, 'completed', 'bankTransfer', 20, '2025-03-09'),
(10, 10, 10, 'pending', 'bankTransfer', 75, '2025-03-10'),
(11, 11, 11, 'completed', 'card', 99.99, '2025-03-11'),
(12, 12, 12, 'completed', 'card', 55.5, '2025-03-12'),
(13, 13, 13, 'failed', 'bankTransfer', 120, '2025-03-13'),
(14, 14, 14, 'completed', 'card', 65.75, '2025-03-14'),
(15, 15, 15, 'completed', 'bankTransfer', 40, '2025-03-15'),
(16, 16, 16, 'pending', 'bankTransfer', 88.5, '2025-03-16'),
(17, 17, 17, 'completed', 'card', 100, '2025-03-17'),
(18, 18, 18, 'refunded', 'card', 45.5, '2025-03-18'),
(19, 19, 19, 'completed', 'bankTransfer', 30.99, '2025-03-19'),
(20, 20, 20, 'pending', 'bankTransfer', 60, '2025-03-20');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id_PRODUCT` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `cost` float NOT NULL,
  `description` varchar(255) NOT NULL,
  `season` varchar(6) NOT NULL,
  `country` varchar(28) NOT NULL,
  `size` char(1) NOT NULL,
  `material` varchar(20) NOT NULL,
  `fk_STOCK` int(11) NOT NULL,
  `fk_CATEGORY` int(11) NOT NULL,
  `fk_COLOUR` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id_PRODUCT`, `name`, `cost`, `description`, `season`, `country`, `size`, `material`, `fk_STOCK`, `fk_CATEGORY`, `fk_COLOUR`) VALUES
(1, 'Summer T-Shirt', 15.99, 'A comfortable cotton t-shirt perfect for summer.', 'Summer', 'USA', 'M', 'Cotton', 1, 1, 3),
(2, 'Winter Coat', 120.5, 'Warm and stylish winter coat with a hood.', 'Winter', 'Canada', 'L', 'Wool', 5, 2, 2),
(3, 'Running Shoes', 60.99, 'Lightweight running shoes designed for comfort and speed.', 'Spring', 'China', '9', 'Mesh', 10, 3, 5),
(4, 'Leather Jacket', 95, 'A sleek leather jacket with a modern design.', 'Fall', 'Italy', 'X', 'Leather', 8, 4, 4),
(5, 'Jeans', 45.99, 'A pair of well-fitted denim jeans for everyday wear.', 'All Ye', 'Mexico', '3', 'Denim', 20, 1, 1),
(6, 'Wool Sweater', 50, 'Cozy wool sweater for the cold weather.', 'Winter', 'Scotland', 'L', 'Wool', 7, 2, 6),
(7, 'Sneakers', 70.99, 'Casual sneakers that are both comfortable and trendy.', 'Spring', 'Vietnam', '8', 'Canvas', 12, 3, 3),
(8, 'Rain Jacket', 55, 'Water-resistant jacket perfect for rainy days.', 'Fall', 'Germany', 'M', 'Polyester', 6, 5, 2),
(9, 'Summer Hat', 25.5, 'A wide-brimmed hat to protect from the sun.', 'Summer', 'Australia', 'O', 'Straw', 14, 1, 7),
(10, 'Dress Shirt', 39.99, 'A formal dress shirt suitable for business wear.', 'All Ye', 'Egypt', 'M', 'Cotton', 20, 4, 8),
(11, 'Running Shorts', 18.5, 'Light and breathable shorts for running.', 'Spring', 'USA', 'L', 'Polyester', 9, 3, 5),
(12, 'Winter Boots', 85, 'Sturdy winter boots for extreme cold.', 'Winter', 'Canada', '1', 'Leather', 4, 2, 4),
(13, 'Denim Jacket', 70, 'A timeless denim jacket that never goes out of style.', 'Fall', 'USA', 'M', 'Denim', 18, 1, 1),
(14, 'Floral Dress', 55, 'A beautiful floral dress perfect for spring events.', 'Spring', 'France', 'S', 'Cotton', 15, 6, 9),
(15, 'Backpack', 40, 'A durable backpack for daily use.', 'All Ye', 'China', 'O', 'Nylon', 17, 5, 10),
(16, 'Cashmere Sweater', 120, 'Luxurious cashmere sweater for warmth and style.', 'Winter', 'Italy', 'M', 'Cashmere', 11, 2, 6),
(17, 'Cargo Pants', 35, 'Comfortable cargo pants for everyday wear.', 'Fall', 'India', 'L', 'Cotton', 13, 4, 11),
(18, 'Yoga Mat', 25.99, 'A non-slip yoga mat for all your workouts.', 'All Ye', 'Thailand', 'O', 'PVC', 16, 3, 12),
(19, 'Puffer Jacket', 110, 'A warm puffer jacket with great insulation.', 'Winter', 'Germany', 'L', 'Polyester', 3, 2, 13),
(20, 'Casual Sneakers', 50, 'Stylish sneakers for everyday use.', 'Spring', 'China', '8', 'Canvas', 19, 3, 5),
(21, 'Kelnės A', 49.99, 'Patogios kelnės', 'Žiema', 'Lietuva', 'M', 'Medvilnė', 1, 1, 1),
(22, 'Marškiniai B', 35, 'Oficialūs marškiniai', 'Vasara', 'Latvija', 'L', 'Linas', 2, 2, 2),
(23, 'Suknelė C', 89.5, 'Vakarinė suknelė', 'Pavasa', 'Estija', 'S', 'Šilkas', 3, 3, 3),
(24, 'Švarkas D', 120, 'Klasikinis švarkas', 'Ruduo', 'Lenkija', 'L', 'Vilna', 4, 4, 4),
(25, 'Vaikiškas megztinis ', 30, 'Vaikams skirtas megztinis', 'Žiema', 'Vokietija', 'X', 'Akrilas', 5, 5, 5),
(26, 'Sportinė apranga F', 59.99, 'Tinka sportui', 'Vasara', 'Lietuva', 'M', 'Poliesteris', 6, 6, 6),
(27, 'Sportinė suknelė G', 65, 'Lengva suknelė sportui', 'Pavasa', 'Latvija', 'M', 'Medvilnė', 7, 7, 7),
(28, 'Striukė H', 150, 'Šilta striukė vaikams', 'Žiema', 'Estija', 'X', 'Pluoštas', 8, 8, 8),
(29, 'Pižama I', 25, 'Miego drabužis', 'Ruduo', 'Lietuva', 'M', 'Šilkas', 9, 9, 9),
(30, 'Paltas J', 200, 'Ilgas paltas', 'Žiema', 'Lenkija', 'L', 'Vilna', 10, 10, 10);

-- --------------------------------------------------------

--
-- Table structure for table `selections`
--

CREATE TABLE `selections` (
  `id_SELECTION` int(11) NOT NULL,
  `gender` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `selections`
--

INSERT INTO `selections` (`id_SELECTION`, `gender`) VALUES
(1, 'male'),
(2, 'female'),
(3, 'female'),
(4, 'female'),
(5, 'female'),
(6, 'male'),
(7, 'male'),
(8, 'female'),
(9, 'female'),
(10, 'male');

-- --------------------------------------------------------

--
-- Table structure for table `shipments`
--

CREATE TABLE `shipments` (
  `id_SHIPMENT` int(11) NOT NULL,
  `driver` varchar(30) NOT NULL,
  `address` varchar(60) NOT NULL,
  `startOfDeliveryDate` date NOT NULL,
  `endOfDeliveryDate` date NOT NULL,
  `weight` float NOT NULL,
  `trackingNumber` varchar(20) NOT NULL,
  `methodOfDelivery` char(7) NOT NULL CHECK (`methodOfDelivery` in ('courier','post')),
  `size` char(6) NOT NULL CHECK (`size` in ('small','medium','large')),
  `fk_USER` int(11) NOT NULL,
  `fk_ORDER` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `shipments`
--

INSERT INTO `shipments` (`id_SHIPMENT`, `driver`, `address`, `startOfDeliveryDate`, `endOfDeliveryDate`, `weight`, `trackingNumber`, `methodOfDelivery`, `size`, `fk_USER`, `fk_ORDER`) VALUES
(4, 'Emily Davis', '101 Maple St, Houston, TX', '2025-03-04', '2025-03-05', 1.5, 'TRACK12348', 'post', 'Medium', 4, 4),
(5, 'Chris Lee', '202 Birch St, Miami, FL', '2025-03-05', '2025-03-06', 4, 'TRACK12349', 'courier', 'Large', 5, 5),
(7, 'Robert Brown', '404 Willow St, Dallas, TX', '2025-03-07', '2025-03-08', 2, 'TRACK12351', 'courier', 'Medium', 7, 7),
(8, 'Nancy Green', '505 Birchwood Ave, Phoenix, AZ', '2025-03-08', '2025-03-09', 4.5, 'TRACK12352', 'post', 'Large', 8, 8),
(9, 'David Martin', '606 Pinebrook Dr, Seattle, WA', '2025-03-09', '2025-03-10', 2.8, 'TRACK12353', 'courier', 'Small', 9, 9),
(10, 'Olivia Clark', '707 Aspen St, Denver, CO', '2025-03-10', '2025-03-11', 3.2, 'TRACK12354', 'post', 'Medium', 10, 10),
(11, 'Matthew Walker', '808 Spruce St, Atlanta, GA', '2025-03-11', '2025-03-12', 1, 'TRACK12355', 'courier', 'Large', 11, 11),
(12, 'Sophia Allen', '909 Elmwood Rd, Portland, OR', '2025-03-12', '2025-03-13', 5.5, 'TRACK12356', 'post', 'Small', 12, 12),
(13, 'Lucas Harris', '1010 Fir Ave, San Diego, CA', '2025-03-13', '2025-03-14', 4.2, 'TRACK12357', 'courier', 'Medium', 13, 13),
(14, 'Ava Martinez', '1111 Cedar Blvd, San Francisco, CA', '2025-03-14', '2025-03-15', 3, 'TRACK12358', 'post', 'Large', 14, 14),
(15, 'Ethan Rodriguez', '1212 Palm St, Sacramento, CA', '2025-03-15', '2025-03-16', 2.3, 'TRACK12359', 'courier', 'Small', 15, 15),
(16, 'Mason Young', '1313 Willow Ave, Portland, ME', '2025-03-16', '2025-03-17', 5, 'TRACK12360', 'post', 'Medium', 16, 16),
(17, 'Isabella Thompson', '1414 Maple Dr, Charlotte, NC', '2025-03-17', '2025-03-18', 3.6, 'TRACK12361', 'courier', 'Large', 17, 17),
(18, 'Jacob Scott', '1515 Cedar Dr, Miami, FL', '2025-03-18', '2025-03-19', 4.8, 'TRACK12362', 'post', 'Small', 18, 18),
(19, 'Charlotte King', '1616 Pinewood St, Austin, TX', '2025-03-19', '2025-03-20', 2.1, 'TRACK12363', 'courier', 'Medium', 19, 19),
(20, 'Benjamin Lee', '1717 Oak Dr, New York, NY', '2025-03-20', '2025-03-21', 3.4, 'TRACK12364', 'post', 'Large', 20, 20);

-- --------------------------------------------------------

--
-- Table structure for table `stocks`
--

CREATE TABLE `stocks` (
  `id_STOCK` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `lastUpdated` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `stocks`
--

INSERT INTO `stocks` (`id_STOCK`, `quantity`, `lastUpdated`) VALUES
(1, 100, '2025-03-16'),
(2, 50, '2025-03-16'),
(3, 200, '2025-03-16'),
(4, 80, '2025-03-16'),
(5, 150, '2025-03-16'),
(6, 60, '2025-03-16'),
(7, 90, '2025-03-16'),
(8, 130, '2025-03-16'),
(9, 170, '2025-03-16'),
(10, 45, '2025-03-16'),
(11, 120, '2025-03-16'),
(12, 200, '2025-03-16'),
(13, 250, '2025-03-16'),
(14, 300, '2025-03-16'),
(15, 75, '2025-03-16'),
(16, 50, '2025-03-16'),
(17, 140, '2025-03-16'),
(18, 60, '2025-03-16'),
(19, 90, '2025-03-16'),
(20, 110, '2025-03-16'),
(21, 20, '2025-01-01'),
(22, 15, '2025-01-02'),
(23, 5, '2025-01-03'),
(24, 50, '2025-01-04'),
(25, 100, '2025-01-05'),
(26, 7, '2025-01-06'),
(27, 8, '2025-01-07'),
(28, 12, '2025-01-08'),
(29, 3, '2025-01-09'),
(30, 33, '2025-01-10');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_USER` int(11) NOT NULL,
  `email` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL,
  `name` varchar(20) NOT NULL,
  `surname` varchar(20) NOT NULL,
  `phoneNumber` varchar(11) DEFAULT NULL,
  `address` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_USER`, `email`, `password`, `name`, `surname`, `phoneNumber`, `address`) VALUES
(1, 'bmountain0@arizona.edu', 'kT4\'UWxy#K', 'Bette', 'Mountain', '791 102 715', '74 Goodland Park'),
(2, 'dboom1@skype.com', 'gV2>a6&W7|}AZp#,', 'Dori', 'Boom', '508 370 761', '71 Dwight Junction'),
(3, 'rwyley2@dyndns.org', 'tH6#lmJ`cb', 'Raphaela', 'Wyley', '130 242 823', '9 Carey Center'),
(4, 'lgonzalo3@squidoo.com', 'hB5|c!nDKn`/', 'Libbey', 'Gonzalo', '393 148 479', '16 Huxley Park'),
(5, 'hnodin4@blog.com', 'tG2#*%xJWH', 'Helli', 'Nodin', '192 269 427', '4 Cardinal Avenue'),
(6, 'ltubbs5@indiegogo.com', 'uW4\"8AVE', 'Loella', 'Tubbs', '324 142 643', '3 Orin Alley'),
(7, 'ainstrell6@goo.ne.jp', 'hY5%>,v)cL+Hh+Hw', 'Ansley', 'Instrell', '448 294 041', '8 Hazelcrest Street'),
(8, 'dcartlidge7@barnesandnoble.com', 'jJ9*uksw_x\'', 'Doyle', 'Cartlidge', '722 993 947', '83051 Garrison Avenue'),
(9, 'fmcgilvra8@mac.com', 'nS5&Z/`x{6d~', 'Frances', 'McGilvra', '803 516 599', '97359 Pawling Pass'),
(10, 'mbricklebank9@vinaora.com', 'bR5)`_.Kr#T<', 'Molly', 'Bricklebank', '255 527 330', '08314 Spohn Center'),
(11, 'spedrozzia@prlog.org', 'fA3\'s4$HCn0{i9T', 'Spike', 'Pedrozzi', '181 142 684', '72168 Steensland Crossing'),
(12, 'smuehlerb@cnet.com', 'kV4\'jSn!uKz', 'Shandie', 'Muehler', '620 279 863', '521 Eastwood Court'),
(13, 'cturnpennyc@jimdo.com', 'dN0.LKf($&ID', 'Chrysa', 'Turnpenny', '457 666 111', '6 Walton Alley'),
(14, 'pborleased@ca.gov', 'dS6(=KWk`<7c!b8', 'Perla', 'Borlease', '166 843 080', '31 Mendota Parkway'),
(15, 'jmarianse@wikia.com', 'wO9*3EKUh', 'Julienne', 'Marians', '963 756 812', '9 Thierer Center'),
(16, 'lmcbeanf@addthis.com', 'yS9\'pP~P69BH`a%', 'Lidia', 'McBean', '250 935 998', '10 Nancy Hill'),
(17, 'lkilgannong@cloudflare.com', 'xI2?`%N_+l>7', 'Laurena', 'Kilgannon', '435 914 805', '64 Swallow Terrace'),
(18, 'jhummh@marketwatch.com', 'rD6poQg/h+ff*W', 'Jenny', 'Humm', '441 802 795', '302 Parkside Drive'),
(19, 'lskoatei@dell.com', 'rK9,\"fb%4$', 'Lynde', 'Skoate', '652 494 560', '1 Prentice Lane'),
(20, 'mjoshamj@bandcamp.com', 'yH9@W!?#7@?', 'Massimo', 'Josham', '353 749 039', '1 Elka Avenue'),
(21, 'jonas@gmail.com', 'pass123', 'Jonas', 'Jonaitis', '860000000', 'Kaunas'),
(22, 'ona@gmail.com', 'slaptas', 'Ona', 'Onaitė', '860000001', 'Vilnius'),
(23, 'petras@gmail.com', 'abc123', 'Petras', 'Petraitis', NULL, NULL),
(24, 'rita@gmail.com', 'rita123', 'Rita', 'Ritaitė', '860000002', 'Klaipėda'),
(25, 'tomas@gmail.com', 'tomas321', 'Tomas', 'Tomaitis', '860000003', 'Šiauliai'),
(26, 'lina@gmail.com', 'linaxx', 'Lina', 'Linaitė', NULL, NULL),
(27, 'sarune@gmail.com', 'sarasara', 'Šarūnė', 'Šarūnaitė', '860000004', 'Panevėžys'),
(28, 'andrius@gmail.com', 'andrius22', 'Andrius', 'Andraitis', '860000005', 'Marijampolė'),
(29, 'migle@gmail.com', 'miglepass', 'Miglė', 'Miglaitė', NULL, NULL),
(30, 'giedre@gmail.com', 'giedre123', 'Giedrė', 'Giedraitė', '860000006', 'Alytus');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id_WISHLIST` int(11) NOT NULL,
  `priorityQueue` int(11) NOT NULL,
  `dateAdded` date NOT NULL,
  `stockAvailability` tinyint(1) NOT NULL,
  `fk_PRODUCT` int(11) NOT NULL,
  `fk_USER` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `wishlists`
--

INSERT INTO `wishlists` (`id_WISHLIST`, `priorityQueue`, `dateAdded`, `stockAvailability`, `fk_PRODUCT`, `fk_USER`) VALUES
(1, 1, '2025-03-16', 0, 1, 1),
(2, 2, '2025-03-17', 0, 2, 2),
(3, 1, '2025-03-16', 0, 3, 3),
(4, 1, '2025-03-16', 0, 4, 4),
(5, 1, '2025-03-16', 0, 5, 5),
(6, 2, '2025-03-17', 0, 6, 6),
(7, 1, '2025-03-16', 0, 7, 7),
(8, 3, '2025-03-18', 0, 8, 8),
(9, 1, '2025-03-16', 0, 9, 9),
(10, 2, '2025-03-17', 0, 10, 10),
(11, 1, '2025-03-16', 0, 11, 11),
(12, 1, '2025-03-16', 0, 12, 12),
(13, 3, '2025-03-18', 0, 13, 13),
(14, 1, '2025-03-16', 0, 14, 14),
(15, 2, '2025-03-17', 0, 15, 15),
(16, 1, '2025-03-16', 0, 16, 16),
(17, 3, '2025-03-18', 0, 17, 17),
(18, 1, '2025-03-16', 0, 18, 18),
(19, 2, '2025-03-17', 0, 19, 19),
(20, 1, '2025-03-16', 0, 20, 20),
(21, 1, '2024-01-05', 1, 1, 1),
(22, 2, '2024-01-06', 0, 3, 2),
(23, 3, '2024-01-07', 1, 4, 3),
(24, 1, '2024-01-08', 1, 6, 4),
(25, 2, '2024-01-09', 0, 9, 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id_CATEGORY`),
  ADD KEY `fk_SELECTION` (`fk_SELECTION`);

--
-- Indexes for table `colours`
--
ALTER TABLE `colours`
  ADD PRIMARY KEY (`id_COLOUR`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id_INVOICE`),
  ADD KEY `invoices_ibfk_1` (`fk_ORDER`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id_ORDER`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`fk_PRODUCT`,`fk_ORDER`),
  ADD KEY `order_items_ibfk_2` (`fk_ORDER`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id_PAYMENT`),
  ADD KEY `fk_INVOICE` (`fk_INVOICE`),
  ADD KEY `fk_USER` (`fk_USER`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id_PRODUCT`),
  ADD KEY `fk_STOCK` (`fk_STOCK`),
  ADD KEY `fk_CATEGORY` (`fk_CATEGORY`),
  ADD KEY `fk_COLOUR` (`fk_COLOUR`);

--
-- Indexes for table `selections`
--
ALTER TABLE `selections`
  ADD PRIMARY KEY (`id_SELECTION`);

--
-- Indexes for table `shipments`
--
ALTER TABLE `shipments`
  ADD PRIMARY KEY (`id_SHIPMENT`),
  ADD KEY `fk_USER` (`fk_USER`),
  ADD KEY `shipments_ibfk_2` (`fk_ORDER`);

--
-- Indexes for table `stocks`
--
ALTER TABLE `stocks`
  ADD PRIMARY KEY (`id_STOCK`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_USER`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id_WISHLIST`),
  ADD KEY `fk_PRODUCT` (`fk_PRODUCT`),
  ADD KEY `fk_USER` (`fk_USER`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id_CATEGORY` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=143;

--
-- AUTO_INCREMENT for table `colours`
--
ALTER TABLE `colours`
  MODIFY `id_COLOUR` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=456;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id_INVOICE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id_ORDER` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id_PAYMENT` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id_PRODUCT` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;

--
-- AUTO_INCREMENT for table `selections`
--
ALTER TABLE `selections`
  MODIFY `id_SELECTION` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `shipments`
--
ALTER TABLE `shipments`
  MODIFY `id_SHIPMENT` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `stocks`
--
ALTER TABLE `stocks`
  MODIFY `id_STOCK` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=171;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_USER` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=171;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id_WISHLIST` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_ibfk_1` FOREIGN KEY (`fk_SELECTION`) REFERENCES `selections` (`id_SELECTION`);

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_ibfk_1` FOREIGN KEY (`fk_ORDER`) REFERENCES `orders` (`id_ORDER`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`fk_PRODUCT`) REFERENCES `products` (`id_PRODUCT`),
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`fk_ORDER`) REFERENCES `orders` (`id_ORDER`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`fk_INVOICE`) REFERENCES `invoices` (`id_INVOICE`),
  ADD CONSTRAINT `payments_ibfk_2` FOREIGN KEY (`fk_USER`) REFERENCES `users` (`id_USER`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`fk_STOCK`) REFERENCES `stocks` (`id_STOCK`),
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`fk_CATEGORY`) REFERENCES `categories` (`id_CATEGORY`),
  ADD CONSTRAINT `products_ibfk_3` FOREIGN KEY (`fk_COLOUR`) REFERENCES `colours` (`id_COLOUR`);

--
-- Constraints for table `shipments`
--
ALTER TABLE `shipments`
  ADD CONSTRAINT `shipments_ibfk_1` FOREIGN KEY (`fk_USER`) REFERENCES `users` (`id_USER`),
  ADD CONSTRAINT `shipments_ibfk_2` FOREIGN KEY (`fk_ORDER`) REFERENCES `orders` (`id_ORDER`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD CONSTRAINT `wishlists_ibfk_1` FOREIGN KEY (`fk_PRODUCT`) REFERENCES `products` (`id_PRODUCT`),
  ADD CONSTRAINT `wishlists_ibfk_2` FOREIGN KEY (`fk_USER`) REFERENCES `users` (`id_USER`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
