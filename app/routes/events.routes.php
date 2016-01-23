<?php
/**
 * GDG Guadalajara
 *
 * @author GDG Guadalajara Dev Team
 * License: MIT
 */

$app->get('/events/:event', function($eventSlug) use ($app) {
    $event = \GDGGuadalajara\Model\Event::findBySlug($eventSlug);
    $app->render('eventDetail.html', ['event' => $event]);
})
    ->name('event-detail')
    ->conditions([
      'event' => '[a-zA-Z0-9-_]{3,}'
    ]);
