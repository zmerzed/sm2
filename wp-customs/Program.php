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
                'workout_id'   => $this->id,
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

    public static function duplicate($workoutId, $user)
    {
        $program = self::find($workoutId);
        global $wpdb;

        $newProgram = [
            'workout_created_by' => $user->id,
            'workout_date' => $program->workout_date,
            'workout_description' => $program->workout_description,
            'workout_gym_ID' => $program->workout_gym_ID,
            'workout_name' => 'Copy ' . time() . ' ' . $program->workout_name,
            'workout_time' => $program->workout_time
        ];

        if (isset($user->isGym) && $user->isGym) {
            $newProgram['workout_gym_ID'] = $user->id;
            $newProgram['workout_trainer_ID'] = $program->workout_trainer_ID;
        } else {
            $newProgram['workout_trainer_ID'] = $user->id;
        }

        //  print_r($newProgram);
        $wpdb->insert('workout_tbl', $newProgram);
        $newProgram = self::find($wpdb->insert_id);

        // duplicate days
        foreach ($program->days as $day)
        {
            $newDay = [
                'wday_name' => $day['wday_name'],
                'wday_order' => $day['wday_order'],
                'wday_workout_ID' => $newProgram->workout_ID
            ];

            $wpdb->insert('workout_days_tbl', $newDay);

            // duplicate clients

            // duplicate exercises
        }

        $newProgram = self::find($newProgram->id);

        return $newProgram;
    }
}