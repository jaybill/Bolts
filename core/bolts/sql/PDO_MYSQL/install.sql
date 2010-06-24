
CREATE TABLE `bolts_cache_tags` (
	`id` bigint(20) NOT NULL auto_increment,
	`tag` varchar(50) NOT NULL,
	`created_on` datetime NOT NULL,
	PRIMARY KEY  (`id`, `tag`)
);

CREATE TABLE `bolts_caches` (
	`id` bigint(20) NOT NULL auto_increment,
	`name` varchar(255) NOT NULL,
	`data` text NOT NULL,
	`created_on` datetime NOT NULL,
	PRIMARY KEY  (`id`),
	UNIQUE KEY `name` (`name`)
);

CREATE TABLE `bolts_caches_tags` (
	`cache_id` bigint(20) NOT NULL,
	`tag_id` bigint(20) NOT NULL,
	`created_on` datetime NOT NULL,
	PRIMARY KEY (`cache_id`, `tag_id`)
);

CREATE TABLE `bolts_config` (
	`ckey` varchar(64) NOT NULL,
	`module` varchar(64) NOT NULL default 'bolts',
	`is_cached` tinyint(4) NOT NULL default '0',
	`value` text,
	PRIMARY KEY  (`ckey`,`module`)
);

CREATE TABLE `bolts_countries` (
	`country_code` varchar(5) NOT NULL,
	`continent` varchar(2) NOT NULL,
	`country` text NOT NULL,
	`sortorder` int(11) NOT NULL default '10',
	PRIMARY KEY  (`country_code`)
);

CREATE TABLE `bolts_database_versions` (
	`id` varchar(255) NOT NULL,
	`db_version` int(11) NOT NULL default '0',
	`updated_on` datetime NOT NULL,
	PRIMARY KEY  (`id`)
);

CREATE TABLE `bolts_locales` (
	`country_code` varchar(6) character set utf8 NOT NULL,
	`language_code` varchar(2) NOT NULL,
	`pseudo_country_code` varchar(6) default NULL,
	`pseudo_language_code` varchar(2) default NULL,
	`region_name` text NOT NULL,
	`country_name` text NOT NULL,
	`language_name` text NOT NULL,
	`created_on` datetime NOT NULL,
	`last_modified_on` datetime NOT NULL,
	PRIMARY KEY  (`country_code`,`language_code`)
);

CREATE TABLE `bolts_modules` (
	`id` varchar(255) NOT NULL,
	`is_enabled` tinyint(4) NOT NULL default '0',
	PRIMARY KEY  (`id`)
);

CREATE TABLE `bolts_navigation` (
	`id` int(11) NOT NULL auto_increment,
	`parent_id` int(11) NOT NULL default '0',
	`role_id` int(11) NOT NULL,
	`module` text,
	`group` text,
	`short_name` text NOT NULL,
	`link_text` text,
	`url` text,
	`sort_order` int(11) NOT NULL default '0',
	PRIMARY KEY  (`id`)
);

CREATE TABLE `bolts_roles` (
	`id` int(11) NOT NULL auto_increment,
	`shortname` varchar(64) NOT NULL default 'empty',
	`description` text,
	`isadmin` tinyint(4) NOT NULL default '0',
	`isguest` tinyint(4) NOT NULL default '0',
	`isdefault` tinyint(4) NOT NULL default '0',
	PRIMARY KEY  (`id`),
	UNIQUE KEY `uc_shortname` (`shortname`)
);

CREATE TABLE `bolts_roles_resources` (
	`role_id` int(11) NOT NULL,
	`module` varchar(64) NOT NULL default '',
	`controller` varchar(64) NOT NULL default '',
	`action` varchar(64) NOT NULL default '',
	PRIMARY KEY  (`role_id`,`module`,`controller`,`action`)
);

CREATE TABLE `bolts_roles_resources_extra` (
	`role_id` int(11) NOT NULL,
	`module` varchar(64) NOT NULL,
	`resource` varchar(256) NOT NULL,
	PRIMARY KEY  (`role_id`,`module`,`resource`)
);

CREATE TABLE `bolts_roles_roles` (
	`role_id` int(11) NOT NULL,
	`inherits_role_id` int(11) NOT NULL,
	PRIMARY KEY  (`role_id`,`inherits_role_id`)
);

CREATE TABLE `bolts_sessions` (
	`id` varchar(32) NOT NULL,
	`expiration` int(11) NOT NULL,
	`value` text,
	PRIMARY KEY  (`id`)
);

CREATE TABLE `bolts_users` (
	`username` varchar(50) NOT NULL default '',
	`password` varchar(50) default NULL,
	`full_name` varchar(100) default NULL,
	`gender` enum('male','female','unspecified') NOT NULL default 'unspecified',
	`email` varchar(255) default NULL,
	`created_on` datetime NOT NULL,
	`last_login_on` datetime default NULL,
	`last_modified_on` datetime default NULL,
	`last_activity_on` datetime default NULL,
	`birthday` date default NULL,
	`ip` varchar(64) default NULL,
	`country_code` varchar(5) default NULL,
	`aboutme` text,
	`metadata` text,
	`tags` text,
	PRIMARY KEY  (`username`),
	UNIQUE KEY `email` (`email`)
);

CREATE TABLE `bolts_users_roles` (
	`username` varchar(64) NOT NULL,
	`role_id` int(11) NOT NULL,
	`last_modified_on` datetime default NULL,
	PRIMARY KEY  (`username`,`role_id`)
);

CREATE OR REPLACE VIEW `bolts_vw_users_index` AS
select
	`bolts_users`.`username` AS `username`,
	`bolts_users`.`password` AS `password`,
	`bolts_users`.`full_name` AS `full_name`,
	`bolts_users`.`gender` AS `gender`,
	`bolts_users`.`email` AS `email`,
	`bolts_users`.`created_on` AS `created_on`,
	`bolts_users`.`tags` AS `tags`,
	`bolts_users`.`last_login_on` AS `last_login_on`,
	`bolts_users`.`last_modified_on` AS `last_modified_on`,
	`bolts_users`.`birthday` AS `birthday`,
	`bolts_users`.`ip` AS `ip`,
	`bolts_users`.`country_code` AS `country_code`,
	(select `bolts_countries`.`continent` AS `continent` from `bolts_countries` where (`bolts_countries`.`country_code` = `bolts_users`.`country_code`)) AS `region`,
	`bolts_users`.`aboutme` AS `aboutme`,
	dayofyear(`bolts_users`.`birthday`) AS `birthday_day`,
	floor(((unix_timestamp(curdate()) - unix_timestamp(`bolts_users`.`birthday`)) / 31556926)) AS `age`
from `bolts_users`;



INSERT INTO `bolts_locales`
	(`country_code`, `language_code`, `pseudo_country_code`, `pseudo_language_code`, `region_name`, `country_name`, `language_name`, `created_on`, `last_modified_on`)
VALUES
	('US', 'en', NULL , NULL , 'North America', 'United States of America', 'English', NOW(), NOW());

INSERT INTO `bolts_database_versions`
	(`id`, `db_version`, `updated_on`)
VALUES
	('default', 0, NOW());

INSERT INTO `bolts_roles`
	(`id`, `shortname`, `description`, `isadmin`, `isguest`, `isdefault`)
VALUES
	(1, 'guest', 'Minimal Access', 0, 1, 0),
	(2, 'member', 'Standard Access', 0, 0, 1),
	(3, 'admin', 'All Access', 1, 0, 0);

INSERT INTO `bolts_roles_roles`
	(`role_id`, `inherits_role_id`)
VALUES
	(2, 1),
	(3, 2);

INSERT INTO `bolts_roles_resources`
	(`role_id`, `module`, `controller`, `action`)
VALUES
	(1, 'bolts', 'Auth', 'denied'),
	(1, 'bolts', 'Auth', 'error'),
	(1, 'bolts', 'Auth', 'login'),
	(1, 'bolts', 'Auth', 'missing'),
	(1, 'bolts', 'Index', 'index'),
	(1, 'bolts', 'Install', 'secondstage'),
	(1, 'bolts', 'User', 'forgotpassword'),
	(1, 'bolts', 'User', 'index'),
	(1, 'bolts', 'User', 'profile'),
	(1, 'bolts', 'User', 'register'),
	(1, 'bolts', 'User', 'resetpassword'),
	(2, 'bolts', 'Auth', 'loginredirect'),
	(2, 'bolts', 'Auth', 'logout'),
	(2, 'bolts', 'User', 'cancel'),
	(2, 'bolts', 'User', 'edit'),
	(2, 'bolts', 'User', 'loginbounce'),
	(2, 'bolts', 'User', 'postregister'),
	(3, 'bolts', 'Admin', 'index'),
	(3, 'bolts', 'Config', 'index'),
	(3, 'bolts', 'Install', 'finished'),
	(3, 'bolts', 'Module', 'index'),
	(3, 'bolts', 'Module', 'plugin'),
	(3, 'bolts', 'Module', 'uninstall'),
	(3, 'bolts', 'Resource', 'edit'),
	(3, 'bolts', 'Role', 'delete'),
	(3, 'bolts', 'Role', 'edit'),
	(3, 'bolts', 'Role', 'index'),
	(3, 'bolts', 'User', 'deleteavatar'),
	(3, 'bolts', 'Useradmin', 'delete'),
	(3, 'bolts', 'Useradmin', 'edit'),
	(3, 'bolts', 'Useradmin', 'index'),
	(3, 'bolts', 'Useradmin', 'testdata');

INSERT INTO `bolts_users`
	(`username`, `password`, `full_name`, `gender`, `email`, `created_on`, `last_login_on`, `last_modified_on`, `last_activity_on`, `birthday`, `ip`, `country_code`, `aboutme`, `metadata`, `tags`)
VALUES
	('@@@@ADMIN_USERNAME@@@@', NULL, 'Administrator', 'unspecified', '@@@@ADMIN_EMAIL@@@@', '@@@@CREATED_ON@@@@@', NULL, NULL, NULL, '1976-05-03', '127.0.0.1', NULL, NULL, NULL, NULL);

INSERT INTO `bolts_users_roles`
	(`username`, `role_id`, `last_modified_on`)
VALUES
	('@@@@ADMIN_USERNAME@@@@', 3, NOW());
