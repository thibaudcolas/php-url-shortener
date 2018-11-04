CREATE TABLE IF NOT EXISTS `redirect` (
  `slug` varchar(14) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(620) COLLATE utf8_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  `hits` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='URL shortener links';

-- Useful defaults.
INSERT INTO `redirect` (`slug`, `url`, `date`, `hits`) VALUES
('ratp', 'http://data.ratp.fr/', '2012-11-05 00:00:00', 3),
('gh', 'https://github.com/thibaudcolas', '2012-07-24 16:19:51', 114),
('tw', 'https://twitter.com/thibaud_colas', '2012-07-24 16:19:51', 45),
('li', 'https://fr.linkedin.com/in/thibaudcolas', '2012-07-24 16:19:51', 49),
('xkcd', 'https://xkcd.com', '2012-07-24 16:19:51', 3),
('smbc', 'http://www.smbc-comics.com', '2012-07-24 16:19:51', 1),
('a', 'https://xkcd.com', '2012-07-24 16:20:36', 6),
('love', 'https://xkcd.com/99', '2012-07-24 12:54:20', 140),
('b', 'http://www.deftones.com/main/', '2012-08-12 20:57:09', 7),
('pr', 'https://github.com/pulls?q=is%3Apr+author%3Athibaudcolas+is%3Apublic', '2012-01-06 00:00:00', 349),
('regex', 'https://xkcd.com/208', '2012-07-31 21:31:13', 1),
('foaf', 'https://thib.me/foaf.rdf', '2012-07-31 21:34:21', 3),
('connoisseur', 'https://xkcd.com/915', '2012-07-31 21:35:42', 1),
('stu', 'https://github.com/thibaudcolas/stringtouri', '2012-08-10 03:59:55', 143),
('ll', 'https://thibaudcolas.github.io/linked-lifted', '2012-08-10 03:59:55', 54),
('dl', 'https://www.w3.org/2001/sw/wiki/Datalift', '2012-08-10 03:59:55', 64),
('lisp', 'https://github.com/thibaudcolas/clisp-compiler-vm', '2012-08-10 03:59:55', 2),
('url', 'https://github.com/thibaudcolas/php-url-shortener', '2012-08-10 04:05:41', 58),
('cv', 'https://thib.me/resume', '2012-08-11 09:21:11', 716),
('cc', 'http://www.cornelius-communication.com', '2012-08-11 18:08:26', 131),
('lego', 'https://xkcd.com/659', '2012-08-11 00:00:00', 2),
('c', 'https://en.wikipedia.org/wiki/File:Cat_poster_2.jpg', '2012-12-01 09:45:31', 2),
('es6', 'https://thib.me/talks/es6-en-pratique/', '2011-01-06 00:00:00', 314),
('d4', 'https://github.com/thibaudcolas/d4', '2012-11-30 00:00:00', 107),
('c2c', 'https://thib.me/coast2coast-walk', '2012-08-11 18:08:26', 7),
('rr', 'http://www.youtube.com/embed/IAISUDbjXj0?autoplay=1', '2012-11-21 00:00:00', 7),
('zr', 'https://github.com/FlipFlopWeekly/zori', '2012-11-30 00:00:00', 2),
('sb', 'https://github.com/Froggies/Skimbo', '2012-11-30 00:00:00', 2),
('sv', 'https://github.com/LastMinuteMtp', '2012-11-30 00:00:00', 2);

INSERT INTO `redirect` VALUES ('a', 'https://xkcd.com', NOW(), 1);

ALTER TABLE `redirect`
  ADD PRIMARY KEY (`slug`);
