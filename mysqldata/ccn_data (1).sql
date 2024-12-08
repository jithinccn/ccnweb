-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 27, 2024 at 07:53 AM
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
-- Database: `ccn_data`
--

-- --------------------------------------------------------

--
-- Table structure for table `modems`
--

CREATE TABLE `modems` (
  `id` int(11) NOT NULL,
  `operator_id` varchar(50) DEFAULT NULL,
  `modem_vendor` varchar(100) NOT NULL,
  `modem_model` varchar(100) NOT NULL,
  `modem_mac_address` varchar(100) NOT NULL,
  `modem_serial_number` varchar(100) NOT NULL,
  `entry_date` date DEFAULT curdate(),
  `warranty_period_months` int(11) NOT NULL,
  `warranty_expiry_date` date GENERATED ALWAYS AS (`entry_date` + interval `warranty_period_months` month) STORED,
  `complaint_count` int(11) DEFAULT 0,
  `modem_id` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `modems`
--

INSERT INTO `modems` (`id`, `operator_id`, `modem_vendor`, `modem_model`, `modem_mac_address`, `modem_serial_number`, `entry_date`, `warranty_period_months`, `complaint_count`, `modem_id`) VALUES
(1, 'CCN', 'netlink', 'qwert', 'qwert', 'SADSFSGH', '2024-11-16', 2, 0, NULL),
(2, 'KB14A002', 'netlink', 'asdfg', 'lkjhgf', 'SADSFSGH', '2024-11-16', 12, 0, NULL),
(3, 'KB14A003', 'gx', 'qwert', 'bhytg', 'qqw', '2024-11-16', 12, 0, NULL),
(5, 'KB14A008', 'asdf', 'asdfg', 'nbcv', 'na', '2024-11-16', 3, 0, NULL),
(7, 'KB14A003', 'gx', 'qwert', 'qaz', 'na', '2024-11-17', 12, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `modem_complaints`
--

CREATE TABLE `modem_complaints` (
  `id` int(11) NOT NULL,
  `booting_status` varchar(50) DEFAULT NULL,
  `complaint_register_date` date DEFAULT NULL,
  `complaint_register_person` varchar(50) DEFAULT NULL,
  `complaint_type` varchar(50) DEFAULT NULL,
  `dcomment` text DEFAULT NULL,
  `lan_port_status` varchar(50) DEFAULT NULL,
  `modem_mac_address` varchar(100) DEFAULT NULL,
  `power_status` varchar(50) DEFAULT NULL,
  `Relaced_modem_mac` varchar(255) DEFAULT 'NA',
  `weblogin` varchar(50) DEFAULT NULL,
  `wlan_status` varchar(50) DEFAULT NULL,
  `complaint_status` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `modem_complaints`
--

INSERT INTO `modem_complaints` (`id`, `booting_status`, `complaint_register_date`, `complaint_register_person`, `complaint_type`, `dcomment`, `lan_port_status`, `modem_mac_address`, `power_status`, `Relaced_modem_mac`, `weblogin`, `wlan_status`, `complaint_status`) VALUES
(7, 'NA', '2024-11-16', 'store', 'Dead', 'NA', 'NA', 'nbcv', 'NA', 'NA', 'NA', 'NA', 'In_progress'),
(8, 'NA', '2024-11-16', 'store', 'Dead', 'NA', 'NA', 'qwert', 'NA', 'NA', 'NA', 'NA', 'Resolved'),
(9, 'NA', '2024-11-16', 'service', 'Dead', 'NA', 'NA', 'bhytg', 'NA', 'NA', 'NA', 'NA', 'Complaint'),
(10, 'NA', '2024-11-17', 'store', 'Wifi-issue', 'NA', 'NA', 'lkjhgf', 'NA', 'NA', 'NA', 'NA', 'Complaint'),
(11, 'NA', '2024-11-17', 'service', 'Wifi-issue', 'NA', 'NA', 'lkjhgf', 'NA', 'NA', 'NA', 'NA', 'Complaint'),
(12, 'NA', '2024-11-17', 'service', 'Wifi-issue', 'NA', 'NA', 'qaz', 'NA', 'NA', 'NA', 'NA', 'Complaint');

-- --------------------------------------------------------

--
-- Table structure for table `operators`
--

CREATE TABLE `operators` (
  `id` int(11) NOT NULL,
  `operator_id` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `operators`
--

INSERT INTO `operators` (`id`, `operator_id`) VALUES
(411, 'CCN'),
(1, 'KB14A001'),
(2, 'KB14A002'),
(3, 'KB14A003'),
(4, 'KB14A004'),
(5, 'KB14A005'),
(6, 'KB14A006'),
(7, 'KB14A007'),
(8, 'KB14A008'),
(9, 'KB14A009'),
(10, 'KB14A010'),
(11, 'KB14A011'),
(12, 'KB14A012'),
(13, 'KB14A013'),
(14, 'KB14A014'),
(15, 'KB14A015'),
(16, 'KB14A016'),
(17, 'KB14A017'),
(18, 'KB14A018'),
(19, 'KB14A019'),
(20, 'KB14A020'),
(21, 'KB14A021'),
(22, 'KB14A022'),
(23, 'KB14A023'),
(24, 'KB14A024'),
(25, 'KB14A025'),
(26, 'KB14A026'),
(27, 'KB14A027'),
(28, 'KB14A028'),
(29, 'KB14A029'),
(30, 'KB14A030'),
(31, 'KB14A031'),
(32, 'KB14A032'),
(33, 'KB14A033'),
(34, 'KB14A034'),
(35, 'KB14A035'),
(36, 'KB14A036'),
(37, 'KB14A037'),
(38, 'KB14A038'),
(39, 'KB14A039'),
(40, 'KB14A040'),
(41, 'KB14B001'),
(42, 'KB14B002'),
(43, 'KB14B003'),
(44, 'KB14B004'),
(45, 'KB14B005'),
(46, 'KB14B006'),
(47, 'KB14B007'),
(48, 'KB14B008'),
(49, 'KB14B009'),
(50, 'KB14B010'),
(51, 'KB14B011'),
(52, 'KB14B012'),
(53, 'KB14B013'),
(54, 'KB14B014'),
(55, 'KB14B015'),
(56, 'KB14B016'),
(57, 'KB14B017'),
(58, 'KB14B018'),
(59, 'KB14B019'),
(60, 'KB14B020'),
(61, 'KB14B021'),
(62, 'KB14B022'),
(63, 'KB14B023'),
(64, 'KB14B024'),
(65, 'KB14B025'),
(66, 'KB14B026'),
(67, 'KB14B027'),
(68, 'KB14B028'),
(69, 'KB14B029'),
(70, 'KB14B030'),
(71, 'KB14B031'),
(72, 'KB14B032'),
(73, 'KB14B033'),
(74, 'KB14B034'),
(75, 'KB14B035'),
(76, 'KB14B036'),
(77, 'KB14B037'),
(78, 'KB14B038'),
(79, 'KB14B039'),
(80, 'KB14B040'),
(81, 'KB14B041'),
(82, 'KB14B042'),
(83, 'KB14B043'),
(84, 'KB14B044'),
(85, 'KB14B045'),
(86, 'KB14B046'),
(87, 'KB14B047'),
(88, 'KB14B048'),
(89, 'KB14B049'),
(90, 'KB14B050'),
(91, 'KB14B051'),
(92, 'KB14B052'),
(93, 'KB14B053'),
(94, 'KB14B054'),
(95, 'KB14B055'),
(96, 'KB14B056'),
(97, 'KB14B057'),
(98, 'KB14B058'),
(99, 'KB14B059'),
(100, 'KB14B060'),
(101, 'KB14B061'),
(102, 'KB14B062'),
(103, 'KB14B063'),
(104, 'KB14B064'),
(105, 'KB14B065'),
(106, 'KB14B066'),
(107, 'KB14B067'),
(108, 'KB14B068'),
(109, 'KB14B069'),
(110, 'KB14B070'),
(111, 'KB14C001'),
(112, 'KB14C002'),
(113, 'KB14C003'),
(114, 'KB14C004'),
(115, 'KB14C005'),
(116, 'KB14C006'),
(117, 'KB14C007'),
(118, 'KB14C008'),
(119, 'KB14C009'),
(120, 'KB14C010'),
(121, 'KB14C011'),
(122, 'KB14C012'),
(123, 'KB14C013'),
(124, 'KB14C014'),
(125, 'KB14C015'),
(126, 'KB14C016'),
(127, 'KB14C017'),
(128, 'KB14C018'),
(129, 'KB14C019'),
(130, 'KB14C020'),
(131, 'KB14C021'),
(132, 'KB14C022'),
(133, 'KB14C023'),
(134, 'KB14C024'),
(135, 'KB14C025'),
(136, 'KB14C026'),
(137, 'KB14C027'),
(138, 'KB14C028'),
(139, 'KB14C029'),
(140, 'KB14C030'),
(141, 'KB14C031'),
(142, 'KB14C032'),
(143, 'KB14C033'),
(144, 'KB14C034'),
(145, 'KB14C035'),
(146, 'KB14C036'),
(147, 'KB14C037'),
(148, 'KB14C038'),
(149, 'KB14C039'),
(150, 'KB14C040'),
(151, 'KB14C041'),
(152, 'KB14C042'),
(153, 'KB14C043'),
(154, 'KB14C044'),
(155, 'KB14C045'),
(156, 'KB14C046'),
(157, 'KB14C047'),
(158, 'KB14C048'),
(159, 'KB14C049'),
(160, 'KB14C050'),
(161, 'KB14D001'),
(162, 'KB14D002'),
(163, 'KB14D003'),
(164, 'KB14D004'),
(165, 'KB14D005'),
(166, 'KB14D006'),
(167, 'KB14D007'),
(168, 'KB14D008'),
(169, 'KB14D009'),
(170, 'KB14D010'),
(171, 'KB14D011'),
(172, 'KB14D012'),
(173, 'KB14D013'),
(174, 'KB14D014'),
(175, 'KB14D015'),
(176, 'KB14D016'),
(177, 'KB14D017'),
(178, 'KB14D018'),
(179, 'KB14D019'),
(180, 'KB14D020'),
(181, 'KB14D021'),
(182, 'KB14D022'),
(183, 'KB14D023'),
(184, 'KB14D024'),
(185, 'KB14D025'),
(186, 'KB14D026'),
(187, 'KB14D027'),
(188, 'KB14D028'),
(189, 'KB14D029'),
(190, 'KB14D030'),
(191, 'KB14D031'),
(192, 'KB14D032'),
(193, 'KB14D033'),
(194, 'KB14D034'),
(195, 'KB14D035'),
(196, 'KB14D036'),
(197, 'KB14D037'),
(198, 'KB14D038'),
(199, 'KB14D039'),
(200, 'KB14D040'),
(201, 'KB14D041'),
(202, 'KB14D042'),
(203, 'KB14D043'),
(204, 'KB14D044'),
(205, 'KB14D045'),
(206, 'KB14D046'),
(207, 'KB14D047'),
(208, 'KB14D048'),
(209, 'KB14D049'),
(210, 'KB14D050'),
(211, 'KB14D051'),
(212, 'KB14D052'),
(213, 'KB14D053'),
(214, 'KB14D054'),
(215, 'KB14D055'),
(216, 'KB14D056'),
(217, 'KB14D057'),
(218, 'KB14D058'),
(219, 'KB14D059'),
(220, 'KB14D060'),
(221, 'KB14D061'),
(222, 'KB14D062'),
(223, 'KB14D063'),
(224, 'KB14D064'),
(225, 'KB14D065'),
(226, 'KB14D066'),
(227, 'KB14D067'),
(228, 'KB14D068'),
(229, 'KB14D069'),
(230, 'KB14D070'),
(231, 'KB14D071'),
(232, 'KB14D072'),
(233, 'KB14D073'),
(234, 'KB14D074'),
(235, 'KB14D075'),
(236, 'KB14D076'),
(237, 'KB14D077'),
(238, 'KB14D078'),
(239, 'KB14D079'),
(240, 'KB14D080'),
(241, 'KB14E001'),
(242, 'KB14E002'),
(243, 'KB14E003'),
(244, 'KB14E004'),
(245, 'KB14E005'),
(246, 'KB14E006'),
(247, 'KB14E007'),
(248, 'KB14E008'),
(249, 'KB14E009'),
(250, 'KB14E010'),
(251, 'KB14E011'),
(252, 'KB14E012'),
(253, 'KB14E013'),
(254, 'KB14E014'),
(255, 'KB14E015'),
(256, 'KB14E016'),
(257, 'KB14E017'),
(258, 'KB14E018'),
(259, 'KB14E019'),
(260, 'KB14E020'),
(261, 'KB14E021'),
(262, 'KB14E022'),
(263, 'KB14E023'),
(264, 'KB14E024'),
(265, 'KB14E025'),
(266, 'KB14E026'),
(267, 'KB14E027'),
(268, 'KB14E028'),
(269, 'KB14E029'),
(270, 'KB14E030'),
(271, 'KB14E031'),
(272, 'KB14E032'),
(273, 'KB14E033'),
(274, 'KB14E034'),
(275, 'KB14E035'),
(276, 'KB14E036'),
(277, 'KB14E037'),
(278, 'KB14E038'),
(279, 'KB14E039'),
(280, 'KB14E040'),
(281, 'KB14E041'),
(282, 'KB14E042'),
(283, 'KB14E043'),
(284, 'KB14E044'),
(285, 'KB14E045'),
(286, 'KB14E046'),
(287, 'KB14E047'),
(288, 'KB14E048'),
(289, 'KB14E049'),
(290, 'KB14E050'),
(291, 'KB14E051'),
(292, 'KB14E052'),
(293, 'KB14E053'),
(294, 'KB14E054'),
(295, 'KB14E055'),
(296, 'KB14E056'),
(297, 'KB14E057'),
(298, 'KB14E058'),
(299, 'KB14E059'),
(300, 'KB14E060'),
(301, 'KB14E061'),
(302, 'KB14E062'),
(303, 'KB14E063'),
(304, 'KB14E064'),
(305, 'KB14E065'),
(306, 'KB14E066'),
(307, 'KB14E067'),
(308, 'KB14E068'),
(309, 'KB14E069'),
(310, 'KB14E070'),
(311, 'KB14E071'),
(312, 'KB14E072'),
(313, 'KB14E073'),
(314, 'KB14E074'),
(315, 'KB14E075'),
(316, 'KB14E076'),
(317, 'KB14E077'),
(318, 'KB14E078'),
(319, 'KB14E079'),
(320, 'KB14E080'),
(321, 'KB14F001'),
(322, 'KB14F002'),
(323, 'KB14F003'),
(324, 'KB14F004'),
(325, 'KB14F005'),
(326, 'KB14F006'),
(327, 'KB14F007'),
(328, 'KB14F008'),
(329, 'KB14F009'),
(330, 'KB14F010'),
(331, 'KB14F011'),
(332, 'KB14F012'),
(333, 'KB14F013'),
(334, 'KB14F014'),
(335, 'KB14F015'),
(336, 'KB14F016'),
(337, 'KB14F017'),
(338, 'KB14F018'),
(339, 'KB14F019'),
(340, 'KB14F020'),
(341, 'KB14F021'),
(342, 'KB14F022'),
(343, 'KB14F023'),
(344, 'KB14F024'),
(345, 'KB14F025'),
(346, 'KB14F026'),
(347, 'KB14F027'),
(348, 'KB14F028'),
(349, 'KB14F029'),
(350, 'KB14F030'),
(351, 'KB14F031'),
(352, 'KB14F032'),
(353, 'KB14F033'),
(354, 'KB14F034'),
(355, 'KB14F035'),
(356, 'KB14F036'),
(357, 'KB14F037'),
(358, 'KB14F038'),
(359, 'KB14F039'),
(360, 'KB14F040'),
(361, 'KB14F041'),
(362, 'KB14F042'),
(363, 'KB14F043'),
(364, 'KB14F044'),
(365, 'KB14F045'),
(366, 'KB14F046'),
(367, 'KB14F047'),
(368, 'KB14F048'),
(369, 'KB14F049'),
(370, 'KB14F050'),
(371, 'KB14F051'),
(372, 'KB14F052'),
(373, 'KB14F053'),
(374, 'KB14F054'),
(375, 'KB14F055'),
(376, 'KB14F056'),
(377, 'KB14F057'),
(378, 'KB14F058'),
(379, 'KB14F059'),
(380, 'KB14F060'),
(381, 'KB14F061'),
(382, 'KB14F062'),
(383, 'KB14F063'),
(384, 'KB14F064'),
(385, 'KB14F065'),
(386, 'KB14F066'),
(387, 'KB14F067'),
(388, 'KB14F068'),
(389, 'KB14F069'),
(390, 'KB14F070'),
(391, 'KB14F071'),
(392, 'KB14F072'),
(393, 'KB14F073'),
(394, 'KB14F074'),
(395, 'KB14F075'),
(396, 'KB14F076'),
(397, 'KB14F077'),
(398, 'KB14F078'),
(399, 'KB14F079'),
(400, 'KB14F080'),
(401, 'KB14F081'),
(402, 'KB14F082'),
(403, 'KB14F083'),
(404, 'KB14F084'),
(405, 'KB14F085'),
(406, 'KB14F086'),
(407, 'KB14F087'),
(408, 'KB14F088'),
(409, 'KB14F089'),
(410, 'KB14F090');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`) VALUES
(1, 'store', '0192023a7bbd73250516f069df18b500', 'store'),
(3, 'customersupport', '5882c44da74f923baabe8476c6e8af37', 'customersupport'),
(4, 'supportengineer', 'f7bedc23f9d8f09b7ad6787f360bc995', 'support engineers'),
(5, 'operator', '2407bd807d6ca01d1bcd766c730cec9a', 'operators'),
(6, 'teamlead', 'e4c81ea0854762182c290566854a66ff', 'team lead'),
(7, 'admin', '25e4ee4e9229397b6b17776bfceaf8e7', 'admin'),
(9, 'service', '0192023a7bbd73250516f069df18b500', 'service');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `modems`
--
ALTER TABLE `modems`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `modem_mac_address` (`modem_mac_address`);

--
-- Indexes for table `modem_complaints`
--
ALTER TABLE `modem_complaints`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `operators`
--
ALTER TABLE `operators`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `operator_id` (`operator_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `modems`
--
ALTER TABLE `modems`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `modem_complaints`
--
ALTER TABLE `modem_complaints`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `operators`
--
ALTER TABLE `operators`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=412;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
