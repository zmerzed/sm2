<?php
	require_once getcwd() . '/wp-customs/User.php';
	$currentUser = User::find(get_current_user_id());

?>
<div class="main-content matchHeight">
	<table id="table-sorter-logs" class="table table-striped table-bordered" style="width:100%">
	    <thead>
	        <tr>
	            <th>Video</th>
	            <th>Exercise</th>
	            <th>Body Part</th>
	            <th>Categories</th>
	            <th>Equipment</th>
	        </tr>
	    </thead>
	    <tbody>
		<?php foreach ($currentUser->getExercises() as $exercise) { ?>
	        <tr>
	            <td><img src="<?php echo get_stylesheet_directory_uri().'/accounts/images/video-exercise.png';?>"></td>
	            <td><?php echo $exercise->exer_body_part; ?></td>
	            <td><?php echo $exercise->exer_type; ?></td>
	        </tr>
		<?php } ?>
	    </tbody>
	</table>
</div>