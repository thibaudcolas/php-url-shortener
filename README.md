# Simple PHP URL shortener

## TL;DR

This PHP URL shortener is a fork from [Mathias Bynen's shortener ](https://github.com/mathiasbynens/php-url-shortener) tinkered for my own needs and learning purpose.

DRY, minimal code with few features available using GET requests.

## Installation

1. Download the source code as located within this repository, and upload it to your web server.
2. Use `database.sql` to create the `redirect` table in a database of choice. The database user must have at least SELECT/INSERT/UPDATE rights.
3. Edit `config.php` and enter your database credentials.

## Features

* Redirect to tweets when given a long numerical slug, e.g. `http://ex.org/8065633451249664` → `http://twitter.com/mathias/status/8065633451249664`.
* Redirect to xkcd when given a short numerical slug, e.g. `http://ex.org/123` → `http://xkcd.com/123`.
* Redirect to a Twitter account when `@` is used as a slug, e.g. `http://ex.org/@` → `http://twitter.com/example`.
* Redirect to the main website when no slug is entered, e.g. `http://ex.org/` → `http://example.org/`.
* Redirect to a specific page on the main website when an unknown slug is used, e.g. `http://ex.org/demo/jquery` → `http://example.org/demo/jquery`.
* Uses user-defined custom slugs for special links, e.g. `http://ex.org/li` → `http://linkedin.com/your-account-link`.
* Ignores weird trailing characters in slugs, e.g. `http://ex.org/aaa)` → same as `http://ex.org/aaa`.
* Generates short, easy-to-type URLs using only `[a-z]` characters.
* Doesn’t create multiple short URLs when you try to shorten the same URL : the script will simply return the existing short URL.
* Counts every access to a link and allows users to retrieve link hits count.
* DRY, minimal code.
* Correct, semantic use of the available HTTP status codes.

## Future

* Add a way to retrieve the total number of hits.
* Add a way to monitor hits to @ and other special URLs.
* Add a way to retrieve the most hitted link(s).
* Add a way to set new custom slugs.
* Add a QR code API using Google API.
* Add a foaf link

## Original author

* [Mathias Bynens](http://mathiasbynens.be/)

## Original contributors

* [Peter Beverloo](http://peter.sh/)
* [Tomislav Biscan](https://github.com/B-Scan)

## Humble tinkerer

* [Thibaud Colas](https://github.com/thibaudcolas)
