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
						$wnote = getNote($ws['wid']);
				?>
					<div class="workout-wrapper">
						<span class="sm-icons sm-workout-icon"><!--img src="<?php //echo get_stylesheet_directory_uri() .'/accounts/images/workout.png'; ?>"--></span>
						<label><?php echo $ws['wname']; ?></label>
						<div class="workout-controls">
							<a href="javascript:void(0)" onclick="showNote(this)"><span class="sm-note-icon sm-icons"></span></a>
							<?php if($ws['wsched'] == $today): ?>
								<a href="<?php echo home_url() . '/client/?data=workout&dayId='.$ws['dayid'].'&workoutId='. $ws['wid']; ?>"><span class="sm-play-icon sm-icons"></span></a>
							<?php endif; ?>
						</div>
					</div>
					<div class="wnote" style="display:none;"><?php echo (!empty($wnote)) ? $wnote[0]['detail'] : "No Note"; ?></div>
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
	</ul>	
</div>
<script>
function showNote(a){
	$('.modal-title').html('<strong>Note</strong>');
	$('.modal-body').html($(a).closest('li').find('.wnote').html());
	$('#workoutModal').modal();
}
</script>