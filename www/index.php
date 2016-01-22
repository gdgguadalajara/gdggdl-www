<?php
/**
 * GDG Guadalajara
 *
 * @author GDG Guadalajara Dev Team
 * License: MIT
 */

/**
 * Display errors (Sólo para desarrollo:)
 *
 * error_reporting(E_ALL);
 * ini_set('display_errors', 1);
 */
error_reporting(E_ALL);
ini_set('display_errors', 1);

/**
 * Default timezone
 */
date_default_timezone_set('America/Mexico_City');

/**
 * Defining some constants
 */
define("DS", DIRECTORY_SEPARATOR);
define("ROOT", realpath(dirname(__DIR__)) . DS);
define("VENDOR_DIR", ROOT . "vendor" . DS);
define("APP_DIR", ROOT . "/app" . DS);
define("ROUTE_DIR", APP_DIR . "routes" . DS);

define('APP_ENV', getenv('APP_ENV') ? getenv('APP_ENV') : 'production');

/**
 * Include autoload file
 */
require_once VENDOR_DIR . "autoload.php";

/**
 * Include config files
 */
$configPaths = sprintf('%s/config/{,*.}{global,%s,local}.php', APP_DIR, APP_ENV);
$config = Zend\Config\Factory::fromFiles(glob($configPaths, GLOB_BRACE));

/**
 * Create app
 */
$app = new Slim\Slim($config["slim"]);

$bootstrap = new GDGGuadalajara\Bootstrap($app, $config);
$app = $bootstrap->bootstrap();

/**
 * Include all helpers files
 */
foreach (glob(APP_DIR . 'helpers' . DS . '*.php') as $filename) {
  require_once $filename;
}

/**
 * Include all files located in routes directory
 */
foreach(glob(ROUTE_DIR . '*.routes.php') as $router) {
  require_once $router;
}

/**
 * Run the application
 */
$app->run();
