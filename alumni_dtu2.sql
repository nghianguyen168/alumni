-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 11, 2020 lúc 04:46 PM
-- Phiên bản máy phục vụ: 10.4.14-MariaDB
-- Phiên bản PHP: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `alumni_dtu`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `alumni_group`
--

CREATE TABLE `alumni_group` (
  `id` int(11) NOT NULL,
  `group_decription` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `group_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_by` int(11) DEFAULT NULL,
  `sumMember` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `alumni_group`
--

INSERT INTO `alumni_group` (`id`, `group_decription`, `group_name`, `create_by`, `sumMember`) VALUES
(0, 'Cộng đồng của sinh viên Duy Tân', 'Cộng Đồng DTU', 1, 0),
(2, 'CSU', 'CSU', 1, 0),
(4, '', 'Sinh Viên k23 CMU', 1, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chatchannel`
--

CREATE TABLE `chatchannel` (
  `uuid` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userIdOne` int(11) NOT NULL,
  `userIdTwo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `chatchannel`
--

INSERT INTO `chatchannel` (`uuid`, `userIdOne`, `userIdTwo`) VALUES
('1', 2, 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chatmessage`
--

CREATE TABLE `chatmessage` (
  `id` int(11) NOT NULL,
  `authorUserId` int(11) NOT NULL,
  `recipientUserId` int(11) NOT NULL,
  `contents` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `timeSent` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `time_comment` datetime NOT NULL,
  `authorId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `comment`
--

INSERT INTO `comment` (`id`, `comment`, `parent_id`, `post_id`, `time_comment`, `authorId`) VALUES
(18, 'hello', 0, 17, '2020-11-02 09:14:53', 2),
(19, 'hêlo', 0, 17, '2020-11-02 09:15:02', 2),
(20, 'hihi', 19, 17, '2020-11-02 09:16:33', 2),
(21, 'ds', 0, 17, '2020-11-02 09:16:53', 2),
(22, 'kk', 19, 17, '2020-11-02 09:17:16', 2),
(23, 'fdsg', 19, 17, '2020-11-02 09:22:26', 2),
(24, 'gdf', 19, 17, '2020-11-02 09:22:28', 2),
(25, 'gdfgdfh', 19, 17, '2020-11-02 09:22:30', 2),
(26, 'gdf', 0, 17, '2020-11-02 09:26:26', 2),
(27, 'hgf', 0, 17, '2020-11-02 09:26:26', 2),
(28, 'sf', 0, 17, '2020-11-02 09:26:27', 2),
(29, 'fds', 19, 17, '2020-11-02 10:07:31', 2),
(30, 'js', 19, 17, '2020-11-02 10:07:48', 2),
(31, 'gdfg', 0, 17, '2020-11-02 10:08:42', 2),
(32, 'fd', 0, 18, '2020-11-04 15:43:16', 1),
(33, 'fd', 0, 18, '2020-11-04 15:43:19', 1),
(34, 'gf', 0, 18, '2020-11-04 15:43:21', 1),
(35, 'gf', 0, 17, '2020-11-04 15:43:28', 1),
(36, 'gf', 0, 17, '2020-11-04 15:43:31', 1),
(37, 'fd', 0, 19, '2020-11-04 15:55:40', 1),
(38, 'fd', 37, 19, '2020-11-04 15:55:53', 1),
(39, 'fd', 0, 19, '2020-11-04 15:57:02', 1),
(40, 'fd', 0, 19, '2020-11-04 15:57:20', 1),
(41, 'fd', 0, 21, '2020-11-05 06:30:16', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `contact_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_send` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `contact`
--

INSERT INTO `contact` (`id`, `contact_name`, `email`, `message`, `time_send`) VALUES
(14, 'nghia nguyen', 'nghianguyen168197@gmail.com', 'fdfd', '2020-11-30 16:29:04'),
(15, '', '', '', '2020-12-04 14:31:09'),
(16, 'fdsfsd', 'fdsfsdfsd', 'fd', '2020-12-04 14:35:59');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `edu_level`
--

CREATE TABLE `edu_level` (
  `id` int(11) NOT NULL,
  `edu_level_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `edu_level_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `edu_level`
--

INSERT INTO `edu_level` (`id`, `edu_level_code`, `edu_level_name`) VALUES
(1, 'DH', 'Đại Học');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `event`
--

CREATE TABLE `event` (
  `id` int(11) NOT NULL,
  `decription` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enable` int(11) DEFAULT NULL,
  `event_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `place` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time_end` timestamp NULL DEFAULT NULL,
  `time_start` timestamp NULL DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `event`
--

INSERT INTO `event` (`id`, `decription`, `enable`, `event_name`, `place`, `time_end`, `time_start`, `image`) VALUES
(1, 'fkjdh', 1, 'e fd f', '03 Quang trung', '2020-10-17 15:42:00', '2020-10-16 15:42:00', NULL),
(2, 'gdfgdfgdf', 1, 'fdsfgds', 'sdgdf', '2020-10-10 15:42:00', '2020-10-16 15:42:00', NULL),
(3, 'rưerwerwe', 1, 'rrwerew', 'rewrwe', '2020-10-25 15:43:00', '2020-10-16 15:43:00', NULL),
(4, 'fdsf', 0, 'ffff', 'fdf', '2020-10-08 15:50:00', '2020-10-13 15:50:00', NULL),
(5, 'fdfsd', 0, 'dfsdfds', 'ff', '2020-10-02 16:29:00', '2020-10-02 16:27:00', NULL),
(10, 'Tuyển dụng việc làm FPT', 1, 'Tuyển dụng việc làm FPT', '209 Phan Thanh', '2020-11-28 08:00:00', '2020-11-28 07:02:00', NULL),
(11, '', 1, 'Gặp mặt cựu sinh viên k23 CMU-TPM5', '', '2020-11-20 00:39:00', '2020-11-29 00:00:00', '123328611_2881416445460256_2086261442326742317_o.jpg'),
(12, '', 1, 'họp cựu sinh viên khoa', '', '2020-10-29 05:12:00', '2020-10-29 04:01:00', '122921440_2875220082746559_269118862255335019_o.jpg'),
(13, 'Bảo vệ captone 1 K23 - Khoa CNTT,Khoa DTQT', 1, 'Bảo vệ captone 1', '254 Nguyễn Văn Linh', '2020-12-01 02:30:00', '2020-12-01 00:30:00', '23-Dai-Hoc-Duy-Tan-1.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `faculty`
--

CREATE TABLE `faculty` (
  `id` int(11) NOT NULL,
  `faculty_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `faculty`
--

INSERT INTO `faculty` (`id`, `faculty_name`) VALUES
(1, 'Đào Tạo Quốc Tế');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `folow_job`
--

CREATE TABLE `folow_job` (
  `id` int(11) NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `folow_job`
--

INSERT INTO `folow_job` (`id`, `email`) VALUES
(1, 'tuananh883300@gmail.com'),
(2, 'tuananh883300@gmail.com'),
(3, 'tuan83300@gmail.com');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `group_member`
--

CREATE TABLE `group_member` (
  `id` int(11) NOT NULL,
  `group_id` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `group_member`
--

INSERT INTO `group_member` (`id`, `group_id`, `member_id`) VALUES
(1, 2, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `group_post`
--

CREATE TABLE `group_post` (
  `id` int(255) NOT NULL,
  `media` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_post` datetime NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `group_post`
--

INSERT INTO `group_post` (`id`, `media`, `time_post`, `title`, `file`, `group_id`, `author_id`) VALUES
(14, '|1920x1200_px_Code_Dark_Laravel_PHP_programming_Simple-1348569.jpg', '2020-10-30 15:24:40', 'fdfdssd', NULL, 0, 1),
(16, 'hihihihi.jpg', '2020-10-30 15:34:27', 'hihi', NULL, 0, 1),
(17, '1920x1200-px-life-PHP-programming-success-1207823-wallhere.com.jpg|hihihihi.jpg', '2020-10-30 15:34:46', 'fdfsdfsd', NULL, 0, 1),
(18, '1920x1200-px-life-PHP-programming-success-1207823-wallhere.com.jpg', '2020-10-30 16:11:48', 'gfdhgf', NULL, 0, 1),
(19, '1920x1200-px-life-PHP-programming-success-1207823-wallhere.com.jpg', '2020-10-30 16:13:16', 'helo anh em', NULL, 0, 1),
(20, '', '2020-11-04 07:07:23', '', '', 0, 1),
(21, '', '2020-11-04 07:07:24', '', '', 0, 1),
(22, '', '2020-11-04 07:07:25', '', '', 0, 1),
(23, '', '2020-11-04 07:07:26', '', '', 0, 1),
(24, '', '2020-11-04 07:07:27', '', '', 0, 1),
(25, '', '2020-11-04 08:09:32', 'Ds thi', '', 0, 1),
(26, '', '2020-11-04 08:14:13', 'fdfd', '', 0, 1),
(27, '', '2020-11-04 08:16:19', 'fdsf', '637396842927978198.xlsx', 0, 1),
(28, '|hihihihi.jpg', '2020-11-04 08:16:52', 'fdfd', '637396842927978198.xlsx', 0, 1),
(29, '', '2020-11-04 15:34:28', 'GDFGFHG', '637396842927978198.xlsx', 0, 1),
(30, '', '2019-11-04 15:36:37', 'gfdhgdf', '', 0, 1),
(31, '', '2020-11-04 15:39:59', 'fd', '', 0, 1),
(32, '', '2020-11-14 12:16:18', 'hihi', '', 4, 5),
(33, '', '2020-11-29 15:49:39', '', '', 0, 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hibernate_sequence`
--

CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `hibernate_sequence`
--

INSERT INTO `hibernate_sequence` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `job`
--

CREATE TABLE `job` (
  `id` int(11) NOT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deadline_apply` date NOT NULL,
  `decription` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enable` int(11) DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `posted_on` date NOT NULL,
  `salary` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `major_id` int(11) DEFAULT NULL,
  `views` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `job`
--

INSERT INTO `job` (`id`, `company_name`, `deadline_apply`, `decription`, `enable`, `location`, `position`, `posted_on`, `salary`, `authorId`, `major_id`, `views`) VALUES
(1, 'dsadas', '2020-11-11', '<p>fdsfsfd</p>\r\n', 1, 'Vietnam', 'đâs', '2020-10-06', '10.000.000 VNĐ', 1, 1, 4),
(6, 'fdfsd', '2020-12-11', '<p>fsfd</p>\r\n', 1, 'Vietnam', 'fdfdsgfgfh', '2020-10-06', 'fd', 1, 1, 5),
(7, 'TP Entertainment', '2020-11-11', '<p>Tại sao bạn sẽ y&ecirc;u th&iacute;ch m&ocirc;i trường l&agrave;m việc tại đ&acirc;y? M&ocirc;i trường l&agrave;m việc chuy&ecirc;n nghiệp, đồng nghiệp th&acirc;n thiện, team l&agrave;m việc thiện chiến, lu&ocirc;n hỗ trợ lẫn nhau. Sếp lu&ocirc;n lắng nghe, tạo điều kiện...</p>\r\n\r\n<ul>\r\n	<li>L&agrave;m việc trong m&ocirc;i trường trẻ trung, th&acirc;n thiện v&agrave; hướng đến việc ph&aacute;t triển con người;</li>\r\n	<li>Thưởng n&oacute;ng qu&yacute;, lương th&aacute;ng 13, một năm l&ecirc;n đến 17 th&aacute;ng lương;</li>\r\n	<li>Review lương 2 lần/năm;</li>\r\n</ul>\r\n', 1, 'Hà Nội', 'Junior Java Dev', '2020-10-06', 'Thỏa Thuận', 1, 1, 11),
(8, 'fsfdg', '1111-11-11', '<p>gdfgdf</p>\r\n', 1, 'dfgdf', 'gfdgdf', '2020-10-07', 'fdfgd', 1, 2, 4),
(9, 'hghgf', '2009-03-22', '<p>hfghfghfggfgdfgdfgd</p>\r\n', 1, 'hgjjhg', 'hgfhfg', '2020-10-07', 'gfdgd', 1, 1, 5),
(10, 'gfhfg', '2020-11-11', '<p>hfghfghfgdfgdfgd</p>\r\n', 1, 'hfghfg', 'hgfhfg', '2020-10-07', 'fdgdg', 1, 1, 3),
(11, 'dsadas', '2020-11-11', '<p>fdffs</p>\r\n', 1, 'fdfdffsd', 'fdfds', '2020-10-07', '10.000.000 VNĐ', 1, 1, 0),
(12, 'fdsfsdfs', '2020-10-11', '<p>fsdfsdfsdfsfdsf</p>\r\n', 1, 'fsdfs', 'fdsfds', '2020-10-07', 'dsfsdfs', 1, 1, 2),
(16, 'djgd', '2020-10-14', 'gfdgfd', 1, 'gfd', 'gfd', '2020-10-08', 'gfdg', 2, 2, 0),
(17, 'gfdhgfdhg', '2020-11-12', 'gfdhgdf', 1, 'gfdgdf', 'fghfghf', '2020-11-20', '111111', 2, 2, 2),
(18, 'FPT', '2020-11-11', '<p>fdfd</p>\r\n', 1, 'Vietnam', 'fsdf', '2020-11-27', 'fdf', 3, 2, 0),
(19, 'Hitachi Vantara', '2020-12-05', '<h2><strong>Job Description</strong></h2>\r\n\r\n<ul>\r\n	<li>Work with project members, responsible for the design/code review, development, and implementation &amp; testing.</li>\r\n	<li>Implement task lists, estimate deliver assignments as functional specifications, quality standards and project schedules.</li>\r\n	<li>Consistently delivers high-quality services and meet customer requirements. Other assignments from Project Manager.</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Your Skills and Experience</h2>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>1 or more years of programming in C/C++</li>\r\n	<li>Junior/Experienced Profiles are both welcomed</li>\r\n	<li>Newcomers will be trained before working</li>\r\n	<li>Have knowledge in Object Oriented Programming Methodology.</li>\r\n	<li>Ability to analyze/study new technical, new frameworks.</li>\r\n	<li>Have knowledge in advanced programming techniques such as Multithread programming, Memory Management.</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Why You&#39;ll Love Working Here</h2>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>At Global CyberSoft (GCS)</strong>, we enjoy:</p>\r\n\r\n<ul>\r\n	<li>Unique opportunity to work with multinational team of Hitachi&nbsp;in over 130 countries.</li>\r\n	<li>Incomparable chance to participate in full Software Development Life Cycle (SDLCs) and comprehensive soft skill trainings.</li>\r\n	<li>Competitive remuneration with attractive allowances &amp; bonuses.</li>\r\n</ul>\r\n\r\n<p>GCS is committed to providing its employees. Our corporate culture committee is a special community in the company that offers employees various activities to participate in: Football League, Tai-chi Club, Dancing Club, English Club, Charity Group, to name a few. Through these groups, employees have a chance to nurture friendships and affiliations with their colleagues. The goal is to develop a company culture that not only fosters innovation, excellence, and leadership, but also one that allows for creativity, personal fulfillment and enjoyment. Through the culture, the company aims to act as one big family, where every member is committed to and enjoys helping one another.<br />\r\n<br />\r\n<strong>GCS offers a competitive benefit packages. Come join Global CyberSoft to enjoy:</strong></p>\r\n\r\n<ul>\r\n	<li>Opportunities for advanced career development overseas, including the US, Japan...</li>\r\n	<li>Competitive &amp; attractive compensation and benefits packages:\r\n	<ul>\r\n		<li>Allowance for academy degrees and language certification, i.e. Master, English, Japanese language certifications</li>\r\n		<li>Subsidy for inflation, transportation and meals.</li>\r\n		<li>Significant project bonus based on Project Performance</li>\r\n		<li>Great Significant end-year bonus (besides bonus of 13th salary)</li>\r\n		<li>Additional International Insurance Package for employees and their families</li>\r\n		<li>Annual division trip and company trip for employees and their families</li>\r\n	</ul>\r\n	</li>\r\n	<li>Being an integral part of a dynamic and fast growing global enterprise.</li>\r\n	<li>An open, professional and nourishing environment with out-side of work activities, such as football, tennis, badminton, dancing, music, and charity.</li>\r\n</ul>\r\n', 1, ' F6 Phi Long Building, 52 Nguyen Van Linh street, Hai Chau, Da Nang', 'Fresher', '2020-11-29', 'Thỏa thuận', 3, 1, 7),
(20, 'FPT', '2021-01-12', '<p>fdsfds</p>\r\n', 1, 'Da nang', 'Senior Developer (ASP.NET)', '2020-12-08', '10000000', 3, 1, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `job_apply`
--

CREATE TABLE `job_apply` (
  `id` int(11) NOT NULL,
  `job_id` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `cv` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apply_on` datetime DEFAULT NULL,
  `check_status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `job_apply`
--

INSERT INTO `job_apply` (`id`, `job_id`, `member_id`, `cv`, `apply_on`, `check_status`) VALUES
(1, 1, 1, 'Nguyen-Van-Nghia-CV.pdf', '2020-10-05 16:41:49', 0),
(4, 7, 1, 'Nguyen-Van-Nghia-Junior-Java.pdf', '2020-10-06 15:54:14', 1),
(5, 7, 2, 'Nguyen-Van-Nghia-CV.pdf', '2020-10-07 06:14:51', 1),
(6, 20, 5, 'Academic_Results_NguyenVanNghia.pdf', '2020-12-08 15:53:05', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `kname`
--

CREATE TABLE `kname` (
  `id` int(11) NOT NULL,
  `k_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `kname`
--

INSERT INTO `kname` (`id`, `k_name`) VALUES
(1, 'K23'),
(2, 'K24');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `like_post`
--

CREATE TABLE `like_post` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `time_like` datetime NOT NULL,
  `author_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `like_post`
--

INSERT INTO `like_post` (`id`, `post_id`, `time_like`, `author_id`) VALUES
(36, 17, '2020-11-05 06:41:04', 1),
(37, 29, '2020-11-06 15:48:39', 1),
(38, 28, '2020-11-18 09:32:04', 5),
(39, 27, '2020-11-18 09:32:08', 5),
(40, 31, '2020-11-24 15:19:45', 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `major`
--

CREATE TABLE `major` (
  `id` int(11) NOT NULL,
  `major_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `major_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `faculty_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `major`
--

INSERT INTO `major` (`id`, `major_code`, `major_name`, `faculty_id`) VALUES
(1, 'CNT', 'Công nghệ phần mềm', NULL),
(2, 'ANM', 'An Ninh Mạng', NULL),
(3, 'HTTT', 'Hệ Thông Thông Tin Quản Lý', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `major_file`
--

CREATE TABLE `major_file` (
  `id` int(11) NOT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jobId` int(11) DEFAULT NULL,
  `authorId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `member`
--

CREATE TABLE `member` (
  `id` int(11) NOT NULL,
  `address_now` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dat_of_birth` date DEFAULT NULL,
  `decription` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dtuMail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enable` int(11) NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hometown` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `marital_status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `work_at` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `year_greduate` int(11) DEFAULT NULL,
  `year_participate` int(11) DEFAULT NULL,
  `edu_level_id` int(11) DEFAULT NULL,
  `major_id` int(11) DEFAULT NULL,
  `member_type_id` int(11) DEFAULT NULL,
  `trainning_system_id` int(11) DEFAULT NULL,
  `yearGreduate` int(11) DEFAULT NULL,
  `company` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `province` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position_job` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salary` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_start_job` date DEFAULT NULL,
  `faculty_id` int(11) DEFAULT NULL,
  `kname_id` int(11) DEFAULT NULL,
  `role_id` int(11) NOT NULL,
  `isPresent` bit(1) DEFAULT NULL,
  `student_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `member`
--

INSERT INTO `member` (`id`, `address_now`, `avatar`, `dat_of_birth`, `decription`, `dtuMail`, `email`, `enable`, `first_name`, `gender`, `hometown`, `last_name`, `marital_status`, `password`, `phone`, `token`, `work_at`, `year_greduate`, `year_participate`, `edu_level_id`, `major_id`, `member_type_id`, `trainning_system_id`, `yearGreduate`, `company`, `country`, `province`, `position_job`, `salary`, `time_start_job`, `faculty_id`, `kname_id`, `role_id`, `isPresent`, `student_id`) VALUES
(1, 'dkjfgh', 'nghia.jpg', '2020-10-06', 'sdfdf', 'nghia123', 'fdsfds', 1, 'fds', 'fds', 'fd', 'fd', '1', '$2a$10$ZgJGjzXVhEkWyBGM8rPVUucW9KBL4dBwrYP4cOQsegLZSJTDmJQEa', '0968997331', 'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJmZHNmZHMiLCJleHAiOjE2MDY2ODYwMTcsImlhdCI6MTYwNjY2ODAxN30.ZSuDvx0ftxt4kXbOBcfWkGN6WfqonckjnjIp8aVGjlDDpIDzDdY-hTItu1HfUq9T0NKdebeJGWdlW27U194j-g', 'sb', 2021, 2017, 1, 1, 1, 1, 0, NULL, '', '', NULL, NULL, NULL, NULL, 1, 1, NULL, 0),
(2, 'dfd', 'nghia.jpg', '2020-10-16', 'fdfds', 'nghia', 'nghianguyen168197@gmail.com', 1, 'Nguyễn Văn', 'male', 'Quảng Bình', 'Nghĩa', '1', '$2a$10$ZgJGjzXVhEkWyBGM8rPVUucW9KBL4dBwrYP4cOQsegLZSJTDmJQEa', '0968997331', 'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJuZ2hpYW5ndXllbjE2ODE5N0BnbWFpbC5jb20iLCJleHAiOjE2MDQ2OTQyOTMsImlhdCI6MTYwNDY3NjI5M30.y1TvhjwH_XSsSah8AliNr7l8ngAgWdqA06KK_Tf1SPwHdx0q9xfT55TmNxrkbBOS-eSUcj8zqmLc9p7_z5fZ4Q', 'Đn', 2021, 2017, 1, 1, 1, 1, 2021, NULL, '', '', NULL, NULL, NULL, NULL, 2, 1, NULL, 0),
(3, 'dfd', 'nghia.jpg', '2020-10-16', 'fdfds', 'admin', 'nghianguyen168197@gmail.com', 1, 'Nguyễn Văn', 'male', 'Quảng Bình', 'Nghĩa', '1', '$2a$10$ZgJGjzXVhEkWyBGM8rPVUucW9KBL4dBwrYP4cOQsegLZSJTDmJQEa', '0968997331', 'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJuZ2hpYW5ndXllbjE2ODE5N0BnbWFpbC5jb20iLCJleHAiOjE2MDc3MTQ1NjcsImlhdCI6MTYwNzY5NjU2N30.ssUBz4dEge-r6SAO-MKKW9pWbBOa4y4juMmo5tqT6lkqZmp2zVcoNIAsEwN86twQvaaERFPUbEn6wz_mFw9uPg', 'Đn', 2021, 2017, 1, 1, 1, 1, 2021, NULL, '', '', NULL, NULL, NULL, NULL, 1, 1, NULL, 0),
(4, 'dfd', 'nghia.jpg', '2020-10-16', 'fdfds', 'manager', 'nghianguyen168197@gmail.com', 1, 'Nguyễn Văn', 'male', 'Quảng Bình', 'Nghĩa', '1', '$2a$10$ZgJGjzXVhEkWyBGM8rPVUucW9KBL4dBwrYP4cOQsegLZSJTDmJQEa', '0968997331', 'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJuZ2hpYW5ndXllbjE2ODE5N0BnbWFpbC5jb20iLCJleHAiOjE2MDU3MDI0MjksImlhdCI6MTYwNTY4NDQyOX0.ilyo_aS1bcrWD829y-VZXNVIe9chqGH_xivf5u5PFOtlbDONkL7NsFr9bi7Z5859TECPN9txhv4L1RPcjVsL-A', 'Đn', 2021, 2017, 1, 1, 1, 1, 2021, NULL, '', '', NULL, NULL, NULL, NULL, 1, 2, NULL, 0),
(5, 'dfd', 'nghia.jpg', '2020-10-16', 'fdfds', 'student', 'nghianguyen168197@gmail.com', 1, 'Nguyễn Văn', 'Nữ', 'Quảng Bình', 'Nghĩa', '1', '$2a$10$ZgJGjzXVhEkWyBGM8rPVUucW9KBL4dBwrYP4cOQsegLZSJTDmJQEa', '0968997331', 'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJuZ2hpYW5ndXllbjE2ODE5N0BnbWFpbC5jb20iLCJleHAiOjE2MDc0NjA3NzQsImlhdCI6MTYwNzQ0Mjc3NH0.CkUVcOijyPBCxrj3ZeJM6lbJWEiX1UCsugTENTtrPDRHFeFb3bKBIs87BeodUb-v8x7kO4161XcSmv5n_fdkbA', NULL, 2021, 2017, 1, NULL, 1, 1, 2021, NULL, 'Việt Nam', 'Quảng Bình', NULL, NULL, NULL, 1, 1, 5, NULL, 0),
(18, NULL, NULL, '1998-12-11', NULL, 'nguyenvannghia8@duytan.edu.vn', 'nghianguyen168197@gmail.com', 1, 'nghia', 'Nam', NULL, 'nguyen', NULL, '$2a$10$ur1kGjS66F9lCu/9VYArWeItapYiF16cEj48MTkGENj9cqC25EyVy!', '96899331', NULL, NULL, NULL, NULL, NULL, 1, 5, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 5, NULL, 1724387623);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `member_group`
--

CREATE TABLE `member_group` (
  `id` int(11) NOT NULL,
  `group_id` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `member_group`
--

INSERT INTO `member_group` (`id`, `group_id`, `member_id`) VALUES
(1, 2, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `member_role`
--

CREATE TABLE `member_role` (
  `id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `member_role`
--

INSERT INTO `member_role` (`id`, `member_id`, `role_id`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `member_type`
--

CREATE TABLE `member_type` (
  `id` int(11) NOT NULL,
  `type_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `member_type`
--

INSERT INTO `member_type` (`id`, `type_name`) VALUES
(1, 'ADMIN'),
(2, 'MANAGER'),
(3, 'TEACHER'),
(4, 'ALUMNI'),
(5, 'STUDENT');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `network`
--

CREATE TABLE `network` (
  `id` int(11) NOT NULL,
  `friend_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `decription` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enable` int(11) DEFAULT NULL,
  `news_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `picture` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `news`
--

INSERT INTO `news` (`id`, `decription`, `detail`, `enable`, `news_name`, `picture`, `createAt`) VALUES
(6, '<p><strong>Giải thưởng Khoa học C&ocirc;ng nghệ Thanh ni&ecirc;n Quả Cầu V&agrave;ng</strong>&nbsp;l&agrave; hoạt động do Trung ương Đo&agrave;n TNCS Hồ Ch&iacute; Minh, Bộ Khoa học v&agrave; C&ocirc;ng nghệ phối hợp tổ chức nhằm t&ocirc;n vinh c&aacute;c t&agrave;i năng trẻ c&oacute; th&agrave;nh t&iacute;ch xuất sắc trong 5 lĩnh vực: C&ocirc;ng nghệ Th&ocirc;ng tin v&agrave; Truyền th&ocirc;ng; C&ocirc;ng nghệ Y - Dược; C&ocirc;ng nghệ Sinh học; C&ocirc;ng nghệ M&ocirc;i trường v&agrave; C&ocirc;ng nghệ Vật liệu mới. Năm 2020, Đại học Duy T&acirc;n vinh dự c&oacute; TS. Hồ Thanh T&acirc;m &ndash; lĩnh vực&nbsp;<strong>C&ocirc;ng nghệ Sinh học</strong>&nbsp;lọt v&agrave;o top 20 v&ograve;ng B&igrave;nh chọn Online để chọn ra 10 gương mặt ti&ecirc;u biểu nhận giải&nbsp;<strong>Quả Cầu V&agrave;ng</strong>.</p>\r\n', '<p><strong>Giải thưởng Khoa học C&ocirc;ng nghệ Thanh ni&ecirc;n Quả Cầu V&agrave;ng</strong>&nbsp;l&agrave; hoạt động do Trung ương Đo&agrave;n TNCS Hồ Ch&iacute; Minh, Bộ Khoa học v&agrave; C&ocirc;ng nghệ phối hợp tổ chức nhằm t&ocirc;n vinh c&aacute;c t&agrave;i năng trẻ c&oacute; th&agrave;nh t&iacute;ch xuất sắc trong 5 lĩnh vực: C&ocirc;ng nghệ Th&ocirc;ng tin v&agrave; Truyền th&ocirc;ng; C&ocirc;ng nghệ Y - Dược; C&ocirc;ng nghệ Sinh học; C&ocirc;ng nghệ M&ocirc;i trường v&agrave; C&ocirc;ng nghệ Vật liệu mới. Năm 2020, Đại học Duy T&acirc;n vinh dự c&oacute; TS. Hồ Thanh T&acirc;m &ndash; lĩnh vực&nbsp;<strong>C&ocirc;ng nghệ Sinh học</strong>&nbsp;lọt v&agrave;o top 20 v&ograve;ng B&igrave;nh chọn Online để chọn ra 10 gương mặt ti&ecirc;u biểu nhận giải&nbsp;<strong>Quả Cầu V&agrave;ng</strong>.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"Bình chọn cho Nhà khoa học Đại học Duy Tân nhận giải Quả Cầu Vàng năm 2020\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/20201115_200840c-72.jpg\" /></p>\r\n\r\n<p><em>TS. Hồ Thanh T&acirc;m tham dự</em></p>\r\n\r\n<p><em>Hội nghị &ldquo;4th International Conference on Natural Products Utilization 2019&rdquo; tại Bulgaria</em></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Được tổ chức lần đầu ti&ecirc;n v&agrave;o năm 2003,&nbsp;<strong>Giải thưởng Khoa học C&ocirc;ng nghệ Thanh ni&ecirc;n Quả Cầu V&agrave;ng</strong>&nbsp;trở th&agrave;nh hoạt động thường ni&ecirc;n nhằm tạo động lực v&agrave; th&uacute;c đẩy phong tr&agrave;o thi đua, học tập, nghi&ecirc;n cứu khoa học v&agrave; &aacute;p dụng c&aacute;c th&agrave;nh tựu Khoa học C&ocirc;ng nghệ v&agrave;o sản xuất v&agrave; đời sống. Giải thưởng cũng đồng thời thu h&uacute;t sự quan t&acirc;m của c&aacute;c cấp, c&aacute;c ng&agrave;nh, c&aacute;c nh&agrave; quản l&yacute;, c&aacute;c lực lượng x&atilde; hội đối với c&ocirc;ng t&aacute;c đ&agrave;o tạo v&agrave; trọng dụng t&agrave;i năng trẻ trong lĩnh vực khoa học c&ocirc;ng nghệ, g&oacute;p phần bồi dưỡng đội ngũ nh&acirc;n t&agrave;i cho đất nước.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Sau hơn 3 th&aacute;ng ph&aacute;t động Giải thưởng&nbsp;<strong>Quả Cầu V&agrave;ng</strong>&nbsp;năm 2020, Ban Tổ chức đ&atilde; nhận được 51 hồ sơ của 19 đơn vị đề cử. Trong đ&oacute;, lĩnh vực&nbsp;<strong>C&ocirc;ng nghệ Sinh học</strong>&nbsp;(8 hồ sơ), C&ocirc;ng nghệ M&ocirc;i trường (10 hồ sơ), C&ocirc;ng nghệ Y - Dược (9 hồ sơ), C&ocirc;ng nghệ Th&ocirc;ng tin v&agrave; Truyền th&ocirc;ng (12 hồ sơ) v&agrave; C&ocirc;ng nghệ Vật liệu mới (12 hồ sơ).&nbsp;&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Lọt v&agrave;o Top 20 c&oacute; TS. Hồ Thanh T&acirc;m -&nbsp;<strong>Đại học Duy T&acirc;n</strong>&nbsp;với nhiều dấu ấn trong hoạt động nghi&ecirc;n cứu khoa học. Ti&ecirc;u biểu trong số đ&oacute; l&agrave;: 18 b&agrave;i b&aacute;o đ&atilde; c&ocirc;ng bố tr&ecirc;n c&aacute;c tạp ch&iacute; khoa học quốc tế, 10 b&agrave;i b&aacute;o c&ocirc;ng bố tr&ecirc;n c&aacute;c tạp ch&iacute; trong nước; 6 b&aacute;o c&aacute;o khoa học được đăng to&agrave;n văn trong kỷ yếu c&aacute;c hội nghị khoa học quốc tế v&agrave; quốc gia; đồng t&aacute;c giả của 1 chương s&aacute;ch chuy&ecirc;n khảo của Nh&agrave; xuất bản SPi Technologies India Private Ltd 2020. B&ecirc;n cạnh đ&oacute;, TS. Hồ Thanh T&acirc;m cũng đ&atilde; gi&agrave;nh được giải Ba b&aacute;o c&aacute;o xuất sắc (Third Place Award) tại Hội thảo &ldquo;In vitro Biology Meeting&rdquo; (Raleigh, North Carolina, USA 2017) do Hiệp hội Sinh học trong Ống nghiệm Hoa K&igrave; (Society for In Vitro Biology) tổ chức; giải Nh&igrave; b&aacute;o c&aacute;o xuất sắc (Second Place Award) tại hội thảo &ldquo;The 3rd International Orchid Symposium&rdquo; (Seoul, Korea 2018) do Hiệp hội Khoa học C&acirc;y trồng Quốc tế (International Society for Horticultural Science) tổ chức,...</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"Bình chọn cho Nhà khoa học Đại học Duy Tân nhận giải Quả Cầu Vàng năm 2020\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/1605445190589c-34.jpg\" /></p>\r\n\r\n<p><em>TS. Hồ Thanh T&acirc;m đến tham quan tại</em></p>\r\n\r\n<p><em>N</em><em>h&agrave; m&aacute;y Sản xuất Sinh khối c&acirc;y Dược liệu ở Quy m&ocirc; C&ocirc;ng nghiệp, H&agrave;n Quốc</em></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Hiện tại, TS. Hồ Thanh T&acirc;m đ&atilde; tham gia 9 đề t&agrave;i, dự &aacute;n nghi&ecirc;n cứu khoa học thuộc lĩnh vực nghi&ecirc;n cứu tại H&agrave;n Quốc, v&agrave; hiện đang l&agrave; th&agrave;nh vi&ecirc;n phản biện 5 tạp ch&iacute; khoa học chuy&ecirc;n ng&agrave;nh quốc tế uy t&iacute;n.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>C&ugrave;ng với đ&oacute;, TS. Hồ Thanh T&acirc;m l&agrave; th&agrave;nh vi&ecirc;n t&iacute;ch cực trong nhiều hoạt động kh&aacute;c như: Ph&oacute; B&iacute; thư đo&agrave;n khoa Sinh học, trường Đại học Đ&agrave; Lạt (2009 - 2011); Chi Hội trưởng Hội Sinh vi&ecirc;n Việt Nam tại Đại học Quốc gia Chungbuk (H&agrave;n Quốc) từ 2015 - 2017, Ph&oacute; Chủ tịch phụ tr&aacute;ch truyền th&ocirc;ng Hiệp hội b&oacute;ng đ&aacute; Việt Nam tại H&agrave;n Quốc từ 2019 - 2020; giải Nh&igrave; với t&aacute;c phẩm &ldquo;Thư gửi con g&aacute;i&rdquo; tại cuộc thi T&igrave;m hiểu Văn h&oacute;a, Lịch sử - Tự h&agrave;o Việt Nam 2019 tại H&agrave;n Quốc,...</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Để TS. Hồ Thanh T&acirc;m - nh&agrave; khoa học của&nbsp;<strong>Đại học Duy T&acirc;n</strong>&nbsp;nằm trong Top 10 gương mặt ti&ecirc;u biểu được trao giải&nbsp;<strong>Quả Cầu V&agrave;ng&nbsp;</strong>2020, k&iacute;nh mong Qu&yacute; Thầy C&ocirc;, C&aacute;n bộ, Nh&acirc;n vi&ecirc;n c&ugrave;ng to&agrave;n thể Sinh vi&ecirc;n to&agrave;n trường c&ugrave;ng tham gia b&igrave;nh chọn. C&aacute;ch thức b&igrave;nh chọn như sau:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>C&aacute;ch thức b&igrave;nh chọn rất đơn giản:</strong></p>\r\n\r\n<p><strong>1. Truy cập v&agrave;o link b&ecirc;n dưới, v&agrave;o mục bầu chọn</strong></p>\r\n\r\n<p><strong>2. Đ&aacute;nh dấu tick v&agrave;o &ocirc;</strong></p>\r\n\r\n<p><strong>&quot;Hồ Thanh T&acirc;m - C&ocirc;ng nghệ Sinh học&quot;</strong></p>\r\n\r\n<p><strong>3. Tick v&agrave;o &ocirc; &quot;T&ocirc;i kh&ocirc;ng phải người m&aacute;y&quot; rồi gửi b&igrave;nh chọn.</strong></p>\r\n\r\n<p><strong>Mọi người c&oacute; thể gửi &yacute; kiến ở mục &yacute; kiến (trước l&uacute;c gửi b&igrave;nh chọn)</strong></p>\r\n\r\n<p><strong>Link bầu chọn:&nbsp;</strong>http://qcv.tainangviet.vn/binh-chon/</p>\r\n', 1, 'Bình chọn cho Nhà khoa học Đại học Duy Tân nhận giải Quả Cầu Vàng năm 2020', '20190529_102149-9.jpg', '2020-11-18 02:46:29'),
(7, '<p>Chỉ sau 2 tuần kể từ khi cho ra đời phi&ecirc;n bản đầu ti&ecirc;n&nbsp;<strong>DTU-VENT Ver1.0</strong>&nbsp;(m&aacute;y thở kh&ocirc;ng x&acirc;m nhập), đến nay nh&oacute;m nghi&ecirc;n cứu của&nbsp;<a href=\"https://duytan.edu.vn/\"><strong>Đại học (ĐH) Duy T&acirc;n</strong></a>&nbsp;đ&atilde; tiếp tục cho ra mắt phi&ecirc;n bản thứ hai&nbsp;<strong>dtu-VENT Ver2.0</strong>&nbsp;với ho&agrave;n chỉnh đầy đủ c&aacute;c chức năng của một m&aacute;y thở y tế chuy&ecirc;n nghiệp, đ&aacute;p ứng c&aacute;c th&ocirc;ng số cấp cứu v&agrave; điều trị bệnh nh&acirc;n COVID-19.</p>\r\n', '<p>Chỉ sau 2 tuần kể từ khi cho ra đời phi&ecirc;n bản đầu ti&ecirc;n&nbsp;<strong>DTU-VENT Ver1.0</strong>&nbsp;(m&aacute;y thở kh&ocirc;ng x&acirc;m nhập), đến nay nh&oacute;m nghi&ecirc;n cứu của&nbsp;<a href=\"https://duytan.edu.vn/\"><strong>Đại học (ĐH) Duy T&acirc;n</strong></a>&nbsp;đ&atilde; tiếp tục cho ra mắt phi&ecirc;n bản thứ hai&nbsp;<strong>dtu-VENT Ver2.0</strong>&nbsp;với ho&agrave;n chỉnh đầy đủ c&aacute;c chức năng của một m&aacute;y thở y tế chuy&ecirc;n nghiệp, đ&aacute;p ứng c&aacute;c th&ocirc;ng số cấp cứu v&agrave; điều trị bệnh nh&acirc;n COVID-19.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Đặc biệt, theo xu hướng hiện nay, c&aacute;c h&atilde;ng tr&ecirc;n thế giới đang bỏ qua h&igrave;nh thức c&ocirc;ng nghệ cũ với m&aacute;y thở x&acirc;m nhập v&agrave; m&aacute;y thở kh&ocirc;ng x&acirc;m nhập l&agrave; những mẫu ri&ecirc;ng biệt kh&aacute;c nhau, nh&oacute;m nghi&ecirc;n cứu đ&atilde; ph&aacute;t triển phi&ecirc;n bản mới theo thiết kế &ldquo;2 trong 1&rdquo; t&iacute;ch hợp cả chức năng &ldquo;thở kh&ocirc;ng x&acirc;m nhập&rdquo; v&agrave; &ldquo;thở x&acirc;m nhập&rdquo; v&agrave;o một, b&ecirc;n cạnh những chức năng hiện đại kh&aacute;c như bảng điều khiển cảm ứng,điều khiểntừ xa gi&uacute;p hạn chế tiếp x&uacute;c với bệnh nh&acirc;n, khả năng can thiệp điều khiển nhiều m&aacute;y thở kh&aacute;c nhau c&ugrave;ng l&uacute;c,&hellip;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"Máy thở dtu-VENT Ver2.0 hỗ trợ cả thở xâm nhập với chi phí dưới 50 triệu đồng\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/maytrotho7-40.jpg\" /></p>\r\n\r\n<p><em>M&aacute;y thở &ldquo;2 trong 1&rdquo; dtu-VENT Ver2.0</em></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Nếu như ở phi&ecirc;n bản Ver1.0,&nbsp;<strong>M&aacute;y thở DTU-VENT&nbsp;</strong>l&agrave; d&ograve;ng m&aacute;y thở kh&ocirc;ng x&acirc;m nhập th&igrave; với phi&ecirc;n bản Ver2.0, sản phẩm đ&atilde; được thiết kế để c&oacute; thể hoạt động như một m&aacute;y thở x&acirc;m nhập nhằm chữa trị cho c&aacute;c bệnh nh&acirc;n nặng, phải thở qua ống nội kh&iacute; quản.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>M&aacute;y thở dtu-VENT Ver2.0&nbsp;</strong>vừa c&oacute; thể hoạt động l&agrave; một m&aacute;y thở x&acirc;m nhập thực hiện kiểm so&aacute;t to&agrave;n bộ hoạt động h&ocirc; hấp của bệnh nh&acirc;n vừa l&agrave; m&aacute;y thở kh&ocirc;ng x&acirc;m nhập với vai tr&ograve; cung cấp d&ograve;ng kh&iacute; oxy đến phổi ở một tần suất cố định th&ocirc;ng qua mặt nạ mũi hoặc mặt nạ mũi-miệng, đ&aacute;p ứng nhanh một lượng kh&iacute; lớn nhằm k&iacute;ch th&iacute;ch hoạt động thở của người bệnh.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Vẫn giữ nguy&ecirc;n c&aacute;c th&ocirc;ng số với c&aacute;c điểm mạnh đ&aacute;ng kể ban đầu như:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>-&nbsp; &nbsp; &nbsp; Sử dụng bơm piston với độ ổn định v&agrave; ch&iacute;nh x&aacute;c cao của d&ograve;ng kh&iacute;,</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>-&nbsp; &nbsp; &nbsp; Thiết kế theo c&aacute;c y&ecirc;u cầu th&ocirc;ng số đ&aacute;p ứng những khuyến c&aacute;o của AMMI-COVID 19,</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>-&nbsp; &nbsp; &nbsp; Điều chỉnh thể t&iacute;ch bơm với độ ch&iacute;nh x&aacute;c cao,</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>-&nbsp; &nbsp; &nbsp; Tiết kiệm năng lượng so với c&aacute;c thiết kế m&aacute;y thở kh&aacute;c tr&ecirc;n thị trường qua thiết kế piston,&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>-&nbsp; &nbsp; &nbsp; Tối ưu h&oacute;a linh kiện v&agrave; tự chủ trong kh&acirc;u chế tạo,</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>-&nbsp; &nbsp; &nbsp; &hellip;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"Máy thở dtu-VENT Ver2.0 hỗ trợ cả thở xâm nhập với chi phí dưới 50 triệu đồng\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/maytrotho8-2.jpg\" /></p>\r\n\r\n<p><em>TS. L&ecirc; Ho&agrave;ng Sinh với M&aacute;y thở dtu-VENT phi&ecirc;n bản mới nhất</em></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>M&aacute;y thở dtu-VENT Ver2.0&nbsp;</strong>tiếp tục n&acirc;ng cấp với nhiều t&iacute;nh năng mới m&agrave; ở phi&ecirc;n bản cũ chưa c&oacute; như:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>-&nbsp; &nbsp; &nbsp; Dung t&iacute;ch kh&iacute; tối đa của phi&ecirc;n bản Ver1.0 (Tidal volume) l&agrave; 450ml đ&atilde; được n&acirc;ng l&ecirc;n th&agrave;nh 750ml ở phi&ecirc;n bản mới,</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>-&nbsp; &nbsp; &nbsp; Tốc độ d&ograve;ng tối đa chỉ ở mức 30 l/min đ&atilde; được n&acirc;ng l&ecirc;n tới 120 l/min ở phi&ecirc;n bản Ver2.0,</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>-&nbsp; &nbsp; &nbsp; Duy tr&igrave; &aacute;p suất dương (PEEP) trong dải từ 0 đến 20 cmH2O (đảm bảo cho phổi kh&ocirc;ng bị co qu&aacute; mức),</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>-&nbsp; &nbsp; &nbsp; Điều chỉnh được phần trăm oxy (FiO2) từ 21% đến 100% (cung cấp đủ h&agrave;m</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>-&nbsp; &nbsp; &nbsp; lượng oxy cho c&aacute;c trường hợp bệnh nh&acirc;n kh&aacute;c nhau),</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>-&nbsp; &nbsp; &nbsp; Giảm tần suất tiếng ồn khi bơm kh&iacute;, độ ồn của m&aacute;y thở nhỏ hơn 35db,</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>-&nbsp; &nbsp; &nbsp; Tạo ẩm v&agrave; ổn định nhiệt độ kh&iacute; khi đi v&agrave;o cơ thể,</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>-&nbsp; &nbsp; &nbsp; Thiết lập c&aacute;c cảnh b&aacute;o đảm bảo an to&agrave;n tối đagiữa m&aacute;y thở với c&aacute;c phần mềm điều khiển v&agrave; gi&aacute;m s&aacute;t,li&ecirc;n quan đến c&aacute;c vấn đề hay sự cố như:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>o&nbsp; &nbsp;&Aacute;p suất cao,</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>o&nbsp; &nbsp;&Aacute;p suất thấp,</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>o&nbsp; &nbsp;Dung t&iacute;ch kh&iacute; kh&ocirc;ng đủ,</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>o&nbsp; &nbsp;Lỗi nguồn điện,</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>o&nbsp; &nbsp;&hellip;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Đặc biệt,<strong>&nbsp;dtu-VENT Ver2.0</strong>&nbsp;đ&atilde; c&oacute; điều khiển/hiển thị cảm ứng v&agrave; c&oacute; thể gi&aacute;m s&aacute;t từ xa với đầy đủ c&aacute;c chức năng th&ocirc;ng qua:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>-&nbsp; &nbsp; &nbsp; Phần mềm tr&ecirc;n M&aacute;y thở, v&agrave;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>-&nbsp; &nbsp; &nbsp; Phần mềm tr&ecirc;n M&aacute;y chủ</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>C&aacute;c tiện &iacute;ch mới n&agrave;y cho ph&eacute;p b&aacute;c sĩ, y t&aacute; tr&aacute;nh tiếp x&uacute;c gần thường xuy&ecirc;n với bệnh nh&acirc;n, v&agrave; c&oacute; thể gi&aacute;m s&aacute;t được t&igrave;nh trạng của bệnh nh&acirc;n một c&aacute;ch li&ecirc;n tục.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"Máy thở dtu-VENT Ver2.0 hỗ trợ cả thở xâm nhập với chi phí dưới 50 triệu đồng\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/maytrotho9-62.jpg\" /></p>\r\n\r\n<p><em>Nh&oacute;m nghi&ecirc;n cứu M&aacute;y thở DTU-Vent của ĐH Duy T&acirc;n</em></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>M&aacute;y thở dtu-VENT Ver 2.0&nbsp;</strong>c&oacute; 10 chế độ được c&agrave;i đặt sẵn th&ocirc;ng qua ước lượng chiều cao của bệnh nh&acirc;n, gi&uacute;p cho nh&acirc;n vi&ecirc;n y tế tiết kiệm thời gian v&agrave; dễ d&agrave;ng vận h&agrave;nh m&aacute;y. M&aacute;y c&oacute; thể chạy được ở nhiều chế độ kh&aacute;c nhau như:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>-&nbsp; &nbsp; &nbsp; Kiểm so&aacute;t &aacute;p suất (pressure control),</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>-&nbsp; &nbsp; &nbsp; Kiểm so&aacute;t thể t&iacute;ch (volume control), v&agrave;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>-&nbsp; &nbsp; &nbsp; Cung cấp hỗ trợ h&ocirc; hấp cần thiết v&agrave; tức th&igrave; (assist control) theo c&aacute;c chỉ số sống c&ograve;n của người bệnh.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Đặc biệt, đội ngũ nghi&ecirc;n cứu nhận thức r&otilde; nhu cầu &ldquo;di động&rdquo; của m&aacute;y thở trong c&aacute;c t&igrave;nh huống cấp cứu khẩn cấp ngo&agrave;i thực địa, hoặc trong cả bệnh viện l&uacute;c bị ngắt điện n&ecirc;n đ&atilde; thiết kế m&aacute;y nhỏ gọn, c&oacute; thể sử dụng pin dự ph&ograve;ng đảm bảo hoạt động li&ecirc;n tục trong 3 giờ đồng hồ.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Sự chủ động về c&ocirc;ng nghệ cho ph&eacute;p sản phẩm &ldquo;Made in Vietnam&rdquo; n&agrave;y thật sự l&agrave; điểm s&aacute;ng trong lựa chọn thiết kế, độc lập v&agrave; linh hoạt về phần mềm v&agrave; t&iacute;ch hợp, đ&aacute;p ứng được c&aacute;c y&ecirc;u cầu sản xuất h&agrave;ng loạt trong trường hợp c&oacute; c&aacute;c diễn biến phức tạp của dịch COVID-19. V&agrave; cũng ch&iacute;nh sự chủ động n&agrave;y cho ph&eacute;p sản phẩm m&aacute;y thở &ldquo;2 trong 1&rdquo; n&agrave;y c&oacute; một mức chi ph&iacute; sản xuất hợp l&yacute;, dưới 50 triệu đồng.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>TS. L&ecirc; Ho&agrave;ng Sinh - Trưởng nh&oacute;m Nghi&ecirc;n cứu DTU-VENT, cho biết:<em>&nbsp;&ldquo;Ngo&agrave;i những t&iacute;nh năng mới được thiết kế trong dtu-VENT Ver2.0 gi&uacute;p hỗ trợ tối đa cho c&ocirc;ng t&aacute;c chữa trị cho c&aacute;c bệnh nh&acirc;n COVID-19, m&aacute;y thở c&ograve;n được thiết kế mới ở cấu tạo b&ecirc;n ngo&agrave;i đảm bảo t&iacute;nh thẩm mỹ v&agrave; độ ổn định cao trong vận h&agrave;nh. Hiện tại, nh&oacute;m đang trong qu&aacute; tr&igrave;nh thẩm định v&agrave; xin ph&eacute;p,nhằm sớm đưa v&agrave;o sản xuất đại tr&agrave;, kịp thời cung cấp cho c&aacute;c cơ sở y tế tr&ecirc;n cả nước với mức gi&aacute; phải chăng&rdquo;.</em></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Hỗ trợ tối đa hoạt động nghi&ecirc;n cứu của nh&oacute;m thiết kế M&aacute;y thở DTU-VENT, TS. L&ecirc; Nguy&ecirc;n Bảo - Hiệu trưởng ĐH Duy T&acirc;n, chia sẻ:&nbsp;<em>&ldquo;Hiện nay, nh&agrave; trường đang c&oacute; thế mạnh trong đ&agrave;o tạo c&aacute;c ng&agrave;nh thuộc lĩnh vực Điện tử, C&ocirc;ng nghệ Th&ocirc;ng tin, Y học,&hellip; Mục ti&ecirc;u của nh&agrave; trường l&agrave; đ&agrave;o tạo gắn liền với nghi&ecirc;n cứu thực nghiệm. Bởi vậy, tr&ecirc;n nền tảng nội lực sẵn c&oacute;, nh&agrave; trường đ&atilde; khuyến kh&iacute;ch c&aacute;c c&aacute;n bộ, giảng vi&ecirc;n, sinh vi&ecirc;n h&igrave;nh th&agrave;nh c&aacute;c &yacute; tưởng, nghi&ecirc;n cứu chế tạo c&aacute;c sản phẩm mang t&iacute;nh ứng dụng cao phục vụ cộng đồng. M&aacute;y thở DTU-VENT ch&iacute;nh l&agrave; một trong số rất nhiều c&aacute;c sản phẩm m&agrave; Đại học Duy T&acirc;n đ&atilde; v&agrave; đang nghi&ecirc;n cứu v&agrave; chế tạo th&agrave;nh c&ocirc;ng. C&aacute;c sản phẩm l y tế đ&atilde; th&agrave;nh c&ocirc;ng trước đ&acirc;y của trường c&oacute;:</em></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><em>-&nbsp; &nbsp; &nbsp; Ứng dụng 3D Giải phẫu to&agrave;n bộ Cơ thể Người v&agrave; c&aacute;c Hệ li&ecirc;n quan (cho Y học), gi&agrave;nh giải Nhất Giải thưởng Nh&acirc;n t&agrave;i Đất Việt 2017,</em></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><em>-&nbsp; &nbsp; &nbsp; eCPR - &ldquo;Ứng dụng c&ocirc;ng nghệ m&ocirc; phỏng 3D x&acirc;y dựng hệ thống huấn luyện hồi sức tim phổi v&igrave; cộng đồng&rdquo;, gi&agrave;nh được Danh hiệu Sao Khu&ecirc; 2020,</em></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><em>-&nbsp; &nbsp; &nbsp; &hellip;</em></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><em>Việc thiết kế v&agrave; đưa&nbsp;<strong>M&aacute;y thở DTU-VENT&nbsp;</strong>v&agrave;o sử dụng sẽ l&agrave; hoạt động c&oacute; &yacute; nghĩa v&agrave; thiết thực để g&oacute;p phần c&ugrave;ng Tp. Đ&agrave; Nẵng n&oacute;i ri&ecirc;ng v&agrave; Ch&iacute;nh phủ Việt Nam n&oacute;i chung ph&ograve;ng chống v&agrave; đẩy l&ugrave;i dịch bệnh COVID-19.&rdquo;</em></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<table border=\"1\" cellpadding=\"0\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<p><strong>ĐẠI HỌC DUY T&Acirc;N</strong></p>\r\n\r\n			<p>&nbsp;</p>\r\n\r\n			<p>-&nbsp; 1 trong 500 Đại học Tốt nhất Ch&acirc;u &Aacute; năm 2020 theo QS Ranking.</p>\r\n\r\n			<p>&nbsp;</p>\r\n\r\n			<p>-&nbsp; Đại học thứ 2 của Việt Nam đạt chuẩn kiểm định ABET của Mỹ.</p>\r\n\r\n			<p>&nbsp;</p>\r\n\r\n			<p>-&nbsp; Xếp thứ 3/4 đại học của Việt Nam (thứ 1854 thế giới) tr&ecirc;n bảng xếp hạng c&aacute;c Đại học tr&ecirc;n Thế giới - CWUR.</p>\r\n\r\n			<p>&nbsp;</p>\r\n\r\n			<p>-&nbsp; Xếp thứ 3/8 đại học của Việt Nam (thứ 1147 thế giới) tr&ecirc;n bảng xếp hạng theo Học thuật - URAP.</p>\r\n\r\n			<p>&nbsp;</p>\r\n\r\n			<p>-&nbsp; Xếp thứ 2 của Việt Nam tr&ecirc;n bảng xếp hạng Nature Index 2019.</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><em>(Nguồn:https://www.tienphong.vn/giao-duc/may-tho-dtuvent-ver20-ho-tro-ca-tho-xam-nhap-voi-chi-phi-duoi-50-trieu-dong-1650257.tpo?fbclid=IwAR0q_IQPWZA6ORVMnANobBnL4VhSJmmN5YtIz2QXCR0vZET9uKHhJw6CXVc</em></p>\r\n\r\n<p><em><a href=\"https://thanhnien.vn/giao-duc/may-tho-dtu-vent-ver20-ho-tro-ca-tho-xam-nhap-duoi-50-trieu-dong-1217404.html\">https://thanhnien.vn/giao-duc/may-tho-dtu-vent-ver20-ho-tro-ca-tho-xam-nhap-duoi-50-trieu-dong-1217404.html</a>)</em></p>\r\n', 1, 'Máy thở dtu-VENT Ver2.0 hỗ trợ cả thở xâm nhập với chi phí dưới 50 triệu đồng', 'maytrotho7-40.jpg', '2020-11-18 02:47:06'),
(8, '<p>Chiều ng&agrave;y 13/11/2020,&nbsp;<strong>Trường C&ocirc;ng nghệ thuộc Đại học Duy T&acirc;n</strong>&nbsp;đ&atilde; phối hợp với Sở Gi&aacute;o dục &amp; Đ&agrave;o tạo tỉnh Quảng Ng&atilde;i tổ chức lớp&nbsp;<strong>Tập huấn về Gi&aacute;o dục STEM</strong>&nbsp;cho gi&aacute;o vi&ecirc;n m&ocirc;n Tin học của c&aacute;c trường THPT tr&ecirc;n địa b&agrave;n tỉnh Quảng Ng&atilde;i. Đ&acirc;y cũng l&agrave; cơ hội để giảng vi&ecirc;n của Đại học Duy T&acirc;n v&agrave; c&aacute;c trường THPT tr&ecirc;n địa b&agrave;n khu vực miền Trung v&agrave; T&acirc;y Nguy&ecirc;n c&oacute; c&ugrave;ng đam m&ecirc; về nghi&ecirc;n cứu khoa học gặp gỡ, trao đổi kiến thức v&agrave; kinh nghiệm.</p>\r\n', '<p>Chiều ng&agrave;y 13/11/2020,&nbsp;<strong>Trường C&ocirc;ng nghệ thuộc Đại học Duy T&acirc;n</strong>&nbsp;đ&atilde; phối hợp với Sở Gi&aacute;o dục &amp; Đ&agrave;o tạo tỉnh Quảng Ng&atilde;i tổ chức lớp&nbsp;<strong>Tập huấn về Gi&aacute;o dục STEM</strong>&nbsp;cho gi&aacute;o vi&ecirc;n m&ocirc;n Tin học của c&aacute;c trường THPT tr&ecirc;n địa b&agrave;n tỉnh Quảng Ng&atilde;i. Đ&acirc;y cũng l&agrave; cơ hội để giảng vi&ecirc;n của Đại học Duy T&acirc;n v&agrave; c&aacute;c trường THPT tr&ecirc;n địa b&agrave;n khu vực miền Trung v&agrave; T&acirc;y Nguy&ecirc;n c&oacute; c&ugrave;ng đam m&ecirc; về nghi&ecirc;n cứu khoa học gặp gỡ, trao đổi kiến thức v&agrave; kinh nghiệm.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/giangvienduytanhuongdanlaprapvalaptrinhrobot-66.jpg\" /></p>\r\n\r\n<p><em>C&aacute;n bộ Đại học Duy T&acirc;n hướng dẫn lắp r&aacute;p v&agrave; lập tr&igrave;nh Robot</em></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>STEM l&agrave; một chương tr&igrave;nh giảng dạy dựa tr&ecirc;n &yacute; tưởng trang bị cho người học những kiến thức, kỹ năng li&ecirc;n quan đến c&aacute;c lĩnh vực khoa học, c&ocirc;ng nghệ, kỹ thuật v&agrave; to&aacute;n học theo c&aacute;ch tiếp cận li&ecirc;n m&ocirc;n (interdisciplinary) v&agrave; qua đ&oacute;, người học c&oacute;&nbsp; thể vận dụng để giải quyết c&aacute;c vấn đề trong cuộc sống h&agrave;ng ng&agrave;y. Trong dạy học ở trường phổ th&ocirc;ng,<strong>&nbsp;Gi&aacute;o dục STEM</strong>&nbsp;c&oacute; rất nhiều ưu điểm như gi&uacute;p cho học sinh vừa c&oacute; được kiến thức vừa h&igrave;nh th&agrave;nh v&agrave; ph&aacute;t triển được năng lực giải quyết vấn đề, ph&aacute;t triển được tư duy s&aacute;ng tạo của học sinh.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&Ocirc;ng Đặng Văn Th&agrave;nh - Chuy&ecirc;n vi&ecirc;n ph&ograve;ng Gi&aacute;o dục Trung học, Sở Gi&aacute;o dục &amp; Đ&agrave;o tạo tỉnh Quảng Ng&atilde;i cho biết:&nbsp;<em>&ldquo;Sở Gi&aacute;o dục &amp; Đ&agrave;o tạo tỉnh Quảng Ng&atilde;i đ&atilde; c&oacute; cơ hội phối hợp với Đại học Duy T&acirc;n trong tổ chức cuộc thi&nbsp;<strong>Khoa học Kỹ thuật&nbsp;</strong>cho học sinh, ch&uacute;ng t&ocirc;i đ&aacute;nh gi&aacute; rất cao sự nhiệt t&igrave;nh v&agrave; năng lực nghi&ecirc;n cứu khoa học của nh&agrave; trường. Bởi vậy, th&ocirc;ng qua lớp bồi dưỡng n&agrave;y, ch&uacute;ng t&ocirc;i mong muốn c&oacute; th&ecirc;m nhiều hoạt động giữa 2 đơn vị để thắt chặt hơn nữa mối quan hệ hợp t&aacute;c cũng như tạo điều kiện cho c&aacute;c gi&aacute;o vi&ecirc;n Tin học của tỉnh Quảng Ng&atilde;i n&acirc;ng cao được kiến thức chuy&ecirc;n m&ocirc;n, c&oacute; cơ hội tiếp cận được những c&ocirc;ng nghệ mới để ứng dụng v&agrave; g&oacute;p phần mang lại hiệu quả hơn nữa trong giảng dạy.&rdquo;</em></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><em><img alt=\"\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/doangiaovienthpttinhquangngaithamquandaihocduytan-9.jpg\" /></em></p>\r\n\r\n<p><em>Đo&agrave;n gi&aacute;o vi&ecirc;n Tin học c&aacute;c trường THPT tỉnh Quảng Ng&atilde;i tham quan Đại học Duy T&acirc;n</em></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Trong buổi tập huấn, c&aacute;c c&aacute;n bộ v&agrave; giảng vi&ecirc;n của&nbsp;<strong>Đại học Duy T&acirc;n</strong>&nbsp;đ&atilde; cung cấp cho c&aacute;c gi&aacute;o vi&ecirc;n Tin học c&aacute;c trường THPT tỉnh Quảng Ng&atilde;i những th&ocirc;ng tin về qu&aacute; tr&igrave;nh thực hiện một dự &aacute;n&nbsp;<strong>Khoa học - Kỹ thuật</strong>: từ C&aacute;ch tự lập sổ tay khoa học, Lựa chọn chủ đề, X&acirc;y dựng kế hoạch nghi&ecirc;n cứu, Viết b&aacute;o c&aacute;o,... cho đến Tiến h&agrave;nh th&iacute; nghiệm, Ph&acirc;n t&iacute;ch dữ liệu, Sữa chữa v&agrave; ho&agrave;n thiện poster,...&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>B&ecirc;n cạnh đ&oacute;, c&aacute;c gi&aacute;o vi&ecirc;n của tỉnh Quảng Ng&atilde;i tham dự lớp&nbsp;<strong>tập huấn</strong>&nbsp;cũng được cung cấp t&agrave;i liệu, hướng dẫn cơ bản về lắp r&aacute;p v&agrave; lập tr&igrave;nh điều khiển Robot. Cụ thể, c&aacute;c c&aacute;n bộ v&agrave; giảng vi&ecirc;n&nbsp;<strong>Trường C&ocirc;ng nghệ</strong>&nbsp;đ&atilde; hướng dẫn từng bước c&agrave;i đặt, kiểm tra v&agrave; hướng dẫn sử dụng Arduino IDE; Hướng dẫn lập tr&igrave;nh điều khiển động cơ DC sử dụng Arduino v&agrave; module L298D; Kết nối v&agrave; kiểm tra module Bluetooth HC05 - Arduino.</p>\r\n\r\n<p>&nbsp;</p>\r\n', 1, 'Đại học Duy Tân tổ chức Tập huấn về Giáo dục STEM cho Giáo viên Tin học tỉnh Quảng Ngãi', 'giangvienduytanhuongdanlaprapvalaptrinhrobot-66.jpg', '2020-11-18 02:47:57'),
(9, '<p>Trong danh s&aacute;ch c&aacute;c nh&agrave; khoa học c&oacute; ảnh hưởng nhất thế giới, Trường Đại học T&ocirc;n Đức Thắng v&agrave; Trường&nbsp;<a href=\"https://duytan.edu.vn/\"><strong>Đại học Duy T&acirc;n</strong></a>&nbsp;dẫn đầu về số lượng v&agrave; vượt trội so với c&aacute;c trường đại học ở Việt Nam.</p>\r\n', '<p>Trong danh s&aacute;ch c&aacute;c nh&agrave; khoa học c&oacute; ảnh hưởng nhất thế giới, Trường Đại học T&ocirc;n Đức Thắng v&agrave; Trường&nbsp;<a href=\"https://duytan.edu.vn/\"><strong>Đại học Duy T&acirc;n</strong></a>&nbsp;dẫn đầu về số lượng v&agrave; vượt trội so với c&aacute;c trường đại học ở Việt Nam.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Tạp ch&iacute; PLoS Biology của Mỹ vừa c&ocirc;ng bố danh s&aacute;ch 100.000 nh&agrave; khoa học c&oacute; ảnh hưởng nhất thế giới.</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Năm ngo&aacute;i, Tạp ch&iacute; PLoS Biology cũng đ&atilde; c&ocirc;ng bố danh s&aacute;ch top 100.000 dựa v&agrave;o dữ liệu trắc lượng khoa học t&iacute;nh tới năm 2018.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Năm nay, họ cập nhật dữ liệu tới năm 2019 để đưa ra danh s&aacute;ch mới, bao gồm top 100.000 nh&agrave; khoa học xếp theo th&agrave;nh tựu sự nghiệp v&agrave; top 100.000 nh&agrave; khoa học c&oacute; ảnh hưởng nhất thế giới.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>C&aacute;c ti&ecirc;u ch&iacute; được thống k&ecirc; để xếp hạng gồm c&oacute;: Số b&agrave;i b&aacute;o c&ocirc;ng bố t&iacute;nh từ năm 1960-2019; Số lần tr&iacute;ch dẫn t&iacute;nh từ năm 1996-2019; Chỉ số H (chỉ số đo lường ảnh hưởng) sau khi đ&atilde; loại trừ số tự tr&iacute;ch dẫn; Chỉ số H sau khi đ&atilde; điều chỉnh cho nhiều t&aacute;c giả v&agrave; loại trừ tự tr&iacute;ch dẫn; Tỉ lệ tự tr&iacute;ch dẫn.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>T&aacute;c giả của c&ocirc;ng bố l&agrave; nh&oacute;m Metrics của Gi&aacute;o sư John Ioannidis v&agrave; c&aacute;c cộng sự thuộc Đại học Stanford. Nh&oacute;m t&aacute;c giả đ&atilde; d&ugrave;ng cơ sở dữ liệu của Scopus từ năm 1960 đến năm 2019 trong 7 triệu nh&agrave; khoa học v&agrave; lọc ra top 100.000 người m&agrave; c&aacute;c c&ocirc;ng tr&igrave;nh nghi&ecirc;n cứu của họ được đồng nghiệp tr&iacute;ch dẫn nhiều nhất.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Tăng so với năm ngo&aacute;i</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Ở cả hai nh&oacute;m xếp hạng của PLoS Biology đều c&oacute; c&aacute;c nh&agrave; khoa học l&agrave; người Việt sinh sống v&agrave; l&agrave;m việc trong nước; người c&oacute; gốc Việt (nhưng sinh sống v&agrave; c&ocirc;ng t&aacute;c ở nước ngo&agrave;i). Đ&aacute;ng ch&uacute; &yacute;, c&oacute; nhiều nh&agrave; khoa học nước ngo&agrave;i nhưng c&oacute; địa chỉ c&ocirc;ng t&aacute;c tại c&aacute;c trường ĐH ở Việt Nam.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Theo thống k&ecirc;, trong top 100.000 nh&agrave; khoa học xếp theo th&agrave;nh tựu sự nghiệp c&oacute; 55 người Việt, người c&oacute; gốc Việt v&agrave; nh&agrave; khoa học nước ngo&agrave;i nhưng địa chỉ c&ocirc;ng t&aacute;c ở Việt Nam. Tuy nhi&ecirc;n, chỉ c&oacute; 2 nh&agrave; khoa học trong nước nằm trong danh s&aacute;ch n&agrave;y l&agrave; GS Nguyễn Xu&acirc;n H&ugrave;ng (Trường ĐH C&ocirc;ng nghệ TP.HCM), hạng 65.925 thế giới v&agrave; GS Nguyễn Đ&igrave;nh Đức (ĐH Quốc gia H&agrave; Nội) hạng 94.738 thế giới.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"Trường đại học nào dẫn đầu Việt Nam về số nhà khoa học ảnh hưởng nhất thế giới?\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/nckh4-97.jpg\" /></p>\r\n\r\n<p><img alt=\"Trường đại học nào dẫn đầu Việt Nam về số nhà khoa học ảnh hưởng nhất thế giới?\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/nckh3-7.jpg\" /></p>\r\n\r\n<p><em>55 nh&agrave; khoa học người Việt, người c&oacute; gốc Việt v&agrave; người nước ngo&agrave;i c&oacute; địa chỉ l&agrave;m việc ở Việt Nam nằm trong top 100.000 nh&agrave; khoa học c&oacute; ảnh hưởng nhất thế giới theo th&agrave;nh tựu sự nghiệp (Ảnh: GS Nguyễn Văn Tuấn hỗ trợ thống k&ecirc;)</em></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Trong nh&oacute;m xếp hạng 100.000 nh&agrave; khoa học ảnh hưởng nhất t&iacute;nh theo dữ liệu đến năm 2019, c&oacute; 88 nh&agrave; khoa học người Việt, người c&oacute; gốc Việt v&agrave; nh&agrave; khoa học c&oacute; địa chỉ c&ocirc;ng t&aacute;c ở Việt Nam.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>So với năm ngo&aacute;i, số lượng c&aacute;c nh&agrave; khoa học đang c&ocirc;ng t&aacute;c tại Việt Nam c&oacute; t&ecirc;n trong danh s&aacute;ch tăng đ&aacute;ng kể.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Trong số c&aacute;c khoa học người Việt, ở Việt Nam, người c&oacute; thứ hạng cao nhất l&agrave; GS. Nguyễn Đ&igrave;nh Đức (ĐH Quốc gia H&agrave; Nội) &ndash; hạng 5.798 thế giới; GS. Nguyễn Xu&acirc;n H&ugrave;ng (Trường ĐH C&ocirc;ng nghệ TP.HCM) &ndash; hạng 6.996 v&agrave; PGS. L&ecirc; Ho&agrave;ng Sơn (ĐH Quốc gia H&agrave; Nội) &ndash; hạng 9.261.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Trong danh s&aacute;ch, c&ograve;n c&oacute; nhiều nh&agrave; nghi&ecirc;n cứu đang l&agrave;m việc ở Việt Nam như: Nguyễn Đức Khương (ĐH Quốc gia H&agrave; Nội); Phan Thanh Sơn Nam (để địa chỉ Trường ĐH C&ocirc;ng nghệ TP.HCM); B&ugrave;i Diệu Ti&ecirc;n, Phạm Viết Thanh, Nguyễn Thời Trung, Nguyễn Thị Kim Oanh, Th&aacute;i Ho&agrave;ng Chiến, Đinh Quang Hải (Trường ĐH T&ocirc;n Đức Thắng); Trần Phan Lam Sơn, Phạm Th&aacute;i B&igrave;nh, Trần Nguyễn Hải, Trần Ngọc H&acirc;n, Ho&agrave;ng Nhật Đức (Trường ĐH Duy T&acirc;n); Ho&agrave;ng Anh Tuấn (Trường ĐH Giao th&ocirc;ng Vận tải TP.HCM); V&otilde; Xu&acirc;n Vinh (Trường ĐH Kinh tế TP.HCM); Nguyễn Văn Hiếu (Trường ĐH Phenikaa); Tran, Phong D (Trường ĐH B&aacute;ch khoa H&agrave; Nội).</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Tuy nhi&ecirc;n, nếu t&iacute;nh tr&ecirc;n chỉ số H (chỉ số đo lường ảnh hưởng), xếp hạng sau khi loại trừ tự tr&iacute;ch dẫn th&igrave; ở Việt Nam, GS Nguyễn Xu&acirc;n H&ugrave;ng (Trường ĐH C&ocirc;ng nghệ TP.HCM) đứng đầu với chỉ số H l&agrave; 44; tiếp theo GS Nguyễn Đ&igrave;nh Đức (ĐH Quốc gia H&agrave; Nội) với chỉ số H l&agrave; 26 v&agrave; PGS L&ecirc; Ho&agrave;ng Sơn (ĐH Quốc gia H&agrave; Nội) với chỉ số H l&agrave; 20.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"Trường đại học nào dẫn đầu Việt Nam về số nhà khoa học ảnh hưởng nhất thế giới?\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/nckh2-81.jpg\" /></p>\r\n\r\n<p><img alt=\"Trường đại học nào dẫn đầu Việt Nam về số nhà khoa học ảnh hưởng nhất thế giới?\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/nckh5-83.jpg\" /></p>\r\n\r\n<p><em>88 nh&agrave; khoa học người Việt, người c&oacute; gốc Việt v&agrave; người nước ngo&agrave;i c&oacute; địa chỉ l&agrave;m việc ở Việt Nam nằm trong top 100.000 nh&agrave; khoa học c&oacute; ảnh hưởng nhất thế giới năm 2019 (Ảnh: GS Nguyễn Văn Tuấn hỗ trợ thống k&ecirc;)</em></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Nếu t&iacute;nh chung cả c&aacute;c nh&agrave; khoa học gốc Việt đang l&agrave;m việc tại nước ngo&agrave;i th&igrave; GS Đặng Văn Ch&iacute; c&oacute; chỉ số H cao nhất (84), kế tiếp l&agrave; GS Nguyễn Văn Tuấn (83), GS Nguyễn Sơn B&igrave;nh, ĐH Northwestern (80), GS Trần Tịnh Hiền, nh&oacute;m nghi&ecirc;n cứu l&acirc;m s&agrave;ng Oxford tại Việt Nam (73).</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Nếu xếp theo chuy&ecirc;n ng&agrave;nh, GS Đ&agrave;m Thanh Sơn được xếp hạng 78 trong chuy&ecirc;n ng&agrave;nh Vật l&yacute; hạt nh&acirc;n, GS Vũ H&agrave; Văn xếp hạng 197 trong chuy&ecirc;n ng&agrave;nh To&aacute;n học v&agrave; T&iacute;nh to&aacute;n.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Một số nh&agrave; khoa học kh&aacute;c cũng được xếp hạng cao như GS Nguyễn Minh Thọ (hạng 127 trong ng&agrave;nh Ho&aacute; học), GS Nguyễn Nam Trung (hạng 119 trong chuy&ecirc;n ng&agrave;nh C&ocirc;ng nghệ nano)...</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Ngo&agrave;i ra, nhiều nh&agrave; khoa học l&agrave; người Việt, người c&oacute; gốc Việt tuy kh&ocirc;ng nằm trong tốp 100.000 người ảnh hưởng nhất năm hay theo th&agrave;nh tựu sự nghiệp nhưng nằm trong tốp 2% những nh&agrave; khoa học nổi bật về chuy&ecirc;n ng&agrave;nh.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Trường ĐH T&ocirc;n Đức Thắng v&agrave; Trường ĐH Duy T&acirc;n dẫn đầu về số lượng</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Ở Việt Nam, Trường ĐH T&ocirc;n Đức Thắng v&agrave;<strong>&nbsp;Trường ĐH Duy T&acirc;n</strong>&nbsp;c&oacute; nhiều nh&agrave; nghi&ecirc;n cứu c&oacute; t&ecirc;n trong bảng xếp hạng.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"Trường đại học nào dẫn đầu Việt Nam về số nhà khoa học ảnh hưởng nhất thế giới?\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/nckh1-11.jpg\" /></p>\r\n\r\n<p><em>Trường ĐH T&ocirc;n Đức Thắng v&agrave; Trường ĐH Duy T&acirc;n đứng đầu so với c&aacute;c trường đại học ở VN về số nh&agrave; khoa học c&oacute; trong bảng xếp hạng của PLoS Biology</em></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Cụ thể, trong danh s&aacute;ch nh&agrave; khoa học c&oacute; th&agrave;nh tựu trọn đời c&oacute; 6 người để địa chỉ l&agrave;m việc tại Trường ĐH T&ocirc;n Đức Thắng (5 người nước ngo&agrave;i v&agrave; 1 người gốc Việt l&agrave; GS Nguyễn Minh Thọ).</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>C&ograve;n trong danh s&aacute;ch 100.000 nh&agrave; khoa học c&oacute; ảnh hưởng nhất thế giới theo số liệu t&iacute;nh đến năm 2019, 31 người để địa chỉ l&agrave;m việc ở Trường ĐH T&ocirc;n Đức Thắng. Tuy nhi&ecirc;n, c&oacute; 24 nh&agrave; khoa học l&agrave; người nước ngo&agrave;i, 1 nh&agrave; khoa học gốc Việt (GS Nguyễn Minh Thọ), 6 người đang l&agrave;m việc tại trường.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>C&oacute; 11 người để địa chỉ ở Trường ĐH Duy T&acirc;n, trong đ&oacute; c&oacute; 6 nh&agrave; khoa học nước ngo&agrave;i, 5 nh&agrave; khoa học người Việt hiện đang l&agrave;m việc tại trường.</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><em>(Nguồn:https://vietnamnet.vn/vn/giao-duc/khoa-hoc/nguoi-viet-trong-danh-sach-cac-nha-khoa-hoc-anh-huong-nhat-the-gioi-687596.html?fbclid=IwAR32KtbHIkhkmC_YI0oVOIDaDC1A_hzbfJkUBamDdEyeGtn8zpTz6Hazv78)</em></p>\r\n', 1, 'Trường đại học nào dẫn đầu Việt Nam về số nhà khoa học ảnh hưởng nhất thế giới?', 'IMG_6783-55.jpg', '2020-11-18 06:20:17'),
(10, '<p>Ng&agrave;y hội Khai giảng năm học 2020 - 2021 ch&iacute;nh l&agrave; ng&agrave;y vui đ&aacute;ng nhớ nhất trong những ng&agrave;y đầu trở th&agrave;nh&nbsp;<strong>T&acirc;n Sinh vi&ecirc;n Đại học Duy T&acirc;n</strong>. D&ugrave; tiết trời kh&aacute; đỏng đảnh l&uacute;c mưa nặng hạt, l&uacute;c bừng hửng nắng nhưng h&agrave;ng ngh&igrave;n DTUers vẫn &ldquo;quẩy&rdquo; hết m&igrave;nh c&ugrave;ng chuỗi c&aacute;c hoạt động của&nbsp;<strong>Ng&agrave;y hội ch&agrave;o mừng năm học mới</strong>.</p>\r\n', '<p>Ng&agrave;y hội Khai giảng năm học 2020 - 2021 ch&iacute;nh l&agrave; ng&agrave;y vui đ&aacute;ng nhớ nhất trong những ng&agrave;y đầu trở th&agrave;nh&nbsp;<strong>T&acirc;n Sinh vi&ecirc;n Đại học Duy T&acirc;n</strong>. D&ugrave; tiết trời kh&aacute; đỏng đảnh l&uacute;c mưa nặng hạt, l&uacute;c bừng hửng nắng nhưng h&agrave;ng ngh&igrave;n DTUers vẫn &ldquo;quẩy&rdquo; hết m&igrave;nh c&ugrave;ng chuỗi c&aacute;c hoạt động của&nbsp;<strong>Ng&agrave;y hội ch&agrave;o mừng năm học mới</strong>.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><em><img alt=\"DTUers Vui chơi Hết mình trong Ngày hội Khai giảng Năm học mới\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/2G6A5881c-67.jpg\" />&nbsp;&nbsp;</em></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><em><img alt=\"DTUers Vui chơi Hết mình trong Ngày hội Khai giảng Năm học mới\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/2G6A5882c-5.jpg\" /></em></p>\r\n\r\n<p><em>Sau tiếng trống khai giảng năm học mới, kh&ocirc;ng kh&iacute; của ng&agrave;y hội b&ugrave;ng nổ&nbsp;</em></p>\r\n\r\n<p><em>với phần mở m&agrave;n l&agrave; tiết mục nhảy Hip hop s&ocirc;i động v&agrave; hiện đại</em></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;&nbsp;<img alt=\"DTUers Vui chơi Hết mình trong Ngày hội Khai giảng Năm học mới\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/IMG_9359c-26.jpg\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"DTUers Vui chơi Hết mình trong Ngày hội Khai giảng Năm học mới\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/IMG_9378c-35.jpg\" /></p>\r\n\r\n<p><em>Ngo&agrave;i trời đang mưa nhỉ?. Vậy th&igrave; h&atilde;y lắng đọng v&agrave; bắt nhịp c&ugrave;ng C&acirc;u Lạc bộ Acoustic</em></p>\r\n\r\n<p><em>với ca kh&uacute;c &ldquo;Vết mưa&rdquo; nh&eacute;! Ho&agrave;i niệm một ch&uacute;t với mưa v&agrave; rồi lại phi&ecirc;u</em></p>\r\n\r\n<p><em>với &ldquo;24h&rdquo;, &ldquo;H&agrave; Nội tr&agrave; đ&aacute; vỉa h&egrave;&rdquo;, &ldquo;V&igrave; anh vẫn&rdquo;,...</em></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp; &nbsp;&nbsp;<img alt=\"DTUers Vui chơi Hết mình trong Ngày hội Khai giảng Năm học mới\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/IMG_0416c-33.jpg\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"DTUers Vui chơi Hết mình trong Ngày hội Khai giảng Năm học mới\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/IMG_0563c-79.jpg\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"DTUers Vui chơi Hết mình trong Ngày hội Khai giảng Năm học mới\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/IMG_0585c-25.jpg\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"DTUers Vui chơi Hết mình trong Ngày hội Khai giảng Năm học mới\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/IMG_0523c-42.jpg\" /></p>\r\n\r\n<p><em>Vừa nghe nhạc vừa &ldquo;lượn&rdquo; một v&ograve;ng &ldquo;check in&rdquo;</em></p>\r\n\r\n<p><em>&nbsp;tại c&aacute;c gian h&agrave;ng đầy sắc m&agrave;u của ng&agrave;y hội n&agrave;o!</em></p>\r\n\r\n<p>&nbsp; &nbsp;&nbsp;</p>\r\n\r\n<p><img alt=\"DTUers Vui chơi Hết mình trong Ngày hội Khai giảng Năm học mới\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/IMG_0423c-48.jpg\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"DTUers Vui chơi Hết mình trong Ngày hội Khai giảng Năm học mới\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/IMG_0442c-18.jpg\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"DTUers Vui chơi Hết mình trong Ngày hội Khai giảng Năm học mới\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/IMG_0494c-41.jpg\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"DTUers Vui chơi Hết mình trong Ngày hội Khai giảng Năm học mới\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/IMG_0511c-32.jpg\" /></p>\r\n\r\n<p><em>Nắm tay nhau c&ugrave;ng nhảy sạp, nhấp thử một ch&uacute;t rượu cần T&acirc;y Nguy&ecirc;n,</em></p>\r\n\r\n<p><em>uống một ly tr&agrave; chanh giải kh&aacute;t&nbsp;</em><em>hay chia nhau một dĩa Kimbap, một hộp xo&agrave;i lắc&nbsp;</em></p>\r\n\r\n<p><em>c&oacute; lẽ l&agrave; trải nghiệm th&uacute; vị nhất của DTUers tại c&aacute;c gian h&agrave;ng</em></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp; &nbsp;&nbsp;<img alt=\"DTUers Vui chơi Hết mình trong Ngày hội Khai giảng Năm học mới\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/_O8A9739c-83.jpg\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"DTUers Vui chơi Hết mình trong Ngày hội Khai giảng Năm học mới\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/_O8A9913c-22.jpg\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"DTUers Vui chơi Hết mình trong Ngày hội Khai giảng Năm học mới\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/_O8A9917c-58.jpg\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"DTUers Vui chơi Hết mình trong Ngày hội Khai giảng Năm học mới\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/_O8A9927c-99.jpg\" /></p>\r\n\r\n<p><em>Flashmod c&oacute; lẽ l&agrave; phần thi được mong đợi nhất của ng&agrave;y hội. Tr&ecirc;n nền nhạc&nbsp;</em></p>\r\n\r\n<p><em>nhiều ca kh&uacute;c như: &ldquo;C&oacute; chắc đ&acirc;y l&agrave; y&ecirc;u&rdquo;, &ldquo;Người ơi người ở đừng về&rdquo;,...</em></p>\r\n\r\n<p><em>c&aacute;c đội nhảy flashmod xuất hiện đầy sắc m&agrave;u, lắc lư theo điệu nhạc&nbsp;</em></p>\r\n\r\n<p><em>v&agrave; h&ograve; reo phấn kh&iacute;ch</em></p>\r\n\r\n<p><em>&nbsp;&nbsp;</em></p>\r\n\r\n<p><img alt=\"DTUers Vui chơi Hết mình trong Ngày hội Khai giảng Năm học mới\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/2G6A5980c-1.jpg\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"DTUers Vui chơi Hết mình trong Ngày hội Khai giảng Năm học mới\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/_O8A9747c-70.jpg\" /></p>\r\n\r\n<p><em>Từ v&aacute;y &aacute;o trẻ trung năng động, quần &aacute;o b&agrave; ba giản dị hay trang phục</em></p>\r\n\r\n<p><em>thổ cẩm truyền thống&nbsp;</em><em>của c&aacute;c d&acirc;n tộc anh em,... c&aacute;c Khoa đ&atilde; c&oacute; những&nbsp;</em></p>\r\n\r\n<p><em>phần tr&igrave;nh diễn nhảy Flashmod thực sự &ldquo;m&atilde;n nh&atilde;n&rdquo;</em></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp; &nbsp;&nbsp;<img alt=\"DTUers Vui chơi Hết mình trong Ngày hội Khai giảng Năm học mới\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/IMG_0292c-76.jpg\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"DTUers Vui chơi Hết mình trong Ngày hội Khai giảng Năm học mới\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/IMG_0391c-96.jpg\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"DTUers Vui chơi Hết mình trong Ngày hội Khai giảng Năm học mới\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/IMG_0408c-83.jpg\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"DTUers Vui chơi Hết mình trong Ngày hội Khai giảng Năm học mới\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/IMG_0425c-98.jpg\" /></p>\r\n\r\n<p><em>Kho&aacute;c l&ecirc;n m&igrave;nh trang phục truyền thống của c&aacute;c d&acirc;n tộc trải d&agrave;i</em></p>\r\n\r\n<p><em>từ Bắc đến Nam, c&aacute;c đội thi đ&atilde; mang đến cho kh&aacute;n giả nhiều sự th&iacute;ch th&uacute;</em></p>\r\n\r\n<p><em>qua phần thi Thời trang &ldquo;Sắc m&agrave;u c&aacute;c d&acirc;n tộc&rdquo;</em></p>\r\n\r\n<p>&nbsp; &nbsp;&nbsp;</p>\r\n\r\n<p><img alt=\"DTUers Vui chơi Hết mình trong Ngày hội Khai giảng Năm học mới\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/IMG_0309c-14.jpg\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"DTUers Vui chơi Hết mình trong Ngày hội Khai giảng Năm học mới\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/IMG_0338c-76.jpg\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"DTUers Vui chơi Hết mình trong Ngày hội Khai giảng Năm học mới\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/IMG_0356c-13.jpg\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"DTUers Vui chơi Hết mình trong Ngày hội Khai giảng Năm học mới\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/IMG_0376c-50.jpg\" /></p>\r\n\r\n<p><em>Kết hợp th&ecirc;m những phụ kiện khăn cho&agrave;ng, chi&ecirc;ng, kh&egrave;n, lồng đ&egrave;n,...</em></p>\r\n\r\n<p><em>c&ugrave;ng phong th&aacute;i tr&igrave;nh diễn tự nhi&ecirc;n v&agrave; tự tin, c&aacute;c &ldquo;người mẫu&rdquo; DTU&nbsp;</em></p>\r\n\r\n<p><em>đ&atilde; tạo n&ecirc;n những phần thi sinh động v&agrave; v&ocirc; c&ugrave;ng hấp dẫn</em></p>\r\n\r\n<p>&nbsp; &nbsp;&nbsp;</p>\r\n\r\n<p><em><img alt=\"DTUers Vui chơi Hết mình trong Ngày hội Khai giảng Năm học mới\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/_O8A9576c-54.jpg\" /></em></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><em><img alt=\"DTUers Vui chơi Hết mình trong Ngày hội Khai giảng Năm học mới\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/_O8A9586c-76.jpg\" /></em></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><em><img alt=\"DTUers Vui chơi Hết mình trong Ngày hội Khai giảng Năm học mới\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/_O8A9615c-93.jpg\" /></em></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><em><img alt=\"DTUers Vui chơi Hết mình trong Ngày hội Khai giảng Năm học mới\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/_O8A9664c-14.jpg\" /></em></p>\r\n\r\n<p><em>Tiếng cười, tiếng n&oacute;i, tiếng h&ograve; reo cổ vũ kh&ocirc;ng ngớt của h&agrave;ng trăm, h&agrave;ng ngh&igrave;n</em></p>\r\n\r\n<p><em>kh&aacute;n giả như tiếp th&ecirc;m động lực cho c&aacute;c đội trong phần thi Team Building</em></p>\r\n\r\n<p>&nbsp;&nbsp;</p>\r\n\r\n<p><em><img alt=\"DTUers Vui chơi Hết mình trong Ngày hội Khai giảng Năm học mới\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/_O8A9636c-36.jpg\" /></em></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><em><img alt=\"DTUers Vui chơi Hết mình trong Ngày hội Khai giảng Năm học mới\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/_O8A9582c-17.jpg\" /></em></p>\r\n\r\n<p><em>Kh&ocirc;ng ngại mưa gi&oacute; v&agrave; với tinh thần đo&agrave;n kết đồng đội,</em></p>\r\n\r\n<p><em>&nbsp;đội h&igrave;nh Team Building của c&aacute;c khoa vẫn ch&aacute;y hết m&igrave;nh&nbsp;</em></p>\r\n\r\n<p><em>với từng tr&ograve; chơi v&agrave; ho&agrave;n th&agrave;nh xuất sắc c&aacute;c thử th&aacute;ch&nbsp;</em></p>\r\n\r\n<p>&nbsp; &nbsp;&nbsp;</p>\r\n\r\n<p><img alt=\"DTUers Vui chơi Hết mình trong Ngày hội Khai giảng Năm học mới\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/IMG_9361c-26.jpg\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"DTUers Vui chơi Hết mình trong Ngày hội Khai giảng Năm học mới\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/IMG_9645c-41.jpg\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"DTUers Vui chơi Hết mình trong Ngày hội Khai giảng Năm học mới\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/IMG_9674c-27.jpg\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"DTUers Vui chơi Hết mình trong Ngày hội Khai giảng Năm học mới\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/_O8A9677c-7.jpg\" /></p>\r\n\r\n<p><em>Những khoảnh khắc vui tươi, hạnh ph&uacute;c b&ecirc;n bạn b&egrave; c&ugrave;ng nụ cười rạng rỡ,... c&aacute;c DTUers đ&atilde; thực sự c&oacute; một ng&agrave;y hội với v&ocirc; v&agrave;n những kỷ niệm đ&aacute;ng nhớ. Năm học mới bắt đầu, ch&uacute;c cho c&aacute;c DTUers c&oacute; th&ecirc;m thật nhiều niềm vui, thật nhiều th&agrave;nh c&ocirc;ng trong học tập v&agrave; cuộc sống nh&eacute;!</em></p>\r\n\r\n<p>&nbsp;</p>\r\n', 1, 'DTUers Vui chơi Hết mình trong Ngày hội Khai giảng Năm học mới', '_O8A9849-9.jpg', '2020-11-18 06:21:06');
INSERT INTO `news` (`id`, `decription`, `detail`, `enable`, `news_name`, `picture`, `createAt`) VALUES
(11, '<p>35 th&iacute; sinh xuất sắc nhất lọt v&agrave;o&nbsp;<strong>Chung kết Cuộc thi Hoa hậu VN 2020&nbsp;</strong>đang hết m&igrave;nh tập luyện v&agrave; t&iacute;ch cực tham gia v&agrave;o c&aacute;c hoạt động của cuộc thi để lan tỏa những gi&aacute; trị của c&aacute;i đẹp v&agrave; của yếu tố nh&acirc;n văn.</p>\r\n\r\n<p>&nbsp;</p>\r\n', '<p>35 th&iacute; sinh xuất sắc nhất lọt v&agrave;o&nbsp;<strong>Chung kết Cuộc thi Hoa hậu VN 2020&nbsp;</strong>đang hết m&igrave;nh tập luyện v&agrave; t&iacute;ch cực tham gia v&agrave;o c&aacute;c hoạt động của cuộc thi để lan tỏa những gi&aacute; trị của c&aacute;i đẹp v&agrave; của yếu tố nh&acirc;n văn.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>V&ograve;ng Chung kết sẽ ch&iacute;nh thức được tổ chức v&agrave;o ng&agrave;y 20.11.2020 tại TP.HCM để t&igrave;m ra chủ nh&acirc;n của Vương miện Hoa hậu Việt Nam 2020. L&agrave; một trong những th&iacute; sinh nổi bật tại cuộc thi, Nguyễn Thị Tr&acirc;n Ch&acirc;u - mang số b&aacute;o danh 135, hiện đang l&agrave; sinh vi&ecirc;n của&nbsp;<a href=\"https://duytan.edu.vn/\"><strong>Đại học (ĐH) Duy T&acirc;n</strong></a>, đ&atilde; c&oacute; những phần thể hiện rất tốt, hứa hẹn sẽ l&agrave; nh&acirc;n tố bất ngờ của đ&ecirc;m Chung kết. H&atilde;y c&ugrave;ng ghi nhận những dấu ấn của Tr&acirc;n Ch&acirc;u qua c&aacute;c phần thi v&agrave; những hoạt động tại Cuộc thi</p>\r\n\r\n<p>Hoa hậu Việt Nam 2020 trước thềm đ&ecirc;m thi Chung kết.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"Sinh viên Đại học Duy Tân tỏa sáng trong Top 35 thí sinh Chung kết Hoa hậu VN 2020\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/1-78.jpg\" /></p>\r\n\r\n<p><em>Khoảnh khắc Tr&acirc;n Ch&acirc;u, c&ocirc; g&aacute;i đến từ Duy Xuy&ecirc;n - Quảng Nam, được xướng t&ecirc;n v&agrave;o Top 35 th&iacute; sinh xuất sắc lọt v&agrave;o Chung kết đ&atilde; l&agrave;m h&agrave;i l&ograve;ng người h&acirc;m mộ</em></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"Sinh viên Đại học Duy Tân tỏa sáng trong Top 35 thí sinh Chung kết Hoa hậu VN 2020\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/2-1.jpg\" /></p>\r\n\r\n<p><em>Sở hữu số đo 79 - 58 - 88, Tr&acirc;n Ch&acirc;u l&agrave; một trong những th&iacute; sinh c&oacute; v&ograve;ng eo nhỏ nhất của Top 35 th&iacute; sinh v&agrave;o Chung kết</em></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"Sinh viên Đại học Duy Tân tỏa sáng trong Top 35 thí sinh Chung kết Hoa hậu VN 2020\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/3-16.jpg\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"Sinh viên Đại học Duy Tân tỏa sáng trong Top 35 thí sinh Chung kết Hoa hậu VN 2020\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/4-18.jpg\" /></p>\r\n\r\n<p><em>Tr&acirc;n Ch&acirc;u nổi bật trong đ&ecirc;m thi Người đẹp Biển mang t&ecirc;n Vũng T&agrave;u - Điểm đến Thần ti&ecirc;n</em></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"Sinh viên Đại học Duy Tân tỏa sáng trong Top 35 thí sinh Chung kết Hoa hậu VN 2020\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/5-84.jpg\" /></p>\r\n\r\n<p><em>Tr&acirc;n Ch&acirc;u v&agrave; những người bạn trong dự &aacute;n &ldquo;Cơm hạnh ph&uacute;c&rdquo;</em></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Trong rất nhiều phần thi tại Cuộc thi Hoa hậu Việt Nam 2020, Tr&acirc;n Ch&acirc;u vui nhất l&agrave; c&ugrave;ng c&aacute;c th&iacute; sinh kh&aacute;c tham gia c&aacute;c hoạt động của Dự &aacute;n Nh&acirc;n &aacute;i. Bởi đ&acirc;y l&agrave; cơ hội để c&aacute;c bạn trẻ chia sẻ t&igrave;nh y&ecirc;u thương cũng như chung sức h&agrave;nh động v&igrave; cộng đồng. Tham gia phần thi n&agrave;y, Tr&acirc;n Ch&acirc;u thực hiện dự &aacute;n mang t&ecirc;n &ldquo;Cơm hạnh ph&uacute;c&rdquo;. Dự &aacute;n c&oacute; sự đồng h&agrave;nh của bếp từ thiện Mười Thu - bếp ăn được th&agrave;nh lập v&agrave; duy tr&igrave; bởi c&ocirc; Nguyễn Thị Thu, một người phụ nữ c&oacute; tấm l&ograve;ng nh&acirc;n hậu, ấm &aacute;p.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Trong hai ng&agrave;y 19 v&agrave; 20.10, &ldquo;Cơm hạnh ph&uacute;c&rdquo; của Tr&acirc;n Ch&acirc;u đ&atilde; tổ chức nấu v&agrave; ph&aacute;t cơm từ thiện cho hơn 250 trẻ em v&agrave; người gi&agrave; cao tuổi ở m&aacute;i ấm M&acirc;y Ng&agrave;n, đồng thời hỗ trợ nhu yếu phẩm v&agrave; quỹ hoạt động cho m&aacute;i ấm M&acirc;y Ng&agrave;n - ch&ugrave;a Cẩm Phong, quốc lộ 22B, Cẩm Giang, G&ograve; Dầu, T&acirc;y Ninh. Tr&acirc;n Ch&acirc;u t&acirc;m sự:&nbsp;<em>&ldquo;Em kh&ocirc;ng ngại kh&oacute; khăn, sẵn s&agrave;ng đến những v&ugrave;ng s&acirc;u v&ugrave;ng xa hay đến những nơi đang chịu ảnh hưởng của lũ lụt để gi&uacute;p đỡ b&agrave; con. Chỉ cần bản th&acirc;n em c&oacute; thể l&agrave;m được bất cứ g&igrave;, em sẽ cố gắng hết m&igrave;nh để chung tay v&igrave; cộng đồng&rdquo;.</em></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"Sinh viên Đại học Duy Tân tỏa sáng trong Top 35 thí sinh Chung kết Hoa hậu VN 2020\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/6-11.jpg\" /></p>\r\n\r\n<p><em>Tr&acirc;n Ch&acirc;u k&ecirc;u gọi được 1 tấn gạo v&agrave; c&aacute;c nhu yếu phẩm để hỗ trợ người d&acirc;n bị ngập lụt tại qu&ecirc; nh&agrave;</em></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Những ng&agrave;y n&agrave;y, miền Trung li&ecirc;n tục c&oacute; mưa b&atilde;o v&agrave; ngập lụt. Qu&ecirc; nh&agrave; của Tr&acirc;n Ch&acirc;u ở Duy Xuy&ecirc;n, Quảng Nam cũng kh&ocirc;ng tr&aacute;nh khỏi bị ảnh hưởng khiến em rất lo lắng. V&igrave; đang nỗ lực tập luyện v&agrave; tham gia c&aacute;c hoạt động của cuộc thi n&ecirc;n Tr&acirc;n Ch&acirc;u chưa thể về nh&agrave;. Tuy nhi&ecirc;n, c&ocirc; g&aacute;i nhỏ hiếu thuận lu&ocirc;n gọi điện để hỏi thăm t&igrave;nh h&igrave;nh qu&ecirc; nh&agrave; v&agrave; ngay trong qu&aacute; tr&igrave;nh thi, em đ&atilde; k&ecirc;u gọi quy&ecirc;n g&oacute;p được 1 tấn gạo c&ugrave;ng c&aacute;c nhu yếu phẩm để ủng hộ những người d&acirc;n bị thiệt hại do b&atilde;o lụt g&acirc;y ra.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>B&ecirc;n cạnh đ&oacute;, Tr&acirc;n Ch&acirc;u cũng l&ecirc;n kế hoạch tiếp tục c&ugrave;ng với c&aacute;c &ldquo;mạnh thường qu&acirc;n&rdquo; đi trao tặng lương thực v&agrave; những nhu yếu phẩm cần thiết nhất như gạo, dầu ăn, nước mắm, muối, m&igrave; ch&iacute;nh cho những hộ gia đ&igrave;nh bị thiệt hại nặng nề do thi&ecirc;n tai. Những hỗ trợ tuy nhỏ b&eacute; nhưng rất thiết thực của Tr&acirc;n Ch&acirc;u sẽ g&oacute;p phần gi&uacute;p người d&acirc;n vượt qua được những kh&oacute; khăn khi bị ảnh hưởng bởi thi&ecirc;n tai, lũ lụt.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"Sinh viên Đại học Duy Tân tỏa sáng trong Top 35 thí sinh Chung kết Hoa hậu VN 2020\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/7-86.jpg\" /></p>\r\n\r\n<p><em>Tr&acirc;n Ch&acirc;u c&ugrave;ng c&aacute;c th&iacute; sinh của Hoa hậu Việt Nam 2020 tự thực hiện c&aacute;c m&oacute;n ăn trong sự kiện Khai trương Si&ecirc;u thị nhập khẩu ti&ecirc;u chuẩn Nhật Bản Yen Market</em></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"Sinh viên Đại học Duy Tân tỏa sáng trong Top 35 thí sinh Chung kết Hoa hậu VN 2020\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/8-58.jpg\" /></p>\r\n\r\n<p><em>Thể hiện t&agrave;i năng với b&agrave;i m&uacute;a nhẹ nh&agrave;ng v&agrave; uyển chuyển, Tr&acirc;n Ch&acirc;u đ&atilde; để lại ấn tượng s&acirc;u sắc với Ban Gi&aacute;m khảo v&agrave; đ&ocirc;ng đảo kh&aacute;n giả</em></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"Sinh viên Đại học Duy Tân tỏa sáng trong Top 35 thí sinh Chung kết Hoa hậu VN 2020\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/9-91.jpg\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"Sinh viên Đại học Duy Tân tỏa sáng trong Top 35 thí sinh Chung kết Hoa hậu VN 2020\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/10-89.jpg\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"Sinh viên Đại học Duy Tân tỏa sáng trong Top 35 thí sinh Chung kết Hoa hậu VN 2020\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/11-93.jpg\" /></p>\r\n\r\n<p><em>Tr&acirc;n Ch&acirc;u mang số b&aacute;o danh 135 nổi bật c&ugrave;ng d&agrave;n th&iacute; sinh tham dự c&aacute;c hoạt động trong khu&ocirc;n khổ của cuộc thi Hoa hậu Việt Nam 2020</em></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Trải qua nhiều c&aacute;c phần thi phụ c&ugrave;ng c&aacute;c hoạt động tại cuộc thi, Tr&acirc;n Ch&acirc;u đ&atilde; c&oacute; th&ecirc;m nhiều bạn mới, c&oacute; v&ocirc; v&agrave;n những niềm vui v&agrave; kỷ niệm đ&aacute;ng nhớ. Tr&acirc;n Ch&acirc;u cũng học được rất nhiều kỹ năng về tr&igrave;nh diễn, catwalk cũng như vũ đạo tại cuộc thi. Nỗ lực hết m&igrave;nh trong mọi hoạt động, giờ đ&acirc;y Tr&acirc;n Ch&acirc;u đang rất h&agrave;o hứng v&agrave; tr&agrave;n đầy tự tin chờ đến đ&ecirc;m Chung kết mang t&iacute;nh quyết định n&agrave;y.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"Sinh viên Đại học Duy Tân tỏa sáng trong Top 35 thí sinh Chung kết Hoa hậu VN 2020\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/12-11.jpg\" /></p>\r\n\r\n<p><em>Gương mặt khả &aacute;i, nụ cười tỏa nắng c&ugrave;ng nhan sắc được v&iacute; như &ldquo;kẹo ngọt&rdquo;, Nguyễn Thị Tr&acirc;n Ch&acirc;u đang thực sự tỏa s&aacute;ng tại cuộc thi Hoa hậu Việt Nam 2020</em></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Trong qu&aacute; tr&igrave;nh tham dự cuộc thi Hoa hậu Việt Nam 2020, Tr&acirc;n Ch&acirc;u đ&atilde; nhận được rất nhiều sự ủng hộ từ thầy c&ocirc; v&agrave; c&aacute;c bạn tại trường ĐH Duy T&acirc;n.&nbsp;<em>&ldquo;Kh&ocirc;ng chỉ khi học tại giảng đường, c&aacute;c thầy c&ocirc; đ&atilde; rất nhiệt t&igrave;nh truyền thụ kiến thức v&agrave; kỹ năng cho em m&agrave; ngay cho cuộc thi n&agrave;y, c&aacute;c thầy c&ocirc; cũng lu&ocirc;n d&otilde;i theo h&agrave;nh tr&igrave;nh dự thi của em v&agrave; động vi&ecirc;n em rất nhiều. C&aacute;m ơn c&aacute;c thầy c&ocirc; v&agrave; bạn b&egrave; đ&atilde; lu&ocirc;n đồng h&agrave;nh c&ugrave;ng em trong học tập, trong cuộc sống v&agrave; cả trong cuộc thi Hoa hậu Việt Nam rất &yacute; nghĩa n&agrave;y&rdquo;</em>, Tr&acirc;n Ch&acirc;u chia sẻ.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Chung kết Hoa hậu Việt Nam 2020</strong>&nbsp;sẽ diễn ra tại TP.HCM v&agrave;o đ&ecirc;m 20.11.2020, Tr&acirc;n Ch&acirc;u v&agrave; c&aacute;c th&iacute; sinh đang rất t&iacute;ch cực v&agrave; nỗ lực để tập luyện chuẩn bị cho đ&ecirc;m Chung kết. H&atilde;y b&igrave;nh chọn cho Nguyễn Thị Tr&acirc;n Ch&acirc;u qua cổng b&igrave;nh chọn của Bvote tại link&nbsp;<a href=\"https://hoahauvietnam.bvote.vn/\">https://hoahauvietnam.bvote.vn/&nbsp;</a>để c&ocirc; g&aacute;i c&oacute; nụ cười tỏa nắng n&agrave;y c&oacute; cơ hội toả s&aacute;ng v&agrave; đến gần hơn với chiếc vương miện danh gi&aacute; của Hoa Hậu Việt Nam 2020 nh&eacute;!</p>\r\n', 1, 'Sinh viên Đại học Duy Tân tỏa sáng trong Top 35 thí sinh Chung kết Hoa hậu VN 2020', '3c-92.jpg', '2020-11-18 06:21:43'),
(12, '<p>35 th&iacute; sinh xuất sắc nhất lọt v&agrave;o&nbsp;<strong>Chung kết Cuộc thi Hoa hậu VN 2020&nbsp;</strong>đang hết m&igrave;nh tập luyện v&agrave; t&iacute;ch cực tham gia v&agrave;o c&aacute;c hoạt động của cuộc thi để lan tỏa những gi&aacute; trị của c&aacute;i đẹp v&agrave; của yếu tố nh&acirc;n văn.</p>\r\n\r\n<p>&nbsp;</p>\r\n', '<p>35 th&iacute; sinh xuất sắc nhất lọt v&agrave;o&nbsp;<strong>Chung kết Cuộc thi Hoa hậu VN 2020&nbsp;</strong>đang hết m&igrave;nh tập luyện v&agrave; t&iacute;ch cực tham gia v&agrave;o c&aacute;c hoạt động của cuộc thi để lan tỏa những gi&aacute; trị của c&aacute;i đẹp v&agrave; của yếu tố nh&acirc;n văn.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>V&ograve;ng Chung kết sẽ ch&iacute;nh thức được tổ chức v&agrave;o ng&agrave;y 20.11.2020 tại TP.HCM để t&igrave;m ra chủ nh&acirc;n của Vương miện Hoa hậu Việt Nam 2020. L&agrave; một trong những th&iacute; sinh nổi bật tại cuộc thi, Nguyễn Thị Tr&acirc;n Ch&acirc;u - mang số b&aacute;o danh 135, hiện đang l&agrave; sinh vi&ecirc;n của&nbsp;<a href=\"https://duytan.edu.vn/\"><strong>Đại học (ĐH) Duy T&acirc;n</strong></a>, đ&atilde; c&oacute; những phần thể hiện rất tốt, hứa hẹn sẽ l&agrave; nh&acirc;n tố bất ngờ của đ&ecirc;m Chung kết. H&atilde;y c&ugrave;ng ghi nhận những dấu ấn của Tr&acirc;n Ch&acirc;u qua c&aacute;c phần thi v&agrave; những hoạt động tại Cuộc thi</p>\r\n\r\n<p>Hoa hậu Việt Nam 2020 trước thềm đ&ecirc;m thi Chung kết.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"Sinh viên Đại học Duy Tân tỏa sáng trong Top 35 thí sinh Chung kết Hoa hậu VN 2020\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/1-78.jpg\" /></p>\r\n\r\n<p><em>Khoảnh khắc Tr&acirc;n Ch&acirc;u, c&ocirc; g&aacute;i đến từ Duy Xuy&ecirc;n - Quảng Nam, được xướng t&ecirc;n v&agrave;o Top 35 th&iacute; sinh xuất sắc lọt v&agrave;o Chung kết đ&atilde; l&agrave;m h&agrave;i l&ograve;ng người h&acirc;m mộ</em></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"Sinh viên Đại học Duy Tân tỏa sáng trong Top 35 thí sinh Chung kết Hoa hậu VN 2020\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/2-1.jpg\" /></p>\r\n\r\n<p><em>Sở hữu số đo 79 - 58 - 88, Tr&acirc;n Ch&acirc;u l&agrave; một trong những th&iacute; sinh c&oacute; v&ograve;ng eo nhỏ nhất của Top 35 th&iacute; sinh v&agrave;o Chung kết</em></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"Sinh viên Đại học Duy Tân tỏa sáng trong Top 35 thí sinh Chung kết Hoa hậu VN 2020\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/3-16.jpg\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"Sinh viên Đại học Duy Tân tỏa sáng trong Top 35 thí sinh Chung kết Hoa hậu VN 2020\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/4-18.jpg\" /></p>\r\n\r\n<p><em>Tr&acirc;n Ch&acirc;u nổi bật trong đ&ecirc;m thi Người đẹp Biển mang t&ecirc;n Vũng T&agrave;u - Điểm đến Thần ti&ecirc;n</em></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"Sinh viên Đại học Duy Tân tỏa sáng trong Top 35 thí sinh Chung kết Hoa hậu VN 2020\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/5-84.jpg\" /></p>\r\n\r\n<p><em>Tr&acirc;n Ch&acirc;u v&agrave; những người bạn trong dự &aacute;n &ldquo;Cơm hạnh ph&uacute;c&rdquo;</em></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Trong rất nhiều phần thi tại Cuộc thi Hoa hậu Việt Nam 2020, Tr&acirc;n Ch&acirc;u vui nhất l&agrave; c&ugrave;ng c&aacute;c th&iacute; sinh kh&aacute;c tham gia c&aacute;c hoạt động của Dự &aacute;n Nh&acirc;n &aacute;i. Bởi đ&acirc;y l&agrave; cơ hội để c&aacute;c bạn trẻ chia sẻ t&igrave;nh y&ecirc;u thương cũng như chung sức h&agrave;nh động v&igrave; cộng đồng. Tham gia phần thi n&agrave;y, Tr&acirc;n Ch&acirc;u thực hiện dự &aacute;n mang t&ecirc;n &ldquo;Cơm hạnh ph&uacute;c&rdquo;. Dự &aacute;n c&oacute; sự đồng h&agrave;nh của bếp từ thiện Mười Thu - bếp ăn được th&agrave;nh lập v&agrave; duy tr&igrave; bởi c&ocirc; Nguyễn Thị Thu, một người phụ nữ c&oacute; tấm l&ograve;ng nh&acirc;n hậu, ấm &aacute;p.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Trong hai ng&agrave;y 19 v&agrave; 20.10, &ldquo;Cơm hạnh ph&uacute;c&rdquo; của Tr&acirc;n Ch&acirc;u đ&atilde; tổ chức nấu v&agrave; ph&aacute;t cơm từ thiện cho hơn 250 trẻ em v&agrave; người gi&agrave; cao tuổi ở m&aacute;i ấm M&acirc;y Ng&agrave;n, đồng thời hỗ trợ nhu yếu phẩm v&agrave; quỹ hoạt động cho m&aacute;i ấm M&acirc;y Ng&agrave;n - ch&ugrave;a Cẩm Phong, quốc lộ 22B, Cẩm Giang, G&ograve; Dầu, T&acirc;y Ninh. Tr&acirc;n Ch&acirc;u t&acirc;m sự:&nbsp;<em>&ldquo;Em kh&ocirc;ng ngại kh&oacute; khăn, sẵn s&agrave;ng đến những v&ugrave;ng s&acirc;u v&ugrave;ng xa hay đến những nơi đang chịu ảnh hưởng của lũ lụt để gi&uacute;p đỡ b&agrave; con. Chỉ cần bản th&acirc;n em c&oacute; thể l&agrave;m được bất cứ g&igrave;, em sẽ cố gắng hết m&igrave;nh để chung tay v&igrave; cộng đồng&rdquo;.</em></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"Sinh viên Đại học Duy Tân tỏa sáng trong Top 35 thí sinh Chung kết Hoa hậu VN 2020\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/6-11.jpg\" /></p>\r\n\r\n<p><em>Tr&acirc;n Ch&acirc;u k&ecirc;u gọi được 1 tấn gạo v&agrave; c&aacute;c nhu yếu phẩm để hỗ trợ người d&acirc;n bị ngập lụt tại qu&ecirc; nh&agrave;</em></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Những ng&agrave;y n&agrave;y, miền Trung li&ecirc;n tục c&oacute; mưa b&atilde;o v&agrave; ngập lụt. Qu&ecirc; nh&agrave; của Tr&acirc;n Ch&acirc;u ở Duy Xuy&ecirc;n, Quảng Nam cũng kh&ocirc;ng tr&aacute;nh khỏi bị ảnh hưởng khiến em rất lo lắng. V&igrave; đang nỗ lực tập luyện v&agrave; tham gia c&aacute;c hoạt động của cuộc thi n&ecirc;n Tr&acirc;n Ch&acirc;u chưa thể về nh&agrave;. Tuy nhi&ecirc;n, c&ocirc; g&aacute;i nhỏ hiếu thuận lu&ocirc;n gọi điện để hỏi thăm t&igrave;nh h&igrave;nh qu&ecirc; nh&agrave; v&agrave; ngay trong qu&aacute; tr&igrave;nh thi, em đ&atilde; k&ecirc;u gọi quy&ecirc;n g&oacute;p được 1 tấn gạo c&ugrave;ng c&aacute;c nhu yếu phẩm để ủng hộ những người d&acirc;n bị thiệt hại do b&atilde;o lụt g&acirc;y ra.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>B&ecirc;n cạnh đ&oacute;, Tr&acirc;n Ch&acirc;u cũng l&ecirc;n kế hoạch tiếp tục c&ugrave;ng với c&aacute;c &ldquo;mạnh thường qu&acirc;n&rdquo; đi trao tặng lương thực v&agrave; những nhu yếu phẩm cần thiết nhất như gạo, dầu ăn, nước mắm, muối, m&igrave; ch&iacute;nh cho những hộ gia đ&igrave;nh bị thiệt hại nặng nề do thi&ecirc;n tai. Những hỗ trợ tuy nhỏ b&eacute; nhưng rất thiết thực của Tr&acirc;n Ch&acirc;u sẽ g&oacute;p phần gi&uacute;p người d&acirc;n vượt qua được những kh&oacute; khăn khi bị ảnh hưởng bởi thi&ecirc;n tai, lũ lụt.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"Sinh viên Đại học Duy Tân tỏa sáng trong Top 35 thí sinh Chung kết Hoa hậu VN 2020\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/7-86.jpg\" /></p>\r\n\r\n<p><em>Tr&acirc;n Ch&acirc;u c&ugrave;ng c&aacute;c th&iacute; sinh của Hoa hậu Việt Nam 2020 tự thực hiện c&aacute;c m&oacute;n ăn trong sự kiện Khai trương Si&ecirc;u thị nhập khẩu ti&ecirc;u chuẩn Nhật Bản Yen Market</em></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"Sinh viên Đại học Duy Tân tỏa sáng trong Top 35 thí sinh Chung kết Hoa hậu VN 2020\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/8-58.jpg\" /></p>\r\n\r\n<p><em>Thể hiện t&agrave;i năng với b&agrave;i m&uacute;a nhẹ nh&agrave;ng v&agrave; uyển chuyển, Tr&acirc;n Ch&acirc;u đ&atilde; để lại ấn tượng s&acirc;u sắc với Ban Gi&aacute;m khảo v&agrave; đ&ocirc;ng đảo kh&aacute;n giả</em></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"Sinh viên Đại học Duy Tân tỏa sáng trong Top 35 thí sinh Chung kết Hoa hậu VN 2020\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/9-91.jpg\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"Sinh viên Đại học Duy Tân tỏa sáng trong Top 35 thí sinh Chung kết Hoa hậu VN 2020\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/10-89.jpg\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"Sinh viên Đại học Duy Tân tỏa sáng trong Top 35 thí sinh Chung kết Hoa hậu VN 2020\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/11-93.jpg\" /></p>\r\n\r\n<p><em>Tr&acirc;n Ch&acirc;u mang số b&aacute;o danh 135 nổi bật c&ugrave;ng d&agrave;n th&iacute; sinh tham dự c&aacute;c hoạt động trong khu&ocirc;n khổ của cuộc thi Hoa hậu Việt Nam 2020</em></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Trải qua nhiều c&aacute;c phần thi phụ c&ugrave;ng c&aacute;c hoạt động tại cuộc thi, Tr&acirc;n Ch&acirc;u đ&atilde; c&oacute; th&ecirc;m nhiều bạn mới, c&oacute; v&ocirc; v&agrave;n những niềm vui v&agrave; kỷ niệm đ&aacute;ng nhớ. Tr&acirc;n Ch&acirc;u cũng học được rất nhiều kỹ năng về tr&igrave;nh diễn, catwalk cũng như vũ đạo tại cuộc thi. Nỗ lực hết m&igrave;nh trong mọi hoạt động, giờ đ&acirc;y Tr&acirc;n Ch&acirc;u đang rất h&agrave;o hứng v&agrave; tr&agrave;n đầy tự tin chờ đến đ&ecirc;m Chung kết mang t&iacute;nh quyết định n&agrave;y.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"Sinh viên Đại học Duy Tân tỏa sáng trong Top 35 thí sinh Chung kết Hoa hậu VN 2020\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/12-11.jpg\" /></p>\r\n\r\n<p><em>Gương mặt khả &aacute;i, nụ cười tỏa nắng c&ugrave;ng nhan sắc được v&iacute; như &ldquo;kẹo ngọt&rdquo;, Nguyễn Thị Tr&acirc;n Ch&acirc;u đang thực sự tỏa s&aacute;ng tại cuộc thi Hoa hậu Việt Nam 2020</em></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Trong qu&aacute; tr&igrave;nh tham dự cuộc thi Hoa hậu Việt Nam 2020, Tr&acirc;n Ch&acirc;u đ&atilde; nhận được rất nhiều sự ủng hộ từ thầy c&ocirc; v&agrave; c&aacute;c bạn tại trường ĐH Duy T&acirc;n.&nbsp;<em>&ldquo;Kh&ocirc;ng chỉ khi học tại giảng đường, c&aacute;c thầy c&ocirc; đ&atilde; rất nhiệt t&igrave;nh truyền thụ kiến thức v&agrave; kỹ năng cho em m&agrave; ngay cho cuộc thi n&agrave;y, c&aacute;c thầy c&ocirc; cũng lu&ocirc;n d&otilde;i theo h&agrave;nh tr&igrave;nh dự thi của em v&agrave; động vi&ecirc;n em rất nhiều. C&aacute;m ơn c&aacute;c thầy c&ocirc; v&agrave; bạn b&egrave; đ&atilde; lu&ocirc;n đồng h&agrave;nh c&ugrave;ng em trong học tập, trong cuộc sống v&agrave; cả trong cuộc thi Hoa hậu Việt Nam rất &yacute; nghĩa n&agrave;y&rdquo;</em>, Tr&acirc;n Ch&acirc;u chia sẻ.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Chung kết Hoa hậu Việt Nam 2020</strong>&nbsp;sẽ diễn ra tại TP.HCM v&agrave;o đ&ecirc;m 20.11.2020, Tr&acirc;n Ch&acirc;u v&agrave; c&aacute;c th&iacute; sinh đang rất t&iacute;ch cực v&agrave; nỗ lực để tập luyện chuẩn bị cho đ&ecirc;m Chung kết. H&atilde;y b&igrave;nh chọn cho Nguyễn Thị Tr&acirc;n Ch&acirc;u qua cổng b&igrave;nh chọn của Bvote tại link&nbsp;<a href=\"https://hoahauvietnam.bvote.vn/\">https://hoahauvietnam.bvote.vn/&nbsp;</a>để c&ocirc; g&aacute;i c&oacute; nụ cười tỏa nắng n&agrave;y c&oacute; cơ hội toả s&aacute;ng v&agrave; đến gần hơn với chiếc vương miện danh gi&aacute; của Hoa Hậu Việt Nam 2020 nh&eacute;!</p>\r\n', 1, 'Sinh viên Đại học Duy Tân tỏa sáng trong Top 35 thí sinh Chung kết Hoa hậu VN 2020', '3c-92.jpg', '2020-11-18 06:21:43'),
(13, '<p>Ng&agrave;y hội Khai giảng năm học 2020 - 2021 ch&iacute;nh l&agrave; ng&agrave;y vui đ&aacute;ng nhớ nhất trong những ng&agrave;y đầu trở th&agrave;nh&nbsp;<strong>T&acirc;n Sinh vi&ecirc;n Đại học Duy T&acirc;n</strong>. D&ugrave; tiết trời kh&aacute; đỏng đảnh l&uacute;c mưa nặng hạt, l&uacute;c bừng hửng nắng nhưng h&agrave;ng ngh&igrave;n DTUers vẫn &ldquo;quẩy&rdquo; hết m&igrave;nh c&ugrave;ng chuỗi c&aacute;c hoạt động của&nbsp;<strong>Ng&agrave;y hội ch&agrave;o mừng năm học mới</strong>.</p>\r\n', '<p>Ng&agrave;y hội Khai giảng năm học 2020 - 2021 ch&iacute;nh l&agrave; ng&agrave;y vui đ&aacute;ng nhớ nhất trong những ng&agrave;y đầu trở th&agrave;nh&nbsp;<strong>T&acirc;n Sinh vi&ecirc;n Đại học Duy T&acirc;n</strong>. D&ugrave; tiết trời kh&aacute; đỏng đảnh l&uacute;c mưa nặng hạt, l&uacute;c bừng hửng nắng nhưng h&agrave;ng ngh&igrave;n DTUers vẫn &ldquo;quẩy&rdquo; hết m&igrave;nh c&ugrave;ng chuỗi c&aacute;c hoạt động của&nbsp;<strong>Ng&agrave;y hội ch&agrave;o mừng năm học mới</strong>.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><em><img alt=\"DTUers Vui chơi Hết mình trong Ngày hội Khai giảng Năm học mới\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/2G6A5881c-67.jpg\" />&nbsp;&nbsp;</em></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><em><img alt=\"DTUers Vui chơi Hết mình trong Ngày hội Khai giảng Năm học mới\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/2G6A5882c-5.jpg\" /></em></p>\r\n\r\n<p><em>Sau tiếng trống khai giảng năm học mới, kh&ocirc;ng kh&iacute; của ng&agrave;y hội b&ugrave;ng nổ&nbsp;</em></p>\r\n\r\n<p><em>với phần mở m&agrave;n l&agrave; tiết mục nhảy Hip hop s&ocirc;i động v&agrave; hiện đại</em></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;&nbsp;<img alt=\"DTUers Vui chơi Hết mình trong Ngày hội Khai giảng Năm học mới\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/IMG_9359c-26.jpg\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"DTUers Vui chơi Hết mình trong Ngày hội Khai giảng Năm học mới\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/IMG_9378c-35.jpg\" /></p>\r\n\r\n<p><em>Ngo&agrave;i trời đang mưa nhỉ?. Vậy th&igrave; h&atilde;y lắng đọng v&agrave; bắt nhịp c&ugrave;ng C&acirc;u Lạc bộ Acoustic</em></p>\r\n\r\n<p><em>với ca kh&uacute;c &ldquo;Vết mưa&rdquo; nh&eacute;! Ho&agrave;i niệm một ch&uacute;t với mưa v&agrave; rồi lại phi&ecirc;u</em></p>\r\n\r\n<p><em>với &ldquo;24h&rdquo;, &ldquo;H&agrave; Nội tr&agrave; đ&aacute; vỉa h&egrave;&rdquo;, &ldquo;V&igrave; anh vẫn&rdquo;,...</em></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp; &nbsp;&nbsp;<img alt=\"DTUers Vui chơi Hết mình trong Ngày hội Khai giảng Năm học mới\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/IMG_0416c-33.jpg\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"DTUers Vui chơi Hết mình trong Ngày hội Khai giảng Năm học mới\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/IMG_0563c-79.jpg\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"DTUers Vui chơi Hết mình trong Ngày hội Khai giảng Năm học mới\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/IMG_0585c-25.jpg\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"DTUers Vui chơi Hết mình trong Ngày hội Khai giảng Năm học mới\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/IMG_0523c-42.jpg\" /></p>\r\n\r\n<p><em>Vừa nghe nhạc vừa &ldquo;lượn&rdquo; một v&ograve;ng &ldquo;check in&rdquo;</em></p>\r\n\r\n<p><em>&nbsp;tại c&aacute;c gian h&agrave;ng đầy sắc m&agrave;u của ng&agrave;y hội n&agrave;o!</em></p>\r\n\r\n<p>&nbsp; &nbsp;&nbsp;</p>\r\n\r\n<p><img alt=\"DTUers Vui chơi Hết mình trong Ngày hội Khai giảng Năm học mới\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/IMG_0423c-48.jpg\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"DTUers Vui chơi Hết mình trong Ngày hội Khai giảng Năm học mới\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/IMG_0442c-18.jpg\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"DTUers Vui chơi Hết mình trong Ngày hội Khai giảng Năm học mới\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/IMG_0494c-41.jpg\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"DTUers Vui chơi Hết mình trong Ngày hội Khai giảng Năm học mới\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/IMG_0511c-32.jpg\" /></p>\r\n\r\n<p><em>Nắm tay nhau c&ugrave;ng nhảy sạp, nhấp thử một ch&uacute;t rượu cần T&acirc;y Nguy&ecirc;n,</em></p>\r\n\r\n<p><em>uống một ly tr&agrave; chanh giải kh&aacute;t&nbsp;</em><em>hay chia nhau một dĩa Kimbap, một hộp xo&agrave;i lắc&nbsp;</em></p>\r\n\r\n<p><em>c&oacute; lẽ l&agrave; trải nghiệm th&uacute; vị nhất của DTUers tại c&aacute;c gian h&agrave;ng</em></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp; &nbsp;&nbsp;<img alt=\"DTUers Vui chơi Hết mình trong Ngày hội Khai giảng Năm học mới\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/_O8A9739c-83.jpg\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"DTUers Vui chơi Hết mình trong Ngày hội Khai giảng Năm học mới\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/_O8A9913c-22.jpg\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"DTUers Vui chơi Hết mình trong Ngày hội Khai giảng Năm học mới\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/_O8A9917c-58.jpg\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"DTUers Vui chơi Hết mình trong Ngày hội Khai giảng Năm học mới\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/_O8A9927c-99.jpg\" /></p>\r\n\r\n<p><em>Flashmod c&oacute; lẽ l&agrave; phần thi được mong đợi nhất của ng&agrave;y hội. Tr&ecirc;n nền nhạc&nbsp;</em></p>\r\n\r\n<p><em>nhiều ca kh&uacute;c như: &ldquo;C&oacute; chắc đ&acirc;y l&agrave; y&ecirc;u&rdquo;, &ldquo;Người ơi người ở đừng về&rdquo;,...</em></p>\r\n\r\n<p><em>c&aacute;c đội nhảy flashmod xuất hiện đầy sắc m&agrave;u, lắc lư theo điệu nhạc&nbsp;</em></p>\r\n\r\n<p><em>v&agrave; h&ograve; reo phấn kh&iacute;ch</em></p>\r\n\r\n<p><em>&nbsp;&nbsp;</em></p>\r\n\r\n<p><img alt=\"DTUers Vui chơi Hết mình trong Ngày hội Khai giảng Năm học mới\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/2G6A5980c-1.jpg\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"DTUers Vui chơi Hết mình trong Ngày hội Khai giảng Năm học mới\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/_O8A9747c-70.jpg\" /></p>\r\n\r\n<p><em>Từ v&aacute;y &aacute;o trẻ trung năng động, quần &aacute;o b&agrave; ba giản dị hay trang phục</em></p>\r\n\r\n<p><em>thổ cẩm truyền thống&nbsp;</em><em>của c&aacute;c d&acirc;n tộc anh em,... c&aacute;c Khoa đ&atilde; c&oacute; những&nbsp;</em></p>\r\n\r\n<p><em>phần tr&igrave;nh diễn nhảy Flashmod thực sự &ldquo;m&atilde;n nh&atilde;n&rdquo;</em></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp; &nbsp;&nbsp;<img alt=\"DTUers Vui chơi Hết mình trong Ngày hội Khai giảng Năm học mới\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/IMG_0292c-76.jpg\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"DTUers Vui chơi Hết mình trong Ngày hội Khai giảng Năm học mới\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/IMG_0391c-96.jpg\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"DTUers Vui chơi Hết mình trong Ngày hội Khai giảng Năm học mới\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/IMG_0408c-83.jpg\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"DTUers Vui chơi Hết mình trong Ngày hội Khai giảng Năm học mới\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/IMG_0425c-98.jpg\" /></p>\r\n\r\n<p><em>Kho&aacute;c l&ecirc;n m&igrave;nh trang phục truyền thống của c&aacute;c d&acirc;n tộc trải d&agrave;i</em></p>\r\n\r\n<p><em>từ Bắc đến Nam, c&aacute;c đội thi đ&atilde; mang đến cho kh&aacute;n giả nhiều sự th&iacute;ch th&uacute;</em></p>\r\n\r\n<p><em>qua phần thi Thời trang &ldquo;Sắc m&agrave;u c&aacute;c d&acirc;n tộc&rdquo;</em></p>\r\n\r\n<p>&nbsp; &nbsp;&nbsp;</p>\r\n\r\n<p><img alt=\"DTUers Vui chơi Hết mình trong Ngày hội Khai giảng Năm học mới\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/IMG_0309c-14.jpg\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"DTUers Vui chơi Hết mình trong Ngày hội Khai giảng Năm học mới\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/IMG_0338c-76.jpg\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"DTUers Vui chơi Hết mình trong Ngày hội Khai giảng Năm học mới\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/IMG_0356c-13.jpg\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"DTUers Vui chơi Hết mình trong Ngày hội Khai giảng Năm học mới\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/IMG_0376c-50.jpg\" /></p>\r\n\r\n<p><em>Kết hợp th&ecirc;m những phụ kiện khăn cho&agrave;ng, chi&ecirc;ng, kh&egrave;n, lồng đ&egrave;n,...</em></p>\r\n\r\n<p><em>c&ugrave;ng phong th&aacute;i tr&igrave;nh diễn tự nhi&ecirc;n v&agrave; tự tin, c&aacute;c &ldquo;người mẫu&rdquo; DTU&nbsp;</em></p>\r\n\r\n<p><em>đ&atilde; tạo n&ecirc;n những phần thi sinh động v&agrave; v&ocirc; c&ugrave;ng hấp dẫn</em></p>\r\n\r\n<p>&nbsp; &nbsp;&nbsp;</p>\r\n\r\n<p><em><img alt=\"DTUers Vui chơi Hết mình trong Ngày hội Khai giảng Năm học mới\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/_O8A9576c-54.jpg\" /></em></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><em><img alt=\"DTUers Vui chơi Hết mình trong Ngày hội Khai giảng Năm học mới\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/_O8A9586c-76.jpg\" /></em></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><em><img alt=\"DTUers Vui chơi Hết mình trong Ngày hội Khai giảng Năm học mới\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/_O8A9615c-93.jpg\" /></em></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><em><img alt=\"DTUers Vui chơi Hết mình trong Ngày hội Khai giảng Năm học mới\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/_O8A9664c-14.jpg\" /></em></p>\r\n\r\n<p><em>Tiếng cười, tiếng n&oacute;i, tiếng h&ograve; reo cổ vũ kh&ocirc;ng ngớt của h&agrave;ng trăm, h&agrave;ng ngh&igrave;n</em></p>\r\n\r\n<p><em>kh&aacute;n giả như tiếp th&ecirc;m động lực cho c&aacute;c đội trong phần thi Team Building</em></p>\r\n\r\n<p>&nbsp;&nbsp;</p>\r\n\r\n<p><em><img alt=\"DTUers Vui chơi Hết mình trong Ngày hội Khai giảng Năm học mới\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/_O8A9636c-36.jpg\" /></em></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><em><img alt=\"DTUers Vui chơi Hết mình trong Ngày hội Khai giảng Năm học mới\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/_O8A9582c-17.jpg\" /></em></p>\r\n\r\n<p><em>Kh&ocirc;ng ngại mưa gi&oacute; v&agrave; với tinh thần đo&agrave;n kết đồng đội,</em></p>\r\n\r\n<p><em>&nbsp;đội h&igrave;nh Team Building của c&aacute;c khoa vẫn ch&aacute;y hết m&igrave;nh&nbsp;</em></p>\r\n\r\n<p><em>với từng tr&ograve; chơi v&agrave; ho&agrave;n th&agrave;nh xuất sắc c&aacute;c thử th&aacute;ch&nbsp;</em></p>\r\n\r\n<p>&nbsp; &nbsp;&nbsp;</p>\r\n\r\n<p><img alt=\"DTUers Vui chơi Hết mình trong Ngày hội Khai giảng Năm học mới\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/IMG_9361c-26.jpg\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"DTUers Vui chơi Hết mình trong Ngày hội Khai giảng Năm học mới\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/IMG_9645c-41.jpg\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"DTUers Vui chơi Hết mình trong Ngày hội Khai giảng Năm học mới\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/IMG_9674c-27.jpg\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"DTUers Vui chơi Hết mình trong Ngày hội Khai giảng Năm học mới\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/_O8A9677c-7.jpg\" /></p>\r\n\r\n<p><em>Những khoảnh khắc vui tươi, hạnh ph&uacute;c b&ecirc;n bạn b&egrave; c&ugrave;ng nụ cười rạng rỡ,... c&aacute;c DTUers đ&atilde; thực sự c&oacute; một ng&agrave;y hội với v&ocirc; v&agrave;n những kỷ niệm đ&aacute;ng nhớ. Năm học mới bắt đầu, ch&uacute;c cho c&aacute;c DTUers c&oacute; th&ecirc;m thật nhiều niềm vui, thật nhiều th&agrave;nh c&ocirc;ng trong học tập v&agrave; cuộc sống nh&eacute;!</em></p>\r\n\r\n<p>&nbsp;</p>\r\n', 1, 'DTUers Vui chơi Hết mình trong Ngày hội Khai giảng Năm học mới', '_O8A9849-9.jpg', '2020-11-18 06:21:06'),
(14, '<p>Chiều ng&agrave;y 13/11/2020,&nbsp;<strong>Trường C&ocirc;ng nghệ thuộc Đại học Duy T&acirc;n</strong>&nbsp;đ&atilde; phối hợp với Sở Gi&aacute;o dục &amp; Đ&agrave;o tạo tỉnh Quảng Ng&atilde;i tổ chức lớp&nbsp;<strong>Tập huấn về Gi&aacute;o dục STEM</strong>&nbsp;cho gi&aacute;o vi&ecirc;n m&ocirc;n Tin học của c&aacute;c trường THPT tr&ecirc;n địa b&agrave;n tỉnh Quảng Ng&atilde;i. Đ&acirc;y cũng l&agrave; cơ hội để giảng vi&ecirc;n của Đại học Duy T&acirc;n v&agrave; c&aacute;c trường THPT tr&ecirc;n địa b&agrave;n khu vực miền Trung v&agrave; T&acirc;y Nguy&ecirc;n c&oacute; c&ugrave;ng đam m&ecirc; về nghi&ecirc;n cứu khoa học gặp gỡ, trao đổi kiến thức v&agrave; kinh nghiệm.</p>\r\n', '<p>Chiều ng&agrave;y 13/11/2020,&nbsp;<strong>Trường C&ocirc;ng nghệ thuộc Đại học Duy T&acirc;n</strong>&nbsp;đ&atilde; phối hợp với Sở Gi&aacute;o dục &amp; Đ&agrave;o tạo tỉnh Quảng Ng&atilde;i tổ chức lớp&nbsp;<strong>Tập huấn về Gi&aacute;o dục STEM</strong>&nbsp;cho gi&aacute;o vi&ecirc;n m&ocirc;n Tin học của c&aacute;c trường THPT tr&ecirc;n địa b&agrave;n tỉnh Quảng Ng&atilde;i. Đ&acirc;y cũng l&agrave; cơ hội để giảng vi&ecirc;n của Đại học Duy T&acirc;n v&agrave; c&aacute;c trường THPT tr&ecirc;n địa b&agrave;n khu vực miền Trung v&agrave; T&acirc;y Nguy&ecirc;n c&oacute; c&ugrave;ng đam m&ecirc; về nghi&ecirc;n cứu khoa học gặp gỡ, trao đổi kiến thức v&agrave; kinh nghiệm.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/giangvienduytanhuongdanlaprapvalaptrinhrobot-66.jpg\" /></p>\r\n\r\n<p><em>C&aacute;n bộ Đại học Duy T&acirc;n hướng dẫn lắp r&aacute;p v&agrave; lập tr&igrave;nh Robot</em></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>STEM l&agrave; một chương tr&igrave;nh giảng dạy dựa tr&ecirc;n &yacute; tưởng trang bị cho người học những kiến thức, kỹ năng li&ecirc;n quan đến c&aacute;c lĩnh vực khoa học, c&ocirc;ng nghệ, kỹ thuật v&agrave; to&aacute;n học theo c&aacute;ch tiếp cận li&ecirc;n m&ocirc;n (interdisciplinary) v&agrave; qua đ&oacute;, người học c&oacute;&nbsp; thể vận dụng để giải quyết c&aacute;c vấn đề trong cuộc sống h&agrave;ng ng&agrave;y. Trong dạy học ở trường phổ th&ocirc;ng,<strong>&nbsp;Gi&aacute;o dục STEM</strong>&nbsp;c&oacute; rất nhiều ưu điểm như gi&uacute;p cho học sinh vừa c&oacute; được kiến thức vừa h&igrave;nh th&agrave;nh v&agrave; ph&aacute;t triển được năng lực giải quyết vấn đề, ph&aacute;t triển được tư duy s&aacute;ng tạo của học sinh.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&Ocirc;ng Đặng Văn Th&agrave;nh - Chuy&ecirc;n vi&ecirc;n ph&ograve;ng Gi&aacute;o dục Trung học, Sở Gi&aacute;o dục &amp; Đ&agrave;o tạo tỉnh Quảng Ng&atilde;i cho biết:&nbsp;<em>&ldquo;Sở Gi&aacute;o dục &amp; Đ&agrave;o tạo tỉnh Quảng Ng&atilde;i đ&atilde; c&oacute; cơ hội phối hợp với Đại học Duy T&acirc;n trong tổ chức cuộc thi&nbsp;<strong>Khoa học Kỹ thuật&nbsp;</strong>cho học sinh, ch&uacute;ng t&ocirc;i đ&aacute;nh gi&aacute; rất cao sự nhiệt t&igrave;nh v&agrave; năng lực nghi&ecirc;n cứu khoa học của nh&agrave; trường. Bởi vậy, th&ocirc;ng qua lớp bồi dưỡng n&agrave;y, ch&uacute;ng t&ocirc;i mong muốn c&oacute; th&ecirc;m nhiều hoạt động giữa 2 đơn vị để thắt chặt hơn nữa mối quan hệ hợp t&aacute;c cũng như tạo điều kiện cho c&aacute;c gi&aacute;o vi&ecirc;n Tin học của tỉnh Quảng Ng&atilde;i n&acirc;ng cao được kiến thức chuy&ecirc;n m&ocirc;n, c&oacute; cơ hội tiếp cận được những c&ocirc;ng nghệ mới để ứng dụng v&agrave; g&oacute;p phần mang lại hiệu quả hơn nữa trong giảng dạy.&rdquo;</em></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><em><img alt=\"\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/doangiaovienthpttinhquangngaithamquandaihocduytan-9.jpg\" /></em></p>\r\n\r\n<p><em>Đo&agrave;n gi&aacute;o vi&ecirc;n Tin học c&aacute;c trường THPT tỉnh Quảng Ng&atilde;i tham quan Đại học Duy T&acirc;n</em></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Trong buổi tập huấn, c&aacute;c c&aacute;n bộ v&agrave; giảng vi&ecirc;n của&nbsp;<strong>Đại học Duy T&acirc;n</strong>&nbsp;đ&atilde; cung cấp cho c&aacute;c gi&aacute;o vi&ecirc;n Tin học c&aacute;c trường THPT tỉnh Quảng Ng&atilde;i những th&ocirc;ng tin về qu&aacute; tr&igrave;nh thực hiện một dự &aacute;n&nbsp;<strong>Khoa học - Kỹ thuật</strong>: từ C&aacute;ch tự lập sổ tay khoa học, Lựa chọn chủ đề, X&acirc;y dựng kế hoạch nghi&ecirc;n cứu, Viết b&aacute;o c&aacute;o,... cho đến Tiến h&agrave;nh th&iacute; nghiệm, Ph&acirc;n t&iacute;ch dữ liệu, Sữa chữa v&agrave; ho&agrave;n thiện poster,...&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>B&ecirc;n cạnh đ&oacute;, c&aacute;c gi&aacute;o vi&ecirc;n của tỉnh Quảng Ng&atilde;i tham dự lớp&nbsp;<strong>tập huấn</strong>&nbsp;cũng được cung cấp t&agrave;i liệu, hướng dẫn cơ bản về lắp r&aacute;p v&agrave; lập tr&igrave;nh điều khiển Robot. Cụ thể, c&aacute;c c&aacute;n bộ v&agrave; giảng vi&ecirc;n&nbsp;<strong>Trường C&ocirc;ng nghệ</strong>&nbsp;đ&atilde; hướng dẫn từng bước c&agrave;i đặt, kiểm tra v&agrave; hướng dẫn sử dụng Arduino IDE; Hướng dẫn lập tr&igrave;nh điều khiển động cơ DC sử dụng Arduino v&agrave; module L298D; Kết nối v&agrave; kiểm tra module Bluetooth HC05 - Arduino.</p>\r\n\r\n<p>&nbsp;</p>\r\n', 1, 'Đại học Duy Tân tổ chức Tập huấn về Giáo dục STEM cho Giáo viên Tin học tỉnh Quảng Ngãi', 'giangvienduytanhuongdanlaprapvalaptrinhrobot-66.jpg', '2020-11-18 02:47:57'),
(15, '<p><strong>Giải thưởng Khoa học C&ocirc;ng nghệ Thanh ni&ecirc;n Quả Cầu V&agrave;ng</strong>&nbsp;l&agrave; hoạt động do Trung ương Đo&agrave;n TNCS Hồ Ch&iacute; Minh, Bộ Khoa học v&agrave; C&ocirc;ng nghệ phối hợp tổ chức nhằm t&ocirc;n vinh c&aacute;c t&agrave;i năng trẻ c&oacute; th&agrave;nh t&iacute;ch xuất sắc trong 5 lĩnh vực: C&ocirc;ng nghệ Th&ocirc;ng tin v&agrave; Truyền th&ocirc;ng; C&ocirc;ng nghệ Y - Dược; C&ocirc;ng nghệ Sinh học; C&ocirc;ng nghệ M&ocirc;i trường v&agrave; C&ocirc;ng nghệ Vật liệu mới. Năm 2020, Đại học Duy T&acirc;n vinh dự c&oacute; TS. Hồ Thanh T&acirc;m &ndash; lĩnh vực&nbsp;<strong>C&ocirc;ng nghệ Sinh học</strong>&nbsp;lọt v&agrave;o top 20 v&ograve;ng B&igrave;nh chọn Online để chọn ra 10 gương mặt ti&ecirc;u biểu nhận giải&nbsp;<strong>Quả Cầu V&agrave;ng</strong>.</p>\r\n', '<p><strong>Giải thưởng Khoa học C&ocirc;ng nghệ Thanh ni&ecirc;n Quả Cầu V&agrave;ng</strong>&nbsp;l&agrave; hoạt động do Trung ương Đo&agrave;n TNCS Hồ Ch&iacute; Minh, Bộ Khoa học v&agrave; C&ocirc;ng nghệ phối hợp tổ chức nhằm t&ocirc;n vinh c&aacute;c t&agrave;i năng trẻ c&oacute; th&agrave;nh t&iacute;ch xuất sắc trong 5 lĩnh vực: C&ocirc;ng nghệ Th&ocirc;ng tin v&agrave; Truyền th&ocirc;ng; C&ocirc;ng nghệ Y - Dược; C&ocirc;ng nghệ Sinh học; C&ocirc;ng nghệ M&ocirc;i trường v&agrave; C&ocirc;ng nghệ Vật liệu mới. Năm 2020, Đại học Duy T&acirc;n vinh dự c&oacute; TS. Hồ Thanh T&acirc;m &ndash; lĩnh vực&nbsp;<strong>C&ocirc;ng nghệ Sinh học</strong>&nbsp;lọt v&agrave;o top 20 v&ograve;ng B&igrave;nh chọn Online để chọn ra 10 gương mặt ti&ecirc;u biểu nhận giải&nbsp;<strong>Quả Cầu V&agrave;ng</strong>.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"Bình chọn cho Nhà khoa học Đại học Duy Tân nhận giải Quả Cầu Vàng năm 2020\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/20201115_200840c-72.jpg\" /></p>\r\n\r\n<p><em>TS. Hồ Thanh T&acirc;m tham dự</em></p>\r\n\r\n<p><em>Hội nghị &ldquo;4th International Conference on Natural Products Utilization 2019&rdquo; tại Bulgaria</em></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Được tổ chức lần đầu ti&ecirc;n v&agrave;o năm 2003,&nbsp;<strong>Giải thưởng Khoa học C&ocirc;ng nghệ Thanh ni&ecirc;n Quả Cầu V&agrave;ng</strong>&nbsp;trở th&agrave;nh hoạt động thường ni&ecirc;n nhằm tạo động lực v&agrave; th&uacute;c đẩy phong tr&agrave;o thi đua, học tập, nghi&ecirc;n cứu khoa học v&agrave; &aacute;p dụng c&aacute;c th&agrave;nh tựu Khoa học C&ocirc;ng nghệ v&agrave;o sản xuất v&agrave; đời sống. Giải thưởng cũng đồng thời thu h&uacute;t sự quan t&acirc;m của c&aacute;c cấp, c&aacute;c ng&agrave;nh, c&aacute;c nh&agrave; quản l&yacute;, c&aacute;c lực lượng x&atilde; hội đối với c&ocirc;ng t&aacute;c đ&agrave;o tạo v&agrave; trọng dụng t&agrave;i năng trẻ trong lĩnh vực khoa học c&ocirc;ng nghệ, g&oacute;p phần bồi dưỡng đội ngũ nh&acirc;n t&agrave;i cho đất nước.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Sau hơn 3 th&aacute;ng ph&aacute;t động Giải thưởng&nbsp;<strong>Quả Cầu V&agrave;ng</strong>&nbsp;năm 2020, Ban Tổ chức đ&atilde; nhận được 51 hồ sơ của 19 đơn vị đề cử. Trong đ&oacute;, lĩnh vực&nbsp;<strong>C&ocirc;ng nghệ Sinh học</strong>&nbsp;(8 hồ sơ), C&ocirc;ng nghệ M&ocirc;i trường (10 hồ sơ), C&ocirc;ng nghệ Y - Dược (9 hồ sơ), C&ocirc;ng nghệ Th&ocirc;ng tin v&agrave; Truyền th&ocirc;ng (12 hồ sơ) v&agrave; C&ocirc;ng nghệ Vật liệu mới (12 hồ sơ).&nbsp;&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Lọt v&agrave;o Top 20 c&oacute; TS. Hồ Thanh T&acirc;m -&nbsp;<strong>Đại học Duy T&acirc;n</strong>&nbsp;với nhiều dấu ấn trong hoạt động nghi&ecirc;n cứu khoa học. Ti&ecirc;u biểu trong số đ&oacute; l&agrave;: 18 b&agrave;i b&aacute;o đ&atilde; c&ocirc;ng bố tr&ecirc;n c&aacute;c tạp ch&iacute; khoa học quốc tế, 10 b&agrave;i b&aacute;o c&ocirc;ng bố tr&ecirc;n c&aacute;c tạp ch&iacute; trong nước; 6 b&aacute;o c&aacute;o khoa học được đăng to&agrave;n văn trong kỷ yếu c&aacute;c hội nghị khoa học quốc tế v&agrave; quốc gia; đồng t&aacute;c giả của 1 chương s&aacute;ch chuy&ecirc;n khảo của Nh&agrave; xuất bản SPi Technologies India Private Ltd 2020. B&ecirc;n cạnh đ&oacute;, TS. Hồ Thanh T&acirc;m cũng đ&atilde; gi&agrave;nh được giải Ba b&aacute;o c&aacute;o xuất sắc (Third Place Award) tại Hội thảo &ldquo;In vitro Biology Meeting&rdquo; (Raleigh, North Carolina, USA 2017) do Hiệp hội Sinh học trong Ống nghiệm Hoa K&igrave; (Society for In Vitro Biology) tổ chức; giải Nh&igrave; b&aacute;o c&aacute;o xuất sắc (Second Place Award) tại hội thảo &ldquo;The 3rd International Orchid Symposium&rdquo; (Seoul, Korea 2018) do Hiệp hội Khoa học C&acirc;y trồng Quốc tế (International Society for Horticultural Science) tổ chức,...</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"Bình chọn cho Nhà khoa học Đại học Duy Tân nhận giải Quả Cầu Vàng năm 2020\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/1605445190589c-34.jpg\" /></p>\r\n\r\n<p><em>TS. Hồ Thanh T&acirc;m đến tham quan tại</em></p>\r\n\r\n<p><em>N</em><em>h&agrave; m&aacute;y Sản xuất Sinh khối c&acirc;y Dược liệu ở Quy m&ocirc; C&ocirc;ng nghiệp, H&agrave;n Quốc</em></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Hiện tại, TS. Hồ Thanh T&acirc;m đ&atilde; tham gia 9 đề t&agrave;i, dự &aacute;n nghi&ecirc;n cứu khoa học thuộc lĩnh vực nghi&ecirc;n cứu tại H&agrave;n Quốc, v&agrave; hiện đang l&agrave; th&agrave;nh vi&ecirc;n phản biện 5 tạp ch&iacute; khoa học chuy&ecirc;n ng&agrave;nh quốc tế uy t&iacute;n.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>C&ugrave;ng với đ&oacute;, TS. Hồ Thanh T&acirc;m l&agrave; th&agrave;nh vi&ecirc;n t&iacute;ch cực trong nhiều hoạt động kh&aacute;c như: Ph&oacute; B&iacute; thư đo&agrave;n khoa Sinh học, trường Đại học Đ&agrave; Lạt (2009 - 2011); Chi Hội trưởng Hội Sinh vi&ecirc;n Việt Nam tại Đại học Quốc gia Chungbuk (H&agrave;n Quốc) từ 2015 - 2017, Ph&oacute; Chủ tịch phụ tr&aacute;ch truyền th&ocirc;ng Hiệp hội b&oacute;ng đ&aacute; Việt Nam tại H&agrave;n Quốc từ 2019 - 2020; giải Nh&igrave; với t&aacute;c phẩm &ldquo;Thư gửi con g&aacute;i&rdquo; tại cuộc thi T&igrave;m hiểu Văn h&oacute;a, Lịch sử - Tự h&agrave;o Việt Nam 2019 tại H&agrave;n Quốc,...</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Để TS. Hồ Thanh T&acirc;m - nh&agrave; khoa học của&nbsp;<strong>Đại học Duy T&acirc;n</strong>&nbsp;nằm trong Top 10 gương mặt ti&ecirc;u biểu được trao giải&nbsp;<strong>Quả Cầu V&agrave;ng&nbsp;</strong>2020, k&iacute;nh mong Qu&yacute; Thầy C&ocirc;, C&aacute;n bộ, Nh&acirc;n vi&ecirc;n c&ugrave;ng to&agrave;n thể Sinh vi&ecirc;n to&agrave;n trường c&ugrave;ng tham gia b&igrave;nh chọn. C&aacute;ch thức b&igrave;nh chọn như sau:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>C&aacute;ch thức b&igrave;nh chọn rất đơn giản:</strong></p>\r\n\r\n<p><strong>1. Truy cập v&agrave;o link b&ecirc;n dưới, v&agrave;o mục bầu chọn</strong></p>\r\n\r\n<p><strong>2. Đ&aacute;nh dấu tick v&agrave;o &ocirc;</strong></p>\r\n\r\n<p><strong>&quot;Hồ Thanh T&acirc;m - C&ocirc;ng nghệ Sinh học&quot;</strong></p>\r\n\r\n<p><strong>3. Tick v&agrave;o &ocirc; &quot;T&ocirc;i kh&ocirc;ng phải người m&aacute;y&quot; rồi gửi b&igrave;nh chọn.</strong></p>\r\n\r\n<p><strong>Mọi người c&oacute; thể gửi &yacute; kiến ở mục &yacute; kiến (trước l&uacute;c gửi b&igrave;nh chọn)</strong></p>\r\n\r\n<p><strong>Link bầu chọn:&nbsp;</strong>http://qcv.tainangviet.vn/binh-chon/</p>\r\n', 1, 'Bình chọn cho Nhà khoa học Đại học Duy Tân nhận giải Quả Cầu Vàng năm 2020', '20190529_102149-9.jpg', '2020-11-18 02:46:29');
INSERT INTO `news` (`id`, `decription`, `detail`, `enable`, `news_name`, `picture`, `createAt`) VALUES
(16, '<p>35 thí sinh xuất sắc nhất lọt vào <strong>Chung kết Cuộc thi Hoa hậu VN 2020 </strong>đang hết mình tập luyện và tích cực tham gia vào các hoạt động của cuộc thi để lan tỏa những giá trị của cái đẹp và của yếu tố nhân văn.</p>\r\n\r\n<p> </p>\r\n', '<p>35 thí sinh xuất sắc nhất lọt vào <strong>Chung kết Cuộc thi Hoa hậu VN 2020 </strong>đang hết mình tập luyện và tích cực tham gia vào các hoạt động của cuộc thi để lan tỏa những giá trị của cái đẹp và của yếu tố nhân văn.</p>\r\n\r\n<p> </p>\r\n\r\n<p>Vòng Chung kết sẽ chính thức được tổ chức vào ngày 20.11.2020 tại TP.HCM để tìm ra chủ nhân của Vương miện Hoa hậu Việt Nam 2020. Là một trong những thí sinh nổi bật tại cuộc thi, Nguyễn Thị Trân Châu - mang số báo danh 135, hiện đang là sinh viên của <a href=\"https://duytan.edu.vn/\"><strong>Đại học (ĐH) Duy Tân</strong></a>, đã có những phần thể hiện rất tốt, hứa hẹn sẽ là nhân tố bất ngờ của đêm Chung kết. Hãy cùng ghi nhận những dấu ấn của Trân Châu qua các phần thi và những hoạt động tại Cuộc thi</p>\r\n\r\n<p>Hoa hậu Việt Nam 2020 trước thềm đêm thi Chung kết.</p>\r\n\r\n<p> </p>\r\n\r\n<p><img alt=\"Sinh viên Đại học Duy Tân tỏa sáng trong Top 35 thí sinh Chung kết Hoa hậu VN 2020\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/1-78.jpg\" /></p>\r\n\r\n<p><em>Khoảnh khắc Trân Châu, cô gái đến từ Duy Xuyên - Quảng Nam, được xướng tên vào Top 35 thí sinh xuất sắc lọt vào Chung kết đã làm hài lòng người hâm mộ</em></p>\r\n\r\n<p> </p>\r\n\r\n<p><img alt=\"Sinh viên Đại học Duy Tân tỏa sáng trong Top 35 thí sinh Chung kết Hoa hậu VN 2020\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/2-1.jpg\" /></p>\r\n\r\n<p><em>Sở hữu số đo 79 - 58 - 88, Trân Châu là một trong những thí sinh có vòng eo nhỏ nhất của Top 35 thí sinh vào Chung kết</em></p>\r\n\r\n<p> </p>\r\n\r\n<p><img alt=\"Sinh viên Đại học Duy Tân tỏa sáng trong Top 35 thí sinh Chung kết Hoa hậu VN 2020\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/3-16.jpg\" /></p>\r\n\r\n<p> </p>\r\n\r\n<p><img alt=\"Sinh viên Đại học Duy Tân tỏa sáng trong Top 35 thí sinh Chung kết Hoa hậu VN 2020\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/4-18.jpg\" /></p>\r\n\r\n<p><em>Trân Châu nổi bật trong đêm thi Người đẹp Biển mang tên Vũng Tàu - Điểm đến Thần tiên</em></p>\r\n\r\n<p> </p>\r\n\r\n<p><img alt=\"Sinh viên Đại học Duy Tân tỏa sáng trong Top 35 thí sinh Chung kết Hoa hậu VN 2020\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/5-84.jpg\" /></p>\r\n\r\n<p><em>Trân Châu và những người bạn trong dự án “Cơm hạnh phúc”</em></p>\r\n\r\n<p> </p>\r\n\r\n<p>Trong rất nhiều phần thi tại Cuộc thi Hoa hậu Việt Nam 2020, Trân Châu vui nhất là cùng các thí sinh khác tham gia các hoạt động của Dự án Nhân ái. Bởi đây là cơ hội để các bạn trẻ chia sẻ tình yêu thương cũng như chung sức hành động vì cộng đồng. Tham gia phần thi này, Trân Châu thực hiện dự án mang tên “Cơm hạnh phúc”. Dự án có sự đồng hành của bếp từ thiện Mười Thu - bếp ăn được thành lập và duy trì bởi cô Nguyễn Thị Thu, một người phụ nữ có tấm lòng nhân hậu, ấm áp.</p>\r\n\r\n<p> </p>\r\n\r\n<p>Trong hai ngày 19 và 20.10, “Cơm hạnh phúc” của Trân Châu đã tổ chức nấu và phát cơm từ thiện cho hơn 250 trẻ em và người già cao tuổi ở mái ấm Mây Ngàn, đồng thời hỗ trợ nhu yếu phẩm và quỹ hoạt động cho mái ấm Mây Ngàn - chùa Cẩm Phong, quốc lộ 22B, Cẩm Giang, Gò Dầu, Tây Ninh. Trân Châu tâm sự: <em>“Em không ngại khó khăn, sẵn sàng đến những vùng sâu vùng xa hay đến những nơi đang chịu ảnh hưởng của lũ lụt để giúp đỡ bà con. Chỉ cần bản thân em có thể làm được bất cứ gì, em sẽ cố gắng hết mình để chung tay vì cộng đồng”.</em></p>\r\n\r\n<p> </p>\r\n\r\n<p><img alt=\"Sinh viên Đại học Duy Tân tỏa sáng trong Top 35 thí sinh Chung kết Hoa hậu VN 2020\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/6-11.jpg\" /></p>\r\n\r\n<p><em>Trân Châu kêu gọi được 1 tấn gạo và các nhu yếu phẩm để hỗ trợ người dân bị ngập lụt tại quê nhà</em></p>\r\n\r\n<p> </p>\r\n\r\n<p>Những ngày này, miền Trung liên tục có mưa bão và ngập lụt. Quê nhà của Trân Châu ở Duy Xuyên, Quảng Nam cũng không tránh khỏi bị ảnh hưởng khiến em rất lo lắng. Vì đang nỗ lực tập luyện và tham gia các hoạt động của cuộc thi nên Trân Châu chưa thể về nhà. Tuy nhiên, cô gái nhỏ hiếu thuận luôn gọi điện để hỏi thăm tình hình quê nhà và ngay trong quá trình thi, em đã kêu gọi quyên góp được 1 tấn gạo cùng các nhu yếu phẩm để ủng hộ những người dân bị thiệt hại do bão lụt gây ra.</p>\r\n\r\n<p> </p>\r\n\r\n<p>Bên cạnh đó, Trân Châu cũng lên kế hoạch tiếp tục cùng với các “mạnh thường quân” đi trao tặng lương thực và những nhu yếu phẩm cần thiết nhất như gạo, dầu ăn, nước mắm, muối, mì chính cho những hộ gia đình bị thiệt hại nặng nề do thiên tai. Những hỗ trợ tuy nhỏ bé nhưng rất thiết thực của Trân Châu sẽ góp phần giúp người dân vượt qua được những khó khăn khi bị ảnh hưởng bởi thiên tai, lũ lụt.</p>\r\n\r\n<p> </p>\r\n\r\n<p><img alt=\"Sinh viên Đại học Duy Tân tỏa sáng trong Top 35 thí sinh Chung kết Hoa hậu VN 2020\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/7-86.jpg\" /></p>\r\n\r\n<p><em>Trân Châu cùng các thí sinh của Hoa hậu Việt Nam 2020 tự thực hiện các món ăn trong sự kiện Khai trương Siêu thị nhập khẩu tiêu chuẩn Nhật Bản Yen Market</em></p>\r\n\r\n<p> </p>\r\n\r\n<p><img alt=\"Sinh viên Đại học Duy Tân tỏa sáng trong Top 35 thí sinh Chung kết Hoa hậu VN 2020\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/8-58.jpg\" /></p>\r\n\r\n<p><em>Thể hiện tài năng với bài múa nhẹ nhàng và uyển chuyển, Trân Châu đã để lại ấn tượng sâu sắc với Ban Giám khảo và đông đảo khán giả</em></p>\r\n\r\n<p> </p>\r\n\r\n<p><img alt=\"Sinh viên Đại học Duy Tân tỏa sáng trong Top 35 thí sinh Chung kết Hoa hậu VN 2020\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/9-91.jpg\" /></p>\r\n\r\n<p> </p>\r\n\r\n<p><img alt=\"Sinh viên Đại học Duy Tân tỏa sáng trong Top 35 thí sinh Chung kết Hoa hậu VN 2020\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/10-89.jpg\" /></p>\r\n\r\n<p> </p>\r\n\r\n<p><img alt=\"Sinh viên Đại học Duy Tân tỏa sáng trong Top 35 thí sinh Chung kết Hoa hậu VN 2020\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/11-93.jpg\" /></p>\r\n\r\n<p><em>Trân Châu mang số báo danh 135 nổi bật cùng dàn thí sinh tham dự các hoạt động trong khuôn khổ của cuộc thi Hoa hậu Việt Nam 2020</em></p>\r\n\r\n<p> </p>\r\n\r\n<p>Trải qua nhiều các phần thi phụ cùng các hoạt động tại cuộc thi, Trân Châu đã có thêm nhiều bạn mới, có vô vàn những niềm vui và kỷ niệm đáng nhớ. Trân Châu cũng học được rất nhiều kỹ năng về trình diễn, catwalk cũng như vũ đạo tại cuộc thi. Nỗ lực hết mình trong mọi hoạt động, giờ đây Trân Châu đang rất hào hứng và tràn đầy tự tin chờ đến đêm Chung kết mang tính quyết định này.</p>\r\n\r\n<p> </p>\r\n\r\n<p><img alt=\"Sinh viên Đại học Duy Tân tỏa sáng trong Top 35 thí sinh Chung kết Hoa hậu VN 2020\" src=\"https://cdn.duytan.edu.vn/news/uploads/images/12-11.jpg\" /></p>\r\n\r\n<p><em>Gương mặt khả ái, nụ cười tỏa nắng cùng nhan sắc được ví như “kẹo ngọt”, Nguyễn Thị Trân Châu đang thực sự tỏa sáng tại cuộc thi Hoa hậu Việt Nam 2020</em></p>\r\n\r\n<p> </p>\r\n\r\n<p>Trong quá trình tham dự cuộc thi Hoa hậu Việt Nam 2020, Trân Châu đã nhận được rất nhiều sự ủng hộ từ thầy cô và các bạn tại trường ĐH Duy Tân. <em>“Không chỉ khi học tại giảng đường, các thầy cô đã rất nhiệt tình truyền thụ kiến thức và kỹ năng cho em mà ngay cho cuộc thi này, các thầy cô cũng luôn dõi theo hành trình dự thi của em và động viên em rất nhiều. Cám ơn các thầy cô và bạn bè đã luôn đồng hành cùng em trong học tập, trong cuộc sống và cả trong cuộc thi Hoa hậu Việt Nam rất ý nghĩa này”</em>, Trân Châu chia sẻ.</p>\r\n\r\n<p> </p>\r\n\r\n<p><strong>Chung kết Hoa hậu Việt Nam 2020</strong> sẽ diễn ra tại TP.HCM vào đêm 20.11.2020, Trân Châu và các thí sinh đang rất tích cực và nỗ lực để tập luyện chuẩn bị cho đêm Chung kết. Hãy bình chọn cho Nguyễn Thị Trân Châu qua cổng bình chọn của Bvote tại link <a href=\"https://hoahauvietnam.bvote.vn/\">https://hoahauvietnam.bvote.vn/ </a>để cô gái có nụ cười tỏa nắng này có cơ hội toả sáng và đến gần hơn với chiếc vương miện danh giá của Hoa Hậu Việt Nam 2020 nhé!</p>\r\n', 1, 'Sinh viên Đại học Duy Tân tỏa sáng trong Top 35 thí sinh Chung kết Hoa hậu VN 2020', '3c-92.jpg', '2020-12-08 16:32:02');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `role`
--

INSERT INTO `role` (`id`, `name`) VALUES
(1, 'ADMIN'),
(2, 'MANAGER'),
(3, 'TEACHER'),
(4, 'ALUMNI'),
(5, 'STUDENT');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `trainning_system`
--

CREATE TABLE `trainning_system` (
  `id` int(11) NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `training_system_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `trainning_system`
--

INSERT INTO `trainning_system` (`id`, `code`, `training_system_name`) VALUES
(1, 'DH', 'Đại Học');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `alumni_group`
--
ALTER TABLE `alumni_group`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKahet9s63nsf6haypk6o7gqawp` (`create_by`);

--
-- Chỉ mục cho bảng `chatchannel`
--
ALTER TABLE `chatchannel`
  ADD PRIMARY KEY (`uuid`),
  ADD KEY `chatchannel_ibfk_1` (`userIdOne`),
  ADD KEY `chatchannel_ibfk_2` (`userIdTwo`);

--
-- Chỉ mục cho bảng `chatmessage`
--
ALTER TABLE `chatmessage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chatmessage_ibfk_1` (`authorUserId`),
  ADD KEY `chatmessage_ibfk_2` (`recipientUserId`);

--
-- Chỉ mục cho bảng `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKgrxmwlp2sbi6we2dtaqtd4asx` (`authorId`);

--
-- Chỉ mục cho bảng `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `edu_level`
--
ALTER TABLE `edu_level`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `faculty`
--
ALTER TABLE `faculty`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `folow_job`
--
ALTER TABLE `folow_job`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `group_member`
--
ALTER TABLE `group_member`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKhm4ypkf4tyhf6he2ngw09t6p4` (`group_id`),
  ADD KEY `FKeamf7nngsg582uxwqgde8o28x` (`member_id`);

--
-- Chỉ mục cho bảng `group_post`
--
ALTER TABLE `group_post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKg3nb0hmavnnhgndqmcea8w1rp` (`group_id`),
  ADD KEY `FKgopw03ykvj1b8r1kxqxhnsqqr` (`author_id`);

--
-- Chỉ mục cho bảng `job`
--
ALTER TABLE `job`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK9wag5yf19odet2ehd4wochvbe` (`authorId`),
  ADD KEY `FK65ble7l5oimv9mnw6ybwac6eu` (`major_id`);

--
-- Chỉ mục cho bảng `job_apply`
--
ALTER TABLE `job_apply`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKant3yxiy3mym63b4ofq0tyssn` (`member_id`),
  ADD KEY `FKfqj0ch7p74m8g4ibl5oxsnvm0` (`job_id`);

--
-- Chỉ mục cho bảng `kname`
--
ALTER TABLE `kname`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `like_post`
--
ALTER TABLE `like_post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKewf8t5o3mqdxavpi2eapo9wbm` (`author_id`);

--
-- Chỉ mục cho bảng `major`
--
ALTER TABLE `major`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKrbpflj1p41y81s9d2jf5ix2jv` (`faculty_id`);

--
-- Chỉ mục cho bảng `major_file`
--
ALTER TABLE `major_file`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKoglmq8fkpvi5x65a26ul3k495` (`jobId`),
  ADD KEY `FKlvgxyb675m5pvo7mkbmf6gp01` (`authorId`);

--
-- Chỉ mục cho bảng `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_t_member_edu_level` (`edu_level_id`),
  ADD KEY `FKeqnko95dqqreocnsc3i7tqyqj` (`major_id`),
  ADD KEY `FKhy7vopt86e2jdoovh4dw4us4i` (`member_type_id`),
  ADD KEY `FK_t_member_trainning_system` (`trainning_system_id`),
  ADD KEY `FK7tt865asjdplsv89ygeodtnum` (`faculty_id`),
  ADD KEY `FKfhl0jwf998q7xruieneeoybvs` (`kname_id`),
  ADD KEY `FK_t_member_role` (`role_id`);

--
-- Chỉ mục cho bảng `member_group`
--
ALTER TABLE `member_group`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK44ccmfb1t5udx1tph77bj6u27` (`group_id`),
  ADD KEY `FKi9080rfwtrt5jlvim4mcg4rl4` (`member_id`);

--
-- Chỉ mục cho bảng `member_role`
--
ALTER TABLE `member_role`
  ADD PRIMARY KEY (`member_id`,`role_id`),
  ADD KEY `FKdiix07v86r3ntrbs3l02qr7y0` (`role_id`);

--
-- Chỉ mục cho bảng `member_type`
--
ALTER TABLE `member_type`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `network`
--
ALTER TABLE `network`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_t_member_1` (`member_id`),
  ADD KEY `fk_t_member_2` (`friend_id`);

--
-- Chỉ mục cho bảng `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `trainning_system`
--
ALTER TABLE `trainning_system`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `alumni_group`
--
ALTER TABLE `alumni_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `chatmessage`
--
ALTER TABLE `chatmessage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT cho bảng `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `edu_level`
--
ALTER TABLE `edu_level`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `event`
--
ALTER TABLE `event`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `faculty`
--
ALTER TABLE `faculty`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `folow_job`
--
ALTER TABLE `folow_job`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `group_member`
--
ALTER TABLE `group_member`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `group_post`
--
ALTER TABLE `group_post`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT cho bảng `job`
--
ALTER TABLE `job`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `job_apply`
--
ALTER TABLE `job_apply`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `kname`
--
ALTER TABLE `kname`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `like_post`
--
ALTER TABLE `like_post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT cho bảng `major`
--
ALTER TABLE `major`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `major_file`
--
ALTER TABLE `major_file`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `member`
--
ALTER TABLE `member`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `member_group`
--
ALTER TABLE `member_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `member_role`
--
ALTER TABLE `member_role`
  MODIFY `member_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `member_type`
--
ALTER TABLE `member_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `network`
--
ALTER TABLE `network`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `trainning_system`
--
ALTER TABLE `trainning_system`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `alumni_group`
--
ALTER TABLE `alumni_group`
  ADD CONSTRAINT `FKahet9s63nsf6haypk6o7gqawp` FOREIGN KEY (`create_by`) REFERENCES `member` (`id`);

--
-- Các ràng buộc cho bảng `chatchannel`
--
ALTER TABLE `chatchannel`
  ADD CONSTRAINT `chatchannel_ibfk_1` FOREIGN KEY (`userIdOne`) REFERENCES `member` (`id`),
  ADD CONSTRAINT `chatchannel_ibfk_2` FOREIGN KEY (`userIdTwo`) REFERENCES `member` (`id`);

--
-- Các ràng buộc cho bảng `chatmessage`
--
ALTER TABLE `chatmessage`
  ADD CONSTRAINT `chatmessage_ibfk_1` FOREIGN KEY (`authorUserId`) REFERENCES `member` (`id`),
  ADD CONSTRAINT `chatmessage_ibfk_2` FOREIGN KEY (`recipientUserId`) REFERENCES `member` (`id`);

--
-- Các ràng buộc cho bảng `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `FKgrxmwlp2sbi6we2dtaqtd4asx` FOREIGN KEY (`authorId`) REFERENCES `member` (`id`);

--
-- Các ràng buộc cho bảng `group_member`
--
ALTER TABLE `group_member`
  ADD CONSTRAINT `FKeamf7nngsg582uxwqgde8o28x` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`),
  ADD CONSTRAINT `FKhm4ypkf4tyhf6he2ngw09t6p4` FOREIGN KEY (`group_id`) REFERENCES `alumni_group` (`id`);

--
-- Các ràng buộc cho bảng `group_post`
--
ALTER TABLE `group_post`
  ADD CONSTRAINT `FKg3nb0hmavnnhgndqmcea8w1rp` FOREIGN KEY (`group_id`) REFERENCES `alumni_group` (`id`),
  ADD CONSTRAINT `FKgopw03ykvj1b8r1kxqxhnsqqr` FOREIGN KEY (`author_id`) REFERENCES `member` (`id`);

--
-- Các ràng buộc cho bảng `job`
--
ALTER TABLE `job`
  ADD CONSTRAINT `FK65ble7l5oimv9mnw6ybwac6eu` FOREIGN KEY (`major_id`) REFERENCES `major` (`id`),
  ADD CONSTRAINT `FK9wag5yf19odet2ehd4wochvbe` FOREIGN KEY (`authorId`) REFERENCES `member` (`id`);

--
-- Các ràng buộc cho bảng `job_apply`
--
ALTER TABLE `job_apply`
  ADD CONSTRAINT `FKant3yxiy3mym63b4ofq0tyssn` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`),
  ADD CONSTRAINT `FKfqj0ch7p74m8g4ibl5oxsnvm0` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`);

--
-- Các ràng buộc cho bảng `like_post`
--
ALTER TABLE `like_post`
  ADD CONSTRAINT `FKewf8t5o3mqdxavpi2eapo9wbm` FOREIGN KEY (`author_id`) REFERENCES `member` (`id`);

--
-- Các ràng buộc cho bảng `major`
--
ALTER TABLE `major`
  ADD CONSTRAINT `FKrbpflj1p41y81s9d2jf5ix2jv` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`id`);

--
-- Các ràng buộc cho bảng `major_file`
--
ALTER TABLE `major_file`
  ADD CONSTRAINT `FKlvgxyb675m5pvo7mkbmf6gp01` FOREIGN KEY (`authorId`) REFERENCES `member` (`id`),
  ADD CONSTRAINT `FKoglmq8fkpvi5x65a26ul3k495` FOREIGN KEY (`jobId`) REFERENCES `job` (`id`);

--
-- Các ràng buộc cho bảng `member`
--
ALTER TABLE `member`
  ADD CONSTRAINT `FK7tt865asjdplsv89ygeodtnum` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`id`),
  ADD CONSTRAINT `FK_t_member_edu_level` FOREIGN KEY (`edu_level_id`) REFERENCES `edu_level` (`id`),
  ADD CONSTRAINT `FK_t_member_role` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
  ADD CONSTRAINT `FK_t_member_trainning_system` FOREIGN KEY (`trainning_system_id`) REFERENCES `trainning_system` (`id`),
  ADD CONSTRAINT `FKeqnko95dqqreocnsc3i7tqyqj` FOREIGN KEY (`major_id`) REFERENCES `major` (`id`),
  ADD CONSTRAINT `FKfhl0jwf998q7xruieneeoybvs` FOREIGN KEY (`kname_id`) REFERENCES `kname` (`id`),
  ADD CONSTRAINT `FKhy7vopt86e2jdoovh4dw4us4i` FOREIGN KEY (`member_type_id`) REFERENCES `member_type` (`id`);

--
-- Các ràng buộc cho bảng `member_group`
--
ALTER TABLE `member_group`
  ADD CONSTRAINT `FK44ccmfb1t5udx1tph77bj6u27` FOREIGN KEY (`group_id`) REFERENCES `alumni_group` (`id`),
  ADD CONSTRAINT `FKi9080rfwtrt5jlvim4mcg4rl4` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`);

--
-- Các ràng buộc cho bảng `member_role`
--
ALTER TABLE `member_role`
  ADD CONSTRAINT `FK34g7epqlcxqloewku3aoqhhmg` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`),
  ADD CONSTRAINT `FKdiix07v86r3ntrbs3l02qr7y0` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);

--
-- Các ràng buộc cho bảng `network`
--
ALTER TABLE `network`
  ADD CONSTRAINT `fk_t_member_1` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`),
  ADD CONSTRAINT `fk_t_member_2` FOREIGN KEY (`friend_id`) REFERENCES `member` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
