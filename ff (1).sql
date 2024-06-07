-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307:3307
-- Generation Time: Jun 07, 2024 at 06:08 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ff`
--

-- --------------------------------------------------------

--
-- Table structure for table `alats`
--

CREATE TABLE `alats` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kategori_id` bigint(20) UNSIGNED NOT NULL,
  `lokasi_id` bigint(20) UNSIGNED DEFAULT NULL,
  `nama_alat` varchar(255) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `harga24` int(11) NOT NULL,
  `harga12` int(11) NOT NULL,
  `harga6` int(11) NOT NULL,
  `gambar` varchar(255) NOT NULL DEFAULT 'noimage.jpg',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `alats`
--

INSERT INTO `alats` (`id`, `kategori_id`, `lokasi_id`, `nama_alat`, `deskripsi`, `harga24`, `harga12`, `harga6`, `gambar`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 'Lapangan Futsal', 'berukuran 89', 165000, 110000, 55000, '1716345835-th (2).jpeg', '2024-05-21 01:58:43', '2024-06-06 18:23:03'),
(2, 1, NULL, 'Lapangan Badminton', 'dijamin puas', 165000, 110000, 55000, '1716346142-th (2).jpeg', '2024-05-21 19:43:16', '2024-05-21 19:49:02'),
(3, 1, NULL, 'Lapangan Badminton del', 'bermain dengan lebih menyenangkan', 165000, 110000, 55000, '1716345867-th (2).jpeg', '2024-05-21 19:44:27', '2024-05-21 19:44:27'),
(4, 2, NULL, 'Bola Basket', 'murah', 15000, 10000, 5000, '1716346046-th (3).jpeg', '2024-05-21 19:47:26', '2024-05-21 19:47:26'),
(5, 2, NULL, 'Bola Volly', 'berukuran sedang', 15000, 10000, 5000, '1716346077-th (4).jpeg', '2024-05-21 19:47:57', '2024-05-21 19:47:57'),
(6, 2, NULL, 'racket', 'bebas warna', 15000, 10000, 5000, '1716346106-th (5).jpeg', '2024-05-21 19:48:26', '2024-05-21 19:48:26');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `alat_id` bigint(20) UNSIGNED NOT NULL,
  `harga` int(11) NOT NULL,
  `durasi` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `user_id`, `alat_id`, `harga`, `durasi`, `created_at`, `updated_at`) VALUES
(6, 1, 1, 55000, 6, '2024-06-06 18:28:51', '2024-06-06 18:28:51');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_kategori` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `nama_kategori`, `created_at`, `updated_at`) VALUES
(1, 'lapangan', '2024-05-21 01:58:02', '2024-05-21 01:58:02'),
(2, 'Alat Olahraga', '2024-05-21 01:58:09', '2024-05-21 01:58:09');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
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
-- Table structure for table `lokasis`
--

CREATE TABLE `lokasis` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `admin_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lokasis`
--

INSERT INTO `lokasis` (`id`, `name`, `admin_id`, `created_at`, `updated_at`) VALUES
(7, 'medan', 2, '2024-06-06 19:35:39', '2024-06-06 19:35:57'),
(9, 'pore', 4, '2024-06-06 19:36:21', '2024-06-06 19:36:26');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(6, '2014_10_12_000000_create_users_table', 1),
(7, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(8, '2019_08_19_000000_create_failed_jobs_table', 1),
(9, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(10, '2024_05_21_072133_create_categories_table', 1),
(11, '2024_05_21_074435_create_alats_table', 2),
(12, '2024_05_21_074552_create_carts_table', 3),
(13, '2024_05_21_074652_create_payments_table', 4),
(14, '2024_05_21_074735_create_orders_table', 5),
(16, '2024_05_22_081425_create_lokasis_table', 6),
(18, '2024_06_03_061159_remove_alat_id_from_lokasis_table', 7),
(19, '2024_06_03_072625_drop_lokasis', 7),
(20, '2024_06_07_013716_create_lokasis_table', 8),
(21, '2024_06_07_033003_add_lokasi_id_to_alats_table', 9);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `alat_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `payment_id` bigint(20) UNSIGNED NOT NULL,
  `durasi` int(11) NOT NULL,
  `starts` datetime NOT NULL,
  `ends` datetime NOT NULL,
  `harga` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `alat_id`, `user_id`, `payment_id`, `durasi`, `starts`, `ends`, `harga`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 3, 1, 6, '2024-05-21 17:03:00', '2024-05-21 23:03:00', 3, 2, '2024-05-21 02:02:34', '2024-05-21 02:05:30'),
(2, 2, 3, 2, 12, '2024-05-22 10:00:00', '2024-05-22 22:00:00', 110000, 2, '2024-05-21 19:58:45', '2024-05-21 20:10:06'),
(3, 6, 3, 3, 6, '2024-05-22 10:00:00', '2024-05-22 16:00:00', 5000, 2, '2024-05-21 19:59:49', '2024-05-21 20:05:58'),
(4, 6, 3, 4, 6, '2024-05-22 17:00:00', '2024-05-22 23:00:00', 5000, 1, '2024-05-22 01:01:03', '2024-05-22 01:01:03'),
(5, 1, 5, 5, 6, '2024-05-22 17:08:00', '2024-05-22 23:08:00', 55000, 2, '2024-05-22 02:07:35', '2024-05-22 02:08:27'),
(7, 4, 3, 7, 12, '2024-06-13 13:54:00', '2024-06-14 01:54:00', 10000, 2, '2024-06-06 20:54:35', '2024-06-06 20:55:09');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `no_invoice` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `total` int(11) NOT NULL,
  `bukti` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `no_invoice`, `user_id`, `total`, `bukti`, `status`, `created_at`, `updated_at`) VALUES
(1, '3/1716282153', 3, 3, '1716282371-Screenshot 2023-08-31 205511.png', 4, '2024-05-21 02:02:33', '2024-05-21 02:07:43'),
(2, '3/1716346725', 3, 110000, NULL, 2, '2024-05-21 19:58:45', '2024-05-21 20:10:06'),
(3, '3/1716346789', 3, 5000, '1716347263-th.jpeg', 4, '2024-05-21 19:59:49', '2024-05-21 20:09:54'),
(4, '3/1716364863', 3, 5000, NULL, 1, '2024-05-22 01:01:03', '2024-05-22 01:01:03'),
(5, '5/1716368855', 5, 55000, NULL, 2, '2024-05-22 02:07:35', '2024-05-22 02:08:27'),
(6, '3/1717732113', 3, 0, '1717732316-IMG-20231206-WA0031.jpg', 3, '2024-06-06 20:48:33', '2024-06-06 21:05:28'),
(7, '3/1717732475', 3, 10000, NULL, 2, '2024-06-06 20:54:35', '2024-06-06 20:55:09');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `telepon` varchar(255) DEFAULT NULL,
  `role` tinyint(4) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `telepon`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Nicholas', 'nicholas@gmail.com', NULL, '$2y$12$s1fLthnuKEhvbSSWMoRJYeph4Txv..hMZmd1TYq0aHacIoMKzsnQi', '0865555555555', 2, NULL, '2024-05-21 01:26:17', '2024-05-21 01:26:17'),
(2, 'edo', 'edo@gmail.com', NULL, '$2y$12$T3MdIf9CIlPzCnE06BrLRen7zEtDAkmACD9dyvYU1cfQLXNOL2XIS', '0865555555555', 1, NULL, '2024-05-21 01:33:46', '2024-05-21 01:33:46'),
(3, 'Nicholas', 'nicholassitorus12@gmail.com', NULL, '$2y$12$m.hWopej3cwJo9Fo2y5u8OXlJF8JRdvrDPQnW.8u0mQncQK2sGS06', '087878787898', 0, NULL, '2024-05-21 01:34:47', '2024-05-21 01:34:47'),
(4, 'niko', 'nicholass@gmail.com', NULL, '$2y$12$UYv9k0k.DXpMtaOXFdCKfu/7SEexw8aa7CLJdi2kOFsTZEABeudXW', '085260617452', 1, NULL, '2024-05-22 01:07:55', '2024-06-06 19:36:11'),
(5, 'wkwwkw', 'wkwkw@gmail.com', NULL, '$2y$12$mZQH1lIpOrw6pYzyROF6iOFzDDOJfDeW47eFhAeQRoHjJEpkXMRWm', '012345678903', 0, NULL, '2024-05-22 02:07:01', '2024-05-22 02:07:01'),
(6, 'Nicholas3', 'nicholas3@gmail.com', NULL, '$2y$12$ZZI.v0x9xO6nqauouiXlA.4ZiNmF/N2A3ymNVf0H0g/4CcsSkcT0W', '0865555555555', 0, NULL, '2024-06-02 23:04:41', '2024-06-02 23:04:41');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alats`
--
ALTER TABLE `alats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `alats_kategori_id_foreign` (`kategori_id`),
  ADD KEY `alats_lokasi_id_foreign` (`lokasi_id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_user_id_foreign` (`user_id`),
  ADD KEY `carts_alat_id_foreign` (`alat_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `lokasis`
--
ALTER TABLE `lokasis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lokasis_admin_id_foreign` (`admin_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_alat_id_foreign` (`alat_id`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_payment_id_foreign` (`payment_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_user_id_foreign` (`user_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alats`
--
ALTER TABLE `alats`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lokasis`
--
ALTER TABLE `lokasis`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `alats`
--
ALTER TABLE `alats`
  ADD CONSTRAINT `alats_kategori_id_foreign` FOREIGN KEY (`kategori_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `alats_lokasi_id_foreign` FOREIGN KEY (`lokasi_id`) REFERENCES `lokasis` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_alat_id_foreign` FOREIGN KEY (`alat_id`) REFERENCES `alats` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `lokasis`
--
ALTER TABLE `lokasis`
  ADD CONSTRAINT `lokasis_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_alat_id_foreign` FOREIGN KEY (`alat_id`) REFERENCES `alats` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_payment_id_foreign` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
