-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: 06. Mar, 2025 12:42 PM
-- Tjener-versjon: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `greencode_db`
--
CREATE DATABASE IF NOT EXISTS `greencode_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `greencode_db`;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `access_tokens`
--

CREATE TABLE `access_tokens` (
  `id` int(10) UNSIGNED NOT NULL,
  `token` varchar(40) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `last_activity_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `type` varchar(100) NOT NULL,
  `title` varchar(150) DEFAULT NULL,
  `last_ip_address` varchar(45) DEFAULT NULL,
  `last_user_agent` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dataark for tabell `access_tokens`
--

INSERT INTO `access_tokens` (`id`, `token`, `user_id`, `last_activity_at`, `created_at`, `type`, `title`, `last_ip_address`, `last_user_agent`) VALUES
(1, 'ru9JBZ3nHkBFXRP13afmIfFPjHDnYb9GfSfr7y6c', 1, '2025-03-03 13:49:57', '2025-03-03 13:49:57', 'session_remember', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36'),
(3, 'kOuOK4LIXnYc60PZ9mN3f7TByC8Eb31NIShVNQIQ', 1, '2025-03-04 11:49:27', '2025-03-04 11:33:28', 'session_remember', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36'),
(4, 'IHOQFnow8cb4Tw5qKDbeIU3JfOehW9Jp0yDPWlB4', 2, '2025-03-04 11:52:37', '2025-03-04 11:36:36', 'session_remember', NULL, '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36'),
(5, 'AYFKKjHP8PsOEOYJRqP2jkCJpimlw7h6KinbPlqh', 3, '2025-03-04 11:46:00', '2025-03-04 11:46:00', 'session_remember', NULL, '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.3 Mobile/15E148 Safari/604.1'),
(6, 'O3RlIYMqWT5uO38HcKtf8iSDwEZS4yMTsM5j8aSn', 3, '2025-03-04 11:54:15', '2025-03-04 11:49:37', 'session', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36'),
(7, 'vbm7Fp2a1IFCu4MjjMpAQIgLC53Pm0Y4IPo70RLf', 1, '2025-03-04 14:43:49', '2025-03-04 14:33:57', 'session', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36');

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `api_keys`
--

CREATE TABLE `api_keys` (
  `key` varchar(100) NOT NULL,
  `id` int(10) UNSIGNED NOT NULL,
  `allowed_ips` varchar(255) DEFAULT NULL,
  `scopes` varchar(255) DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `last_activity_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `discussions`
--

CREATE TABLE `discussions` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(200) NOT NULL,
  `comment_count` int(11) NOT NULL DEFAULT 1,
  `participant_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `post_number_index` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `first_post_id` int(10) UNSIGNED DEFAULT NULL,
  `last_posted_at` datetime DEFAULT NULL,
  `last_posted_user_id` int(10) UNSIGNED DEFAULT NULL,
  `last_post_id` int(10) UNSIGNED DEFAULT NULL,
  `last_post_number` int(10) UNSIGNED DEFAULT NULL,
  `hidden_at` datetime DEFAULT NULL,
  `hidden_user_id` int(10) UNSIGNED DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  `is_private` tinyint(1) NOT NULL DEFAULT 0,
  `is_approved` tinyint(1) NOT NULL DEFAULT 1,
  `is_sticky` tinyint(1) NOT NULL DEFAULT 0,
  `is_locked` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dataark for tabell `discussions`
--

INSERT INTO `discussions` (`id`, `title`, `comment_count`, `participant_count`, `post_number_index`, `created_at`, `user_id`, `first_post_id`, `last_posted_at`, `last_posted_user_id`, `last_post_id`, `last_post_number`, `hidden_at`, `hidden_user_id`, `slug`, `is_private`, `is_approved`, `is_sticky`, `is_locked`) VALUES
(1, 'How to make greencode better?', 2, 1, 0, '2025-03-03 14:04:41', 1, 1, '2025-03-04 11:39:45', 1, 2, 2, NULL, NULL, 'how-to-make-greencode-better', 0, 1, 0, 0),
(3, 'ka faen ', 4, 3, 0, '2025-03-04 11:49:09', 2, 3, '2025-03-04 11:54:15', 3, 6, 4, NULL, NULL, 'ka-faen', 0, 1, 0, 0);

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `discussion_tag`
--

CREATE TABLE `discussion_tag` (
  `discussion_id` int(10) UNSIGNED NOT NULL,
  `tag_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dataark for tabell `discussion_tag`
--

INSERT INTO `discussion_tag` (`discussion_id`, `tag_id`, `created_at`) VALUES
(3, 1, '2025-03-04 11:49:09');

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `discussion_user`
--

CREATE TABLE `discussion_user` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `discussion_id` int(10) UNSIGNED NOT NULL,
  `last_read_at` datetime DEFAULT NULL,
  `last_read_post_number` int(10) UNSIGNED DEFAULT NULL,
  `subscription` enum('follow','ignore') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dataark for tabell `discussion_user`
--

INSERT INTO `discussion_user` (`user_id`, `discussion_id`, `last_read_at`, `last_read_post_number`, `subscription`) VALUES
(1, 1, '2025-03-04 11:39:45', 2, NULL),
(1, 3, '2025-03-04 11:49:36', 2, NULL),
(2, 1, '2025-03-04 11:40:03', 2, NULL),
(2, 3, '2025-03-04 11:52:41', 3, NULL),
(3, 1, '2025-03-04 11:47:16', 2, NULL),
(3, 3, '2025-03-04 11:54:16', 4, NULL);

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `email_tokens`
--

CREATE TABLE `email_tokens` (
  `token` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dataark for tabell `email_tokens`
--

INSERT INTO `email_tokens` (`token`, `email`, `user_id`, `created_at`) VALUES
('adzTDflPeVpKZ4PQdTzCjlSizgBVQFo2LO38ajSi', '11danielsoderholm2005@gmail.com', 3, '2025-03-04 11:22:21'),
('dpbbY9N4wfCuhXNdVX0bJ3VMG20gfyuYm4yIycpI', '11danielsoderholm2005@gmail.com', 3, '2025-03-04 11:47:06'),
('jkg18YG3ayuPedMRetagpaaftpgSRj9rFCVMwEZp', 'tord.o.svendsen@gmail.com', 2, '2025-03-04 11:37:34'),
('Pwt8figJbeeBi0t5ki9McmN2Fty8WPDBEl2YWZKS', 'tord.o.svendsen@gmail.com', 2, '2025-03-04 11:21:34');

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `flags`
--

CREATE TABLE `flags` (
  `id` int(10) UNSIGNED NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `reason_detail` text DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `groups`
--

CREATE TABLE `groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name_singular` varchar(100) NOT NULL,
  `name_plural` varchar(100) NOT NULL,
  `color` varchar(20) DEFAULT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `is_hidden` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dataark for tabell `groups`
--

INSERT INTO `groups` (`id`, `name_singular`, `name_plural`, `color`, `icon`, `is_hidden`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'Admins', '#B72A2A', 'fas fa-wrench', 0, NULL, NULL),
(2, 'Guest', 'Guests', NULL, NULL, 0, NULL, NULL),
(3, 'Member', 'Members', NULL, NULL, 0, NULL, NULL),
(4, 'Mod', 'Mods', '#80349E', 'fas fa-bolt', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `group_permission`
--

CREATE TABLE `group_permission` (
  `group_id` int(10) UNSIGNED NOT NULL,
  `permission` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dataark for tabell `group_permission`
--

INSERT INTO `group_permission` (`group_id`, `permission`, `created_at`) VALUES
(2, 'searchUsers', '2025-03-04 11:44:12'),
(2, 'viewForum', NULL),
(3, 'discussion.flagPosts', '2025-03-03 13:49:57'),
(3, 'discussion.likePosts', '2025-03-03 13:49:58'),
(3, 'discussion.reply', NULL),
(3, 'discussion.replyWithoutApproval', '2025-03-03 13:49:57'),
(3, 'discussion.startWithoutApproval', '2025-03-03 13:49:57'),
(3, 'startDiscussion', NULL),
(4, 'discussion.approvePosts', '2025-03-03 13:49:57'),
(4, 'discussion.editPosts', NULL),
(4, 'discussion.hide', NULL),
(4, 'discussion.hidePosts', NULL),
(4, 'discussion.lock', '2025-03-03 13:49:58'),
(4, 'discussion.rename', NULL),
(4, 'discussion.sticky', '2025-03-03 13:49:58'),
(4, 'discussion.tag', '2025-03-03 13:49:57'),
(4, 'discussion.viewFlags', '2025-03-03 13:49:57'),
(4, 'discussion.viewIpsPosts', NULL),
(4, 'user.suspend', '2025-03-03 13:49:58'),
(4, 'user.viewLastSeenAt', NULL);

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `group_user`
--

CREATE TABLE `group_user` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `group_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dataark for tabell `group_user`
--

INSERT INTO `group_user` (`user_id`, `group_id`, `created_at`) VALUES
(1, 1, '2025-03-03 13:49:57');

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `login_providers`
--

CREATE TABLE `login_providers` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `provider` varchar(100) NOT NULL,
  `identifier` varchar(100) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `last_login_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `extension` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dataark for tabell `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `extension`) VALUES
(1, '2015_02_24_000000_create_access_tokens_table', NULL),
(2, '2015_02_24_000000_create_api_keys_table', NULL),
(3, '2015_02_24_000000_create_config_table', NULL),
(4, '2015_02_24_000000_create_discussions_table', NULL),
(5, '2015_02_24_000000_create_email_tokens_table', NULL),
(6, '2015_02_24_000000_create_groups_table', NULL),
(7, '2015_02_24_000000_create_notifications_table', NULL),
(8, '2015_02_24_000000_create_password_tokens_table', NULL),
(9, '2015_02_24_000000_create_permissions_table', NULL),
(10, '2015_02_24_000000_create_posts_table', NULL),
(11, '2015_02_24_000000_create_users_discussions_table', NULL),
(12, '2015_02_24_000000_create_users_groups_table', NULL),
(13, '2015_02_24_000000_create_users_table', NULL),
(14, '2015_09_15_000000_create_auth_tokens_table', NULL),
(15, '2015_09_20_224327_add_hide_to_discussions', NULL),
(16, '2015_09_22_030432_rename_notification_read_time', NULL),
(17, '2015_10_07_130531_rename_config_to_settings', NULL),
(18, '2015_10_24_194000_add_ip_address_to_posts', NULL),
(19, '2015_12_05_042721_change_access_tokens_columns', NULL),
(20, '2015_12_17_194247_change_settings_value_column_to_text', NULL),
(21, '2016_02_04_095452_add_slug_to_discussions', NULL),
(22, '2017_04_07_114138_add_is_private_to_discussions', NULL),
(23, '2017_04_07_114138_add_is_private_to_posts', NULL),
(24, '2018_01_11_093900_change_access_tokens_columns', NULL),
(25, '2018_01_11_094000_change_access_tokens_add_foreign_keys', NULL),
(26, '2018_01_11_095000_change_api_keys_columns', NULL),
(27, '2018_01_11_101800_rename_auth_tokens_to_registration_tokens', NULL),
(28, '2018_01_11_102000_change_registration_tokens_rename_id_to_token', NULL),
(29, '2018_01_11_102100_change_registration_tokens_created_at_to_datetime', NULL),
(30, '2018_01_11_120604_change_posts_table_to_innodb', NULL),
(31, '2018_01_11_155200_change_discussions_rename_columns', NULL),
(32, '2018_01_11_155300_change_discussions_add_foreign_keys', NULL),
(33, '2018_01_15_071700_rename_users_discussions_to_discussion_user', NULL),
(34, '2018_01_15_071800_change_discussion_user_rename_columns', NULL),
(35, '2018_01_15_071900_change_discussion_user_add_foreign_keys', NULL),
(36, '2018_01_15_072600_change_email_tokens_rename_id_to_token', NULL),
(37, '2018_01_15_072700_change_email_tokens_add_foreign_keys', NULL),
(38, '2018_01_15_072800_change_email_tokens_created_at_to_datetime', NULL),
(39, '2018_01_18_130400_rename_permissions_to_group_permission', NULL),
(40, '2018_01_18_130500_change_group_permission_add_foreign_keys', NULL),
(41, '2018_01_18_130600_rename_users_groups_to_group_user', NULL),
(42, '2018_01_18_130700_change_group_user_add_foreign_keys', NULL),
(43, '2018_01_18_133000_change_notifications_columns', NULL),
(44, '2018_01_18_133100_change_notifications_add_foreign_keys', NULL),
(45, '2018_01_18_134400_change_password_tokens_rename_id_to_token', NULL),
(46, '2018_01_18_134500_change_password_tokens_add_foreign_keys', NULL),
(47, '2018_01_18_134600_change_password_tokens_created_at_to_datetime', NULL),
(48, '2018_01_18_135000_change_posts_rename_columns', NULL),
(49, '2018_01_18_135100_change_posts_add_foreign_keys', NULL),
(50, '2018_01_30_112238_add_fulltext_index_to_discussions_title', NULL),
(51, '2018_01_30_220100_create_post_user_table', NULL),
(52, '2018_01_30_222900_change_users_rename_columns', NULL),
(55, '2018_09_15_041340_add_users_indicies', NULL),
(56, '2018_09_15_041828_add_discussions_indicies', NULL),
(57, '2018_09_15_043337_add_notifications_indices', NULL),
(58, '2018_09_15_043621_add_posts_indices', NULL),
(59, '2018_09_22_004100_change_registration_tokens_columns', NULL),
(60, '2018_09_22_004200_create_login_providers_table', NULL),
(61, '2018_10_08_144700_add_shim_prefix_to_group_icons', NULL),
(62, '2019_10_12_195349_change_posts_add_discussion_foreign_key', NULL),
(63, '2020_03_19_134512_change_discussions_default_comment_count', NULL),
(64, '2020_04_21_130500_change_permission_groups_add_is_hidden', NULL),
(65, '2021_03_02_040000_change_access_tokens_add_type', NULL),
(66, '2021_03_02_040500_change_access_tokens_add_id', NULL),
(67, '2021_03_02_041000_change_access_tokens_add_title_ip_agent', NULL),
(68, '2021_04_18_040500_change_migrations_add_id_primary_key', NULL),
(69, '2021_04_18_145100_change_posts_content_column_to_mediumtext', NULL),
(70, '2018_07_21_000000_seed_default_groups', NULL),
(71, '2018_07_21_000100_seed_default_group_permissions', NULL),
(72, '2021_05_10_000000_rename_permissions', NULL),
(73, '2022_05_20_000000_add_timestamps_to_groups_table', NULL),
(74, '2022_05_20_000001_add_created_at_to_group_user_table', NULL),
(75, '2022_05_20_000002_add_created_at_to_group_permission_table', NULL),
(76, '2022_07_14_000000_add_type_index_to_posts', NULL),
(77, '2022_07_14_000001_add_type_created_at_composite_index_to_posts', NULL),
(78, '2022_08_06_000000_change_access_tokens_last_activity_at_to_nullable', NULL),
(79, '2015_09_02_000000_add_flags_read_time_to_users_table', 'flarum-flags'),
(80, '2015_09_02_000000_create_flags_table', 'flarum-flags'),
(81, '2017_07_22_000000_add_default_permissions', 'flarum-flags'),
(82, '2018_06_27_101500_change_flags_rename_time_to_created_at', 'flarum-flags'),
(83, '2018_06_27_101600_change_flags_add_foreign_keys', 'flarum-flags'),
(84, '2018_06_27_105100_change_users_rename_flags_read_time_to_read_flags_at', 'flarum-flags'),
(85, '2018_09_15_043621_add_flags_indices', 'flarum-flags'),
(86, '2019_10_22_000000_change_reason_text_col_type', 'flarum-flags'),
(87, '2015_09_21_011527_add_is_approved_to_discussions', 'flarum-approval'),
(88, '2015_09_21_011706_add_is_approved_to_posts', 'flarum-approval'),
(89, '2017_07_22_000000_add_default_permissions', 'flarum-approval'),
(90, '2015_02_24_000000_create_discussions_tags_table', 'flarum-tags'),
(91, '2015_02_24_000000_create_tags_table', 'flarum-tags'),
(92, '2015_02_24_000000_create_users_tags_table', 'flarum-tags'),
(93, '2015_02_24_000000_set_default_settings', 'flarum-tags'),
(94, '2015_10_19_061223_make_slug_unique', 'flarum-tags'),
(95, '2017_07_22_000000_add_default_permissions', 'flarum-tags'),
(96, '2018_06_27_085200_change_tags_columns', 'flarum-tags'),
(97, '2018_06_27_085300_change_tags_add_foreign_keys', 'flarum-tags'),
(98, '2018_06_27_090400_rename_users_tags_to_tag_user', 'flarum-tags'),
(99, '2018_06_27_100100_change_tag_user_rename_read_time_to_marked_as_read_at', 'flarum-tags'),
(100, '2018_06_27_100200_change_tag_user_add_foreign_keys', 'flarum-tags'),
(101, '2018_06_27_103000_rename_discussions_tags_to_discussion_tag', 'flarum-tags'),
(102, '2018_06_27_103100_add_discussion_tag_foreign_keys', 'flarum-tags'),
(103, '2019_04_21_000000_add_icon_to_tags_table', 'flarum-tags'),
(104, '2022_05_20_000003_add_timestamps_to_tags_table', 'flarum-tags'),
(105, '2022_05_20_000004_add_created_at_to_discussion_tag_table', 'flarum-tags'),
(106, '2023_03_01_000000_create_post_mentions_tag_table', 'flarum-tags'),
(107, '2015_05_11_000000_add_suspended_until_to_users_table', 'flarum-suspend'),
(108, '2015_09_14_000000_rename_suspended_until_column', 'flarum-suspend'),
(109, '2017_07_22_000000_add_default_permissions', 'flarum-suspend'),
(110, '2018_06_27_111400_change_users_rename_suspend_until_to_suspended_until', 'flarum-suspend'),
(111, '2021_10_27_000000_add_suspend_reason_and_message', 'flarum-suspend'),
(112, '2015_05_11_000000_add_subscription_to_users_discussions_table', 'flarum-subscriptions'),
(113, '2015_02_24_000000_add_sticky_to_discussions', 'flarum-sticky'),
(114, '2017_07_22_000000_add_default_permissions', 'flarum-sticky'),
(115, '2018_09_15_043621_add_discussions_indices', 'flarum-sticky'),
(116, '2021_01_13_000000_add_discussion_last_posted_at_indices', 'flarum-sticky'),
(117, '2015_05_11_000000_create_mentions_posts_table', 'flarum-mentions'),
(118, '2015_05_11_000000_create_mentions_users_table', 'flarum-mentions'),
(119, '2018_06_27_102000_rename_mentions_posts_to_post_mentions_post', 'flarum-mentions'),
(120, '2018_06_27_102100_rename_mentions_users_to_post_mentions_user', 'flarum-mentions'),
(121, '2018_06_27_102200_change_post_mentions_post_rename_mentions_id_to_mentions_post_id', 'flarum-mentions'),
(122, '2018_06_27_102300_change_post_mentions_post_add_foreign_keys', 'flarum-mentions'),
(123, '2018_06_27_102400_change_post_mentions_user_rename_mentions_id_to_mentions_user_id', 'flarum-mentions'),
(124, '2018_06_27_102500_change_post_mentions_user_add_foreign_keys', 'flarum-mentions'),
(125, '2021_04_19_000000_set_default_settings', 'flarum-mentions'),
(126, '2022_05_20_000005_add_created_at_to_post_mentions_post_table', 'flarum-mentions'),
(127, '2022_05_20_000006_add_created_at_to_post_mentions_user_table', 'flarum-mentions'),
(128, '2022_10_21_000000_create_post_mentions_group_table', 'flarum-mentions'),
(129, '2021_03_25_000000_default_settings', 'flarum-markdown'),
(130, '2015_02_24_000000_add_locked_to_discussions', 'flarum-lock'),
(131, '2017_07_22_000000_add_default_permissions', 'flarum-lock'),
(132, '2018_09_15_043621_add_discussions_indices', 'flarum-lock'),
(133, '2015_05_11_000000_create_posts_likes_table', 'flarum-likes'),
(134, '2015_09_04_000000_add_default_like_permissions', 'flarum-likes'),
(135, '2018_06_27_100600_rename_posts_likes_to_post_likes', 'flarum-likes'),
(136, '2018_06_27_100700_change_post_likes_add_foreign_keys', 'flarum-likes'),
(137, '2021_05_10_094200_add_created_at_to_post_likes_table', 'flarum-likes'),
(138, '2018_09_29_060444_replace_emoji_shorcuts_with_unicode', 'flarum-emoji');

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `notifications`
--

CREATE TABLE `notifications` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `from_user_id` int(10) UNSIGNED DEFAULT NULL,
  `type` varchar(100) NOT NULL,
  `subject_id` int(10) UNSIGNED DEFAULT NULL,
  `data` blob DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
  `read_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `password_tokens`
--

CREATE TABLE `password_tokens` (
  `token` varchar(100) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `discussion_id` int(10) UNSIGNED NOT NULL,
  `number` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `content` mediumtext DEFAULT NULL COMMENT ' ',
  `edited_at` datetime DEFAULT NULL,
  `edited_user_id` int(10) UNSIGNED DEFAULT NULL,
  `hidden_at` datetime DEFAULT NULL,
  `hidden_user_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `is_private` tinyint(1) NOT NULL DEFAULT 0,
  `is_approved` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dataark for tabell `posts`
--

INSERT INTO `posts` (`id`, `discussion_id`, `number`, `created_at`, `user_id`, `type`, `content`, `edited_at`, `edited_user_id`, `hidden_at`, `hidden_user_id`, `ip_address`, `is_private`, `is_approved`) VALUES
(1, 1, 1, '2025-03-03 14:04:41', 1, 'comment', '<t><p>Hey!</p>\n\n<p>I\'m trying to find ways to make greencode better, can i get some tips?</p></t>', NULL, NULL, NULL, NULL, '::1', 0, 1),
(2, 1, 2, '2025-03-04 11:39:45', 1, 'comment', '<t><p>heihei</p></t>', NULL, NULL, NULL, NULL, '::1', 0, 1),
(3, 3, 1, '2025-03-04 11:49:09', 2, 'comment', '<t><p>ka faen</p></t>', NULL, NULL, NULL, NULL, '::1', 0, 1),
(4, 3, 2, '2025-03-04 11:49:36', 1, 'comment', '<t><p>ka i helvete</p>\n</t>', NULL, NULL, NULL, NULL, '::1', 0, 1),
(5, 3, 3, '2025-03-04 11:52:27', 3, 'comment', '<r><p><IMG alt=\"\" src=\"https://hips.hearstapps.com/hmg-prod/images/ripe-apple-royalty-free-image-1659454396.jpg?crop=0.924xw:0.679xh;0.0197xw,0.212xh&amp;resize=980:*\"><s>![</s><e>](https://hips.hearstapps.com/hmg-prod/images/ripe-apple-royalty-free-image-1659454396.jpg?crop=0.924xw:0.679xh;0.0197xw,0.212xh&amp;resize=980:*)</e></IMG></p></r>', NULL, NULL, NULL, NULL, '::1', 0, 1),
(6, 3, 4, '2025-03-04 11:54:15', 3, 'comment', '<r> <p>&#127462;  &#127467; <STRONG><s>**</s>aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa<e>**</e></STRONG></p></r>', NULL, NULL, NULL, NULL, '::1', 0, 1);

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `post_likes`
--

CREATE TABLE `post_likes` (
  `post_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `post_mentions_group`
--

CREATE TABLE `post_mentions_group` (
  `post_id` int(10) UNSIGNED NOT NULL,
  `mentions_group_id` int(10) UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `post_mentions_post`
--

CREATE TABLE `post_mentions_post` (
  `post_id` int(10) UNSIGNED NOT NULL,
  `mentions_post_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `post_mentions_tag`
--

CREATE TABLE `post_mentions_tag` (
  `post_id` int(10) UNSIGNED NOT NULL,
  `mentions_tag_id` int(10) UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `post_mentions_user`
--

CREATE TABLE `post_mentions_user` (
  `post_id` int(10) UNSIGNED NOT NULL,
  `mentions_user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `post_user`
--

CREATE TABLE `post_user` (
  `post_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `registration_tokens`
--

CREATE TABLE `registration_tokens` (
  `token` varchar(100) NOT NULL,
  `payload` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `provider` varchar(255) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `user_attributes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `settings`
--

CREATE TABLE `settings` (
  `key` varchar(100) NOT NULL,
  `value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dataark for tabell `settings`
--

INSERT INTO `settings` (`key`, `value`) VALUES
('allow_hide_own_posts', 'reply'),
('allow_post_editing', 'reply'),
('allow_renaming', '10'),
('allow_sign_up', '1'),
('custom_less', ''),
('default_locale', 'en'),
('default_route', '/all'),
('display_name_driver', 'username'),
('extensions_enabled', '[\"flarum-flags\",\"flarum-approval\",\"flarum-tags\",\"flarum-suspend\",\"flarum-subscriptions\",\"flarum-sticky\",\"flarum-statistics\",\"flarum-mentions\",\"flarum-markdown\",\"flarum-lock\",\"flarum-likes\",\"flarum-lang-english\",\"flarum-emoji\",\"flarum-bbcode\"]'),
('flarum-markdown.mdarea', '1'),
('flarum-mentions.allow_username_format', '1'),
('flarum-tags.max_primary_tags', '1'),
('flarum-tags.max_secondary_tags', '3'),
('flarum-tags.min_primary_tags', '1'),
('flarum-tags.min_secondary_tags', '0'),
('forum_description', ''),
('forum_title', 'GreenCode Forum'),
('mail_driver', 'mail'),
('mail_from', 'noreply@localhost'),
('slug_driver_Flarum\\User\\User', 'default'),
('theme_colored_header', '0'),
('theme_dark_mode', '0'),
('theme_primary_color', '#4D698E'),
('theme_secondary_color', '#4D698E'),
('version', '1.8.7'),
('welcome_message', 'Enjoy your new forum! Hop over to discuss.flarum.org if you have any questions, or to join our community!'),
('welcome_title', 'Welcome to GreenCode Forum');

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `tags`
--

CREATE TABLE `tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  `background_path` varchar(100) DEFAULT NULL,
  `background_mode` varchar(100) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `default_sort` varchar(50) DEFAULT NULL,
  `is_restricted` tinyint(1) NOT NULL DEFAULT 0,
  `is_hidden` tinyint(1) NOT NULL DEFAULT 0,
  `discussion_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `last_posted_at` datetime DEFAULT NULL,
  `last_posted_discussion_id` int(10) UNSIGNED DEFAULT NULL,
  `last_posted_user_id` int(10) UNSIGNED DEFAULT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dataark for tabell `tags`
--

INSERT INTO `tags` (`id`, `name`, `slug`, `description`, `color`, `background_path`, `background_mode`, `position`, `parent_id`, `default_sort`, `is_restricted`, `is_hidden`, `discussion_count`, `last_posted_at`, `last_posted_discussion_id`, `last_posted_user_id`, `icon`, `created_at`, `updated_at`) VALUES
(1, 'General', 'general', NULL, '#888', NULL, NULL, 0, NULL, NULL, 0, 0, 1, '2025-03-04 11:54:15', 3, 3, NULL, NULL, '2025-03-04 11:54:16');

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `tag_user`
--

CREATE TABLE `tag_user` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `tag_id` int(10) UNSIGNED NOT NULL,
  `marked_as_read_at` datetime DEFAULT NULL,
  `is_hidden` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `is_email_confirmed` tinyint(1) NOT NULL DEFAULT 0,
  `password` varchar(100) NOT NULL,
  `avatar_url` varchar(100) DEFAULT NULL,
  `preferences` blob DEFAULT NULL,
  `joined_at` datetime DEFAULT NULL,
  `last_seen_at` datetime DEFAULT NULL,
  `marked_all_as_read_at` datetime DEFAULT NULL,
  `read_notifications_at` datetime DEFAULT NULL,
  `discussion_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `comment_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `read_flags_at` datetime DEFAULT NULL,
  `suspended_until` datetime DEFAULT NULL,
  `suspend_reason` text DEFAULT NULL,
  `suspend_message` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dataark for tabell `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `is_email_confirmed`, `password`, `avatar_url`, `preferences`, `joined_at`, `last_seen_at`, `marked_all_as_read_at`, `read_notifications_at`, `discussion_count`, `comment_count`, `read_flags_at`, `suspended_until`, `suspend_reason`, `suspend_message`) VALUES
(1, 'itsmarco', 'marco.svindland2@outlook.com', 1, '$2y$10$iBkrJgHS/zjusKF/2wKnme3y9RAivjABoWaEO/f9KhGXF8l5sqy0K', NULL, NULL, '2025-03-03 13:49:57', '2025-03-04 14:43:49', NULL, NULL, 1, 3, NULL, NULL, NULL, NULL),
(2, 'tord', 'tord.o.svendsen@gmail.com', 1, '$2y$10$N6ibmfDULnu0Qlo8jyOPZuoM4zhNSaim5VihPA3bkzWABCnMPVla2', NULL, NULL, '2025-03-04 11:21:34', '2025-03-04 11:52:38', '2025-03-04 11:37:23', NULL, 1, 1, NULL, NULL, NULL, NULL),
(3, 'Dsn', '11danielsoderholm2005@gmail.com', 1, '$2y$10$RizbQC14aYaxl6aSIvjX0uvjGmOdsxuvMxgXpRnTxlU9KDDkTAHVq', NULL, NULL, '2025-03-04 11:22:21', '2025-03-04 11:53:17', NULL, NULL, 0, 2, NULL, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `access_tokens`
--
ALTER TABLE `access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `access_tokens_token_unique` (`token`),
  ADD KEY `access_tokens_user_id_foreign` (`user_id`),
  ADD KEY `access_tokens_type_index` (`type`);

--
-- Indexes for table `api_keys`
--
ALTER TABLE `api_keys`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `api_keys_key_unique` (`key`),
  ADD KEY `api_keys_user_id_foreign` (`user_id`);

--
-- Indexes for table `discussions`
--
ALTER TABLE `discussions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `discussions_hidden_user_id_foreign` (`hidden_user_id`),
  ADD KEY `discussions_first_post_id_foreign` (`first_post_id`),
  ADD KEY `discussions_last_post_id_foreign` (`last_post_id`),
  ADD KEY `discussions_last_posted_at_index` (`last_posted_at`),
  ADD KEY `discussions_last_posted_user_id_index` (`last_posted_user_id`),
  ADD KEY `discussions_created_at_index` (`created_at`),
  ADD KEY `discussions_user_id_index` (`user_id`),
  ADD KEY `discussions_comment_count_index` (`comment_count`),
  ADD KEY `discussions_participant_count_index` (`participant_count`),
  ADD KEY `discussions_hidden_at_index` (`hidden_at`),
  ADD KEY `discussions_is_sticky_created_at_index` (`is_sticky`,`created_at`),
  ADD KEY `discussions_is_sticky_last_posted_at_index` (`is_sticky`,`last_posted_at`),
  ADD KEY `discussions_is_locked_index` (`is_locked`);
ALTER TABLE `discussions` ADD FULLTEXT KEY `title` (`title`);

--
-- Indexes for table `discussion_tag`
--
ALTER TABLE `discussion_tag`
  ADD PRIMARY KEY (`discussion_id`,`tag_id`),
  ADD KEY `discussion_tag_tag_id_foreign` (`tag_id`);

--
-- Indexes for table `discussion_user`
--
ALTER TABLE `discussion_user`
  ADD PRIMARY KEY (`user_id`,`discussion_id`),
  ADD KEY `discussion_user_discussion_id_foreign` (`discussion_id`);

--
-- Indexes for table `email_tokens`
--
ALTER TABLE `email_tokens`
  ADD PRIMARY KEY (`token`),
  ADD KEY `email_tokens_user_id_foreign` (`user_id`);

--
-- Indexes for table `flags`
--
ALTER TABLE `flags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `flags_post_id_foreign` (`post_id`),
  ADD KEY `flags_user_id_foreign` (`user_id`),
  ADD KEY `flags_created_at_index` (`created_at`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `group_permission`
--
ALTER TABLE `group_permission`
  ADD PRIMARY KEY (`group_id`,`permission`);

--
-- Indexes for table `group_user`
--
ALTER TABLE `group_user`
  ADD PRIMARY KEY (`user_id`,`group_id`),
  ADD KEY `group_user_group_id_foreign` (`group_id`);

--
-- Indexes for table `login_providers`
--
ALTER TABLE `login_providers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `login_providers_provider_identifier_unique` (`provider`,`identifier`),
  ADD KEY `login_providers_user_id_foreign` (`user_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_from_user_id_foreign` (`from_user_id`),
  ADD KEY `notifications_user_id_index` (`user_id`);

--
-- Indexes for table `password_tokens`
--
ALTER TABLE `password_tokens`
  ADD PRIMARY KEY (`token`),
  ADD KEY `password_tokens_user_id_foreign` (`user_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_discussion_id_number_unique` (`discussion_id`,`number`),
  ADD KEY `posts_edited_user_id_foreign` (`edited_user_id`),
  ADD KEY `posts_hidden_user_id_foreign` (`hidden_user_id`),
  ADD KEY `posts_discussion_id_number_index` (`discussion_id`,`number`),
  ADD KEY `posts_discussion_id_created_at_index` (`discussion_id`,`created_at`),
  ADD KEY `posts_user_id_created_at_index` (`user_id`,`created_at`),
  ADD KEY `posts_type_index` (`type`),
  ADD KEY `posts_type_created_at_index` (`type`,`created_at`);
ALTER TABLE `posts` ADD FULLTEXT KEY `content` (`content`);

--
-- Indexes for table `post_likes`
--
ALTER TABLE `post_likes`
  ADD PRIMARY KEY (`post_id`,`user_id`),
  ADD KEY `post_likes_user_id_foreign` (`user_id`);

--
-- Indexes for table `post_mentions_group`
--
ALTER TABLE `post_mentions_group`
  ADD PRIMARY KEY (`post_id`,`mentions_group_id`),
  ADD KEY `post_mentions_group_mentions_group_id_foreign` (`mentions_group_id`);

--
-- Indexes for table `post_mentions_post`
--
ALTER TABLE `post_mentions_post`
  ADD PRIMARY KEY (`post_id`,`mentions_post_id`),
  ADD KEY `post_mentions_post_mentions_post_id_foreign` (`mentions_post_id`);

--
-- Indexes for table `post_mentions_tag`
--
ALTER TABLE `post_mentions_tag`
  ADD PRIMARY KEY (`post_id`,`mentions_tag_id`),
  ADD KEY `post_mentions_tag_mentions_tag_id_foreign` (`mentions_tag_id`);

--
-- Indexes for table `post_mentions_user`
--
ALTER TABLE `post_mentions_user`
  ADD PRIMARY KEY (`post_id`,`mentions_user_id`),
  ADD KEY `post_mentions_user_mentions_user_id_foreign` (`mentions_user_id`);

--
-- Indexes for table `post_user`
--
ALTER TABLE `post_user`
  ADD PRIMARY KEY (`post_id`,`user_id`),
  ADD KEY `post_user_user_id_foreign` (`user_id`);

--
-- Indexes for table `registration_tokens`
--
ALTER TABLE `registration_tokens`
  ADD PRIMARY KEY (`token`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tags_slug_unique` (`slug`),
  ADD KEY `tags_parent_id_foreign` (`parent_id`),
  ADD KEY `tags_last_posted_user_id_foreign` (`last_posted_user_id`),
  ADD KEY `tags_last_posted_discussion_id_foreign` (`last_posted_discussion_id`);

--
-- Indexes for table `tag_user`
--
ALTER TABLE `tag_user`
  ADD PRIMARY KEY (`user_id`,`tag_id`),
  ADD KEY `tag_user_tag_id_foreign` (`tag_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_joined_at_index` (`joined_at`),
  ADD KEY `users_last_seen_at_index` (`last_seen_at`),
  ADD KEY `users_discussion_count_index` (`discussion_count`),
  ADD KEY `users_comment_count_index` (`comment_count`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `access_tokens`
--
ALTER TABLE `access_tokens`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `api_keys`
--
ALTER TABLE `api_keys`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `discussions`
--
ALTER TABLE `discussions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `flags`
--
ALTER TABLE `flags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `login_providers`
--
ALTER TABLE `login_providers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=139;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Begrensninger for dumpede tabeller
--

--
-- Begrensninger for tabell `access_tokens`
--
ALTER TABLE `access_tokens`
  ADD CONSTRAINT `access_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Begrensninger for tabell `api_keys`
--
ALTER TABLE `api_keys`
  ADD CONSTRAINT `api_keys_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Begrensninger for tabell `discussions`
--
ALTER TABLE `discussions`
  ADD CONSTRAINT `discussions_first_post_id_foreign` FOREIGN KEY (`first_post_id`) REFERENCES `posts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `discussions_hidden_user_id_foreign` FOREIGN KEY (`hidden_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `discussions_last_post_id_foreign` FOREIGN KEY (`last_post_id`) REFERENCES `posts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `discussions_last_posted_user_id_foreign` FOREIGN KEY (`last_posted_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `discussions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Begrensninger for tabell `discussion_tag`
--
ALTER TABLE `discussion_tag`
  ADD CONSTRAINT `discussion_tag_discussion_id_foreign` FOREIGN KEY (`discussion_id`) REFERENCES `discussions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `discussion_tag_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE;

--
-- Begrensninger for tabell `discussion_user`
--
ALTER TABLE `discussion_user`
  ADD CONSTRAINT `discussion_user_discussion_id_foreign` FOREIGN KEY (`discussion_id`) REFERENCES `discussions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `discussion_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Begrensninger for tabell `email_tokens`
--
ALTER TABLE `email_tokens`
  ADD CONSTRAINT `email_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Begrensninger for tabell `flags`
--
ALTER TABLE `flags`
  ADD CONSTRAINT `flags_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `flags_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Begrensninger for tabell `group_permission`
--
ALTER TABLE `group_permission`
  ADD CONSTRAINT `group_permission_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE;

--
-- Begrensninger for tabell `group_user`
--
ALTER TABLE `group_user`
  ADD CONSTRAINT `group_user_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `group_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Begrensninger for tabell `login_providers`
--
ALTER TABLE `login_providers`
  ADD CONSTRAINT `login_providers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Begrensninger for tabell `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_from_user_id_foreign` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Begrensninger for tabell `password_tokens`
--
ALTER TABLE `password_tokens`
  ADD CONSTRAINT `password_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Begrensninger for tabell `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_discussion_id_foreign` FOREIGN KEY (`discussion_id`) REFERENCES `discussions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `posts_edited_user_id_foreign` FOREIGN KEY (`edited_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `posts_hidden_user_id_foreign` FOREIGN KEY (`hidden_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Begrensninger for tabell `post_likes`
--
ALTER TABLE `post_likes`
  ADD CONSTRAINT `post_likes_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `post_likes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Begrensninger for tabell `post_mentions_group`
--
ALTER TABLE `post_mentions_group`
  ADD CONSTRAINT `post_mentions_group_mentions_group_id_foreign` FOREIGN KEY (`mentions_group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `post_mentions_group_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE;

--
-- Begrensninger for tabell `post_mentions_post`
--
ALTER TABLE `post_mentions_post`
  ADD CONSTRAINT `post_mentions_post_mentions_post_id_foreign` FOREIGN KEY (`mentions_post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `post_mentions_post_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE;

--
-- Begrensninger for tabell `post_mentions_tag`
--
ALTER TABLE `post_mentions_tag`
  ADD CONSTRAINT `post_mentions_tag_mentions_tag_id_foreign` FOREIGN KEY (`mentions_tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `post_mentions_tag_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE;

--
-- Begrensninger for tabell `post_mentions_user`
--
ALTER TABLE `post_mentions_user`
  ADD CONSTRAINT `post_mentions_user_mentions_user_id_foreign` FOREIGN KEY (`mentions_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `post_mentions_user_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE;

--
-- Begrensninger for tabell `post_user`
--
ALTER TABLE `post_user`
  ADD CONSTRAINT `post_user_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `post_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Begrensninger for tabell `tags`
--
ALTER TABLE `tags`
  ADD CONSTRAINT `tags_last_posted_discussion_id_foreign` FOREIGN KEY (`last_posted_discussion_id`) REFERENCES `discussions` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `tags_last_posted_user_id_foreign` FOREIGN KEY (`last_posted_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `tags_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `tags` (`id`) ON DELETE SET NULL;

--
-- Begrensninger for tabell `tag_user`
--
ALTER TABLE `tag_user`
  ADD CONSTRAINT `tag_user_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tag_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dataark for tabell `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"greencode_db\",\"table\":\"users\"},{\"db\":\"greencode_db\",\"table\":\"post_user\"},{\"db\":\"greencode_db\",\"table\":\"post_mentions_user\"},{\"db\":\"greencode_db\",\"table\":\"post_mentions_tag\"},{\"db\":\"greencode_db\",\"table\":\"access_tokens\"},{\"db\":\"greencode_db\",\"table\":\"flags\"},{\"db\":\"greencode_db\",\"table\":\"email_tokens\"}]');

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dataark for tabell `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2025-03-04 14:20:03', '{\"Console\\/Mode\":\"collapse\",\"lang\":\"nb\"}');

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
