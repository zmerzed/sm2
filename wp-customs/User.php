<?php

use Carbon\Carbon;

class User
{
    public $forGymVal = NULL;
    
    public function __construct()
    {

    }

    public function uploadFile($file)
    {
        global $wpdb;
        ini_set('display_errors','Off');
        ini_set('error_reporting', E_ALL );
        define('WP_DEBUG', false);
        define('WP_DEBUG_DISPLAY', false);
        $currentDir = getcwd();
        $userId = $_POST['userId'];

        if (DIRECTORY_SEPARATOR == '\\') {
            $uploadDirectory = "\\sm-files\\{$userId}\\";
        } else {
            $uploadDirectory = "/sm-files/{$userId}/";
        }

        if (!is_dir($currentDir . $uploadDirectory)) {

            mkdir($currentDir . $uploadDirectory, 0777, true);
        }

        $errors = []; // Store all foreseen and unforseen errors here

        $fileImageExtensions = ['jpeg','jpg','png']; // Get all the file extensions
        $fileExtensions = ['pdf','doc','xls', 'csv', 'docx', 'xlsx'];
        
        $fileName = $file['name'];
        $fileSize = $file['size'];
        $fileTmpName  = $file['tmp_name'];
        $fileType = $file['type'];
       // $fileExtension = strtolower(end(explode('.',$fileName)));

        $mFileExtns = explode('.',$fileName);
        $fileExtension = strtolower($mFileExtns[1]);

        if (in_array($fileExtension, $fileImageExtensions)) 
        {
        //    echo 'xXXXXXXXXXXXXXXXXX';

            $newFileName =  basename('photo_'.time()) . '.jpg';
            $uploadPath = $currentDir . $uploadDirectory . $newFileName;
            
            // insert the filename
            $didUpload = move_uploaded_file($fileTmpName, $uploadPath);

            if ($didUpload) {

                $imageType = 'image';

                if ($this->forGymVal) {
                    
                    if (isset($this->forGymVal['gym_profile_portrait'])) {
                        $imageType = 'image_gym_portrait';
                    }

                    if (isset($this->forGymVal['gym_profile_landscape'])) {
                        $imageType = 'image_gym_landscape';
                    }
                }

                $wpdb->insert('workout_user_files',
                    array(
                        'file'   => $newFileName,
                        'type' => $imageType,
                        'user_id' => (int) $this->id,
                        'uploaded_at' => Carbon::now()
                    )
                );

            } else {
                $errors[] = "An error occurred somewhere. Try again or contact the admin";
            }
        } else if(in_array($fileExtension, $fileExtensions)) {

            $newFileName =  basename($fileName);
            $uploadPath = $currentDir . $uploadDirectory . $newFileName;

            // insert the filename
            $didUpload = move_uploaded_file($fileTmpName, $uploadPath);

            if ($didUpload) {
                $wpdb->insert('workout_user_files',
                    array(
                        'file'   => $newFileName,
                        'type' => 'file',
                        'user_id' => (int) $this->id,
                        'uploaded_at' => Carbon::now()
                    )
                );

            } else {
                $errors[] = "An error occurred somewhere. Try again or contact the admin";
            }
        }

        if ($fileSize > 2000000) {
            $errors[] = "This file is more than 2MB. Sorry, it has to be less than or equal to 2MB";
        }

        return [
            'errors' => $errors,
            'gymPhotos' => $this->getGymLogos()
        ];
    }

    public function modifyStat($data, $modifier)
    {

//        id
//        type
//        client_id
//        weight
//        body_fat
//        waist
//        chest
//        arms
//        forearms
//        shoulders
//        hips
//        thighs
//        calves
//        neck
//        height
//        created_at
//        target_date
//        updated_by
//        created_by

        global $wpdb;

        if (!isset($data['client_id'])) {
            return false;
        }

        $clientId = (int) $data['client_id'];
        $modifier = (int) $modifier;

        if (isset($data['start']))
        {
           // dd($data);
            // check if its exist by using client id and trainer id

            $result = $wpdb->get_results("SELECT * FROM workout_client_stats WHERE client_id={$clientId} AND created_by={$modifier} AND type='start' LIMIT 1", ARRAY_A);

            if (count($result) > 0) { // update record

                $stat = $data['start'];
                $statId = $result[0]['id'];
                $stat['updated_by'] = $modifier;
                $stat['updated_at'] = Carbon::now()->format('Y-m-d H:m:s');

                $x = $wpdb->update(
                    'workout_client_stats',
                    $stat,
                    array('id' => $statId)
                );
               // dd($x);
            }
            else { // insert new record
                $stat = $data['start'];
                $stat['client_id'] = (int) $data['client_id'];
                $stat['created_at'] = Carbon::now()->format('Y-m-d H:m:s');
                $stat['updated_at'] = Carbon::now()->format('Y-m-d H:m:s');
                $stat['created_by'] = $modifier;
                $stat['updated_by'] = $modifier;
                $stat['type'] = "start";

                $wpdb->insert('workout_client_stats', $stat);
            }
        }

        if (isset($data['goal']))
        {

            $result = $wpdb->get_results("SELECT * FROM workout_client_stats WHERE client_id={$clientId} AND created_by={$modifier} AND type='goal' LIMIT 1", ARRAY_A);

            if (count($result) > 0) { // update record
                $stat = $data['goal'];
                $statId = $result[0]['id'];
                $stat['updated_by'] = $modifier;
                $stat['updated_at'] = Carbon::now()->format('Y-m-d H:m:s');

                $wpdb->update(
                    'workout_client_stats',
                    $stat,
                    array('id' => $statId)
                );
            }
            else { // insert new record
                $stat = $data['goal'];
                $stat['client_id'] = (int) $data['client_id'];
                $stat['created_at'] = Carbon::now()->format('Y-m-d H:m:s');
                $stat['updated_at'] = Carbon::now()->format('Y-m-d H:m:s');
                $stat['created_by'] = $modifier;
                $stat['updated_by'] = $modifier;
                $stat['type'] = "goal";

                $wpdb->insert('workout_client_stats', $stat);
            }
        }

        if (isset($data['result']))
        {

           // $result = $wpdb->get_results("SELECT * FROM workout_client_stats  WHERE DATE(`target_date`)=DATE(NOW()) AND client_id={$clientId} AND created_by={$modifier} AND type='result' LIMIT 1", ARRAY_A);
            // $result = $wpdb->get_results("SELECT * FROM workout_client_stats  WHERE target_date IS NOT NULL AND client_id={$clientId} AND created_by={$modifier} AND type='result' LIMIT 1", ARRAY_A);

            // get the today record
            $todayStat = $wpdb->get_results("SELECT * FROM workout_client_stats WHERE DATE(`target_date`)=DATE(NOW()) AND client_id={$clientId} AND created_by={$modifier} AND type='result' LIMIT 1", ARRAY_A);

            if (count($todayStat) <= 0)
            {

                // get the last record
                $lastStat = $wpdb->get_results( "SELECT * FROM workout_client_stats WHERE target_date=(SELECT MAX(target_date) FROM workout_client_stats WHERE client_id = {$clientId}) AND type='result'", ARRAY_A);

                if (count($lastStat) > 0)
                {
                    //dd('llf');
                    // insert a new record
                    $stat = $data['result'];
                    $stat['client_id'] = (int) $data['client_id'];
                    $stat['created_at'] = Carbon::now()->format('Y-m-d H:m:s');
                    $stat['updated_at'] = Carbon::now()->format('Y-m-d H:m:s');
                    $stat['target_date'] = Carbon::now()->format('Y-m-d H:m:s');
                    $stat['created_by'] = $modifier;
                    $stat['updated_by'] = $modifier;
                    $stat['type'] = "result";

                    unset($stat['id']);

                    $wpdb->insert('workout_client_stats', $stat);
                } else {
                    $stat = $data['result'];
                    $stat['client_id'] = (int) $data['client_id'];
                    $stat['created_at'] = Carbon::now()->format('Y-m-d H:m:s');
                    $stat['updated_at'] = Carbon::now()->format('Y-m-d H:m:s');
                    $stat['target_date'] = Carbon::now()->format('Y-m-d H:m:s');
                    $stat['created_by'] = $modifier;
                    $stat['updated_by'] = $modifier;
                    $stat['type'] = "result";

                  //  unset($stat['id']);

                    $wpdb->insert('workout_client_stats', $stat);
                }
            } else {

                $stat = $data['result'];
                $statId = $todayStat[0]['id'];
                $stat['updated_by'] = $modifier;
                $stat['updated_at'] = Carbon::now()->format('Y-m-d H:m:s');

                $wpdb->update(
                    'workout_client_stats',
                    $stat,
                    array('id' => $statId)
                );
            }
        }

        return $this->getStats();
    }
    
    public function getPhotos() {
        global $wpdb;
        $results = $wpdb->get_results( "SELECT * FROM workout_user_files WHERE user_id = {$this->id} AND type='image'", ARRAY_A);
        return $results;
    }

    public function getFiles() {
        global $wpdb;
        $results = $wpdb->get_results( "SELECT * FROM workout_user_files WHERE user_id = {$this->id} AND type='file'", ARRAY_A);
        return $results;
    }

    public function getStats() {

        /* stats type
         *
         * START
         * GOAL
         * RESULT
         *
         */

        global $wpdb;

        $start = $wpdb->get_results( "SELECT * FROM workout_client_stats WHERE client_id = {$this->id} AND type='START'", ARRAY_A);
        $goal = $wpdb->get_results( "SELECT * FROM workout_client_stats WHERE client_id = {$this->id} AND type='GOAL'", ARRAY_A);
        /* $result = $wpdb->get_results( "SELECT * FROM workout_client_stats WHERE DATE(`target_date`)=DATE(NOW()) AND client_id = {$this->id} AND type='RESULT'", ARRAY_A); */
		$result = $wpdb->get_results( "SELECT * FROM workout_client_stats WHERE target_date=(SELECT MAX(target_date) FROM workout_client_stats WHERE client_id = {$this->id}) AND type='result'", ARRAY_A);
		
		if(empty($result)) {
            $result = self::getDefaultStat();
        } else {
            $result = $result[0];
        }

		if(empty($goal)) {
            $goal = self::getDefaultStat();
        } else {
            $goal = $goal[0];
        }

		if(empty($start)) {
            $start = self::getDefaultStat();
        } else {
            $start = $start[0];
        }


        return $output = [
            'start' => $start,
            'goal' => $goal,
            'result' => $result
        ];
    }

    /* It will return a list of trainers
     * as if the user is a gym
     * @return array
     */
    public function getTrainers()
    {
        return getTrainersOfGym($this);
    }

    /* It will return a list of trainers by id fields
     * as if the user is a gym
     * @return array
     */
    public function getTrainersById()
    {
        $trainers = $this->getTrainers();
        $ids = [];

        foreach ($trainers as $trainer)
        {
            $ids[] = $trainer->ID;
        }
        
        return $ids;
    }

    /*
     * It will get all workouts depends if its trainer, client or gym
     * @return list
     */
    public function getPrograms()
    {
        
        global $wpdb;

        $ids = $this->getTrainersById();
        $ids[] = $this->id;

        $ids = implode(",", $ids);
        $querystr = "SELECT * FROM workout_tbl WHERE workout_trainer_ID IN({$ids}) ORDER BY workout_ID desc";
        $workouts = $wpdb->get_results($querystr, OBJECT);
        return $workouts;
    }

    public function getExercises()
    {
        global $wpdb;

        $programs = $this->getPrograms();
        $programsAsId = [];
        
        foreach ($programs as $program) {
            $programsAsId[] = $program->workout_ID;
        }

        $ids = implode(",", $programsAsId);
        $querystr = "SELECT * FROM workout_exercises_tbl WHERE exer_workout_ID IN({$ids}) ORDER BY exer_ID desc";
        $exercises = $wpdb->get_results($querystr, OBJECT);

        return $exercises;
    }

    public function getGymLogos() {

        global $wpdb;

        $portraitFile = '';
        $portraits = $wpdb->get_results( "SELECT * FROM workout_user_files WHERE user_id={$this->id} AND type='image_gym_portrait' ORDER BY id desc", ARRAY_A);

        $landscapeFile = '';
        $landscapes = $wpdb->get_results( "SELECT * FROM workout_user_files WHERE user_id={$this->id} AND type='image_gym_landscape' ORDER BY id desc", ARRAY_A);

        if (count($portraits) > 0) {
            $portraitFile = get_site_url() . "/sm-files/{$this->id}/" . $portraits[0]['file'];
        }

        if (count($landscapes) > 0) {
            $landscapeFile = get_site_url() . "/sm-files/{$this->id}/" . $landscapes[0]['file'];
        }

        return [
            'landscape' => $landscapeFile,
            'portrait' => $portraitFile
        ];
    }

    public static function getDefaultStat()
    {
        return [
            'weight' => '',
			'body_fat' => '',
			'waist' => '',
            'chest' => '',
			'arms' => '',
			'forearms' => '',
            'shoulders' => '',
            'hips'  => '',
			'thighs' => '',
			'calves' => '',
			'neck' => '',
			'height' => ''
		];
    }

    public static function find($userId)
    {
        global $wpdb;
        $user = new self();
        $user->id = $userId;
        $userArr = $wpdb->get_results( "SELECT * FROM wp_users WHERE ID = {$userId} LIMIT 1", ARRAY_A);

        if ($userArr)
        {

            $mUser = $userArr[0];
            $keys = array_keys($userArr[0]);

            foreach ($keys as $key)
            {
                if ($key != 'user_pass') {
                    $user->{$key} = $mUser[$key];
                }
            }

            return $user;
        }
        return $user;
    }
}