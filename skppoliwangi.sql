-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 19, 2023 at 07:30 AM
-- Server version: 5.7.33
-- PHP Version: 8.1.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `skppoliwangi`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jabatan`
--

CREATE TABLE `jabatan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jabatan`
--

INSERT INTO `jabatan` (`id`, `nama`, `created_at`, `updated_at`) VALUES
(1, 'Admin', '2023-05-18 03:18:34', '2023-05-18 03:18:34'),
(2, 'Dosen', '2023-05-18 03:18:34', '2023-05-18 03:18:34'),
(3, 'Ketua Jurusan Teknik Informatika', '2023-05-18 03:18:34', '2023-05-18 23:06:23'),
(4, 'Ketua Jurusan Teknik Mesin', '2023-05-18 22:42:45', '2023-05-18 23:06:39');

-- --------------------------------------------------------

--
-- Table structure for table `lampiran_skp`
--

CREATE TABLE `lampiran_skp` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `periode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lampiran_skp`
--

INSERT INTO `lampiran_skp` (`id`, `file`, `periode`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'lampiran/2-2023-05-19-sertifikat_course_86_278417_120622131642.pdf', '2023', 2, '2023-05-18 22:33:01', '2023-05-18 22:33:01'),
(2, 'lampiran/2-2023-05-19-Data Analysis with Python.pdf', '2023', 2, '2023-05-18 22:33:01', '2023-05-18 22:33:01');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_05_18_072626_create_permission_tables', 1),
(6, '2023_05_18_100535_create_jabatans_table', 1),
(7, '2023_05_18_100856_add_column_to_users', 1),
(8, '2023_05_19_052920_create_lampiran_s_k_p_s_table', 2),
(9, '2023_05_19_054641_create_s_k_p_s_table', 3),
(11, '2023_05_19_055216_update_table_skp', 4);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(3, 'App\\Models\\User', 2),
(2, 'App\\Models\\User', 3),
(3, 'App\\Models\\User', 3);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'view-any Jabatan', 'web', '2023-05-18 04:26:13', '2023-05-18 04:26:13'),
(2, 'view Jabatan', 'web', '2023-05-18 04:26:13', '2023-05-18 04:26:13'),
(3, 'create Jabatan', 'web', '2023-05-18 04:26:13', '2023-05-18 04:26:13'),
(4, 'update Jabatan', 'web', '2023-05-18 04:26:13', '2023-05-18 04:26:13'),
(5, 'delete Jabatan', 'web', '2023-05-18 04:26:13', '2023-05-18 04:26:13'),
(6, 'restore Jabatan', 'web', '2023-05-18 04:26:13', '2023-05-18 04:26:13'),
(7, 'force-delete Jabatan', 'web', '2023-05-18 04:26:13', '2023-05-18 04:26:13'),
(8, 'replicate Jabatan', 'web', '2023-05-18 04:26:13', '2023-05-18 04:26:13'),
(9, 'reorder Jabatan', 'web', '2023-05-18 04:26:13', '2023-05-18 04:26:13'),
(10, 'view-any Permission', 'web', '2023-05-18 04:26:13', '2023-05-18 04:26:13'),
(11, 'view Permission', 'web', '2023-05-18 04:26:13', '2023-05-18 04:26:13'),
(12, 'create Permission', 'web', '2023-05-18 04:26:13', '2023-05-18 04:26:13'),
(13, 'update Permission', 'web', '2023-05-18 04:26:13', '2023-05-18 04:26:13'),
(14, 'delete Permission', 'web', '2023-05-18 04:26:13', '2023-05-18 04:26:13'),
(15, 'restore Permission', 'web', '2023-05-18 04:26:13', '2023-05-18 04:26:13'),
(16, 'force-delete Permission', 'web', '2023-05-18 04:26:13', '2023-05-18 04:26:13'),
(17, 'replicate Permission', 'web', '2023-05-18 04:26:13', '2023-05-18 04:26:13'),
(18, 'reorder Permission', 'web', '2023-05-18 04:26:13', '2023-05-18 04:26:13'),
(19, 'view-any Role', 'web', '2023-05-18 04:26:13', '2023-05-18 04:26:13'),
(20, 'view Role', 'web', '2023-05-18 04:26:13', '2023-05-18 04:26:13'),
(21, 'create Role', 'web', '2023-05-18 04:26:13', '2023-05-18 04:26:13'),
(22, 'update Role', 'web', '2023-05-18 04:26:14', '2023-05-18 04:26:14'),
(23, 'delete Role', 'web', '2023-05-18 04:26:14', '2023-05-18 04:26:14'),
(24, 'restore Role', 'web', '2023-05-18 04:26:14', '2023-05-18 04:26:14'),
(25, 'force-delete Role', 'web', '2023-05-18 04:26:14', '2023-05-18 04:26:14'),
(26, 'replicate Role', 'web', '2023-05-18 04:26:14', '2023-05-18 04:26:14'),
(27, 'reorder Role', 'web', '2023-05-18 04:26:14', '2023-05-18 04:26:14'),
(28, 'view-any User', 'web', '2023-05-18 04:26:14', '2023-05-18 04:26:14'),
(29, 'view User', 'web', '2023-05-18 04:26:14', '2023-05-18 04:26:14'),
(30, 'create User', 'web', '2023-05-18 04:26:14', '2023-05-18 04:26:14'),
(31, 'update User', 'web', '2023-05-18 04:26:14', '2023-05-18 04:26:14'),
(32, 'delete User', 'web', '2023-05-18 04:26:14', '2023-05-18 04:26:14'),
(33, 'restore User', 'web', '2023-05-18 04:26:14', '2023-05-18 04:26:14'),
(34, 'force-delete User', 'web', '2023-05-18 04:26:14', '2023-05-18 04:26:14'),
(35, 'replicate User', 'web', '2023-05-18 04:26:14', '2023-05-18 04:26:14'),
(36, 'reorder User', 'web', '2023-05-18 04:26:14', '2023-05-18 04:26:14');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'web', '2023-05-18 04:29:26', '2023-05-18 04:29:26'),
(2, 'penilai', 'web', '2023-05-18 04:31:46', '2023-05-18 04:31:46'),
(3, 'pegawai', 'web', '2023-05-18 04:32:07', '2023-05-18 04:32:07');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `skp`
--

CREATE TABLE `skp` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pegawai_id` bigint(20) UNSIGNED NOT NULL,
  `penilai_id` bigint(20) UNSIGNED NOT NULL,
  `periode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `realisasi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lampiran` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `skp`
--

INSERT INTO `skp` (`id`, `nama`, `detail`, `pegawai_id`, `penilai_id`, `periode`, `realisasi`, `lampiran`, `created_at`, `updated_at`) VALUES
(1, 'Materi kuliah yang diampu tersampaikan sesuai dengan kurikulum dan silabus.', '- RPS dirancang sesuai dengan kurikulum telah diverifikasi Kaprodi (Proses Bisnis) - Jumlah pertemuan dan materi sesuai dengan RPS (Perspektif Penerima Layanan) - Kompetensi Mahasiswa telah dievaluasi sesuai Capaian Pembelajaran (Perspektif Penerima Layanan)\"', 2, 3, '2023', NULL, NULL, '2023-05-18 23:24:42', '2023-05-18 23:27:35'),
(2, 'Terlaksananya sidang proposal/hasil/ujian akhir mahasiswa jurusan Teknik Informatika sesuai dengan bidangnya', 'Mahasiswa diuji sesuai dengan proposal yang disusun (Perspektif Proses Bisnis)', 2, 3, '2023', NULL, NULL, '2023-05-18 23:27:17', '2023-05-18 23:27:17');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `nip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pangkat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jabatan_id` bigint(20) UNSIGNED NOT NULL,
  `unit_kerja` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `nip`, `pangkat`, `jabatan_id`, `unit_kerja`, `photo`) VALUES
(1, 'Admin', 'admin@admin.com', '2023-05-18 03:18:34', '$2y$10$bLTeV65DmOKlHaJU2PHuC.2R47FwReWJNs2oDArYSlQkSgdhL.a.K', 'MKZBNVCP5B9AXyRxfp1enaIzrxtQ5CIoemygCkhSj0vSsmO06kbzFoiQ7XZ3', '2023-05-18 03:18:34', '2023-05-18 03:18:34', '111111111111', 'Admin', 1, 'Politeknik Negeri Banyuwangi', 'not_found.jpg'),
(2, 'Khoirul Umam, S.Pd., M.Kom.', 'khumam@poliwangi.ac.id', NULL, '$2y$10$BLPwgblDKPb19/BQq7wGy.xWN.p8xoVkWzDHODWmZ8WXwGA3pX7TK', NULL, '2023-05-18 05:00:18', '2023-05-18 05:00:18', '199103112022031000', 'CPNS / III.b', 2, 'Politeknik Negeri Banyuwangi', '46OIsGhL1BZv1WtKXvgak7Ak1XWBjQ-metabG9nby1wb2xpd2FuZ2kucG5n-.png'),
(3, 'Mohamad Dimyati Ayatullah, S.T., M.Kom.', 'dimyati@gmail.com', NULL, '$2y$10$yMk3noiTt9ccjPdZJyl9QegI/sPVNFLOIvdojuZxGNPPrYDHCZ5/2', NULL, '2023-05-18 23:06:04', '2023-05-18 23:06:04', '197601222021211001', 'Penata, X', 3, 'Politeknik Negeri Banyuwangi', 'zEVovHkEBBtgXGKCHp5H0GcnxHn2Nq-metabG9nby1wb2xpd2FuZ2kucG5n-.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jabatan`
--
ALTER TABLE `jabatan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lampiran_skp`
--
ALTER TABLE `lampiran_skp`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lampiran_skp_user_id_foreign` (`user_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `skp`
--
ALTER TABLE `skp`
  ADD PRIMARY KEY (`id`),
  ADD KEY `skp_pegawai_id_foreign` (`pegawai_id`),
  ADD KEY `skp_penilai_id_foreign` (`penilai_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_jabatan_id_foreign` (`jabatan_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jabatan`
--
ALTER TABLE `jabatan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `lampiran_skp`
--
ALTER TABLE `lampiran_skp`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `skp`
--
ALTER TABLE `skp`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `lampiran_skp`
--
ALTER TABLE `lampiran_skp`
  ADD CONSTRAINT `lampiran_skp_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `skp`
--
ALTER TABLE `skp`
  ADD CONSTRAINT `skp_pegawai_id_foreign` FOREIGN KEY (`pegawai_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `skp_penilai_id_foreign` FOREIGN KEY (`penilai_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_jabatan_id_foreign` FOREIGN KEY (`jabatan_id`) REFERENCES `jabatan` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
