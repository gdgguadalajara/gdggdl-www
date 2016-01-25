--
-- GDG Guadalajara Dev Team
-- http://gdgguadalajara.org
--
-- Database: `gdgguadalajara`
--

--
-- Table structure for table `posts`
--
CREATE TABLE IF NOT EXISTS `posts` (
  `id_post` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `brief_description` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `id_user` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id_post`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1;
-- -----------------------------------------------------------------------------

--
-- Table structure for table `comments`
--
CREATE TABLE IF NOT EXISTS `comments` (
  `id_comment` int(11) NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `author_name` varchar(255) NOT NULL,
  `author_email` varchar(255) NOT NULL,
  `id_post` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id_comment`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1;
-- -----------------------------------------------------------------------------

--
-- Table structure for table `tags`
--
CREATE TABLE IF NOT EXISTS `tags` (
  `id_tag` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `frequency` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_tag`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1;
-- -----------------------------------------------------------------------------

--
-- Table structure for table `posts_tags`
--
CREATE TABLE IF NOT EXISTS `posts_tags` (
  `id_tag` int(11) NOT NULL,
  `id_post` int(11) NOT NULL,
  PRIMARY KEY (`id_tag`, `id_post`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
-- -----------------------------------------------------------------------------

--
-- Table structure for table `events`
--
CREATE TABLE IF NOT EXISTS `events` (
  `id_event` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `brief_description` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `slug` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `location_lat` DECIMAL(10, 8) NOT NULL,
  `location_lng` DECIMAL(11, 8) NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `start_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `recurrences` int(2) DEFAULT NULL,
  `recurrence_type` enum('daily', 'weekly', 'biweekly', 'every_four_weeks') DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_event`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1;
-- -----------------------------------------------------------------------------

--
-- Table structure for table `users`
--
CREATE TABLE IF NOT EXISTS `users` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(60) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1;
-- -----------------------------------------------------------------------------

--
-- Table structure for table `logins`
--
CREATE TABLE IF NOT EXISTS `logins` (
  `id_login` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `device` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_login` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id_login`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--
ALTER TABLE `posts`
  ADD CONSTRAINT `uc_users_slug` UNIQUE (`slug`),
  ADD CONSTRAINT `fk_users_id_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE NO ACTION;

ALTER TABLE `comments`
  ADD CONSTRAINT `fk_posts_id_post` FOREIGN KEY (`id_post`) REFERENCES `posts` (`id_post`) ON DELETE CASCADE;

ALTER TABLE `tags`
  ADD CONSTRAINT `uc_tags_name` UNIQUE (`name`);

ALTER TABLE `posts_tags`
  ADD CONSTRAINT `fk_posts_tags_id_post` FOREIGN KEY (`id_post`) REFERENCES `posts` (`id_post`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_posts_tags_id_tag` FOREIGN KEY (`id_tag`) REFERENCES `tags` (`id_tag`) ON DELETE CASCADE;

ALTER TABLE `logins`
  ADD CONSTRAINT `fk_logins_id_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE NO ACTION;

ALTER TABLE `events`
  ADD CONSTRAINT `uc_events_slug` UNIQUE (`slug`);
