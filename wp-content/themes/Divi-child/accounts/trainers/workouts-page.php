<?php
	global $current_user;
	/* $userdata = get_currentuserinfo(); */
    $currentUser = User::find(get_current_user_id());

	if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['workoutForm'])) {

		$newWorkout = workOutAdd(array_merge($_POST, ['workout_trainer_ID' => $current_user->ID]));
		Log::insert(['type' => 'TRAINER_CREATE_PROGRAM', 'workout' => $newWorkout], $currentUser);
	}

	if (isset($_GET['delete'])) {
        $currentUser = User::find(get_current_user_id());
	    $workout = workOutGet((int) $_GET['delete']);

	    if ($workout) {
	        Log::insert(['type' => 'TRAINER_DELETE_PROGRAM', 'workout' => $workout], $currentUser);
		    workOutDelete($_GET['delete']);
		    wp_redirect('/trainer/?data=workouts', 302);
	    }

	}
?>

<div class="main-content matchHeight">

	<div class="trainer-add-workout">
		<a href="<?php echo home_url(); ?>/trainer/?data=add-workouts">+ New Program</a>
	</div>

	<ul class="workout-lists trainer-workouts-lists">
		<?php foreach($currentUser->getPrograms() as $workout): ?>
		<li class="workout-list-item">
			<?php $url = "/trainer/?data=add-workouts&workout=" . $workout->workout_ID ?>
			<div class="workout-wrapper">
				<!-- <span><img src="<?php echo get_stylesheet_directory_uri() .'/accounts/images/workout.png'; ?>"></span> -->
				<span class="sm-icons sm-workout-icon"></span>
				<label><?php echo $workout->workout_name ?></label>
				<div class="workout-controls">
					<a href="javascript:void(0);" onclick="toggleMembers(this)"><span class="sm-members-icon sm-icons"></span></a>
					<a onClick="return duplicate(<?php echo $workout->workout_ID ?>)" href="#"><span class="sm-record-icon sm-icons"></span></a>
					<a href="<?php echo $url; ?>"><span class="sm-edit-icon sm-icons"></span></a>
					<a onClick="return confirm('Are you sure you want to delete this item?')" href="/trainer/?data=workouts&delete=<?php echo $workout->workout_ID; ?>"><span class="sm-icons sm-delete-icon"</a>
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
						$workoutClientListArr = workoutClientsList($workout->workout_ID);

						if(!empty($workoutClientListArr)):
							foreach($workoutClientListArr as $wc):
								$clientID = $wc->workout_clientID;
								$clientIn = get_userdata($clientID);
								$dateToday = date('Y-m-d');

								$workoutSched = getSchedData($clientIn);
								$wsched = date('Y-m-d', strtotime($wc->workout_client_schedule));
								$todaySched = array();
								if(!empty($workoutSched[$dateToday]))
									$todaySched = $workoutSched[$dateToday];

									foreach($todaySched as $wc2):
										$wc3 = $wc2[0];
										if($wc3['wname'] == $workout->workout_name):

											$client_info = get_userdata($clientID);
											$wdone = $wc3['wisdone'];
											$wdayName = $wc3['wdname'];
											$wlink = '<a href="'.$wc3['daylink'].'" style="line-height:45px;"><span style="margin-right:5px;" class="sm-icons sm-play-icon"></span> Start Now</a>';
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
										endif;
									endforeach;
								endforeach;
							else:
						?>
							<li>No Client</li>
						<?php endif; ?>
					</table>
				</div>
			</div>
		</li>
		<?php endforeach; ?>
	</ul>
</div>
<!-- <script src='<?php echo get_stylesheet_directory_uri() .'/accounts/assets/js/jquery-3.3.1.min.js';?>'></script> -->
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
