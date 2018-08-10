<?php
// Exit if accessed directly
if ( !defined( 'ABSPATH' ) ) exit;

// BEGIN ENQUEUE PARENT ACTION
// AUTO GENERATED - Do not modify or remove comment markers above or below:

if ( !function_exists( 'chld_thm_cfg_parent_css' ) ):
	function chld_thm_cfg_parent_css() {
		wp_enqueue_style( 'chld_thm_cfg_parent', trailingslashit( get_template_directory_uri() ) . 'style.css', array(  ) );
	}
endif;
add_action( 'wp_enqueue_scripts', 'chld_thm_cfg_parent_css', 10 );


add_filter('register','no_register_link');
function no_register_link($url){
	return '';
}

add_action('login_enqueue_scripts', 'strength_mextrix_login_scripts', 10);
function strength_mextrix_login_scripts(){
	wp_enqueue_script( 'strength_mextrix.js', get_stylesheet_directory_uri() . '/js/strength_metrix.js', array( 'jquery' ), 1.0 );
	wp_enqueue_style( 'strength_mextrix_login.css', get_stylesheet_directory_uri() . '/css/strength_mextrix_login.css', array(  ) );
}


/*
*
* Check what is the buddyPress member type
* Redirect them to a specific pages. 
*
*/

function sm_login_redirect( $redirect_to, $request, $user ) {
	//is there a user to check?
	if ( isset( $user->roles ) && is_array( $user->roles ) ) {
		
		$pm_lvl = "";	
		$ppp = pmpro_getMembershipLevelForUser($user->ID);
		if(!empty($ppp))
			$pm_lvl = $ppp->name;
		
		/* $member_type = bp_get_member_type($user->data->ID); */

		//check for admins
		if ( in_array( 'administrator', $user->roles ) ) {
			return $redirect_to;
		} else if( in_array( 'client', $user->roles ) ){
			return home_url() . '/client';
		} else if( $pm_lvl == "Trainer" || in_array( 'trainer', $user->roles )){
			return home_url() . '/trainer';
		} else if( $pm_lvl == "Gym"  ){
			return home_url() . '/gym';
		}
	} else {
		return $redirect_to;
	}
}

add_filter( 'login_redirect', 'sm_login_redirect', 10, 3 );

/*ADD NEW ROLES*/
function wpcodex_set_capabilities() {
	$role = get_role( 'trainer' );
	$role2 = get_role( 'gym' );
	$role3 = get_role( 'client' );
	$role4 = get_role( 'subscriber' );

	$caps = array('create_users');
	$caps2 = array('upload_files');
	$removeCaps = array('edit_posts', 'edit_users', 'list_users', 'remove_users', 'delete_users', 'upload_files');

	foreach($caps as $cap){
		$role->add_cap( $cap );
		$role2->add_cap( $cap );
		$role4->add_cap( $cap );
	}

	foreach($caps2 as $cap){
		$role3->remove_cap( $cap );
	}

	foreach($removeCaps as $removeCap){
		$role->remove_cap( $removeCap );
		$role2->remove_cap( $removeCap );
		$role3->remove_cap( $removeCap );
		$role4->remove_cap( $removeCap );
	}
}
add_action( 'init', 'wpcodex_set_capabilities' );

add_role(
	'gym',
	__( 'Gym' ),
	array(
		'create_users'   => true,
	)
);
add_role(
	'trainer',
	__( 'Trainer' ),
	array(
		'create_users'   => true
	)
);
add_role(
	'client',
	__( 'Client' ),
	array(
		'read'         => true
	)
);

/*Return array of Clients*/
function getClientsOfTrainer($user) {
	/* if ( ! in_array('trainer', $user->roles, true) ) { */
	if ( getMembershipLevel($user) != 'trainer' ) {
		return array();
	}
	$meta = get_user_meta($user->ID, 'clients_of_trainer', true);
	if (empty($meta)) {
		return array();
	}

	$query = new WP_User_Query(array(
		'role'    => 'client',
		'include' => (array) $meta
	));

	return $query->results;
}
/*Return array of trainers*/
function getTrainersOfGym($user) {
	/* if ( ! in_array('gym', $user->roles, true) ) { */
	if ( getMembershipLevel($user) != 'gym' ) {
		return array();
	}
	$meta = get_user_meta($user->ID, 'trainers_of_gym', true);
	if (empty($meta)) {
		return array();
	}

	$query = new WP_User_Query(array(
		'role'    => 'trainer',
		'include' => (array) $meta
	));

	return $query->results;
}

/*Assign a Client to a Trainer*/
function assignClientToTrainer($client, $trainer) {
	$pm_lvl_train = "";
	$ppp = pmpro_getMembershipLevelForUser($trainer->ID);
	if(!empty($ppp))
		$pm_lvl_train = $ppp->name;
	
	if ( ! in_array('trainer', $trainer->roles, true) && $pm_lvl_train != "Trainer" ) {
		return false;
	}

	if ( ! in_array('client', $client->roles, true) ) {
		return false;
	}

	$clients = get_user_meta($trainer->ID, 'clients_of_trainer', true);
	if(empty($clients)){
		$clients = array();
	}

	$clients[] = $client->ID;
	$update = update_user_meta($trainer->ID, 'clients_of_trainer', $clients);
	update_user_meta($client->ID, 'parent_trainer', $trainer->ID);

	return (int) $update > 0;
}

/*Assign a Trainer to a Gym*/
function assignTrainerToGym($trainer, $gym) {
	$pm_lvl_gym = "";
	$ppp = pmpro_getMembershipLevelForUser($gym->ID);
	if(!empty($ppp))
		$pm_lvl_gym = $ppp->name;

	$pm_lvl_train = "";
	$ppp2 = pmpro_getMembershipLevelForUser($trainer->ID);
	if(!empty($ppp2))
		$pm_lvl_train = $ppp2->name;
	
	if ( ! in_array('gym', $gym->roles, true) && $pm_lvl_gym != "Gym" ) {		
		return false;
	}

	if ( ! in_array('trainer', $trainer->roles, true) && $pm_lvl_train != "Trainer" ) {		
		return false;
	}

	$trainers = get_user_meta($gym->ID, 'trainers_of_gym', true);
	if(empty($trainers)){
		$trainers = array();
	}

	$trainers[] = $trainer->ID;
	$update = update_user_meta($gym->ID, 'trainers_of_gym', $trainers);
	update_user_meta($trainer->ID, 'parent_gym', $gym->ID);

	return (int) $update > 0;
}

/*User Trapping*/
function checkUserOrParentStatus($user)
{
	global $wpdb;	
	$ppm = pmpro_getMembershipLevelForUser($user->ID);
	$pm_lvl = "";
	if(!empty($ppm)){
		$pm_lvl = $ppm->name;
	}
		
	$query = "";
	$member = array();
	$uopid = ""; //user_or_parent_id
	
	if($pm_lvl == "Gym"){
		$uopid = $user->ID;
	}elseif($pm_lvl == "Trainer"){
		$uopid = $user->ID;
	}elseif(in_array( 'trainer', $user->roles )){
		$parent_id = get_user_meta($user->ID, 'parent_gym', true);
		
		if($parent_id != ""){
			$uopid = get_user_by('id', $parent_id)->ID;					
		}else{
			$uopid = $user->ID;
		}
	}elseif(in_array( 'client', $user->roles )){
		$parent_id = get_user_meta($user->ID, 'parent_trainer', true);
		
		if($parent_id != ""){
			$gparent_id = get_user_meta($parent_id, 'parent_gym', true);
			if($gparent_id != ""){
				$uopid = get_user_by('id', $gparent_id)->ID;
			}else{
				$uopid = get_user_by('id', $parent_id)->ID;
			}
		}
	}
	
	$query = "SELECT * FROM wp_pmpro_memberships_users WHERE user_id = '" . $uopid . "'";
	$member = $wpdb->get_results($query, OBJECT);
	
	if(!empty($member)){
		$tempStat = array();
		foreach($member as $mem){
			$tempStat[$mem->id] = $mem->status;
		}
		if(in_array( 'active', $tempStat )){
			return true;
		}else{
			return false;
		}		
	}else{
		return false;
	}
}

/*GET USER SCHEDULE*/
function getDaysOfWeek()
{
	$ddate = date('Y-m-d');
	$date = new DateTime($ddate);
	$week = $date->format("W");
	$year = $date->format("Y");
	$tempArr = array();

	for($day=1; $day<=7; $day++){
		$tempArr[$day] = date('Y-m-d', strtotime($year."W".$week.$day));
	}

	return $tempArr;
}

function getWeeklySchedule($user)
{
	global $wpdb;
	$day1 = getDaysOfWeek()[1];
	$day7 = getDaysOfWeek()[7];

	$results_w_day = $wpdb->get_results( "SELECT * FROM workout_day_clients_tbl WHERE workout_clientID = " . $user->ID . " AND workout_client_schedule BETWEEN '". $day1 ."' AND '" . $day7 . "'", OBJECT );
	$results_w = $wpdb->get_results( "SELECT * FROM workout_tbl", OBJECT );

	return getWOutArr($results_w_day, $results_w);
}
function getMonthlySchedule($u)
{
	global $wpdb;
	$m_lvl = getMembershipLevel($u);
	/* $urole = $u->roles; */
	$uid = $u->ID;
	$wquery = "SELECT * FROM workout_day_clients_tbl WHERE workout_clientID";
	$results_w = $wpdb->get_results( "SELECT * FROM workout_tbl", OBJECT );
	$results_w_day = array();

	/* if(in_array('client',$urole)){ */
	if($m_lvl == 'client'){
		$results_w_day = $wpdb->get_results( $wquery . "=" . $uid, OBJECT );
	/* }elseif(in_array('trainer',$urole)){ */
	}elseif($m_lvl == 'trainer'){
		$umeta = get_user_meta($uid,'clients_of_trainer',true);
		$coft = "";
		if($umeta)
			$coft = implode(", ", get_user_meta($uid,'clients_of_trainer',true));

		$results_w_day = $wpdb->get_results( $wquery . " IN (" . $coft . ")", OBJECT );
	}elseif($m_lvl == 'gym'){
		$umeta2 = get_user_meta($uid,'trainers_of_gym',true);
		if(empty($umeta2))
			$umeta2 = array();
		$temp_arr = array();
		
		foreach($umeta2 as $v){
			$vv = get_user_meta($v,'clients_of_trainer',true);
			if(empty($vv))
				$vv = array();
			
			foreach($vv as $k){
				$temp_arr[] = $k;
			}
		}
		
		$coft = "";
		
		if(!empty($temp_arr))
			$coft = implode(", ", $temp_arr);
		
		$results_w_day = $wpdb->get_results( $wquery . " IN (" . $coft . ")", OBJECT );
	}

	return getWOutArr($results_w_day, $results_w);
}

function getWOutArr($results_w_day, $results_w)
{
	global $wpdb;
	$woutArray = array();
	if(empty($results_w_day)){
		$results_w_day = array();
	}
	foreach($results_w_day as $rwd){
		foreach($results_w as $rw){
			$wid = $rwd->workout_client_workout_ID;
			if($wid == $rw->workout_ID){
				$arrTemp = array();
				$dayid = $rwd->workout_client_dayID;
				$arrTemp['wname'] = $rw->workout_name;
				$arrTemp['dayid'] = $dayid;
				$arrTemp['workout_clientid'] = $rwd->workout_clientID;
				$arrTemp['workout_isdone'] = $rwd->workout_isDone;
				$arrTemp['wid'] = $wid;
				$arrTemp['wsched'] = date_format(date_create($rwd->workout_client_schedule), 'Y-m-d');
				$arrTemp['wdname'] = getWorkoutDayName($dayid);
				$woutArray[] = $arrTemp;
			}
		}
	}
	return $woutArray;
}

function jabs($u)	
{
	/* echo "<pre>";
	 print_r( getClientsOfTrainer(wp_get_current_user()));
	 echo "</pre>"; */
}

function getSchedData($u)
{
	$woutArray = getMonthlySchedule($u);
	$ctrTemp = 0;
	$tempArr = array();
	$urole = getMembershipLevel(wp_get_current_user());

	if(!empty($woutArray)){
		foreach($woutArray as $wa){
			$tempArr2 = array();
			$ctrTemp++;
			$wid = $wa['wid'];			
			$wclientid = $wa['workout_clientid'];
			$wclient = get_user_by('id', $wclientid);
			$daylink = home_url() ."/".$urole."/?data=workout&dayId=".$wa['dayid']."&workoutId=".$wid."&workout_client_id=".$wclientid;
			$tempArr2[] = ['wnote'=>getNote($wid),'wisdone'=>$wa['workout_isdone'],'wdname' => $wa['wdname'], 'daylink' => $daylink, 'wclient' => $wclientid, 'wname' => $wa['wname'], 'wcname' => $wclient->first_name. ' ' .$wclient->last_name, 'wcnname' => $wclient->user_nicename];
			$tempArr[$wa['wsched']][$ctrTemp] = $tempArr2;
		}
	}

	return $tempArr;
}

/*Recursive IN_ARRAY function*/
function in_array_r($needle, $haystack, $strict = false) {
	foreach ($haystack as $item) {
		if (($strict ? $item === $needle : $item == $needle) || (is_array($item) && in_array_r($needle, $item, $strict))) {
			return true;
		}
	}
	return false;
}

function in_array_recursive($needle, $haystack)
{
	foreach($haystack as $item)
	{
		if ($needle = $item || is_array($item) && in_array_recursive($needle, $item)) {
			return true;
		}
	}
	return false;
}

function test()
{
	global $wpdb;

	$querystr = "SELECT * FROM workout_tbl";

	$pageposts = $wpdb->get_results($querystr, OBJECT);

	print_r($pageposts);
}

function test2()
{
	global $wpdb;

	$get_user_ids = $wpdb->get_col( "SELECT u.ID FROM {$wpdb->users} u INNER JOIN 
{$wpdb->prefix}term_relationships r ON u.ID = r.object_id WHERE u.user_status = 0 AND r.term_taxonomy_id = 71");

	print_r($get_user_ids);
}

function helperGetCurrentDate()
{
	require_once $_SERVER['DOCUMENT_ROOT'] . '/vendor/autoload.php';

	return Carbon\Carbon::now();

}

function workOutAdd($data)
{
	global $wpdb;

	require_once $_SERVER['DOCUMENT_ROOT'] . '/vendor/autoload.php';

	$workout = htmlspecialchars_decode($data['workoutForm'], ENT_NOQUOTES);
	$workout = preg_replace('/\\\"/',"\"", $workout);

	$workout = stripslashes($workout);
	$workout = json_decode($workout, true);

	$wpdb->insert('workout_tbl',
		array(
			'workout_name' => $workout['name'],
			'workout_trainer_ID' => $data['workout_trainer_ID'],
			'workout_created_by' => (int) $workout['user_id']
		),
		array(
			'%s',
			'%d'
		)
	);

	$workOutId = (int) $wpdb->insert_id;

	if ($workout['days'])
	{
		if (isset($workout['note_detail']))
		{
			require_once getcwd() . '/wp-customs/Program.php';
			$program = Program::find($workOutId);

			if ($program) {
				$program->addNote(['note' => $workout['note_detail']]);
			}

		}
		
		foreach($workout['days'] as $d)
		{
			$wpdb->insert('workout_days_tbl',
				array(
					'wday_workout_ID' => $workOutId,
					'wday_name' => $d['name'],
					'wday_order' => (int) $d['seq']
				)
			);

			$dayId = $wpdb->insert_id;

			if ($d['exercises'])
			{

				foreach($d['exercises'] as $ex)
				{
					$exercise = [
						'exer_day_ID' => $dayId,
						'exer_workout_ID' => $workOutId,
						'hash'	=> $ex['hash']
					];

					if (isset($ex['selectedPart']))
					{
						$exercise['exer_body_part'] = $ex['selectedPart']['part'];

						if (isset($ex['selectedPart']['selectedType']))
						{
							$exercise['exer_type'] = $ex['selectedPart']['selectedType']['type'];

							if (isset($ex['selectedPart']['selectedType']['selectedExercise1']))
							{
								$exercise['exer_exercise_1'] = $ex['selectedPart']['selectedType']['selectedExercise1'];
							}

							if (isset($ex['selectedPart']['selectedType']['selectedExercise2']))
							{
								$exercise['exer_exercise_2'] = $ex['selectedPart']['selectedType']['selectedExercise2'];
							}

							if (isset($ex['selectedPart']['selectedType']['selectedImplementation1']))
							{
								$exercise['exer_impl1'] = $ex['selectedPart']['selectedType']['selectedImplementation1'];
							}
						}
					}

					if (isset($ex['selectedSQ']))
					{
						$exercise['exer_sq'] = $ex['selectedSQ']['name'];

						if (isset($ex['selectedSQ']['selectedSet']))  {
							$exercise['exer_sets'] = $ex['selectedSQ']['selectedSet'];
						}

						if (isset($ex['selectedSQ']['selectedRep']))  {
							$exercise['exer_rep'] = $ex['selectedSQ']['selectedRep'];
						}

						if (isset($ex['selectedSQ']['selectedTempo']))  {
							$exercise['exer_tempo'] = $ex['selectedSQ']['selectedTempo'];
						}

						if (isset($ex['selectedSQ']['selectedRest']))  {
							$exercise['exer_rest'] = $ex['selectedSQ']['selectedRest'];
						}
					}

					$wpdb->insert('workout_exercises_tbl', $exercise);

				}
			}

			/* inserting clients */
			if($d['clients'])
			{

				foreach($d['clients'] as $client)
				{

					$newClientDay = array(
						'workout_client_dayID' => (int) $dayId,
						'workout_client_workout_ID' => (int) $workOutId,
						'workout_clientID' => (int) $client['ID'],
					);

					if (isset($client['date_availability']) && (int) $client['date_availability'] > 0) {

						$scheduleDate = new \Carbon\Carbon($client['date_availability']);
						$newClientDay['workout_day_availability'] = $scheduleDate->dayOfWeek;
						$newClientDay['workout_client_schedule'] = $scheduleDate->format('Y-m-d h:i:s');
					}

					$wpdb->insert('workout_day_clients_tbl', $newClientDay);

					foreach ($client['exercises'] as $ex)
					{
						$exQuery = "SELECT * FROM workout_exercises_tbl WHERE hash='{$ex['hash']}' LIMIT 1";
						$exerciseResult = $wpdb->get_results($exQuery, OBJECT);

						if (count($exerciseResult) > 0)
						{
							$m = $exerciseResult[0];

							$wpdb->insert('workout_client_exercise_assignments',
								array(
									'exercise_id' => (int) $m->exer_ID,
									'client_id' => (int) $client['ID']
								)
							);

							$assignmentId = $wpdb->insert_id;

							if (isset($ex['assignment_sets']))
							{
								foreach ($ex['assignment_sets'] as $key => $set)
								{
									$wpdb->insert('workout_client_exercise_assignment_sets',
										array(
											'assignment_id' => (int) $assignmentId,
											'weight' => $set['weight'],
											'seq' => $key + 1
										)
									);
								}
							}
						}
					}
				}
			}
		}
	}

	$workout = workOutGet($workOutId);

	return $workout;
}

function workOutUpdate($data)
{
	global $wpdb;
	require_once $_SERVER['DOCUMENT_ROOT'] . '/vendor/autoload.php';

	$workout = htmlspecialchars_decode($data['updateWorkoutForm'], ENT_NOQUOTES);
	$workout = preg_replace('/\\\"/',"\"", $workout);

	$workout = stripslashes($workout);
	$workout = json_decode($workout, true);

	$mWorkoutId = (int) $workout['workout_ID'];
	$weekDays = array("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday");

	/* update workout */
	$wpdb->update(
		'workout_tbl',
		array('workout_name' => $workout['workout_name']),
		array('workout_ID' => $workout['workout_ID'])
	);

	if (isset($workout['days']))
	{
		/* update days */

		foreach($workout['days'] as $d)
		{

			if (isset($d['wday_ID']) && isset($d['isDelete']))
			{

				/* delete exercises and clients */


				// delete day exercises relates to workout
				$mDayId = (int) $d['wday_ID'];

				$dayExercisesQuery = "SELECT * FROM workout_exercises_tbl WHERE exer_day_ID={$mDayId} AND exer_workout_ID={$mWorkoutId}";
				$dayExercises = $wpdb->get_results($dayExercisesQuery, ARRAY_A);


				foreach ($dayExercises as $ex)
				{
					// delete workout_client_exercise_assignments relates to exercise
					$assignmentQuery = "SELECT * FROM workout_client_exercise_assignments WHERE exercise_id={$ex['exer_ID']}";
					$assignments = $wpdb->get_results($assignmentQuery, ARRAY_A);

					// delete workout_client_exercise_assignment_sets > which is sets relates to exercise assignment
					foreach ($assignments as $assign)
					{
						$wpdb->delete(
							'workout_client_exercise_assignment_sets',
							array( 'assignment_id' => $assign['id'] )
						);
					}

					$wpdb->delete(
						'workout_client_exercise_assignments',
						array('exercise_id' => $ex['exer_ID'])
					);
				}

				$wpdb->delete(
					'workout_day_clients_tbl',
					array( 'workout_client_dayID' => $d['wday_ID'] )
				);

				$wpdb->delete(
					'workout_exercises_tbl',
					array( 'exer_day_ID' => $d['wday_ID'] )
				);

				$wpdb->delete(
					'workout_days_tbl',
					array( 'wday_ID' => $d['wday_ID'] )
				);

			}
			// existing day
			else if (isset($d['wday_ID']))
			{
				$wpdb->update(
					'workout_days_tbl',
					array(
						'wday_name' => $d['wday_name'],
						'wday_order' => $d['wday_order']
					),
					array( 'wday_ID' => $d['wday_ID'] )
				);

				// for exercises
				if ($d['exercises'])
				{

					foreach($d['exercises'] as $ex)
					{
						// check if the exercise exist

						if (isset($ex['exer_ID']))
						{

							$exerciseQuery = "SELECT * FROM workout_exercises_tbl WHERE exer_ID={$ex['exer_ID']} LIMIT 1";
							$result = $wpdb->get_results($exerciseQuery, ARRAY_A);

							if(count($result) > 0)
							{

								$exercise = $result[0];

								// delete exercise
								if (isset($ex['isDelete']))
								{

									$wpdb->delete(
										'workout_exercises_tbl',
										array('exer_ID' => $ex['exer_ID'])
									);

									// delete client assignments exercise
									// delete assignment sets

								} else {

									// update part

									if (isset($ex['selectedPart']))
									{

										$exercise['exer_body_part'] = $ex['selectedPart']['part'];

										if (isset($ex['selectedPart']['selectedType']))
										{
											$exercise['exer_type'] = $ex['selectedPart']['selectedType']['type'];

											if (isset($ex['selectedPart']['selectedType']['selectedExercise1']))
											{
												$exercise['exer_exercise_1'] = $ex['selectedPart']['selectedType']['selectedExercise1'];
											}

											if (isset($ex['selectedPart']['selectedType']['selectedExercise2']))
											{
												$exercise['exer_exercise_2'] = $ex['selectedPart']['selectedType']['selectedExercise2'];
											}

											if (isset($ex['selectedPart']['selectedType']['selectedImplementation1']))
											{
												$exercise['exer_impl1'] = $ex['selectedPart']['selectedType']['selectedImplementation1'];
											}
										}
									}

									// update sq
									if (isset($ex['selectedSQ']))
									{
										$exercise['exer_sq'] = $ex['selectedSQ']['name'];

										if (isset($ex['selectedSQ']['selectedSet']))  {
											$exercise['exer_sets'] = $ex['selectedSQ']['selectedSet'];
										}

										if (isset($ex['selectedSQ']['selectedRep']))  {
											$exercise['exer_rep'] = $ex['selectedSQ']['selectedRep'];
										}

										if (isset($ex['selectedSQ']['selectedTempo']))  {
											$exercise['exer_tempo'] = $ex['selectedSQ']['selectedTempo'];
										}

										if (isset($ex['selectedSQ']['selectedRest']))  {
											$exercise['exer_rest'] = $ex['selectedSQ']['selectedRest'];
										}
									}

									$exercise['hash'] = $ex['hash'];

									$wpdb->update('workout_exercises_tbl', $exercise, array('exer_ID' => (int) $ex['exer_ID']));

								}

							}

						} else {

							$exercise = [
								'exer_day_ID' => $d['wday_ID'],
								'exer_workout_ID' => $workout['workout_ID']
							];

							if (isset($ex['selectedPart']))
							{
								$exercise['exer_body_part'] = $ex['selectedPart']['part'];

								if (isset($ex['selectedPart']['selectedType']))
								{
									$exercise['exer_type'] = $ex['selectedPart']['selectedType']['type'];

									if (isset($ex['selectedPart']['selectedType']['selectedExercise1']))
									{
										$exercise['exer_exercise_1'] = $ex['selectedPart']['selectedType']['selectedExercise1'];
									}

									if (isset($ex['selectedPart']['selectedType']['selectedExercise2']))
									{
										$exercise['exer_exercise_2'] = $ex['selectedPart']['selectedType']['selectedExercise2'];
									}

									if (isset($ex['selectedPart']['selectedType']['selectedImplementation1']))
									{
										$exercise['exer_impl1'] = $ex['selectedPart']['selectedType']['selectedImplementation1'];
									}
								}
							}


							if (isset($ex['selectedSQ']))
							{
								$exercise['exer_sq'] = $ex['selectedSQ']['name'];

								if (isset($ex['selectedSQ']['selectedSet']))  {
									$exercise['exer_sets'] = $ex['selectedSQ']['selectedSet'];
								}

								if (isset($ex['selectedSQ']['selectedRep']))  {
									$exercise['exer_rep'] = $ex['selectedSQ']['selectedRep'];
								}

								if (isset($ex['selectedSQ']['selectedTempo']))  {
									$exercise['exer_tempo'] = $ex['selectedSQ']['selectedTempo'];
								}

								if (isset($ex['selectedSQ']['selectedRest']))  {
									$exercise['exer_rest'] = $ex['selectedSQ']['selectedRest'];
								}
							}

							$exercise['hash'] = $ex['hash'];
							$wpdb->insert('workout_exercises_tbl', $exercise);
						}

					}
				}

				if (isset($d['clients']))
				{
					//dd($d['clients']);
					foreach($d['clients'] as $client)
					{
							$clientQuery = "SELECT * FROM workout_day_clients_tbl WHERE workout_client_dayID={$d['wday_ID']} AND workout_client_workout_ID={$workout['workout_ID']} AND workout_clientID={$client['ID']}";
							$result = $wpdb->get_results($clientQuery, OBJECT);

							// if theres no client
							if(count($result) <= 0)
							{
								$newMClient = array(
									'workout_client_dayID' => (int) $d['wday_ID'],
									'workout_client_workout_ID' => (int) $workout['workout_ID'],
									'workout_clientID' => (int) $client['ID'],
								);

								if (isset($client['date_availability']) && (int) $client['date_availability'] > 0) {
									$scheduleDate = new \Carbon\Carbon($client['date_availability']);
									$newMClient['workout_day_availability'] = $scheduleDate->dayOfWeek;
									$newMClient['workout_client_schedule'] = $scheduleDate->format('Y-m-d h:i:s');
								}
								// insert the new client id
								$wpdb->insert('workout_day_clients_tbl', $newMClient);
							} else {

								$mUpdate = [];

								if (isset($client['date_availability']) && (int) $client['date_availability'] > 0)
								{
									$scheduleDate = new \Carbon\Carbon($client['date_availability']);
									$mUpdate = array(
										'workout_day_availability' => $scheduleDate->dayOfWeek,
										'workout_client_schedule' => $scheduleDate->format('Y-m-d h:i:s')
									);
								}

								$wpdb->update(
									'workout_day_clients_tbl',
									$mUpdate,
									array( 'workout_clientID' => $client['ID'],
										'workout_client_dayID' => (int) $d['wday_ID'],
										'workout_client_workout_ID' => (int) $workout['workout_ID'],
									)
								);
							}

							// insert assignment exercises and sets

							if (isset($client['exercises']))
							{

								$exHashes = implode("','", array_column($client['exercises'], 'hash'));
								$clientExercisesQuery = "SELECT * FROM workout_exercises_tbl WHERE hash in ('{$exHashes}')";
								//	dd($clientExercisesQuery);
								$clientExercisesResult = $wpdb->get_results($clientExercisesQuery, ARRAY_A);
								//dd($clientExercisesResult);
								$exIds = implode(",", array_column($clientExercisesResult, 'exer_ID'));
								$clientAssignmentsQuery = "SELECT * FROM workout_client_exercise_assignments WHERE exercise_id in ({$exIds}) AND client_id=".(int) $client['ID'];

								$clientAssignmentsResult = $wpdb->get_results($clientAssignmentsQuery, ARRAY_A);
								$assignmentIds = implode(",", array_column($clientAssignmentsResult, 'id'));

								$wpdb->query( "DELETE FROM `workout_client_exercise_assignment_sets` WHERE `assignment_id` IN ({$assignmentIds})");
								$wpdb->query( "DELETE FROM `workout_client_exercise_assignments` WHERE `exercise_id` IN ({$exIds}) AND client_id=".(int) $client['ID']);

								foreach ($client['exercises'] as $ex)
								{
									$exQuery = "SELECT * FROM workout_exercises_tbl WHERE hash='{$ex['hash']}' LIMIT 1";
									$exerciseResult = $wpdb->get_results($exQuery, OBJECT);

									if (count($exerciseResult) > 0)
									{

										$m = $exerciseResult[0];

										$wpdb->insert('workout_client_exercise_assignments',
											array(
												'exercise_id' => (int) $m->exer_ID,
												'client_id' => (int) $client['ID']
											)
										);

										$assignmentId = $wpdb->insert_id;

										if (isset($ex['assignment_sets']))
										{
											//dd($assignmentId);
											foreach ($ex['assignment_sets'] as $key => $set)
											{
												$wpdb->insert('workout_client_exercise_assignment_sets',
													array(
														'assignment_id' => (int) $assignmentId,
														'weight' => $set['weight'],
														'seq' => $key + 1
													)
												);
											}
										}
									}
								}
							}

					}
				}
			}
			else { /* insert if there is no existing day */

				$wpdb->insert('workout_days_tbl',
					array(
						'wday_workout_ID' => $workout['workout_ID'],
						'wday_name' => $d['wday_name'],
						'wday_order' => (int) $d['wday_order']
					)
				);

				$dayId = $wpdb->insert_id;

				if ($d['exercises'])
				{
					foreach($d['exercises'] as $ex)
					{

						$exercise = [
							'exer_day_ID' => $dayId,
							'exer_workout_ID' => (int) $workout['workout_ID'],
							'hash' => $ex['hash']
						];

						if (isset($ex['selectedPart']))
						{
							$exercise['exer_body_part'] = $ex['selectedPart']['part'];

							if (isset($ex['selectedPart']['selectedType']))
							{
								$exercise['exer_type'] = $ex['selectedPart']['selectedType']['type'];

								if (isset($ex['selectedPart']['selectedType']['selectedExercise1']))
								{
									$exercise['exer_exercise_1'] = $ex['selectedPart']['selectedType']['selectedExercise1'];
								}

								if (isset($ex['selectedPart']['selectedType']['selectedExercise2']))
								{
									$exercise['exer_exercise_2'] = $ex['selectedPart']['selectedType']['selectedExercise2'];
								}

								if (isset($ex['selectedPart']['selectedType']['selectedImplementation1']))
								{
									$exercise['exer_impl1'] = $ex['selectedPart']['selectedType']['selectedImplementation1'];
								}
							}
						}


						if (isset($ex['selectedSQ']))
						{
							$exercise['exer_sq'] = $ex['selectedSQ']['name'];

							if (isset($ex['selectedSQ']['selectedSet']))  {
								$exercise['exer_sets'] = $ex['selectedSQ']['selectedSet'];
							}

							if (isset($ex['selectedSQ']['selectedRep']))  {
								$exercise['exer_rep'] = $ex['selectedSQ']['selectedRep'];
							}

							if (isset($ex['selectedSQ']['selectedTempo']))  {
								$exercise['exer_tempo'] = $ex['selectedSQ']['selectedTempo'];
							}

							if (isset($ex['selectedSQ']['selectedRest']))  {
								$exercise['exer_rest'] = $ex['selectedSQ']['selectedRest'];
							}
						}

						$wpdb->insert('workout_exercises_tbl', $exercise);

					}
				}

				if (isset($d['clients']))
				{
					foreach($d['clients'] as $client)
					{

						if ((int) $client['date_availability'] > 0)
						{
							$scheduleDate = new \Carbon\Carbon($client['date_availability']);
							// insert the new client id
							$wpdb->insert('workout_day_clients_tbl',
								array(
									'workout_client_dayID' => $dayId,
									'workout_client_workout_ID' => (int) $workout['workout_ID'],
									'workout_clientID' => (int) $client['ID'],
									'workout_day_availability' => $scheduleDate->dayOfWeek,
									'workout_client_schedule' => $scheduleDate->format('Y-m-d h:i:s')
								)
							);

							if (isset($client['exercises']))
							{

								foreach ($client['exercises'] as $ex)
								{
									$exQuery = "SELECT * FROM workout_exercises_tbl WHERE hash='{$ex['hash']}' LIMIT 1";
									$exerciseResult = $wpdb->get_results($exQuery, OBJECT);

									if (count($exerciseResult) > 0)
									{

										$m = $exerciseResult[0];

										$wpdb->insert('workout_client_exercise_assignments',
											array(
												'exercise_id' => (int) $m->exer_ID,
												'client_id' => (int) $client['ID']
											)
										);

//									dd(
//										array(
//											'exercise_id' => (int) $m->exer_ID,
//											'client_id' => (int) $client['ID']
//										)
//									);


										$assignmentId = $wpdb->insert_id;
										//dd($assignmentId);
										if (isset($ex['assignment_sets']))
										{

											foreach ($ex['assignment_sets'] as $key => $set)
											{
												$wpdb->insert('workout_client_exercise_assignment_sets',
													array(
														'assignment_id' => (int) $assignmentId,
														'weight' => $set['weight'],
														'seq' => $key + 1
													)
												);
											}
										}
									}
								}
							}
						}

					}
				}
			}
		}
	}

	return $workout;
}

function workOutGetClients()
{
	global $wpdb;
	$querystr = "SELECT * FROM wp_users";
	$users = $wpdb->get_results($querystr, OBJECT);
	$outputList = [];

	$listOfClients = getClientsOfTrainer(wp_get_current_user());

	foreach($users as $user) {
		foreach($listOfClients as $listOfClient){
			if($listOfClient->ID == $user->ID){
				if(in_array('client', get_userdata($user->ID)->roles)) {
					$outputList[] = $user;
				}
			}
		}
	}

	return $outputList;
}

function workoutGetTrainerExercises($userId)
{
	global $wpdb;
	$workOutQuery = "SELECT * FROM workout_tbl WHERE workout_trainer_ID=".(int) $userId;
	$result = $wpdb->get_results($workOutQuery, ARRAY_A);

	if (count($result) > 0)
	{
		$workouts = $result;
		$workoutIds = implode(",", array_column($workouts, 'workout_ID'));

		$exercisesQuery = "SELECT * FROM workout_exercises_tbl WHERE exer_workout_ID IN ({$workoutIds})";
		$exercises = $wpdb->get_results($exercisesQuery, ARRAY_A);

		return $exercises;
	}

	return [];

}

function workoutClientsList($workout_ID)
{
	require_once $_SERVER['DOCUMENT_ROOT'] . '/vendor/autoload.php';
	global $wpdb;

	$querystr = 'SELECT * FROM `workout_day_clients_tbl` WHERE workout_client_workout_ID = '.$workout_ID.' GROUP BY workout_clientID';
	$workout_clients = $wpdb->get_results($querystr, OBJECT);

	return $workout_clients;

}

function workOutUserList($userId)
{
	require_once $_SERVER['DOCUMENT_ROOT'] . '/vendor/autoload.php';

	global $wpdb;
	$querystr = "SELECT * FROM workout_tbl WHERE workout_trainer_ID =".$userId." ORDER by workout_ID desc";
	$workouts = $wpdb->get_results($querystr, OBJECT);
	//dd($workouts);
	return $workouts;
}
//$querystr = "SELECT * FROM workout_tbl WHERE workout_ID=".$workoutId." LIMIT 1";
//$result = $wpdb->get_results($querystr, ARRAY_A);

function workoutGetClientWorkouts($clientId)
{
	require_once $_SERVER['DOCUMENT_ROOT'] . '/vendor/autoload.php';

	global $wpdb;
	$todayQuery = "SELECT DISTINCT(workout_client_workout_ID), workout_client_dayID, workout_isDone FROM workout_day_clients_tbl WHERE DATE(`workout_client_schedule`) = CURDATE() AND workout_clientID={$clientId}";
	$todayClientWorkouts = $wpdb->get_results($todayQuery, OBJECT);
	$upcomingWorkouts = [];

	foreach ($todayClientWorkouts as $k => $w)
	{
		$workoutQuery = "SELECT * FROM workout_tbl WHERE workout_ID=".$w->workout_client_workout_ID." LIMIT 1";
		$result = $wpdb->get_results($workoutQuery, OBJECT);

		if (count($result) > 0)
		{
			$todayClientWorkouts[$k]->workout = $result[0];
		}

		$dayQuery = "SELECT * FROM workout_days_tbl WHERE wday_ID=".$w->workout_client_dayID." LIMIT 1";
		$result = $wpdb->get_results($dayQuery, OBJECT);

		if (count($result) > 0)
		{
			$todayClientWorkouts[$k]->day = $result[0];
		}
	}

	$nextQuery = "SELECT DISTINCT(workout_client_workout_ID), workout_client_dayID FROM workout_day_clients_tbl WHERE DATE(`workout_client_schedule`) > CURDATE() AND workout_clientID={$clientId}";
	$nextClientWorkouts = $wpdb->get_results($nextQuery, OBJECT);

	foreach ($nextClientWorkouts as $k => $w)
	{
		$workoutQuery = "SELECT * FROM workout_tbl WHERE workout_ID=".$w->workout_client_workout_ID." LIMIT 1";
		$result = $wpdb->get_results($workoutQuery, OBJECT);

		if (count($result) > 0)
		{
			$nextClientWorkouts[$k]->workout = $result[0];
		}

		$dayQuery = "SELECT * FROM workout_days_tbl WHERE wday_ID=".$w->workout_client_dayID." LIMIT 1";
		$result = $wpdb->get_results($dayQuery, OBJECT);

		if (count($result) > 0)
		{
			$nextClientWorkouts[$k]->day = $result[0];
		}
	}

	$output = [
		'todayWorkouts' => $todayClientWorkouts,
		'upcomingWorkouts' => $nextClientWorkouts
	];

//	dd($output);
	return $output;
}

function workOutGet($workoutId)
{
	require_once $_SERVER['DOCUMENT_ROOT'] . '/vendor/autoload.php';

	global $wpdb;

	// get workout
	$querystr = "SELECT * FROM workout_tbl WHERE workout_ID=".$workoutId." LIMIT 1";
	$result = $wpdb->get_results($querystr, ARRAY_A);

	$days = [];
	if(count($result) >= 1)
	{
		$workout = $result[0];

		// get workout days
		$querystr = "SELECT * FROM workout_days_tbl WHERE wday_workout_ID=".$workout['workout_ID'];
		$days = $wpdb->get_results($querystr, ARRAY_A);

		foreach($days as $key => $d)
		{
			// get workout exercises
			$exercisesQuery = "SELECT * FROM workout_exercises_tbl WHERE exer_day_ID=".$d['wday_ID'];
			$exercises = $wpdb->get_results($exercisesQuery, ARRAY_A);

			// get workout assigned clients
			$clientsQuery = "SELECT * FROM workout_day_clients_tbl WHERE workout_client_dayID=".$d['wday_ID'];
			$clients = $wpdb->get_results($clientsQuery, ARRAY_A);

			$userClients = [];

			foreach($clients as $c)
			{
				// get clients from users
				$userQuery = "SELECT * FROM wp_users WHERE ID=".$c['workout_clientID'] . " LIMIT 1";
				$userResult = $wpdb->get_results($userQuery, ARRAY_A);

				if(count($userResult) >= 1)
				{
					$client = $userResult[0];
					$client['day_availability'] = $c['workout_day_availability'];
					$client['date_availability'] = explode(" ", $c['workout_client_schedule'])[0];
					$client['exercises'] = [];

					foreach ($exercises as $ex)
					{
						$assignQuery = "SELECT * FROM workout_client_exercise_assignments WHERE client_id=" . (int) $client['ID'] . " AND exercise_id=". (int) $ex['exer_ID'] . " LIMIT 1";
						$assignResult = $wpdb->get_results($assignQuery, ARRAY_A);
						$ex['query'] = $assignQuery;
						if (count($assignResult) > 0) {

							$assignSetsQuery = "SELECT * FROM workout_client_exercise_assignment_sets WHERE assignment_id=" . $assignResult[0]['id'];
							$assignSetsResult = $wpdb->get_results($assignSetsQuery, ARRAY_A);

							$ex['assignment_sets'] = $assignSetsResult;
							$client['exercises'][] = $ex;
						}
					}

					$userClients[] = $client;
				}
			}

			$days[$key]['clients'] = $userClients;
			$days[$key]['exercises'] = $exercises;
		}

		$workout['days'] = $days;

		return $workout;
	}

	return null;
}

function workoutClientWorkoutWithDay($workoutId, $dayId, $clientId)
{
	require_once $_SERVER['DOCUMENT_ROOT'] . '/vendor/autoload.php';

	global $wpdb;
	$querystr = "SELECT * FROM workout_day_clients_tbl WHERE workout_client_dayID={$workoutId} AND workout_client_workout_ID={$dayId} LIMIT 1";
	$result = $wpdb->get_results($querystr, OBJECT);

	if (count($result) >= 1)
	{
		$clientWorkout = $result[0];

		$queryWorkout = "SELECT * FROM workout_tbl WHERE workout_ID={$clientWorkout->workout_client_workout_ID} LIMIT 1";
		$workout = $wpdb->get_results($queryWorkout, OBJECT);

		if (count($workout) >= 1)
		{
			$clientWorkout->workout = $workout[0];
		}

		$queryDay = "SELECT * FROM workout_days_tbl WHERE wday_ID={$clientWorkout->workout_client_dayID} LIMIT 1";
		$day = $wpdb->get_results($queryDay, OBJECT);

		if (count($workout) >= 1)
		{
			$clientWorkout->day = $day[0];
		}

		$clientWorkout->exercises = [];
		$queryExercises =  "SELECT * FROM workout_exercises_tbl WHERE exer_workout_ID={$clientWorkout->workout_client_workout_ID} AND exer_day_ID={$workoutId}";
		$exercises = $wpdb->get_results($queryExercises, ARRAY_A);
		//dd($queryExercises);
		if (count($exercises) >= 1) {

			foreach ($exercises as $k => $ex)
			{
				$assignQuery = "SELECT * FROM workout_client_exercise_assignments WHERE client_id=" . (int) $clientId . " AND exercise_id=". (int) $ex['exer_ID'] . " LIMIT 1";
				$assignResult = $wpdb->get_results($assignQuery, ARRAY_A);

				if (count($assignResult) > 0) {

					$assignSetsQuery = "SELECT * FROM workout_client_exercise_assignment_sets WHERE assignment_id=" . $assignResult[0]['id'];
					$assignSetsResult = $wpdb->get_results($assignSetsQuery, ARRAY_A);

					$exercises[$k]['sets'] = $assignSetsResult;
					$exercises[$k]['setss'] = $assignSetsResult;
				}
			}

			$clientWorkout->exercises = $exercises;
		}

	}

	return $clientWorkout;
}

function workOutDelete($workoutId)
{
	require_once $_SERVER['DOCUMENT_ROOT'] . '/vendor/autoload.php';

	global $wpdb;
	$querystr = "SELECT * FROM workout_tbl WHERE workout_ID=".$workoutId." LIMIT 1";
	$result = $wpdb->get_results($querystr, ARRAY_A);

	if(count($result) >= 1)
	{
		$workout = $result[0];

		$querystr = "SELECT * FROM workout_days_tbl WHERE wday_workout_ID=".$workout['workout_ID'];
		$days = $wpdb->get_results($querystr, ARRAY_A);

		foreach($days as $key => $d)
		{
			/* days table name workout_days_tbl with primary key > wday_ID */

			/* delete workout_exercises_tbl target exer_day_ID */
			$wpdb->delete('workout_exercises_tbl', array('exer_day_ID' => (int) $d['wday_ID']));

			/* delete workout_day_clients_tbl target workout_client_dayID*/
			$wpdb->delete('workout_day_clients_tbl', array('workout_client_dayID' => (int) $d['wday_ID']));

			/* delete workout_client_exercises_logs target day_id */
			$wpdb->delete('workout_client_exercises_logs', array('day_id' => (int) $d['wday_ID']));
		}

		/* delete workout_days_tbl target wday_ID */
		$wpdb->delete('workout_days_tbl', array('wday_workout_ID' => (int) $workout['workout_ID']));

		/* delete workout */
		$wpdb->delete('workout_tbl', array('workout_ID' => (int) $workout['workout_ID']));

		return $workout;
	}

	return null;
}

function workOutExerciseOptions()
{
	require_once $_SERVER['DOCUMENT_ROOT'] . '/vendor/autoload.php';

	global $wpdb;
	$querystr = "SELECT * FROM workout_exercise_options_tbl";
	$options = $wpdb->get_results($querystr, ARRAY_A);

	foreach($options as $key => $option)
	{
		$options[$key]['options'] = json_decode($option['options']);
	}
	//dd($options);
	return $options;

}

function workOutExerciseStrengthQualitiesOptions()
{
	require_once $_SERVER['DOCUMENT_ROOT'] . '/vendor/autoload.php';

	global $wpdb;
	$querystr = "SELECT * FROM workout_exercise_strength_qualities_tbl";
	$options = $wpdb->get_results($querystr, ARRAY_A);

	foreach($options as $key => $option)
	{
		$options[$key]['options'] = json_decode($option['options']);
	}
	//dd($options);
	return $options;
}

// END ENQUEUE PARENT ACTION


/* api action */

add_action( 'rest_api_init', 'wpc_register_wp_api_endpoints' );
function wpc_register_wp_api_endpoints() {
	register_rest_route( 'v1', 'client/get', array(
		'methods' => 'GET',
		'callback' => 'workoutClientExerciseLogs',
	));

	register_rest_route( 'v1', 'client/process', array(
		'methods' => 'POST',
		'callback' => 'workoutCreateClientExerciseLog',
	));

	register_rest_route( 'v1', 'hash', array(
		'methods' => 'GET',
		'callback' => 'workoutGenerateHash',
	));

	register_rest_route( 'v1', 'client/upload', array(
		'methods' => 'POST',
		'callback' => 'smUpload',
	));

	/* api used to update a note for a program */
	register_rest_route( 'v1', 'program-note', array(
		'methods' => 'POST',
		'callback' => 'workoutUpdateNote',
	));

	/* api used to update a note for a program */
	register_rest_route( 'v1', 'program-duplicate', array(
		'methods' => 'POST',
		'callback' => 'workoutDuplicate',
	));
}

function smUpload()
{
	require_once $_SERVER['DOCUMENT_ROOT'] . '/wp-customs/User.php';

	/* $u = wp_get_current_user();

	$upload_file = wp_handle_upload($_FILES["myFile"], array('test_form' => false), date('Y/m'));
	var_dump($upload_file);
	
	$wp_upload_dir = wp_upload_dir();
	$guid = $wp_upload_dir['baseurl'] . "/" . _wp_relative_upload_path( $upload_file );
	
	$attachment = array(
		'post_mime_type' => $_FILES["myFile"]['type'],
		'guid' => $guid,
		'post_title' => 'Uploaded: ' . $upload_file['file'],
		'post_content' => '',
		'post_author' => $u->ID,
		'post_status' => 'inherit',
		'post_date' => date('Y-m-d H:i:s'),
		'post_date_gmt' => date('Y-m-d H:i:s')
	);
	
	$attach_id = wp_insert_attachment($attachment, $upload_file['file']);
	$meta = wp_generate_attachment_metadata($attach_id,$upload_file['file']);
	wp_update_attachment_metadata($meta);
	
	$upload_feedback = false;
	
	return $attach_id; */

	/* $image = New ImageMeta; */

	$data = [];

	if (isset($_POST['userId']))
	{
		$user = User::find($_POST['userId']);

		if ($user)
		{
			if (isset($_POST['gym_profile_portrait'])) {
				$user->forGymVal = ['gym_profile_portrait' => true];
			}

			if (isset($_POST['gym_profile_landscape'])) {
				$user->forGymVal = ['gym_profile_landscape' => true];
			}

			if (isset($_POST['trainer-profile'])) {
				$user->forTrainerPhoto = true;
			}

			$data = $user->uploadFile($_FILES['myFile']);

			// add user activity log
			if (isset($_POST['health-doc'])) {
				require_once getcwd() . '/wp-customs/Log.php';
				Log::insert(['type' => 'CLIENT_UPLOAD_DOCUMENT', 'file' => $data['uploadedFile']], $user);
			}
		}
	}

	return ['result' => true, 'data' => $data];
}

function workoutUpdateNote()
{
	require_once $_SERVER['DOCUMENT_ROOT'] . '/vendor/autoload.php';
	require_once getcwd() . '/wp-customs/Program.php';
	require_once getcwd() . '/wp-customs/User.php';
	require_once getcwd() . '/wp-customs/Log.php';

	$program = Program::find($_POST['workout_id']);

	$user = User::find($_POST['user_id']);

	if ($program && $user)
	{
		$program->addNote($_POST);

		switch (getMembershipLevel(get_userdata($user->id)))
		{
			case 'gym': {
				Log::insert(
					['type' => 'GYM_UPDATE_NOTE', 'workout' => $program],
					$user
				);
			} break;

			case 'trainer': {
	
				Log::insert(
					['type' => 'TRAINER_UPDATE_NOTE', 'workout' => $program],
					$user
				);
			} break;

		}

		return ['result' => true, 'data' => $program->getNote()];
	}

	return ['result' => false, 'data' => NULL];
}

function workoutDuplicate()
{
	//print_r($_POST);
	require_once $_SERVER['DOCUMENT_ROOT'] . '/vendor/autoload.php';
	require_once getcwd() . '/wp-customs/Program.php';
	require_once getcwd() . '/wp-customs/User.php';

	if (isset($_POST['program_id']) && isset($_POST['user_id']))
	{
		$user = User::find($_POST['user_id']);
		$clonedProgram = Program::duplicate($_POST['program_id'],$user);

		if ($clonedProgram) {
			return ['result' => true, 'data' => $clonedProgram];
		}
	}

	return ['result' => false, 'data' => NULL];
}

function workoutClientExerciseLogs() {

	global $wpdb;

	$data = $_REQUEST;
	$exerciseId = (int) $data['exerciseId'];
	$userId = (int) $data['user_id'];

	$queryExercise = "SELECT * FROM workout_client_exercises_logs WHERE exercise_id={$exerciseId} AND client_id=$userId";
	$result = $wpdb->get_results($queryExercise, ARRAY_A);

	if (count($result) > 0)
	{
		$exerciseLog = $result[0];
		$querySet = "SELECT * FROM workout_client_set_logs WHERE exercise_log_id={$exerciseLog['id']} AND client_id=$userId";
		$sets = $wpdb->get_results($querySet, ARRAY_A);

		$exerciseLog['sets'] = $sets;

		return $exerciseLog;
	}

	return [];
}

function workoutCreateClientExerciseLog()
{

	global $wpdb;

	require_once $_SERVER['DOCUMENT_ROOT'] . '/vendor/autoload.php';
	$data = json_decode( file_get_contents('php://input') , true);
	//dd($data);
	$exerciseId = (int) $data['exer_ID'];
	$userId = (int) $data['user_id'];

	/* check if it has already client exercise */

	$queryExercise = "SELECT * FROM workout_client_exercises_logs WHERE exercise_id={$exerciseId}";
	$result = $wpdb->get_results($queryExercise, ARRAY_A);

	if (count($result) > 0) // it has already exercise log
	{
		$exerciseLogId = $result[0]['id'];

	} else {

		$wpdb->insert('workout_client_exercises_logs',
			array(
				'exercise_id' => (int) $data['exer_ID'],
				'client_id'   => $userId,
				'day_id' => (int) $data['exer_day_ID'],
				'workout_id' => (int) $data['exer_workout_ID']
			)
		);

		$exerciseLogId = $wpdb->insert_id;
	}

	if (isset($data['sets']))
	{
		foreach ($data['sets'] as $set)
		{
			$seq = (int) $set['seq'];

			/* check if the set is exists in workout_client_set_logs */
			$querySet = "SELECT * FROM workout_client_set_logs WHERE client_id={$userId} AND exercise_log_id={$exerciseLogId} AND seq={$seq}";
			$result = $wpdb->get_results($querySet, ARRAY_A);

			if (count($result) > 0)
			{
				$currentSet = $result[0];
				// update the set
				$wpdb->update(
					'workout_client_set_logs',
					array(
						//	'reps' 		  => $set['reps'],
						//'isMet' 	  => (int) $set['isMet'] ? true : false,
						//'isDone'      => $set['isMet'],
					),
					array('id' => $currentSet['id'])
				);

			} else {
				// log insert exercise log into workout_client_exercises_logs

				/* insert set logs */
				$wpdb->insert('workout_client_set_logs',
					array(
						'exercise_log_id' => $exerciseLogId,
						//'reps' 		  => $set['reps'],
						//	'isMet' 	  => (int) $set['isMet'] ? true : false,
						//'isDone'      => $set['isMet'],
						'seq'		  => (int) $set['seq'],
						'client_id'   => $userId
					)
				);
			}
		}
	}

	// update the workout_day_clients_tbl table for flagging isDone

	$wpdb->update(
		'workout_day_clients_tbl',
		array('workout_isDone' => TRUE),
		array(
			'workout_client_dayID' => (int) $data['exer_day_ID'],
			'workout_client_workout_ID' => (int) $data['exer_workout_ID'],
			'workout_clientID' => $userId
		)
	);
}

function workoutCreateClientSetLog()
{

	global $wpdb;

	require_once $_SERVER['DOCUMENT_ROOT'] . '/vendor/autoload.php';
	$data = json_decode( file_get_contents('php://input') , true);

	$exerciseId = (int) $data['exer_ID'];
	$userId = (int) $data['user_id'];

	/* check if it has already client exercise */

	$queryExercise = "SELECT * FROM workout_client_exercises_logs WHERE exercise_id={$exerciseId}";
	$result = $wpdb->get_results($queryExercise, ARRAY_A);

	if (count($result) > 0) // it has already exercise log
	{
		$exerciseLogId = $result[0]['id'];

	} else {

		$wpdb->insert('workout_client_exercises_logs',
			array(
				'exercise_id' => (int) $data['exer_ID'],
				'client_id'   => $userId,
				'day_id' => (int) $data['exer_day_ID'],
				'workout_id' => (int) $data['exer_workout_ID']
			)
		);

		$exerciseLogId = $wpdb->insert_id;
	}

	$seq = (int) $data['currentSet']['seq'];
	/* check if the set is exists in workout_client_set_logs */
	$querySet = "SELECT * FROM workout_client_set_logs WHERE client_id={$userId} AND exercise_log_id={$exerciseLogId} AND seq={$seq}";
	$result = $wpdb->get_results($querySet, ARRAY_A);

	if (count($result) > 0)
	{
		$currentSet = $result[0];
		// update the set
		$wpdb->update(
			'workout_client_set_logs',
			array(
				'reps' 		  => $data['currentSet']['reps'],
				'isMet' 	  => (int) $data['currentSet']['isMet'] ? true : false,
				'isDone'      => $data['currentSet']['isMet'],
			),
			array('id' => $currentSet['id'])
		);

	} else {
		// log insert exercise log into workout_client_exercises_logs

		/* insert set logs */
		$wpdb->insert('workout_client_set_logs',
			array(
				'exercise_log_id' => $exerciseLogId,
				'reps' 		  => $data['currentSet']['reps'],
				'isMet' 	  => (int) $data['currentSet']['isMet'] ? true : false,
				'isDone'      => $data['currentSet']['isMet'],
				'seq'		  => $seq,
				'client_id'   => $userId
			)
		);
	}
}

function workoutGenerateHash()
{
	if (isset($_GET['sets']))
	{
		$hashes = [];
		$sets = (int) $_GET['sets'];

		for ($i=0; $i<$sets; $i++)
		{
			$m=microtime(true);
			$hashes[] = sprintf("%8x%05x",floor($m),($m-floor($m))*1000000);
		}

		return ['set_of_hash' => $hashes];
	}

	$m=microtime(true);
	return ['hash' => sprintf("%8x%05x",floor($m),($m-floor($m))*1000000)];
}

//Triggered when first visit in dashboard page
function triggerFirstLogin($uinfo){
	$first_login = get_user_meta($uinfo->ID, 'prefix_first_login', true);
	if( $first_login == '1' ) {		 
		return true;
    }else{
		return false;
	}
}
//Get Membership Level
function getMembershipLevel($u){
	$pparr = pmpro_getMembershipLevelForUser($u->ID);
	$p_lvl = "";
	if(!empty($pparr)){
		$p_lvl = strtolower($pparr->name);
	}

	$u_lvl = "";
	if($p_lvl == ""){
		$uroles = array();
		if(!empty($u->roles))
			$uroles = $u->roles;
		
		if(in_array('trainer', $uroles)){
			$p_lvl = "trainer";
		}elseif(in_array('client', $uroles)){
			$p_lvl = "client";
		}elseif(in_array('gym', $uroles)){
			$p_lvl = "gym";
		}
	}

	return $p_lvl;
}
//Add user_meta after registration
add_action( 'user_register', 'first__login_registration', 10, 1 );
function first__login_registration( $user_id ) {  update_user_meta($user_id, 'prefix_first_login', '1'); }
//Disallow users to access administrator
function wpse23007_redirect(){
  if( is_admin() && !defined('DOING_AJAX') && ( current_user_can('subscriber') || current_user_can('trainer') || current_user_can('gym') || current_user_can('client') ) ){
    wp_redirect(home_url());
    exit;
  }
}
add_action('init','wpse23007_redirect');

/*Trainer Edit Profile*/
function getTrainerInfo($u){
	$umeta = get_user_meta($u->ID);		
	$tinfo = array();
	
	if(isset($umeta['sm_bio']))
		$tinfo['ubio'] = $umeta['sm_bio'][0];
	else
		$tinfo['ubio'] = "";
	if(isset($umeta['sm_education']))
		$tinfo['uedu'] = $umeta['sm_education'][0];
	else
		$tinfo['uedu'] = "";
	if(isset($umeta['sm_specialties']))
		$tinfo['uspe'] = $umeta['sm_specialties'][0];
	else
		$tinfo['uspe'] = "";
	if(isset($umeta['sm_availability']))
		$tinfo['uava'] = $umeta['sm_availability'][0];
	else
		$tinfo['uava'] = "";
	if(isset($umeta['sm_experience']))
		$tinfo['uexp'] = $umeta['sm_experience'][0];
	else
		$tinfo['uexp'] = "";
	
	return $tinfo;
}
/*Gym Edit Profile*/
function getGymInfo($u){
	$umeta = get_user_meta($u->ID);		
	$tinfo = array();
	
	if(isset($umeta['sm_gym_about']))
		$tinfo['sm_gym_about'] = $umeta['sm_gym_about'][0];
	else
		$tinfo['sm_gym_about'] = "";
	if(isset($umeta['sm_gym_color']))
		$tinfo['sm_gym_color'] = $umeta['sm_gym_color'][0];
	else
		$tinfo['sm_gym_color'] = "";
	
	return $tinfo;
}
/*get Workout Day Name / Workout Name*/
function getWorkoutDayName($wdid){
	global $wpdb;
	$wdayQ = $wpdb->get_results('SELECT * FROM workout_days_tbl WHERE wday_ID = ' .$wdid, OBJECT);
	
	return $wdayQ[0]->wday_name;
}
/*Check user id exists*/
function user_id_exists($user){
    global $wpdb;
    $count = $wpdb->get_var($wpdb->prepare("SELECT COUNT(*) FROM $wpdb->users WHERE ID = %d", $user));
    if($count == 1){ return true; }else{ return false; }
}
/*Get Goal %*/
function getGoalPerc($stats){
	$sta = array();
	$not_inc = ['id', 'type', 'client_id', 'updated_by', 'created_by', 'target_date', 'created_at', 'updated_at'];
	foreach($stats as $k2 => $v2){			
		foreach($v2 as $k => $v){
			if(!in_array($k, $not_inc)){
				if($k2 == "start"){
					$sta[$k]['sw'] = $v;				
				}elseif($k2 == "goal"){
					$sta[$k]['gw'] = $v;
				}else{
					$sta[$k]['cw'] = $v;
				}
			}
		}			
	}	
	return $sta;
}
/*calculate Percentage per bodyparts*/
function calcppbp($gw,$sw,$cw){
	if($gw == "")
		$gw = 0;
	if($sw == "")
		$sw = 0;
	if($cw == "")
		$cw =0;
	if($gw > $sw){//Gain									
		if($cw > $sw){
			if($cw >= $gw)
				$pp = 0;
			else
				$pp = ( ($sw - $cw) / ($gw - $sw) ) * 100;
		}elseif($cw < $sw){
			$pp = 0;
		}else{
			$pp = 0;
		}
		
	}elseif($gw < $sw){//Loss
		if($cw < $sw){
			if($cw <= $gw)
				$pp = 0;
			else
				$pp = ( ($sw - $cw) / ($gw - $sw) ) * 100;
		}elseif($cw > $sw){
			$pp = 0;
		}else{
			$pp = 0;
		}
	}elseif($gw == $sw && $gw != 0 && $sw != 0){
		$pp = 100;
	}else{
		$pp = 0;
	}	
	return $pp;
}
function getBPPercAvg($eachBPStats){ //Get Average Percentage on each Body Part
	$avgArr = array();
	foreach($eachBPStats as $v=>$sa){
		$gw = $sa['gw'];           
		$sw = $sa['sw'];         
		$cw = $sa['cw'];
		$pp = round(abs(calcppbp($gw, $sw ,$cw)));
		$avgArr[] = $pp;		
	}
	return round(abs(array_sum($avgArr)/count($avgArr)));
}
/*Messaging Recipient Function*/
function pushClientsToRecipient($u){
	$clients = getClientsOfTrainer($u);
	$r = array();
	if(empty($clients))
		$clients = array();
	foreach($clients as $client){
		$r[$client->user_login] = $client->roles[0];			
	}
	return $r;
}
function getRecipients($u){
	$plvl = getMembershipLevel($u);
	$r = array();
	if($plvl == 'trainer'){
		$pgym = checkPG($u->ID);
		if($pgym != ""){ //Under a Gym
			$gym = get_user_by('id',$pgym);
			$r = pushClientsToRecipient($u);
			$r[$gym->user_login] = getMembershipLevel($gym);			
		}else{ //Not Under a Gym
			$r = pushClientsToRecipient($u);
		}
	}elseif($plvl == 'gym'){
		$tog = get_user_meta($u->ID, 'trainers_of_gym', true);		
		foreach($tog as $t){
			$trainer = get_user_by('id', $t);
			$r[$trainer->user_login] = getMembershipLevel($trainer);
			$temp = pushClientsToRecipient($trainer);
			foreach($temp as $v=>$k)
				$r[$v] = $k;
		}
	}elseif($plvl=="client"){
		$pt = get_user_meta($u->ID, 'parent_trainer', true);
		if($pt != ""){
			$ptt = get_user_by('id',$pt);
			$gpgym = checkPG($pt);
			$r[$ptt->user_login] = getMembershipLevel($ptt);
			if($gpgym != ""){
				$gpt = get_user_by('id',$gpgym);
				$r[$gpt->user_login] = getMembershipLevel($gpt);
			}
		}
	}
	return $r;
}
function checkPG($uid){	
	return get_user_meta($uid, 'parent_gym', true);
}
function getParent($u){
	$uid = $u->ID;
	$pl = getMembershipLevel($u);
	//dd($pl);
	if($pl == "gym")
		return null;
	elseif($pl == "trainer"){
		$mgym = get_user_meta($uid, 'parent_gym', true);
		if($mgym)
			return array('gym' => $mgym);
	}elseif($pl == "client"){
		$pt = get_user_meta($uid, 'parent_trainer', true);
		return array('trainer'=> $pt, 'gym' => checkPG($pt));
	}else {
		$mgym = get_user_meta($uid, 'parent_gym', true);

		if($mgym)
			return array('gym' => $mgym);
	}
		return null;
}
add_filter( 'fep_form_fields', 'fep_cus_fep_form_fields' );
function fep_cus_fep_form_fields( $fields ){
    unset( $fields['message_content']['minlength'] );
    return $fields;
}
/* Check user if subscribed */
function checkSubscribed($u){
	if(!empty(pmpro_getMembershipLevelForUser($u->ID)))
		return true;
	else
		return false;
}
/*Get all Goal results*/
function getGoalResults($u){	
	global $wpdb;
	$statQ = 'SELECT * FROM workout_client_stats WHERE type="result" AND client_id = '. $u->ID;
	$stats = $wpdb->get_results($statQ, OBJECT);
	return $stats;
}
/*Get Client Latest Photo || Get Gym Logo*/
function getUserPhoto($u){
	global $wpdb;
	$umlvl = getMembershipLevel($u);
	$uid = $u->ID;
	$rimg = "";
	if($umlvl == "client"){
		$img = $wpdb->get_results( "SELECT * FROM workout_user_files WHERE user_id = {$uid} AND type='image' AND uploaded_at=(SELECT MAX(uploaded_at) FROM workout_user_files)", ARRAY_A);
		if(!empty($img))
			$rimg = home_url() . "/sm-files/{$uid}/" . $img[0]['file'];
		else
			$rimg = get_stylesheet_directory_uri() . "/accounts/images/personal-featured-image.jpg";
	}elseif($umlvl == "gym"){
		$img = $wpdb->get_results( "SELECT * FROM workout_user_files WHERE user_id={$uid} AND type='image_gym_landscape' ORDER BY id desc", ARRAY_A);
		if(!empty($img))
			$rimg = home_url() . "/sm-files/{$uid}/" . $img[0]['file'];
	}elseif($umlvl == "trainer")
		$rimg = get_stylesheet_directory_uri() . "/accounts/images/trainer-profile-image.png";

	return $rimg;
}
/*WP AJAX*/
add_action('wp_ajax_get_message_user_image', 'get_message_user_image');
add_action('wp_ajax_nopriv_get_message_user_image', 'get_message_user_image');

function get_message_user_image(){
	$uArr = $_POST['uArr'];
	$imgR = array();
	$cimg = array();
	foreach($uArr as $u){
		$user = get_user_by('login', $u);
		$uid = $user->ID;
		$up = getUserPhoto($user);
		
		if($up)
			$imgR[] = $up;
		else
			$imgR[] = "";	
	}
	echo json_encode(array('result' => $imgR));
	wp_die();	
}
/*Print Gym Color Theme*/
function printCss($a,$b,$c){
	$ctr=0;
	foreach($a as $v){
		$ctr++;
		echo '.gym-page '.$v;
		echo ($ctr!=count($a)) ? "," : "";		
	}
	if($b==1)
		echo '{background-color:'.$c.'}';
	elseif($b==2)
		echo '{background-color:#'.$c.';}';
	elseif($b==3)
		echo '{background-color:#'.$c.';border-color:#'.$c.';}';	
	elseif($b==4)
		echo '{color:#'.$c.';}';
	elseif($b==5)
		echo '{border-color:#'.$c.'!important;}';
}
/*Get Note*/
function getNote($uid){
	global $wpdb;
	$qNotes = 'SELECT * FROM workout_notes WHERE workout_id = '. $uid;
	return $wpdb->get_results($qNotes, ARRAY_A);
}
/*Get Program Details*/
function getProgramDeatils($pid){
	global $wpdb;
	$workoutsArr = [];
	$program = $wpdb->get_results('SELECT * FROM workout_tbl WHERE workout_ID = '. $pid, OBJECT);
	$workoutsArr['program_name'] = $program[0]->workout_name; // Program Name
	$workouts = $wpdb->get_results('SELECT * FROM workout_days_tbl WHERE wday_workout_ID = '. $pid, OBJECT); // Workout Query	
	
	if(!empty($workouts)){
		foreach($workouts as $workout){
			$wid = $workout->wday_ID;
			$wname = $workout->wday_name;		
			$workoutsArr[$wid]['workout_detail'][] = $workout;		
			$wExerQ = 'SELECT * FROM workout_exercises_tbl WHERE exer_day_ID ='.$wid;
			$wExers = $wpdb->get_results($wExerQ, OBJECT);	// Exercises
			
			if(empty($wExers))
				$workoutsArr[$wid]['exercises'][] = array();
			else{
				foreach($wExers as $wExer)		
					$workoutsArr[$wid]['exercises'][] = $wExer;
			}
		}		
	}
	
	return $workoutsArr;
}

/*AFTER SEND MESSAGE*/
function fep_test($e) {
	echo "<pre>";
	var_dump($_POST);
	echo "</pre>";
}
add_action('fep_action_message_after_send','fep_test');