<div class="main-content matchHeight schedule-page">
	
	<div class="container-title">
        <h3>Weekly Schedule</h3>
    </div>

	<ul class="workout-lists">
		<?php 
			$uinfo = wp_get_current_user();
			$daysOfWeek = getDaysOfWeek();
			$weekSched = getWeeklySchedule($uinfo);
			$today = date('Y-m-d');
			
			if(!empty($weekSched)):
			foreach($daysOfWeek as $dow):
				if(in_array_r($dow,$weekSched)):
		?>
			<li>
				<h4 class="workout-day"><?php echo date_format(date_create($dow), 'l'); ?></h4>
				<?php
					foreach($weekSched as $ws):
						if($ws['wsched'] == $dow):
				?>
					<div class="workout-wrapper">
						<span><img src="<?php echo get_stylesheet_directory_uri() .'/accounts/images/workout.png'; ?>"></span>
						<label><?php echo $ws['wname']; ?></label>
						<div class="workout-controls">
							<a href="#"><span class="sm-note-icon sm-icons"></span></a>
							<?php if($ws['wsched'] == $today): ?>
								<a href="<?php echo home_url() . '/client/?data=workout&dayId='.$ws['dayid'].'&workoutId='. $ws['wid']; ?>"><span class="sm-play-icon sm-icons"></span></a>
							<?php endif; ?>
						</div>
					</div>
				<?php
						endif;
					endforeach;
				?>
			</li>
		<?php 	endif;
			endforeach;
		else:
		?>
			<p class="text-center">No scheduled program</p>
		<?php endif; ?>		
		<!-- <li>
			<h4 class="workout-day">Monday</h4>
			<div class="workout-wrapper">
				<span><img src="<?php echo get_stylesheet_directory_uri() .'/accounts/images/workout.png'; ?>"></span>
				<label>Workout NAME #1</label>
				<div class="workout-controls">
					<span><a href="#"><img src="<?php echo get_stylesheet_directory_uri() .'/accounts/images/workout-note.png'; ?>"></a></span>
					<span><a href="#"><img src="<?php echo get_stylesheet_directory_uri() .'/accounts/images/workout-play.png'; ?>"></a></span>
				</div>
			</div>
		</li> -->
	</ul>
	
</div>