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

<?php if(isset($_GET['print'])):  ?>
	<link rel="stylesheet" href="<?php echo get_stylesheet_directory_uri(); ?>/accounts/assets/css/print.css" />
	<div class="main-content padding20 matchHeight">
		<?php require_once(get_stylesheet_directory() . '/accounts/inc/print-program-account.php'); ?>
	</div>
<?php else: ?>
	<a href="<?php echo $_SERVER['REQUEST_URI']; ?>&print=1" class="btn red-btn" style="float:right;font-size:12px;margin-bottom:10px;" target="_blank">Print</a>
	<div class="main-content padding20 matchHeight" ng-app="smApp" ng-controller="editWorkoutController" ng-cloak>
		<div ng-include src="workoutTemplate"></div>
	</div>
<?php endif; ?>

<script type="text/javascript" src="<?php echo get_stylesheet_directory_uri() .'/js/angular/app.js'; ?>"></script>
<script type="text/javascript" src="<?php echo get_stylesheet_directory_uri() .'/js/angular/editWorkoutController.js'; ?>"></script>