<div class="main-content padding20 matchHeight">

	<div class="container-title">
        <h3>Weekly Schedule</h3>
    </div>
    
	<div class="trainer-weekly-schedule-wrapper">
		<?php
			$uinfo = wp_get_current_user();
			$daysOfWeek = getDaysOfWeek();
			$memScheds = getSchedData($uinfo);
			
			if(!empty($memScheds)):				
				foreach($daysOfWeek as $dow):	
					$day = date_format(date_create($dow), 'l');
		?>
		<?php if(!empty($memScheds[$dow])): ?>
			<div class="trainer-per-day-schedule">
				<div class="per-day-schedule-box-wrapper">
					<h3 class="trainer-day-label"><?php echo $day; ?></h3>				
					<ul class="trainer-per-day-schedule-box trainer-schedule-wrapper">
						<?php foreach($memScheds[$dow] as $ms): ?>							
							<li>
								<a href="<?php echo $ms[0]['daylink']; ?>">
									<span>
										<img src="<?php echo get_stylesheet_directory_uri().'/accounts/images/gym-schedule-icon-blue.png';?>">
										<label>--:-- <small>--</small></label>
									</span>
									<h4><?php echo $ms[0]['wcnname']; //Workout Client Name ?></h4>
									<h4><?php echo $ms[0]['wname']; //Workout name - Day Name ?></h4>
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
			<p class="text-center">No scheduled workout</p>
		<?php endif; ?>	
	</div>
</div>