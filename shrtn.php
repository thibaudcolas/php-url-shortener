<?php
require 'config.php';

header('Content-Type: text/plain;charset=UTF-8');

// Special slugs already attributed on setup.
$reservedSlugs = array("am", "gh", "tw", "li", "xkcd", "smbc", "love");

$url = isset($_GET['url']) ? urldecode(trim($_GET['url'])) : '';

// Error cases.
if (in_array($url, array('', 'about:blank', 'undefined', 'http://localhost/'))) {
	die('Enter a URL.');
}

function nextLetter(&$str) {
	$str = ('z' === $str ? 'a' : ++$str);
}

function getNextShortURL($s) {
	$a = str_split($s);
	$c = count($a);
	if (preg_match('/^z*$/', $s)) { // string consists entirely of `z`
		return str_repeat('a', $c + 1);
	}
	while ('z' === $a[--$c]) {
		nextLetter($a[$c]);
	}
	nextLetter($a[$c]);
	return implode($a);
}

$db = new mysqli(MYSQL_HOST, MYSQL_USER, MYSQL_PASSWORD, MYSQL_DATABASE);
$db->set_charset('utf8');

$url = $db->real_escape_string($url);

$result = $db->query('SELECT slug FROM redirect WHERE url = "' . $url . '" LIMIT 1');
// If there’s already a short URL for this URL.
if ($result && $result->num_rows > 0) { 
	die(SHORT_URL . $result->fetch_object()->slug);
} else {
	// Get the last generated slug.
	$result = $db->query('SELECT slug FROM redirect ORDER BY date DESC, slug DESC LIMIT 1');
	if ($result && $result->num_rows > 0) {
		$slug = getNextShortURL($result->fetch_object()->slug);
		// If the generated slug is already taken.
		if (in_array($slug,$reservedSlugs)) {
			$slug = getNextShortURL($slug);
		}
		if ($db->query('INSERT INTO redirect (slug, url, date, hits) VALUES ("' . $slug . '", "' . $url . '", NOW(), 0)')) {
			header('HTTP/1.1 201 Created');
			echo SHORT_URL . $slug;
			$db->query('OPTIMIZE TABLE `redirect`');
		}
	}
}

?>