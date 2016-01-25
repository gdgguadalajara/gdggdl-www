<?php
/**
 * GDG Guadalajara
 *
 * @author GDG Guadalajara Dev Team
 * License: MIT
 */

$app->get('/', function() use ($app) {
    $app->render('index.html', [
        'events' => \GDGGuadalajara\Model\Event::all()
    ]);
})
    ->name('main');
