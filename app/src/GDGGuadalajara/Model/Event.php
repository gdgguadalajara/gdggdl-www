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
}
