<div class="trainer-weekly-schedule-wrapper">
		<?php
			$uinfo = wp_get_current_user();
			$daysOfWeek = getDaysOfWeek();
			$memScheds = getSchedData($uinfo);
			$today = date('Y-m-d');
			
			if(!empty($memScheds)):				
				foreach($daysOfWeek as $dow):	
					$day = date_format(date_create($dow), 'D');
		?>
		<?php if(!empty($memScheds[$dow])): ?>
			<div class="trainer-per-day-schedule">
				<div class="per-day-schedule-box-wrapper">
					<h3 class="trainer-day-label"><?php echo $day; ?></h3>				
					<ul class="trainer-per-day-schedule-box trainer-schedule-wrapper <?php echo ($dow == $today) ? "today":""; ?>">
						<?php foreach($memScheds[$dow] as $ms):
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
						?>							
							<li class="<?php echo $wsta2; ?>">
								<a href="<?php echo ($ms0['wisdone'] == 0 && $dow == $today) ? $ms0['daylink'] : "javascript:void(0)"; ?>">
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
						endforeach; ?>						
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