<?php if(isset($_GET['print'])):  ?>
	<link rel="stylesheet" href="<?php echo get_stylesheet_directory_uri(); ?>/accounts/assets/css/print.css" />
	<div class="main-content padding20 matchHeight">
		<?php get_template_part( 'accounts/inc/print-program-type-3', 'page'); ?>
	</div>
<?php else: ?>
<div class="trainer-weekly-schedule-wrapper">
		<?php
			$uinfo = wp_get_current_user();
			$daysOfWeek = getDaysOfWeek();
			$memScheds = getSchedData($uinfo);
			$today = date('Y-m-d');
			
			if(!empty($memScheds)):
				$schedule_ctr = 0;	
				foreach($daysOfWeek as $dow):	
					$day = date_format(date_create($dow), 'D');
					
		?>
		<?php if(!empty($memScheds[$dow])): ?>
			<div class="trainer-per-day-schedule">
				<div class="per-day-schedule-box-wrapper">
					<h3 class="trainer-day-label"><?php echo $day; ?></h3>				
					<ul class="trainer-per-day-schedule-box trainer-schedule-wrapper <?php echo ($dow == $today) ? "today":""; ?>">
						<?php
						$eventChecker = [];
						foreach($memScheds[$dow] as $ms):
							$schedule_ctr++;						
							$ms0 = $ms[0];
							$wsta = "";
							$wsta2 = "";
							$wisdone = $ms0['wisdone'];
							
							if($wisdone == 0 && $dow < $today)
								$wsta = "[Not Completed]";
							elseif($wisdone == 0 && $dow > $today)
								$wsta = "[Pending]";
							elseif($wisdone == 0 && $dow == $today)
								$wsta = '[Ready to Start]';
							else{
								$wsta = "[Completed]";							
								$wsta2 = "comp";
							}
							$program_details = [];
							if(getProgramDeatils($ms0['pid'],$ms0['wid'],$ms0['wclient']))
								$program_details = getProgramDeatils($ms0['pid'],$ms0['wid'],$ms0['wclient']);
							
							$workoutDetails = []; //Day Details
							if($ms0['wid'])
								$workoutDetails = $program_details[$ms0['wid']];
							
							if($workoutDetails){
								$eventChecker[] = $schedule_ctr;
								$sched_var = "sched".$schedule_ctr;
						?>							
							<li class="<?php echo $wsta2; ?>">
								<script>
									<?php echo "var ".$sched_var." = ". json_encode($workoutDetails) ; ?>
									<?php echo ','.$sched_var.'link = ' . ($ms0['wisdone'] == 0 && $dow == $today ? '"' . $ms0['daylink'] . '"' : '""'); ?>;
								</script>
								<a onclick="scheduleModal(<?php echo $sched_var; ?>.exercises,<?php echo $sched_var."link". ",". $ms0['wid'].",".$ms0['wclient']; ?>)" href="javascript:void(0)<?php //echo ($ms0['wisdone'] == 0 && $dow == $today) ? $ms0['daylink'] : "javascript:void(0)"; ?>">
									<span>
										<span class="sm-icons sm-workout-icon sm-icon-small"></span>
										<label><small><?php echo $ms0['wtime']; ?></small></label>
									</span>
									<h4><?php echo $ms0['wcnname']; //Workout Client Name ?></h4>
									<h4><?php echo $ms0['wdname']; //Workout name - Day Name ?></h4>
									<h4><?php echo $wsta; //Status ?></h4>
								</a>
							</li>
						<?php
							}
						endforeach;
							if(count($eventChecker) < 1):
						?>
							<div class="trainer-no-schedule trainer-schedule-wrapper">
								<p><i>NO EVENTS</i></p>
							</div>
						<?php endif; ?>						
					</ul>				
				</div>
			</div>
		<?php else: ?>
			<div class="trainer-per-day-schedule">
				<div class="per-day-schedule-box-wrapper">
					<h3 class="trainer-day-label"><?php echo $day; ?></h3>
					<div class="trainer-no-schedule trainer-schedule-wrapper">
						<p><i>NO EVENTS</i></p>
					</div>
				</div>
			</div>
		<?php endif; ?>
		<?php 	
			endforeach;
		else:
		?>
			<p class="text-center">No scheduled program</p>
		<?php endif; ?>	
	</div>
	
<script>
 function scheduleModal(a,b,c,d){
	 var ctr = 0,
	 ml = "<?php echo $_SERVER['REQUEST_URI']; ?>&print=1&workout_id=" +c+ "&client_id=" + d,
	 scheds = '<div class="table-responsive"><table class="table table-bordered"><tr style="font-weight:800">'
				+'<td>#</td>'
				+'<td>Exercise</td>'
				+'<td>Var 1</td>'
				+'<td>Var 2</td>'
				+'<td>Sets</td>'
				+'</tr>';
	console.log(a);
	 a.forEach(function(elem){
		 ctr++;
		 scheds += "<tr>";
		 scheds += "<td>"+ctr+"</td>";
		 scheds += "<td>"+(elem.exer_type != null ? elem.exer_type : "--")+"</td>";
		 scheds += "<td>"+(elem.exer_exercise_1 != null ? elem.exer_exercise_1 : "--")+"</td>";
		 scheds += "<td>"+(elem.exer_exercise_2 != null ? elem.exer_exercise_2 : "--")+"</td>";
		 scheds += "<td>"+(elem.exer_sets != null ? elem.exer_sets : "--")+"</td>";	 
		 scheds += "</tr>";
	 });
	 scheds += "</table></div>";
	 scheds += 	'<div class="schdeule-action float-left" style="margin-bottom:10px;">'+(b != '' ? '<a style="display:inline-block;line-height:45px;" href="' +b+ '"><span style="margin-right:10px;" class="sm-icons sm-play-icon"></span> Start Workout</a>' : '')+'</div>';
	 scheds += '<div class="float-right"><a target="_blank" href="'+ml+'" class="red-btn">Print</a></div>';
	 $('#workoutModal').modal();
	 $('#workoutModal .modal-title').html('Overview');
	 $('#workoutModal .modal-body').html(scheds);
 }
</script>
<?php endif; ?>