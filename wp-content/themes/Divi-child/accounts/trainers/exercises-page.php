<?php
require_once getcwd() . '/wp-customs/User.php';
$currentUser = User::find(get_current_user_id());
$exerciseTypes = Exercise::types();
?>
<script>
	var CURRENT_USER = <?php echo json_encode($currentUser); ?>;
	var ROOT_URL = '<?php echo get_site_url(); ?>';
	var EXERCISE_TYPES = <?php echo json_encode($exerciseTypes); ?>;
</script>
<div class="main-content matchHeight" ng-app="smApp" ng-controller="exercisesController">
	<div ng-include src="workoutTemplate"></div>
</div>

<script type="text/javascript" src="<?php echo get_stylesheet_directory_uri() .'/js/angular/app.js'; ?>"></script>
<script type="text/javascript" src="<?php echo get_stylesheet_directory_uri() .'/js/angular/exercisesController.js'; ?>"></script>