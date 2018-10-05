<?php

$currentUser = User::find(get_current_user_id());

if ($currentUser) {
	$pastWorkouts = $currentUser->checkIfHasMissedWorkouts();

	foreach ($pastWorkouts as $workout) {
		Log::insert(['workout' => $workout, 'type' => 'CLIENT_MISSED_WORKOUT'], $currentUser);
	}

}
?>
<?php
	$current_user = wp_get_current_user();
	$clientWorkouts = workoutGetClientWorkouts($current_user->ID);
	
	$user = User::find($current_user->ID);
	$currentUser = [
		'id' => $user->id,
		'stats' => $user->getStats()
	];
	$userGoalStart = $currentUser['stats']['start'];
	$userGoal = $currentUser['stats']['goal'];
	$results = [];
	$not_inc = ['id', 'type', 'client_id', 'updated_by', 'created_by', 'target_date','created_at', 'updated_at'];
	$gResults = getGoalResults($user);		
	foreach($gResults as $v){
		$ndate = date_create($v->created_at);
		$ndate = date_format($ndate, 'M d,Y');
		$temp = [];
		foreach($v as $k=>$ki){
			if(!in_array($k,$not_inc))
			 $temp[$k] = $ki;				
		}			
		$results[$ndate] = $temp;				
	}
	$resPercs = [];
	foreach($results as $resK => $resV){
		$resPerc = [];
		$resPerc['start'] = $userGoalStart;
		$resPerc['goal'] = $userGoal;
		$resPerc['result'] = $resV;
		$resPercs[$resK] = getBPPercAvg(getGoalPerc($resPerc));
	}
	$resCount = count($resPercs);
	$tctr = 0;
?>
<div class="main-content matchHeight">

	<div class="container-title">
        <h3>Today's Workout</h3>
    </div>

	<ul class="workout-lists">
		<?php
		if(!empty($clientWorkouts['todayWorkouts'])){
			foreach ($clientWorkouts['todayWorkouts'] as $workout) {
				$wID = $workout->workout->workout_ID;
				$wnote = "";
				if(!empty(getNote($wID)))
					$wnote = getNote($wID)[0]['detail'];				
		?>

		<li>
			<h4 class="workout-date"><?php echo helperGetCurrentDate()->format('l, Y-m-d'); ?> </h4>
			<div class="workout-wrapper">
				<span class="sm-icons sm-workout-icon"><!--img src="<?php //echo get_stylesheet_directory_uri() .'/accounts/images/workout.png'; ?>"--></span>
				<?php if ((int) $workout->workout_isDone) { ?>
					<span style="color:white">Completed</span>
				<?php } ?>
				<label><?php echo $workout->workout->workout_name . " - " . $workout->day->wday_name; ?></label>
				<div class="workout-controls">
					<?php if($wnote): ?>
						<a href="javascript:void(0);" onclick="showNote(this);"><span class="sm-icons sm-note-icon"></span><!--img src="<?php //echo get_stylesheet_directory_uri() .'/accounts/images/workout-note.png'; ?>"--></a>
					<?php endif; ?>
					<a href="<?php echo home_url(); ?>/client/?data=workout&dayId=<?php echo $workout->workout_client_dayID?>&workoutId=<?php echo $workout->	workout_client_workout_ID?>"><span class="sm-icons sm-play-icon"></span><!--img src="<?php //echo get_stylesheet_directory_uri() .'/accounts/images/workout-play.png'; ?>"--></a>
				</div>
			</div>
			<div class="wnote" style="display:none;"><?php echo $wnote; ?></div>
		</li>
		<?php }
		}else{
			echo '<li style="text-align:center;">No Workout</li>';
		}
		?>
	</ul>

	<div class="container-title">
		<h3>Next Activities</h3>
	</div>

	<ul class="workout-lists">
		<?php
		if(!empty($clientWorkouts['upcomingWorkouts'])){
			foreach ($clientWorkouts['upcomingWorkouts'] as $workout) {
				if(!empty($workout->workout) && !empty($workout->day)):
					$wID = $workout->workout->workout_ID;
					$wnote = "";
					if(!empty(getNote($wID)))
						$wnote = getNote($wID)[0]['detail'];				
		?>
			<li>
				<div class="workout-wrapper">
					<span class="sm-icons sm-workout-icon"><!-- img src="<?php //echo get_stylesheet_directory_uri() .'/accounts/images/workout.png'; ?>" --></span>					
					<label><?php echo $workout->workout->workout_name . " - " . $workout->day->wday_name ?></label>
					<div class="workout-controls">
						<?php if($wnote): ?>
							<a href="javascript:void(0);" onclick="showNote(this);"><span class="sm-icons sm-note-icon"></span><!--img src="<?php //echo get_stylesheet_directory_uri() .'/accounts/images/workout-note.png'; ?>"--></a>
						<?php endif; ?>
						<!--span><a href="<?php echo home_url(); ?>/client/?data=workout"><img src="<?php echo get_stylesheet_directory_uri() .'/accounts/images/workout-play.png'; ?>"></a></span-->
					</div>
				</div>
				<div class="wnote" style="display:none;"><?php echo $wnote; ?></div>
			</li>
		<?php
				endif;
			}
		}else{
			echo '<li style="text-align:center;">No Workout</li>';
		}
		?>
	</ul>
	<div class="recent-activity">
		<div class="row">
			<div class="col-12 col-lg-6 col-xl-6">
				<h3>new message(s)</h3>
				<div class="counter-container mx-auto mx-lg-0 mx-xl-0">
					<a href="<?php echo home_url('messages'); ?>">
					<?php echo do_shortcode('[fep_shortcode_new_message_count]'); ?>
					<img class="img-responsive" src="<?php echo get_stylesheet_directory_uri() .'/accounts/images/message-notification.png'; ?>">
					</a>
				</div>
			</div>
			<div class="col-12 col-lg-6 col-xl-6">
				<h3>Progress</h3>
				<!-- <img src="<?php echo get_stylesheet_directory_uri() .'/accounts/images/workout-graph.png'; ?>"> -->
				<div class="chartContainer" id="chartContainer"></div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript" src="<?php echo get_stylesheet_directory_uri(); ?>/js/canvasjs.min.js"></script> 
<script>
function showNote(a){
	$('.modal-title').html('<strong>Note</strong>');
	$('.modal-body').html($(a).closest('li').find('.wnote').html());
	$('#workoutModal').modal();
}
window.onload = function() {
	var chart = new CanvasJS.Chart("chartContainer", {		
		title: {
			text: ""
		},
		data: [{
			lineColor: '#ae1f23',
			markerColor: '#ae1f23',
			lineThickness: 1,
			markerBorderThickness: 3,
			type: "line",
			toolTipContent: "{label}:  <b>{y}%</b>",				
			indexLabelFontSize: 12,
			indexLabel: "{y}%",
			dataPoints: [
				<?php
					if(!empty($resPercs)){
						foreach($resPercs as $rpK=>$rpV){
							$tctr++;
							echo '{ label: "'.$rpK.'",  y: '.$rpV.' }';							
							echo ($tctr == $resCount) ? "" : ",";
						}
					}else{
						echo '{ label: "0",  y: 0 }';
					}
				?>						
			]
		}]
	});
	chart.render();
}
</script>