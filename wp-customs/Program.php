<?php

use Carbon\Carbon;

class Program
{

    public function __construct()
    {

    }

    public function addNote($data)
    {
        global $wpdb;

        $wpdb->insert('workout_notes',
            array(
                'detail'       => $data['note'],
                'workout_id'   => (int) $data['workout_id'],
                'created_at'   => Carbon::now()->format('Y-m-d H:m:s'),
                'updated_at'   => Carbon::now()->format('Y-m-d H:m:s')
            )
        );
    }

    public function getNote()
    {
        global $wpdb;

        $notes = $wpdb->get_results( "SELECT * FROM workout_notes WHERE workout_id={$this->id} ORDER BY id DESC", ARRAY_A);

        if ($notes) {
            return $notes[0];
        }

        return NULL;
    }

	public static function find($workoutId)
    {
        $programArr = workOutGet($workoutId);

        if ($programArr)
        {
            $program = new self();

            $program->id = $workoutId;
            $keys = array_keys($programArr);

            foreach ($keys as $key)
            {
                $program->{$key} = $programArr[$key];
            }

            return $program;
        }

        return NULL;
    }

}