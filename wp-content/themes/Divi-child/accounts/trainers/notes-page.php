<?php
require_once getcwd() . '/wp-customs/User.php';
$currentUser = User::find(get_current_user_id());
$currentUser->notes = $currentUser->getNotes();

//printVar($currentUser->notes);

$clientNotes = [];
$selectedClient = 0;
if(isset($_GET['notesof']))
	$selectedClient = $_GET['notesof'];

$clientAllWorkouts = workoutGetClientWorkouts($selectedClient)['allWorkouts'];
$clientAllWorkoutsIDs = [];
foreach($clientAllWorkouts as $caw){
	$clientAllWorkoutsIDs[] = $caw->workout_client_workout_ID;
}

if($selectedClient != 0 && !empty($clientAllWorkouts)){
	foreach($currentUser->notes as $note){
		$program_ID = $note['workout_ID']; //programID
		if(in_array($program_ID, $clientAllWorkoutsIDs))
			$clientNotes[] = $note;		
	}
	$currentUser->notes = $clientNotes;
}else
	$currentUser->notes = [];

?>
<script>
    var CURRENT_USER = <?php echo json_encode($currentUser); ?>;
    var ROOT_URL = '<?php echo get_site_url(); ?>';
</script>
<div class="main-content matchHeight" ng-app="smApp" ng-controller="notesController">
    <div ng-include src="workoutTemplate"></div>
</div>

<script type="text/javascript" src="<?php echo get_stylesheet_directory_uri() .'/js/angular/app.js'; ?>"></script>
<script type="text/javascript" src="<?php echo get_stylesheet_directory_uri() .'/js/angular/notesController.js'; ?>"></script>