-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 17, 2022 at 03:04 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mydb`
--

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) NOT NULL,
  `title` text NOT NULL,
  `message` text NOT NULL,
  `token` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `delivered_at` timestamp NULL DEFAULT NULL,
  `delivery_attempts` bigint(20) DEFAULT NULL,
  `status` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `title`, `message`, `token`, `created_at`, `delivered_at`, `delivery_attempts`, `status`) VALUES
(1, 'demo', 'demofdefd', NULL, '2022-05-03 05:12:53', '2022-05-02 09:56:46', NULL, 1),
(2, 'Php push notification', 'Php push notification Php push notification', NULL, '2022-05-02 13:04:51', NULL, NULL, 0),
(17, 'dsfds', 'dfsdf', NULL, '2022-05-03 05:13:33', '2022-05-02 13:29:10', NULL, 1),
(18, 'demo', 'demo1234', NULL, '2022-05-03 05:13:43', '2022-05-02 13:51:23', NULL, 1),
(20, 'Demo notification', 'Demo notification', NULL, '2022-05-03 04:35:11', NULL, NULL, 0),
(29, 'Php Push Notificaton', 'Php Push Notificaton', NULL, '2022-05-03 04:51:35', NULL, NULL, 0),
(30, 'Php Push Notification', 'Php Push Notification Demo', NULL, '2022-05-03 04:53:01', '2022-05-03 04:53:01', NULL, 1),
(31, 'Php Push Notification', 'Php Push Notification', NULL, '2022-05-03 05:26:51', '2022-05-03 05:26:51', NULL, 1),
(32, 'Demo', 'Demo Message', NULL, '2022-05-03 06:05:34', '2022-05-03 06:05:34', NULL, 1),
(37, '123Title', 'test', NULL, '2022-05-03 07:26:02', NULL, NULL, 0),
(38, 'Title', 'test', NULL, '2022-05-03 07:26:09', NULL, NULL, 0),
(39, '123test`', 'test', NULL, '2022-05-03 07:27:12', '2022-05-03 07:27:12', NULL, 1),
(40, 'test', 'test messages', NULL, '2022-05-03 07:31:53', '2022-05-03 07:31:53', NULL, 1),
(41, 'Test', 'Test Message', NULL, '2022-05-03 07:42:33', '2022-05-03 07:42:33', NULL, 1),
(42, 'Demo Notification', 'Demo Notification', NULL, '2022-05-03 08:54:27', '2022-05-03 08:54:27', NULL, 1),
(43, 'Test', 'Test Message', NULL, '2022-05-03 09:16:26', '2022-05-03 09:16:26', NULL, 1),
(44, 'Demo', 'Demo', NULL, '2022-05-03 09:18:12', '2022-05-03 09:18:12', NULL, 1),
(45, 'Test Notification', 'Test Notification', NULL, '2022-05-03 09:24:07', '2022-05-03 09:24:07', NULL, 1),
(46, 'fsdfd', 'dsfsd', NULL, '2022-05-03 09:29:12', NULL, NULL, 0),
(49, 'Demo', 'Demo123', NULL, '2022-05-03 09:33:45', NULL, NULL, 0),
(50, 'dsfdsf', 'dsfds', NULL, '2022-05-03 09:38:11', NULL, NULL, 0),
(51, 'Test Notification', 'Test Notification', NULL, '2022-05-03 09:39:47', '2022-05-03 09:39:47', NULL, 1),
(52, 'Push Notification', 'Demo Push Notification', NULL, '2022-05-03 10:04:58', '2022-05-03 10:04:58', NULL, 1),
(53, 'Test notify call', 'Good Noon!!\r\nTest notify call description', NULL, '2022-05-03 10:25:48', '2022-05-03 10:25:48', NULL, 1),
(54, 'One more', 'One more for testing\r\nIts working!!!', NULL, '2022-05-03 10:29:15', '2022-05-03 10:29:15', NULL, 1),
(55, 'demo', 'demo message', NULL, '2022-05-03 13:00:42', '2022-05-03 13:00:42', NULL, 1),
(56, 'demo', 'demo', NULL, '2022-05-03 13:03:24', '2022-05-03 13:03:24', NULL, 1),
(57, 'demo', 'demo', NULL, '2022-05-03 13:05:02', '2022-05-03 13:05:02', NULL, 1),
(58, 'demo', 'demo', NULL, '2022-05-03 13:05:44', '2022-05-03 13:05:44', NULL, 1),
(59, 'demo', 'demo', NULL, '2022-05-03 13:07:39', '2022-05-03 13:07:39', NULL, 1),
(60, 'demo', 'demo', NULL, '2022-05-03 13:07:56', '2022-05-03 13:07:56', NULL, 1),
(61, 'Reminder', 'Send me update mails of today.', NULL, '2022-05-03 13:09:11', '2022-05-03 13:09:11', NULL, 1),
(62, 'Reminder', 'Send me update mails of today.', NULL, '2022-05-03 13:10:29', '2022-05-03 13:10:29', NULL, 1),
(63, 'Reminder', 'Send me update mails of today.', NULL, '2022-05-03 13:10:31', '2022-05-03 13:10:31', NULL, 1),
(64, 'Reminder', 'Send me update mails of today.', NULL, '2022-05-03 13:10:59', '2022-05-03 13:10:59', NULL, 1),
(65, 'Reminder', 'Send me update mails of today.', NULL, '2022-05-03 13:11:01', '2022-05-03 13:11:01', NULL, 1),
(66, 'Reminder', 'Send me update mails of today.', NULL, '2022-05-03 13:12:02', '2022-05-03 13:12:02', NULL, 1),
(67, 'Reminder', 'Send me update mails of today.', NULL, '2022-05-03 13:13:29', '2022-05-03 13:13:29', NULL, 1),
(68, 'Reminder', 'Send me update mails of today.', NULL, '2022-05-03 13:13:32', '2022-05-03 13:13:32', NULL, 1),
(69, 'asas', 'asas', NULL, '2022-05-03 13:15:12', '2022-05-03 13:15:12', NULL, 1),
(70, 'asas', 'asas', NULL, '2022-05-03 13:15:46', '2022-05-03 13:15:46', NULL, 1),
(71, 'asas', 'asas', NULL, '2022-05-03 13:15:48', '2022-05-03 13:15:48', NULL, 1),
(72, 'asas', 'asas', NULL, '2022-05-03 13:16:57', '2022-05-03 13:16:57', NULL, 1),
(73, 'demo', 'demo', NULL, '2022-05-03 13:20:23', '2022-05-03 13:20:23', NULL, 1),
(74, 'Test notification', 'Test notification', NULL, '2022-05-03 13:22:40', '2022-05-03 13:22:40', NULL, 1),
(75, 'Evening notification', 'Evening notification', NULL, '2022-05-03 13:24:39', '2022-05-03 13:24:39', NULL, 1),
(76, 'demo', 'hello', NULL, '2022-05-17 09:47:57', '2022-05-17 09:47:57', NULL, 1),
(77, 'Demo Notification', 'dsfdssfdes', NULL, '2022-05-17 09:50:41', '2022-05-17 09:50:41', NULL, 1),
(78, 'test', 'Test Notification\r\n', NULL, '2022-05-17 10:09:02', '2022-05-17 10:09:02', NULL, 1),
(79, 'dfv', 'dfd', 'cgn4kTdZQDGnmf5jwg7n6e:APA91bGLPlM-P1XuqqwRXv0R5lxvThcKC9Qt2aduorm7nZ5UxPeMBAVEDrhtQ5lQVwip2tGrlF4DT4P9WiMDEj5dGSoCOssFx7XD0kLgRG6KmGm7_1ikFsbuGN5dyPL8xat__e7Fc9AP\r\n', '2022-05-17 11:29:12', NULL, NULL, 0),
(80, 'Test Notificaation', 'Test message', 'cl7_nzAgQea7cL3V8PfKxb:APA91bFpB6GltHp7k1HYctYP23f-jyPa-5AuhitybFotj34jhsZzuKxk9OCM22SAvo5fDQx0ZlWf570Vs-QyQ2Zqzv6g_bQs15Vptie0lVOodSmAH5emt-GCXBfSsRmXvDY6pizGx2TI', '2022-05-17 11:29:43', '2022-05-17 11:29:43', NULL, 1),
(81, 'Reminder', 'Reminder Notification', 'exEmh1DWQqOknnQAuSg_GP:APA91bEHsshuERJRBgO9M4kQDdj4FyCaKs4WtWMuZK4VLQDdYTbwOPTH9EMjkbJzX_b1wM0XO6M9W7ZPAkFH5dROe2mA901Gox6QQCyT8yDe0iB13PiUsRNwQC-7n40jU0hypsmCoTzm', '2022-05-17 11:33:02', '2022-05-17 11:33:02', NULL, 1),
(82, 'demo', 'demo notification', 'csheLxvtSP6sP8nY4CGKcY:APA91bEWK8sZbbk6M27_35kuIYlHZRkFkqnj08yvL7YIfA70D2jzi_W3MPa08bLXNnvleYz9ADPraECadaQqegcqIMnSQXEEWDmZvTB-1WxnkXzTRpCcMjsBYv7t_WSA75MozMCS1iDn', '2022-05-17 11:37:13', '2022-05-17 11:37:13', NULL, 1),
(83, 'Demo ', 'Test Notification', 'csheLxvtSP6sP8nY4CGKcY:APA91bEWK8sZbbk6M27_35kuIYlHZRkFkqnj08yvL7YIfA70D2jzi_W3MPa08bLXNnvleYz9ADPraECadaQqegcqIMnSQXEEWDmZvTB-1WxnkXzTRpCcMjsBYv7t_WSA75MozMCS1iDn', '2022-05-17 11:42:26', '2022-05-17 11:42:26', NULL, 1),
(84, 'Test ', 'Demo notification', 'dn3g2v-_Scy2VPWblB5nNa:APA91bH5TEn14jQ5q6KRuciFija2kwaz5Q97zN6TVKKTz0ktPAw3rdGjQFz5F52dDCclKuBlJgPHxfuJKQI8iKsadfLmZ-fq0qWlHc8-XIBZ6-FvIAjEVvIQ1N-WA3sdokzhh9CweRw4\r\n', '2022-05-17 11:43:16', NULL, NULL, 0),
(85, 'Test ', 'Demo notification', 'dn3g2v-_Scy2VPWblB5nNa:APA91bH5TEn14jQ5q6KRuciFija2kwaz5Q97zN6TVKKTz0ktPAw3rdGjQFz5F52dDCclKuBlJgPHxfuJKQI8iKsadfLmZ-fq0qWlHc8-XIBZ6-FvIAjEVvIQ1N-WA3sdokzhh9CweRw4\r\n', '2022-05-17 11:43:33', NULL, NULL, 0),
(86, 'Test ', 'Demo notification', 'dn3g2v-_Scy2VPWblB5nNa:APA91bH5TEn14jQ5q6KRuciFija2kwaz5Q97zN6TVKKTz0ktPAw3rdGjQFz5F52dDCclKuBlJgPHxfuJKQI8iKsadfLmZ-fq0qWlHc8-XIBZ6-FvIAjEVvIQ1N-WA3sdokzhh9CweRw4', '2022-05-17 11:45:04', '2022-05-17 11:45:04', NULL, 1),
(87, 'Reminder', 'Demo Reminder', 'dn3g2v-_Scy2VPWblB5nNa:APA91bH5TEn14jQ5q6KRuciFija2kwaz5Q97zN6TVKKTz0ktPAw3rdGjQFz5F52dDCclKuBlJgPHxfuJKQI8iKsadfLmZ-fq0qWlHc8-XIBZ6-FvIAjEVvIQ1N-WA3sdokzhh9CweRw4', '2022-05-17 12:00:13', '2022-05-17 12:00:13', NULL, 1),
(88, 'Test ', 'Test Send Notification\r\n', 'exEmh1DWQqOknnQAuSg_GP:APA91bEHsshuERJRBgO9M4kQDdj4FyCaKs4WtWMuZK4VLQDdYTbwOPTH9EMjkbJzX_b1wM0XO6M9W7ZPAkFH5dROe2mA901Gox6QQCyT8yDe0iB13PiUsRNwQC-7n40jU0hypsmCoTzm', '2022-05-17 12:52:21', '2022-05-17 12:52:21', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email_id` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `name` varchar(30) NOT NULL,
  `device_token` varchar(300) DEFAULT NULL,
  `role` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email_id`, `password`, `name`, `device_token`, `role`) VALUES
(1, 'admin@gmail.com', '0e7517141fb53f21ee439b355b5a1d0a', 'Admin', NULL, 1),
(3, 'test@test.com', '81dc9bdb52d04dc20036dbd8313ed055', 'test', 'dn3g2v-_Scy2VPWblB5nNa:APA91bH5TEn14jQ5q6KRuciFija2kwaz5Q97zN6TVKKTz0ktPAw3rdGjQFz5F52dDCclKuBlJgPHxfuJKQI8iKsadfLmZ-fq0qWlHc8-XIBZ6-FvIAjEVvIQ1N-WA3sdokzhh9CweRw4', 2),
(47, 'test1@ gamil.com', 'b0baee9d279d34fa1dfd71aadb908c3f', 'Test 1', 'cgn4kTdZQDGnmf5jwg7n6e:APA91bGLPlM-P1XuqqwRXv0R5lxvThcKC9Qt2aduorm7nZ5UxPeMBAVEDrhtQ5lQVwip2tGrlF4DT4P9WiMDEj5dGSoCOssFx7XD0kLgRG6KmGm7_1ikFsbuGN5dyPL8xat__e7Fc9AP\r\n', 2),
(48, 'demo@test.com', 'fe01ce2a7fbac8fafaed7c982a04e229', 'Demo', 'cl7_nzAgQea7cL3V8PfKxb:APA91bFpB6GltHp7k1HYctYP23f-jyPa-5AuhitybFotj34jhsZzuKxk9OCM22SAvo5fDQx0ZlWf570Vs-QyQ2Zqzv6g_bQs15Vptie0lVOodSmAH5emt-GCXBfSsRmXvDY6pizGx2TI', 2),
(49, 'hiren@gmail.com', 'b5eb18516c3e896c3b4c99dcc4058c68', 'Hiren', 'exEmh1DWQqOknnQAuSg_GP:APA91bEHsshuERJRBgO9M4kQDdj4FyCaKs4WtWMuZK4VLQDdYTbwOPTH9EMjkbJzX_b1wM0XO6M9W7ZPAkFH5dROe2mA901Gox6QQCyT8yDe0iB13PiUsRNwQC-7n40jU0hypsmCoTzm', 2),
(50, 'test@demo.com', '76c6e658cba24e18971013d5b6142a0d', 'Test Demo', 'csheLxvtSP6sP8nY4CGKcY:APA91bEWK8sZbbk6M27_35kuIYlHZRkFkqnj08yvL7YIfA70D2jzi_W3MPa08bLXNnvleYz9ADPraECadaQqegcqIMnSQXEEWDmZvTB-1WxnkXzTRpCcMjsBYv7t_WSA75MozMCS1iDn', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
