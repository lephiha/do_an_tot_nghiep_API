-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th4 22, 2025 lúc 05:32 AM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `do_an`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `np_accounts`
--

CREATE TABLE `np_accounts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `instagram_id` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` text NOT NULL,
  `proxy` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `last_login` datetime NOT NULL,
  `login_required` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `np_captions`
--

CREATE TABLE `np_captions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `caption` text NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `np_files`
--

CREATE TABLE `np_files` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` text NOT NULL,
  `info` text NOT NULL,
  `filename` varchar(200) NOT NULL,
  `filesize` varchar(255) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `np_general_data`
--

CREATE TABLE `np_general_data` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `np_general_data`
--

INSERT INTO `np_general_data` (`id`, `name`, `data`) VALUES
(1, 'settings', '{\"site_name\":\"Nextpost\",\"site_description\":\"Nextpost - Auto Post, Schedule & Manage your Instagram Multi Account\",\"site_keywords\":\"nextpost, instagram, auto post, schedule, multiple accounts, social media\",\"currency\":\"USD\",\"proxy\":true,\"user_proxy\":true,\"geonamesorg_username\":\"\",\"logomark\":\"\",\"logotype\":\"\"}'),
(2, 'integrations', '{\"dropbox\":{\"api_key\":\"\"},\"google\":{\"api_key\":\"\",\"client_id\":\"\",\"analytics\":{\"property_id\":\"\"}},\"onedrive\":{\"client_id\":\"\"},\"paypal\":{\"client_id\":\"\",\"client_secret\":\"\",\"environment\":\"sandbox\"},\"stripe\":{\"environment\":\"sandbox\",\"publishable_key\":\"\",\"secret_key\":\"\"},\"facebook\":{\"app_id\":\"\",\"app_secret\":\"\"}}'),
(3, 'free-trial', '{\"size\":7,\"storage\":{\"total\":\"100.00\",\"file\":-1},\"max_accounts\":1,\"file_pickers\":{\"dropbox\":true,\"onedrive\":true,\"google_drive\":true},\"post_types\":{\"timeline_photo\":true,\"timeline_video\":true,\"story_photo\":true,\"story_video\":true,\"album_photo\":true,\"album_video\":true},\"spintax\":true,\"modules\":[]}'),
(4, 'email-settings', '{\"smtp\":{\"host\":\"\",\"port\":\"\",\"encryption\":\"\",\"auth\":true,\"username\":\"\",\"password\":\"\",\"from\":\"\"},\"notifications\":{\"emails\":\"\",\"new_user\":true,\"new_payment\":true}}');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `np_options`
--

CREATE TABLE `np_options` (
  `id` int(10) NOT NULL,
  `option_name` varchar(255) NOT NULL,
  `option_value` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `np_orders`
--

CREATE TABLE `np_orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `data` text NOT NULL,
  `status` varchar(50) NOT NULL,
  `payment_gateway` varchar(20) NOT NULL,
  `payment_id` varchar(100) NOT NULL,
  `total` double(10,2) NOT NULL,
  `paid` double(10,2) NOT NULL,
  `currency` varchar(10) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `np_packages`
--

CREATE TABLE `np_packages` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `monthly_price` double(10,2) NOT NULL,
  `annual_price` float(10,2) NOT NULL,
  `settings` text NOT NULL,
  `is_public` tinyint(1) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `np_packages`
--

INSERT INTO `np_packages` (`id`, `title`, `monthly_price`, `annual_price`, `settings`, `is_public`, `date`) VALUES
(1, 'Alpha', 4.99, 49.00, '{\"storage\":{\"total\":\"150.00\",\"file\":\"15.00\"},\"max_accounts\":1,\"file_pickers\":{\"dropbox\":false,\"onedrive\":false,\"google_drive\":false},\"post_types\":{\"timeline_photo\":true,\"timeline_video\":false,\"story_photo\":true,\"story_video\":false,\"album_photo\":true,\"album_video\":false},\"spintax\":false}', 1, '2017-03-18 19:22:44'),
(2, 'Beta Pack', 7.99, 79.00, '{\"storage\":{\"total\":\"250\",\"file\":\"30.00\"},\"max_accounts\":3,\"file_pickers\":{\"dropbox\":true,\"onedrive\":true,\"google_drive\":true},\"post_types\":{\"timeline_photo\":true,\"timeline_video\":true,\"story_photo\":true,\"story_video\":true,\"album_photo\":true,\"album_video\":true},\"spintax\":true,\"modules\":[]}', 1, '2017-03-18 19:29:19'),
(3, 'Gamma Pack', 17.99, 165.79, '{\"storage\":{\"total\":\"300.00\",\"file\":\"50.00\"},\"max_accounts\":-1,\"file_pickers\":{\"dropbox\":true,\"onedrive\":true,\"google_drive\":true},\"post_types\":{\"timeline_photo\":true,\"timeline_video\":true,\"story_photo\":true,\"story_video\":true,\"album_photo\":true,\"album_video\":true},\"spintax\":true}', 1, '2017-03-18 19:29:43');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `np_plugins`
--

CREATE TABLE `np_plugins` (
  `id` int(11) NOT NULL,
  `idname` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `np_posts`
--

CREATE TABLE `np_posts` (
  `id` int(11) NOT NULL,
  `status` varchar(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` varchar(20) NOT NULL,
  `caption` text NOT NULL,
  `first_comment` text NOT NULL,
  `location` text NOT NULL,
  `media_ids` varchar(255) NOT NULL,
  `remove_media` text NOT NULL,
  `account_id` int(11) NOT NULL,
  `is_scheduled` tinyint(1) NOT NULL,
  `create_date` datetime NOT NULL,
  `schedule_date` datetime NOT NULL,
  `publish_date` datetime NOT NULL,
  `is_hidden` tinyint(1) NOT NULL,
  `data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `np_proxies`
--

CREATE TABLE `np_proxies` (
  `id` int(11) NOT NULL,
  `proxy` varchar(255) NOT NULL,
  `country_code` varchar(2) NOT NULL,
  `use_count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `np_users`
--

CREATE TABLE `np_users` (
  `id` int(11) NOT NULL,
  `account_type` varchar(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(200) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `package_id` int(11) NOT NULL,
  `package_subscription` tinyint(1) NOT NULL,
  `settings` text NOT NULL,
  `preferences` text NOT NULL,
  `is_active` int(11) NOT NULL,
  `expire_date` datetime NOT NULL,
  `date` datetime NOT NULL,
  `data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `np_users`
--

INSERT INTO `np_users` (`id`, `account_type`, `email`, `username`, `password`, `firstname`, `lastname`, `package_id`, `package_subscription`, `settings`, `preferences`, `is_active`, `expire_date`, `date`, `data`) VALUES
(1, 'admin', 'ADMIN_EMAIL', 'admin', 'ADMIN_PASSWORD', 'ADMIN_FIRSTNAME', 'ADMIN_LASTNAME', 3, 1, '{\"storage\":{\"total\":\"300.00\",\"file\":\"50.00\"},\"max_accounts\":-1,\"file_pickers\":{\"dropbox\":true,\"onedrive\":true,\"google_drive\":true},\"post_types\":{\"timeline_photo\":true,\"timeline_video\":true,\"story_photo\":true,\"story_video\":true,\"album_photo\":true,\"album_video\":true},\"spintax\":true}', '{\"timezone\":\"ADMIN_TIMEZONE\",\"dateformat\":\"Y-m-d\",\"timeformat\":\"24\",\"language\":\"en-US\"}', 1, '2030-12-31 23:59:59', '0000-00-00 00:00:00', '{}');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tn_appointments`
--

CREATE TABLE `tn_appointments` (
  `id` int(11) NOT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `booking_id` int(11) NOT NULL,
  `patient_name` varchar(50) DEFAULT NULL,
  `patient_birthday` varchar(10) DEFAULT NULL,
  `patient_reason` varchar(255) DEFAULT NULL,
  `patient_phone` varchar(15) DEFAULT NULL,
  `numerical_order` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `appointment_time` varchar(20) DEFAULT NULL,
  `date` varchar(10) DEFAULT NULL,
  `status` varchar(15) DEFAULT NULL,
  `create_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tn_appointments`
--

INSERT INTO `tn_appointments` (`id`, `doctor_id`, `patient_id`, `booking_id`, `patient_name`, `patient_birthday`, `patient_reason`, `patient_phone`, `numerical_order`, `position`, `appointment_time`, `date`, `status`, `create_at`, `update_at`) VALUES
(1, 23, 3, 14, 'Lê Hoàng Nam', '1998-01-09', 'xem có phải ae k', '0392405600', 1, 1, '2025-04-22 10:45', '2025-04-22', 'processing', '2025-04-22 10:31:28', '2025-04-22 10:31:28');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tn_appointment_records`
--

CREATE TABLE `tn_appointment_records` (
  `id` int(11) NOT NULL,
  `appointment_id` int(11) DEFAULT NULL,
  `reason` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status_before` varchar(255) DEFAULT NULL,
  `status_after` varchar(255) DEFAULT NULL,
  `create_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tn_booking`
--

CREATE TABLE `tn_booking` (
  `id` int(11) NOT NULL,
  `service_id` int(11) DEFAULT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `booking_name` varchar(50) DEFAULT NULL,
  `booking_phone` varchar(15) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  `birthday` varchar(10) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `appointment_date` varchar(10) DEFAULT NULL,
  `appointment_hour` varchar(5) DEFAULT NULL,
  `status` varchar(15) DEFAULT NULL,
  `create_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `appointment_time` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tn_booking`
--

INSERT INTO `tn_booking` (`id`, `service_id`, `patient_id`, `booking_name`, `booking_phone`, `name`, `gender`, `birthday`, `address`, `reason`, `appointment_date`, `appointment_hour`, `status`, `create_at`, `update_at`, `doctor_id`, `appointment_time`) VALUES
(5, 1, 3, 'Lê Phi Hà', '0392405600', 'Lee Phi Hà', 1, '2004-03-02', 'hanoi', 'dau lung', '2025-04-03', NULL, 'cancelled', '2025-04-02 21:47:45', '2025-04-02 21:48:21', 0, '9:00'),
(6, 11, 8, 'Lê Phi Hà', '0392405600', 'Lee Phi Hà', 1, '2002-08-08', 'Ha noi', 'can thi', '2025-04-03', NULL, 'processing', '2025-04-02 21:53:13', '2025-04-02 21:53:13', 0, '9:00'),
(10, 22, 3, 'Lê Phi Hà', '0252475600', 'Hữu Hùng', 1, '2025-03-20', 'Nam Định', 'đau họng', '2025-04-20', NULL, 'verified', '2025-04-20 11:34:43', '2025-04-20 11:34:43', 0, '11:45'),
(11, 1, 8, 'Lê Phi Hà', '0392405600', 'Đinh Hà Uyên Thư', 0, '2006-05-09', 'Hà Nội', 'khó chịu trong người', '2025-04-20', NULL, 'verified', '2025-04-20 11:39:15', '2025-04-20 11:39:15', 5, '11:51'),
(12, 10, 3, 'Lê Phi Hà', '0248851341', 'Lee Min Ho', 1, '2002-09-10', 'Seul, Korea', 'đau răng', '2025-04-22', NULL, 'verified', '2025-04-21 23:27:40', '2025-04-21 23:27:40', 0, '10:05'),
(13, 1, 3, 'Lê Phi Hà', '0335147896', 'Lee Min Ho', 1, '2002-09-10', 'Seul, Korea', 'khó chịu trong người', '2025-04-22', NULL, 'verified', '2025-04-22 10:23:24', '2025-04-22 10:23:24', 23, '10:45'),
(14, 23, 3, 'Lê Phi Hà', '0392405600', 'Lê Hoàng Nam', 1, '1998-01-09', 'Thanh Hoá', 'xem có phải ae k', '2025-04-22', NULL, 'verified', '2025-04-22 10:29:21', '2025-04-22 10:29:21', 0, '10:45');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tn_booking_photo`
--

CREATE TABLE `tn_booking_photo` (
  `id` int(11) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `booking_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tn_booking_photo`
--

INSERT INTO `tn_booking_photo` (`id`, `url`, `booking_id`) VALUES
(1, 'booking_10_1745123694.jpg', 10),
(2, 'booking_11_1745123973.jpg', 11),
(3, 'booking_13_1745292227.jpg', 13);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tn_doctors`
--

CREATE TABLE `tn_doctors` (
  `id` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `role` varchar(10) DEFAULT NULL,
  `active` int(11) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `create_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  `speciality_id` int(11) DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `recovery_token` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tn_doctors`
--

INSERT INTO `tn_doctors` (`id`, `email`, `phone`, `password`, `name`, `description`, `price`, `role`, `active`, `avatar`, `create_at`, `update_at`, `speciality_id`, `room_id`, `recovery_token`) VALUES
(1, 'phihasky@gmail.com', '0392405600', '123456', 'Lê Phi Hà', '<h2>Giáo sư, Bác sĩ Lê Phi Hà</h2>\n\n<ul>\n    <li><strong>Công tác:</strong> Trưởng Khoa Tim mạch, Bệnh viện Quân y 108</li>\n    <li><strong>Tốt nghiệp:</strong> Tiến sĩ Y học tại Đại học Y khoa Tokyo, Nhật Bản; Giáo sư Y học tại Đại học Y Hà Nội, Việt Nam</li>\n    <li><strong>Kinh nghiệm:</strong>\n        <ul>\n            <li>Giáo sư Y học tại Việt Nam, chuyên gia đầu ngành trong lĩnh vực Tim mạch, với hơn 25 năm kinh nghiệm trong điều trị các bệnh lý tim mạch, phẫu thuật tim mạch và can thiệp động mạch vành</li>\n            <li>Chủ tịch Hội Tim mạch Việt Nam, nhiệm kỳ 2019-2024</li>\n            <li>Giảng viên chính tại các trường đại học y khoa hàng đầu tại Việt Nam</li>\n            <li>Tham gia nghiên cứu và công bố hơn 50 công trình quốc tế trong lĩnh vực tim mạch</li>\n            <li>Thực hiện các chương trình đào tạo và huấn luyện cho các bác sĩ trẻ trong lĩnh vực tim mạch và phẫu thuật tim</li>\n        </ul>\n    </li>\n</ul>\n', 159000, 'admin', 1, 'giao_su.jpg', '2025-04-13 10:48:27', '2025-04-13 11:52:51', 9, 1, ''),
(2, 'phihasky1@gmail.com', '0392405600', '$2y$10$nODDRAA4Y8OhAnrVoWtkuuTepjjGMAjsCUQWsX4zHU1JiGrguVdoK', 'Hà Anh Tuấn', '<h2>Bác sĩ Hà Anh Tuấn</h2>\n\n<ul>\n    <li><strong>Công tác:</strong> Bác sĩ khoa Châm cứu, Bệnh viện Quân y 108</li>\n    <li><strong>Tốt nghiệp:</strong> Đại học Y Hà Nội, chuyên ngành Y học cổ truyền</li>\n    <li><strong>Kinh nghiệm:</strong> \n        <ul>\n            <li>Chuyên gia trong lĩnh vực châm cứu và y học cổ truyền, đặc biệt trong điều trị các bệnh lý về cơ xương khớp và thần kinh</li>\n            <li>Hỗ trợ viên của hệ thống y tế, tham gia vào công tác đào tạo và nghiên cứu phương pháp điều trị bằng châm cứu</li>\n            <li>Có hơn 10 năm kinh nghiệm trong điều trị các bệnh lý mãn tính, đau cơ xương khớp và các vấn đề về thần kinh bằng phương pháp châm cứu</li>\n            <li>Giảng viên tại các lớp đào tạo về y học cổ truyền và châm cứu tại các cơ sở y tế lớn tại Việt Nam</li>\n            <li>Tham gia nghiên cứu và áp dụng các phương pháp châm cứu mới trong điều trị và phục hồi sức khỏe</li>\n        </ul>\n    </li>\n</ul>\n', 159000, 'supporter', 1, 'okman.jpg', '2025-04-13 11:53:25', '2025-04-13 12:26:17', 6, 1, ''),
(3, 'phihasky2@gmail.com', '0392405600', '$2y$10$nODDRAA4Y8OhAnrVoWtkuuTepjjGMAjsCUQWsX4zHU1JiGrguVdoK', 'Sơn Tùng', '<h2>Bác sĩ Sơn Tùng</h2>\n\n<ul>\n    <li><strong>Công tác:</strong> Bác sĩ khoa Nhi, Bệnh viện Nhi Trung ương</li>\n    <li><strong>Tốt nghiệp:</strong> Đại học Y Hà Nội, chuyên ngành Nhi khoa</li>\n    <li><strong>Kinh nghiệm:</strong>\n        <ul>\n            <li>Chuyên gia trong lĩnh vực chăm sóc sức khỏe trẻ em, đặc biệt là các bệnh lý nhi khoa và các vấn đề liên quan đến tăng trưởng và phát triển của trẻ</li>\n            <li>Có hơn 15 năm kinh nghiệm trong việc điều trị các bệnh lý về tim mạch, hô hấp và nhiễm trùng ở trẻ em</li>\n            <li>Tham gia nghiên cứu và áp dụng các phương pháp điều trị mới trong việc chăm sóc sức khỏe cho trẻ em tại Bệnh viện Nhi Trung ương</li>\n            <li>Giảng viên tại các lớp đào tạo chuyên ngành Nhi khoa cho các bác sĩ trẻ tại các cơ sở y tế lớn ở Việt Nam</li>\n            <li>Được mời tham gia nhiều hội nghị quốc tế và trong nước về lĩnh vực Nhi khoa và chăm sóc sức khỏe trẻ em</li>\n        </ul>\n    </li>\n</ul>\n', 159000, 'member', 1, 'avatar_8_1743636085.jpg', '2025-04-13 12:19:46', '2025-04-13 12:20:10', 3, 2, ''),
(4, 'leeha867@gmail.com', '0123456789', '$2y$10$Iw2AHjFdIBAaE14ELax1BOtzMaOS7SZUVU3AhVOKzQ2bWcThaMq3m', 'Nguyễn Thị  Kiều Oanh', '<h2>Bác sĩ Nguyễn Thị Kiều Oanh</h2>\n\n<ul>\n    <li><strong>Công tác:</strong> Trưởng khoa Sức khỏe Tâm lý & Thai sản, Bệnh viện Quân y 108</li>\n    <li><strong>Tốt nghiệp:</strong> Tiến sĩ Sức khỏe tâm lý tại Đại học Y Hà Nội, chuyên ngành Sức khỏe tâm lý và Thai sản</li>\n    <li><strong>Kinh nghiệm:</strong>\n        <ul>\n            <li>Chuyên gia hàng đầu trong lĩnh vực sức khỏe tâm lý, đặc biệt là trong hỗ trợ tâm lý cho phụ nữ mang thai và sau sinh</li>\n            <li>Có hơn 15 năm kinh nghiệm trong công tác điều trị, tư vấn và chăm sóc sức khỏe tâm lý cho phụ nữ trong giai đoạn thai kỳ và sau sinh</li>\n            <li>Chủ trì nhiều nghiên cứu và chương trình hỗ trợ tâm lý cho phụ nữ mang thai tại các bệnh viện lớn</li>\n            <li>Giảng viên tại các chương trình đào tạo về sức khỏe tâm lý và chăm sóc phụ nữ mang thai tại các cơ sở y tế và trường đại học</li>\n            <li>Tham gia vào các hội nghị quốc tế về tâm lý học và sức khỏe phụ nữ, với nhiều công trình nghiên cứu và bài báo khoa học</li>\n        </ul>\n    </li>\n</ul>\n', 159000, 'admin', 1, 'bsi_trang.jpg', '2022-11-02 21:12:20', '2022-12-14 09:10:32', 14, 1, '330485791271359'),
(5, 'leeha2002@gmail.com', '0766335563', '$2y$10$nODDRAA4Y8OhAnrVoWtkuuTepjjGMAjsCUQWsX4zHU1JiGrguVdoK', 'Edward Jenner', '<h2>Bác sĩ Edward Jenner</h2>\n\n<ul>\n    <li><strong>Công tác:</strong> Bác sĩ Khoa Tim mạch, Bệnh viện Quân y 108</li>\n    <li><strong>Tốt nghiệp:</strong> Tiến sĩ Tim mạch tại Đại học Oxford, Vương quốc Anh</li>\n    <li><strong>Kinh nghiệm:</strong>\n        <ul>\n            <li>Chuyên gia tim mạch trẻ, chuyên về chẩn đoán và điều trị bệnh lý tim mạch ở người trưởng thành</li>\n            <li>Có hơn 5 năm kinh nghiệm làm việc trong lĩnh vực tim mạch tại các bệnh viện quốc tế và Bệnh viện Quân y 108</li>\n            <li>Tham gia các nghiên cứu và dự án liên quan đến các bệnh lý về động mạch vành và huyết áp cao</li>\n            <li>Tham gia giảng dạy và đào tạo các bác sĩ trẻ trong lĩnh vực tim mạch tại Bệnh viện Quân y 108</li>\n            <li>Được mời tham gia một số hội nghị quốc tế và các chương trình đào tạo chuyên sâu về tim mạch</li>\n        </ul>\n    </li>\n</ul>\n<h2>Bác sĩ Edward Jenner</h2>\n\n<ul>\n    <li><strong>Công tác:</strong> Bác sĩ Khoa Tim mạch, Bệnh viện Quân y 108</li>\n    <li><strong>Tốt nghiệp:</strong> Tiến sĩ Tim mạch tại Đại học Oxford, Vương quốc Anh</li>\n    <li><strong>Kinh nghiệm:</strong>\n        <ul>\n            <li>Chuyên gia tim mạch trẻ, chuyên về chẩn đoán và điều trị bệnh lý tim mạch ở người trưởng thành</li>\n            <li>Có hơn 5 năm kinh nghiệm làm việc trong lĩnh vực tim mạch tại các bệnh viện quốc tế và Bệnh viện Quân y 108</li>\n            <li>Tham gia các nghiên cứu và dự án liên quan đến các bệnh lý về động mạch vành và huyết áp cao</li>\n            <li>Tham gia giảng dạy và đào tạo các bác sĩ trẻ trong lĩnh vực tim mạch tại Bệnh viện Quân y 108</li>\n            <li>Được mời tham gia một số hội nghị quốc tế và các chương trình đào tạo chuyên sâu về tim mạch</li>\n        </ul>\n    </li>\n</ul>\n', 150000, 'member', 1, 'maus_doc.jpg', '2022-11-02 21:12:20', '2022-12-22 15:59:44', 14, 2, ''),
(6, 'leeha8672@gmail.com', '0978246246', '$2y$10$nODDRAA4Y8OhAnrVoWtkuuTepjjGMAjsCUQWsX4zHU1JiGrguVdoK', 'Phạm Xuân Hậu', '<h2>Bác sĩ Phạm Xuân Hậu</h2>\n\n<ul>\n    <li><strong>Công tác:</strong> Bác sĩ Khoa Tiêu hóa, Bệnh viện Quân y 108</li>\n    <li><strong>Tốt nghiệp:</strong> Bác sĩ chuyên khoa Tiêu hóa tại Đại học Y Hà Nội</li>\n    <li><strong>Kinh nghiệm:</strong>\n        <ul>\n            <li>Chuyên gia trong việc chẩn đoán và điều trị các bệnh lý về tiêu hóa, bao gồm viêm loét dạ dày, viêm ruột và bệnh lý gan mật</li>\n            <li>Có hơn 10 năm kinh nghiệm trong điều trị và phẫu thuật các bệnh lý tiêu hóa tại Bệnh viện Quân y 108 và các cơ sở y tế uy tín</li>\n            <li>Tham gia nghiên cứu và áp dụng các phương pháp điều trị mới trong điều trị các bệnh lý về tiêu hóa</li>\n            <li>Giảng viên tại các chương trình đào tạo về tiêu hóa cho các bác sĩ trẻ tại Bệnh viện Quân y 108 và các cơ sở y tế khác</li>\n            <li>Tham gia các hội nghị chuyên đề quốc tế về tiêu hóa, với nhiều bài báo khoa học được công bố</li>\n        </ul>\n    </li>\n</ul>\n', 259000, 'supporter', 1, 'doctor1-3573.jpg', '2022-11-02 21:12:20', '2025-04-13 12:26:58', 10, 4, ''),
(7, 'example@gmail.com', '0366253623', '$2y$10$Iw2AHjFdIBAaE14ELax1BOtzMaOS7SZUVU3AhVOKzQ2bWcThaMq3m', 'Nguyễn Hữu Duy', '<h2>Bác sĩ Nguyễn Hữu Duy</h2>\n\n<ul>\n    <li><strong>Công tác:</strong> Trưởng khoa Nội tổng hợp, Bệnh viện Quân y 108</li>\n    <li><strong>Tốt nghiệp:</strong> Thạc sĩ Nội khoa tại Đại học Y Hà Nội, Tiến sĩ Nội khoa tại Đại học Paris, Pháp</li>\n    <li><strong>Kinh nghiệm:</strong>\n        <ul>\n            <li>Chuyên gia hàng đầu trong điều trị các bệnh lý nội khoa tổng hợp, bao gồm các bệnh về tim mạch, hô hấp và tiêu hóa</li>\n            <li>Hơn 15 năm kinh nghiệm trong lĩnh vực y học nội khoa, tham gia điều trị và quản lý các ca bệnh phức tạp tại Bệnh viện Quân y 108</li>\n            <li>Giảng viên tại các chương trình đào tạo bác sĩ chuyên khoa nội tổng hợp tại Bệnh viện Quân y 108 và các bệnh viện uy tín khác</li>\n            <li>Tham gia nghiên cứu và phát triển các phương pháp điều trị tiên tiến trong nội khoa tổng hợp, đặc biệt là các bệnh lý mãn tính và bệnh lý phối hợp</li>\n            <li>Đã có nhiều bài báo khoa học được công bố trên các tạp chí quốc tế, tham gia các hội nghị chuyên đề về nội khoa tại Pháp và các quốc gia khác</li>\n            <li>Chủ trì nhiều dự án nghiên cứu và hỗ trợ đào tạo chuyên sâu cho các bác sĩ trẻ trong lĩnh vực nội khoa tổng hợp</li>\n        </ul>\n    </li>\n</ul>\n', 159000, 'admin', 1, 'bsi_phong2.jpg', '2022-11-09 21:46:18', '2025-04-13 12:23:18', 14, 1, ''),
(8, 'example2@gmail.com', '0988454643', '$2y$10$Iw2AHjFdIBAaE14ELax1BOtzMaOS7SZUVU3AhVOKzQ2bWcThaMq3m', 'Nguyễn Duy Hưng', 'Bác sĩ Nguyễn Duy Hưng', 159000, 'supporter', 1, 'bsi_hung.jpg', '2022-11-09 22:01:30', '2025-04-13 12:22:48', 9, 2, ''),
(23, 'lephiha@gmail.com', '0345678822', '$2y$10$YuvVfz9HBgXgPBVCt/4c4.xMWy7efmaLSHyGI1m2OHq7rlrcb.ce.', 'La Phi Hề', '<h2>La Phi Hề</h2>\n\n<ul>\n    <li><strong>Công tác:</strong> Thực tập sinh, Khoa Nội tổng hợp, Bệnh viện Quân y 108</li>\n    <li><strong>Tốt nghiệp:</strong> Sinh viên ngành Y học, Đại học Y Hà Nội</li>\n    <li><strong>Kinh nghiệm:</strong>\n        <ul>\n            <li>Thực tập sinh tại Khoa Nội tổng hợp, tham gia hỗ trợ bác sĩ trong việc chẩn đoán và điều trị các bệnh lý nội khoa</li>\n            <li>Học hỏi và tích lũy kinh nghiệm từ các bác sĩ giàu kinh nghiệm trong điều trị các bệnh lý tim mạch, hô hấp và tiêu hóa</li>\n            <li>Tham gia theo dõi bệnh nhân, thực hiện các xét nghiệm cơ bản và hỗ trợ trong công tác chuẩn đoán tại bệnh viện</li>\n            <li>Tham gia các buổi đào tạo và hội thảo chuyên ngành về y học nội khoa tại Bệnh viện Quân y 108</li>\n        </ul>\n    </li>\n</ul>\n', 100000, 'member', 1, 'bsi_phong.jpg', '2025-04-13 11:44:32', '2025-04-13 12:23:41', 14, 1, '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tn_doctor_and_service`
--

CREATE TABLE `tn_doctor_and_service` (
  `id` int(11) NOT NULL,
  `service_id` int(11) DEFAULT NULL,
  `doctor_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tn_drugs`
--

CREATE TABLE `tn_drugs` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tn_drugs`
--

INSERT INTO `tn_drugs` (`id`, `name`) VALUES
(1, 'Vitamin B1'),
(2, 'Penicillin'),
(3, 'Vitamin B2'),
(4, 'Insulin'),
(5, 'Morphin'),
(6, 'Aspirin'),
(7, 'Chlorpromazin'),
(8, 'Ether'),
(9, 'Cephalexin'),
(10, 'Erythromycin'),
(11, 'Azithromycin'),
(12, 'Thuốc kháng sinh Clarithromycin'),
(13, 'Thuốc kháng sinh liều thấp Amoxicillin'),
(14, 'Paracetamol');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tn_notifications`
--

CREATE TABLE `tn_notifications` (
  `id` int(11) NOT NULL,
  `message` text DEFAULT NULL,
  `record_id` int(11) DEFAULT NULL,
  `record_type` varchar(20) DEFAULT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `is_read` int(11) DEFAULT NULL,
  `create_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tn_notifications`
--

INSERT INTO `tn_notifications` (`id`, `message`, `record_id`, `record_type`, `patient_id`, `is_read`, `create_at`, `update_at`) VALUES
(6, 'Chúc mừng bạn! Lịch hẹn khám Khám sức khỏe tổng quát lúc 9:00 ngày 2025-04-03 đã được tạo thành công!', 5, 'booking', 3, 0, '2025-04-02 21:47:45', '2025-04-02 21:47:45'),
(7, 'Lịch hẹn khám Khám sức khỏe tổng quát lúc 9:00 ngày 2025-04-03 đã được hủy bỏ thành công!', 5, 'booking', 3, 0, '2025-04-02 21:48:21', '2025-04-02 21:48:21'),
(8, 'Chúc mừng bạn! Lịch hẹn khám Nhãn khoa lúc 9:00 ngày 2025-04-03 đã được tạo thành công!', 6, 'booking', 8, 0, '2025-04-02 21:53:13', '2025-04-02 21:53:13'),
(9, 'Chúc mừng bạn! Lịch hẹn khám Xét nghiệm PCR COVID-19 lúc 9:00 ngày 2025-04-03 đã được tạo thành công!', 7, 'booking', 8, 1, '2025-04-02 21:58:12', '2025-04-02 22:28:03'),
(10, 'Lịch hẹn khám Xét nghiệm PCR COVID-19 lúc 9:00 ngày 2025-04-03 đã được hủy bỏ thành công!', 7, 'booking', 8, 0, '2025-04-02 22:28:45', '2025-04-02 22:28:45'),
(11, 'Chúc mừng bạn! Lịch hẹn khám Khám sức khỏe tổng quát lúc 9:00 ngày 2025-04-03 đã được tạo thành công!', 8, 'booking', 8, 0, '2025-04-02 22:30:32', '2025-04-02 22:30:32'),
(12, 'Chúc mừng bạn! Lịch hẹn khám Nha khoa lúc 9:00 ngày 2025-04-04 đã được tạo thành công!', 9, 'booking', 8, 1, '2025-04-03 20:48:33', '2025-04-03 20:49:20'),
(13, 'Lịch hẹn khám Nha khoa lúc 9:00 ngày 2025-04-04 đã được hủy bỏ thành công!', 9, 'booking', 8, 0, '2025-04-03 20:49:49', '2025-04-03 20:49:49'),
(14, 'Chúc mừng bạn! Lịch hẹn khám Xét nghiệm PCR COVID-19 lúc 11:45 ngày 2025-04-20 đã được tạo thành công!', 10, 'booking', 3, 0, '2025-04-20 11:34:43', '2025-04-20 11:34:43'),
(15, 'Chúc mừng bạn! Lịch hẹn khám Khám sức khỏe tổng quát lúc 11:51 ngày 2025-04-20 đã được tạo thành công!', 11, 'booking', 8, 1, '2025-04-20 11:39:15', '2025-04-20 11:43:59'),
(16, 'Chúc mừng bạn! Lịch hẹn khám Nha khoa lúc 10:05 ngày 2025-04-22 đã được tạo thành công!', 12, 'booking', 3, 0, '2025-04-21 23:27:40', '2025-04-21 23:27:40'),
(17, 'Chúc mừng bạn! Lịch hẹn khám Khám sức khỏe tổng quát lúc 10:45 ngày 2025-04-22 đã được tạo thành công!', 13, 'booking', 3, 0, '2025-04-22 10:23:24', '2025-04-22 10:23:24'),
(18, 'Chúc mừng bạn! Lịch hẹn khám Xét nghiệm ADN lúc 10:45 ngày 2025-04-22 đã được tạo thành công!', 14, 'booking', 3, 0, '2025-04-22 10:29:21', '2025-04-22 10:29:21');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tn_patients`
--

CREATE TABLE `tn_patients` (
  `id` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  `birthday` varchar(10) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `create_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tn_patients`
--

INSERT INTO `tn_patients` (`id`, `email`, `phone`, `password`, `name`, `gender`, `birthday`, `address`, `avatar`, `create_at`, `update_at`) VALUES
(1, 'emma@gmail.com', '0794104124', '$2y$10$nODDRAA4Y8OhAnrVoWtkuuTepjjGMAjsCUQWsX4zHU1JiGrguVdoK', 'Emma', 0, '2000-05-01', 'USA', 'emma.jpg', NULL, NULL),
(3, 'phihasky@gmail.com', '', '$2y$10$LdUd06P7F/ghLx4w5CDOQe.Q02KbhxCpm/xkvM4nOcVjwr07MYYnO', 'Lê Phi Hà', 1, '2002-09-10', 'hanoi', 'lph.jpg', '2025-01-30 12:26:25', '2025-03-23 16:51:03'),
(8, '', '0392405600', '$2y$10$3x3gwk2/y3cJs5vmsfDDAe2EnfohAODguob3bOUmgZ5N3wWbMP5PW', 'Lê Phi Hà', 0, '2002-09-08', 'Hà Nội', 'avatar_8_1743636085.jpg', '2025-04-02 14:49:52', '2025-04-03 06:21:25');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tn_rooms`
--

CREATE TABLE `tn_rooms` (
  `Id` int(11) NOT NULL,
  `name` varchar(15) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tn_rooms`
--

INSERT INTO `tn_rooms` (`Id`, `name`, `location`) VALUES
(1, 'Phòng 303', 'Khu B, Tầng 3'),
(2, 'Phòng 104', 'Khu A, tầng 1'),
(3, 'Phòng 102', 'Khu A, tầng 1'),
(4, 'Phòng 246', 'Khu C, Tầng 4'),
(5, 'Phòng 103', 'Khu A, tầng 1'),
(123456, 'Phòng 103', 'Khu B, Tầng 1');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tn_services`
--

CREATE TABLE `tn_services` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tn_services`
--

INSERT INTO `tn_services` (`id`, `name`, `image`, `description`) VALUES
(1, 'Khám sức khỏe tổng quát', 'noi_tong_hop.jpg', '<p>Kh&aacute;m sức khỏe tổng qu&aacute;t nhằm đ&aacute;nh gi&aacute; t&igrave;nh trạng sức khỏe to&agrave;n diện của cơ thể, bao gồm: tim, phổi, ti&ecirc;u h&oacute;a v&agrave; thần kinh&hellip; Việc thăm kh&aacute;m n&agrave;y được thực hiện bởi b&aacute;c sĩ đa khoa. Dựa v&agrave;o kết quả, b&aacute;c sĩ sẽ chẩn đo&aacute;n, ph&aacute;t hiện sớm v&agrave; điều trị bệnh kịp thời. Kết quả n&agrave;y c&ograve;n gi&uacute;p bạn chủ động trong việc điều chỉnh lối sống, hạn chế c&aacute;c rủi ro bệnh tật trong tương lai. Do đ&oacute;, kh&aacute;m tổng qu&aacute;t cần được thực hiện với mọi giới v&agrave; mọi lứa tuổi. Thời gian thực hiện 6 th&aacute;ng/lần hoặc 1 năm/lần.</p>\n\n<div class=\"ddict_btn\" style=\"top: 13px; left: 1184.43px;\"><img src=\"chrome-extension://bpggmmljdiliancllaapiggllnkbjocb/logo/48.png\" /></div>'),
(5, 'Phục hồi chấn thương', 'phuc_hoi_chan_thuong.jpg', '<p>Phục hồi khả năng vận động nhờ đội ngũ b&aacute;c sĩ chuy&ecirc;n khoa chỉnh h&igrave;nh (xương v&agrave; cơ) gi&agrave;u kinh nghiệm của ch&uacute;ng t&ocirc;i.</p>'),
(6, 'Khám tim mạch', 'tim_mach.jpg', '<h3>C&oacute; được phương ph&aacute;p điều trị chất lượng từ đội ngũ đ&ocirc;ng đảo nhất gồm c&aacute;c b&aacute;c sĩ chuy&ecirc;n khoa tim mạch h&agrave;ng đầu ch&acirc;u &Aacute;.</h3>'),
(7, 'Chủng ngừa', 'chung_ngua.webp', '<p>Phục hồi khả năng vận động nhờ đội ngũ b&aacute;c sĩ chuy&ecirc;n khoa chỉnh h&igrave;nh (xương v&agrave; cơ) gi&agrave;u kinh nghiệm của ch&uacute;ng t&ocirc;i.</p>'),
(8, 'Khám sản', 'kham_thai.jpg', '<p>Thực tế, kh&aacute;m sản khoa hoặc kh&aacute;m sức khỏe sinh sản<strong>&nbsp;</strong>c&oacute; thể &aacute;p dụng từ l&uacute;c một người bắt đầu c&oacute; khả năng sinh sản cho đến khi kết h&ocirc;n. Theo khuyến c&aacute;o, người trẻ n&ecirc;n đi kh&aacute;m tối thiểu 3 - 6 th&aacute;ng trước khi c&oacute; &yacute; định sinh em b&eacute;. Kiểm tra sức khỏe tiền h&ocirc;n nh&acirc;n gi&uacute;p cho c&aacute;c bạn trẻ chuẩn bị c&oacute; con hiểu r&otilde; về t&igrave;nh trạng của m&igrave;nh, để c&oacute; sự chuẩn bị tốt nhất. Tr&ecirc;n thực tế, hiện nay, nhiều người vẫn c&ograve;n t&acirc;m l&yacute; e ngại kh&aacute;m sức khỏe sinh sản, sức khỏe tiền h&ocirc;n nh&acirc;n do t&acirc;m l&yacute; e ngại nếu ph&aacute;t hiện bệnh sẽ ảnh hưởng đến hạnh ph&uacute;c lứa đ&ocirc;i, thậm ch&iacute;, c&oacute; những người c&ograve;n cho l&agrave; nghi ngờ nhau mới đi kh&aacute;m, điều n&agrave;y cũng một phần ảnh hưởng đến t&acirc;m l&yacute;, t&igrave;nh cảm của c&aacute;c cặp đ&ocirc;i.</p>\n\n<p><img src=\"chrome-extension://bpggmmljdiliancllaapiggllnkbjocb/logo/48.png\" /></p>'),
(9, 'Sức khỏe phụ nữ', 'suc_khoe_tam_ly.jpg', '<p>Phục hồi khả năng vận động nhờ đội ngũ b&aacute;c sĩ chuy&ecirc;n khoa chỉnh h&igrave;nh (xương v&agrave; cơ) gi&agrave;u kinh nghiệm của ch&uacute;ng t&ocirc;i.</p>'),
(10, 'Nha khoa', 'nha_khoa.jpg', '<p>L&agrave;m sạch răng chuy&ecirc;n nghiệp&nbsp;l&agrave; một trong những phương ph&aacute;p điều trị nha khoa cơ bản nhưng quan trọng nhất mọi thời đại. Quy tr&igrave;nh n&agrave;y sử dụng c&aacute;c c&ocirc;ng cụ chuy&ecirc;n dụng kh&aacute;c nhau nhằm l&agrave;m sạch s&acirc;u bề mặt răng v&agrave; nướu của bạn. Đ&aacute;nh răng v&agrave; d&ugrave;ng chỉ nha khoa gi&uacute;p l&agrave;m sạch mảng b&aacute;m tr&ecirc;n răng, nhưng bạn kh&ocirc;ng thể loại bỏ cao răng tại nh&agrave;. Lợi &iacute;ch của việc l&agrave;m sạch răng chuy&ecirc;n nghiệp đơn giản nhưng lại v&ocirc; c&ugrave;ng lớn, đ&acirc;y l&agrave; l&yacute; do h&agrave;ng đầu bạn n&ecirc;n đến nha sĩ thường xuy&ecirc;n.</p>'),
(11, 'Nhãn khoa', 'nhan_khoa.jpg', '<p>Kh&aacute;m mắt, kiểm tra mắt định kỳ lu&ocirc;n l&agrave; việc l&agrave;m cần thiết trong &ldquo;quy tr&igrave;nh&rdquo; chăm s&oacute;c mắt thường ng&agrave;y, gi&uacute;p bạn bảo vệ thị lực cho ch&iacute;nh m&igrave;nh.</p>\n\n<p>Đ&ocirc;i mắt s&aacute;ng khỏe, thị lực ổn định sẽ lu&ocirc;n l&agrave; nền tảng tuyệt vời gi&uacute;p bạn cảm thấy tự tin trong c&ocirc;ng việc, h&ograve;a nhập với cộng đồng. Bởi vậy, kh&aacute;m mắt lu&ocirc;n l&agrave; một trong những điều hết sức quan trọng để đảm bảo sức khỏe cho đ&ocirc;i mắt cũng như ph&aacute;t hiện sớm những vấn đề về thị lực. Việc can thiệp v&agrave; điều trị những vấn đề về mắt một c&aacute;ch kịp thời, đ&uacute;ng c&aacute;ch l&agrave; &ldquo;ch&igrave;a kh&oacute;a&rdquo; gi&uacute;p bạn ổn định thị lực.</p>'),
(16, 'Tiêu hóa', 'tieu_hoa.jpg', '<p>Phục hồi khả năng vận động nhờ đội ngũ b&aacute;c sĩ chuy&ecirc;n khoa chỉnh h&igrave;nh (xương v&agrave; cơ) gi&agrave;u kinh nghiệm của ch&uacute;ng t&ocirc;i.</p>'),
(17, 'Hô hấp', 'ho_hap.jpg', '<p>Phục hồi khả năng vận động nhờ đội ngũ b&aacute;c sĩ chuy&ecirc;n khoa chỉnh h&igrave;nh (xương v&agrave; cơ) gi&agrave;u kinh nghiệm của ch&uacute;ng t&ocirc;i.</p>'),
(18, 'Thần kinh', 'than_kinh.jpg', '<p>Phục hồi khả năng vận động nhờ đội ngũ b&aacute;c sĩ chuy&ecirc;n khoa chỉnh h&igrave;nh (xương v&agrave; cơ) gi&agrave;u kinh nghiệm của ch&uacute;ng t&ocirc;i.</p>'),
(19, 'Nội khớp', 'noi_khop.jpg', '<p>Phục hồi khả năng vận động nhờ đội ngũ b&aacute;c sĩ chuy&ecirc;n khoa chỉnh h&igrave;nh (xương v&agrave; cơ) gi&agrave;u kinh nghiệm của ch&uacute;ng t&ocirc;i.</p>'),
(20, 'Da liễu', 'da_lieu.jpg', '<p>Phục hồi khả năng vận động nhờ đội ngũ b&aacute;c sĩ chuy&ecirc;n khoa chỉnh h&igrave;nh (xương v&agrave; cơ) gi&agrave;u kinh nghiệm của ch&uacute;ng t&ocirc;i.</p>'),
(21, 'Tầm soát STD', 'tam_soat_STD.jpg', '<p>Phục hồi khả năng vận động nhờ đội ngũ b&aacute;c sĩ chuy&ecirc;n khoa chỉnh h&igrave;nh (xương v&agrave; cơ) gi&agrave;u kinh nghiệm của ch&uacute;ng t&ocirc;i.</p>'),
(22, 'Xét nghiệm PCR COVID-19', 'covid_19.jpeg', '<p>X&eacute;t nghiệm Covid-19 l&agrave; phương ph&aacute;p gi&uacute;p ph&aacute;t hiện sự tồn tại của virus SARS-CoV-2 trong cơ thể. Th&ocirc;ng qua c&aacute;c x&eacute;t nghiệm n&agrave;y, c&aacute;c b&aacute;c sĩ, nh&acirc;n vi&ecirc;n y tế c&oacute; thể biết được bạn c&oacute; đang bị nhiễm hay c&oacute; tiền sử&nbsp; mắc Covid hay kh&ocirc;ng. Đối với x&eacute;t nghiệm RT-PCR, test nhanh kh&aacute;ng nguy&ecirc;n mẫu bệnh phẩm l&agrave; dịch tỵ hầu được lấy từ v&ugrave;ng họng, c&ograve;n nếu l&agrave;&nbsp;<a href=\"https://medlatec.vn/tin-tuc/giai-dap-nhung-thac-mac-ve-xet-nghiem-khang-the-igg-s159-n18050\">x&eacute;t nghiệm kh&aacute;ng thể</a>, mẫu bệnh phẩm l&agrave; m&aacute;u được lấy từ đầu ng&oacute;n tay.&nbsp;</p>'),
(23, 'Xét nghiệm ADN', 'xet_nghiem_adn.jpg', '<p>X&eacute;t nghiệm ADN&nbsp;l&agrave; x&eacute;t nghiệm d&ugrave;ng ADN c&oacute; trong c&aacute;c tế b&agrave;o của cơ thể để x&aacute;c định quan hệ huyết thống giữa hai c&aacute; thể&nbsp;v&igrave; ADN của một cơ thể thừa hưởng từ cả cha lẫn mẹ v&agrave; quy định đặc điểm ri&ecirc;ng biệt của từng c&aacute; thể. Đ&acirc;y ch&iacute;nh l&agrave; c&aacute;ch ch&iacute;nh x&aacute;c nhất để kiểm tra quan hệ huyết thống.</p>\n\n<div class=\"ddict_btn\" style=\"top: 9px; left: 1165.14px;\"><img src=\"chrome-extension://bpggmmljdiliancllaapiggllnkbjocb/logo/48.png\" /></div>'),
(24, 'Xét nghiệm máu', 'xet_nghiem_mau.jpg', '<p>X&eacute;t nghiệm m&aacute;u l&agrave; c&aacute;c loại x&eacute;t nghiệm được thực hiện tr&ecirc;n c&aacute;c mẫu m&aacute;u được lấy v&agrave;o c&aacute;c ống chống đ&ocirc;ng kh&aacute;c nhau t&ugrave;y mục đ&iacute;ch x&eacute;t nghiệm, nhằm đo h&agrave;m lượng một số chất nhất định trong m&aacute;u hoặc đếm c&aacute;c loại tế b&agrave;o m&aacute;u kh&aacute;c nhau.&nbsp;<a href=\"https://www.vinmec.com/tin-tuc/thong-tin-suc-khoe/an-roi-co-xet-nghiem-mau-chinh-xac-nua-hay-khong/\"><strong>X&eacute;t nghiệm m&aacute;u</strong></a>&nbsp;c&oacute; thể được thực hiện để kiểm tra sức khỏe định kỳ, hỗ trợ chẩn đo&aacute;n bệnh hoặc t&igrave;m kiếm c&aacute;c t&aacute;c nh&acirc;n g&acirc;y bệnh, kiểm tra kh&aacute;ng thể hoặc s&agrave;ng lọc ung thư sớm nhờ c&aacute;c dấu hiệu của khối u (tumor marker) hoặc để đ&aacute;nh gi&aacute; hiệu quả của c&aacute;c phương ph&aacute;p điều trị.</p>');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tn_specialities`
--

CREATE TABLE `tn_specialities` (
  `id` int(11) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tn_specialities`
--

INSERT INTO `tn_specialities` (`id`, `name`, `description`, `image`) VALUES
(1, 'Unknown', 'Chưa phân loại chuyên khoa', 'default_speciality.jpg'),
(2, 'Hỗ trợ viên', '<p><img alt=\"LOGO\" src=\"https://www.giantbomb.com/a/uploads/scale_medium/0/118/544727-umbrellacorporation3.png\" style=\"height:360px; width:480px\" /></p>\n\n<p>Logo tập đo&agrave;n Umbrella Corporaton</p>\n\n<p><img src=\"chrome-extension://bpggmmljdiliancllaap', 'ho_tro_vien.jpeg'),
(3, 'Nhi khoa', '<p>Phục hồi khả năng vận động nhờ đội ngũ b&aacute;c sĩ chuy&ecirc;n khoa chỉnh h&igrave;nh (xương v&agrave; cơ) gi&agrave;u kinh nghiệm của ch&uacute;ng t&ocirc;i.</p>', 'Nhi_khoa.jpg'),
(6, 'Châm cứu', '<p>Chuy&ecirc;n khoa răng - h&agrave;m - mặt</p>', 'cham_cuu.jpg'),
(7, 'Sức khỏe tâm lý', '<p>Chuy&ecirc;n khoa răng - h&agrave;m - mặt</p>', 'suc_khoe_tam_ly.jpg'),
(8, 'Nhãn khoa', 'Chuyên khoa răng - hàm - mặt', 'nhan_khoa.jpg'),
(9, 'Tim mạch', '<p>Chuy&ecirc;n khoa răng - h&agrave;m - mặt</p>', 'tim_mach.jpg'),
(10, 'Tiêu hóa', '<h1>Ti&ecirc;u ho&aacute;</h1>\n\n<h2><strong>B&aacute;c sĩ Chuy&ecirc;n khoa Ti&ecirc;u h&oacute;a</strong></h2>\n\n<p>Danh s&aacute;ch c&aacute;c b&aacute;c sĩ Ti&ecirc;u h&oacute;a uy t&iacute;n đầu ng&agrave;nh tại Việt Nam:</p>\n\n<ul>\n	<li>C&aacute;c chuy', 'tieu_hoa.jpg'),
(14, 'Nội tổng hợp', '<h1>B&aacute;c sĩ nội tổng hợp giỏi</h1>\n\n<div class=\"ddict_btn\" style=\"top: 36px; left: 958.471px;\"><img src=\"chrome-extension://bpggmmljdiliancllaapiggllnkbjocb/logo/48.png\" /></div>', 'noi_tong_hop.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tn_treatments`
--

CREATE TABLE `tn_treatments` (
  `id` int(11) NOT NULL,
  `appointment_id` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `times` int(11) DEFAULT NULL,
  `purpose` varchar(50) DEFAULT NULL,
  `instruction` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `np_accounts`
--
ALTER TABLE `np_accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id_2` (`user_id`,`username`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `np_captions`
--
ALTER TABLE `np_captions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `np_files`
--
ALTER TABLE `np_files`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `np_general_data`
--
ALTER TABLE `np_general_data`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Chỉ mục cho bảng `np_options`
--
ALTER TABLE `np_options`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `np_orders`
--
ALTER TABLE `np_orders`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `np_packages`
--
ALTER TABLE `np_packages`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `np_plugins`
--
ALTER TABLE `np_plugins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idname` (`idname`);

--
-- Chỉ mục cho bảng `np_posts`
--
ALTER TABLE `np_posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `status` (`status`),
  ADD KEY `account_id` (`account_id`);

--
-- Chỉ mục cho bảng `np_proxies`
--
ALTER TABLE `np_proxies`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `np_users`
--
ALTER TABLE `np_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Chỉ mục cho bảng `tn_appointments`
--
ALTER TABLE `tn_appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doctor_id` (`doctor_id`),
  ADD KEY `patient_id` (`patient_id`);

--
-- Chỉ mục cho bảng `tn_appointment_records`
--
ALTER TABLE `tn_appointment_records`
  ADD PRIMARY KEY (`id`),
  ADD KEY `appointment_id` (`appointment_id`);

--
-- Chỉ mục cho bảng `tn_booking`
--
ALTER TABLE `tn_booking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `service_id` (`service_id`);

--
-- Chỉ mục cho bảng `tn_booking_photo`
--
ALTER TABLE `tn_booking_photo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `booking_id` (`booking_id`);

--
-- Chỉ mục cho bảng `tn_doctors`
--
ALTER TABLE `tn_doctors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `speciality_id` (`speciality_id`),
  ADD KEY `room_id` (`room_id`);

--
-- Chỉ mục cho bảng `tn_doctor_and_service`
--
ALTER TABLE `tn_doctor_and_service`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doctor_id` (`doctor_id`),
  ADD KEY `service_id` (`service_id`);

--
-- Chỉ mục cho bảng `tn_drugs`
--
ALTER TABLE `tn_drugs`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tn_notifications`
--
ALTER TABLE `tn_notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_id` (`patient_id`);

--
-- Chỉ mục cho bảng `tn_patients`
--
ALTER TABLE `tn_patients`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tn_rooms`
--
ALTER TABLE `tn_rooms`
  ADD PRIMARY KEY (`Id`);

--
-- Chỉ mục cho bảng `tn_services`
--
ALTER TABLE `tn_services`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tn_specialities`
--
ALTER TABLE `tn_specialities`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tn_treatments`
--
ALTER TABLE `tn_treatments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `appointment_id` (`appointment_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `np_accounts`
--
ALTER TABLE `np_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `np_captions`
--
ALTER TABLE `np_captions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `np_files`
--
ALTER TABLE `np_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `np_general_data`
--
ALTER TABLE `np_general_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `np_options`
--
ALTER TABLE `np_options`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `np_orders`
--
ALTER TABLE `np_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `np_packages`
--
ALTER TABLE `np_packages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `np_plugins`
--
ALTER TABLE `np_plugins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `np_posts`
--
ALTER TABLE `np_posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `np_proxies`
--
ALTER TABLE `np_proxies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `np_users`
--
ALTER TABLE `np_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `tn_appointments`
--
ALTER TABLE `tn_appointments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `tn_appointment_records`
--
ALTER TABLE `tn_appointment_records`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `tn_booking`
--
ALTER TABLE `tn_booking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `tn_booking_photo`
--
ALTER TABLE `tn_booking_photo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `tn_doctors`
--
ALTER TABLE `tn_doctors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT cho bảng `tn_doctor_and_service`
--
ALTER TABLE `tn_doctor_and_service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `tn_drugs`
--
ALTER TABLE `tn_drugs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `tn_notifications`
--
ALTER TABLE `tn_notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `tn_rooms`
--
ALTER TABLE `tn_rooms`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123457;

--
-- AUTO_INCREMENT cho bảng `tn_services`
--
ALTER TABLE `tn_services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT cho bảng `tn_specialities`
--
ALTER TABLE `tn_specialities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `tn_treatments`
--
ALTER TABLE `tn_treatments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `np_accounts`
--
ALTER TABLE `np_accounts`
  ADD CONSTRAINT `accounts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `np_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `np_captions`
--
ALTER TABLE `np_captions`
  ADD CONSTRAINT `captions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `np_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `np_posts`
--
ALTER TABLE `np_posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `np_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `posts_ibfk_2` FOREIGN KEY (`account_id`) REFERENCES `np_accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
