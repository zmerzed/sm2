<?php

use Carbon\Carbon;

class User
{

    public function __construct()
    {

    }

    public function uploadFile($file)
    {
        global $wpdb;
        
        $currentDir = getcwd();
        $userId = $_POST['userId'];

        if (DIRECTORY_SEPARATOR == '\\') {
            $uploadDirectory = "\\sm-files\\{$userId}\\";
        } else {
            $uploadDirectory = "/sm-files/{$userId}/";
        }

      //  echo $currentDir . $uploadDirectory . "\n";
        if (!is_dir($currentDir . $uploadDirectory)) {
           // echo 'xxxxxxxxxxxxxxxxx';
            mkdir($currentDir . $uploadDirectory, 0777, true);
        }

        $errors = []; // Store all foreseen and unforseen errors here

        $fileImageExtensions = ['jpeg','jpg','png']; // Get all the file extensions
        $fileExtensions = ['pdf','doc','xls', 'csv', 'docx', 'xlsx'];
        
        $fileName = $file['name'];
        $fileSize = $file['size'];
        $fileTmpName  = $file['tmp_name'];
        $fileType = $file['type'];
        $fileExtension = strtolower(end(explode('.',$fileName)));

        if (in_array($fileExtension, $fileImageExtensions)) 
        {
        //    echo 'xXXXXXXXXXXXXXXXXX';
            $newFileName =  basename('photo_'.time()) . '.jpg';
            $uploadPath = $currentDir . $uploadDirectory . $newFileName;
            
            // insert the filename
            $didUpload = move_uploaded_file($fileTmpName, $uploadPath);

            if ($didUpload) {
                $wpdb->insert('workout_user_files',
                    array(
                        'file'   => $newFileName,
                        'type' => 'image',
                        'user_id' => (int) $this->id,
                        'uploaded_at' => Carbon::now()
                    )
                );
                return true;
                //echo "The file " . basename($fileName) . " has been uploaded";
            } else {
                //  echo "An error occurred somewhere. Try again or contact the admin";
            }
        } else if(in_array($fileExtension, $fileExtensions)) {
          //  echo 'non image file...';
          //  echo $fileExtension;
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
                return true;
                //echo "The file " . basename($fileName) . " has been uploaded";
            } else {
                //  echo "An error occurred somewhere. Try again or contact the admin";
            }
        }

        if ($fileSize > 2000000) {
            $errors[] = "This file is more than 2MB. Sorry, it has to be less than or equal to 2MB";
        }

        if (empty($errors)) {

           
        } else {
            foreach ($errors as $error) {
               // echo $error . "These are the errors" . "\n";
            }
        }
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
            $todayStat = $wpdb->get_results("SELECT * FROM workout_client_stats  WHERE DATE(`target_date`)=DATE(NOW()) AND client_id={$clientId} AND created_by={$modifier} AND type='result' LIMIT 1", ARRAY_A);

            if (count($todayStat) <= 0)
            {

                // get the last record
                $lastStat = $wpdb->get_results( "SELECT * FROM workout_client_stats WHERE target_date=(SELECT MAX(target_date) FROM workout_client_stats WHERE client_id = {$clientId}) AND type='result'", ARRAY_A);

                if (count($lastStat) > 0)
                {
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
		
		if(empty($result))
			$result = array(array());
		if(empty($goal))
			$goal = array(array());
		if(empty($start))
			$start = array(array());

        return $output = [
            'start' => $start[0],
            'goal' => $goal[0],
            'result' => $result[0]
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
                $user->{$key} = $mUser[$key];
            }

            return $user;
        }
        return $user;
    }
}