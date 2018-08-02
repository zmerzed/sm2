<?php
$currentUser = User::find(wp_get_current_user()->ID);

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['updateWorkoutForm'])) {

	$updatedWorkout = workOutUpdate($_POST);

	Log::insert(
		['type' => 'TRAINER_UPDATE_NOTE', 'workout' => $updatedWorkout],
		$currentUser
	);
}

$program = Program::find((int) $_GET['workout']);

?>
<script>

	var CURRENT_USER = <?php echo json_encode($currentUser); ?>;
	var ROOT_URL = '<?php echo get_site_url(); ?>';
	var CLIENTS = <?php echo json_encode(workOutGetClients()) ?>;
	var WORKOUT = <?php echo json_encode(workOutGet($_GET['workout'])) ?>;
	var PROGRAM_NOTE = <?php echo json_encode($program->getNote()) ?>;
	var EXERCISE_OPTIONS = <?php echo json_encode(workOutExerciseOptions()) ?>;
	var EXERCISE_SQ_OPTIONS = <?php echo json_encode(workOutExerciseStrengthQualitiesOptions()) ?>;

</script>

<div class="main-content padding20 matchHeight" ng-app="smApp" ng-controller="editWorkoutController" ng-cloak>
	<div ng-include src="workoutTemplate"></div>
</div>

<script type="text/javascript" src="<?php echo get_stylesheet_directory_uri() .'/js/angular/app.js'; ?>"></script>
<script type="text/javascript" src="<?php echo get_stylesheet_directory_uri() .'/js/angular/editWorkoutController.js'; ?>"></script>