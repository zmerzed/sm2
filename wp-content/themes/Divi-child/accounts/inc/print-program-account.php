<?php
	$current_url = explode("?", $_SERVER['REQUEST_URI']);
	if($_GET['data'] == "workout" || $_GET['data'] == "edit-workout"){
		//Print Program for (Start Workout Page) and (Gym Program)
			get_template_part( 'accounts/inc/print-program-type-1', 'page' );		
	}elseif($_GET['data'] == 'add-workouts'){
		//Print Program for (Trainers Program)
		get_template_part( 'accounts/inc/print-program-type-2', 'page');
	}else{
		echo '<script>window.location.href = "'.$current_url[0] .'";</script>';
	}
