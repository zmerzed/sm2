<?php

use Carbon\Carbon;

class Exercise
{

    public function __construct()
    {

    }

    public static function parts()
    {
        global $wpdb;
        $querystr = "SELECT * FROM workout_exercise_options_tbl";
        $parts = $wpdb->get_results($querystr, ARRAY_A);

        foreach($parts as $key => $part)
        {
            $parts[$key]['options'] = json_decode($part['options']);
        }

        return $parts;
    }

    public static function types()
    {
        $parts = self::parts();
        $types = [];

        foreach ($parts as $part)
        {

            if (isset($part['options']))
            {

                foreach ($part['options'] as $option)
                {
                    $type = [
                        'part'    => $part['part'],
                        'part_id' => $part['id'],
                        'type'    => $option->type,
                        'video'   => $option->video_link
                    ];

                    $types[] = $type;
                }
            }
        }

        return $types;
    }

    public static function find($id)
    {
    }
}