-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 08, 2020 lúc 01:27 PM
-- Phiên bản máy phục vụ: 10.4.13-MariaDB
-- Phiên bản PHP: 7.4.7

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
  `sum_member` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `alumni_group`
--

INSERT INTO `alumni_group` (`id`, `group_decription`, `group_name`, `create_by`, `sum_member`) VALUES
(1, 'ds', 'CMU', 1, 0),
(2, 'CSU', 'CSU', 1, 0);

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
  `time_start` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `event`
--

INSERT INTO `event` (`id`, `decription`, `enable`, `event_name`, `place`, `time_end`, `time_start`) VALUES
(1, 'fkjdh', 1, 'e fd f', '03 Quang trung', '2020-10-17 15:42:00', '2020-10-16 15:42:00'),
(2, 'gdfgdfgdf', 1, 'fdsfgds', 'sdgdf', '2020-10-10 15:42:00', '2020-10-16 15:42:00'),
(3, 'rưerwerwe', 1, 'rrwerew', 'rewrwe', '2020-10-25 15:43:00', '2020-10-16 15:43:00'),
(4, 'fdsf', 0, 'ffff', 'fdf', '2020-10-08 15:50:00', '2020-10-13 15:50:00'),
(5, 'fdfsd', 0, 'dfsdfds', 'ff', '2020-10-02 16:29:00', '2020-10-02 16:27:00'),
(6, 'fdsfd', 0, 'fdgdfgdfg', 'fdfd', '2020-10-10 16:49:00', '2020-10-02 16:47:00');

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
  `id` int(11) NOT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `media` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sum_comment` int(11) DEFAULT NULL,
  `sum_like` int(11) DEFAULT NULL,
  `time_post` datetime NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `groupId` int(11) DEFAULT NULL,
  `authorId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, 'dsadas', '2020-11-11', '<p>fdsfsfd</p>\r\n', 1, 'Vietnam', 'đâs', '2020-10-06', '10.000.000 VNĐ', NULL, 1, 2),
(6, 'fdfsd', '2020-12-11', '<p>fsfd</p>\r\n', 1, 'Vietnam', 'fdfdsgfgfh', '2020-10-06', 'fd', 1, 1, 0),
(7, 'TP Entertainment', '2020-11-11', '<p>Tại sao bạn sẽ y&ecirc;u th&iacute;ch m&ocirc;i trường l&agrave;m việc tại đ&acirc;y? M&ocirc;i trường l&agrave;m việc chuy&ecirc;n nghiệp, đồng nghiệp th&acirc;n thiện, team l&agrave;m việc thiện chiến, lu&ocirc;n hỗ trợ lẫn nhau. Sếp lu&ocirc;n lắng nghe, tạo điều kiện...</p>\r\n\r\n<ul>\r\n	<li>L&agrave;m việc trong m&ocirc;i trường trẻ trung, th&acirc;n thiện v&agrave; hướng đến việc ph&aacute;t triển con người;</li>\r\n	<li>Thưởng n&oacute;ng qu&yacute;, lương th&aacute;ng 13, một năm l&ecirc;n đến 17 th&aacute;ng lương;</li>\r\n	<li>Review lương 2 lần/năm;</li>\r\n</ul>\r\n', 1, 'Hà Nội', 'Junior Java Dev', '2020-10-06', 'Thỏa Thuận', 1, 1, 4),
(8, 'fsfdg', '1111-11-11', '<p>gdfgdf</p>\r\n', 1, 'dfgdf', 'gfdgdf', '2020-10-07', 'fdfgd', 1, 2, 0),
(9, 'hghgf', '2009-03-22', '<p>hfghfghfggfgdfgdfgd</p>\r\n', 1, 'hgjjhg', 'hgfhfg', '2020-10-07', 'gfdgd', 1, 1, 0),
(10, 'gfhfg', '2020-11-11', '<p>hfghfghfgdfgdfgd</p>\r\n', 1, 'hfghfg', 'hgfhfg', '2020-10-07', 'fdgdg', 1, 1, 3),
(11, 'dsadas', '2020-11-11', '<p>fdffs</p>\r\n', 1, 'fdfdffsd', 'fdfds', '2020-10-07', '10.000.000 VNĐ', 1, 1, 0),
(12, 'fdsfsdfs', '2020-10-11', '<p>fsdfsdfsdfsfdsf</p>\r\n', 1, 'fsdfs', 'fdsfds', '2020-10-07', 'dsfsdfs', 1, 1, 1);

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
(5, 7, 2, 'Nguyen-Van-Nghia-CV.pdf', '2020-10-07 06:14:51', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `major`
--

CREATE TABLE `major` (
  `id` int(11) NOT NULL,
  `major_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `major_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `major`
--

INSERT INTO `major` (`id`, `major_code`, `major_name`) VALUES
(1, 'CNT', 'Công nghệ phần mềm'),
(2, 'ANM', 'An Ninh Mạng'),
(3, 'HTTT', 'Hệ Thông Thông Tin Quản Lý');

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
  `address_now` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dat_of_birth` date DEFAULT NULL,
  `decription` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dtuMail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enable` int(11) NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hometown` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `marital_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `work_at` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `year_greduate` int(11) NOT NULL,
  `year_participate` int(11) NOT NULL,
  `edu_level_id` int(11) DEFAULT NULL,
  `major_id` int(11) DEFAULT NULL,
  `member_type_id` int(11) DEFAULT NULL,
  `trainning_system_id` int(11) DEFAULT NULL,
  `yearGreduate` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `member`
--

INSERT INTO `member` (`id`, `address_now`, `avatar`, `dat_of_birth`, `decription`, `dtuMail`, `email`, `enable`, `first_name`, `gender`, `hometown`, `last_name`, `marital_status`, `password`, `phone`, `token`, `work_at`, `year_greduate`, `year_participate`, `edu_level_id`, `major_id`, `member_type_id`, `trainning_system_id`, `yearGreduate`) VALUES
(1, 'dkjfgh', 'nghia.jpg', '2020-10-06', 'sdfdf', 'nghia123', 'fdsfds', 0, 'fds', 'fds', 'fd', 'fd', '1', '$2a$10$ZgJGjzXVhEkWyBGM8rPVUucW9KBL4dBwrYP4cOQsegLZSJTDmJQEa', '0968997331', 'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJmZHNmZHMiLCJleHAiOjE2MDIxNjAwMjgsImlhdCI6MTYwMjE0MjAyOH0.VNndOdN1mSdgIlW6CH0bh8ZAuT6qneKXoxEfIwEbvS2ifLpY6czX7uhkDsT5HGDXhRns75MaINX089Y1dSpOsg', 'sb', 2021, 2017, 1, 1, 1, 1, 0),
(2, 'dfd', 'nghia.jpg', '2020-10-16', 'fdfds', 'nghia', 'nghianguyen168197@gmail.com', 1, 'Nguyễn Văn', 'male', 'Quảng Bình', 'Nghĩa', '1', '$2a$10$ZgJGjzXVhEkWyBGM8rPVUucW9KBL4dBwrYP4cOQsegLZSJTDmJQEa', '0968997331', 'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJuZ2hpYW5ndXllbjE2ODE5N0BnbWFpbC5jb20iLCJleHAiOjE2MDIwNjkyNjYsImlhdCI6MTYwMjA1MTI2Nn0.H7ICwLRpV6C5RCl70efw8q6EhcePUqQNrTikrBn2ktJhUr4SMPlrow9UHfWfy2ro6fMqWiNWT3SYD8Z_cD7lbA', 'Đn', 2021, 2017, 1, 1, 1, 1, 2021);

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
  `type_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `member_type`
--

INSERT INTO `member_type` (`id`, `type_name`) VALUES
(1, 'Alumni'),
(2, 'Student');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `network`
--

CREATE TABLE `network` (
  `id` int(11) NOT NULL,
  `friend_id` tinyblob NOT NULL,
  `member_id` tinyblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `decription` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enable` int(11) DEFAULT NULL,
  `news_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `picture` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `news`
--

INSERT INTO `news` (`id`, `decription`, `detail`, `enable`, `news_name`, `picture`, `createAt`) VALUES
(1, 'fsdfsd', 'dfdsfds', 1, 'fdfsds', 'thiet-ke-biet-thu-noi-that-dang-cap-3.jpg', '2020-10-14 15:45:05'),
(2, '<p>d</p>\r\n', '', 1, 'd', 'thiet-ke-noi-that-nha-pho-4-tang_13-2-1100x550.jpg', '2020-10-16 15:45:09'),
(3, '<p>f</p>\r\n', '', 1, 'fdfd', 'thiet-ke-noi-that-nha-pho-4-tang_13-2-1100x550.jpg', '2020-10-17 15:45:13'),
(5, '<p>đ&acirc;</p>\r\n', '', 1, 'gfdfd', 'bo-phong-ngu-cho-be-mau-trang-tinh-khoi-TBN001.jpg', '2020-10-02 16:49:31');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `role`
--

INSERT INTO `role` (`id`, `name`) VALUES
(1, 'Admin'),
(2, 'Alumni');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `trainning_system`
--

CREATE TABLE `trainning_system` (
  `id` int(11) NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `training_system_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
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
-- Chỉ mục cho bảng `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKgrxmwlp2sbi6we2dtaqtd4asx` (`authorId`);

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
  ADD KEY `FK6is3cr8aufb9uvs0e34s9uwgc` (`groupId`),
  ADD KEY `FKht69uyfmyp2vluxklcq6asdjt` (`authorId`);

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
-- Chỉ mục cho bảng `major`
--
ALTER TABLE `major`
  ADD PRIMARY KEY (`id`);

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
  ADD KEY `FK_t_member_trainning_system` (`trainning_system_id`);

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
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `edu_level`
--
ALTER TABLE `edu_level`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `event`
--
ALTER TABLE `event`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `group_member`
--
ALTER TABLE `group_member`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `group_post`
--
ALTER TABLE `group_post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `job`
--
ALTER TABLE `job`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `job_apply`
--
ALTER TABLE `job_apply`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `member_role`
--
ALTER TABLE `member_role`
  MODIFY `member_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `member_type`
--
ALTER TABLE `member_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `network`
--
ALTER TABLE `network`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `trainning_system`
--
ALTER TABLE `trainning_system`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `alumni_group`
--
ALTER TABLE `alumni_group`
  ADD CONSTRAINT `FKahet9s63nsf6haypk6o7gqawp` FOREIGN KEY (`create_by`) REFERENCES `member` (`id`);

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
  ADD CONSTRAINT `FK6is3cr8aufb9uvs0e34s9uwgc` FOREIGN KEY (`groupId`) REFERENCES `alumni_group` (`id`),
  ADD CONSTRAINT `FKht69uyfmyp2vluxklcq6asdjt` FOREIGN KEY (`authorId`) REFERENCES `member` (`id`);

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
-- Các ràng buộc cho bảng `major_file`
--
ALTER TABLE `major_file`
  ADD CONSTRAINT `FKlvgxyb675m5pvo7mkbmf6gp01` FOREIGN KEY (`authorId`) REFERENCES `member` (`id`),
  ADD CONSTRAINT `FKoglmq8fkpvi5x65a26ul3k495` FOREIGN KEY (`jobId`) REFERENCES `job` (`id`);

--
-- Các ràng buộc cho bảng `member`
--
ALTER TABLE `member`
  ADD CONSTRAINT `FK_t_member_edu_level` FOREIGN KEY (`edu_level_id`) REFERENCES `edu_level` (`id`),
  ADD CONSTRAINT `FK_t_member_trainning_system` FOREIGN KEY (`trainning_system_id`) REFERENCES `trainning_system` (`id`),
  ADD CONSTRAINT `FKeqnko95dqqreocnsc3i7tqyqj` FOREIGN KEY (`major_id`) REFERENCES `major` (`id`),
  ADD CONSTRAINT `FKhy7vopt86e2jdoovh4dw4us4i` FOREIGN KEY (`member_type_id`) REFERENCES `member_type` (`id`);

--
-- Các ràng buộc cho bảng `member_role`
--
ALTER TABLE `member_role`
  ADD CONSTRAINT `FK34g7epqlcxqloewku3aoqhhmg` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`),
  ADD CONSTRAINT `FKdiix07v86r3ntrbs3l02qr7y0` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
