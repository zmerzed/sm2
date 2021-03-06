<?php
	$currentUser = User::find(get_current_user_id());
	$dateToday = date('Y-m-d');

	if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['workoutForm'])) {
		$newWorkout = workOutAdd(array_merge($_POST, ['workout_trainer_ID' => $currentUser->ID]));

		Log::insert(
			['type' => 'GYM_CREATE_PROGRAM', 'workout' => $newWorkout],
			$currentUser
		);
	}


	if (isset($_GET['delete'])) {
		$currentUser = User::find(get_current_user_id());
		$workout = workOutGet((int) $_GET['delete']);

		if ($workout) {
			Log::insert(['type' => 'GYM_DELETE_PROGRAM', 'workout' => $workout], $currentUser);
			workOutDelete($_GET['delete']);
		}
	}
?>
<div class="main-content matchHeight">

	<div class="trainer-add-workout">
		<a href="/gym/?data=add-workouts">+ New Program</a>
	</div>

	<ul class="workout-lists trainer-workouts-lists">
		<?php foreach ($currentUser->getPrograms() as $program) {
			$gymTrainers = getTrainersOfGym($currentUser);
			?>
			<li class="workout-list-item">
				<div class="workout-wrapper">
					<span class="sm-workout-icon sm-icons"><!-- <img src="<?php echo get_stylesheet_directory_uri() .'/accounts/images/workout-blu.png'; ?>"> --></span>
					<!-- <span class="workout-ico wi-red wi-lifeter"></span> -->
					<label><?php echo $program->workout_name ?></label>
					<div class="workout-controls">
						<a href="javascript:void(0);" onclick="toggleMembers(this)"><span class="sm-members-icon sm-icons"><!-- <img src="<?php echo get_stylesheet_directory_uri() .'/accounts/images/members-icon-blu.png'; ?>"> --></span></a>
						<a onClick="return duplicate(<?php echo $program->workout_ID ?>)" href="#"><span class="sm-record-icon sm-icons"><!-- <img src="<?php echo get_stylesheet_directory_uri() .'/accounts/images/record-icon-blu.png'; ?>"> --></span></a>
						<a href="/gym/?data=edit-workout&workout=<?php echo $program->workout_ID; ?>"><span class="sm-edit-icon sm-icons"><!-- <img src="<?php echo get_stylesheet_directory_uri() .'/accounts/images/edit-icon-blu.png'; ?>"> --></span></a>
						<a onClick="return confirm('Are you sure you want to delete this item?')" href="/gym/?data=workouts&delete=<?php echo $program->workout_ID; ?>"><span class="sm-delete-icon sm-icons"><!-- <img src="<?php echo get_stylesheet_directory_uri() .'/accounts/images/delete-icon-blu.png'; ?>"> --></span></a>
					</div>
				</div>
				<div class="list-of-clients-in-this-workout" style="display:none;">
					<div class = "table-responsive">
						<table class="table-bordered table" style="width:100%;">
							<tr>
								<th>Client</th>
								<th>Workout Name</th>
								<th>Status</th>
								<th>Date</th>
							</tr>
							<?php
							if(!empty($gymTrainers)){
								foreach($gymTrainers as $gymtrainer){
									$clientsOfTrainer = getClientsOfTrainer($gymtrainer);
									foreach($clientsOfTrainer as $client){
										$workoutSched = getSchedData($client);
										$todayScheds = array();
										if(!empty($workoutSched[$dateToday]))
											$todayScheds = $workoutSched[$dateToday];

										foreach($todayScheds as $ts){
											$ts2 = $ts[0];
											if($ts2['wname'] == $program->workout_name){
												$client_info = get_userdata($client->ID);
												$wdone = $ts2['wisdone'];
												$wdayName = $ts2['wdname'];
												$wlink = 'Ready to start';
												if($wdone == 1){
													$wlink="Completed";
												}
												?>
												<tr>
													<td><span><?php echo $client_info->user_nicename; ?></span></td>
													<td><?php echo $wdayName; ?></td>
													<td><?php echo $wlink; ?></td>
													<td><?php echo $dateToday; ?></td>
												</tr>
												<?php

											}
										}
									}
								}
							}else{
								echo '<tr><td colspan="4">No Client</td></tr>';
							}
							?>
						</table>
					</div>
				</div>
			</li>
		<?php } ?>
	</ul>
</div>
<script>
	var CURRENT_USER_ID = '<?php echo wp_get_current_user()->ID ?>';
	var ROOT_URL = '<?php echo get_site_url(); ?>';

	function toggleMembers(a){
		$('.list-of-clients-in-this-workout').each(function(){
			var toggleTarg = $(a).closest('.workout-list-item').find('.list-of-clients-in-this-workout');
			if($(this).is(toggleTarg)){
				$(toggleTarg).slideToggle();
			}else{
				$(this).hide();
			}
		});
	}

	function duplicate(id)
	{
		var isYes = confirm('Are you sure you want to duplicate this item?');

		if (isYes)
		{
			$.post(ROOT_URL + '/wp-json/v1/program-duplicate', {
				program_id: id,
				user_id: CURRENT_USER_ID
			}, function(res) {
				console.log(res);
				window.location.reload();
			});
		}
	}
</script>
