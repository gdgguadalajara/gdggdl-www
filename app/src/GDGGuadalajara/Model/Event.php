<?php namespace GDGGuadalajara\Model;
/**
 * GDG Guadalajara
 *
 * @author GDG Guadalajara Dev Team
 * License: MIT
 */

use Illuminate\Database\Eloquent\Model;

class Event extends Model {
    /**
    * The table associated with the model.
    *
    * @var string
    */
    protected $table = 'events';

    /**
    * The primary key for the model.
    *
    * @var string
    */
    protected $primaryKey = 'id_event';

    /**
     * Get event by slug
     *
     * @param $slug string
     * @return \GDGGuadalajara\Model\Event
     */
    public static function findBySlug($slug) {
        return Event::where('slug', '=', $slug)->first();
    }
}
