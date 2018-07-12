<?php 
	$urole = "";
	$op_train = (in_array( 'trainer', $uinfo->roles ) || $pm_lvl == "Trainer");
	$op_gym = (in_array( 'gym', $uinfo->roles ) || $pm_lvl == "Gym");
	$op_client = (in_array( 'client', $uinfo->roles ));
	
	if($op_train){
		$urole = "trainer";
	}elseif($op_gym){
		$urole = "gym";
	}elseif($op_client){
		$urole = "client";
	}
	
?>
<div class="col-lg-2 col-md-2">
	<div class="main-navigation matchHeight">
		<h3>Menu</h3>

		<ul>
			<li><a href="<?php echo  home_url(); ?>/<?php echo $urole; ?>" menu-item="dashboard">Dashboard</a></li>
			<li>
				<a href="<?php echo  home_url(); ?>/<?php echo $urole; ?>/?data=schedule" menu-item="schedule">Schedule</a>
				<ul>
					<li><a href="<?php echo  home_url(); ?>/<?php echo $urole; ?>/?data=schedule&by=weekly" menu-item="weekly">Weekly</a></li>
					<li><a href="<?php echo  home_url(); ?>/<?php echo $urole; ?>/?data=schedule&by=monthly" menu-item="monthly">Monthly</a></li>
				</ul>
			</li>
			<li><a href="<?php echo  home_url(); ?>/<?php echo $urole; ?>/?data=profile" menu-item="profile">Profile</a></li>
			<?php if($op_client): ?>
			<li>
				<ul>
					<li><a href="<?php echo home_url(); ?>//<?php echo $urole; ?>/?data=profile&by=personal-info" menu-item="personal-info">Personal Info</a></li>
					<li><a href="<?php echo home_url(); ?>//<?php echo $urole; ?>/?data=profile&by=progress-goals" menu-item="progress-goals">Progress/Goals</a></li>
				</ul>
			</li>
			<?php endif; ?>
			<li><a href="<?php echo  home_url(); ?>/<?php echo $urole; ?>/?data=message" menu-item="message">Messages</a></li>
			<li><a href="<?php echo  home_url(); ?>/<?php echo $urole; ?>/?data=notes" menu-item="notes">Notes</a></li>
			<li><a href="<?php echo  home_url(); ?>/<?php echo $urole; ?>/?data=logs" menu-item="logs">Logs</a></li>
		</ul>
		
		<?php if($op_train || $op_gym): ?>
		<div class="menu-divider"></div>

		<ul>
			<li><a href="<?php echo  home_url(); ?>/<?php echo $urole; ?>/?data=workouts" menu-item="workouts">Workouts</a></li>
			<li><a href="<?php echo  home_url(); ?>/<?php echo $urole; ?>/?data=exercises" menu-item="exercises">Exercises</a></li>
			<?php if($op_gym): ?>
				<li><a href="<?php echo  home_url(); ?>/<?php echo $urole; ?>/?data=trainers" menu-item="trainers">Trainers</a></li>
			<?php endif; ?>
			<li><a href="<?php echo  home_url(); ?>/<?php echo $urole; ?>/?data=clients" menu-item="clients">Clients</a></li>
		</ul>		
		<?php endif; ?>
	</div>
</div>