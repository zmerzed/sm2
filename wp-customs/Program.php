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

        if (count($notes) > 0) {

            return $notes[0];
        }

        return NULL;
    }

    public function addCircuit($data) {

        global $wpdb;

        $result = $wpdb->insert('workout_circuits',
            array(
                'group_by_letter'      => $data['group_by_letter'],
                'day_id'       => $data['day_id'],
                'program_id'   => $this->id,
                'reps'         => $data['reps'],
                'sets'         => $data['sets']
            )
        );

        return $result;
    }

    public function getCircuits() {

        global $wpdb;

        $circuits = $wpdb->get_results( "SELECT * FROM workout_circuits WHERE program_id={$this->id} ORDER BY id DESC", ARRAY_A);

        if (count($circuits) > 0) {

            return $circuits;
        }

        return [];
    }

    /* remove workout as day */
    public function removeClientWorkout($clientId, $dayId, $clientDayId) {
        global $wpdb;

        // workout_day_clients_tbl
        $result = $wpdb->delete(
            'workout_day_clients_tbl',
            array(
                'workout_client_ID' => $clientDayId
            )
        );

        return true;
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

            $program->circuits = $program->getCircuits();
            return $program;
        }

        return NULL;
    }

    public static function findByWorkout($workoutId)
    {
        global $wpdb;

        $workouts = $wpdb->get_results( "SELECT * FROM workout_days_tbl WHERE wday_ID={$workoutId} LIMIT 1", ARRAY_A);

        if (count($workouts) > 0) {

            return $workouts[0];
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

    public static function addExerciseOption($data)
    {
        global $wpdb;

        $checkQuery = "SELECT * FROM workout_exercise_options_tbl where part='{$data['part']}'";
        $type = $data['name'];

        $messages = [];
        $rows = $wpdb->get_results($checkQuery, ARRAY_A);
        $newType = false;

        if (count($rows) > 0) { // part already existed
            $part = $rows[0];
            $part['options']  = json_decode($part['options'], true);
            $isFound = false;

            // check if the type is already existed
            foreach ($part['options'] as $key => $option)
            {
                if ($type == $option['type']) {
                    $messages[] = 'Type is already existed';
                    $isFound = true;
                    break;
                }
            }

            if (!$isFound) { // insert new type
                $newType = [
                    'type' => $type,
                    'exercise_1' => $data['variations1'],
                    'exercise_2' => $data['variations2'],
                    'implementation_options' => $data['implementations'],
                    'video_link' => $data['videoLink']
                ];

                $part['options'][] = $newType;
            }

            // update the part record
            $wpdb->update(
                'workout_exercise_options_tbl',
                array(
                    'options' => json_encode($part['options'])
                ),
                array('id' => $part['id'])
            );
        }
        else { // create new part
            $newType = [
                'type' => $type,
                'exercise_1' => $data['variations1'],
                'exercise_2' => $data['variations2'],
                'implementation_options' => $data['implementations'],
                'video_link' => $data['videoLink']
            ];

            $newPart = [
                'part' => $data['part'],
                'options' => json_encode([$newType])
            ];

            $wpdb->insert('workout_exercise_options_tbl', $newPart);

            $part = $newPart;
        }

        $newType['part'] = $part['part'];

        return [
            'data' => $part,
            'newType' => $newType,
            'messages' => $messages
        ];
    }
}