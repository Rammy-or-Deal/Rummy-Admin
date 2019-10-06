#
# TABLE STRUCTURE FOR: admin_groups
#

DROP TABLE IF EXISTS `admin_groups`;

CREATE TABLE `admin_groups` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

INSERT INTO `admin_groups` (`id`, `name`, `description`) VALUES ('1', 'webmaster', 'Webmaster');
INSERT INTO `admin_groups` (`id`, `name`, `description`) VALUES ('2', 'admin', 'Administrator');
INSERT INTO `admin_groups` (`id`, `name`, `description`) VALUES ('3', 'manager', 'Manager');
INSERT INTO `admin_groups` (`id`, `name`, `description`) VALUES ('4', 'staff', 'Staff');


#
# TABLE STRUCTURE FOR: admin_login_attempts
#

DROP TABLE IF EXISTS `admin_login_attempts`;

CREATE TABLE `admin_login_attempts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(15) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: admin_users
#

DROP TABLE IF EXISTS `admin_users`;

CREATE TABLE `admin_users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(15) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) unsigned DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) unsigned NOT NULL,
  `last_login` int(11) unsigned DEFAULT NULL,
  `active` tinyint(1) unsigned DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

INSERT INTO `admin_users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`) VALUES ('1', '127.0.0.1', 'webmaster', '$2y$08$iQEgtlf8vH1LRG7FY0/BQeSUl8ot3yVqaMJVHcd0Ps9ls14jE.JSq', NULL, NULL, NULL, NULL, NULL, 'SfQIgYSppBa/oVpyI21cy.', '1451900190', '1570353566', '1', 'Webmaster', '');
INSERT INTO `admin_users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`) VALUES ('2', '127.0.0.1', 'admin', '$2y$08$7Bkco6JXtC3Hu6g9ngLZDuHsFLvT7cyAxiz1FzxlX5vwccvRT7nKW', NULL, NULL, NULL, NULL, NULL, NULL, '1451900228', '1465489580', '1', 'Admin', '');
INSERT INTO `admin_users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`) VALUES ('3', '127.0.0.1', 'manager', '$2y$08$snzIJdFXvg/rSHe0SndIAuvZyjktkjUxBXkrrGdkPy1K6r5r/dMLa', NULL, NULL, NULL, NULL, NULL, NULL, '1451900430', '1465489585', '1', 'Manager', '');
INSERT INTO `admin_users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`) VALUES ('4', '127.0.0.1', 'staff', '$2y$08$NigAXjN23CRKllqe3KmjYuWXD5iSRPY812SijlhGeKfkrMKde9da6', NULL, NULL, NULL, NULL, NULL, NULL, '1451900439', '1465489590', '1', 'Staff', '');


#
# TABLE STRUCTURE FOR: admin_users_groups
#

DROP TABLE IF EXISTS `admin_users_groups`;

CREATE TABLE `admin_users_groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

INSERT INTO `admin_users_groups` (`id`, `user_id`, `group_id`) VALUES ('1', '1', '1');
INSERT INTO `admin_users_groups` (`id`, `user_id`, `group_id`) VALUES ('2', '2', '2');
INSERT INTO `admin_users_groups` (`id`, `user_id`, `group_id`) VALUES ('3', '3', '3');
INSERT INTO `admin_users_groups` (`id`, `user_id`, `group_id`) VALUES ('4', '4', '4');


#
# TABLE STRUCTURE FOR: api_access
#

DROP TABLE IF EXISTS `api_access`;

CREATE TABLE `api_access` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(40) NOT NULL DEFAULT '',
  `controller` varchar(50) NOT NULL DEFAULT '',
  `date_created` datetime DEFAULT NULL,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: api_keys
#

DROP TABLE IF EXISTS `api_keys`;

CREATE TABLE `api_keys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `key` varchar(40) NOT NULL,
  `level` int(2) NOT NULL,
  `ignore_limits` tinyint(1) NOT NULL DEFAULT '0',
  `is_private_key` tinyint(1) NOT NULL DEFAULT '0',
  `ip_addresses` text,
  `date_created` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `api_keys` (`id`, `user_id`, `key`, `level`, `ignore_limits`, `is_private_key`, `ip_addresses`, `date_created`) VALUES ('1', '0', 'anonymous', '1', '1', '0', NULL, '1463388382');


#
# TABLE STRUCTURE FOR: api_limits
#

DROP TABLE IF EXISTS `api_limits`;

CREATE TABLE `api_limits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uri` varchar(255) NOT NULL,
  `count` int(10) NOT NULL,
  `hour_started` int(11) NOT NULL,
  `api_key` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: api_logs
#

DROP TABLE IF EXISTS `api_logs`;

CREATE TABLE `api_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uri` varchar(255) NOT NULL,
  `method` varchar(6) NOT NULL,
  `params` text,
  `api_key` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `time` int(11) NOT NULL,
  `rtime` float DEFAULT NULL,
  `authorized` varchar(1) NOT NULL,
  `response_code` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: blog_categories
#

DROP TABLE IF EXISTS `blog_categories`;

CREATE TABLE `blog_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pos` int(11) NOT NULL DEFAULT '0',
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `blog_categories` (`id`, `pos`, `title`) VALUES ('1', '1', 'Category 1');
INSERT INTO `blog_categories` (`id`, `pos`, `title`) VALUES ('2', '2', 'Category 2');
INSERT INTO `blog_categories` (`id`, `pos`, `title`) VALUES ('3', '3', 'Category 3');


#
# TABLE STRUCTURE FOR: blog_posts
#

DROP TABLE IF EXISTS `blog_posts`;

CREATE TABLE `blog_posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL DEFAULT '1',
  `author_id` int(11) NOT NULL,
  `title` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `image_url` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `content_brief` text COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `publish_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('draft','active','hidden') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'draft',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `blog_posts` (`id`, `category_id`, `author_id`, `title`, `image_url`, `content_brief`, `content`, `publish_time`, `status`) VALUES ('1', '1', '2', 'Blog Post 1', 'dd680-chrome_2019-02-20_03-11-42.png', '<p>\n	Blog Post 1 Content Brief</p>\n', '<p>\n	Blog Post 1 Content</p>\n', '2015-09-26 00:00:00', 'active');


#
# TABLE STRUCTURE FOR: blog_posts_tags
#

DROP TABLE IF EXISTS `blog_posts_tags`;

CREATE TABLE `blog_posts_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `blog_posts_tags` (`id`, `post_id`, `tag_id`) VALUES ('1', '1', '2');
INSERT INTO `blog_posts_tags` (`id`, `post_id`, `tag_id`) VALUES ('2', '1', '1');
INSERT INTO `blog_posts_tags` (`id`, `post_id`, `tag_id`) VALUES ('3', '1', '3');


#
# TABLE STRUCTURE FOR: blog_tags
#

DROP TABLE IF EXISTS `blog_tags`;

CREATE TABLE `blog_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `blog_tags` (`id`, `title`) VALUES ('1', 'Tag 1');
INSERT INTO `blog_tags` (`id`, `title`) VALUES ('2', 'Tag 2');
INSERT INTO `blog_tags` (`id`, `title`) VALUES ('3', 'Tag 3');


#
# TABLE STRUCTURE FOR: cover_photos
#

DROP TABLE IF EXISTS `cover_photos`;

CREATE TABLE `cover_photos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pos` int(11) NOT NULL DEFAULT '0',
  `image_url` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('active','hidden') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'active',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `cover_photos` (`id`, `pos`, `image_url`, `status`) VALUES ('1', '2', '45296-2.jpg', 'active');
INSERT INTO `cover_photos` (`id`, `pos`, `image_url`, `status`) VALUES ('2', '1', '2934f-1.jpg', 'active');
INSERT INTO `cover_photos` (`id`, `pos`, `image_url`, `status`) VALUES ('3', '3', '3717d-3.jpg', 'active');


#
# TABLE STRUCTURE FOR: frame_items
#

DROP TABLE IF EXISTS `frame_items`;

CREATE TABLE `frame_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sysitem_id` int(11) DEFAULT NULL,
  `money_type` varchar(255) DEFAULT NULL,
  `price` int(10) DEFAULT NULL,
  `stats` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

#
# TABLE STRUCTURE FOR: friend_items
#

DROP TABLE IF EXISTS `friend_items`;

CREATE TABLE `friend_items` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `online_stats` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

#
# TABLE STRUCTURE FOR: gift_items
#

DROP TABLE IF EXISTS `gift_items`;

CREATE TABLE `gift_items` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sysitem_id` int(11) DEFAULT NULL,
  `money_type` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

#
# TABLE STRUCTURE FOR: groups
#

DROP TABLE IF EXISTS `groups`;

CREATE TABLE `groups` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `groups` (`id`, `name`, `description`) VALUES ('1', 'members', 'General User');


#
# TABLE STRUCTURE FOR: login_attempts
#

DROP TABLE IF EXISTS `login_attempts`;

CREATE TABLE `login_attempts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(15) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: login_day_items
#

DROP TABLE IF EXISTS `login_day_items`;

CREATE TABLE `login_day_items` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pic` varchar(255) DEFAULT NULL,
  `stats` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

#
# TABLE STRUCTURE FOR: request_items
#

DROP TABLE IF EXISTS `request_items`;

CREATE TABLE `request_items` (
  `id` int(11) NOT NULL,
  `friend_item_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

#
# TABLE STRUCTURE FOR: sys_exchange_items
#

DROP TABLE IF EXISTS `sys_exchange_items`;

CREATE TABLE `sys_exchange_items` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pic` varchar(255) DEFAULT NULL,
  `money_type` varchar(255) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

INSERT INTO `sys_exchange_items` (`id`, `pic`, `money_type`, `value`, `price`) VALUES ('1', 'shop_item_gold_1', 'leaf', '1000', '1');
INSERT INTO `sys_exchange_items` (`id`, `pic`, `money_type`, `value`, `price`) VALUES ('2', 'shop_item_gold_2', 'leaf', '2000', '2');
INSERT INTO `sys_exchange_items` (`id`, `pic`, `money_type`, `value`, `price`) VALUES ('3', 'shop_item_gold_3', 'leaf', '5000', '5');
INSERT INTO `sys_exchange_items` (`id`, `pic`, `money_type`, `value`, `price`) VALUES ('4', 'shop_item_gold_4', 'leaf', '10500', '10');
INSERT INTO `sys_exchange_items` (`id`, `pic`, `money_type`, `value`, `price`) VALUES ('5', 'shop_item_gold_5', 'leaf', '16000', '15');
INSERT INTO `sys_exchange_items` (`id`, `pic`, `money_type`, `value`, `price`) VALUES ('6', 'shop_item_gold_6', 'leaf', '21500', '20');
INSERT INTO `sys_exchange_items` (`id`, `pic`, `money_type`, `value`, `price`) VALUES ('7', 'shop_item_gold_7', 'leaf', '33000', '30');
INSERT INTO `sys_exchange_items` (`id`, `pic`, `money_type`, `value`, `price`) VALUES ('8', 'shop_item_gold_8', 'leaf', '55000', '50');
INSERT INTO `sys_exchange_items` (`id`, `pic`, `money_type`, `value`, `price`) VALUES ('9', 'shop_item_gold_9', 'leaf', '110000', '100');
INSERT INTO `sys_exchange_items` (`id`, `pic`, `money_type`, `value`, `price`) VALUES ('10', 'shop_item_gold_10', 'leaf', '170000', '150');
INSERT INTO `sys_exchange_items` (`id`, `pic`, `money_type`, `value`, `price`) VALUES ('11', 'shop_item_gold_11', 'leaf', '250000', '200');
INSERT INTO `sys_exchange_items` (`id`, `pic`, `money_type`, `value`, `price`) VALUES ('12', 'shop_item_gold_12', 'leaf', '700000', '500');


#
# TABLE STRUCTURE FOR: sys_items
#

DROP TABLE IF EXISTS `sys_items`;

CREATE TABLE `sys_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `pic` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

INSERT INTO `sys_items` (`id`, `name`, `pic`) VALUES ('1', 'gift_1', 'gift_1');
INSERT INTO `sys_items` (`id`, `name`, `pic`) VALUES ('2', 'gift_2', 'gift_2');
INSERT INTO `sys_items` (`id`, `name`, `pic`) VALUES ('3', 'gift_3', 'gift_3');
INSERT INTO `sys_items` (`id`, `name`, `pic`) VALUES ('4', 'gift_4', 'gift_4');
INSERT INTO `sys_items` (`id`, `name`, `pic`) VALUES ('5', 'gift_5', 'gift_5');
INSERT INTO `sys_items` (`id`, `name`, `pic`) VALUES ('6', 'gift_6', 'gift_6');
INSERT INTO `sys_items` (`id`, `name`, `pic`) VALUES ('7', 'gift_7', 'gift_7');
INSERT INTO `sys_items` (`id`, `name`, `pic`) VALUES ('8', 'gift_8', 'gift_8');
INSERT INTO `sys_items` (`id`, `name`, `pic`) VALUES ('9', 'gift_9', 'gift_9');
INSERT INTO `sys_items` (`id`, `name`, `pic`) VALUES ('10', 'gift_10', 'gift_10');
INSERT INTO `sys_items` (`id`, `name`, `pic`) VALUES ('11', 'gift_11', 'gift_11');
INSERT INTO `sys_items` (`id`, `name`, `pic`) VALUES ('12', 'gift_12', 'gift_12');
INSERT INTO `sys_items` (`id`, `name`, `pic`) VALUES ('13', 'Default', 'frame_default');
INSERT INTO `sys_items` (`id`, `name`, `pic`) VALUES ('14', 'Novice', 'frame_novice');
INSERT INTO `sys_items` (`id`, `name`, `pic`) VALUES ('15', 'Elite', 'frame_elite');
INSERT INTO `sys_items` (`id`, `name`, `pic`) VALUES ('16', 'Expert', 'frame_expert');
INSERT INTO `sys_items` (`id`, `name`, `pic`) VALUES ('17', 'Master', 'frame_master');
INSERT INTO `sys_items` (`id`, `name`, `pic`) VALUES ('18', 'Hero', 'frame_hero');
INSERT INTO `sys_items` (`id`, `name`, `pic`) VALUES ('19', 'King', 'frame_king');
INSERT INTO `sys_items` (`id`, `name`, `pic`) VALUES ('20', 'Legend', 'frame_legend');


#
# TABLE STRUCTURE FOR: sys_shop_items
#

DROP TABLE IF EXISTS `sys_shop_items`;

CREATE TABLE `sys_shop_items` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pic` varchar(255) DEFAULT NULL,
  `value` int(5) DEFAULT NULL,
  `price` float(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

INSERT INTO `sys_shop_items` (`id`, `pic`, `value`, `price`) VALUES ('0', NULL, NULL, NULL);
INSERT INTO `sys_shop_items` (`id`, `pic`, `value`, `price`) VALUES ('2', 'shop_item_gold_2', '35000', '2.99');
INSERT INTO `sys_shop_items` (`id`, `pic`, `value`, `price`) VALUES ('3', 'shop_item_gold_3', '80000', '5.99');
INSERT INTO `sys_shop_items` (`id`, `pic`, `value`, `price`) VALUES ('4', 'shop_item_gold_4', '125000', '8.99');
INSERT INTO `sys_shop_items` (`id`, `pic`, `value`, `price`) VALUES ('5', 'shop_item_gold_5', '240000', '14.99');
INSERT INTO `sys_shop_items` (`id`, `pic`, `value`, `price`) VALUES ('6', 'shop_item_gold_6', '400000', '23.99');
INSERT INTO `sys_shop_items` (`id`, `pic`, `value`, `price`) VALUES ('7', 'shop_item_gold_7', '720000', '38.99');
INSERT INTO `sys_shop_items` (`id`, `pic`, `value`, `price`) VALUES ('8', 'shop_item_gold_8', '1245000', '62.99');
INSERT INTO `sys_shop_items` (`id`, `pic`, `value`, `price`) VALUES ('9', 'shop_item_gold_9', '2205000', '101.99');
INSERT INTO `sys_shop_items` (`id`, `pic`, `value`, `price`) VALUES ('10', 'shop_item_gold_10', '3850000', '164.99');
INSERT INTO `sys_shop_items` (`id`, `pic`, `value`, `price`) VALUES ('11', 'shop_item_gold_11', '6775000', '266.99');
INSERT INTO `sys_shop_items` (`id`, `pic`, `value`, `price`) VALUES ('12', 'shop_item_gold_12', '12830000', '430.99');
INSERT INTO `sys_shop_items` (`id`, `pic`, `value`, `price`) VALUES ('13', 'shop_item_leaf_1', '10', '0.99');
INSERT INTO `sys_shop_items` (`id`, `pic`, `value`, `price`) VALUES ('14', 'shop_item_leaf_2', '35', '2.99');
INSERT INTO `sys_shop_items` (`id`, `pic`, `value`, `price`) VALUES ('15', 'shop_item_leaf_3', '80', '5.99');
INSERT INTO `sys_shop_items` (`id`, `pic`, `value`, `price`) VALUES ('16', 'shop_item_leaf_4', '125', '8.99');
INSERT INTO `sys_shop_items` (`id`, `pic`, `value`, `price`) VALUES ('17', 'shop_item_leaf_5', '240', '14.99');
INSERT INTO `sys_shop_items` (`id`, `pic`, `value`, `price`) VALUES ('18', 'shop_item_leaf_6', '400', '23.99');
INSERT INTO `sys_shop_items` (`id`, `pic`, `value`, `price`) VALUES ('19', 'shop_item_leaf_7', '720', '38.99');
INSERT INTO `sys_shop_items` (`id`, `pic`, `value`, `price`) VALUES ('20', 'shop_item_leaf_8', '1245', '62.99');
INSERT INTO `sys_shop_items` (`id`, `pic`, `value`, `price`) VALUES ('21', 'shop_item_leaf_9', '2205', '101.99');
INSERT INTO `sys_shop_items` (`id`, `pic`, `value`, `price`) VALUES ('22', 'shop_item_leaf_10', '3850', '164.99');
INSERT INTO `sys_shop_items` (`id`, `pic`, `value`, `price`) VALUES ('23', 'shop_item_leaf_11', '6775', '266.99');
INSERT INTO `sys_shop_items` (`id`, `pic`, `value`, `price`) VALUES ('24', 'shop_item_leaf_12', '12830', '430.99');


#
# TABLE STRUCTURE FOR: sys_skills
#

DROP TABLE IF EXISTS `sys_skills`;

CREATE TABLE `sys_skills` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `pic` varchar(255) DEFAULT NULL,
  `max` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

INSERT INTO `sys_skills` (`id`, `name`, `pic`, `max`) VALUES ('1', 'Novice', 'skill_mark_1', '5');
INSERT INTO `sys_skills` (`id`, `name`, `pic`, `max`) VALUES ('2', 'Elite', 'skill_mark_2', '1000');
INSERT INTO `sys_skills` (`id`, `name`, `pic`, `max`) VALUES ('3', 'Expert', 'skill_mark_3', '5000');
INSERT INTO `sys_skills` (`id`, `name`, `pic`, `max`) VALUES ('4', 'Master', 'skill_mark_4', '10000');
INSERT INTO `sys_skills` (`id`, `name`, `pic`, `max`) VALUES ('5', 'Hero', 'skill_mark_5', '50000');
INSERT INTO `sys_skills` (`id`, `name`, `pic`, `max`) VALUES ('6', 'King', 'skill_mark_6', '100000');


#
# TABLE STRUCTURE FOR: tier_infos
#

DROP TABLE IF EXISTS `tier_infos`;

CREATE TABLE `tier_infos` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `first` int(5) DEFAULT NULL,
  `second` int(5) DEFAULT NULL,
  `third` int(5) DEFAULT NULL,
  `last` int(5) DEFAULT NULL,
  `game` int(5) DEFAULT NULL,
  `ace` int(5) DEFAULT NULL,
  `joker` int(5) DEFAULT NULL,
  `min` int(5) DEFAULT NULL,
  `max` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

#
# TABLE STRUCTURE FOR: user_infos
#

DROP TABLE IF EXISTS `user_infos`;

CREATE TABLE `user_infos` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `pic` varchar(255) DEFAULT NULL,
  `frame_item_id` int(11) DEFAULT NULL,
  `win_rate` varchar(255) DEFAULT NULL,
  `coin_pic` varchar(255) DEFAULT NULL,
  `coin_value` int(5) DEFAULT NULL,
  `leaf_pic` varchar(255) DEFAULT NULL,
  `leaf_value` varchar(255) DEFAULT NULL,
  `sys_skill_id` int(11) DEFAULT NULL,
  `sys_skill_value` varchar(255) DEFAULT NULL,
  `sys_skill_level` varchar(255) DEFAULT NULL,
  `gift_item_id` int(11) DEFAULT NULL,
  `friend_item_id` int(11) DEFAULT NULL,
  `announce` varchar(255) DEFAULT NULL,
  `request_item_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

#
# TABLE STRUCTURE FOR: users
#

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(15) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) unsigned DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) unsigned NOT NULL,
  `last_login` int(11) unsigned DEFAULT NULL,
  `active` tinyint(1) unsigned DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`) VALUES ('1', '127.0.0.1', 'member', '$2y$08$kkqUE2hrqAJtg.pPnAhvL.1iE7LIujK5LZ61arONLpaBBWh/ek61G', NULL, 'member@member.com', NULL, NULL, NULL, NULL, '1451903855', '1451905011', '1', 'Member', 'One', NULL, NULL);
INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`) VALUES ('2', '192.168.1.154', 'ceo@lomago.de', '$2y$08$VViwRTEIAyz9gNLcNE/5yuRA/zyy5BiVx9IfC8Sr6jtEH27y.Op/G', NULL, 'ceo@lomago.de', NULL, NULL, NULL, NULL, '1564542209', NULL, '1', 'ddddd', 'ddddddd', NULL, NULL);
INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`) VALUES ('3', '192.168.1.154', 'akioUnity@gmail.com', '$2y$08$gn3jBJkxw.rVSCLBWnQptuyIEbXbsE4/3q1dZGTj.Dh5ZDq5y/Dk.', NULL, 'akioUnity@gmail.com', NULL, NULL, NULL, NULL, '1564542688', '1564542788', '1', 'akio', 'sensei', NULL, '1111111');


#
# TABLE STRUCTURE FOR: users_groups
#

DROP TABLE IF EXISTS `users_groups`;

CREATE TABLE `users_groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('1', '1', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('2', '2', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('3', '3', '1');


