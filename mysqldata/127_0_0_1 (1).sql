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
-- Database: `ccndata`
--
CREATE DATABASE IF NOT EXISTS `ccndata` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `ccndata`;
--
-- Database: `ccn_data`
--
CREATE DATABASE IF NOT EXISTS `ccn_data` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `ccn_data`;

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
--
-- Database: `ccn_login`
--
CREATE DATABASE IF NOT EXISTS `ccn_login` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `ccn_login`;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('store','services','customercare','supportengineer','admin','operator') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"ccn_data\",\"table\":\"modems\"},{\"db\":\"ccn_data\",\"table\":\"modem_complaints\"},{\"db\":\"ccn_data\",\"table\":\"operators\"},{\"db\":\"user_management\",\"table\":\"complaints\"},{\"db\":\"user_management\",\"table\":\"modems\"},{\"db\":\"ccn_data\",\"table\":\"users\"},{\"db\":\"ccn_login\",\"table\":\"users\"},{\"db\":\"user_management\",\"table\":\"operator_ids\"},{\"db\":\"user_management\",\"table\":\"items\"},{\"db\":\"user_management\",\"table\":\"users\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Dumping data for table `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'user_management', 'complaints', '{\"sorted_col\":\"`complaints`.`complaint_type` ASC\",\"CREATE_TIME\":\"2024-10-18 11:44:02\"}', '2024-10-29 10:13:37'),
('root', 'user_management', 'modems', '{\"sorted_col\":\"`modems`.`modem_serial_number` DESC\"}', '2024-10-19 05:20:18');

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2024-11-13 08:57:05', '{\"Console\\/Mode\":\"collapse\",\"NavigationWidth\":487}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
--
-- Database: `test1`
--
CREATE DATABASE IF NOT EXISTS `test1` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `test1`;

-- --------------------------------------------------------

--
-- Table structure for table `complaints`
--

CREATE TABLE `complaints` (
  `id` int(11) NOT NULL,
  `mac_address` varchar(255) DEFAULT NULL,
  `complaint_type` varchar(255) DEFAULT NULL,
  `complaint_date` datetime DEFAULT current_timestamp(),
  `power_status` varchar(50) DEFAULT NULL,
  `booting_status` varchar(50) DEFAULT NULL,
  `lan_port_status` varchar(50) DEFAULT NULL,
  `wlan_status` varchar(50) DEFAULT NULL,
  `web_login` varchar(50) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `user_login` varchar(255) DEFAULT NULL,
  `Complaint_status` varchar(50) DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `complaints`
--

INSERT INTO `complaints` (`id`, `mac_address`, `complaint_type`, `complaint_date`, `power_status`, `booting_status`, `lan_port_status`, `wlan_status`, `web_login`, `comment`, `user_login`, `Complaint_status`) VALUES
(31, 'qwerty', 'New Complaint', '2024-10-29 15:42:37', 'ok', 'ok', 'ok', 'ok', 'ok', 'non', 'jayesh', 'Open'),
(32, 'qwerty', 'New Complaint', '2024-10-29 16:23:22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Open'),
(33, '', 'new complaint', '2024-10-29 16:40:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Pending'),
(34, 'zxcvb', 'wifi not showing', '2024-10-30 12:24:18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `specification` varchar(50) NOT NULL,
  `location` varchar(100) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'Available'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modems`
--

CREATE TABLE `modems` (
  `id` int(11) NOT NULL,
  `operator_id` varchar(50) NOT NULL,
  `modem_vendor` varchar(50) NOT NULL,
  `mac_address` varchar(50) NOT NULL,
  `modem_serial_number` varchar(100) DEFAULT NULL,
  `complaint_count` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `modems`
--

INSERT INTO `modems` (`id`, `operator_id`, `modem_vendor`, `mac_address`, `modem_serial_number`, `complaint_count`) VALUES
(51, 'kb14a001', 'NETLINK', 'qwerty', 'qwerty', 4),
(52, '', '', '', '', 1),
(58, 'kb14a001', 'GX EARTH1010', 'zxcvb', 'na', 1);

-- --------------------------------------------------------

--
-- Table structure for table `operator_ids`
--

CREATE TABLE `operator_ids` (
  `id` int(11) NOT NULL,
  `operator_id` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `operator_ids`
--

INSERT INTO `operator_ids` (`id`, `operator_id`) VALUES
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
  `role` enum('store','services','customercare','supportengineer','ccn-engineers','admin') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`) VALUES
(2, 'jayesh', '0192023a7bbd73250516f069df18b500', 'services'),
(3, 'sreejesh', '0192023a7bbd73250516f069df18b500', 'services'),
(4, 'jithin', '0192023a7bbd73250516f069df18b500', 'services'),
(5, 'service', '0192023a7bbd73250516f069df18b500', 'services'),
(6, 'anusree', '0192023a7bbd73250516f069df18b500', 'customercare'),
(7, 'mamatha', '0192023a7bbd73250516f069df18b500', 'customercare'),
(8, 'customercare', '0192023a7bbd73250516f069df18b500', 'customercare'),
(9, 'nmcn', '0192023a7bbd73250516f069df18b500', 'supportengineer'),
(10, 'unity', '0192023a7bbd73250516f069df18b500', 'supportengineer'),
(11, 'ashith', '0192023a7bbd73250516f069df18b500', 'supportengineer'),
(12, 'pcn', '0192023a7bbd73250516f069df18b500', 'supportengineer'),
(13, 'kcn', '0192023a7bbd73250516f069df18b500', 'supportengineer'),
(18, 'admin', 'e6e061838856bf47e1de730719fb2609', 'admin'),
(22, 'root', 'e6e061838856bf47e1de730719fb2609', 'services'),
(23, 'sanjeev', '0192023a7bbd73250516f069df18b500', 'store'),
(24, 'store', '0192023a7bbd73250516f069df18b500', 'store');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `complaints`
--
ALTER TABLE `complaints`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mac_address` (`mac_address`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modems`
--
ALTER TABLE `modems`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mac_address` (`mac_address`);

--
-- Indexes for table `operator_ids`
--
ALTER TABLE `operator_ids`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `complaints`
--
ALTER TABLE `complaints`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `modems`
--
ALTER TABLE `modems`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `operator_ids`
--
ALTER TABLE `operator_ids`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=411;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `complaints`
--
ALTER TABLE `complaints`
  ADD CONSTRAINT `complaints_ibfk_1` FOREIGN KEY (`mac_address`) REFERENCES `modems` (`mac_address`);
--
-- Database: `user_management`
--
CREATE DATABASE IF NOT EXISTS `user_management` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `user_management`;

-- --------------------------------------------------------

--
-- Table structure for table `complaints`
--

CREATE TABLE `complaints` (
  `id` int(11) NOT NULL,
  `mac_address` varchar(255) DEFAULT NULL,
  `complaint_type` varchar(255) DEFAULT NULL,
  `complaint_date` datetime DEFAULT current_timestamp(),
  `power_status` varchar(50) DEFAULT NULL,
  `booting_status` varchar(50) DEFAULT NULL,
  `lan_port_status` varchar(50) DEFAULT NULL,
  `wlan_status` varchar(50) DEFAULT NULL,
  `web_login` varchar(50) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `user_login` varchar(255) DEFAULT NULL,
  `Complaint_status` varchar(50) DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `complaints`
--

INSERT INTO `complaints` (`id`, `mac_address`, `complaint_type`, `complaint_date`, `power_status`, `booting_status`, `lan_port_status`, `wlan_status`, `web_login`, `comment`, `user_login`, `Complaint_status`) VALUES
(43, '', '', '2024-10-31 16:13:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `specification` varchar(50) NOT NULL,
  `location` varchar(100) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'Available'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `type`, `specification`, `location`, `status`) VALUES
(1, 'switch', '1G', 'choyamkod', 'Available'),
(2, 'module', '1G-10km', 'choyamkod', 'Available'),
(3, 'switch', '100G', 'choyamkod', 'Available');

-- --------------------------------------------------------

--
-- Table structure for table `modems`
--

CREATE TABLE `modems` (
  `id` int(11) NOT NULL,
  `operator_id` varchar(50) NOT NULL,
  `modem_vendor` varchar(50) NOT NULL,
  `mac_address` varchar(50) NOT NULL,
  `modem_serial_number` varchar(100) DEFAULT NULL,
  `complaint_count` int(11) DEFAULT 0,
  `entry_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `modems`
--

INSERT INTO `modems` (`id`, `operator_id`, `modem_vendor`, `mac_address`, `modem_serial_number`, `complaint_count`, `entry_date`) VALUES
(51, 'kb14a001', 'NETLINK', 'qwerty', 'qwerty', NULL, NULL),
(58, 'kb14a001', 'GX EARTH1010', 'zxcvb', 'na', NULL, NULL),
(60, 'kb14a001', 'GX PLATINUM 4410', 'aSDFGG', 'na', NULL, NULL),
(62, 'kb14a001', 'NETLINK', 'efergrthrth', 'na', NULL, '2024-10-22'),
(66, 'KB14A003', 'GX PLATINUM 4410', 'lkjh', 'na', NULL, '2024-10-08'),
(68, 'KB14A012', 'GX PLATINUM 4410', 'swedrfg', 'na', NULL, '2024-10-14'),
(71, 'KB14A007', 'GX PLATINUM 4410', 'cvbn', 'asdfghjkl', NULL, '2024-10-02'),
(82, 'KB14A002', 'NETLINK DUAL BAND', 'yuhyt', 'na', NULL, '2024-10-02'),
(90, '', '', '', '', 1, '0000-00-00'),
(91, 'KB14A001', 'netlink', 'abc:abc:abc:asd', 'SADSFSGH', 0, '2024-11-05');

-- --------------------------------------------------------

--
-- Table structure for table `operator_ids`
--

CREATE TABLE `operator_ids` (
  `id` int(11) NOT NULL,
  `operator_id` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `operator_ids`
--

INSERT INTO `operator_ids` (`id`, `operator_id`) VALUES
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
  `role` enum('store','services','customercare','supportengineer','ccn-engineers','admin') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`) VALUES
(2, 'jayesh', '0192023a7bbd73250516f069df18b500', 'services'),
(3, 'sreejesh', '0192023a7bbd73250516f069df18b500', 'services'),
(4, 'jithin', '0192023a7bbd73250516f069df18b500', 'services'),
(5, 'service', '0192023a7bbd73250516f069df18b500', 'services'),
(6, 'anusree', '0192023a7bbd73250516f069df18b500', 'customercare'),
(7, 'mamatha', '0192023a7bbd73250516f069df18b500', 'customercare'),
(8, 'customercare', '0192023a7bbd73250516f069df18b500', 'customercare'),
(9, 'nmcn', '0192023a7bbd73250516f069df18b500', 'supportengineer'),
(10, 'unity', '0192023a7bbd73250516f069df18b500', 'supportengineer'),
(11, 'ashith', '0192023a7bbd73250516f069df18b500', 'supportengineer'),
(12, 'pcn', '0192023a7bbd73250516f069df18b500', 'supportengineer'),
(13, 'kcn', '0192023a7bbd73250516f069df18b500', 'supportengineer'),
(18, 'admin', 'e6e061838856bf47e1de730719fb2609', 'admin'),
(22, 'root', 'e6e061838856bf47e1de730719fb2609', 'services'),
(23, 'sanjeev', '0192023a7bbd73250516f069df18b500', 'store'),
(24, 'store', '0192023a7bbd73250516f069df18b500', 'store');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `complaints`
--
ALTER TABLE `complaints`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mac_address` (`mac_address`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modems`
--
ALTER TABLE `modems`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mac_address` (`mac_address`);

--
-- Indexes for table `operator_ids`
--
ALTER TABLE `operator_ids`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `complaints`
--
ALTER TABLE `complaints`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `modems`
--
ALTER TABLE `modems`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `operator_ids`
--
ALTER TABLE `operator_ids`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=411;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `complaints`
--
ALTER TABLE `complaints`
  ADD CONSTRAINT `complaints_ibfk_1` FOREIGN KEY (`mac_address`) REFERENCES `modems` (`mac_address`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
