-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 20, 2020 at 01:57 AM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `alumni_dtu`
--

-- --------------------------------------------------------

--
-- Table structure for table `alumni_group`
--

DROP TABLE IF EXISTS `alumni_group`;
CREATE TABLE IF NOT EXISTS `alumni_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group_decription` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `sum_member` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `FKahet9s63nsf6haypk6o7gqawp` (`create_by`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `alumni_group`
--

INSERT INTO `alumni_group` (`id`, `group_name`, `group_decription`, `create_by`, `sum_member`) VALUES
(0, 'Cộng Đồng DTU', 'Cộng đồng của sinh viên Duy Tân', NULL, 0),
(2, 'CSU', 'CSU', 1, 0),
(4, 'Cuu sinh vien k23 CMU', 'Cuu sinh vien k23 CMU', 1, 0),
(5, 'Cựu sinh viên k18', 'Cựu sinh viên k18', 1, 0),
(6, 'Cựu sinh viên k19', 'Cựu sinh viên k19', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `chatchannel`
--

DROP TABLE IF EXISTS `chatchannel`;
CREATE TABLE IF NOT EXISTS `chatchannel` (
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userIdOne` int(11) DEFAULT NULL,
  `userIdTwo` int(11) DEFAULT NULL,
  PRIMARY KEY (`uuid`),
  KEY `FKevhusrfb52ha27hi0nxnfk5b4` (`userIdOne`),
  KEY `FK2ebryv65ujand1h1dsghlqhxk` (`userIdTwo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chatchannel`
--

INSERT INTO `chatchannel` (`uuid`, `userIdOne`, `userIdTwo`) VALUES
('', 1, 20);

-- --------------------------------------------------------

--
-- Table structure for table `chatmessage`
--

DROP TABLE IF EXISTS `chatmessage`;
CREATE TABLE IF NOT EXISTS `chatmessage` (
  `id` bigint(20) NOT NULL,
  `contents` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `timeSent` datetime NOT NULL,
  `authorUserId` int(11) DEFAULT NULL,
  `recipientUserId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKr8oi32b9hjjmrc9rv5tlpmcn2` (`authorUserId`),
  KEY `FKg5vsq2ogos3967sah9xs6gt25` (`recipientUserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
CREATE TABLE IF NOT EXISTS `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time_comment` datetime NOT NULL,
  `post_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKgrxmwlp2sbi6we2dtaqtd4asx` (`authorId`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`id`, `comment`, `time_comment`, `post_id`, `parent_id`, `authorId`) VALUES
(18, 'hello', '2020-11-02 09:14:53', 17, 0, 2),
(19, 'hêlo', '2020-11-02 09:15:02', 17, 0, 2),
(20, 'hihi', '2020-11-02 09:16:33', 17, 19, 2),
(21, 'ds', '2020-11-02 09:16:53', 17, 0, 2),
(22, 'kk', '2020-11-02 09:17:16', 17, 19, 2),
(23, 'fdsg', '2020-11-02 09:22:26', 17, 19, 2),
(24, 'gdf', '2020-11-02 09:22:28', 17, 19, 2),
(25, 'gdfgdfh', '2020-11-02 09:22:30', 17, 19, 2),
(26, 'gdf', '2020-11-02 09:26:26', 17, 0, 2),
(27, 'hgf', '2020-11-02 09:26:26', 17, 0, 2),
(28, 'sf', '2020-11-02 09:26:27', 17, 0, 2),
(29, 'fds', '2020-11-02 10:07:31', 17, 19, 2),
(30, 'js', '2020-11-02 10:07:48', 17, 19, 2),
(31, 'gdfg', '2020-11-02 10:08:42', 17, 0, 2),
(32, 'nhfsjdh', '2020-11-02 12:15:24', 17, 0, 1),
(33, 'jgsdf', '2020-11-02 12:15:41', 17, 21, 1),
(34, 'hjh', '2020-11-02 12:15:59', 17, 21, 1),
(35, 'dũng ', '2020-11-02 12:20:01', 19, 0, 1),
(36, 'gf', '2020-11-02 12:23:37', 17, 21, 1),
(37, 'jdgh', '2020-11-02 12:23:51', 16, 0, 1),
(38, 'alo', '2020-11-02 12:32:04', 16, 0, 1),
(39, 'alo', '2020-11-02 12:32:24', 16, 0, 1),
(40, 'fd', '2020-11-02 12:33:01', 16, 39, 1),
(41, 'fd', '2020-11-02 12:33:26', 16, 0, 1),
(42, 'fgd', '2020-11-02 12:34:49', 17, 0, 1),
(43, 'fdgf', '2020-11-02 12:44:52', 17, 0, 1),
(44, 'fd', '2020-11-02 12:45:56', 17, 0, 1),
(45, 'fd', '2020-11-02 12:47:55', 17, 0, 1),
(46, 'gf', '2020-11-02 12:51:36', 17, 0, 1),
(47, 'gf', '2020-11-02 12:51:36', 17, 0, 1),
(48, 'fd', '2020-11-02 12:54:04', 17, 0, 1),
(49, 'a', '2020-11-02 12:56:39', 16, 0, 1),
(50, 'gdf', '2020-11-02 13:09:47', 19, 0, 1),
(51, 'fd', '2020-11-02 13:12:37', 17, 21, 1),
(52, 'gf', '2020-11-02 13:12:38', 17, 21, 1),
(53, 'gf', '2020-11-02 13:12:44', 17, 0, 1),
(54, 'fd', '2020-11-02 13:15:59', 16, 49, 1),
(55, 'fd', '2020-11-02 13:16:04', 16, 0, 1),
(56, 'fd', '2020-11-02 13:20:35', 16, 0, 1),
(57, 'fd', '2020-11-02 13:23:13', 14, 0, 1),
(58, 'dfgf', '2020-11-05 12:14:04', 19, 0, 1),
(59, 'fd', '2020-12-05 02:59:36', 28, 0, 1),
(60, 'fdgdf', '2020-12-05 02:59:37', 28, 0, 1),
(61, 'dgfdg', '2020-12-05 02:59:43', 19, 58, 1),
(62, 'fsd', '2020-12-05 02:59:44', 19, 58, 1);

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
CREATE TABLE IF NOT EXISTS `contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contact_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_send` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id`, `contact_name`, `email`, `message`, `time_send`) VALUES
(1, '', '', '', '2020-12-01 12:26:17'),
(2, 'fgf', 'nghianguyen168197@gmail.com', 'fdfgfd', '2020-12-01 12:26:22'),
(3, 'nghia nguyen', 'nghianguyen168197@gmail.com', 'hello', '2020-12-12 08:36:43');

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
CREATE TABLE IF NOT EXISTS `event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `place` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `event_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `decription` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time_start` timestamp NULL DEFAULT NULL,
  `time_end` timestamp NULL DEFAULT NULL,
  `enable` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`id`, `place`, `event_name`, `image`, `decription`, `time_start`, `time_end`, `enable`) VALUES
(1, '03 Quang trung', 'e fd f', NULL, 'fkjdh', '2020-10-16 15:42:00', '2020-10-17 15:42:00', 0),
(2, 'sdgdf', 'fdsfgds', NULL, 'gdfgdfgdf', '2020-10-16 15:42:00', '2020-10-10 15:42:00', 0),
(3, 'rewrwe', 'rrwerew', NULL, 'rưerwerwe', '2020-10-16 15:43:00', '2020-10-25 15:43:00', 0),
(4, 'fdf', 'ffff', NULL, 'fdsf', '2020-10-13 15:50:00', '2020-10-08 15:50:00', 0),
(5, 'ff', 'dfsdfds', NULL, 'fdfsd', '2020-10-02 16:27:00', '2020-10-02 16:29:00', 1),
(6, 'fdfd', 'fdgdfgdfg', NULL, 'fdsfd', '2020-10-02 16:47:00', '2020-10-10 16:49:00', 1),
(7, '254 Nguyễn Văn Linh', 'Bảo vệ captone 1', 'biet-thu-nha-vuon-1-tang.jpg', '', '2021-01-11 00:30:00', '2021-01-11 15:30:00', 1),
(8, '254 Nguyễn Văn Linh', 'Bảo vệ captone 1', 'images (1).jfif', 'Bảo vệ captone 1 K23 - Khoa CNTT,Khoa DTQT', '2020-12-28 14:01:00', '2020-12-28 16:01:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

DROP TABLE IF EXISTS `faculty`;
CREATE TABLE IF NOT EXISTS `faculty` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `faculty_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`id`, `faculty_name`) VALUES
(1, 'DTQT');

-- --------------------------------------------------------

--
-- Table structure for table `folow_job`
--

DROP TABLE IF EXISTS `folow_job`;
CREATE TABLE IF NOT EXISTS `folow_job` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `group_member`
--

DROP TABLE IF EXISTS `group_member`;
CREATE TABLE IF NOT EXISTS `group_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKhm4ypkf4tyhf6he2ngw09t6p4` (`group_id`),
  KEY `FKeamf7nngsg582uxwqgde8o28x` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `group_member`
--

INSERT INTO `group_member` (`id`, `group_id`, `member_id`) VALUES
(1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `group_post`
--

DROP TABLE IF EXISTS `group_post`;
CREATE TABLE IF NOT EXISTS `group_post` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `media` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_post` datetime NOT NULL,
  `group_id` int(11) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  `sum_comment` int(11) DEFAULT NULL,
  `sum_like` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKg3nb0hmavnnhgndqmcea8w1rp` (`group_id`),
  KEY `FKgopw03ykvj1b8r1kxqxhnsqqr` (`author_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `group_post`
--

INSERT INTO `group_post` (`id`, `title`, `media`, `file`, `time_post`, `group_id`, `author_id`, `sum_comment`, `sum_like`) VALUES
(14, 'fdfdssd', '|1920x1200_px_Code_Dark_Laravel_PHP_programming_Simple-1348569.jpg', NULL, '2020-10-30 15:24:40', 0, 1, 0, 0),
(16, 'hihi', 'hihihihi.jpg', NULL, '2020-10-30 15:34:27', 0, 1, 0, 0),
(17, 'fdfsdfsd', '1920x1200-px-life-PHP-programming-success-1207823-wallhere.com.jpg|hihihihi.jpg', NULL, '2020-10-30 15:34:46', 0, 1, 0, 0),
(18, 'gfdhgf', '1920x1200-px-life-PHP-programming-success-1207823-wallhere.com.jpg', NULL, '2020-10-30 16:11:48', 0, 17, 0, 0),
(19, 'helo anh em', '1920x1200-px-life-PHP-programming-success-1207823-wallhere.com.jpg', NULL, '2020-10-30 16:13:16', 0, 18, 0, 0),
(20, 'fdg\r\n', '|', '', '2020-11-02 13:03:31', 0, 18, 0, 0),
(21, 'my profile', '', 'Group3-Process-Question.pdf', '2020-11-04 12:49:23', 0, 9, NULL, NULL),
(22, 'hg', '', '', '2020-11-07 08:51:04', 0, 20, NULL, NULL),
(23, 'alo la', '', '', '2020-11-16 13:45:05', 4, 1, NULL, NULL),
(24, 'hihi', '', '', '2020-11-16 13:45:08', 4, 1, NULL, NULL),
(25, 'fdfd\r\n', '', '', '2020-11-16 13:45:23', 0, 1, NULL, NULL),
(26, 'file bài thực hành', '', 'Bài thực hành 9.pdf', '2020-11-16 13:47:31', 4, 1, NULL, NULL),
(27, 'helo mọi người', '', '', '2020-11-21 06:43:12', 0, 27, NULL, NULL),
(28, '', '|biet-thu-nha-vuon-1-tang.jpg|luat-moi-gioi-nha-dat-4.jpg', '', '2020-11-28 13:33:32', 0, 1, NULL, NULL),
(29, 'gdfhgd\\\r\n', '', '', '2020-12-19 03:10:30', 0, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
CREATE TABLE IF NOT EXISTS `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hibernate_sequence`
--

INSERT INTO `hibernate_sequence` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
CREATE TABLE IF NOT EXISTS `job` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `salary` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deadline_apply` date NOT NULL,
  `posted_on` date NOT NULL,
  `views` int(11) DEFAULT 0,
  `decription` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enable` int(11) DEFAULT NULL,
  `major_id` int(11) DEFAULT NULL,
  `authorId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9wag5yf19odet2ehd4wochvbe` (`authorId`),
  KEY `FK65ble7l5oimv9mnw6ybwac6eu` (`major_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `job`
--

INSERT INTO `job` (`id`, `position`, `company_name`, `location`, `salary`, `deadline_apply`, `posted_on`, `views`, `decription`, `enable`, `major_id`, `authorId`) VALUES
(1, 'đâs', 'dsadas', 'Vietnam', '10.000.000 VNĐ', '2020-11-11', '2020-10-06', 3, '<p>fdsfsfd</p>\r\n', 1, 1, NULL),
(6, 'fdfdsgfgfh', 'fdfsd', 'Vietnam', 'fd', '2020-12-11', '2020-10-06', 2, '<p>fsfd</p>\r\n', 1, 1, 1),
(7, 'Junior Java Dev', 'TP Entertainment', 'Hà Nội', 'Thỏa Thuận', '2020-11-11', '2020-10-06', 13, '<p>Tại sao bạn sẽ y&ecirc;u th&iacute;ch m&ocirc;i trường l&agrave;m việc tại đ&acirc;y? M&ocirc;i trường l&agrave;m việc chuy&ecirc;n nghiệp, đồng nghiệp th&acirc;n thiện, team l&agrave;m việc thiện chiến, lu&ocirc;n hỗ trợ lẫn nhau. Sếp lu&ocirc;n lắng nghe, tạo điều kiện...</p>\r\n\r\n<ul>\r\n	<li>L&agrave;m việc trong m&ocirc;i trường trẻ trung, th&acirc;n thiện v&agrave; hướng đến việc ph&aacute;t triển con người;</li>\r\n	<li>Thưởng n&oacute;ng qu&yacute;, lương th&aacute;ng 13, một năm l&ecirc;n đến 17 th&aacute;ng lương;</li>\r\n	<li>Review lương 2 lần/năm;</li>\r\n</ul>\r\n', 1, 1, 1),
(8, 'gfdgdf', 'fsfdg', 'dfgdf', 'fdfgd', '1111-11-11', '2020-12-01', 0, '<p>gdfgdf</p>\r\n', 1, 2, 1),
(9, 'hgfhfg', 'hghgf', 'hgjjhg', 'gfdgd', '2009-03-22', '2020-10-07', 2, '<p>hfghfghfggfgdfgdfgd</p>\r\n', 1, 1, 1),
(17, 'Java Developer', 'KMS Technology', 'Đà Nẵng', 'Thỏa Thuận', '2020-12-15', '2020-12-01', 2, '<p><a href=\"https://kobiton.com/\">Kobiton</a>&nbsp;is the mobile experience platform trusted by leading organizations globally.&nbsp; Our best-in-class software platform helps drive improved revenue on the mobile channel by lowering app abandonment, improving quality and reducing time-to-market. Used by over 60,000 developers and testers worldwide, Kobiton is transforming the way companies deliver mobile apps through innovative applications of Artificial Intelligence, Real-Device Testing and the industry&rsquo;s first and only mobile scriptless automation solution. There&#39;s a reason the world&#39;s mobile elite choose Kobiton to deliver perfect mobile experiences for their users.</p>\r\n\r\n<p>Kobiton is founded and funded by KMS Technology, a global technology company with over 1,000 resources in Vietnam and the United States. KMS has an offshore product development business and also created two other software companies in the software testing space: QASymphony (sold to Insight Partners and merged with Tricentis($100M ARR)) and Katalon (over 750,000 global users). Kobiton has the advantage of operating as its own company while leveraging the infrastructure and the strength from KMS.</p>\r\n\r\n<h3>JOB DESCRIPTION</h3>\r\n\r\n<p><strong>Key responsibilities:</strong></p>\r\n\r\n<ul>\r\n	<li>Execute all testing activities to improve product quality, work closely with the team (developers, business analysis, customer service, operation, etc.) to deliver the product success</li>\r\n	<li>Address the test automation needs in a methodical, detail-oriented manner with the help of robust analytical skills and problem-solving capacity</li>\r\n	<li>Automate functional, regression and/or performance acceptance tests</li>\r\n	<li>Involve initiatives for supporting the product grow like competitor research, customer troubleshooting, etc.</li>\r\n	<li>Have complete responsibility to enhance end-to-end automated test coverage</li>\r\n	<li>Participate in sprint planning and work closely with the Scrum team to analyze requirements and provide necessary QA/test recommendations</li>\r\n</ul>\r\n\r\n<h3>QUALIFICATIONS</h3>\r\n\r\n<p><em>Knowledge and skills:</em></p>\r\n\r\n<ul>\r\n	<li>Strong domain knowledge on mobile/web/desktop app testing expertise</li>\r\n	<li>3+ years of experience in creating and running automated tests&nbsp; using testing frameworks like Appium, Selenium, Robotium, UiAutomator, XCTest, XCUiTest, etc.</li>\r\n	<li>Hand-on experience in using test tools like TestNG, Jasmine, Mocha, Nightwatch, etc.</li>\r\n	<li>Solid testing experiences (test strategy, test approach, test plan, test techniques included black box, risk-based, exploratory, Non-UI testing, etc.)</li>\r\n	<li>Good knowledge of the software development process, especially the software testing process</li>\r\n	<li>Methodical and detail-oriented, with solid analytical skills and problem-solving ability</li>\r\n	<li>Strong dedication to quality and a positive, collaborative attitude and approach to testing</li>\r\n	<li>Being a senior member of the engineering team, self-motivated; able to find opportunities for improvement and tackle them without external direction</li>\r\n</ul>\r\n\r\n<p><em>Education/training preferred:</em></p>\r\n\r\n<ul>\r\n	<li>Bachelor degree of Computer Science/ Software Engineering</li>\r\n</ul>\r\n\r\n<p><em>Nice to have:</em></p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Hand-on experience on JavaScript (NodeJS) and Java language&nbsp;</p>\r\n	</li>\r\n</ul>\r\n\r\n<h3>ADDITIONAL INFORMATION</h3>\r\n\r\n<p><strong>Perks you enjoy at KMS&nbsp;</strong></p>\r\n\r\n<ul>\r\n	<li>Working in one of the Best Places to Work in Vietnam</li>\r\n	<li>Building large-scale &amp; latest technology software products</li>\r\n	<li>Working &amp; Developing with Passionate &amp; Talented Team</li>\r\n	<li>Attractive Salary and Benefits</li>\r\n	<li>Flexible working time</li>\r\n	<li>Premium health care insurance for you and your loved ones</li>\r\n	<li>Company trip in every summer, big annual year-end party every year, team building, etc.</li>\r\n	<li>Fitness &amp; sports activities: football, tennis, table-tennis, badminton, yoga, swimming&hellip;</li>\r\n	<li>Joining community development activities: 1% Pledge, charity every quarter, blood donation, public seminars, career orientation talks,&hellip;</li>\r\n	<li>Free in-house entertainment facilities (football, ping pong, boxing, gym&hellip;), coffee (latte, cappuccino, espresso) and snack (instant noodles, cookies, candies&hellip;)</li>\r\n</ul>\r\n', 1, 2, 1),
(19, 'Dev 1', 'fpt', 'Đà Nẵng', '1000000', '2021-12-11', '2020-12-13', 2, '<p>fdsf alo</p>\r\n', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `job_apply`
--

DROP TABLE IF EXISTS `job_apply`;
CREATE TABLE IF NOT EXISTS `job_apply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `cv` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apply_on` datetime DEFAULT NULL,
  `check_status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKant3yxiy3mym63b4ofq0tyssn` (`member_id`),
  KEY `FKfqj0ch7p74m8g4ibl5oxsnvm0` (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `job_apply`
--

INSERT INTO `job_apply` (`id`, `job_id`, `member_id`, `cv`, `apply_on`, `check_status`) VALUES
(1, 1, 1, 'Nguyen-Van-Nghia-CV.pdf', '2020-10-05 16:41:49', 0),
(4, 7, 1, 'Nguyen-Van-Nghia-Junior-Java.pdf', '2020-10-06 15:54:14', 1),
(5, 7, 2, 'Nguyen-Van-Nghia-CV.pdf', '2020-10-07 06:14:51', 1),
(6, 7, 1, 'Bài thực hành 9.pdf', '2020-11-07 08:50:24', 1),
(8, 17, 27, 'Nguyen-Van-Nghia-TopCV.vn-220720.215300.pdf', '2020-12-27 13:42:03', 1),
(9, 17, 27, 'Nguyen-Van-Nghia-CV.pdf', '2020-12-12 07:41:10', 1);

-- --------------------------------------------------------

--
-- Table structure for table `kname`
--

DROP TABLE IF EXISTS `kname`;
CREATE TABLE IF NOT EXISTS `kname` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `k_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kname`
--

INSERT INTO `kname` (`id`, `k_name`) VALUES
(1, 'k23'),
(2, 'K22');

-- --------------------------------------------------------

--
-- Table structure for table `like_post`
--

DROP TABLE IF EXISTS `like_post`;
CREATE TABLE IF NOT EXISTS `like_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `time_like` datetime NOT NULL,
  `author_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKewf8t5o3mqdxavpi2eapo9wbm` (`author_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `like_post`
--

INSERT INTO `like_post` (`id`, `post_id`, `time_like`, `author_id`) VALUES
(12, 18, '2020-11-02 09:27:03', 2),
(33, 17, '2020-11-02 13:55:03', 1),
(34, 16, '2020-11-02 14:05:53', 1),
(38, 19, '2020-11-04 12:51:26', 2),
(39, 19, '2020-11-05 12:14:12', 1),
(40, 18, '2020-11-07 08:51:13', 1),
(42, 17, '2020-11-16 12:55:43', 27),
(44, 28, '2020-12-05 02:59:31', 1);

-- --------------------------------------------------------

--
-- Table structure for table `major`
--

DROP TABLE IF EXISTS `major`;
CREATE TABLE IF NOT EXISTS `major` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `major_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `major_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `faculty_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKrbpflj1p41y81s9d2jf5ix2jv` (`faculty_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `major`
--

INSERT INTO `major` (`id`, `major_code`, `major_name`, `faculty_id`) VALUES
(1, 'CNT', 'Công nghệ phần mềm', 1),
(2, 'ANM', 'An Ninh Mạng', 1),
(3, 'HTTT', 'Hệ Thông Thông Tin Quản Lý', 1);

-- --------------------------------------------------------

--
-- Table structure for table `major_file`
--

DROP TABLE IF EXISTS `major_file`;
CREATE TABLE IF NOT EXISTS `major_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jobId` int(11) DEFAULT NULL,
  `authorId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKoglmq8fkpvi5x65a26ul3k495` (`jobId`),
  KEY `FKlvgxyb675m5pvo7mkbmf6gp01` (`authorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
CREATE TABLE IF NOT EXISTS `member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `student_id` bigint(20) DEFAULT NULL,
  `dtuMail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dat_of_birth` date DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `marital_status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hometown` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `province` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_now` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `decription` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enable` int(11) NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trainning_system_id` int(11) DEFAULT NULL,
  `year_greduate` int(11) DEFAULT NULL,
  `year_participate` int(11) DEFAULT NULL,
  `major_id` int(11) DEFAULT NULL,
  `work_at` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position_job` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salary` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_start_job` date DEFAULT NULL,
  `faculty_id` int(11) DEFAULT NULL,
  `kname_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `isPresent` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKeqnko95dqqreocnsc3i7tqyqj` (`major_id`),
  KEY `FK_t_member_trainning_system` (`trainning_system_id`),
  KEY `FK7tt865asjdplsv89ygeodtnum` (`faculty_id`),
  KEY `FKfhl0jwf998q7xruieneeoybvs` (`kname_id`),
  KEY `FK_t_member_role` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`id`, `first_name`, `last_name`, `student_id`, `dtuMail`, `password`, `email`, `dat_of_birth`, `gender`, `marital_status`, `phone`, `hometown`, `province`, `country`, `address_now`, `avatar`, `decription`, `enable`, `token`, `trainning_system_id`, `year_greduate`, `year_participate`, `major_id`, `work_at`, `company`, `position_job`, `salary`, `time_start_job`, `faculty_id`, `kname_id`, `role_id`, `isPresent`) VALUES
(1, 'fds', 'fd', NULL, 'admin', '$2a$10$zKpbisrzzcSVjl/B8he3fejkVDVpVFCMmBHBv7i.cZMGcvBiWEoEO', 'fdsfds@gmail.com', '2020-10-06', 'Nữ', '1', '0968997331', 'fd', NULL, NULL, 'dkjfgh', 'nghia.jpg', 'sdfdf', 1, 'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJmZHNmZHNAZ21haWwuY29tIiwiZXhwIjoxNjA4Mzc4ODQyLCJpYXQiOjE2MDgzNjA4NDJ9.TGi9CFQBlfdbiTQqcvkgvVFEiPZj0gucOD3UTRIIidP5z8t5gkfM8mJ-s031glwQIfS6tD2c7iQ91xVra887SA', NULL, 2021, 2017, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, NULL),
(2, 'Nguyễn Văn', 'Nghĩa', 0, 'nghia', '$2a$10$zKpbisrzzcSVjl/B8he3fejkVDVpVFCMmBHBv7i.cZMGcvBiWEoEO', 'nghianguyen168197@gmail.com', '2020-10-16', 'male', '1', '0968997331', 'Quảng Bình', '', '', 'dfd', 'nghia.jpg', 'fdfds', 1, 'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJuZ2hpYW5ndXllbjE2ODE5N0BnbWFpbC5jb20iLCJleHAiOjE2MDY1MDE5MzMsImlhdCI6MTYwNjQ4MzkzM30.PVdQcHpvVo0Q-szgHHbECGzoOQ1nCX4wURp4HjJYbjMcNeB3PCf4374IplpGupaygGwI9tadk4uji8gt1bY1Pw', 1, 2021, 2017, 1, 'Đn', NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL),
(9, 'le', 'Thanh Ha', 0, 'lethanhha4@duytan.edu.vn', '$2a$10$79bv4SawHDDo/tjClwxzweTJT9BGyuPv3dKv4mlsLCJIStGNEqTGS', 'lethanhha876@gmail.com', '1999-11-11', 'nam', NULL, '84332111555', NULL, 'Kon Tum', 'Viet Nam', 'Đà nẵng', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 5, NULL),
(10, 'Mai', 'Văn Mốt', 0, 'lethanhha6@duytan.edu.vn', '$2a$10$u29UQ3HJj2Li9LFk3gqaVetoIySFfaaMk2wrGkN2CBeW2I7glrSwG', 'lethanhha6@gmail.com', '1999-11-11', 'nữ', NULL, '84332111555', NULL, 'Đà Nẵng', 'Viet Nam', 'Huế', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 5, NULL),
(11, 'Nguyễn', 'Văn Nghĩa', 0, 'nguyenvannghia7@duytan.edu.vn', '$2a$10$3C7QmXfhbIpNrH4IUqjvy.LdempwxRtu6JUqVSi5feUyozi904Ri.', 'lethanhha7@gmail.com', '1997-08-16', 'nam', NULL, '84332111555', NULL, 'Huế', 'Viet Nam', 'Cần Thơ', NULL, NULL, 1, 'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJsZXRoYW5oaGE3QGdtYWlsLmNvbSIsImV4cCI6MTYwNDg2NzIxNCwiaWF0IjoxNjA0ODQ5MjE0fQ.7_nDF8CLS2zJ-SXI-D2uDFme2Uj5bpSILCeqaGyQPUmUWcayZbKW-A_tcZjpjWGSt306GS3D5rIermMlc-cvBg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 5, NULL),
(12, 'le', 'Thanh Ha', 0, 'lethanhha4@duytan.edu.vn', '$2a$10$hiF8zX6MHpByHm.aI.nQo.0o9YgRuNiI51YKl39FpvIxaDWLVGf/.', 'lethanhha876@gmail.com', '1999-11-11', 'nam', NULL, '84332111555', NULL, 'Kon Tum', 'Viet Nam', 'Đà nẵng', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 5, NULL),
(13, 'Mai', 'Văn Mốt', 0, 'lethanhha6@duytan.edu.vn', '$2a$10$m8cJFMdPV2Wao0z2bVN3ouQ6m4n.aHFikwXtZRP0SWJtYbeZ3wkbu', 'lethanhha6@gmail.com', '1999-11-11', 'nữ', NULL, '84332111555', NULL, 'Đà Nẵng', 'Viet Nam', 'Huế', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 5, NULL),
(14, 'Nguyễn', 'Văn Nghĩa', 0, 'lethanhha7@duytan.edu.vn', '$2a$10$3XcEEEv2R7S1QrwtJpe0mOZ7cg5/9xo75fziBj.DwNEo5GD6kTb32', 'lethanhha7@gmail.com', '1998-12-12', 'nam', NULL, '84332111555', NULL, 'Huế', 'Viet Nam', 'Cần Thơ', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 5, NULL),
(15, 'le', 'Thanh Ha', 0, 'lethanhha4@duytan.edu.vn', '$2a$10$Q2S8rYTXSxwoVmkB5VnIKukcAo9IvRz0UTCIeNJp/yme/mT3arCfC', 'lethanhha876@gmail.com', '1999-11-11', 'nam', NULL, '84332111555', NULL, 'Kon Tum', 'Viet Nam', 'Đà nẵng', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 5, NULL),
(16, 'Mai', 'Văn Mốt', 0, 'lethanhha6@duytan.edu.vn', '$2a$10$.nXI9.ZPA2Lfn6rFCBwVOugaO07j/j6MPhyoczYVVg1UwJ5LebX1C', 'lethanhha6@gmail.com', '1999-11-11', 'nữ', NULL, '84332111555', NULL, 'Đà Nẵng', 'Viet Nam', 'Huế', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 5, NULL),
(17, 'Nguyễn', 'Văn Nghĩa', 0, 'lethanhha7@duytan.edu.vn', '$2a$10$qXLd8v7TwsD7sb.Rheg4MuHGqSi4q369xmv0vdZmQipZaIzRtDmXq', 'lethanhha7@gmail.com', '1998-12-12', 'nam', NULL, '84332111555', NULL, 'Huế', 'Viet Nam', 'Cần Thơ', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 5, NULL),
(18, 'le', 'Thanh Ha', 0, 'lethanhha4@duytan.edu.vn', '$2a$10$aLnxOIOXyPo2B/I0vKa8pOJAkeZNsTsdtTE9.FGlcRORNIaM0eIk.', 'lethanhha876@gmail.com', '1999-11-11', 'nam', NULL, '84332111555', NULL, 'Kon Tum', 'Viet Nam', 'Đà nẵng', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 5, NULL),
(19, 'Mai', 'Văn Mốt', 0, 'lethanhha6@duytan.edu.vn', '$2a$10$Gtz.DtR00JdzkJsH7D21H.KlqmaxPc8C1kxVJCTNaqyNZDZEmH3D.', 'lethanhha6@gmail.com', '1999-11-11', 'nữ', NULL, '84332111555', NULL, 'Đà Nẵng', 'Viet Nam', 'Huế', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 5, NULL),
(20, 'Nguyễn', 'Văn Nghĩa', 0, 'lethanhha7@duytan.edu.vn', '$2a$10$VPCjpKxttP8J4YEbvmlOYOchTigImza0QMG3C7qY71LH6Di3Dcn3i', 'lethanhha7@gmail.com', '1998-12-12', 'nam', NULL, '84332111555', NULL, 'Huế', 'Viet Nam', 'Cần Thơ', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 5, NULL),
(21, 'le', 'Thanh Ha', 0, 'lethanhha4@duytan.edu.vn', '$2a$10$lDta1e51c8coG/gP32Vxeufb6uXsHJpmylQGxnbzM8E6zYzTOFN06', 'lethanhha876@gmail.com', '1999-11-11', 'nam', NULL, '84332111555', NULL, 'Kon Tum', 'Viet Nam', 'Đà nẵng', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 5, NULL),
(22, 'Mai', 'Văn Mốt', 0, 'lethanhha6@duytan.edu.vn', '$2a$10$r8sZHX4gEnwY81fR65LVYO62q6GlPHRN4JppCkBVH433me73I4qVG', 'lethanhha6@gmail.com', '1999-11-11', 'nữ', NULL, '84332111555', NULL, 'Đà Nẵng', 'Viet Nam', 'Huế', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 5, NULL),
(23, 'Nguyễn', 'Văn Nghĩa', 0, 'lethanhha7@duytan.edu.vn', '$2a$10$n1JMTBP92QyYc6YwgouYF.PnrwW2SaXsV8MsDRFyvth7rLF6X6YN2', 'lethanhha7@gmail.com', '1998-12-12', 'nam', NULL, '84332111555', NULL, 'Huế', 'Viet Nam', 'Cần Thơ', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 5, NULL),
(24, 'fds', 'fd', 0, 'Manager', '$2a$10$zKpbisrzzcSVjl/B8he3fejkVDVpVFCMmBHBv7i.cZMGcvBiWEoEO', 'fdsfds', '2020-10-06', 'fds', '1', '0968997331', 'fd', '', '', 'dkjfgh', 'nghia.jpg', 'sdfdf', 1, 'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJmZHNmZHMiLCJleHAiOjE2MDY1MDI2MzUsImlhdCI6MTYwNjQ4NDYzNX0.NhwLR_b9S0OXtzgOrPJBuspeClrjLr48rNMY7MqQu5FPjsw641jYV0b2IAOrOuKfRlHPwQEDRwrVJBABtjRo6g', 1, 2021, 2017, 1, 'sb', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL),
(25, 'fds', 'fd', 0, 'teacher', '$2a$10$zKpbisrzzcSVjl/B8he3fejkVDVpVFCMmBHBv7i.cZMGcvBiWEoEO', 'fdsfds', '2020-10-06', 'fds', '1', '0968997331', 'fd', '', '', 'dkjfgh', 'nghia.jpg', 'sdfdf', 1, 'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJmZHNmZHMiLCJleHAiOjE2MDQ5MTQ4ODcsImlhdCI6MTYwNDg5Njg4N30.mSrKFlpb_XxQ0IR7CxKn4PAOGtpjfRCFe-Bejwg4QawfUEsyrk6NIEXo7JcrbIKwgRV9sxHtnkA3MiEtdSencg', 1, 2021, 2017, 1, 'sb', NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL),
(26, 'fds', 'fd', 0, 'alumni', '$2a$10$zKpbisrzzcSVjl/B8he3fejkVDVpVFCMmBHBv7i.cZMGcvBiWEoEO', 'fdsfds', '2020-10-06', 'fds', '1', '0968997331', 'fd', '', '', 'dkjfgh', 'nghia.jpg', 'sdfdf', 1, 'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJmZHNmZHMiLCJleHAiOjE2MDcyMzY3MDQsImlhdCI6MTYwNzIxODcwNH0.rSesdEDvz-iagnU5Jri7h29Ia84ixiZ_-omspP2mByoP3g_4gqDUzs1H1dgbUfkvGDOf8R4B5Ne-jHdm94NTQA', 1, 2021, 2017, 1, 'sb', NULL, NULL, NULL, NULL, 1, 1, 4, NULL),
(27, 'fds', 'fd', 0, 'student', '$2a$10$zKpbisrzzcSVjl/B8he3fejkVDVpVFCMmBHBv7i.cZMGcvBiWEoEO', 'fdsfds', '2020-10-06', 'fds', '1', '0968997331', 'fd', '', '', 'dkjfgh', 'nghia.jpg', 'sdfdf', 1, 'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJmZHNmZHMiLCJleHAiOjE2MDc3NzY4NDIsImlhdCI6MTYwNzc1ODg0Mn0.fjubLUnWIXEZX5Ca5R6SxQw3YWNPTHpBZGcMIdnaAYJiQADuthJJZ5AI_oCcxVYwmuhSOdrQJRrw5-TcIgKGgQ', 1, 2021, 2017, 1, 'sb', NULL, NULL, NULL, NULL, 1, 1, 5, NULL),
(91, 'le', 'Thanh Ha', 100000001, 'lethanhha4@duytan.edu.vn', '$2a$10$10ykAa.8/Vd.1Fj9iaxJj.YdAj82hZgeY7KPLyOa5VoIYW3SiIHK.', 'lethanhha876@gmail.com', '1999-11-11', 'nam', NULL, '2021', NULL, 'Kon Tum', 'Việt Nam', 'Đà nẵng', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 2, NULL),
(92, 'Mai', 'Văn Mốt', 100000002, 'lethanhha6@duytan.edu.vn', '$2a$10$nWlvnK7cCIUnSSh7EOHuNuTNJZ5XsH4AcXlkd9LTuZ.Yw4ayQ8GLa', 'lethanhha6@gmail.com', '1999-11-11', 'nữ', NULL, '2019', NULL, 'Đà Nẵng', 'Việt Nam', 'Huế', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 2, NULL),
(93, 'Nguyễn', 'Văn Nghĩa', 100000003, 'lethanhha7@duytan.edu.vn', '$2a$10$G.34RvaibNuOAx6DmcnmH.vsolJUDNj3aSxrV/.CVuGfopKyvPgv6', 'lethanhha7@gmail.com', '1998-12-12', 'nam', NULL, '2021', NULL, 'Huế', 'Việt Nam', 'Cần Thơ', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 2, NULL),
(94, 'le', 'Thanh Ha', 100000004, 'lethanhha4@duytan.edu.vn', '$2a$10$C.4ctLdHoc.rox5aFDxNl.Xb/yhDc7T2FO.P.Edl4oQ5gOHgfWhs.', 'lethanhha876@gmail.com', '1999-11-11', 'nam', NULL, '2021', NULL, 'Kon Tum', 'Việt Nam', 'Đà nẵng', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 2, NULL),
(95, 'Mai', 'Văn Mốt', 100000005, 'lethanhha6@duytan.edu.vn', '$2a$10$KCdPV.JWNzEyjLqmI5oNTe3b.2E/1eLdNahc4Mh9P6PdP6SQf/JE2', 'lethanhha6@gmail.com', '1999-11-11', 'nữ', NULL, '2019', NULL, 'Đà Nẵng', 'Việt Nam', 'Huế', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 2, NULL),
(96, 'Nguyễn', 'Văn Nghĩa', 100000006, 'lethanhha7@duytan.edu.vn', '$2a$10$XgUj.yZ4Qfxs5UJisG39GOJcgXDAnLWCPzXoEbJj10OH4Nbaj8kWW', 'lethanhha7@gmail.com', '1998-12-12', 'nam', NULL, '2021', NULL, 'Huế', 'Việt Nam', 'Cần Thơ', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 2, NULL),
(97, 'le', 'Thanh Ha', 100000007, 'lethanhha4@duytan.edu.vn', '$2a$10$QkhSxLJitrvufhHMfNcoeuQyMGn1DN0kFvCxLPgj1gDSL.8jLQGKS', 'lethanhha876@gmail.com', '1999-11-11', 'nam', NULL, '2021', NULL, 'Kon Tum', 'Việt Nam', 'Đà nẵng', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 2, NULL),
(98, 'Mai', 'Văn Mốt', 100000008, 'lethanhha6@duytan.edu.vn', '$2a$10$Lxv.ZIDEOUnrVG3YT/EWOuBOwVU.Utye2gyyJWzlErEPAwrASaIny', 'lethanhha6@gmail.com', '1999-11-11', 'nữ', NULL, '2019', NULL, 'Đà Nẵng', 'Việt Nam', 'Huế', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 2, NULL),
(99, 'Nguyễn', 'Văn Nghĩa', 100000009, 'lethanhha7@duytan.edu.vn', '$2a$10$PzUrwbduCJbeLS.EvrlQfOlO/rBMpxzAXPljSZ/.2WKiWOQrTjdT6', 'lethanhha7@gmail.com', '1998-12-12', 'nam', NULL, '2021', NULL, 'Huế', 'Việt Nam', 'Cần Thơ', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 2, NULL),
(100, 'le', 'Thanh Ha', 100000010, 'lethanhha4@duytan.edu.vn', '$2a$10$ffuAMeSrnhzTGRGQR2QHIOAAHz9daMlBtADf2CqwvlX6iOAOVOJ7G', 'lethanhha876@gmail.com', '1999-11-11', 'nam', NULL, '2021', NULL, 'Kon Tum', 'Việt Nam', 'Đà nẵng', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 2, NULL),
(101, 'Mai', 'Văn Mốt', 100000011, 'lethanhha6@duytan.edu.vn', '$2a$10$chqKaiPrLJ.dr07lvHUVUO2KOLpFAIRn9Nzqw8orTZZdhGh0tpGOK', 'lethanhha6@gmail.com', '1999-11-11', 'nữ', NULL, '2019', NULL, 'Đà Nẵng', 'Việt Nam', 'Huế', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 2, NULL),
(102, 'Nguyễn', 'Văn Nghĩa', 100000012, 'lethanhha7@duytan.edu.vn', '$2a$10$xWYPZQw.9WTzTv/PxN7TSesbFzexCZYVjikY.ZcDoe9MK.hnJJ7tO', 'lethanhha7@gmail.com', '1998-12-12', 'nam', NULL, '2021', NULL, 'Huế', 'Việt Nam', 'Cần Thơ', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 2, NULL),
(103, 'le', 'Thanh Ha', 100000013, 'lethanhha4@duytan.edu.vn', '$2a$10$nsRuKduc8vudXJQY9p2QUeczzXPPRr.mvacspHfMkg9/P0EQCI4te', 'lethanhha876@gmail.com', '1999-11-11', 'nam', NULL, '2021', NULL, 'Kon Tum', 'Việt Nam', 'Đà nẵng', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 2, NULL),
(104, 'Mai', 'Văn Mốt', 100000014, 'lethanhha6@duytan.edu.vn', '$2a$10$lK/eGLu6L7Iydk9lbvb/qe1Qal2ItGuBQ46DfVDcoRzHrlcaOBms6', 'lethanhha6@gmail.com', '1999-11-11', 'nữ', NULL, '2019', NULL, 'Đà Nẵng', 'Việt Nam', 'Huế', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 2, NULL),
(105, 'Nguyễn', 'Văn Nghĩa', 100000015, 'lethanhha7@duytan.edu.vn', '$2a$10$rr3DKIJarhwRHSPLrV8FSeB3rg72Hs1iHxcjTgvPbQ2eVOR6HG8.i', 'lethanhha7@gmail.com', '1998-12-12', 'nam', NULL, '2021', NULL, 'Huế', 'Việt Nam', 'Cần Thơ', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 2, NULL),
(106, 'le', 'Thanh Ha', 100000016, 'lethanhha4@duytan.edu.vn', '$2a$10$NTJnyhI5sdl1Op8Mt7tn1OkuxMxai7axZZYxoU8gcG0JRSn7JHsOy', 'lethanhha876@gmail.com', '1999-11-11', 'nam', NULL, '2021', NULL, 'Kon Tum', 'Việt Nam', 'Đà nẵng', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 2, NULL),
(107, 'Mai', 'Văn Mốt', 100000017, 'lethanhha6@duytan.edu.vn', '$2a$10$HV3tQKdwzjpV1vwvpbWD9OvQm2b1eVGZ9kpcmAG7FYX0VOnWPq00C', 'lethanhha6@gmail.com', '1999-11-11', 'nữ', NULL, '2019', NULL, 'Đà Nẵng', 'Việt Nam', 'Huế', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 2, NULL),
(108, 'Nguyễn', 'Văn Nghĩa', 100000018, 'lethanhha7@duytan.edu.vn', '$2a$10$9IqGg3rpnYhlBe.nckg8Ie.FTH2TQR/chZXzPr.nkUG9VSP6hwuV6', 'lethanhha7@gmail.com', '1998-12-12', 'nam', NULL, '2021', NULL, 'Huế', 'Việt Nam', 'Cần Thơ', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 2, NULL),
(109, 'le', 'Thanh Ha', 100000019, 'lethanhha4@duytan.edu.vn', '$2a$10$I/udmDUuyZqZ4Y4zS1bbDe7K7Yn7Lod6h9UaPG3ioT8ckM6mSUql6', 'lethanhha876@gmail.com', '1999-11-11', 'nam', NULL, '2021', NULL, 'Kon Tum', 'Việt Nam', 'Đà nẵng', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 2, NULL),
(110, 'Mai', 'Văn Mốt', 100000020, 'lethanhha6@duytan.edu.vn', '$2a$10$3tk644ghdV7cAjHL11TTPuYSaWWwRIppWuQr2uRQZSx/mVn.cSen.', 'lethanhha6@gmail.com', '1999-11-11', 'nữ', NULL, '2019', NULL, 'Đà Nẵng', 'Việt Nam', 'Huế', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 2, NULL),
(111, 'Nguyễn', 'Văn Nghĩa', 100000021, 'lethanhha7@duytan.edu.vn', '$2a$10$ueIiLnGGaYLx3Ot0fV2XJ.A2UNg1g4p7SyWHSBO8/Ap01PFRC5e7i', 'lethanhha7@gmail.com', '1998-12-12', 'nam', NULL, '2021', NULL, 'Huế', 'Việt Nam', 'Cần Thơ', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 2, NULL),
(114, 'nghia', 'nguyen', 2498374, 'nghia@gmail.com', NULL, 'nghianguyen168197@gmail.com', '1997-11-11', 'Nam', NULL, '96899331', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 4, NULL),
(115, 'nghia', 'nguyen', 232112740, '', '$2a$10$/PnUiVXlSaOIF9YvdLz8heT6r9FOejs0ZPwPcYtHVEhbdMYV2LBdi!', 'nghianguyen168197@gmail.com', '1997-08-16', 'Nam', NULL, '0968997331', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 2, NULL),
(116, 'nghia', 'nguyen', 2321127402, 'nghianguyen168197@gmail.com', '$2a$10$RzbfyN7md3KpDNj3kiuCVeGKjv14RfPFuQX1sK0Xx7fqRPCNUlT5S!', 'nghianguyen168197@gmail.com', '1997-08-16', 'Nam', NULL, '0968997331', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 2, NULL),
(117, 'nghia', 'nguyen', NULL, 'nghia111@gmail.com', '$2a$10$AGDuXjkJG44VvWKBG1q35OCCEuEM8DY3vnxWp6VnXSE8hnl88Hhy.', 'nghianguyen168197@gmail.com', '1990-11-11', 'Nam', NULL, '96899331', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 3, NULL),
(118, 'nghia', 'nguyen', 249837423, 'nghia111@gmail.com', NULL, 'nghianguyen168197@gmail.com', '1999-11-11', 'Nam', NULL, '0968997331', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, 1, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 4, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `member_group`
--

DROP TABLE IF EXISTS `member_group`;
CREATE TABLE IF NOT EXISTS `member_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK44ccmfb1t5udx1tph77bj6u27` (`group_id`),
  KEY `FKi9080rfwtrt5jlvim4mcg4rl4` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `member_group`
--

INSERT INTO `member_group` (`id`, `group_id`, `member_id`) VALUES
(1, 2, 27),
(2, 2, 26),
(3, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `member_role`
--

DROP TABLE IF EXISTS `member_role`;
CREATE TABLE IF NOT EXISTS `member_role` (
  `id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`member_id`,`role_id`),
  KEY `FKdiix07v86r3ntrbs3l02qr7y0` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `member_role`
--

INSERT INTO `member_role` (`id`, `member_id`, `role_id`) VALUES
(2, 2, 1),
(3, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `network`
--

DROP TABLE IF EXISTS `network`;
CREATE TABLE IF NOT EXISTS `network` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `friend_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKnpb5plsbf7m7t1u37m0sjbxf8` (`friend_id`),
  KEY `FKb98541bsf5ep70u48dba8k9xv` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `network`
--

INSERT INTO `network` (`id`, `friend_id`, `member_id`, `status`) VALUES
(14, 1, 2, 1),
(15, 1, 2, 1),
(16, 1, 2, 1),
(17, 2, 2, 0),
(18, 2, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
CREATE TABLE IF NOT EXISTS `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `news_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `picture` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `decription` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `enable` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `news_name`, `picture`, `decription`, `detail`, `createAt`, `enable`) VALUES
(6, 'Đại học Duy Tân Làm việc với Tổng Lãnh sự quán Hàn Quốc', '2G6A9648-82.jpg', '<p>Chiều ng&agrave;y 27/10/2020,&nbsp;<strong>Đại học Duy T&acirc;n&nbsp;</strong>c&oacute;&nbsp;<strong>buổi l&agrave;m việc</strong>&nbsp;với&nbsp;<strong>Tổng L&atilde;nh sự qu&aacute;n H&agrave;n Quốc</strong>&nbsp;tại cơ sở số 3 Quang Trung, Tp. Đ&agrave; Nẵng. TS. L&ecirc; Nguy&ecirc;n Bảo - Hiệu trưởng Đại học Duy T&acirc;n c&ugrave;ng TS. L&ecirc; Thị Ngọc Cầm - Trưởng Khoa Tiếng H&agrave;n, trường Đại học Ngoại ngữ, c&aacute;c chuy&ecirc;n vi&ecirc;n thuộc ph&ograve;ng Quan hệ Quốc tế đ&atilde; tiếp đ&oacute;n v&agrave; trao đổi c&aacute;c vấn đề về hợp t&aacute;c v&agrave; giao lưu văn h&oacute;a với &ocirc;ng Ahn Min Sik - Tổng L&atilde;nh sự H&agrave;n Quốc tại Tp. Đ&agrave; Nẵng, b&agrave; Choi Kyeong Joo - T&ugrave;y vi&ecirc;n ngoại giao, &ocirc;ng Kim Dae Eun - Nh&acirc;n vi&ecirc;n L&atilde;nh sự qu&aacute;n.</p>\r\n', '<p>Chiều ng&agrave;y 27/10/2020,&nbsp;<strong>Đại học Duy T&acirc;n&nbsp;</strong>c&oacute;&nbsp;<strong>buổi l&agrave;m việc</strong>&nbsp;với&nbsp;<strong>Tổng L&atilde;nh sự qu&aacute;n H&agrave;n Quốc</strong>&nbsp;tại cơ sở số 3 Quang Trung, Tp. Đ&agrave; Nẵng. TS. L&ecirc; Nguy&ecirc;n Bảo - Hiệu trưởng Đại học Duy T&acirc;n c&ugrave;ng TS. L&ecirc; Thị Ngọc Cầm - Trưởng Khoa Tiếng H&agrave;n, trường Đại học Ngoại ngữ, c&aacute;c chuy&ecirc;n vi&ecirc;n thuộc ph&ograve;ng Quan hệ Quốc tế đ&atilde; tiếp đ&oacute;n v&agrave; trao đổi c&aacute;c vấn đề về hợp t&aacute;c v&agrave; giao lưu văn h&oacute;a với &ocirc;ng Ahn Min Sik - Tổng L&atilde;nh sự H&agrave;n Quốc tại Tp. Đ&agrave; Nẵng, b&agrave; Choi Kyeong Joo - T&ugrave;y vi&ecirc;n ngoại giao, &ocirc;ng Kim Dae Eun - Nh&acirc;n vi&ecirc;n L&atilde;nh sự qu&aacute;n.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"Đại học Duy Tân Làm việc với Tổng Lãnh sự quán Hàn Quốc\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/2G6A9629c-3.jpg\" /></p>\r\n\r\n<p><em>Đại học Duy T&acirc;n trao đổi, l&agrave;m việc với Tổng L&atilde;nh sự qu&aacute;n H&agrave;n Quốc</em></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Tại&nbsp;<strong>buổi l&agrave;m việc</strong>, Đại học Duy T&acirc;n đ&atilde; tr&igrave;nh chiếu clip giới thiệu tổng quan về trường, c&aacute;c k&yacute; kết hợp t&aacute;c với doanh nghiệp lớn hay trường đại học quốc tế h&agrave;ng đầu, những điểm s&aacute;ng trong nghi&ecirc;n cứu khoa học, hệ thống cơ sở vật chất hiện đại, đội ngũ nh&acirc;n sự c&oacute; chuy&ecirc;n m&ocirc;n cao c&ugrave;ng nhiều giải thưởng lớn của sinh vi&ecirc;n Duy T&acirc;n tại c&aacute;c cuộc thi trong nước v&agrave; quốc tế. Tại đ&acirc;y, &ocirc;ng Ahn Min Sik đ&atilde; gửi lời ch&uacute;c mừng đến Đại học Duy T&acirc;n về những th&agrave;nh tựu m&agrave; nh&agrave; trường đ&atilde; đạt được trong thời gian vừa qua, đặc biệt l&agrave; việc th&agrave;nh lập Khoa Tiếng H&agrave;n. B&ecirc;n cạnh đ&oacute;, &ocirc;ng c&ograve;n b&agrave;y tỏ ấn tượng về văn h&oacute;a, tinh thần d&acirc;n tộc Việt Nam v&agrave; mong muốn được giới thiệu s&acirc;u rộng văn h&oacute;a H&agrave;n Quốc đến người d&acirc;n Việt Nam th&ocirc;ng qua c&aacute;c hoạt động&nbsp;<strong>giao lưu văn h&oacute;a Việt - H&agrave;n</strong>.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&Ocirc;ng Ahn Min Sik cho biết, trước đ&acirc;y, H&agrave;n Quốc thực sự quan t&acirc;m v&agrave; triển khai nhiều dự &aacute;n đầu tư, kinh doanh tại miền Bắc Việt Nam bởi đa số c&aacute;c nh&agrave; m&aacute;y thường tập trung ở c&aacute;c tỉnh trung du miền Bắc. Tuy nhi&ecirc;n, trong những năm gần đ&acirc;y, lượng kh&aacute;ch du lịch v&agrave; doanh nghiệp H&agrave;n Quốc đến tham quan, l&agrave;m việc v&agrave; mở rộng đầu tư tại miền Trung Việt Nam đang tăng mạnh. V&igrave; vậy, Ch&iacute;nh phủ H&agrave;n Quốc đ&atilde; lựa chọn Th&agrave;nh phố Đ&agrave; Nẵng để mở văn ph&ograve;ng Tổng L&atilde;nh sự qu&aacute;n nhằm tạo cầu nối li&ecirc;n kết giữa Việt Nam v&agrave; H&agrave;n Quốc trong lĩnh vực hợp t&aacute;c doanh nghiệp v&agrave; ph&aacute;t triển văn h&oacute;a.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"Đại học Duy Tân Làm việc với Tổng Lãnh sự quán Hàn Quốc\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/2G6A9648-49.jpg\" /></p>\r\n\r\n<p><em>&Ocirc;ng Ahn Min Sik - Tổng L&atilde;nh sự H&agrave;n Quốc trao tặng qu&agrave; kỷ niệm cho&nbsp;TS. L&ecirc; Nguy&ecirc;n Bảo&nbsp;</em></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Trong<strong>&nbsp;buổi l&agrave;m việc</strong>, TS. L&ecirc; Nguy&ecirc;n Bảo - Hiệu trưởng Đại học Duy T&acirc;n đ&atilde; giới thiệu một số ng&agrave;nh trọng điểm m&agrave; nh&agrave; trường tập trung n&acirc;ng cao chất lượng đ&agrave;o tạo bao gồm:&nbsp;<strong>Du lịch</strong>, Khoa học Sức khỏe v&agrave;<strong>&nbsp;Điện-Điện Tử</strong>. Trong đ&oacute;, ng&agrave;nh C&ocirc;ng nghệ Kỹ thuật Điện-Điện tử được c&ocirc;ng nhận đạt chuẩn kiểm định quốc tế ABET của Mỹ v&agrave;o cuối th&aacute;ng 8.2020 vừa qua. Đồng thời, Đại học Duy T&acirc;n c&ograve;n hợp t&aacute;c với Đại học Purdue đ&agrave;o tạo Chương tr&igrave;nh Ti&ecirc;n tiến&nbsp;<strong>Điện-Điện tử</strong>, Cơ Điện tử. Đối với lĩnh vực&nbsp;<strong>Du lịch</strong>, nh&agrave; trường đ&atilde; th&agrave;nh lập Viện Đ&agrave;o tạo &amp; Nghi&ecirc;n cứu Du lịch đồng thời x&acirc;y dựng hệ thống c&aacute;c ph&ograve;ng thực h&agrave;nh hiện đại để sinh vi&ecirc;n học tập. Trong lĩnh vực Khoa học Sức khỏe, Đại học Duy T&acirc;n đang hợp t&aacute;c với Đại học Pittsburgh - trường đại học xếp thứ 5 trong Top 15 trường đào tạo Y khoa n&ocirc;̉i ti&ecirc;́ng của Hoa Kỳ để n&acirc;ng cao chất lượng đ&agrave;o tạo v&agrave; tập huấn n&acirc;ng cao tr&igrave;nh độ chuy&ecirc;n m&ocirc;n cho đội ngũ giảng vi&ecirc;n. TS. L&ecirc; Nguy&ecirc;n Bảo - Hiệu trưởng&nbsp;<strong>Đại học Duy T&acirc;n</strong>&nbsp;thay mặt nh&agrave; trường b&agrave;y tỏ mong muốn sẽ được mở rộng hợp t&aacute;c với&nbsp;<strong>Tổng L&atilde;nh sự qu&aacute;n H&agrave;n Quốc</strong>&nbsp;tại Đ&agrave; Nẵng trong thời gian tới.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Ngo&agrave;i ra, TS. L&ecirc; Thị Ngọc Cầm đ&atilde; giới thiệu về nguồn nh&acirc;n lực H&agrave;n Quốc đang đảm nhận c&aacute;c vị tr&iacute; chủ chốt tại Đại học Duy T&acirc;n như: TS. Lim Sang Taek - Viện Trưởng Viện Đ&agrave;o tạo &amp; Nghi&ecirc;n cứu Du Lịch; TS. Lee Yoon Sun - Viện Trưởng Viện Văn h&oacute;a D&acirc;n gian Truyền thống Việt-H&agrave;n; TS. Chun Kyung Soo - Viện trưởng Viện Ng&ocirc;n ngữ. TS. L&ecirc; Thị Ngọc Cầm nhấn mạnh, b&ecirc;n cạnh việc đ&agrave;o tạo ng&ocirc;n ngữ H&agrave;n quốc,&nbsp;<strong>Đại học Duy T&acirc;n</strong>&nbsp;lu&ocirc;n ch&uacute; trọng c&aacute;c hoạt động hợp t&aacute;c v&agrave; giao lưu văn h&oacute;a Việt-H&agrave;n nhằm mở ra nhiều cơ hội việc l&agrave;m v&agrave; t&igrave;m hiểu văn h&oacute;a, con người xứ sở &ldquo;kim chi&rdquo; cho sinh vi&ecirc;n. Buổi l&agrave;m việc kết th&uacute;c với nhiều kỳ vọng về sự hợp t&aacute;c s&acirc;u rộng giữa Đại học Duy T&acirc;n v&agrave; Tổng L&atilde;nh sự qu&aacute;n H&agrave;n Quốc để triển khai c&aacute;c hoạt động như: trao đổi học thuật,&nbsp;<strong>giao lưu văn h&oacute;a</strong>&nbsp;v&agrave; n&acirc;ng cao chất lượng nguồn nh&acirc;n lực Việt Nam - H&agrave;n Quốc.</p>\r\n\r\n<p>&nbsp;</p>\r\n', '2020-12-16 13:17:45', 1),
(7, 'Đại học Duy Tân hợp tác với ĐH Dong – A (Hàn Quốc) Đào tạo Thạc sĩ Du lịch', '20201024-5O8A9472-50.jpg', '<p>Ng&agrave;y 9/11, tại Đ&agrave; Nẵng, trường&nbsp;<strong><a href=\"https://duytan.edu.vn/\">ĐH Duy T&acirc;n</a>&nbsp;v&agrave; trường ĐH Dong &ndash; A k&yacute; kết hợp t&aacute;c chương tr&igrave;nh đ&agrave;o tạo thạc sĩ Du lịch</strong>&nbsp;li&ecirc;n kết giữa 2 trường.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Theo đ&oacute;,<strong>&nbsp;chương tr&igrave;nh đ&agrave;o tạo thạc sĩ Du lịch</strong>&nbsp;li&ecirc;n kết giữa trường ĐH Duy T&acirc;n trường ĐH Dong- A (H&agrave;n Quốc) sẽ được&nbsp;<strong>giảng dạy bằng 100% bằng tiếng Anh</strong>&nbsp;, k&eacute;o d&agrave;i 4 học kỳ với 26 t&iacute;n chỉ tại ĐH Duy T&acirc;n. C&aacute;c m&ocirc;n học v&agrave; luận văn tốt nghiệp sẽ do giảng vi&ecirc;n trường ĐH Duy T&acirc;n v&agrave; Dong-A đảm nhận giảng dạy v&agrave; hướng dẫn.</p>\r\n', '<p>Ng&agrave;y 9/11, tại Đ&agrave; Nẵng, trường&nbsp;<strong><a href=\"https://duytan.edu.vn/\">ĐH Duy T&acirc;n</a>&nbsp;v&agrave; trường ĐH Dong &ndash; A k&yacute; kết hợp t&aacute;c chương tr&igrave;nh đ&agrave;o tạo thạc sĩ Du lịch</strong>&nbsp;li&ecirc;n kết giữa 2 trường.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Theo đ&oacute;,<strong>&nbsp;chương tr&igrave;nh đ&agrave;o tạo thạc sĩ Du lịch</strong>&nbsp;li&ecirc;n kết giữa trường ĐH Duy T&acirc;n trường ĐH Dong- A (H&agrave;n Quốc) sẽ được&nbsp;<strong>giảng dạy bằng 100% bằng tiếng Anh</strong>&nbsp;, k&eacute;o d&agrave;i 4 học kỳ với 26 t&iacute;n chỉ tại ĐH Duy T&acirc;n. C&aacute;c m&ocirc;n học v&agrave; luận văn tốt nghiệp sẽ do giảng vi&ecirc;n trường ĐH Duy T&acirc;n v&agrave; Dong-A đảm nhận giảng dạy v&agrave; hướng dẫn.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Đại diện trường ĐH Duy T&acirc;n cho biết, việc li&ecirc;n kết đ&agrave;o tạo chương tr&igrave;nh thạc sĩ ng&agrave;nh du lịch giữa hai trường l&agrave; cơ hội lớn để đ&agrave;o tạo nguồn chất lượng cao cho kh&ocirc;ng chỉ c&aacute;c doanh nghiệp hoạt động trong ng&agrave;nh du lịch m&agrave; c&ograve;n đ&agrave;o tạo được những giảng vi&ecirc;n đạt chuẩn cho nh&agrave; trường theo quy định của Bộ GD&amp;ĐT.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Đồng thời g&oacute;p phần tạo nguồn giảng vi&ecirc;n cho c&aacute;c trường đ&agrave;o tạo du lịch trong th&agrave;nh phố Đ&agrave; Nẵng v&agrave; khu vực miền Trung-T&acirc;y Nguy&ecirc;n. C&aacute;c học vi&ecirc;n sau tốt nghiệp sẽ trở th&agrave;nh hạt nh&acirc;n cho việc ph&aacute;t triển n&acirc;ng cao chất lượng đ&agrave;o tạo du lịch tiếp cận tr&igrave;nh độ khu vực v&agrave; thế giới phục vụ nhu cầu du lịch ng&agrave;y c&agrave;ng cao trong nước.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><em>(Nguồn:https://giaoducthoidai.vn/ket-noi/dh-duy-tan-hop-tac-voi-dh-dong-a-han-quoc-dao-tao-thac-si-du-lich-4046073-v.html)</em></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>TAGS:&nbsp;<a href=\"https://duytan.edu.vn/news/ListSearchTag.aspx?tag=EAGhHmkAIABoAM0eYwAgAEQAdQB5ACAAVADiAG4AIAAQAeAAbwAgAHQAoR5vACAAVABoAKEeYwAgAHMA+R4gAG4AZwDgAG4AaAAgAEQAdQAgAGwAyx5jAGgA&amp;page=0&amp;lang=vi-VN\" title=\"\">Đại học Duy T&acirc;n Đ&agrave;o tạo Thạc sỹ ng&agrave;nh Du lịch,&nbsp;</a><a href=\"https://duytan.edu.vn/news/ListSearchTag.aspx?tag=VABoAKEeYwAgAHMA+R4gAEQAdQAgAGwAyx5jAGgA&amp;page=0&amp;lang=vi-VN\" title=\"\">Thạc sỹ Du lịch,&nbsp;</a><a href=\"https://duytan.edu.vn/news/ListSearchTag.aspx?tag=SwBoAG8AYQAgAEQAdQAgAGwAyx5jAGgA&amp;page=0&amp;lang=vi-VN\" title=\"\">Khoa Du lịch,&nbsp;</a><a href=\"https://duytan.edu.vn/news/ListSearchTag.aspx?tag=bgBnAOAAbgBoACAARAB1ACAAbADLHmMAaAA=&amp;page=0&amp;lang=vi-VN\" title=\"\">ng&agrave;nh Du lịch,&nbsp;</a><a href=\"https://duytan.edu.vn/news/ListSearchTag.aspx?tag=EAGhHmkAIABoAM0eYwAgAEQAdQB5ACAAVADiAG4A&amp;page=0&amp;lang=vi-VN\" title=\"\">Đại học Duy T&acirc;n</a></p>\r\n', '2020-11-16 13:19:10', 1),
(8, 'Bệnh viện Trung ương Huế là Đơn vị Thực hành chính cho Sinh viên ngành Y của Đại học Duy Tân', 'bv1.png', '<p>Sau k&yacute; kết hợp t&aacute;c v&agrave;o năm 2017 giữa&nbsp;<strong>Đại học Duy T&acirc;n</strong>&nbsp;v&agrave;&nbsp;<strong>Bệnh viện Trung ương Huế&nbsp;</strong>để đưa sinh vi&ecirc;n đến thực tập tại bệnh viện, ng&agrave;y 22/6/2018, Đại học Duy T&acirc;n đ&atilde; đến thăm v&agrave; l&agrave;m việc tại bệnh viện đồng thời mở ra nhiều cơ hội hợp t&aacute;c &yacute; nghĩa hơn nữa giữa 2 đơn vị. Cũng từ thời điểm n&agrave;y, Bệnh viện Trung ương Huế sẽ ch&iacute;nh thức trở th&agrave;nh đơn vị thực h&agrave;nh ch&iacute;nh cho c&aacute;c ng&agrave;nh B&aacute;c sĩ Đa khoa v&agrave; B&aacute;c sĩ Răng-H&agrave;m-Mặt của Đại học Duy T&acirc;n.</p>\r\n', '<p>Sau k&yacute; kết hợp t&aacute;c v&agrave;o năm 2017 giữa&nbsp;<strong>Đại học Duy T&acirc;n</strong>&nbsp;v&agrave;&nbsp;<strong>Bệnh viện Trung ương Huế&nbsp;</strong>để đưa sinh vi&ecirc;n đến thực tập tại bệnh viện, ng&agrave;y 22/6/2018, Đại học Duy T&acirc;n đ&atilde; đến thăm v&agrave; l&agrave;m việc tại bệnh viện đồng thời mở ra nhiều cơ hội hợp t&aacute;c &yacute; nghĩa hơn nữa giữa 2 đơn vị. Cũng từ thời điểm n&agrave;y, Bệnh viện Trung ương Huế sẽ ch&iacute;nh thức trở th&agrave;nh đơn vị thực h&agrave;nh ch&iacute;nh cho c&aacute;c ng&agrave;nh B&aacute;c sĩ Đa khoa v&agrave; B&aacute;c sĩ Răng-H&agrave;m-Mặt của Đại học Duy T&acirc;n.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;<img alt=\"Đại học Duy Tân đến tham quan và làm việc tại Bệnh viện Trung ương Huế\" src=\"https://cdn.duytan.edu.vn/news/uploads/bv1.png\" /></p>\r\n\r\n<p><em>&nbsp;L&atilde;nh đạo Bệnh viện Trung ương Huế v&agrave; l&atilde;nh đạo Đại học Duy T&acirc;n</em></p>\r\n\r\n<p><em>chụp ảnh lưu niệm tại buổi l&agrave;m việc&nbsp;</em></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Bệnh viện Trung ương Huế được th&agrave;nh lập từ năm 1894 theo sắc lệnh của Vua Th&agrave;nh Th&aacute;i để phục vụ triều đ&igrave;nh v&agrave; người Ph&aacute;p. Sau 124 năm ph&aacute;t triển, hiện tại Bệnh viện Trung ương Huế l&agrave; 1 trong 3 bệnh viện lớn nhất Việt Nam với 3 cơ sở gồm: Bệnh viện Trung ương Huế cơ sở 1, Bệnh viện Trung ương Huế cơ sở 2, Bệnh viện Quốc tế Trung ương Huế. Bệnh viện quy tụ những gi&aacute;o sư, tiến sĩ, b&aacute;c sĩ giỏi nhất với niềm đam m&ecirc; c&ocirc;ng việc v&agrave; quyết t&acirc;m n&acirc;ng cao năng lực để thực hiện c&aacute;c kỹ thuật cao nhất. Kh&ocirc;ng chỉ kh&aacute;m chữa cho rất nhiều bệnh nh&acirc;n, mới đ&acirc;y nhất,&nbsp;<strong>Bệnh viện Trung ương Huế đ&atilde; thực hiện th&agrave;nh c&ocirc;ng 2 ca gh&eacute;p tim xuy&ecirc;n Việt.</strong>&nbsp;Trong qu&aacute; tr&igrave;nh gh&eacute;p tim, kh&ocirc;ng chỉ phải c&oacute; kỹ thuật cao, sự b&igrave;nh ổn t&acirc;m l&yacute; m&agrave; c&aacute;c b&aacute;c sĩ c&ograve;n phải chạy đua thời gian v&agrave; thực hiện ch&iacute;nh x&aacute;c tuyệt đối từng thao t&aacute;c để mang lại sự sống cho con người. Đ&oacute; giống như một c&acirc;u chuyện cổ t&iacute;ch m&agrave; người nghe chỉ biết lặng im, cầu nguyện rồi thốt l&ecirc;n: chỉ c&oacute; thể l&agrave; ph&eacute;p m&agrave;u.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>C&ugrave;ng c&oacute; chung niềm đam m&ecirc; với Y học v&agrave; quyết t&acirc;m đ&agrave;o tạo những thế hệ sinh vi&ecirc;n Y khoa c&oacute; t&agrave;i, c&oacute; đức, buổi gặp gỡ giữa c&aacute;c l&atilde;nh đạo Bệnh viện Trung ương Huế v&agrave; c&aacute;c l&atilde;nh đạo Đại học Duy T&acirc;n diễn ra đầy th&acirc;n thiết với tinh thần cởi mở. Anh h&ugrave;ng Lao động, Nh&agrave; gi&aacute;o Ưu t&uacute; L&ecirc; C&ocirc;ng Cơ - Chủ tịch Hội đồng Quản trị , Hiệu trưởng Đại học Duy T&acirc;n chia sẻ:&nbsp;<em>&ldquo;Sinh ra ở Quảng Nam nhưng t&ocirc;i hoạt động c&aacute;ch mạng ở Huế 16 năm. Trong suốt những năm th&aacute;ng&nbsp; đ&oacute;, c&ugrave;ng với việc g&acirc;y dựng v&agrave; l&atilde;nh đạo phong tr&agrave;o Thanh ni&ecirc;n - Học sinh - Sinh vi&ecirc;n, t&ocirc;i đ&atilde; đi &lsquo;m&ograve;n&rsquo; đất Huế v&agrave; thực sự th&acirc;n thuộc với mảnh đất n&agrave;y. Bởi thế, mỗi lần trở về Huế t&ocirc;i như trở về ng&ocirc;i nh&agrave; th&acirc;n y&ecirc;u của m&igrave;nh vậy. Sau khi đất nước giải ph&oacute;ng, t&ocirc;i v&agrave;o Đ&agrave; Nẵng x&acirc;y dựng Đại học Duy T&acirc;n với kh&aacute;t khao n&acirc;ng cao d&acirc;n tr&iacute; cho một mảnh đất ngh&egrave;o, t&ocirc;i đ&atilde; được l&atilde;nh đạo th&agrave;nh phố thực sự ủng hộ. Kh&ocirc;ng những vậy, rất nhiều đơn vị, tổ chức, doanh nghiệp cũng đ&atilde; đồng h&agrave;nh với trường để n&acirc;ng cao năng lực cho những thế hệ sinh vi&ecirc;n mới. V&agrave; giờ đ&acirc;y, được Bệnh viện Trung ương Huế nhiệt t&igrave;nh ủng hộ nh&agrave; trường trong c&ocirc;ng t&aacute;c tiếp nhận sinh vi&ecirc;n đến thực h&agrave;nh v&agrave; đồng t&acirc;m c&ugrave;ng b&agrave;n thảo để mở Bệnh viện Thực h&agrave;nh trong tương lai, đ&oacute; thực sự l&agrave; một niềm vui lớn. Việc sinh vi&ecirc;n được thực tập, đ&agrave;o tạo tại Bệnh viện Trung ương Huế kh&ocirc;ng chỉ gi&uacute;p n&acirc;ng cao chất lượng nguồn nh&acirc;n lực ng&agrave;nh Y để cung cấp cho x&atilde; hội m&agrave; c&ograve;n l&agrave; sự ghi nhận về một nấc thang ph&aacute;t triển mới của Đại học Duy T&acirc;n với những uy t&iacute;n trong đ&agrave;o tạo Y - Dược - Điều dưỡng tại miền Trung Việt Nam.&rdquo;</em></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"Đại học Duy Tân đến tham quan và làm việc tại Bệnh viện Trung ương Huế\" src=\"https://cdn.duytan.edu.vn/news/uploads/bv.png\" />&nbsp;</p>\r\n\r\n<p><em>L&atilde;nh đạo Đại học Duy T&acirc;n đi tham quan</em></p>\r\n\r\n<p><em>c&aacute;c cơ sở kh&aacute;m chữa bệnh của Bệnh viện Trung ương Huế</em></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Được biết theo quy định, một bệnh viện chỉ được k&yacute; kết v&agrave; trở th&agrave;nh đơn vị thực h&agrave;nh của 2 cơ sở đ&agrave;o tạo. V&igrave; thế, đ&acirc;y sẽ l&agrave; cơ hội tuyệt vời m&agrave; Đại học Duy T&acirc;n mang đến cho sinh vi&ecirc;n theo học ng&agrave;nh Y của m&igrave;nh trong hiện tại v&agrave; tương lai. Đại học Duy T&acirc;n cũng đ&atilde; đầu tư&nbsp;<strong>2 chiếc xe du lịch lớn với 30 ghế/xe</strong>&nbsp;để đưa sinh vi&ecirc;n đến Bệnh viện Trung ương Huế thực tập một c&aacute;ch thuận lợi nhất.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Ph&aacute;t biểu tại buổi đ&oacute;n tiếp, GS.TS. Phạm Như Hiệp - Đại biểu Quốc hội, Gi&aacute;m đốc Bệnh viện Trung ương Huế cho biết:<em>&nbsp;&ldquo;Trong Lễ Khai giảng năm học 2017 - 2018, t&ocirc;i đ&atilde; được mời v&agrave;o dự lễ v&agrave; k&yacute; kết hợp t&aacute;c. T&ocirc;i rất ấn tượng với sự ph&aacute;t triển của Đại học Duy T&acirc;n trong thời gian qua. Nhưng t&ocirc;i ấn tượng hơn đ&oacute; l&agrave; trong phi&ecirc;n chất vấn s&aacute;ng 6/6/2018 về lĩnh vực gi&aacute;o dục, Ph&oacute; Thủ tướng Vũ Đức Đam đ&atilde; nhắc đến&nbsp;<strong>6 trường đại học c&oacute; sự vượt trội về nghi&ecirc;n cứu khoa học, trong đ&oacute; c&oacute; Đại học Duy T&acirc;n - l&agrave; 1 trường đại học tư thục.</strong>&nbsp;Với uy t&iacute;n m&agrave; Đại học Duy T&acirc;n tạo dựng, Bệnh viện Trung ương Huế rất vui khi c&ugrave;ng đồng h&agrave;nh với nh&agrave; trường trong việc n&acirc;ng cao chất lượng sinh vi&ecirc;n ng&agrave;nh Y. L&agrave; một bệnh viện lớn n&ecirc;n Đại học Duy T&acirc;n ho&agrave;n to&agrave;n y&ecirc;n t&acirc;m khi gửi gắm sinh vi&ecirc;n tới đ&acirc;y thực tập. Tại đ&acirc;y, sinh vi&ecirc;n sẽ được thực h&agrave;nh ở rất nhiều lĩnh vực từ ngoại khoa tim mạch, ung thư, huyết học truyền m&aacute;u, nội khoa, can thiệp, răng-h&agrave;m-mặt,&hellip; 2 đơn vị đ&atilde; c&oacute; mối quan hệ l&acirc;u d&agrave;i v&agrave; buổi gặp gỡ h&ocirc;m nay sẽ mở ra nhiều cơ hội hợp t&aacute;c hơn nữa để g&oacute;p phần đ&agrave;o tạo c&aacute;c thế hệ sinh vi&ecirc;n Y khoa t&agrave;i năng v&agrave; to&agrave;n diện hơn trong tương lai.&rdquo;</em></p>\r\n', '2020-11-16 13:19:57', 1);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`) VALUES
(1, 'ADMIN'),
(2, 'MANAGER'),
(3, 'TEACHER'),
(4, 'ALUMNI'),
(5, 'STUDENT');

-- --------------------------------------------------------

--
-- Table structure for table `trainning_system`
--

DROP TABLE IF EXISTS `trainning_system`;
CREATE TABLE IF NOT EXISTS `trainning_system` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `training_system_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `trainning_system`
--

INSERT INTO `trainning_system` (`id`, `code`, `training_system_name`) VALUES
(1, 'DH', 'Đại Học'),
(2, 'CD', 'Cao Đẳng');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `alumni_group`
--
ALTER TABLE `alumni_group`
  ADD CONSTRAINT `FKahet9s63nsf6haypk6o7gqawp` FOREIGN KEY (`create_by`) REFERENCES `member` (`id`);

--
-- Constraints for table `chatchannel`
--
ALTER TABLE `chatchannel`
  ADD CONSTRAINT `FK2ebryv65ujand1h1dsghlqhxk` FOREIGN KEY (`userIdTwo`) REFERENCES `member` (`id`),
  ADD CONSTRAINT `FKevhusrfb52ha27hi0nxnfk5b4` FOREIGN KEY (`userIdOne`) REFERENCES `member` (`id`);

--
-- Constraints for table `chatmessage`
--
ALTER TABLE `chatmessage`
  ADD CONSTRAINT `FKg5vsq2ogos3967sah9xs6gt25` FOREIGN KEY (`recipientUserId`) REFERENCES `member` (`id`),
  ADD CONSTRAINT `FKr8oi32b9hjjmrc9rv5tlpmcn2` FOREIGN KEY (`authorUserId`) REFERENCES `member` (`id`);

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `FKgrxmwlp2sbi6we2dtaqtd4asx` FOREIGN KEY (`authorId`) REFERENCES `member` (`id`);

--
-- Constraints for table `group_member`
--
ALTER TABLE `group_member`
  ADD CONSTRAINT `FKeamf7nngsg582uxwqgde8o28x` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`),
  ADD CONSTRAINT `FKhm4ypkf4tyhf6he2ngw09t6p4` FOREIGN KEY (`group_id`) REFERENCES `alumni_group` (`id`);

--
-- Constraints for table `group_post`
--
ALTER TABLE `group_post`
  ADD CONSTRAINT `FKg3nb0hmavnnhgndqmcea8w1rp` FOREIGN KEY (`group_id`) REFERENCES `alumni_group` (`id`),
  ADD CONSTRAINT `FKgopw03ykvj1b8r1kxqxhnsqqr` FOREIGN KEY (`author_id`) REFERENCES `member` (`id`);

--
-- Constraints for table `job`
--
ALTER TABLE `job`
  ADD CONSTRAINT `FK65ble7l5oimv9mnw6ybwac6eu` FOREIGN KEY (`major_id`) REFERENCES `major` (`id`),
  ADD CONSTRAINT `FK9wag5yf19odet2ehd4wochvbe` FOREIGN KEY (`authorId`) REFERENCES `member` (`id`);

--
-- Constraints for table `job_apply`
--
ALTER TABLE `job_apply`
  ADD CONSTRAINT `FKant3yxiy3mym63b4ofq0tyssn` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`),
  ADD CONSTRAINT `FKfqj0ch7p74m8g4ibl5oxsnvm0` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`);

--
-- Constraints for table `like_post`
--
ALTER TABLE `like_post`
  ADD CONSTRAINT `FKewf8t5o3mqdxavpi2eapo9wbm` FOREIGN KEY (`author_id`) REFERENCES `member` (`id`);

--
-- Constraints for table `major`
--
ALTER TABLE `major`
  ADD CONSTRAINT `FKrbpflj1p41y81s9d2jf5ix2jv` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`id`);

--
-- Constraints for table `major_file`
--
ALTER TABLE `major_file`
  ADD CONSTRAINT `FKlvgxyb675m5pvo7mkbmf6gp01` FOREIGN KEY (`authorId`) REFERENCES `member` (`id`),
  ADD CONSTRAINT `FKoglmq8fkpvi5x65a26ul3k495` FOREIGN KEY (`jobId`) REFERENCES `job` (`id`);

--
-- Constraints for table `member`
--
ALTER TABLE `member`
  ADD CONSTRAINT `FK7tt865asjdplsv89ygeodtnum` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`id`),
  ADD CONSTRAINT `FK_t_member_role` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
  ADD CONSTRAINT `FK_t_member_trainning_system` FOREIGN KEY (`trainning_system_id`) REFERENCES `trainning_system` (`id`),
  ADD CONSTRAINT `FKeqnko95dqqreocnsc3i7tqyqj` FOREIGN KEY (`major_id`) REFERENCES `major` (`id`),
  ADD CONSTRAINT `FKfhl0jwf998q7xruieneeoybvs` FOREIGN KEY (`kname_id`) REFERENCES `kname` (`id`);

--
-- Constraints for table `member_group`
--
ALTER TABLE `member_group`
  ADD CONSTRAINT `FK44ccmfb1t5udx1tph77bj6u27` FOREIGN KEY (`group_id`) REFERENCES `alumni_group` (`id`),
  ADD CONSTRAINT `FKi9080rfwtrt5jlvim4mcg4rl4` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`);

--
-- Constraints for table `member_role`
--
ALTER TABLE `member_role`
  ADD CONSTRAINT `FK34g7epqlcxqloewku3aoqhhmg` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`),
  ADD CONSTRAINT `FKdiix07v86r3ntrbs3l02qr7y0` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);

--
-- Constraints for table `network`
--
ALTER TABLE `network`
  ADD CONSTRAINT `FKb98541bsf5ep70u48dba8k9xv` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`),
  ADD CONSTRAINT `FKnpb5plsbf7m7t1u37m0sjbxf8` FOREIGN KEY (`friend_id`) REFERENCES `member` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
