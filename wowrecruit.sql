-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 25, 2018 at 12:45 PM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wowrecruit`
--

-- --------------------------------------------------------

--
-- Table structure for table `api_access`
--

CREATE TABLE `api_access` (
  `id` bigint(20) NOT NULL,
  `target_url` varchar(500) COLLATE utf8mb4_bin NOT NULL,
  `call_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `api_access`
--

INSERT INTO `api_access` (`id`, `target_url`, `call_time`) VALUES
(1, 'https://EU.api.battle.net/wow/character/Frostwhisper/Vulegend?fields=titles&locale=en_GB&apikey=6dmjbx6u5gb64zpbssjydvzrxmscmug4', '2018-08-24 23:14:02'),
(2, 'https://EU.api.battle.net/wow/character/Frostwhisper/Vulegend?fields=titles&locale=en_GB&apikey=6dmjbx6u5gb64zpbssjydvzrxmscmug4', '2018-08-24 23:14:34'),
(3, 'https://EU.api.battle.net/wow/character/Frostwhisper/Vulegend?fields=items%2Cguild&locale=en_GB&apikey=6dmjbx6u5gb64zpbssjydvzrxmscmug4', '2018-08-24 23:20:32'),
(4, 'https://EU.api.battle.net/wow/character/Frostwhisper/Vulegend?fields=items%2Cguild&locale=en_GB&apikey=6dmjbx6u5gb64zpbssjydvzrxmscmug4', '2018-08-24 23:20:54');

-- --------------------------------------------------------

--
-- Table structure for table `guild`
--

CREATE TABLE `guild` (
  `guild_id` bigint(20) NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_bin NOT NULL,
  `realm` varchar(150) COLLATE utf8mb4_bin NOT NULL,
  `faction` smallint(6) NOT NULL,
  `region` varchar(25) COLLATE utf8mb4_bin NOT NULL,
  `member_count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `pending_characters`
--

CREATE TABLE `pending_characters` (
  `id` bigint(20) NOT NULL,
  `character_id` bigint(20) NOT NULL,
  `current_title` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `swap_to_title` varchar(150) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` bigint(20) NOT NULL,
  `is_confirmed` tinyint(1) NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_bin NOT NULL,
  `google_id` varchar(255) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `is_confirmed`, `email`, `google_id`) VALUES
(1, 0, '123123123@gmail.com', 'LPlFYyIGaTaQqn42fciGNkt8C8y1'),
(2, 0, 'asfadg@gmail.com', 'VO3MctE8XPSRMQjJsmE5grbAAmb2'),
(3, 0, 'vasdasd@gmail.com', 'VL0KqKu6G7cRzCJMP61RRPGQlZH3'),
(4, 0, 'asgasdg@gmail.com', 'LYq9wmaejfZOgWal47jw9sqvjTS2'),
(5, 0, 'dghsfdhgs@gmail.com', '2aieYCNRfDMY4n2jxX8zvkITeLp2'),
(6, 0, 'vvucenovic@gmail.com', 'b7t8FbnJHnV8zkq0qbeczeDhwwQ2'),
(7, 0, 'vvucenovic@gmail.com', 'JAZqmHyadWP8CuCj0TW5FhpRmwg2'),
(8, 0, 'asfgasf@gmail.com', 'f20kB5pRe6Yr5bcOJr6UQUmIOV22'),
(9, 0, 'asdasasg@gmail.com', 'tks7RzMOKzUCP4V0CHOHp74Boeo2');

-- --------------------------------------------------------

--
-- Table structure for table `user_character`
--

CREATE TABLE `user_character` (
  `character_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `class` smallint(6) NOT NULL,
  `race` smallint(6) NOT NULL,
  `faction` smallint(6) NOT NULL,
  `guild` varchar(150) COLLATE utf8mb4_bin DEFAULT NULL,
  `guild_position` smallint(6) NOT NULL,
  `item_level` smallint(6) NOT NULL,
  `server` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `locale` varchar(10) COLLATE utf8mb4_bin NOT NULL,
  `level` smallint(6) NOT NULL,
  `is_confirmed` tinyint(1) NOT NULL,
  `guild_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `api_access`
--
ALTER TABLE `api_access`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `guild`
--
ALTER TABLE `guild`
  ADD PRIMARY KEY (`guild_id`);

--
-- Indexes for table `pending_characters`
--
ALTER TABLE `pending_characters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_character`
--
ALTER TABLE `user_character`
  ADD PRIMARY KEY (`character_id`),
  ADD UNIQUE KEY `user_id_ind` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `api_access`
--
ALTER TABLE `api_access`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `guild`
--
ALTER TABLE `guild`
  MODIFY `guild_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pending_characters`
--
ALTER TABLE `pending_characters`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `user_character`
--
ALTER TABLE `user_character`
  MODIFY `character_id` bigint(20) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
