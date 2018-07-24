<?php
	require_once getcwd() . '/wp-customs/User.php';
	$currentUser = User::find(get_current_user_id());
?>
<div class="main-content matchHeight">

	<div class="trainer-add-workout">
		<a href="/gym/?data=add-workouts">+ New Workout</a>
	</div>

	<ul class="workout-lists trainer-workouts-lists">
		<?php foreach ($currentUser->getPrograms() as $program) { ?>
		<li>
			<div class="workout-wrapper">
				<span><img src="<?php echo get_stylesheet_directory_uri() .'/accounts/images/workout-blu.png'; ?>"></span>
				<!-- <span class="workout-ico wi-red wi-lifeter"></span> -->
				<label><?php echo $program->workout_name ?></label>
				<div class="workout-controls">
					<span><a href="#"><img src="<?php echo get_stylesheet_directory_uri() .'/accounts/images/members-icon-blu.png'; ?>"></a></span>
					<span><a href="#"><img src="<?php echo get_stylesheet_directory_uri() .'/accounts/images/record-icon-blu.png'; ?>"></a></span>
					<span><a href="/gym/?data=add-workouts&workout=<?php echo $program->workout_ID; ?>"><img src="<?php echo get_stylesheet_directory_uri() .'/accounts/images/edit-icon-blu.png'; ?>"></a></span>
					<span><a href="#"><img src="<?php echo get_stylesheet_directory_uri() .'/accounts/images/delete-icon-blu.png'; ?>"></a></span>
				</div>
			</div>
		</li>
		<?php } ?>
	</ul>
</div>