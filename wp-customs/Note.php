<?php

use Carbon\Carbon;

class Note
{

    public function __construct()
    {

    }

    /* every program has 1 note attached */

    public static function program($workoutId)
    {
        global $wpdb;

        $notes = $wpdb->get_results( "SELECT * FROM workout_notes WHERE user_id={$workoutId} ORDER BY id desc", ARRAY_A);

        if ($notes) {
            return $notes[0];
        }

        return [];
    }

	public static function create()
    {

    }

}