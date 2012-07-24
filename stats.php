<?php
require 'config.php';

header('Content-Type: text/plain;charset=UTF-8');

if (isset($_GET['slug'])) {

	$slug = $_GET['slug'];

	// Those slugs aren't monitored.
	if ($slug == '@' || (is_numeric($slug) && strlen($slug) > 0)) {
		echo -1;
	} else {

		$db = new MySQLi(MYSQL_HOST, MYSQL_USER, MYSQL_PASSWORD, MYSQL_DATABASE);
		$db->set_charset('utf8');

		$escapedSlug = $db->real_escape_string($slug);
		$slugHits = $db->query('SELECT hits FROM redirect WHERE slug = "' . $escapedSlug . '"');

		// Retrieve hits for the given slug.
		if ($slugHits && $slugHits->num_rows > 0) {
			echo $slugHits->fetch_object()->hits;
		} else {
			echo -1;
		}

		$db->close();
	}
} else {
	echo -1;
}

?>