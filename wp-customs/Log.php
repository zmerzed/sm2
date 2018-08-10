<?php

use Carbon\Carbon;

class Log
{

    public function __construct()
    {

    }

    public static function user($userId)
    {
        global $wpdb;

        $user = User::find($userId);

        if (getMembershipLevel($user) == 'gym') {

            $trainersIds = $user->getTrainersById();
            $trainersIds[] = $user->id; // include gym id
            $idsStr = implode(",", $trainersIds);
            $logs = $wpdb->get_results( "SELECT * FROM workout_activity_logs WHERE user_id IN({$idsStr}) ORDER BY id DESC", ARRAY_A);

            return $logs;
        }

        $logs = $wpdb->get_results( "SELECT * FROM workout_activity_logs WHERE user_id={$userId} ORDER BY id DESC", ARRAY_A);
        return $logs;
    }

	public static function getContent($logType=NULL)
    {
        if (!$logType) return NULL;

        $types = [
            "GYM_ADD_CLIENT" => "{-gymName} adds a client - {-clientName}.",
            "GYM_CREATE_PROGRAM" => "{-gymName} created a program ({-programName}).",
            "GYM_UPDATE_PROGRAM" => "{-gymName} updated a program ({-programName}).",
            "GYM_DELETE_PROGRAM" => "{-gymName} deleted a program ({-programName}).",
            "GYM_UPDATE_NOTE"    => "{-gymName} updated the program ({-programName}) note -{-noteDetail}.",

            "TRAINER_CREATE_PROGRAM" => "{-trainerName} created a program ({-programName}).",
            "TRAINER_UPDATE_PROGRAM" => "{-trainerName} updated a program ({-programName}).",
            "TRAINER_DELETE_PROGRAM" => "{-trainerName} deleted a program ({-programName}).",
            "TRAINER_UPDATE_NOTE"    => "{-trainerName} updated the program ({-programName}) note -{-noteDetail}.",

            "CLIENT_UPLOAD_DOCUMENT" => "{-clientName} uploaded health document {-fileName}.",
            "CLIENT_UPDATE_PROGRESS" => "{-clientName} updated his / her personal goals.",
            "SEND_MESSAGE" => "{-sender} send message to {-receiver}",
        ];

        if (in_array_recursive($logType, $types)) {
            return $types[$logType];
        }

        return '';
    }

    public static function insert($type, $user)
    {

        /* params sequence info */
        /* LogType, userObject */

        global $wpdb;

        $logDescription = '';

        switch ($type['type'])
        {
            case 'GYM_ADD_CLIENT': {

                $newClient = $type['client'];
                $logDescription = str_replace(
                    ["{-gymName}", "{-clientName}"],
                    [$user->user_nicename, $newClient->user_nicename],
                    self::getContent($type['type'])
                );

            } break;

            case 'GYM_CREATE_PROGRAM': {

                $workout = $type['workout'];
                $logDescription = str_replace(
                    ["{-gymName}", "{-programName}"],
                    [$user->user_nicename, $workout['workout_name']],
                    self::getContent($type['type'])
                );

                } break;

            case 'GYM_UPDATE_PROGRAM': {

                $workout = $type['workout'];
                $logDescription = str_replace(
                    ["{-gymName}", "{-programName}"],
                    [$user->user_nicename, $workout['workout_name']],
                    self::getContent($type['type'])
                );

                } break;

            case 'GYM_DELETE_PROGRAM': {

                $workout = $type['workout'];
                $logDescription = str_replace(
                    ["{-gymName}", "{-programName}"],
                    [$user->user_nicename, $workout['workout_name']],
                    self::getContent($type['type'])
                );

                } break;

            case 'GYM_UPDATE_NOTE': {

                $workout = $type['workout'];
                $noteDetail = '';

                if ($workout->getNote()) {
                    $note = $workout->getNote();
                    $noteDetail = $note['detail'];
                }

                $logDescription = str_replace(
                    ["{-gymName}", "{-programName}", "{-noteDetail}"],
                    [$user->user_nicename, $workout->workout_name, $noteDetail],
                    self::getContent($type['type'])
                );

            } break;

            case 'TRAINER_CREATE_PROGRAM': {

                $workout = $type['workout'];
                $logDescription = str_replace(
                    ["{-trainerName}", "{-programName}"],
                    [$user->user_nicename, $workout['workout_name']],
                    self::getContent($type['type'])
                );

                } break;

            case 'TRAINER_UPDATE_PROGRAM': {

                $workout = $type['workout'];
                $logDescription = str_replace(
                    ["{-trainerName}", "{-programName}"],
                    [$user->user_nicename, $workout->workout_name],
                    self::getContent($type['type'])
                );

                } break;

            case 'TRAINER_DELETE_PROGRAM': {

                $workout = $type['workout'];
                $logDescription = str_replace(
                    ["{-trainerName}", "{-programName}"],
                    [$user->user_nicename, $workout['workout_name']],
                    self::getContent($type['type'])
                );

                } break;

            case 'TRAINER_UPDATE_NOTE': {

                $workout = $type['workout'];

                $noteDetail = '';

                if ($workout->getNote()) {
                    $note = $workout->getNote();
                    $noteDetail = $note['detail'];
                }

                $logDescription = str_replace(
                    ["{-trainerName}", "{-programName}", "{-noteDetail}"],
                    [$user->user_nicename, $workout->workout_name, $noteDetail],
                    self::getContent($type['type'])
                );

                } break;

            case 'CLIENT_UPLOAD_DOCUMENT': {

                $fileName = $type['file'];

                $logDescription = str_replace(
                    ["{-clientName}", "{-fileName}"],
                    [$user->user_nicename, $fileName],
                    self::getContent($type['type'])
                );

                } break;

            case 'CLIENT_UPDATE_PROGRESS': {

                $logDescription = str_replace(
                    ["{-clientName}"],
                    [$user->user_nicename],
                    self::getContent($type['type'])
                );

                } break;

            case 'SEND_MESSAGE' : {

                $receiver = $type['receiver'];
                $logDescription = str_replace(
                    ["{-sender}", "{-receiver}"],
                    [$user->user_nicename, $receiver->user_nicename],
                    self::getContent($type['type'])
                );


            } break;
        }

        if (empty($logDescription)) return false;

        $gymId = NULL;
        $trainerId = NULL;
        $clientId = NULL;
        
        switch (getMembershipLevel(get_userdata($user->id)))
        {
            case 'gym': {
                $gymId = $user->id;
                } break;

            case 'trainer': {
                $trainerId = $user->id;
                } break;

            case 'client': {
                $clientId = $user->id;
                } break;
        }
 
        $wpdb->insert('workout_activity_logs',
            array(
                'user_id'           => $user->id,
                'log_type'          => $type['type'],
                'log_description'   => $logDescription,
                'gym_id'            => $gymId,
                'trainer_id'        => $trainerId,
                'client_id'         => $clientId,
                'created_at'        => Carbon::now()->format('Y-m-d H:m:s')
            )
        );
    }
}