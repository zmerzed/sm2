<?php
	require_once getcwd() . '/wp-customs/User.php';
	$currentUser = User::find(get_current_user_id());

	if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['workoutForm'])) {
		workOutAdd(array_merge($_POST, ['workout_trainer_ID' => $currentUser->ID]));
	}
?>
<div class="main-content matchHeight">

	<div class="trainer-add-workout">
		<a href="/gym/?data=add-workouts">+ New Program</a>
	</div>

	<ul class="workout-lists trainer-workouts-lists">
		<?php foreach ($currentUser->getPrograms() as $program) { ?>
		<li>
			<div class="workout-wrapper">
				<span class="sm-workout-icon sm-icons"><!-- <img src="<?php echo get_stylesheet_directory_uri() .'/accounts/images/workout-blu.png'; ?>"> --></span>
				<!-- <span class="workout-ico wi-red wi-lifeter"></span> -->
				<label><?php echo $program->workout_name ?></label>
				<div class="workout-controls">
					<a href="#"><span class="sm-members-icon sm-icons"><!-- <img src="<?php echo get_stylesheet_directory_uri() .'/accounts/images/members-icon-blu.png'; ?>"> --></span></a>
					<a href="#"><span class="sm-record-icon sm-icons"><!-- <img src="<?php echo get_stylesheet_directory_uri() .'/accounts/images/record-icon-blu.png'; ?>"> --></span></a>
					<a href="/gym/?data=add-workouts&workout=<?php echo $program->workout_ID; ?>"><span class="sm-edit-icon sm-icons"><!-- <img src="<?php echo get_stylesheet_directory_uri() .'/accounts/images/edit-icon-blu.png'; ?>"> --></span></a>
					<a href="#"><span class="sm-delete-icon sm-icons"><!-- <img src="<?php echo get_stylesheet_directory_uri() .'/accounts/images/delete-icon-blu.png'; ?>"> --></span></a>
				</div>
			</div>
		</li>
		<?php } ?>
	</ul>
</div>