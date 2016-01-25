<?php
/**
 * GDG Guadalajara
 *
 * @author GDG Guadalajara Dev Team
 * License: MIT
 */

return [
    /**
     * Application
     */
    'app.id'      => 'gdggdl-www',
    'app.name'    => 'GDG Guadalajara',
    'app.version' => '1.0',
    'app.baseUrl' => 'http://gdgguadalajara.org',

    /**
     * Google Maps Api Key
     */
    'google.maps.apiKey' => 'AIzaSyAQd5t_L5hXCbRcIrGXrMSagMHXm4VqnVw',

    /**
     * Database
     */
    'db' => [
        'driver'    => 'mysql',
        'host'      => '127.0.0.1',
        'database'  => 'gdgguadalajara',
        'username'  => 'jn6h',
        'password'  => '********',
        'charset'   => "utf8",
        'collation' => 'utf8_general_ci',
        'prefix'    => ''
    ],

    /**
     * Slim configuration
     */
    'slim' => [
        'debug'          => true,
        'view'           => new \Slim\Views\Twig(),
        'templates.path' => APP_DIR . '/templates',
    ],

    /**
     * Logger
     */
    'logger.app.logfile' => ROOT . 'logs/app.log',
    'logger.app.level'   => \Monolog\Logger::DEBUG,

    /**
     * Twig template engine
     */
    'twig' => array(
        'environment' => array(
            'charset'          => 'utf-8',
            'cache'            => APP_DIR . 'templates/cache',
            'auto_reload'      => true,
            'strict_variables' => false,
            'autoescape'       => true,
            'debug'            => false,
        ),
    ),
];
