<?php
/**
 * PHP URL Shortener with some custom slugs.
 * Twitter slug: automatic link to tweets, @ to account.
 * xkcd slug: automatic link to xkcd webcomic (just for fun).
 *
 * Source code from https://github.com/mathiasbynens/php-url-shortener.
 * Tinkered by https://github.com/ThibWeb/php-url-shortener.
 */

if (isset($_GET['slug'])) {
    require 'config.php';

    $url = DEFAULT_URL . '/';
    $slug = $_GET['slug'];

    if ($slug == '@') {
        $url = 'https://twitter.com/' . TWITTER_USERNAME;
    } else {
        // Once @ is checked, all special chars are removed.
        $slug = preg_replace('/[^a-z0-9]/si', '', $slug);

        // Less than eight : Slug is xkcd, greater : Tweet.
        if (is_numeric($slug) && strlen($slug) > 0) {
            if (strlen($slug) < 5) {
                $url = 'https://xkcd.com/' . $slug;
            }
            else if (strlen($slug) > 8) {
                $url = 'https://twitter.com/' . TWITTER_USERNAME . '/status/' . $slug;
            }
            else {
                $url = DEFAULT_URL;
            }
        } else {

            $db = new MySQLi(MYSQL_HOST, MYSQL_USER, MYSQL_PASSWORD, MYSQL_DATABASE);
            $db->set_charset('utf8');

            $escapedSlug = $db->real_escape_string($slug);
            $redirectResult = $db->query('SELECT url FROM redirect WHERE slug = "' . $escapedSlug . '"');

            if ($redirectResult && $redirectResult->num_rows > 0) {
                $db->query('UPDATE redirect SET hits = hits + 1 WHERE slug = "' . $escapedSlug . '"');
                $url = $redirectResult->fetch_object()->url;
            } else {
                $url = DEFAULT_URL . $_SERVER['REQUEST_URI'];
            }

            $db->close();
        }
    }
    header('Location: ' . $url, NULL, 301);
}
else {
    require 'index.html';
}
