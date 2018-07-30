<?php
	$currentUser = User::find(wp_get_current_user()->ID);

	if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['updateWorkoutForm'])) {
		$updatedWorkout = workOutUpdate($_POST);

		Log::insert(
			['type' => 'GYM_UPDATE_PROGRAM', 'workout' => $updatedWorkout],
			$currentUser
		);
	}

?>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
<script>

	var CURRENT_USER = <?php echo json_encode($currentUser); ?>;
	var ROOT_URL = '<?php echo get_site_url(); ?>';
	var CLIENTS = <?php echo json_encode(workOutGetClients()) ?>;
	var WORKOUT = <?php echo json_encode(workOutGet($_GET['workout'])) ?>;
	var EXERCISE_OPTIONS = <?php echo json_encode(workOutExerciseOptions()) ?>;
	var EXERCISE_SQ_OPTIONS = <?php echo json_encode(workOutExerciseStrengthQualitiesOptions()) ?>;

</script>

<div class="main-content padding20 matchHeight" ng-app="smApp" ng-controller="editWorkoutController" ng-cloak>
	<div ng-include src="workoutTemplate"></div>
</div>

<script type="text/javascript" src="<?php echo get_stylesheet_directory_uri() .'/js/angular/app.js'; ?>"></script>
<script type="text/javascript" src="<?php echo get_stylesheet_directory_uri() .'/js/angular/editWorkoutController.js'; ?>"></script>