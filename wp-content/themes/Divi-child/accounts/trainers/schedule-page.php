<div class="main-content padding20 matchHeight">

	<div class="container-title">
        <h3>Weekly Schedule</h3>
    </div>
    
	<div class="trainer-weekly-schedule-wrapper">
		<?php
			$uinfo = wp_get_current_user();
			$daysOfWeek = getDaysOfWeek();
			$memScheds = getSchedData($uinfo);
			$today = date('Y-m-d');
			
			/* echo "<pre>";
			print_r($memScheds);
			echo "</pre>";	 */
			
			
			if(!empty($memScheds)):				
				foreach($daysOfWeek as $dow):	
					$day = date_format(date_create($dow), 'l');
		?>
		<?php if(!empty($memScheds[$dow])): ?>			
			<div class="trainer-per-day-schedule">
				<div class="per-day-schedule-box-wrapper">
					<h3 class="trainer-day-label"><?php echo $day; ?></h3>				
					<ul class="trainer-per-day-schedule-box trainer-schedule-wrapper <?php echo ($dow == $today) ? "today":""; ?>">
						<?php foreach($memScheds[$dow] as $ms):
							$wsta = "";
							$wsta2 = "";
							$wisdone = $ms[0]['wisdone'];
							
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
								
						?>							
							<li class="<?php echo $wsta2; ?>">
								<a href="<?php echo ($ms[0]['wisdone'] == 0 && $dow == $today) ? $ms[0]['daylink'] : "javascript:void(0)"; ?>">
									<span>
										<img src="<?php echo get_stylesheet_directory_uri().'/accounts/images/gym-schedule-icon.png';?>">
										<!-- <label>--:-- <small>--</small></label> -->
										<label><small><?php echo $dow; ?></small></label>
									</span>
									<h4><?php echo $ms[0]['wcnname']; //Workout Client Name ?></h4>
									<h4><?php echo $ms[0]['wdname']; //Workout name - Day Name ?></h4>
									<h4><?php echo $wsta; //Status ?></h4>
								</a>
							</li>
						<?php endforeach; ?>						
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
</div>