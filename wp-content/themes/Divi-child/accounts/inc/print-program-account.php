<?php
	$pid = $_GET['workout']; //Program ID
	$pDetails = getProgramDeatils($pid);
	/* $pWorkouts = $pDetails['workouts'];
	$pWExercises = $pDetails['exercises']; */
	
	echo "<pre>";
	print_r($pDetails);
	echo "</pre>";
	
?>