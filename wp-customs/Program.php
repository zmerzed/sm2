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
            'workout_name' => 'Copy ' . $program->workout_name,
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
            $newIdDay = $wpdb->insert_id;

            // duplicate exercises
            if (isset($day['exercises']))
            {

                foreach ($day['exercises'] as $clientExercise)
                {

                    $m=microtime(true);
                    $hash = sprintf("%8x%05x",floor($m),($m-floor($m))*1000000);

                    // insert the new exercise
                    $newExercise = [
                        'exer_day_ID' => $newIdDay,
                        'exer_workout_ID' => $newProgram->workout_ID,
                        'exer_body_part' => $clientExercise['exer_body_part'],
                        'exer_type' => $clientExercise['exer_type'],
                        'exer_exercise_1' => $clientExercise['exer_exercise_1'],
                        'exer_exercise_2' => $clientExercise['exer_exercise_2'],
                        'exer_sq' => $clientExercise['exer_sq'],
                        'exer_sets' => $clientExercise['exer_sets'],
                        'exer_rep' => $clientExercise['exer_rep'],
                        'exer_tempo' => $clientExercise['exer_tempo'],
                        'exer_rest' => $clientExercise['exer_rest'],
                        'exer_impl1' => $clientExercise['exer_impl1'],
                        'hash' => $hash
                    ];

                    $wpdb->insert('workout_exercises_tbl', $newExercise);

                }
            }

            // duplicate clients
            if (isset($day['clients']))
            {
                foreach ($day['clients'] as $client)
                {

                    $newClientInDay = [
                        'workout_client_dayID' => $newIdDay,
                        'workout_client_workout_ID' => $newProgram->workout_ID,
                        'workout_clientID' => $client['ID'],
                        'workout_day_availability' => $client['day_availability'],
                        'workout_client_schedule' => $client['date_availability'],
                        'workout_isDone' => 0
                    ];

                    $wpdb->insert('workout_day_clients_tbl', $newClientInDay);

                    // workout_client_exercise_assignments
                    // get the exercises from the program (workout)

                    $exQuery = "SELECT * FROM workout_exercises_tbl WHERE exer_workout_ID={$newProgram->workout_ID}";
                    $exercisesResult = $wpdb->get_results($exQuery, OBJECT);

                    foreach ($exercisesResult as $nExercise)
                    {
                        $newClientAssignment = [
                            'exercise_id' => $nExercise->exer_ID,
                            'client_id' => $client['ID']
                        ];

                        $wpdb->insert('workout_client_exercise_assignments', $newClientAssignment);
                    }

                }
            }

        }

        $newProgram = self::find($newProgram->id);

        return $newProgram;
    }
}