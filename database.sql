CREATE TABLE `redirect` (
	`slug` varchar(14) collate utf8_unicode_ci NOT NULL,
	`url` varchar(620) collate utf8_unicode_ci NOT NULL,
	`date` datetime NOT NULL,
	`hits` bigint(20) NOT NULL default '0',
	PRIMARY KEY (`slug`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='URL shortener links';

-- Useful defaults.
INSERT INTO `redirect` VALUES ('am', 'http://about.me/ThibWeb', NOW(), 1);
INSERT INTO `redirect` VALUES ('gh', 'https://github.com/ThibWeb', NOW(), 1);
INSERT INTO `redirect` VALUES ('tw', 'https://twitter.com/ThibWeb', NOW(), 1);
INSERT INTO `redirect` VALUES ('li', 'http://fr.linkedin.com/in/thibaudcolas', NOW(), 1);
INSERT INTO `redirect` VALUES ('about', 'https://github.com/thibweb/php-url-shortener', NOW(), 1);
INSERT INTO `redirect` VALUES ('xkcd', 'https://xkcd.com', NOW(), 1);
INSERT INTO `redirect` VALUES ('smbc', 'http://www.smbc-comics.com', NOW(), 1);
INSERT INTO `redirect` VALUES ('love', 'https://xkcd.com/99', NOW(), 1);

INSERT INTO `redirect` VALUES ('a', 'https://xkcd.com', NOW(), 1);