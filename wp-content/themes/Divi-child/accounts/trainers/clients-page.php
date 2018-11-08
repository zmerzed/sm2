<div class="main-content matchHeight">
<?php if(isset($_GET['edit'])):?>
	<div class="current-status">
		<div class="row">
			<?php get_template_part( 'accounts/inc/edit-progress', 'page' ); ?>
		</div>
	</div>
<?php elseif(isset($_GET['profile'])): ?>
	<div class="current-status">
		<div class="row">
			<?php get_template_part( 'accounts/clients/profile', 'page' ); ?>
		</div>
	</div>
<?php
elseif(isset($_GET['add'])):
		get_template_part( 'accounts/trainers/add-clients', 'page' );
else: ?>
	<div class="trainer-add-workout">
		<a href="<?php echo home_url(); ?>/trainer/?data=clients&add=1">+ Add Client</a>
	</div>
	<div class = "table-responsive list-table">
		<!-- <table id="table-sorter-logs" class="table table-striped table-bordered" style="width:100%"> -->
		<table id="" class="table table-striped table-bordered" style="width:100%">
		    <thead>
	        <tr>
	          <th>Photo</th>
	          <th>Name</th>
	          <th>Purpose</th>
	          <th>Last Activity</th>
	          <th style="min-width:120px;">Goal</th>
	          <th></th>
	        </tr>
		    </thead>
		    <tbody>
					<?php
						$clients = get_user_meta(wp_get_current_user()->ID, 'clients_of_trainer', true);
						if(!empty($clients)):
							$last_day_activity = 0;
							foreach($clients as $key=>$client):
								$user = User::find($client);
								$currentUser = [
									'stats' => $user->getStats(),
									'photos' => $user->getPhotos(),
									'logs' => $user->getLogs()
								];
								
								if(!empty($currentUser['logs']))
									$last_day_activity = strtotime($currentUser['logs'][0]['created_at']);
								else
									$last_day_activity = 0;
								
								$now = time();							
								$day_difference = $now - $last_day_activity;								
								$number_of_days_difference = round($day_difference / (60 * 60 * 24));
								
								$eachBPStats = getGoalPerc($currentUser['stats']); //Bodypart %s
								$bppavg = getBPPercAvg($eachBPStats); //Bodypart %s Average
								
								$user_info = get_user_by('id', $client);
								$purpose =  get_user_meta($client, 'sm_accomtext', true);
								
								$uPho = array();
								$userPhoto = "";
								if(!empty($currentUser['photos'])){
									$uPho = $currentUser['photos'];
									$countPho = count($uPho) - 1;
									$latestPho = $uPho[$countPho];
									$userPhoto = home_url() . '/sm-files/' . $latestPho['user_id'] . '/' . $latestPho['file'];
								}			
								if($user_info):
					?>
						<tr>
							<td>
								<?php
									if($userPhoto)
										echo '<img src="'.$userPhoto.'"  class="img-responsive" style="max-width:50px;" />';
									else
										echo '<img src="'.get_stylesheet_directory_uri().'/accounts/images/client-1.png" />';
								?>
							</td>
							<td><?php echo $user_info->first_name . ' ' . $user_info->last_name;  ?></td>
							<td class="w-25"> <?php echo ($purpose) ? $purpose : "--"; ?> </td>
							<td><?php echo ($last_day_activity != 0) ? $number_of_days_difference : "--"; ?> Days Ago</td>
							<td class="w-50">
								<div class="progress client-goals-percentage">
									<div class="progress-bar" style="width: <?php echo $bppavg; ?>%;">
										<span class="indicator"><small><?php echo $bppavg; ?>%</small></span>
									</div>
								</div>
							</td>
							<td>
								<a href="javascript:void(0);" onclick="openDetails(<?php echo $key; ?>);" class="btn red-btn"><span class="fa fa-gear pr-1"></span></a>
							</td>
						</tr>
						<tr class="client-details" style="display:none;" detail-number="<?php echo $key; ?>">
							<td colspan="6">
								<a href="javascript:void(0)" onclick="openWorkouts(<?php echo $user_info->ID; ?>)">Assigned Workouts</a><br>
								<a href="javascript:void(0)" onclick="openWorkouts(<?php echo $user_info->ID; ?>)">Profile</a><br>
								<a target="_blank" href="<?php echo home_url(); ?>/messages/?fepaction=newmessage&msgto=<?php echo $user_info->ID; ?>">Message</a><br>
								<a target="_blank" href="<?php echo home_url(); ?>/trainer/?data=notes&notesof=<?php echo $user_info->ID; ?>">Notes</a><br>
								<a target="_blank" href="<?php echo home_url(); ?>/trainer/?data=clients&edit=<?php echo $user_info->ID; ?>">Edit Progress</a><br>									
								<a target="_blank" href="<?php echo home_url(); ?>/trainer/?data=clients&profile=<?php echo $user_info->ID; ?>">Current Status</a>							
							</td>
						</tr>
				<?php					
							endif;
						endforeach;
					endif;
				?>	
	    </tbody>
		</table>
	</div>
	<script>
		function openDetails(a){
			$('.client-details').each(function(){
				if($(this).attr('detail-number') == a){
					$(this).slideToggle();
				}else{
					$(this).hide();
				}
			});
		}
		function toggleThis(a){
			$('.workout-items').each(function(){
				if($(this).is($(a).closest('li').next())){
					$(this).slideToggle(function(){
						if($(this).is(':hidden'))						
							$(a).find('i').attr('class','fa fa-chevron-down');
						else{
							$(a).find('i').attr('class','fa fa-chevron-up');
							console.log(0);
						}
					});
					$('.modal-body li i').attr('class','fa fa-chevron-down');
					
				}else
					$(this).hide();
				
			});
		}
		function openWorkouts(a){
			var loadTrgt = $('.main-content'),
			openWorkoutItem = '<li class="workout-items" style="display:none;"><table class="table table-bordered"><thead><tr><th>Program</th><th>Workout</th><th>Time</th><th>&nbsp;</th><tr></thead><tbody>',
			closeWorkoutItem = '</tbody></table></li>';
			$(loadTrgt).addClass('loading'); 
			$('#workoutModal .modal-title').html('Assigned Workouts');
			var jdata = {
				action: 'open_workouts',
				client_id: a
			};
			$.ajax({
				url:  '<?php echo home_url(); ?>/wp-admin/admin-ajax.php',
				method:'POST',
				data: jdata,
				dataType: 'json',
				success: function(res){
					var todayWorkouts = res.result.todayWorkouts,
					previousWorkouts = res.result.previousWorkouts,
					upcomingWorkouts = res.result.upcomingWorkouts,
					workoutContent = '<ul style="list-style:none;padding-left:0;">';
					
					workoutContent += '<li><h3 onclick="toggleThis(this)" class="mb-4">Previous <i class="fa fa-chevron-down"></i></span></h3></li>';
					workoutContent += openWorkoutItem;					
					if(previousWorkouts.length != 0){						
						previousWorkouts.forEach(function(e){							
								workoutContent += pullWorkouts(res,e);
						});
						workoutContent += closeWorkoutItem;
					}else
						workoutContent += "<li>No Workout</li>";
					
					workoutContent += '<li><h3 onclick="toggleThis(this)" class="mb-4">Today <i class="fa fa-chevron-down"></i></h3></li>';
					workoutContent += openWorkoutItem;
					if(todayWorkouts.length != 0){						
						todayWorkouts.forEach(function(e){
							workoutContent += pullWorkouts(res,e);
						});
						workoutContent += closeWorkoutItem;
					}else
						workoutContent += "<li>No Workout</li>";
					
					workoutContent += '<li><h3 onclick="toggleThis(this)" class="mb-4">Upcoming <i class="fa fa-chevron-down"></i></h3></li>';
					workoutContent += openWorkoutItem;
					if(upcomingWorkouts.length != 0){						
						upcomingWorkouts.forEach(function(e){
							workoutContent += pullWorkouts(res,e);
						});
						workoutContent += closeWorkoutItem;
					}else
						workoutContent += "<li>No Workout</li>";
					
					workoutContent += "</ul>";
					
					$(loadTrgt).removeClass('loading');					
					$('#workoutModal .modal-body').html(workoutContent);
					$('#workoutModal').modal();
				},
				error: function(r,xhr, result){
					console.log(r + ' ' + xhr + ' ' + result);
				}
			});
		}

		function formatDate(date) {
			var monthNames = [
				"Jan", "Feb", "Mar",
				"Apr", "May", "Jun", "Jul",
				"Aug", "Sep", "Oct",
				"Nov", "Dec"
			];

			var day = date.getDate(),
			monthIndex = date.getMonth(),
			year = date.getFullYear(),
			hour = date.getHours();
			min = date.getMinutes();

			if(min < 10)
				min = '0' + min;
			if(hour < 10)
				hour = '0' + hour;


			if(isNaN(day))
				return "--";
			else
				return monthNames[monthIndex] + ' ' + day + ', ' + year + ' - ' + hour + ':' + min;
		}
		function pullWorkouts(res,e){
			var returnContent = "";
			if(e.workout && e.day){
				var programName = e.workout.workout_name,
				workout = e.day,
				workoutID = workout.wday_ID,
				programID = workout.wday_workout_ID,
				workoutName = workout.wday_name,
				workoutSched = res.allWorkouts[workoutID][0]['workout_client_schedule'],
				d = formatDate(new Date(workoutSched));				
				
				returnContent += '<tr>';
				returnContent += '<td><label class="text-uppercase font-weight-normal">'+programName+'</label></td><td><label class="text-uppercase font-weight-normal">'+workoutName+'</label></td><td><small">'+d+'</small></td><td><a href="/trainer/?data=add-workouts&workout='+programID+'" class="btn red-btn mt-2"><small>view</small></a></td>';
				returnContent += '</tr>';
			}
			return returnContent;				
		}
	</script>
<?php endif; ?>
</div>
<style>
i.fa{transition: all 1s}
.modal-body{
	max-height:500px;
	overflow-y:scroll;
}
</style>