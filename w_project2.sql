-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 12, 2023 at 10:22 PM
-- Server version: 8.0.34-0ubuntu0.22.04.1
-- PHP Version: 8.1.2-1ubuntu2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `w_project2`
--

-- --------------------------------------------------------

--
-- Table structure for table `albums`
--

CREATE TABLE `albums` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `community_id` bigint UNSIGNED DEFAULT NULL,
  `album_type_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_primary` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `albums`
--

INSERT INTO `albums` (`id`, `name`, `user_id`, `community_id`, `album_type_id`, `created_at`, `updated_at`, `is_primary`) VALUES
(1, 'Основной', 1, NULL, 1, '2023-11-12 05:54:16', '2023-11-12 05:54:16', 1),
(2, 'Основной', 1, 1, 1, '2023-11-12 06:14:48', '2023-11-12 06:14:48', 1),
(3, 'Основной', 2, NULL, 1, '2023-11-12 06:18:21', '2023-11-12 06:18:21', 1),
(4, 'Основной', 3, NULL, 1, '2023-11-12 09:59:37', '2023-11-12 09:59:37', 1),
(5, 'Основной', 4, NULL, 1, '2023-11-12 10:05:23', '2023-11-12 10:05:23', 1),
(6, 'Основной', 5, NULL, 1, '2023-11-12 10:09:34', '2023-11-12 10:09:34', 1);

-- --------------------------------------------------------

--
-- Table structure for table `album_types`
--

CREATE TABLE `album_types` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `album_types`
--

INSERT INTO `album_types` (`id`, `name`, `description`) VALUES
(1, 'Публичный', 'Просматривать содержимое могут все пользователи.'),
(2, 'Приватный', 'Просматривать содержимое сможете только вы.');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `reply_to` bigint UNSIGNED DEFAULT NULL,
  `commentable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `commentable_id` bigint UNSIGNED NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `communities`
--

CREATE TABLE `communities` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `type_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `alias` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `communities`
--

INSERT INTO `communities` (`id`, `user_id`, `type_id`, `name`, `description`, `alias`, `created_at`, `updated_at`, `image`) VALUES
(1, 1, 1, 'В путь', 'Сообщество, в котором путешественники делятся своими историями и изображениями', 'traveltop', '2023-11-12 06:14:48', '2023-11-12 06:17:46', '75eKCXYAe2ZWFwoogyBSGK8P9niy22SoXF3h6IwM.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `community_editors`
--

CREATE TABLE `community_editors` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `community_id` bigint UNSIGNED NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `public` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `community_editors`
--

INSERT INTO `community_editors` (`id`, `user_id`, `community_id`, `role`, `description`, `public`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Создатель', NULL, 1, '2023-11-12 06:14:48', '2023-11-12 06:14:48');

-- --------------------------------------------------------

--
-- Table structure for table `community_types`
--

CREATE TABLE `community_types` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `community_types`
--

INSERT INTO `community_types` (`id`, `name`, `description`) VALUES
(1, 'Публичное', 'Просматривать записи могут все пользователи.'),
(2, 'Закрытое', 'Просматривать записи могут только участники сообщества (подписчики).');

-- --------------------------------------------------------

--
-- Table structure for table `friendships`
--

CREATE TABLE `friendships` (
  `id` bigint UNSIGNED NOT NULL,
  `sender_id` bigint UNSIGNED NOT NULL,
  `recipient_id` bigint UNSIGNED NOT NULL,
  `friendship_status_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `friendship_statuses`
--

CREATE TABLE `friendship_statuses` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `friendship_statuses`
--

INSERT INTO `friendship_statuses` (`id`, `name`) VALUES
(3, 'Отклонен'),
(1, 'Отправлен'),
(2, 'Принят');

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` bigint UNSIGNED NOT NULL,
  `album_id` bigint UNSIGNED DEFAULT NULL,
  `imageable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `imageable_id` bigint UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `album_id`, `imageable_type`, `imageable_id`, `image`, `alt`, `created_at`, `updated_at`) VALUES
(1, 1, 'App\\Models\\Post', 1, '8l5RQyMyRI0hXXXaWf4oT1a5KMOkII0KOwVLEL45.jpg', NULL, '2023-11-12 06:05:47', '2023-11-12 06:05:47'),
(2, 2, 'App\\Models\\Post', 3, 'QVg27LNWMhGJSKVSx0BMHiNFPzWYdjCrJu7Lp4FT.jpg', NULL, '2023-11-12 06:17:27', '2023-11-12 06:17:27'),
(3, 2, 'App\\Models\\Post', 3, 'B94SLheJdynGP7wdnahHeIx81SwlSLhN8ULRGJ6k.jpg', NULL, '2023-11-12 06:17:27', '2023-11-12 06:17:27'),
(4, 3, 'App\\Models\\Post', 4, 'CwabvhLzqvNh5NrYZUYLMIsnkvEnacgLnSkTSAbL.jpg', NULL, '2023-11-12 09:52:30', '2023-11-12 09:52:30'),
(5, 3, 'App\\Models\\Post', 5, 'PLQH4IU4wyBOCOkD6r19ge3bVaLZhUTghOfuEO1j.jpg', NULL, '2023-11-12 09:58:51', '2023-11-12 09:58:51'),
(6, 4, 'App\\Models\\Post', 6, 'Kv6XaqX3RFsLqUKnPrFvgPbqj58mxFYV5JkWja9l.jpg', NULL, '2023-11-12 10:04:06', '2023-11-12 10:04:06'),
(7, 4, 'App\\Models\\Post', 7, 'KkCEeH31zAHYrCFKLq2Htw0BclkSr73O4jaLXbAn.jpg', NULL, '2023-11-12 10:04:29', '2023-11-12 10:04:29'),
(8, 4, 'App\\Models\\Post', 8, 'NNNYA3pzntEzKXgyMfHZvdWmKdXAo5gCiIaNeHW3.jpg', NULL, '2023-11-12 10:04:44', '2023-11-12 10:04:44'),
(9, 5, 'App\\Models\\Post', 9, 'VnUmiUh3wqj5ZvxFxAo8x1zBWXXqzRnPumKk0zs4.jpg', NULL, '2023-11-12 10:08:27', '2023-11-12 10:08:27'),
(10, 6, 'App\\Models\\Post', 10, 'oNgzDfCtY8KCFcafJjHQ5VMwc5jQP4udU6Zn59QJ.jpg', NULL, '2023-11-12 10:12:57', '2023-11-12 10:12:57'),
(11, 6, 'App\\Models\\Post', 11, 'wbsAz39ogqJ3seHUlfaylemytrIn7PGkVpGJz7r8.jpg', NULL, '2023-11-12 10:14:03', '2023-11-12 10:14:03'),
(12, 6, 'App\\Models\\Post', 12, '3ThxzYeY77swzLybkyuXHyNmUFAfuEZoBzOS2jL6.jpg', NULL, '2023-11-12 10:15:25', '2023-11-12 10:15:25'),
(13, 6, 'App\\Models\\Post', 13, 'C0H6DwnHs4sHNKYo7ue5FJsBYAYwA9Nq2uAT3xfk.jpg', NULL, '2023-11-12 10:17:09', '2023-11-12 10:17:09'),
(14, 6, 'App\\Models\\Post', 14, '8SkJicyt0InQCvZcscsdFXaBjvODh2Ga9rFoEKjx.jpg', NULL, '2023-11-12 10:18:39', '2023-11-12 10:18:39'),
(15, 6, 'App\\Models\\Post', 15, 'A1VXOxrdQaENxzE0MMljNTpD27cIMSO3AxsmXdeS.jpg', NULL, '2023-11-12 10:22:17', '2023-11-12 10:22:17'),
(16, 2, 'App\\Models\\Post', 16, 'SMfhyNkes4ZFCKT0qJ0dmEfhfRYGpqT2CeAzaQgu.jpg', NULL, '2023-11-12 10:25:22', '2023-11-12 10:25:22');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(2, '2023_10_08_084126_create_users_table', 1),
(3, '2023_10_08_084652_create_friendship_statuses_table', 1),
(4, '2023_10_08_084725_create_reactions_table', 1),
(5, '2023_10_08_084750_create_community_types_table', 1),
(6, '2023_10_08_084819_create_album_types_table', 1),
(7, '2023_10_08_084858_create_communities_table', 1),
(8, '2023_10_08_084937_create_posts_table', 1),
(9, '2023_10_08_084955_create_community_editors_table', 1),
(10, '2023_10_08_085011_create_albums_table', 1),
(11, '2023_10_08_085044_create_friendships_table', 1),
(12, '2023_10_08_085145_create_images_table', 1),
(13, '2023_10_08_085200_create_comments_table', 1),
(14, '2023_10_08_085210_create_set_reactions_table', 1),
(15, '2023_10_25_112116_add_column_image_to_communities', 1),
(16, '2023_10_25_112126_add_info_columns_to_users', 1),
(17, '2023_10_25_191148_add_default_type_to_communities', 1),
(18, '2023_10_25_191158_add_default_type_to_albums', 1),
(19, '2023_10_25_191214_add_default_status_to_friendships', 1),
(20, '2023_11_07_164349_add_is_primary_to_albums', 1),
(21, '2023_11_11_133526_create_subscriptions_table', 1),
(22, '2023_11_11_195109_add_timestamps_to_set_reactions', 1),
(23, '2023_11_11_231908_add_timestamps_to_community_editors', 1);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(6, 'App\\Models\\User', 1, 'user', '90c4c6e5a6476e24136995d0fe1ced6e2cd6b6a2c82d0ca893591a7900cf9c14', '[\"*\"]', '2023-11-12 12:19:12', NULL, '2023-11-12 10:23:26', '2023-11-12 12:19:12');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `community_id` bigint UNSIGNED DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `community_id`, `content`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL, '2023-11-12 06:05:47', '2023-11-12 06:05:47'),
(2, 1, NULL, 'Зима круто?', '2023-11-12 06:10:26', '2023-11-12 06:10:26'),
(3, 1, 1, 'В саудовской аравии сегодня жарко!', '2023-11-12 06:17:27', '2023-11-12 06:17:27'),
(4, 2, NULL, 'Стокгольм впечатляет!', '2023-11-12 09:52:30', '2023-11-12 09:52:30'),
(5, 2, NULL, 'Меня в последнее время часто спрашивают: Что такое минимализм для тебя? поэтому отвечу тут.\r\nМинимализм — это в первую очередь жизненная философия. И ее нужно разделять, чтобы в лаконичном (а иногда даже аскетичном) интерьере вам было по-настоящему комфортно.', '2023-11-12 09:58:51', '2023-11-12 09:58:51'),
(6, 3, NULL, 'Кафе \"TimeStop\" , очень уютно!', '2023-11-12 10:04:06', '2023-11-12 10:04:06'),
(7, 3, NULL, 'Отдых на свежем воздухе)', '2023-11-12 10:04:29', '2023-11-12 10:04:29'),
(8, 3, NULL, NULL, '2023-11-12 10:04:44', '2023-11-12 10:04:44'),
(9, 4, NULL, 'Сезон закончился удачно ;)', '2023-11-12 10:08:27', '2023-11-12 10:08:27'),
(10, 5, NULL, 'Демон сидящий Михаила Врубеля.\r\n\r\nМихаил Врубель писал легко и непринужденно, он был человеком безграничного художественного таланта и немалых странностей. Подробнее о них можете прочитать в статье по ссылке.\r\n\r\nВ творчестве Врубель был новатором, театральный художник Сергей Судейкин впоследствии писал: «В 1906 году Дягилев привёз 700 картин и прочих произведений русского искусства на осенний художественный салон в Париже. Под картины и роспись Врубеля отвели целый зал и туда постоянно ходил низенький коренастый человек, который часами рассматривал его работы. Это был сам великий Пабло Пикассо. Именно от Врубеля пошло всё современное искусство, весь этот кубизм и супрематизм. Он был началом начал, другие художники просто подглядели и развили в своих полотнах его идеи».', '2023-11-12 10:12:57', '2023-11-12 10:12:57'),
(11, 5, NULL, 'Василий Пукирёв. Неравный брак.', '2023-11-12 10:14:03', '2023-11-12 10:14:03'),
(12, 5, NULL, 'Леонардо да Винчи. «Мона Лиза»\r\n\r\nНастоящую популярность она приобрела только в XX веке и вовсе не из-за легенды о блуждающем взгляде и полуулыбке, а благодаря краже в августе 1911 года. «Джоконду» похитил итальянский мастер по зеркалам Винченцо Перуджа, который сделал это из патриотических соображений. Он хотел возвратить картину на родину Леонардо, хотя мастер сам привез ее во Францию. В результате были закрыты границы, администрацию Лувра уволили, а под следствием оказались такие знаменитости, как поэт Гийом Аполлинер и художник Пабло Пикассо.\r\n\r\nДело получило огромный резонанс, и когда картину вернули, об этом сообщили все газеты, и о ней узнала вся планета. По сути, слава «Моны Лизы» возникла благодаря развитию прессы. «Мона Лиза» стала первым шедевром, который увидел весь мир: ее выставляли и в США, и в СССР. Таким образом, дама, чья личность до сих пор доподлинно неизвестна, стала первым глобализатором', '2023-11-12 10:15:25', '2023-11-12 10:15:25'),
(13, 5, NULL, 'Ван Гог. «Звездная ночь»\r\n\r\nЕсли внимательно понаблюдать за полотном, может создаться ощущение, что изображение движется. Ван Гон добивался этой иллюзии самыми разными способами: он мог выдавливать краску прямо на холст, писать пальцем или обратной стороной кисти. Благодаря большому количеству слоев появляется ощущение, что мазки передают не только цвет, но и структуру звездного неба.\r\n\r\nВан Гог говорил: «Я использую цвет произвольно, чтобы наиболее полно выразить себя».', '2023-11-12 10:17:09', '2023-11-12 10:17:09'),
(14, 5, NULL, 'Эдвард Мунк. «Крик»\r\n\r\nКстати, сам художник назвал свою работу «Крик природы». До конца не ясно: фигура на переднем плане то ли кричит, то ли затыкает уши, чтобы не слышать вопля, который яркими волнами расходится вокруг. В начале 2000-х годов появились предположения, что необычный закат был связан с выбросом пепла из вулкана Кракатау.\r\n\r\nСтранная работа норвежского живописца считается началом экспрессионизма. Картина ценна тем, что художник сумел спровоцировать страх у зрителя не трагичностью сюжета, а с помощью образа. По легенде, два человека сошли с ума. Один раз это случилось, когда полотно уронили, а второй — когда к нему прикоснулись.', '2023-11-12 10:18:39', '2023-11-12 10:18:39'),
(15, 5, NULL, 'Сальвадор Дали. «Постоянство памяти»\r\n\r\nВ ней выражена идея мягкого времени, которое, согласно теории Альберта Эйнштейна, относительно. Любопытно, что сам Сальвадор Дали объяснял происхождение сюжета «Постоянства памяти» размышлением о природе сыра камамбер. Его супруга Гала увидел картину, вернувшись из похода в кино. Она предсказала, что этот шедевр не забудет никто, увидев хотя бы один раз\r\n\r\nИ только попробуйте забыть!))', '2023-11-12 10:22:17', '2023-11-12 10:22:17'),
(16, 1, 1, 'Акташ, Алтай, Россия :)', '2023-11-12 10:25:22', '2023-11-12 10:25:22');

-- --------------------------------------------------------

--
-- Table structure for table `reactions`
--

CREATE TABLE `reactions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reactions`
--

INSERT INTO `reactions` (`id`, `name`, `url`) VALUES
(1, 'Сердце', 'http://localhost:8000/storage/assets/images/icons/reactions/hearth.png'),
(2, 'Палец вверх', 'http://localhost:8000/storage/assets/images/icons/reactions/thumb_up.png'),
(3, 'Палец вниз', 'http://localhost:8000/storage/assets/images/icons/reactions/thumb_down.png'),
(4, 'Смех', 'http://localhost:8000/storage/assets/images/icons/reactions/rofl.png'),
(5, 'Удивление', 'http://localhost:8000/storage/assets/images/icons/reactions/wow.png');

-- --------------------------------------------------------

--
-- Table structure for table `set_reactions`
--

CREATE TABLE `set_reactions` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `reaction_id` bigint UNSIGNED NOT NULL,
  `reactionable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reactionable_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `set_reactions`
--

INSERT INTO `set_reactions` (`id`, `user_id`, `reaction_id`, `reactionable_type`, `reactionable_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'App\\Models\\Post', 1, '2023-11-12 06:10:06', '2023-11-12 06:10:06'),
(2, 1, 4, 'App\\Models\\Post', 2, '2023-11-12 06:10:28', '2023-11-12 06:10:28'),
(3, 1, 1, 'App\\Models\\Post', 3, '2023-11-12 06:17:34', '2023-11-12 06:17:34'),
(4, 2, 1, 'App\\Models\\Post', 3, '2023-11-12 09:59:03', '2023-11-12 09:59:03'),
(5, 4, 1, 'App\\Models\\Post', 3, '2023-11-12 10:08:38', '2023-11-12 10:08:38');

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` bigint UNSIGNED NOT NULL,
  `community_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscriptions`
--

INSERT INTO `subscriptions` (`id`, `community_id`, `user_id`, `message`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL, NULL),
(2, 1, 4, NULL, NULL, NULL),
(3, 1, 5, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `login` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `api_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_active_time` timestamp NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `job` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `education` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthdate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `surname`, `login`, `password`, `api_token`, `last_active_time`, `created_at`, `updated_at`, `image`, `status`, `job`, `education`, `country`, `city`, `birthdate`) VALUES
(1, 'Левон', 'Акопян', 'levon', '$2y$10$sEewd8g12CZHBipaOx2OY.RdFU9TM128iI1rRnqq6L6HBx5dbpCfi', '6|ifnpqSWj3niusL0I7O1Q7A0AF01LFm2EyHvbvHmy388b54d4', '2023-11-12 05:54:16', '2023-11-12 05:54:16', '2023-11-12 10:23:26', 'PsWDPLUC0aRhbiqNPuj5i77YBMdqjxw0LNy6Z4X6.jpg', ':)', NULL, 'Среднее', 'Россия', NULL, NULL),
(2, 'Василий', 'Петров', 'vasya', '$2y$10$1vnyoDmLskf7JwIEteLbYuhCQdMBYKpX3J6mb8i2BN.UneIkPbkle', NULL, '2023-11-12 06:18:21', '2023-11-12 06:18:21', '2023-11-12 09:59:06', 'UyfOTfdrVQT7VIV8wz9o7lVrWOgAdYnlAUTfQFJB.jpg', 'Всё возможно', 'Дизайнер', 'Высшее', 'Россия', 'Москва', NULL),
(3, 'Мария', 'Иванова', 'maria', '$2y$10$Odg03HlV2EQTKTlY3./Wu.08zj1rjHZQbYZZg.cWpwKy3jtp.3z2S', NULL, '2023-11-12 09:59:37', '2023-11-12 09:59:37', '2023-11-12 10:04:50', '1DGQaT9m4uJJ9roj0dDX4cdrCDigmcal3GO5kRMH.jpg', 'Мечтать не вредно!', 'Учитель', 'Высшее', 'Россия', 'Пермь', '1999-11-03'),
(4, 'Константин', 'Романов', 'konstantin', '$2y$10$/ndIjsvQPFHmspcBL5tJBOYkGmR81H5sxBwZaSOdS5qSGEKfq3D.u', NULL, '2023-11-12 10:05:23', '2023-11-12 10:05:23', '2023-11-12 10:09:00', 's5z6weHO0EKDa6nBXXmHyHFZC52CXx3lV0uJl2qf.jpg', 'Если ты не любишь море - нам не по пути)', 'Тренер по серфингу', 'Нет', 'Испания', 'Барселона', NULL),
(5, 'Евгения', 'Карпова', 'eve', '$2y$10$XZXhZA4AS.Jlsp9y4qHFVuaJZqU6EHQyQd7VMQDRpJXxdsbZ5mEN6', NULL, '2023-11-12 10:09:34', '2023-11-12 10:09:34', '2023-11-12 10:23:20', 'Ri0itngwOfDAOUQdfZpcZODFH9Z03hd4j92YzI3n.jpg', 'Творить - прекрасно', 'Журналист', NULL, NULL, NULL, '2002-09-29');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `albums`
--
ALTER TABLE `albums`
  ADD PRIMARY KEY (`id`),
  ADD KEY `albums_user_id_foreign` (`user_id`),
  ADD KEY `albums_community_id_foreign` (`community_id`),
  ADD KEY `albums_album_type_id_foreign` (`album_type_id`);

--
-- Indexes for table `album_types`
--
ALTER TABLE `album_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `album_types_name_unique` (`name`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_user_id_foreign` (`user_id`),
  ADD KEY `comments_commentable_type_commentable_id_index` (`commentable_type`,`commentable_id`),
  ADD KEY `comments_reply_to_index` (`reply_to`);

--
-- Indexes for table `communities`
--
ALTER TABLE `communities`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `communities_alias_unique` (`alias`),
  ADD KEY `communities_user_id_foreign` (`user_id`),
  ADD KEY `communities_type_id_foreign` (`type_id`);

--
-- Indexes for table `community_editors`
--
ALTER TABLE `community_editors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `community_editors_user_id_foreign` (`user_id`),
  ADD KEY `community_editors_community_id_foreign` (`community_id`);

--
-- Indexes for table `community_types`
--
ALTER TABLE `community_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `friendships`
--
ALTER TABLE `friendships`
  ADD PRIMARY KEY (`id`),
  ADD KEY `friendships_sender_id_foreign` (`sender_id`),
  ADD KEY `friendships_recipient_id_foreign` (`recipient_id`),
  ADD KEY `friendships_friendship_status_id_foreign` (`friendship_status_id`);

--
-- Indexes for table `friendship_statuses`
--
ALTER TABLE `friendship_statuses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `friendship_statuses_name_unique` (`name`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `images_album_id_foreign` (`album_id`),
  ADD KEY `images_imageable_type_imageable_id_index` (`imageable_type`,`imageable_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_user_id_foreign` (`user_id`),
  ADD KEY `posts_community_id_foreign` (`community_id`);

--
-- Indexes for table `reactions`
--
ALTER TABLE `reactions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `reactions_name_unique` (`name`);

--
-- Indexes for table `set_reactions`
--
ALTER TABLE `set_reactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `set_reactions_user_id_foreign` (`user_id`),
  ADD KEY `set_reactions_reaction_id_foreign` (`reaction_id`),
  ADD KEY `set_reactions_reactionable_type_reactionable_id_index` (`reactionable_type`,`reactionable_id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subscriptions_community_id_foreign` (`community_id`),
  ADD KEY `subscriptions_user_id_foreign` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_login_unique` (`login`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `albums`
--
ALTER TABLE `albums`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `album_types`
--
ALTER TABLE `album_types`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `communities`
--
ALTER TABLE `communities`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `community_editors`
--
ALTER TABLE `community_editors`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `community_types`
--
ALTER TABLE `community_types`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `friendships`
--
ALTER TABLE `friendships`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `friendship_statuses`
--
ALTER TABLE `friendship_statuses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `reactions`
--
ALTER TABLE `reactions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `set_reactions`
--
ALTER TABLE `set_reactions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `albums`
--
ALTER TABLE `albums`
  ADD CONSTRAINT `albums_album_type_id_foreign` FOREIGN KEY (`album_type_id`) REFERENCES `album_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `albums_community_id_foreign` FOREIGN KEY (`community_id`) REFERENCES `communities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `albums_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_reply_to_foreign` FOREIGN KEY (`reply_to`) REFERENCES `comments` (`id`),
  ADD CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `communities`
--
ALTER TABLE `communities`
  ADD CONSTRAINT `communities_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `community_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `communities_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `community_editors`
--
ALTER TABLE `community_editors`
  ADD CONSTRAINT `community_editors_community_id_foreign` FOREIGN KEY (`community_id`) REFERENCES `communities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `community_editors_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `friendships`
--
ALTER TABLE `friendships`
  ADD CONSTRAINT `friendships_friendship_status_id_foreign` FOREIGN KEY (`friendship_status_id`) REFERENCES `friendship_statuses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `friendships_recipient_id_foreign` FOREIGN KEY (`recipient_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `friendships_sender_id_foreign` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `images_album_id_foreign` FOREIGN KEY (`album_id`) REFERENCES `albums` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_community_id_foreign` FOREIGN KEY (`community_id`) REFERENCES `communities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `set_reactions`
--
ALTER TABLE `set_reactions`
  ADD CONSTRAINT `set_reactions_reaction_id_foreign` FOREIGN KEY (`reaction_id`) REFERENCES `reactions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `set_reactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD CONSTRAINT `subscriptions_community_id_foreign` FOREIGN KEY (`community_id`) REFERENCES `communities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `subscriptions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
