-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 31, 2017 at 08:21 AM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bikeapp_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `achievements`
--

CREATE TABLE `achievements` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `exp` int(11) NOT NULL,
  `type` enum('single','overall') COLLATE utf8_unicode_ci NOT NULL,
  `threshold` int(11) NOT NULL,
  `threshold_type` enum('cadence','speed','distance','time') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `achievements`
--

INSERT INTO `achievements` (`id`, `name`, `exp`, `type`, `threshold`, `threshold_type`, `created_at`, `updated_at`) VALUES
(1, 'Mrs. Etha Daugherty', 409, 'single', 2, 'speed', '2017-05-29 10:41:33', '2017-05-29 10:41:33'),
(2, 'Gisselle Shanahan', 932, 'single', 7, 'cadence', '2017-05-29 10:41:33', '2017-05-29 10:41:33'),
(3, 'Dr. Delores Hintz DVM', 727, 'single', 5, 'cadence', '2017-05-29 10:41:33', '2017-05-29 10:41:33'),
(4, 'Freeman Hessel', 73, 'single', 9, 'cadence', '2017-05-29 10:41:33', '2017-05-29 10:41:33'),
(5, 'Dr. May Daniel', 695, '', 3, 'speed', '2017-05-29 10:41:33', '2017-05-29 10:41:33'),
(6, 'Flavio Steuber', 227, 'single', 10, 'distance', '2017-05-29 10:41:33', '2017-05-29 10:41:33'),
(7, 'Edwardo King', 614, 'single', 6, '', '2017-05-29 10:41:33', '2017-05-29 10:41:33'),
(8, 'Pasquale Weimann', 160, '', 2, 'distance', '2017-05-29 10:41:33', '2017-05-29 10:41:33'),
(9, 'Angie Kuhn', 566, 'single', 7, 'distance', '2017-05-29 10:41:33', '2017-05-29 10:41:33'),
(10, 'Reuben Murphy', 700, 'single', 6, '', '2017-05-29 10:41:33', '2017-05-29 10:41:33'),
(11, 'Prof. Maximillian Pfeffer DVM', 557, '', 4, 'cadence', '2017-05-29 10:41:33', '2017-05-29 10:41:33'),
(12, 'Prof. Sydney Kihn', 467, '', 5, 'cadence', '2017-05-29 10:41:33', '2017-05-29 10:41:33'),
(13, 'Prof. Samanta Hagenes Sr.', 729, '', 4, 'distance', '2017-05-29 10:41:33', '2017-05-29 10:41:33'),
(14, 'Prof. Ferne Tremblay', 74, '', 6, 'distance', '2017-05-29 10:41:33', '2017-05-29 10:41:33'),
(15, 'Timothy Altenwerth', 703, 'single', 6, 'cadence', '2017-05-29 10:41:33', '2017-05-29 10:41:33'),
(16, 'Stephania Lynch', 795, 'single', 6, '', '2017-05-29 10:41:33', '2017-05-29 10:41:33'),
(17, 'Dangelo Stracke', 254, '', 8, '', '2017-05-29 10:41:33', '2017-05-29 10:41:33'),
(18, 'Thelma Lesch', 576, 'single', 6, 'speed', '2017-05-29 10:41:33', '2017-05-29 10:41:33'),
(19, 'Mr. Evan Legros II', 946, '', 5, '', '2017-05-29 10:41:33', '2017-05-29 10:41:33'),
(20, 'Mr. Makenna Kiehn', 470, 'single', 10, 'cadence', '2017-05-29 10:41:33', '2017-05-29 10:41:33');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2017_05_29_102658_create_users_table', 1),
(2, '2017_05_29_102744_create_trip_table', 1),
(3, '2017_05_29_102821_create_achievements_table', 1),
(4, '2017_05_29_102903_create_user_achievements_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `trips`
--

CREATE TABLE `trips` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `start_longitude` double(10,5) NOT NULL,
  `start_latitude` double(10,5) NOT NULL,
  `end_longitude` double(10,5) NOT NULL,
  `end_latitude` double(10,5) NOT NULL,
  `start_time` datetime NOT NULL,
  `finish_time` datetime NOT NULL,
  `distance` double(10,5) NOT NULL,
  `top_speed` double(10,5) NOT NULL,
  `average_cadence` double(10,5) NOT NULL,
  `top_cadence` double(10,5) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `trips`
--

INSERT INTO `trips` (`id`, `user_id`, `start_longitude`, `start_latitude`, `end_longitude`, `end_latitude`, `start_time`, `finish_time`, `distance`, `top_speed`, `average_cadence`, `top_cadence`, `created_at`, `updated_at`) VALUES
(1, 3, 72.00000, 60.00000, 180.00000, 45.00000, '2004-07-25 08:19:41', '2004-07-25 12:08:25', 193.00000, 75.00000, 41.00000, 92.00000, '2017-05-29 10:41:32', '2017-05-29 10:41:32'),
(2, 10, 40.00000, 90.00000, 360.00000, 180.00000, '2005-07-10 17:48:44', '2005-07-10 20:56:33', 964.00000, 84.00000, 12.00000, 59.00000, '2017-05-29 10:41:32', '2017-05-29 10:41:32'),
(3, 10, 45.00000, 120.00000, 45.00000, 36.00000, '2005-03-25 08:01:59', '2005-03-25 10:35:29', 153.00000, 78.00000, 51.00000, 29.00000, '2017-05-29 10:41:32', '2017-05-29 10:41:32'),
(4, 2, 360.00000, 51.42857, 72.00000, 180.00000, '2012-10-02 06:44:19', '2012-10-02 08:30:22', 99.00000, 46.00000, 92.00000, 51.00000, '2017-05-29 10:41:32', '2017-05-29 10:41:32'),
(5, 10, 45.00000, 90.00000, 36.00000, 90.00000, '2010-08-04 16:19:47', '2010-08-14 20:29:34', 433.00000, 100.00000, 7.00000, 2.00000, '2017-05-29 10:41:32', '2017-05-29 10:41:32'),
(6, 3, 72.00000, 45.00000, 360.00000, 90.00000, '2006-11-15 06:27:05', '2006-11-15 12:02:12', 688.00000, 44.00000, 75.00000, 79.00000, '2017-05-29 10:41:32', '2017-05-29 10:41:32'),
(7, 8, 120.00000, 51.42857, 51.42857, 180.00000, '2014-09-01 20:56:01', '2014-09-01 22:14:01', 199.00000, 86.00000, 81.00000, 28.00000, '2017-05-29 10:41:32', '2017-05-29 10:41:32'),
(8, 8, 60.00000, 51.42857, 180.00000, 90.00000, '2015-08-11 19:58:29', '2015-08-11 20:19:42', 515.00000, 37.00000, 80.00000, 46.00000, '2017-05-29 10:41:32', '2017-05-29 10:41:32'),
(9, 3, 180.00000, 40.00000, 36.00000, 51.42857, '2011-12-28 05:02:01', '2011-12-28 12:01:06', 706.00000, 33.00000, 92.00000, 87.00000, '2017-05-29 10:41:32', '2017-05-29 10:41:32'),
(10, 10, 36.00000, 60.00000, 72.00000, 120.00000, '2010-09-25 18:46:23', '2010-09-25 20:57:30', 75.00000, 2.00000, 50.00000, 28.00000, '2017-05-29 10:41:33', '2017-05-29 10:41:33');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `created_at`, `updated_at`) VALUES
(1, 'Ms. Alessia Gerhold Sr.', 'anahi.casper@gmail.com', '$2y$10$TqmTK9f2SKkC548zg2JLMu7PqAMHYYfvPg35/VDcqbE2cnFdKpgya', '2017-05-29 10:41:32', '2017-05-29 10:41:32'),
(2, 'Zander Connelly DDS', 'nmills@hotmail.com', '$2y$10$sp16CKVXvV.AkEelQIbFm.y/GFJqFdhtuI5Wlz0puxeOE4PCUMBFe', '2017-05-29 10:41:32', '2017-05-29 10:41:32'),
(3, 'Janet DuBuque', 'alaina.nader@gmail.com', '$2y$10$yBcCmnG1cVsQW5Iw3oEu4u3VJmrW41N1VdkbY3gzhrkWPClTwaVkK', '2017-05-29 10:41:32', '2017-05-29 10:41:32'),
(4, 'Elody Jaskolski', 'hmonahan@yahoo.com', '$2y$10$fsyKTk7Es4XvlEA.z4zEReCqDpytUKp/W.HYhbedYD5kUJxlxGsiC', '2017-05-29 10:41:32', '2017-05-29 10:41:32'),
(5, 'Chaya Heller', 'bartoletti.elna@hotmail.com', '$2y$10$g5j0iWnx4/pk18OypzJ6genzK4TVlp7bejdTVZAZmL0viJNA40nh2', '2017-05-29 10:41:32', '2017-05-29 10:41:32'),
(6, 'Mrs. Lempi Zulauf DVM', 'yboyle@sipes.com', '$2y$10$uv3pqnhrz54x5yKEaZzVqeN2Boj1pOS9zmfVkCySJkoVMm6HyhUqC', '2017-05-29 10:41:32', '2017-05-29 10:41:32'),
(7, 'Mikayla McDermott Sr.', 'jermey56@yahoo.com', '$2y$10$uzAtLQeqC1t6rneAOLqRsOdQq1DhbnHZ.71.MVHqxSGYvvw72HPa.', '2017-05-29 10:41:32', '2017-05-29 10:41:32'),
(8, 'Bernhard Dickens', 'general41@schoen.com', '$2y$10$gz3CEflwt96Eo8SAgTraZuR8s.uh1JUMwHhciyyRhn5F9RpkxqkWC', '2017-05-29 10:41:32', '2017-05-29 10:41:32'),
(9, 'Frances Lesch', 'zkilback@yahoo.com', '$2y$10$QjLfScWjW70JwPDYVEV/l.2PN8oVzC8yD4J61GNeVzT7un/S1JsEK', '2017-05-29 10:41:32', '2017-05-29 10:41:32'),
(10, 'Minerva Russel IV', 'juana13@hotmail.com', '$2y$10$Qh3uammrugY7/jPnCMK73uCcDrQHN2P0TFQySG8pnc2KSkhyuxHV2', '2017-05-29 10:41:32', '2017-05-29 10:41:32');

-- --------------------------------------------------------

--
-- Table structure for table `user_achievements`
--

CREATE TABLE `user_achievements` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `achievement_id` int(10) UNSIGNED NOT NULL,
  `trip_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_achievements`
--

INSERT INTO `user_achievements` (`id`, `user_id`, `achievement_id`, `trip_id`, `created_at`, `updated_at`) VALUES
(1, 10, 6, 9, '2017-05-29 10:41:33', '2017-05-29 10:41:33'),
(2, 1, 6, 6, '2017-05-29 10:41:33', '2017-05-29 10:41:33'),
(3, 2, 9, 2, '2017-05-29 10:41:33', '2017-05-29 10:41:33'),
(4, 4, 10, 4, '2017-05-29 10:41:33', '2017-05-29 10:41:33'),
(5, 9, 9, 9, '2017-05-29 10:41:33', '2017-05-29 10:41:33'),
(6, 8, 7, 7, '2017-05-29 10:41:33', '2017-05-29 10:41:33'),
(7, 3, 9, 8, '2017-05-29 10:41:33', '2017-05-29 10:41:33'),
(8, 6, 8, 8, '2017-05-29 10:41:33', '2017-05-29 10:41:33'),
(9, 5, 4, 2, '2017-05-29 10:41:33', '2017-05-29 10:41:33'),
(10, 7, 9, 7, '2017-05-29 10:41:33', '2017-05-29 10:41:33');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `achievements`
--
ALTER TABLE `achievements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trips`
--
ALTER TABLE `trips`
  ADD PRIMARY KEY (`id`),
  ADD KEY `trips_user_id_foreign` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_achievements`
--
ALTER TABLE `user_achievements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_achievements_user_id_foreign` (`user_id`),
  ADD KEY `user_achievements_achievement_id_foreign` (`achievement_id`),
  ADD KEY `user_achievements_trip_id_foreign` (`trip_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `achievements`
--
ALTER TABLE `achievements`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `trips`
--
ALTER TABLE `trips`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `user_achievements`
--
ALTER TABLE `user_achievements`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `trips`
--
ALTER TABLE `trips`
  ADD CONSTRAINT `trips_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_achievements`
--
ALTER TABLE `user_achievements`
  ADD CONSTRAINT `user_achievements_achievement_id_foreign` FOREIGN KEY (`achievement_id`) REFERENCES `achievements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_achievements_trip_id_foreign` FOREIGN KEY (`trip_id`) REFERENCES `trips` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_achievements_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
