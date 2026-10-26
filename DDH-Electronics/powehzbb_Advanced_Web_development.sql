-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:3306
-- Thời gian đã tạo: Th5 23, 2026 lúc 07:35 AM
-- Phiên bản máy phục vụ: 11.4.10-MariaDB-cll-lve
-- Phiên bản PHP: 8.3.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `powehzbb_Advanced_Web_development`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) NOT NULL,
  `link` varchar(255) DEFAULT NULL,
  `position` varchar(255) NOT NULL COMMENT 'top, middle, bottom',
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `banners`
--

INSERT INTO `banners` (`id`, `image`, `link`, `position`, `status`, `created_at`, `updated_at`) VALUES
(1, 'storage/banners/CIpngmrvRLs8Q5JEdsqw9ZSDCZU1ibZhDwlLKB9n.jpg', NULL, 'right_1', 1, '2026-04-15 07:17:37', '2026-05-11 19:13:30'),
(2, 'images/banner2.jpg', NULL, 'right_2', 1, '2026-04-15 07:17:37', '2026-04-15 07:17:37'),
(3, 'images/banner3.jpg', NULL, 'right_3', 1, '2026-04-15 07:17:37', '2026-04-15 07:17:37'),
(4, 'storage/banners/xrVylVuDdSKz0WbDFiKz67pzuvdApD4ZsadxgInK.jpg', NULL, 'horizontal_middle', 1, '2026-04-15 07:17:37', '2026-05-11 19:17:45');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `brands`
--

INSERT INTO `brands` (`id`, `name`, `slug`, `logo`, `created_at`, `updated_at`) VALUES
(1, 'Akko', 'akko', NULL, '2026-04-14 10:28:53', '2026-04-15 06:25:32'),
(2, 'Logitech', 'logitech', NULL, '2026-04-14 10:28:53', '2026-04-14 10:28:53'),
(3, 'Filco', 'filco', NULL, '2026-04-14 10:28:53', '2026-04-14 10:28:53'),
(4, 'Corsair', 'corsair', NULL, '2026-04-14 10:28:53', '2026-04-14 10:28:53'),
(5, 'Keychron', 'keychron', NULL, '2026-04-14 10:28:53', '2026-04-14 10:28:53'),
(6, 'Dell', 'dell', NULL, '2026-04-14 10:28:53', '2026-04-14 10:28:53'),
(7, 'LG', 'lg', NULL, '2026-04-14 10:28:53', '2026-04-14 10:28:53'),
(8, 'ViewSonic', 'viewsonic', NULL, '2026-04-14 10:28:53', '2026-04-14 10:28:53'),
(9, 'ASUS', 'asus', NULL, '2026-04-14 10:28:53', '2026-04-14 10:28:53'),
(10, 'MSI', 'msi', NULL, '2026-04-14 10:28:53', '2026-04-14 10:28:53'),
(11, 'Dell Alienware', 'dell-alienware', NULL, '2026-04-14 10:28:53', '2026-04-14 10:28:53'),
(12, 'Acer Predator', 'acer-predator', NULL, '2026-04-14 10:28:53', '2026-04-14 10:28:53'),
(13, 'Razer', 'razer', NULL, '2026-04-14 10:28:53', '2026-04-14 10:28:53'),
(14, 'Bose', 'bose', NULL, '2026-04-14 10:28:53', '2026-04-14 10:28:53'),
(15, 'Marshall', 'marshall', NULL, '2026-04-14 10:28:53', '2026-04-14 10:28:53'),
(16, 'Sony', 'sony', NULL, '2026-04-14 10:28:53', '2026-04-14 10:28:53'),
(17, 'JBL', 'jbl', NULL, '2026-04-14 10:28:53', '2026-04-14 10:28:53'),
(18, 'Harman Kardon', 'harman-kardon', NULL, '2026-04-14 10:28:53', '2026-04-14 10:28:53'),
(19, 'Zowie', 'zowie', NULL, '2026-04-14 10:28:53', '2026-04-14 10:28:53'),
(20, 'GMK', 'gmk', NULL, '2026-04-14 10:28:53', '2026-04-14 10:28:53'),
(21, 'Ducky', 'ducky', NULL, '2026-04-14 10:28:53', '2026-04-14 10:28:53'),
(22, 'Glorious', 'glorious', NULL, '2026-04-14 10:28:53', '2026-04-14 10:28:53'),
(23, 'Herman Miller', 'herman-miller', NULL, '2026-04-14 10:28:53', '2026-04-14 10:28:53'),
(24, 'Warrior', 'warrior', NULL, '2026-04-14 10:28:53', '2026-04-14 10:28:53'),
(25, 'Sihoo', 'sihoo', NULL, '2026-04-14 10:28:53', '2026-04-14 10:28:53'),
(26, 'Mansory', 'mansory', NULL, '2026-04-14 10:28:53', '2026-04-14 10:28:53'),
(27, 'Epione', 'epione', NULL, '2026-04-14 10:28:53', '2026-04-14 10:28:53'),
(28, 'abc', 'abc', 'brands/6Au2THOXdKub080lJ9jDz8WjVAlLYBnNtY15W4Ej.jpg', '2026-05-11 19:27:28', '2026-05-11 19:27:37');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('ddh-electronics-cache-admin@powercapital-hk.space|37.77.150.124', 'i:1;', 1779373669),
('ddh-electronics-cache-admin@powercapital-hk.space|37.77.150.124:timer', 'i:1779373669;', 1779373669),
('ddh-electronics-cache-admin|37.77.150.124', 'i:1;', 1779374303),
('ddh-electronics-cache-admin|37.77.150.124:timer', 'i:1779374303;', 1779374303),
('ddh-electronics-cache-gmduyyuv@immenseignite.info|45.141.148.148', 'i:5;', 1778424417),
('ddh-electronics-cache-gmduyyuv@immenseignite.info|45.141.148.148:timer', 'i:1778424417;', 1778424417),
('ddh-electronics-cache-jqadmin@powercapital-hk.space|37.77.150.124', 'i:1;', 1779373660),
('ddh-electronics-cache-jqadmin@powercapital-hk.space|37.77.150.124:timer', 'i:1779373660;', 1779373660),
('ddh-electronics-cache-jqadmin|37.77.150.124', 'i:1;', 1779374296),
('ddh-electronics-cache-jqadmin|37.77.150.124:timer', 'i:1779374296;', 1779374296),
('ddh-electronics-cache-jqpowercapital-hk|37.77.150.124', 'i:1;', 1779373295),
('ddh-electronics-cache-jqpowercapital-hk|37.77.150.124:timer', 'i:1779373295;', 1779373295),
('ddh-electronics-cache-jqtest|37.77.150.124', 'i:1;', 1779374114),
('ddh-electronics-cache-jqtest|37.77.150.124:timer', 'i:1779374114;', 1779374114),
('ddh-electronics-cache-powercapital-hk|37.77.150.124', 'i:1;', 1779373303),
('ddh-electronics-cache-powercapital-hk|37.77.150.124:timer', 'i:1779373303;', 1779373303),
('ddh-electronics-cache-test|37.77.150.124', 'i:1;', 1779374122),
('ddh-electronics-cache-test|37.77.150.124:timer', 'i:1779374122;', 1779374122);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `carts`
--

INSERT INTO `carts` (`id`, `user_id`, `product_id`, `quantity`, `created_at`, `updated_at`) VALUES
(21, 6, 2, 2, '2026-05-20 18:58:41', '2026-05-22 03:53:46'),
(22, 6, 1, 1, '2026-05-21 01:13:51', '2026-05-21 01:13:51'),
(23, 6, 4, 1, '2026-05-22 03:53:47', '2026-05-22 03:53:47');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `show_on_sidebar` tinyint(1) NOT NULL DEFAULT 0,
  `order_index` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `filters` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`filters`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `image`, `icon`, `show_on_sidebar`, `order_index`, `created_at`, `updated_at`, `filters`) VALUES
(1, 'Bàn phím cơ', 'ban-phim-co', 'images/keyboard-hero.jpg', 'images/icon/vecteezy_ergonomic-mechanical-keyboard-with-custom-keycaps-for_60514914.png', 1, 1, '2026-04-14 09:15:05', '2026-04-23 03:06:42', '[\"price\",\"brand\",\"layout\",\"connection\"]'),
(2, 'Chuột Gaming', 'chuot-gaming', 'images/mouse-hero.jpg', 'images/icon/gaming-mouse-3d-icon-png-download-9675855.webp', 1, 2, '2026-04-14 09:15:05', '2026-04-15 07:09:04', NULL),
(3, 'Màn hình đồ họa', 'man-hinh-do-hoa', 'images/monitor_hero.jpg', 'images/icon/premium-computer-parts-display-monitor-icon-3d-rendering-isolated-background_150525-4565.png', 1, 3, '2026-04-14 09:15:05', '2026-04-15 07:09:04', NULL),
(4, 'Laptop Gaming', 'laptop-gaming', 'images/laptop_hero.jpg', 'images/icon/laptop-gaming-3d-icon-png-download-11431625.webp', 1, 4, '2026-04-14 09:15:05', '2026-04-15 07:09:04', NULL),
(5, 'Âm thanh & Loa', 'am-thanh-loa', 'images/speaker_hero.jpg', 'images/icon/audio-icon-concept-with-3d-cartoon-style-headphone-and-blue-speaker-3d-illustration-png.png', 1, 5, '2026-04-14 09:15:06', '2026-04-15 07:09:04', NULL),
(6, 'Lót chuột Gear', 'lot-chuot-gear', 'images/mousepad_hero.jpg', 'images/icon/ai-gaming-mouse-pad-3d-icon-png-download-jpg-13387054.webp', 1, 6, '2026-04-14 09:15:06', '2026-04-15 07:09:04', NULL),
(7, 'Keycaps & Switch', 'keycaps-switch', 'images/keycap_hero.jpg', 'images/icon/keycap-p-3d-icon-png-download-13964981.png', 1, 7, '2026-04-14 09:15:06', '2026-04-15 07:09:04', NULL),
(8, 'Ghế công thái học', 'ghe-cong-thai-hoc', 'images/chair_hero.jpg', 'images/icon/gaming-chair-3d-illustration-office-equipment-icon-png.png', 1, 8, '2026-04-14 09:15:06', '2026-04-15 07:09:04', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `type` enum('fixed','percent') NOT NULL DEFAULT 'fixed',
  `value` decimal(15,2) NOT NULL,
  `min_order_value` decimal(15,2) NOT NULL DEFAULT 0.00,
  `max_uses` int(11) DEFAULT NULL,
  `used_count` int(11) NOT NULL DEFAULT 0,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `type`, `value`, `min_order_value`, `max_uses`, `used_count`, `category_id`, `expiry_date`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'ELITE2026', 'fixed', 150000.00, 10.00, 5, 0, NULL, '2026-05-07', 1, '2026-04-20 11:23:16', '2026-04-20 11:23:16'),
(2, 'elite2027', 'fixed', 120000.00, 10.00, 11, 0, NULL, '2026-05-19', 1, '2026-04-20 11:23:46', '2026-04-20 11:23:46');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2026_04_04_160125_create_categories_table', 1),
(5, '2026_04_04_160253_create_products_table', 1),
(6, '2026_04_04_160404_create_orders_table', 1),
(7, '2026_04_04_160415_create_order_items_table', 1),
(8, '2026_04_04_163812_add_is_admin_to_users_table', 1),
(9, '2026_04_05_072416_add_flash_sale_end_to_products_table', 1),
(10, '2026_04_05_073000_create_coupons_table', 1),
(11, '2026_04_05_073001_create_settings_table', 1),
(12, '2026_04_05_080034_create_product_images_table', 1),
(13, '2026_04_05_085535_add_social_login_to_users_table', 1),
(14, '2026_04_10_064835_add_specs_to_products_table', 1),
(15, '2026_04_10_114028_add_mouse_specs_to_products_table', 1),
(16, '2026_04_14_153250_add_monitor_specs_to_products_table', 2),
(17, '2026_04_14_154535_add_laptop_specs_to_products_table', 3),
(18, '2026_04_14_155839_add_mousepad_specs_to_products_table', 4),
(19, '2026_04_14_160358_add_final_specs_to_products_table', 5),
(20, '2026_04_14_170501_add_specs_and_faqs_to_products_table', 6),
(21, '2026_04_14_172637_create_brands_table', 7),
(22, '2026_04_14_172659_add_brand_id_to_products_table', 7),
(23, '2026_04_14_174452_add_filters_to_categories_table', 8),
(24, '2026_04_15_133725_create_banners_table', 9),
(25, '2026_04_15_133725_create_slides_table', 9),
(26, '2026_04_15_140719_add_sidebar_fields_to_categories_table', 10),
(27, '2026_04_16_024621_add_can_write_posts_to_users_table', 11),
(28, '2026_04_16_024629_create_posts_table', 11),
(29, '2026_04_16_032722_create_subscribers_table', 12),
(30, '2026_04_16_033443_add_advanced_fields_to_coupons_table', 13),
(31, '2026_04_16_034331_add_profile_fields_to_users_table', 14),
(33, '2026_04_18_104536_add_location_ids_to_users_table', 15),
(34, '2026_04_18_120653_create_reviews_table', 16),
(35, '2026_04_18_120657_create_notifications_table', 16),
(36, '2026_04_18_121726_modify_reviews_table_add_parent_id_and_rating_nullable', 17),
(37, '2026_04_18_200234_create_personal_access_tokens_table', 18),
(38, '2026_04_19_063017_create_wishlists_table', 19),
(39, '2026_04_19_075714_create_carts_table', 20);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `link` varchar(255) DEFAULT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `title`, `message`, `link`, `is_read`, `created_at`, `updated_at`) VALUES
(1, 2, 'Hủy đơn hàng thành công', 'Đơn hàng #10 của bạn đã được hủy thành công.', 'http://127.0.0.1:8000/my-order/10', 1, '2026-04-18 05:29:53', '2026-04-18 05:46:32'),
(2, 2, 'Cập nhật đơn hàng #DDH-11', 'Đơn hàng của bạn đã chuyển sang trạng thái: Đang giao hàng', 'http://127.0.0.1:8000/my-order/11', 1, '2026-04-18 05:46:07', '2026-04-18 05:46:16'),
(3, 2, 'Cập nhật đơn hàng #DDH-11', 'Đơn hàng của bạn đã chuyển sang trạng thái: Đã nhận hàng', 'http://127.0.0.1:8000/my-order/11', 0, '2026-04-18 09:24:28', '2026-04-18 09:24:28'),
(4, 2, 'Cập nhật đơn hàng #DDH-17', 'Đơn hàng của bạn đã chuyển sang trạng thái: Đang vận chuyển', 'http://127.0.0.1:8000/my-order/17', 0, '2026-04-18 09:37:16', '2026-04-18 09:37:16'),
(5, 2, 'Cập nhật đơn hàng #DDH-17', 'Đơn hàng của bạn đã chuyển sang trạng thái: Đang xử lý', 'http://127.0.0.1:8000/my-order/17', 0, '2026-04-18 09:37:19', '2026-04-18 09:37:19'),
(6, 1, 'Cập nhật đơn hàng #DDH-21', 'Đơn hàng của bạn đã chuyển sang trạng thái: Chờ xác nhận', 'https://ddh-electronics.powercapital-hk.space/my-order/21', 0, '2026-04-21 11:00:43', '2026-04-21 11:00:43'),
(7, 1, 'Cập nhật đơn hàng #DDH-5', 'Đơn hàng của bạn đã chuyển sang trạng thái: Đang xử lý', 'https://ddh-electronics.powercapital-hk.space/my-order/5', 0, '2026-04-21 11:06:07', '2026-04-21 11:06:07'),
(8, 6, 'Hủy đơn hàng thành công', 'Đơn hàng #35 của bạn đã được hủy thành công.', 'https://ddh-electronics.powercapital-hk.space/my-order/35', 1, '2026-04-22 09:21:04', '2026-04-22 09:21:10'),
(9, 7, 'Cập nhật đơn hàng #DDH-40', 'Đơn hàng của bạn đã chuyển sang trạng thái: Đã nhận hàng', 'https://ddh-electronics.powercapital-hk.space/my-order/40', 0, '2026-04-23 03:10:57', '2026-04-23 03:10:57'),
(10, 6, 'Cập nhật đơn hàng #DDH-43', 'Đơn hàng của bạn đã chuyển sang trạng thái: Đã nhận hàng', 'https://powercapital-hk.space/my-order/43', 0, '2026-05-11 18:27:16', '2026-05-11 18:27:16'),
(11, 7, 'Cập nhật đơn hàng #DDH-39', 'Đơn hàng của bạn đã chuyển sang trạng thái: Đã nhận hàng', 'https://powercapital-hk.space/my-order/39', 0, '2026-05-11 18:58:07', '2026-05-11 18:58:07'),
(12, 1, 'Cập nhật đơn hàng #DDH-8', 'Đơn hàng của bạn đã chuyển sang trạng thái: Đã nhận hàng', 'https://powercapital-hk.space/my-order/8', 0, '2026-05-11 19:03:54', '2026-05-11 19:03:54');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `total_price` decimal(15,2) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `payment_method` varchar(255) NOT NULL DEFAULT 'cod',
  `shipping_address` text NOT NULL,
  `phone` varchar(255) NOT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `total_price`, `status`, `payment_method`, `shipping_address`, `phone`, `notes`, `created_at`, `updated_at`) VALUES
(1, 1, 0.00, 'pending', 'vnpay', 'i be waiting till I hear you say i do', '0337654252', 'i be waiting till I hear you say i do', '2026-04-15 19:25:57', '2026-04-15 19:25:57'),
(2, 1, 0.00, 'pending', 'vnpay', 'i be waiting till I hear you say i do', '0337654252', 'i be waiting till I hear you say i do', '2026-04-15 19:26:23', '2026-04-15 19:26:23'),
(3, 1, 0.00, 'pending', 'vnpay', 'i be waiting till I hear you say i do', '0337654252', 'i be waiting till I hear you say i do', '2026-04-15 19:26:50', '2026-04-15 19:26:50'),
(4, 1, 0.00, 'pending', 'vnpay', 'XÁC NHẬN ĐẶT HÀNG', '0337654252', 'XÁC NHẬN ĐẶT HÀNG', '2026-04-15 19:31:34', '2026-04-15 19:31:34'),
(5, 1, 0.00, 'processing', 'momo', 'sâssâssâssâssâssâssâs', '0337654252', 'v', '2026-04-15 19:33:57', '2026-04-21 11:06:07'),
(6, 1, 0.00, 'pending', 'momo', 'sâssâssâssâssâssâssâs', '0337654252', 'sâssâssâssâssâssâssâs', '2026-04-15 19:34:27', '2026-04-15 19:34:27'),
(7, 1, 17600000.00, 'pending', 'momo', 'sâssâssâssâssâssâssâs', '0337654252', 'sâssâssâssâssâssâssâs', '2026-04-15 19:39:59', '2026-04-15 19:39:59'),
(8, 1, 17600000.00, 'completed', 'vnpay', 'sâssâssâssâssâssâssâs', '0337654252', 'sâssâssâssâssâssâssâs', '2026-04-15 19:40:31', '2026-05-11 19:03:54'),
(9, 2, 5100000.00, 'pending', 'momo', '0337654252', '0337654252', '0337654252', '2026-04-16 01:51:47', '2026-04-16 01:51:47'),
(10, 2, 5100000.00, 'cancelled', 'vnpay', '0337654252', '0337654252', '0337654252', '2026-04-16 01:52:11', '2026-04-18 05:29:53'),
(11, 2, 6500000.00, 'completed', 'cod', '0337654252', '0337654252', '0337654252', '2026-04-16 04:39:42', '2026-04-18 09:24:28'),
(12, 2, 0.00, 'cancelled', 'cod', '0337654252', '0337654252', '0337654252', '2026-04-16 04:41:00', '2026-04-18 05:28:47'),
(13, 1, 1430000.00, 'pending', 'vnpay', 'aaaajnădjkjnka, Xã Phú Linh', '0337654252', 'Email khách: admin@ddh.com. \nĐịa chỉ gốc: aaaajnădjkjnka. \n', '2026-04-17 10:48:18', '2026-04-17 10:48:18'),
(14, 1, 2430000.00, 'cancelled', 'cod', 'aaaajnădjkjnka, Xã Phú Linh', '0337654252', 'Email khách: admin@ddh.com. \nĐịa chỉ gốc: aaaajnădjkjnka. \n', '2026-04-17 11:30:36', '2026-04-18 04:48:34'),
(15, 2, 6530000.00, 'pending', 'cod', '6/43 Doãn Kế Thiện, Xã Lũng Cú', '0337654252', 'Email khách: admin@ddh.com. \nĐịa chỉ gốc: 6/43 Doãn Kế Thiện. \n', '2026-04-18 09:10:31', '2026-04-18 09:10:31'),
(16, 2, 30000.00, 'pending', 'cod', '6/43 Doãn Kế Thiện, Xã Lũng Cú', '0337654252', 'Email khách: admin@ddh.com. \nĐịa chỉ gốc: 6/43 Doãn Kế Thiện. \n', '2026-04-18 09:11:48', '2026-04-18 09:11:48'),
(17, 2, 30000.00, 'processing', 'cod', '6/43 Doãn Kế Thiện, Xã Lũng Cú', '0337654252', 'Email khách: admin@ddh.com. \nĐịa chỉ gốc: 6/43 Doãn Kế Thiện. \n', '2026-04-18 09:12:33', '2026-04-18 09:37:19'),
(18, 2, 6500000.00, 'pending', 'cod', '6/43 Doãn Kế Thiệnn, Phường Phú Diễn', '0337654252', 'Email khách: duongnguyen0602ls@gmail.com. \nĐịa chỉ gốc: 6/43 Doãn Kế Thiệnn. \n', '2026-04-18 09:14:41', '2026-04-18 09:14:41'),
(19, 1, 5850000.00, 'pending', 'vnpay', '6/43 Doãn Kế Thiện, Phường Phú Diễn, Thành phố Hà Nội', '0337654252', NULL, '2026-04-19 01:03:37', '2026-04-19 01:03:37'),
(20, 1, 5850000.00, 'pending', 'vnpay', '6/43 Doãn Kế Thiện, Phường Phú Diễn', '0337654252', 'Email khách: admin@ddh.com. \nĐịa chỉ gốc: 6/43 Doãn Kế Thiện. \n', '2026-04-19 01:19:10', '2026-04-19 01:19:10'),
(21, 1, 5850000.00, 'pending', 'cod', '6/43 Doãn Kế Thiện, Phường Phú Diễn, Thành phố Hà Nội', '0337654252', NULL, '2026-04-21 10:36:15', '2026-04-21 11:00:43'),
(22, 2, 12100000.00, 'cancelled', 'vnpay', '6/43 Doãn Kế Thiện, Phường Phú Diễn, Thành phố Hà Nội', '0337654252', NULL, '2026-04-21 12:08:40', '2026-04-21 19:31:38'),
(23, 2, 51030000.00, 'pending', 'cod', '6/43 Doãn Kế Thiện, Phường Giảng Võ, Thành phố Hà Nội, Phường Giảng Võ, Thành phố Hà Nội', '0337654252', NULL, '2026-04-21 20:22:52', '2026-04-21 20:22:52'),
(24, 2, 5850000.00, 'pending', 'momo', '6/43 Doãn Kế Thiện, Phường Giảng Võ, Thành phố Hà Nội, Phường Giảng Võ, Thành phố Hà Nội', '0337654252', NULL, '2026-04-21 20:49:10', '2026-04-21 20:49:10'),
(25, 2, 5850000.00, 'pending', 'vnpay', '6/43 Doãn Kế Thiện, Phường Giảng Võ, Thành phố Hà Nội, Phường Giảng Võ, Thành phố Hà Nội', '0337654252', NULL, '2026-04-21 20:50:02', '2026-04-21 20:50:02'),
(26, 2, 5850000.00, 'pending', 'vnpay', '6/43 Doãn Kế Thiện, Phường Giảng Võ, Thành phố Hà Nội, Phường Giảng Võ, Thành phố Hà Nội', '0337654252', NULL, '2026-04-21 20:50:58', '2026-04-21 20:50:58'),
(27, 2, 3000000.00, 'pending', 'vnpay', '6/43 Doãn Kế Thiện, Phường Giảng Võ, Thành phố Hà Nội, Phường Giảng Võ, Thành phố Hà Nội', '0337654252', NULL, '2026-04-21 20:53:11', '2026-04-21 20:53:11'),
(28, 2, 1800000.00, 'pending', 'momo', '6/43 Doãn Kế Thiện, Phường Giảng Võ, Thành phố Hà Nội, Phường Giảng Võ, Thành phố Hà Nội', '0337654252', NULL, '2026-04-21 20:54:20', '2026-04-21 20:54:20'),
(29, 2, 1260000.00, 'pending', 'momo', '6/43 Doãn Kế Thiện, Phường Giảng Võ, Thành phố Hà Nội, Phường Giảng Võ, Thành phố Hà Nội', '0337654252', NULL, '2026-04-21 21:10:39', '2026-04-21 21:10:39'),
(30, 2, 4590000.00, 'pending', 'momo', '6/43 Doãn Kế Thiện, Phường Giảng Võ, Thành phố Hà Nội, Phường Giảng Võ, Thành phố Hà Nội', '0337654252', NULL, '2026-04-21 21:13:49', '2026-04-21 21:13:49'),
(31, 2, 5850000.00, 'pending', 'momo', '6/43 Doãn Kế Thiện, Phường Giảng Võ, Thành phố Hà Nội, Phường Giảng Võ, Thành phố Hà Nội', '0337654252', NULL, '2026-04-21 21:14:25', '2026-04-21 21:14:25'),
(32, 2, 5850000.00, 'pending', 'momo', '6/43 Doãn Kế Thiện, Phường Giảng Võ, Thành phố Hà Nội, Phường Giảng Võ, Thành phố Hà Nội', '0337654252', NULL, '2026-04-21 21:17:44', '2026-04-21 21:17:44'),
(33, 2, 10300000.00, 'pending', 'vnpay', '6/43 Doãn Kế Thiện, Phường Giảng Võ, Thành phố Hà Nội, Phường Giảng Võ, Thành phố Hà Nội', '0337654252', NULL, '2026-04-21 21:19:07', '2026-04-21 21:19:07'),
(34, 2, 4590000.00, 'pending', 'vnpay', '6/43 Doãn Kế Thiện, Phường Giảng Võ, Thành phố Hà Nội, Phường Giảng Võ', '0337654252', 'Email khách: duongnguyen0602ls@gmail.com. \nĐịa chỉ gốc: 6/43 Doãn Kế Thiện, Phường Giảng Võ, Thành phố Hà Nội. \n', '2026-04-22 06:51:19', '2026-04-22 06:51:19'),
(35, 6, 12600000.00, 'cancelled', 'cod', 'Ngõ 198 Trần Cung, Phường Ba Đình', '0833232328', 'Email khách: nguyenhieudocla123a@gmail.com. \nĐịa chỉ gốc: Ngõ 198 Trần Cung. \n', '2026-04-22 09:02:05', '2026-04-22 09:21:04'),
(36, 1, 7110000.00, 'pending', 'vnpay', '6/43 Doãn Kế Thiện, Phường Phú Diễn', '0337654252', 'Email khách: admin@ddh.com. \nĐịa chỉ gốc: 6/43 Doãn Kế Thiện. \n', '2026-04-22 09:02:24', '2026-04-22 09:02:24'),
(37, 1, 5850000.00, 'pending', 'cod', '6/43 Doãn Kế Thiện, Phường Phú Diễn', '0337654252', 'Email khách: admin@ddh.com. \nĐịa chỉ gốc: 6/43 Doãn Kế Thiện. \n', '2026-04-22 09:17:15', '2026-04-22 09:17:15'),
(38, 7, 4590000.00, 'pending', 'cod', '123 Giảng Võ, Phường Giảng Võ', '0337654252', 'Email khách: ninja4bom@gmail.com. \nĐịa chỉ gốc: 123 Giảng Võ. \n', '2026-04-23 02:58:12', '2026-04-23 02:58:12'),
(39, 7, 4590000.00, 'completed', 'vnpay', '123 Giang Vo, Phường Giảng Võ', '0337654252', 'Email khách: ninja4bom@gmail.com. \nĐịa chỉ gốc: 123 Giang Vo. \n', '2026-04-23 03:00:14', '2026-05-11 18:58:07'),
(40, 7, 4590000.00, 'completed', 'momo', '123 Giang Vo, Phường Ngọc Hà', '0337654252', 'Email khách: ninja4bom@gmail.com. \nĐịa chỉ gốc: 123 Giang Vo. \n', '2026-04-23 03:00:59', '2026-04-23 03:10:57'),
(41, 6, 13030000.00, 'pending', 'cod', 'Bá Hiếu, Phường Nùng Trí Cao', '0833232328', 'Email khách: nguyenhieudocla123a@gmail.com. \nĐịa chỉ gốc: Bá Hiếu. \n', '2026-04-23 08:11:57', '2026-04-23 08:11:57'),
(42, 2, 5100000.00, 'pending', 'vnpay', '6/43 Doãn Kế Thiện, Phường Giảng Võ, Thành phố Hà Nội, Phường Giảng Võ', '0337654252', 'Email khách: duongnguyen0602ls@gmail.com. \nĐịa chỉ gốc: 6/43 Doãn Kế Thiện, Phường Giảng Võ, Thành phố Hà Nội. \n', '2026-05-10 19:52:33', '2026-05-10 19:52:33'),
(43, 6, 6530000.00, 'completed', 'vnpay', 'Ngõ 123 Lãng Yên, Phường Nùng Trí Cao', '0833232328', 'Email khách: nguyenhieudocla123a@gmail.com. \nĐịa chỉ gốc: Ngõ 123 Lãng Yên. \n', '2026-05-11 05:37:50', '2026-05-11 18:27:16'),
(44, 1, 9750000.00, 'pending', 'vnpay', '6/43 Doãn Kế Thiện, Phường Phú Diễn', '0337654252', 'Email khách: admin@ddh.com. \nĐịa chỉ gốc: 6/43 Doãn Kế Thiện. \n', '2026-05-11 18:44:59', '2026-05-11 18:44:59'),
(45, 1, 9750000.00, 'pending', 'momo', '6/43 Doãn Kế Thiện, Phường Phú Diễn', '0337654252', 'Email khách: admin@ddh.com. \nĐịa chỉ gốc: 6/43 Doãn Kế Thiện. \n', '2026-05-11 18:56:20', '2026-05-11 18:56:20'),
(46, 2, 5250000.00, 'pending', 'vnpay', '6/43 Doãn Kế Thiện, Phường Giảng Võ, Thành phố Hà Nội, Phường Giảng Võ', '0337654252', 'Email khách: duongnguyen0602ls@gmail.com. \nĐịa chỉ gốc: 6/43 Doãn Kế Thiện, Phường Giảng Võ, Thành phố Hà Nội. \n', '2026-05-11 20:00:16', '2026-05-11 20:00:16'),
(47, 1, 300000.00, 'pending', 'vnpay', '6/43 Doãn Kế Thiện, Phường Phú Diễn', '0337654252', 'Email khách: admin@ddh.com. \nĐịa chỉ gốc: 6/43 Doãn Kế Thiện. \n', '2026-05-12 12:23:45', '2026-05-12 12:23:45'),
(48, 2, 5250000.00, 'pending', 'vnpay', '6/43 Doãn Kế Thiện, Phường Giảng Võ, Thành phố Hà Nội, Phường Giảng Võ', '0337654252', 'Email khách: duongnguyen0602ls@gmail.com. \nĐịa chỉ gốc: 6/43 Doãn Kế Thiện, Phường Giảng Võ, Thành phố Hà Nội. \n', '2026-05-12 13:24:53', '2026-05-12 13:24:53'),
(49, 2, 9400000.00, 'pending', 'cod', '6/43 Doãn Kế Thiện, Phường Giảng Võ, Thành phố Hà Nội, Phường Giảng Võ, Thành phố Hà Nội', '0337654252', NULL, '2026-05-22 18:05:21', '2026-05-22 18:05:21'),
(50, 2, 5100000.00, 'pending', 'momo', '6/43 Doãn Kế Thiện, Phường Giảng Võ, Thành phố Hà Nội, Phường Giảng Võ, Thành phố Hà Nội', '0337654252', NULL, '2026-05-23 13:34:16', '2026-05-23 13:34:16'),
(51, 2, 5250000.00, 'pending', 'vnpay', '6/43 Doãn Kế Thiện, Phường Giảng Võ, Thành phố Hà Nội, Phường Giảng Võ, Thành phố Hà Nội', '0337654252', NULL, '2026-05-23 15:02:08', '2026-05-23 15:02:08');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `price` decimal(15,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `quantity`, `price`, `created_at`, `updated_at`) VALUES
(1, 1, 17, 1, 0.00, '2026-04-15 19:25:57', '2026-04-15 19:25:57'),
(2, 2, 17, 1, 0.00, '2026-04-15 19:26:23', '2026-04-15 19:26:23'),
(3, 3, 17, 1, 0.00, '2026-04-15 19:26:50', '2026-04-15 19:26:50'),
(4, 4, 17, 1, 0.00, '2026-04-15 19:31:34', '2026-04-15 19:31:34'),
(5, 5, 17, 1, 0.00, '2026-04-15 19:33:57', '2026-04-15 19:33:57'),
(6, 6, 17, 1, 0.00, '2026-04-15 19:34:27', '2026-04-15 19:34:27'),
(7, 6, 2, 1, 0.00, '2026-04-15 19:34:27', '2026-04-15 19:34:27'),
(8, 7, 11, 1, 9100000.00, '2026-04-15 19:39:59', '2026-04-15 19:39:59'),
(9, 7, 12, 1, 8500000.00, '2026-04-15 19:39:59', '2026-04-15 19:39:59'),
(10, 8, 11, 1, 9100000.00, '2026-04-15 19:40:31', '2026-04-15 19:40:31'),
(11, 8, 12, 1, 8500000.00, '2026-04-15 19:40:31', '2026-04-15 19:40:31'),
(12, 9, 2, 1, 5100000.00, '2026-04-16 01:51:47', '2026-04-16 01:51:47'),
(13, 10, 2, 1, 5100000.00, '2026-04-16 01:52:11', '2026-04-16 01:52:11'),
(14, 11, 1, 1, 6500000.00, '2026-04-16 04:39:42', '2026-04-16 04:39:42'),
(15, 13, 7, 1, 1400000.00, '2026-04-17 10:48:18', '2026-04-17 10:48:18'),
(16, 14, 10, 1, 2400000.00, '2026-04-17 11:30:36', '2026-04-17 11:30:36'),
(17, 15, 1, 1, 6500000.00, '2026-04-18 09:10:31', '2026-04-18 09:10:31'),
(18, 18, 1, 1, 6500000.00, '2026-04-18 09:14:41', '2026-04-18 09:14:41'),
(19, 19, 1, 1, 5850000.00, '2026-04-19 01:03:37', '2026-04-19 01:03:37'),
(20, 20, 1, 1, 5850000.00, '2026-04-19 01:19:10', '2026-04-19 01:19:10'),
(21, 21, 1, 1, 5850000.00, '2026-04-21 10:36:15', '2026-04-21 10:36:15'),
(22, 22, 2, 1, 5100000.00, '2026-04-21 12:08:40', '2026-04-21 12:08:40'),
(23, 22, 5, 1, 7000000.00, '2026-04-21 12:08:40', '2026-04-21 12:08:40'),
(24, 23, 2, 2, 4590000.00, '2026-04-21 20:22:52', '2026-04-21 20:22:52'),
(25, 23, 1, 1, 5850000.00, '2026-04-21 20:22:52', '2026-04-21 20:22:52'),
(26, 23, 21, 1, 36000000.00, '2026-04-21 20:22:52', '2026-04-21 20:22:52'),
(27, 24, 1, 1, 5850000.00, '2026-04-21 20:49:10', '2026-04-21 20:49:10'),
(28, 25, 1, 1, 5850000.00, '2026-04-21 20:50:02', '2026-04-21 20:50:02'),
(29, 26, 1, 1, 5850000.00, '2026-04-21 20:50:58', '2026-04-21 20:50:58'),
(30, 27, 8, 1, 3000000.00, '2026-04-21 20:53:11', '2026-04-21 20:53:11'),
(31, 28, 9, 1, 1800000.00, '2026-04-21 20:54:20', '2026-04-21 20:54:20'),
(32, 29, 7, 1, 1260000.00, '2026-04-21 21:10:39', '2026-04-21 21:10:39'),
(33, 30, 2, 1, 4590000.00, '2026-04-21 21:13:49', '2026-04-21 21:13:49'),
(34, 31, 1, 1, 5850000.00, '2026-04-21 21:14:25', '2026-04-21 21:14:25'),
(35, 32, 1, 1, 5850000.00, '2026-04-21 21:17:44', '2026-04-21 21:17:44'),
(36, 33, 4, 1, 1800000.00, '2026-04-21 21:19:07', '2026-04-21 21:19:07'),
(37, 33, 12, 1, 8500000.00, '2026-04-21 21:19:07', '2026-04-21 21:19:07'),
(38, 34, 2, 1, 4590000.00, '2026-04-22 06:51:19', '2026-04-22 06:51:19'),
(39, 35, 5, 2, 6300000.00, '2026-04-22 09:02:05', '2026-04-22 09:02:05'),
(40, 36, 1, 1, 5850000.00, '2026-04-22 09:02:24', '2026-04-22 09:02:24'),
(41, 36, 6, 2, 630000.00, '2026-04-22 09:02:24', '2026-04-22 09:02:24'),
(42, 37, 1, 1, 5850000.00, '2026-04-22 09:17:15', '2026-04-22 09:17:15'),
(43, 38, 2, 1, 4590000.00, '2026-04-23 02:58:12', '2026-04-23 02:58:12'),
(44, 39, 2, 1, 4590000.00, '2026-04-23 03:00:14', '2026-04-23 03:00:14'),
(45, 40, 2, 1, 4590000.00, '2026-04-23 03:00:59', '2026-04-23 03:00:59'),
(46, 41, 1, 2, 6500000.00, '2026-04-23 08:11:57', '2026-04-23 08:11:57'),
(47, 42, 2, 1, 5100000.00, '2026-05-10 19:52:33', '2026-05-10 19:52:33'),
(48, 43, 1, 1, 6500000.00, '2026-05-11 05:37:50', '2026-05-11 05:37:50'),
(49, 44, 34, 1, 2500000.00, '2026-05-11 18:44:59', '2026-05-11 18:44:59'),
(50, 44, 1, 1, 5250000.00, '2026-05-11 18:44:59', '2026-05-11 18:44:59'),
(51, 44, 4, 1, 2000000.00, '2026-05-11 18:44:59', '2026-05-11 18:44:59'),
(52, 45, 34, 1, 2500000.00, '2026-05-11 18:56:20', '2026-05-11 18:56:20'),
(53, 45, 1, 1, 5250000.00, '2026-05-11 18:56:20', '2026-05-11 18:56:20'),
(54, 45, 4, 1, 2000000.00, '2026-05-11 18:56:20', '2026-05-11 18:56:20'),
(55, 46, 1, 1, 5250000.00, '2026-05-11 20:00:16', '2026-05-11 20:00:16'),
(56, 47, 30, 1, 300000.00, '2026-05-12 12:23:45', '2026-05-12 12:23:45'),
(57, 48, 1, 1, 5250000.00, '2026-05-12 13:24:53', '2026-05-12 13:24:53'),
(58, 49, 3, 2, 4700000.00, '2026-05-22 18:05:21', '2026-05-22 18:05:21'),
(59, 50, 2, 1, 5100000.00, '2026-05-23 13:34:16', '2026-05-23 13:34:16'),
(60, 51, 1, 1, 5250000.00, '2026-05-23 15:02:08', '2026-05-23 15:02:08');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`email`, `token`, `created_at`) VALUES
('duongnguyen0602ls@gmail.com', '$2y$12$VnUTPFKqM6Cz7QkSiBZdhup07KsQe40zcQ9HrVVk1jWyzPTMTsffi', '2026-05-12 12:43:55');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'mobile_token', '1d27b2bd1b335f9b8e4c778106b965107311fc22cc5a14e0491c17dac38c52bc', '[\"*\"]', NULL, NULL, '2026-04-18 13:40:46', '2026-04-18 13:40:46'),
(2, 'App\\Models\\User', 1, 'mobile_token', '1fb0ae2040721aab93015df635ab110012d2b2e74f96271590e6e5e9e2c3d995', '[\"*\"]', NULL, NULL, '2026-04-18 13:40:50', '2026-04-18 13:40:50'),
(3, 'App\\Models\\User', 1, 'mobile_token', '452658aaf9293e010f2d3cac72b0470ddae774d0be592e67e4f8762a26e31f49', '[\"*\"]', NULL, NULL, '2026-04-18 13:40:53', '2026-04-18 13:40:53'),
(4, 'App\\Models\\User', 1, 'mobile_token', '3bdab4080dc364f85577dd65f409293ef0a7282a8e64dcae17dbe680fdb94a8b', '[\"*\"]', NULL, NULL, '2026-04-18 13:40:55', '2026-04-18 13:40:55'),
(9, 'App\\Models\\User', 2, 'mobile-app-social', '4a2c184365cd3072f12a98a45fdeb9792845b15b9918d7bc9624b0c9a00d769c', '[\"*\"]', '2026-04-21 02:39:51', NULL, '2026-04-20 20:36:10', '2026-04-21 02:39:51'),
(10, 'App\\Models\\User', 2, 'mobile-app-social', 'b7bd218cf38a2a6b80e17e5c6ead0bc5be35b0f8da701c1d63a6b1ed2078b812', '[\"*\"]', NULL, NULL, '2026-04-21 02:41:28', '2026-04-21 02:41:28'),
(11, 'App\\Models\\User', 2, 'mobile-app-social', '468458b585aa0a16414c091c1bf0eb18f1f46dcb4af5bdc9d027a6850f31a066', '[\"*\"]', NULL, NULL, '2026-04-21 02:44:44', '2026-04-21 02:44:44'),
(12, 'App\\Models\\User', 2, 'mobile-app-social', 'a8a6300c18dc3cb9ba70431f2137bf9317f0d2309a778a2172168a372226fcab', '[\"*\"]', NULL, NULL, '2026-04-21 02:46:30', '2026-04-21 02:46:30'),
(13, 'App\\Models\\User', 2, 'mobile-app-social', '57069b70b429908d2185d65432fb9d45dd3812866d26f02c247836c8b569bdfc', '[\"*\"]', NULL, NULL, '2026-04-21 02:47:54', '2026-04-21 02:47:54'),
(15, 'App\\Models\\User', 2, 'mobile-app-social', 'e0382b92896a99e2cf496e80060c9385ff0cb581cd599a07d97d1f0e4fb9cb58', '[\"*\"]', '2026-04-21 10:09:38', NULL, '2026-04-21 03:12:56', '2026-04-21 10:09:38'),
(32, 'App\\Models\\User', 6, 'mobile-app', '893bcb470ebc14d55fff7d429ef2c7b4a55996494fe754b0c0af4099d363d029', '[\"*\"]', '2026-05-22 14:55:01', NULL, '2026-05-21 01:08:18', '2026-05-22 14:55:01'),
(35, 'App\\Models\\User', 2, 'mobile-app-social', '7aa4e3495d28801a77f0534cc93896847853ee83f3690b8bb1a8f677746e09fe', '[\"*\"]', '2026-05-23 15:03:21', NULL, '2026-05-23 15:01:54', '2026-05-23 15:03:21');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `summary` text DEFAULT NULL,
  `content` longtext NOT NULL,
  `is_published` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `title`, `slug`, `thumbnail`, `summary`, `content`, `is_published`, `created_at`, `updated_at`) VALUES
(1, 1, 'Đánh giá chi tiết DDH Phantom G1: Chiếc bàn phím cơ không dây làm thay đổi định nghĩa về sự cao cấp 2026', 'danh-gia-chi-tiet-ddh-phantom-g1-chiec-ban-phim-co-khong-day-lam-thay-doi-dinh-nghia-ve-su-cao-cap-2026-69e0555958bb1', 'storage/posts/2x3aceYrjYj9i3euIWSeA450bSN2MlHP6zVB8xcb.jpg', 'Không chỉ dừng lại ở một thiết bị ngoại vi, DDH Phantom G1 là một tác phẩm nghệ thuật kết hợp giữa công nghệ truyền dẫn không dây siêu tốc và trải nghiệm gõ phím \"tựa như mây\". Hãy cùng Elite khám phá xem tại sao chiếc bàn phím này lại khiến cộng đồng đam mê Gear \"điên đảo\" suốt tuần qua.', '1. Cú chạm đầu tiên: Nhôm nguyên khối và lớp phủ Nano Ngay từ khi mở hộp, Phantom G1 đã toát lên vẻ quyền lực với bộ khung nhôm series 7 nguyên khối. Điểm khác biệt lớn nhất chính là lớp phủ Nano giúp chống bám vân tay tuyệt đối – một nỗi lo thường trực của những ai yêu thích các thiết bị màu tối. Mọi đường vát kim cương đều được gia công CNC tinh xảo, phản chiếu ánh sáng RGB một cách cực kỳ tinh tế và sang trọng.\r\n\r\n2. Công nghệ Switch \"Magnet-Cloud\" độc quyền Điểm ăn tiền nhất của Phantom G1 chính là hệ thống Switch từ tính thế hệ mới. Không giống như switch cơ thống thường, switch trên G1 cho phép bạn tùy chỉnh độ nhạy (actuation point) của từng phím từ 0.1mm đến 4.0mm. Dù bạn là một game thủ chuyên nghiệp cần tốc độ phản xạ tức thì, hay một lập trình viên cần sự đầm tay, Phantom G1 đều đáp ứng hoàn hảo chỉ qua một cú click trong phần mềm DDH Core.\r\n\r\n3. Kết nối không dây không độ trễ Được trang bị chip xử lý DDH-Speed v3, Phantom G1 cho độ trễ chỉ 0.5ms – con số mà ngay cả nhiều bàn phím có dây cao cấp cũng phải dè chừng. Tầm phát sóng ổn định trong phạm vi 10m giúp bạn dễ dàng setup góc làm việc tối giản (minimalist) mà không bao giờ phải lo lắng về việc mất kết nối giữa trận đấu căng thẳng.\r\n\r\n4. Thời lượng pin kỷ lục Với viên pin 6000mAh và công nghệ quản lý điện năng thông minh, bạn có thể sử dụng Phantom G1 liên tục trong 4 tháng chỉ với một lần sạc (khi không bật LED). Đây thực sự là một con quái vật về hiệu năng pin trong thế giới bàn phím cơ hiện nay.\r\n\r\nLời kết: Dù mức giá không hề rẻ, nhưng những gì DDH Phantom G1 mang lại hoàn toàn xứng đáng với số tiền bạn bỏ ra. Đây không chỉ là một chiếc bàn phím, đó là một khoản đầu tư cho cảm hứng làm việc và trải nghiệm giải trí đỉnh cao của bạn.\r\n\r\nSản phẩm hiện đang có sẵn tại các chi nhánh của DDH Electronics với số lượng giới hạn.', 1, '2026-04-15 20:19:53', '2026-04-23 03:09:08'),
(2, 1, '12-05-2026 Tin tức công nghệ', '12-05-2026-tin-tuc-cong-nghe-6a01f5ad24f74', NULL, 'Tại sao màn hình Asus lại đang là sản phẩm được bán chạy nhất hiện nay?', 'bởi vì... tôi sẽ nói tại sao ở dưới\r\ntại sao', 1, '2026-05-11 19:28:45', '2026-05-11 19:28:45');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `brand` varchar(255) DEFAULT NULL,
  `layout` varchar(255) DEFAULT NULL,
  `connection` varchar(255) DEFAULT NULL,
  `weight` varchar(255) DEFAULT NULL,
  `resolution` varchar(255) DEFAULT NULL,
  `panel` varchar(255) DEFAULT NULL,
  `cpu` varchar(255) DEFAULT NULL,
  `gpu` varchar(255) DEFAULT NULL,
  `ram` varchar(255) DEFAULT NULL,
  `ssd` varchar(255) DEFAULT NULL,
  `size` varchar(255) DEFAULT NULL,
  `surface` varchar(255) DEFAULT NULL,
  `material` varchar(255) DEFAULT NULL,
  `profile` varchar(255) DEFAULT NULL,
  `frame` varchar(255) DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `specifications` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`specifications`)),
  `faqs` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`faqs`)),
  `price` decimal(15,2) NOT NULL,
  `sale_price` decimal(15,2) DEFAULT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `image` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `is_flash_sale` tinyint(1) NOT NULL DEFAULT 0,
  `flash_sale_end` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `brand`, `layout`, `connection`, `weight`, `resolution`, `panel`, `cpu`, `gpu`, `ram`, `ssd`, `size`, `surface`, `material`, `profile`, `frame`, `slug`, `description`, `specifications`, `faqs`, `price`, `sale_price`, `stock`, `image`, `is_active`, `is_flash_sale`, `flash_sale_end`, `created_at`, `updated_at`, `brand_id`) VALUES
(1, 1, 'Bàn phím cơ Akko Model Series 1', 'Akko', '75%', 'Có dây', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ban-phim-co-akko-model-series-1-1', 'Siêu phẩm bàn phím cơ không dây với phối màu Black & Gold sang trọng. Hỗ trợ 3 chế độ kết nối, hotswap và lót tiêu âm đầy đủ, mang lại trải nghiệm gõ \"thocky\" cực đỉnh cho game thủ.', '{\"Model\":\"3098B Plus (98 ph\\u00edm)\",\"K\\u1ebft n\\u1ed1i\":\"USB Type-C \\/ Bluetooth 5.0 \\/ Wireless 2.4Ghz\",\"Switch\":\"Akko CS Jelly Purple (Tactile)\",\"Keycap\":\"PBT Double-Shot, ASA Profile\",\"LED\":\"RGB 16.8 tri\\u1ec7u m\\u00e0u (nhi\\u1ec1u ch\\u1ebf \\u0111\\u1ed9)\",\"Pin\":\"3000mAh (l\\u00ean \\u0111\\u1ebfn 200 gi\\u1edd s\\u1eed d\\u1ee5ng)\",\"T\\u00ednh n\\u0103ng\":\"Hotswap 5-pin, Foam ti\\u00eau \\u00e2m EVA\"}', '{\"B\\u00e0n ph\\u00edm c\\u00f3 d\\u00f9ng \\u0111\\u01b0\\u1ee3c cho Mac kh\\u00f4ng?\":\"C\\u00f3, s\\u1ea3n ph\\u1ea9m h\\u1ed7 tr\\u1ee3 \\u0111\\u1ea7y \\u0111\\u1ee7 c\\u1ea3 h\\u1ec7 \\u0111i\\u1ec1u h\\u00e0nh Windows v\\u00e0 macOS th\\u00f4ng qua g\\u1ea1t switch ph\\u00eda d\\u01b0\\u1edbi.\"}', 6500000.00, 5250000.00, 19, 'https://akko.vn/wp-content/uploads/2026/02/Ban-phim-co-AKKO-5075S-Black-on-White-1.jpg', 1, 1, NULL, '2026-04-14 10:10:08', '2026-05-23 15:02:08', 1),
(2, 1, 'Bàn phím cơ Logitech Model Series 2', 'Logitech', '60%', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ban-phim-co-logitech-model-series-2-2', 'Dòng sản phẩm phím cơ cao cấp Bàn phím cơ Logitech Model Series 2 với switch Blue gõ cực thích.', NULL, NULL, 5100000.00, 0.00, 5, 'https://www.bhphotovideo.com/images/fb/logitech_920_010552_mx_mechanical_mini_wireless_1703338.jpg', 1, 0, NULL, '2026-04-14 10:10:08', '2026-05-23 13:34:16', 2),
(3, 1, 'Bàn phím cơ Filco Model Series 3', 'Filco', 'TKL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ban-phim-co-filco-model-series-3-3', 'Dòng sản phẩm phím cơ cao cấp Bàn phím cơ Filco Model Series 3 với switch Blue gõ cực thích.', NULL, NULL, 4700000.00, 0.00, 42, 'https://gearshop.vn/upload/images/Product/Filco/Keyboard/Filco%20Majestouch%203%20-%20Tenkeyless/B%C3%A0n-ph%C3%ADm-c%C6%A1-Filco-Majestouch-3-(3).jpg', 1, 0, NULL, '2026-04-14 10:10:08', '2026-05-22 18:05:21', 3),
(4, 1, 'Bàn phím cơ Akko Model Series 4', 'Akko', '65%', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ban-phim-co-akko-model-series-4-4', 'Dòng sản phẩm phím cơ cao cấp Bàn phím cơ Akko Model Series 4 với switch Blue gõ cực thích.', NULL, NULL, 2000000.00, 0.00, 21, 'https://akkogear.com.vn/wp-content/uploads/2024/01/akko-3098b-plus-black-01.jpg', 1, 0, NULL, '2026-04-14 10:10:08', '2026-05-11 18:56:20', 1),
(5, 1, 'Bàn phím cơ Corsair Model Series 5', 'Corsair', '60%', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ban-phim-co-corsair-model-series-5-5', 'Dòng sản phẩm phím cơ cao cấp Bàn phím cơ Corsair Model Series 5 với switch Blue gõ cực thích.', NULL, NULL, 7000000.00, 0.00, 2, 'https://www.tncstore.vn/media/product/6012-1.jpg', 1, 0, NULL, '2026-04-14 10:10:08', '2026-04-23 03:13:15', 4),
(6, 2, 'Chuột Gaming Corsair Pro Model 1', 'Corsair', NULL, 'Có dây', 'ultralight', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'chuot-gaming-corsair-pro-model-1-1', 'Chuột gaming chuyên nghiệp Chuột Gaming Corsair Pro Model 1 với độ nhạy cao và thiết kế công thái học.', NULL, NULL, 700000.00, 0.00, 34, 'https://cdn2.fptshop.com.vn/unsafe/1920x0/filters:format(webp):quality(75)/2021_9_13_637671653288567806_00772793-chuot-corsair-harpoon-rgb-pro-1.jpg', 1, 0, NULL, '2026-04-14 10:10:08', '2026-04-23 03:13:15', 4),
(7, 2, 'Chuột Gaming Corsair Pro Model 2', 'Corsair', NULL, 'Có dây', 'ultralight', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'chuot-gaming-corsair-pro-model-2-2', 'Chuột gaming chuyên nghiệp Chuột Gaming Corsair Pro Model 2 với độ nhạy cao và thiết kế công thái học.', NULL, NULL, 1400000.00, 0.00, 54, 'https://phucanhcdn.com/media/product/62184_chuot_gaming_khong_day_corsair_sabre_v2_pro_ultralight_wireless_black_1.jpg', 1, 0, NULL, '2026-04-14 10:10:08', '2026-04-23 03:11:49', 4),
(8, 2, 'Chuột Gaming Keychron Pro Model 3', 'Keychron', NULL, 'Có dây', 'light', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'chuot-gaming-keychron-pro-model-3-3', 'Chuột gaming chuyên nghiệp Chuột Gaming Keychron Pro Model 3 với độ nhạy cao và thiết kế công thái học.', NULL, NULL, 3000000.00, 0.00, 51, 'https://www.keychron.com/cdn/shop/files/M3_black.png?v=5669505235888361848', 1, 0, NULL, '2026-04-14 10:10:08', '2026-04-21 20:53:11', 5),
(9, 2, 'Chuột Gaming Akko Pro Model 4', 'Akko', NULL, 'Wireless 2.4GHz', 'light', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'chuot-gaming-akko-pro-model-4-4', 'Chuột gaming chuyên nghiệp Chuột Gaming Akko Pro Model 4 với độ nhạy cao và thiết kế công thái học.', NULL, NULL, 1800000.00, 0.00, 94, 'https://kenhtinhoc.vn/wp-content/uploads/2023/01/chuot-gaming-akko-ag325-one-piece-2.jpg', 1, 0, NULL, '2026-04-14 10:10:08', '2026-04-21 20:54:20', 1),
(10, 2, 'Chuột Gaming Corsair Pro Model 5', 'Corsair', NULL, 'Wireless 2.4GHz', 'ultralight', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'chuot-gaming-corsair-pro-model-5-5', 'Chuột gaming chuyên nghiệp Chuột Gaming Corsair Pro Model 5 với độ nhạy cao và thiết kế công thái học.', NULL, NULL, 2300000.00, 0.00, 36, 'https://product.hstatic.net/200000722513/product/corsair-m55-rgb-gearvn-1_ae4723703730444899cb2c6c13e8ad1b_efea2914c8cd41a29b5708cd160a5f04_grande.jpg', 1, 0, NULL, '2026-04-14 10:10:08', '2026-04-21 04:11:57', 4),
(11, 3, 'Màn hình Dell Elite Series 1 - 2K (2560 x 1440)', 'Dell', NULL, NULL, NULL, '2K (2560 x 1440)', 'Nano IPS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'man-hinh-dell-elite-series-1-2k-2560-x-1440-1-mon', 'Màn hình đồ họa chuyên nghiệp Màn hình Dell Elite Series 1 - 2K (2560 x 1440) với tấm nền Nano IPS độ chuẩn màu cao sRGB 100%.', NULL, NULL, 9100000.00, 0.00, 17, 'https://bizweb.dktcdn.net/thumb/1024x1024/100/329/122/products/man-hinh-2k-dell-ultrasharp-27-inch-ips-120hz-u2724de-01.jpg?v=1754585476313', 1, 0, NULL, '2026-04-14 10:10:08', '2026-04-21 04:12:21', 6),
(12, 3, 'Màn hình LG Elite Series 2 - 2K (2560 x 1440)', 'LG', NULL, NULL, NULL, '2K (2560 x 1440)', 'IPS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'man-hinh-lg-elite-series-2-2k-2560-x-1440-2-mon', 'Màn hình đồ họa chuyên nghiệp Màn hình LG Elite Series 2 - 2K (2560 x 1440) với tấm nền IPS độ chuẩn màu cao sRGB 100%.', NULL, NULL, 8500000.00, 0.00, 9, 'https://bizweb.dktcdn.net/thumb/1024x1024/100/329/122/products/man-hinh-2k-lg-ultragear-27-inch-oled-240hz-27gr95qe-b-atv-1.jpg?v=1683537901813', 1, 0, NULL, '2026-04-14 10:10:08', '2026-04-21 21:19:07', 7),
(13, 3, 'Màn hình ViewSonic Elite Series 3 - Full HD (1920 x 1080)', 'ViewSonic', NULL, NULL, NULL, 'Full HD (1920 x 1080)', 'VA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'man-hinh-viewsonic-elite-series-3-full-hd-1920-x-1080-3-mon', 'Màn hình đồ họa chuyên nghiệp Màn hình ViewSonic Elite Series 3 - Full HD (1920 x 1080) với tấm nền VA độ chuẩn màu cao sRGB 100%.', NULL, NULL, 7500000.00, 0.00, 12, 'https://phucanhcdn.com/media/product/55884_man_hinh_gaming_viewsonic_vx2758a_2k_pro_3_7.jpg', 1, 0, NULL, '2026-04-14 10:10:08', '2026-04-21 04:14:00', 8),
(14, 3, 'Màn hình LG Elite Series 4 - 2K (2560 x 1440)', 'LG', NULL, NULL, NULL, '2K (2560 x 1440)', 'OLED', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'man-hinh-lg-elite-series-4-2k-2560-x-1440-4-mon', 'Màn hình đồ họa chuyên nghiệp Màn hình LG Elite Series 4 - 2K (2560 x 1440) với tấm nền OLED độ chuẩn màu cao sRGB 100%.', NULL, NULL, 21200000.00, 0.00, 30, 'https://anphat.com.vn/media/lib/06-08-2024/man-hinh-gaming-lg-ultragear-27gs75q-b-3.jpg', 1, 0, NULL, '2026-04-14 10:10:08', '2026-04-21 04:14:27', 7),
(15, 3, 'Màn hình ASUS Elite Series 5 - Full HD (1920 x 1080)', 'ASUS', NULL, NULL, NULL, 'Full HD (1920 x 1080)', 'Nano IPS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'man-hinh-asus-elite-series-5-full-hd-1920-x-1080-5-mon', 'Màn hình đồ họa chuyên nghiệp Màn hình ASUS Elite Series 5 - Full HD (1920 x 1080) với tấm nền Nano IPS độ chuẩn màu cao sRGB 100%.', NULL, NULL, 16100000.00, 0.00, 24, 'https://bizweb.dktcdn.net/thumb/1024x1024/100/329/122/products/man-hinh-asus-vy249hgr-fhd-23-8-inch-ips-120hz-03.jpg?v=1729234167727', 1, 0, NULL, '2026-04-14 10:10:08', '2026-04-21 04:14:47', 9),
(16, 4, 'Laptop Gaming MSI Edition 1', 'MSI', NULL, NULL, NULL, NULL, NULL, 'AMD Ryzen 9 7945HX', 'NVIDIA RTX 4080 12GB', '64GB DDR5', '512GB NVMe Gen4', NULL, NULL, NULL, NULL, NULL, 'laptop-gaming-msi-edition-1-1-lp', 'Siêu phẩm Laptop Gaming MSI Edition 1 trang bị AMD Ryzen 9 7945HX, card đồ họa NVIDIA RTX 4080 12GB, bộ nhớ 64GB DDR5 và ổ cứng 512GB NVMe Gen4. Trình diễn hiệu năng đỉnh cao.', NULL, NULL, 10250000.00, 0.00, 2, 'https://www.phucanh.vn/media/news/1511_MSI-GE73-8RF-428VN-RGB-Edition.png', 1, 0, NULL, '2026-04-14 10:10:08', '2026-04-21 04:17:37', 10),
(17, 4, 'Laptop Gaming Dell Alienware Edition 2', 'Dell Alienware', NULL, NULL, NULL, NULL, NULL, 'AMD Ryzen 7 7840HS', 'NVIDIA RTX 4070 8GB', '16GB DDR5', '2TB NVMe Gen4', NULL, NULL, NULL, NULL, NULL, 'laptop-gaming-dell-alienware-edition-2-2-lp', 'Siêu phẩm Laptop Gaming Dell Alienware Edition 2 trang bị AMD Ryzen 7 7840HS, card đồ họa NVIDIA RTX 4070 8GB, bộ nhớ 16GB DDR5 và ổ cứng 2TB NVMe Gen4. Trình diễn hiệu năng đỉnh cao.', NULL, NULL, 32000000.00, 0.00, 1, 'https://d28jzcg6y4v9j1.cloudfront.net/media/social/articles/2022/4/16/dell-gaming-laptops-01.png', 1, 0, NULL, '2026-04-14 10:10:08', '2026-04-21 04:18:03', 11),
(18, 4, 'Laptop Gaming MSI Edition 3', 'MSI', NULL, NULL, NULL, NULL, NULL, 'Intel Core i7-13700H', 'NVIDIA RTX 4090 16GB', '32GB DDR5', '512GB NVMe Gen4', NULL, NULL, NULL, NULL, NULL, 'laptop-gaming-msi-edition-3-3-lp', 'Siêu phẩm Laptop Gaming MSI Edition 3 trang bị Intel Core i7-13700H, card đồ họa NVIDIA RTX 4090 16GB, bộ nhớ 32GB DDR5 và ổ cứng 512GB NVMe Gen4. Trình diễn hiệu năng đỉnh cao.', NULL, NULL, 29000000.00, 0.00, 11, 'https://mediamart.vn/images/uploads/data-2024/13-STf80H.jpg', 1, 0, NULL, '2026-04-14 10:10:08', '2026-04-21 04:19:10', 10),
(19, 4, 'Laptop Gaming Acer Predator Edition 4', 'Acer Predator', NULL, NULL, NULL, NULL, NULL, 'AMD Ryzen 7 7840HS', 'NVIDIA RTX 4060 8GB', '16GB DDR5', '2TB NVMe Gen4', NULL, NULL, NULL, NULL, NULL, 'laptop-gaming-acer-predator-edition-4-4-lp', 'Siêu phẩm Laptop Gaming Acer Predator Edition 4 trang bị AMD Ryzen 7 7840HS, card đồ họa NVIDIA RTX 4060 8GB, bộ nhớ 16GB DDR5 và ổ cứng 2TB NVMe Gen4. Trình diễn hiệu năng đỉnh cao.', NULL, NULL, 60000000.00, 0.00, 14, 'https://cdn-media.sforum.vn/storage/app/media/wp-content/uploads/2023/01/Cover-4.jpg', 1, 0, NULL, '2026-04-14 10:10:08', '2026-04-21 04:19:40', 12),
(20, 4, 'Laptop Gaming Razer Edition 5', 'Razer', NULL, NULL, NULL, NULL, NULL, 'AMD Ryzen 9 7945HX', 'NVIDIA RTX 4080 12GB', '64GB DDR5', '512GB NVMe Gen4', NULL, NULL, NULL, NULL, NULL, 'laptop-gaming-razer-edition-5-5-lp', 'Siêu phẩm Laptop Gaming Razer Edition 5 trang bị AMD Ryzen 9 7945HX, card đồ họa NVIDIA RTX 4080 12GB, bộ nhớ 64GB DDR5 và ổ cứng 512GB NVMe Gen4. Trình diễn hiệu năng đỉnh cao.', NULL, NULL, 95000000.00, 0.00, 13, 'https://www.laptopvip.vn/images/ab__webp/detailed/26/Blade15-Base-2018-01-www.laptopvip.vn-1625305920.webp', 1, 0, NULL, '2026-04-14 10:10:08', '2026-04-21 04:20:00', 13),
(21, 5, 'Loa Bluetooth Bose Series 1', 'Bose', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'loa-bluetooth-bose-series-1-1-au', 'Trải nghiệm âm thanh đỉnh cao với Loa Bluetooth Bose Series 1. Công nghệ lọc âm thế hệ mới, bass sâu, dải mid trong trẻo.', NULL, NULL, 36000000.00, 0.00, 5, 'https://bcec.vn/upload/original-image/loa-bose-s1-pro-plus-1.jpg', 1, 0, '2026-04-15 23:45:00', '2026-04-14 10:10:08', '2026-04-21 20:22:52', 14),
(22, 5, 'Tai nghe In-ear Marshall Series 2', 'Marshall', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'tai-nghe-in-ear-marshall-series-2-2-au', 'Trải nghiệm âm thanh đỉnh cao với Tai nghe In-ear Marshall Series 2. Công nghệ lọc âm thế hệ mới, bass sâu, dải mid trong trẻo.', NULL, NULL, 43000000.00, 0.00, 49, 'https://cdn2.fptshop.com.vn/unsafe/512x0/filters:format(webp):quality(75)/2023_12_13_638380768317282626_tai-nghe-bluetooth-nhet-tai-marshall-motif-ii-anc-1.jpg', 1, 0, NULL, '2026-04-14 10:10:08', '2026-04-21 04:20:55', 15),
(23, 5, 'Tai nghe In-ear Sony Series 3', 'Sony', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'tai-nghe-in-ear-sony-series-3-3-au', 'Trải nghiệm âm thanh đỉnh cao với Tai nghe In-ear Sony Series 3. Công nghệ lọc âm thế hệ mới, bass sâu, dải mid trong trẻo.', NULL, NULL, 7000000.00, 0.00, 35, 'https://cdn.tgdd.vn/Products/Images/54/136479/tai-nghe-nhet-tai-ep-sony-mdr-ex155ap-thumb-7-600x600.jpg', 1, 0, NULL, '2026-04-14 10:10:08', '2026-04-21 04:21:30', 16),
(24, 5, 'Loa Soundbar JBL Series 4', 'JBL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'loa-soundbar-jbl-series-4-4-au', 'Trải nghiệm âm thanh đỉnh cao với Loa Soundbar JBL Series 4. Công nghệ lọc âm thế hệ mới, bass sâu, dải mid trong trẻo.', NULL, NULL, 32000000.00, 0.00, 35, 'https://onewaymobile.vn/images/products/2024/06/21/original/5.png', 1, 0, NULL, '2026-04-14 10:10:08', '2026-04-21 04:21:46', 17),
(25, 5, 'Tai nghe chống ồn Harman Kardon Series 5', 'Harman Kardon', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'tai-nghe-chong-on-harman-kardon-series-5-5-au', 'Trải nghiệm âm thanh đỉnh cao với Tai nghe chống ồn Harman Kardon Series 5. Công nghệ lọc âm thế hệ mới, bass sâu, dải mid trong trẻo.', NULL, NULL, 27000000.00, 0.00, 26, 'https://www.droidshop.vn/wp-content/uploads/2022/01/Tai-nghe-Harman-Kardon-Fly-ANC-Wireless-3.jpg', 1, 0, NULL, '2026-04-14 10:10:08', '2026-04-21 04:22:03', 18),
(26, 6, 'Lót chuột Corsair Model 1 - Hybrid', 'Corsair', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'XL (450x400)', 'Hybrid', NULL, NULL, NULL, 'lot-chuot-corsair-model-1-hybrid-1-pad', 'Lót chuột cao cấp Lót chuột Corsair Model 1 - Hybrid với bề mặt Hybrid giúp di chuột mượt mà, kích thước XL (450x400) tối ưu không gian.', NULL, NULL, 1200000.00, 0.00, 70, 'https://bizweb.dktcdn.net/thumb/1024x1024/100/329/122/products/pad-chuot-corsair-mm200-2.png?v=1625720218793', 1, 0, NULL, '2026-04-14 10:10:08', '2026-04-21 04:25:20', 4),
(27, 6, 'Lót chuột Razer Model 2 - Hybrid', 'Razer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'L (320x270)', 'Hybrid', NULL, NULL, NULL, 'lot-chuot-razer-model-2-hybrid-2-pad', 'Lót chuột cao cấp Lót chuột Razer Model 2 - Hybrid với bề mặt Hybrid giúp di chuột mượt mà, kích thước L (320x270) tối ưu không gian.', NULL, NULL, 900000.00, 0.00, 81, 'https://lh5.googleusercontent.com/qHLgSOJssqN6HGX-cPMqT56KkAmAqgmDsj8zV_ph8ZRRT5W6VnUfn1T_gHZoFAXzji2rL1_6pk4ijngOLErdsKNzqQsj01SbfR2-y3casrjPXVGZtRJ3u0dIsKZfLbHLZuVPkw96', 1, 0, NULL, '2026-04-14 10:10:08', '2026-04-21 04:25:41', 13),
(28, 6, 'Lót chuột Zowie Model 3 - Speed', 'Zowie', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'M (250x210)', 'Speed', NULL, NULL, NULL, 'lot-chuot-zowie-model-3-speed-3-pad', 'Lót chuột cao cấp Lót chuột Zowie Model 3 - Speed với bề mặt Speed giúp di chuột mượt mà, kích thước M (250x210) tối ưu không gian.', NULL, NULL, 700000.00, 0.00, 63, 'https://image.benq.com/is/image/benqco/02-g-sr-se-sr-deep-top-2?$ResponsivePreset$&fmt=png-alpha', 1, 0, NULL, '2026-04-14 10:10:08', '2026-04-21 04:26:00', 19),
(29, 6, 'Lót chuột Zowie Model 4 - Control', 'Zowie', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Extended (900x400)', 'Control', NULL, NULL, NULL, 'lot-chuot-zowie-model-4-control-4-pad', 'Lót chuột cao cấp Lót chuột Zowie Model 4 - Control với bề mặt Control giúp di chuột mượt mà, kích thước Extended (900x400) tối ưu không gian.', NULL, NULL, 600000.00, 0.00, 53, 'https://cf.shopee.vn/file/vn-11134207-820l4-meptt5xaxrlsa7', 1, 0, NULL, '2026-04-14 10:10:08', '2026-04-21 04:26:25', 19),
(30, 6, 'Lót chuột Zowie Model 5 - Control', 'Zowie', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'XL (450x400)', 'Control', NULL, NULL, NULL, 'lot-chuot-zowie-model-5-control-5-pad', 'Lót chuột cao cấp Lót chuột Zowie Model 5 - Control với bề mặt Control giúp di chuột mượt mà, kích thước XL (450x400) tối ưu không gian.', NULL, NULL, 300000.00, 0.00, 23, 'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lvmtbwpidxy5c9', 1, 0, NULL, '2026-04-14 10:10:08', '2026-05-12 12:23:45', 19),
(31, 7, 'Bộ Keycap GMK Collection 1', 'GMK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ABS Laser-etched', 'Cherry Profile', NULL, 'bo-keycap-gmk-collection-1-1-kc', 'Bộ Keycap Bộ Keycap GMK Collection 1 cao cấp sử dụng chất liệu ABS Laser-etched, chuẩn Cherry Profile cho cảm giác gõ tuyệt vời.', NULL, NULL, 2500000.00, 0.00, 27, 'https://down-vn.img.susercontent.com/file/ff7d2b9c057553d70d0abd49da24d827', 1, 0, NULL, '2026-04-14 10:10:08', '2026-04-21 04:27:06', 20),
(32, 7, 'Bộ Keycap Ducky Collection 2', 'Ducky', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PBT Dye-sub', 'ASA Profile', NULL, 'bo-keycap-ducky-collection-2-2-kc', 'Bộ Keycap Bộ Keycap Ducky Collection 2 cao cấp sử dụng chất liệu PBT Dye-sub, chuẩn ASA Profile cho cảm giác gõ tuyệt vời.', NULL, NULL, 2000000.00, 0.00, 37, 'https://mechanicalkeyboards.com/cdn/shop/files/1957-SF5JU-Good-in-Blue-108-Key-PBT-Seamless-Double-Shot-Keycap-Set.jpg?v=1707188828', 1, 0, NULL, '2026-04-14 10:10:08', '2026-04-21 04:27:27', 21),
(33, 7, 'Bộ Keycap Glorious Collection 3', 'Glorious', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ABS Laser-etched', 'Cherry Profile', NULL, 'bo-keycap-glorious-collection-3-3-kc', 'Bộ Keycap Bộ Keycap Glorious Collection 3 cao cấp sử dụng chất liệu ABS Laser-etched, chuẩn Cherry Profile cho cảm giác gõ tuyệt vời.', NULL, NULL, 500000.00, 0.00, 28, 'https://www.phongcachxanh.vn/cdn/shop/products/b-keycap-glorious-gpbt-114-phim-37010414928117.jpg?v=1677210671', 1, 0, NULL, '2026-04-14 10:10:08', '2026-04-21 05:25:31', 22),
(34, 7, 'Bộ Keycap Glorious Collection 4', 'Glorious', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PBT Double-shot', 'OEM Profile', NULL, 'bo-keycap-glorious-collection-4-4-kc', 'Bộ Keycap Bộ Keycap Glorious Collection 4 cao cấp sử dụng chất liệu PBT Double-shot, chuẩn OEM Profile cho cảm giác gõ tuyệt vời.', NULL, NULL, 2500000.00, 0.00, 24, 'https://owlgaming.vn/wp-content/uploads/2024/06/set-keycap-glorious-gpbt-celestial-fire-114-nut.jpg', 1, 0, NULL, '2026-04-14 10:10:08', '2026-05-11 18:56:20', 22),
(35, 7, 'Bộ Keycap Akko Collection 5', 'Akko', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PBT Dye-sub', 'ASA Profile', NULL, 'bo-keycap-akko-collection-5-5-kc', 'Bộ Keycap Bộ Keycap Akko Collection 5 cao cấp sử dụng chất liệu PBT Dye-sub, chuẩn ASA Profile cho cảm giác gõ tuyệt vời.', NULL, NULL, 3500000.00, 0.00, 31, 'https://bizweb.dktcdn.net/thumb/1024x1024/100/466/510/products/akko-keycap-set-very-peri-04.jpg?v=1677053789457', 1, 0, NULL, '2026-04-14 10:10:08', '2026-04-21 05:26:30', 1),
(36, 8, 'Ghế công thái học Herman Miller Series 1', 'Herman Miller', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Hợp kim nhôm', 'ghe-cong-thai-hoc-herman-miller-series-1-1-ch', 'Dòng ghế Ghế công thái học Herman Miller Series 1 thiết kế chuẩn Ergonomic, khung Hợp kim nhôm bền bỉ, hỗ trợ cột sống tối đa.', NULL, NULL, 16000000.00, 0.00, 11, 'https://nvs.tn-cdn.net/2023/10/ghe-cong-thai-hoc-herman-miller-aeron-xam-4.jpg', 1, 0, NULL, '2026-04-14 10:10:08', '2026-04-21 05:27:01', 23),
(37, 8, 'Ghế công thái học Warrior Series 2', 'Warrior', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Hợp kim nhôm', 'ghe-cong-thai-hoc-warrior-series-2-2-ch', 'Dòng ghế Ghế công thái học Warrior Series 2 thiết kế chuẩn Ergonomic, khung Hợp kim nhôm bền bỉ, hỗ trợ cột sống tối đa.', NULL, NULL, 12000000.00, 0.00, 18, 'https://hugotech.vn/wp-content/uploads/Untitled-2-519-600x600.jpg', 1, 0, NULL, '2026-04-14 10:10:08', '2026-05-12 13:56:22', 24),
(38, 8, 'Ghế công thái học Sihoo Series 3', 'Sihoo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Hợp kim nhôm', 'ghe-cong-thai-hoc-sihoo-series-3-3-ch', 'Dòng ghế Ghế công thái học Sihoo Series 3 thiết kế chuẩn Ergonomic, khung Hợp kim nhôm bền bỉ, hỗ trợ cột sống tối đa.', NULL, NULL, 45000000.00, 0.00, 18, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/g/h/ghe-cong-thai-hoc-sihoo-a3-3.png', 1, 0, NULL, '2026-04-14 10:10:08', '2026-04-21 05:27:44', 25),
(39, 8, 'Ghế công thái học Mansory Series 4', 'Mansory', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Thép cường lực', 'ghe-cong-thai-hoc-mansory-series-4-4-ch', 'Dòng ghế Ghế công thái học Mansory Series 4 thiết kế chuẩn Ergonomic, khung Thép cường lực bền bỉ, hỗ trợ cột sống tối đa.', NULL, NULL, 24000000.00, 0.00, 18, 'https://hugotech.vn/wp-content/uploads/Untitled-5-190-600x600.jpg', 1, 0, NULL, '2026-04-14 10:10:08', '2026-04-21 05:28:04', 26),
(40, 8, 'Ghế công thái học Epione Series 5', 'Epione', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Nhựa ABS chịu lực', 'ghe-cong-thai-hoc-epione-series-5-5-ch', 'Dòng ghế Ghế công thái học Epione Series 5 thiết kế chuẩn Ergonomic, khung Nhựa ABS chịu lực bền bỉ, hỗ trợ cột sống tối đa.', NULL, NULL, 8000000.00, 0.00, 7, 'https://epione.vn/cdn/shop/files/ghe-cong-thai-hoc-epione-easychair-2-cool-grey-right.webp?v=1768527729&width=1946', 1, 0, NULL, '2026-04-14 10:10:08', '2026-04-21 05:28:23', 27),
(43, 1, 'Asus Rog Azoth Đen', NULL, '75%', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'asus-rog-azoth-den-6a1116af304f6', NULL, NULL, NULL, 35000000.00, 0.00, 15, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/b/a/ban-phim-gaming-asus-rog-azoth-den-1_1.jpg', 1, 0, NULL, '2026-05-23 13:53:35', '2026-05-23 13:53:35', 9);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `image`, `created_at`, `updated_at`) VALUES
(23, 1, 'https://owlgaming.vn/wp-content/uploads/2022/05/ban-phim-co-akko-3098s-one-piece.jpg', '2026-04-21 03:20:19', '2026-04-21 03:20:19'),
(24, 1, 'https://akko.vn/wp-content/uploads/2025/08/Ban-phim-co-AKKO-TAC87-Black-Gold-Mirror-Switch-2.png', '2026-04-21 03:20:19', '2026-04-21 03:20:19'),
(25, 1, 'https://akkogear.com.vn/wp-content/uploads/2024/05/mu-2.0-1.png', '2026-04-21 03:20:19', '2026-04-21 03:20:19');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `rating` int(11) DEFAULT NULL,
  `message` text NOT NULL,
  `is_visible` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `reviews`
--

INSERT INTO `reviews` (`id`, `user_id`, `product_id`, `rating`, `message`, `is_visible`, `created_at`, `updated_at`, `parent_id`) VALUES
(8, 2, 1, NULL, 'Hello', 1, '2026-04-21 11:44:01', '2026-04-21 11:44:01', NULL),
(9, 2, 1, 3, 'tạm được', 1, '2026-04-21 11:53:44', '2026-04-21 11:53:44', NULL),
(10, 1, 1, NULL, 'cảm ơn quý khách đã tin tưởng sử dụng sản phẩm của DDH Electronics!', 1, '2026-04-21 11:58:25', '2026-04-21 11:58:25', 9),
(11, 1, 1, NULL, 'chào bạn cần gì từ store của chúng tôi!', 1, '2026-04-21 11:58:39', '2026-04-21 11:58:39', 8),
(12, 7, 1, NULL, 'hello', 1, '2026-04-23 03:04:47', '2026-04-23 03:04:47', NULL),
(13, 6, 1, NULL, 'Dùng ko ổn', 1, '2026-05-11 17:58:33', '2026-05-11 17:58:33', NULL),
(14, 1, 37, NULL, 'hello', 1, '2026-05-11 18:06:07', '2026-05-11 18:06:07', NULL),
(15, 2, 43, NULL, 'Sản phẩm mới ra lò', 1, '2026-05-23 13:54:08', '2026-05-23 13:54:08', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `settings`
--

INSERT INTO `settings` (`id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 'flash_sale_end', '2026-05-16 18:12:00', '2026-04-15 09:45:23', '2026-05-11 17:57:24');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `slides`
--

CREATE TABLE `slides` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) NOT NULL,
  `link` varchar(255) DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `slides`
--

INSERT INTO `slides` (`id`, `image`, `link`, `order`, `status`, `created_at`, `updated_at`) VALUES
(1, 'storage/slides/ZT6xTPDd19iTW6RdylHK7W1SVQ10ceXszUdk61WK.jpg', NULL, 1, 1, '2026-04-15 06:38:54', '2026-04-23 03:08:02'),
(2, 'storage/slides/VXlCGOj86ZlxcdtGs266Xbc6kv4r6mNyHA2D3xmS.jpg', NULL, 2, 1, '2026-04-15 06:38:54', '2026-05-11 19:26:22'),
(3, 'images/slide3.jpg', NULL, 3, 1, '2026-04-15 06:38:54', '2026-04-15 06:38:54'),
(4, 'images/slide4.jpg', NULL, 4, 1, '2026-04-15 06:38:54', '2026-04-15 06:38:54'),
(5, 'images/slide5.jpg', NULL, 5, 1, '2026-04-15 06:38:54', '2026-04-15 06:38:54'),
(6, 'images/slide6.jpg', NULL, 6, 1, '2026-04-15 06:38:54', '2026-04-15 06:38:54'),
(7, 'images/slide7.jpg', NULL, 7, 1, '2026-04-15 06:38:54', '2026-04-15 06:38:54'),
(8, 'images/slide8.jpg', NULL, 8, 1, '2026-04-15 06:38:54', '2026-04-15 06:38:54'),
(9, 'images/slide9.jpg', NULL, 9, 1, '2026-04-15 06:38:54', '2026-04-15 06:38:54'),
(10, 'images/slide10.jpg', NULL, 10, 1, '2026-04-15 06:38:54', '2026-04-15 06:38:54');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `subscribers`
--

CREATE TABLE `subscribers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `subscribers`
--

INSERT INTO `subscribers` (`id`, `email`, `created_at`, `updated_at`) VALUES
(1, 'duongnguyen0602ls@gmail.com', '2026-04-15 20:32:19', '2026-04-15 20:32:19'),
(2, 'ninja4bom@gmail.com', '2026-04-23 03:09:39', '2026-04-23 03:09:39'),
(3, 'ninja5bomg@gmail.com', '2026-05-10 19:59:12', '2026-05-10 19:59:12'),
(4, 'nguyenhieudocla123a@gmail.com', '2026-05-11 18:00:26', '2026-05-11 18:00:26');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `provider_id` varchar(255) DEFAULT NULL,
  `provider_name` varchar(255) DEFAULT NULL,
  `social_avatar` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  `can_write_posts` tinyint(1) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `province_id` varchar(255) DEFAULT NULL,
  `district_id` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `provider_id`, `provider_name`, `social_avatar`, `avatar`, `is_admin`, `can_write_posts`, `name`, `email`, `phone`, `address`, `province_id`, `district_id`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, NULL, 'images/avatars/1776311457.jpg', 1, 0, 'Admin DDH', 'admin@ddh.com', '0337654252', '6/43 Doãn Kế Thiện', '1', 'Phường Phú Diễn', '2026-04-10 04:45:28', '$2y$12$qoTlGLrpru/Z3/7XQaZeSOqgMM6g8IGZcwL027J2RwF8TeVX900UK', 'Sw3lRcaAlIdJKkXSU5NrCJfifmS3exxbnxaAXB1hVNy55nTwj7nTbhTIKOdG', '2026-04-10 04:45:29', '2026-04-18 04:13:02'),
(2, '114275663307810192372', 'google', 'https://lh3.googleusercontent.com/a/ACg8ocLX0SqpnNsrJXu_7xSU4uLXd1O37pVKODbKUFKMyVy2cjs3A14=s96-c', NULL, 1, 0, 'Đức Dương Nguyễn', 'duongnguyen0602ls@gmail.com', '0337654252', '6/43 Doãn Kế Thiện, Phường Giảng Võ, Thành phố Hà Nội', '1', 'Phường Giảng Võ', NULL, NULL, 'OeyCRKBxkSGt38jab3D3zrMBCV22PT3GUWVhKP1Q9DNIfG7V0yrXFr0YoGYB', '2026-04-10 04:49:43', '2026-05-12 03:06:11'),
(4, '118358263567768836330', 'google', 'https://lh3.googleusercontent.com/a/ACg8ocJ5YRRJk0lXBVe8v4_knw1jXN8M_9cRIP_C5m7KCtWX7rvPNc4J=s96-c', NULL, 0, 0, 'Duong Nguyen (Visu)', 'ninja5bom@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, 'U7rvUY5EmdlWtRdi5A3ZRFCsfYktrPciKTGoHTsyaokOCLFEPo9HSSR25oux', '2026-04-18 05:20:20', '2026-04-18 05:20:20'),
(5, '381696268196732633', 'zalo', 'https://s120-ava-talk.zadn.vn/3/9/2/e/79/120/a5cf73332104aa436080554c3cf2fa1c.jpg', NULL, 0, 0, 'Dương', '381696268196732633@zalo.ddh-elite.vn', NULL, NULL, NULL, NULL, NULL, NULL, 'jcsGfcXfHO1YlrM2tywStfgyJfljvCcAfM81kbtowSEUNDS44p3Y9OV92vQw', '2026-04-20 20:20:41', '2026-04-20 20:20:41'),
(6, '102997777358925265597', 'google', 'https://lh3.googleusercontent.com/a/ACg8ocLUsg_kp-vfsj4vxkyGiPA_qAZqS4mdlsYsLzWwOUsc0VtxdA=s96-c', NULL, 0, 0, 'Hiếu Nguyễn Văn', 'nguyenhieudocla123a@gmail.com', NULL, NULL, NULL, NULL, NULL, '$2y$12$1/E8gWNWbqoD0gott9a.euGfZmRXKH7AUG0Rt594FdwU32qxrvzqq', '9uRyOQh7kK96UZSTCky4PqAiTR1X9lAyAzjA4jDCpeoRJux9FsQb1hAVXX8e', '2026-04-22 09:00:30', '2026-04-23 08:03:25'),
(7, '117465531730814817917', 'google', 'https://lh3.googleusercontent.com/a/ACg8ocJ9D4UTFaXQtm3xRuAiMFs5Q12IpjtUmFaSjItKsIXeLQl7fQk=s96-c', NULL, 1, 1, 'Nguyễn Dương', 'ninja4bom@gmail.com', '0337654252', '123 Giang Vo', '1', 'Phường Ngọc Hà', NULL, '$2y$12$VbeTa.uLyu73w6UUTrL5.O53r3OP8qUo0KmX26YHn8fH8uJWw6Mgy', 'dnFwAs4ffcaQlqniNNlf2JhnT1W2tzA4RzvVEdiBhXvX7BKLjWRd1GQfFRJh', '2026-04-23 02:54:41', '2026-05-11 19:40:34');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `wishlists`
--

INSERT INTO `wishlists` (`id`, `user_id`, `product_id`, `created_at`, `updated_at`) VALUES
(23, 2, 2, '2026-05-22 18:11:35', '2026-05-22 18:11:35'),
(24, 2, 4, '2026-05-22 18:11:39', '2026-05-22 18:11:39');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `brands_name_unique` (`name`),
  ADD UNIQUE KEY `brands_slug_unique` (`slug`);

--
-- Chỉ mục cho bảng `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- Chỉ mục cho bảng `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_locks_expiration_index` (`expiration`);

--
-- Chỉ mục cho bảng `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_user_id_foreign` (`user_id`),
  ADD KEY `carts_product_id_foreign` (`product_id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`);

--
-- Chỉ mục cho bảng `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`),
  ADD KEY `coupons_category_id_foreign` (`category_id`);

--
-- Chỉ mục cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Chỉ mục cho bảng `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Chỉ mục cho bảng `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_user_id_foreign` (`user_id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Chỉ mục cho bảng `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`),
  ADD KEY `order_items_product_id_foreign` (`product_id`);

--
-- Chỉ mục cho bảng `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Chỉ mục cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- Chỉ mục cho bảng `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`),
  ADD KEY `posts_user_id_foreign` (`user_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_brand_id_foreign` (`brand_id`);

--
-- Chỉ mục cho bảng `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_images_product_id_foreign` (`product_id`);

--
-- Chỉ mục cho bảng `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviews_user_id_foreign` (`user_id`),
  ADD KEY `reviews_product_id_foreign` (`product_id`),
  ADD KEY `reviews_parent_id_foreign` (`parent_id`);

--
-- Chỉ mục cho bảng `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Chỉ mục cho bảng `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Chỉ mục cho bảng `slides`
--
ALTER TABLE `slides`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subscribers_email_unique` (`email`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Chỉ mục cho bảng `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `wishlists_user_id_product_id_unique` (`user_id`,`product_id`),
  ADD KEY `wishlists_product_id_foreign` (`product_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT cho bảng `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT cho bảng `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT cho bảng `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT cho bảng `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT cho bảng `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT cho bảng `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `slides`
--
ALTER TABLE `slides`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Ràng buộc đối với các bảng kết xuất
--

--
-- Ràng buộc cho bảng `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ràng buộc cho bảng `coupons`
--
ALTER TABLE `coupons`
  ADD CONSTRAINT `coupons_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Ràng buộc cho bảng `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ràng buộc cho bảng `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Ràng buộc cho bảng `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Ràng buộc cho bảng `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Ràng buộc cho bảng `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `reviews` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ràng buộc cho bảng `wishlists`
--
ALTER TABLE `wishlists`
  ADD CONSTRAINT `wishlists_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
