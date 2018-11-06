<?php
	$pm_lvl = strtolower($pm_lvl);
	$urole = "";
	$op_train = (in_array( 'trainer', $uinfo->roles ) || $pm_lvl == "trainer");
	$op_gym = (in_array( 'gym', $uinfo->roles ) || $pm_lvl == "gym");
	$op_client = (in_array( 'client', $uinfo->roles ));
	
	if($op_train){
		$urole = "trainer";
	}elseif($op_gym){
		$urole = "gym";
	}elseif($op_client){
		$urole = "client";
	}
	
	$r_uri = $_SERVER['REQUEST_URI'];
?>
<div class="col-12 col-md-4 col-lg-3 col-xl-3 mb-5 d-none d-sm-none d-md-block">
	<div class="main-navigation matchHeight">
		<h3>Menu</h3>
		<ul>
			<li><a href="<?php echo  home_url(); ?>/<?php echo $urole; ?>" menu-item="dashboard" class="<?php echo($r_uri == '/'.$urole.'/') ? "active" : ""; ?>">Dashboard</a></li>
			<li class="has-sub-drop">
				<a href="<?php echo  home_url(); ?>/<?php echo $urole; ?>/?data=schedule" menu-item="schedule">Schedule</a>				
				<ul class="sub-menu" style="display:none;">
					<li><a href="<?php echo  home_url(); ?>/<?php echo $urole; ?>/?data=schedule&by=weekly" menu-item="weekly">Weekly</a></li>
					<li><a href="<?php echo  home_url(); ?>/<?php echo $urole; ?>/?data=schedule&by=monthly" menu-item="monthly">Monthly</a></li>
				</ul>
			</li>
			<?php if($op_train || $op_gym): ?>
				<?php if($op_gym): ?>
					<li><a href="<?php echo  home_url(); ?>/<?php echo $urole; ?>/?data=trainers" menu-item="trainers">Trainers</a></li>
				<?php endif; ?>
				<li><a href="<?php echo  home_url(); ?>/<?php echo $urole; ?>/?data=clients" menu-item="clients">Clients</a></li>
			<?php endif; ?>
			<li class="<?php echo ($op_client) ? 'has-sub-drop' : ''; ?>"><a href="<?php echo  home_url(); ?>/<?php echo $urole; ?>/?data=profile" menu-item="profile">Profile</a>					
				<?php if($op_client): ?>			
					<ul class="sub-menu" style="display:none;">
						<li><a href="<?php echo home_url(); ?>/<?php echo $urole; ?>/?data=profile&by=personal-info" menu-item="personal-info">Personal Info</a></li>
						<li><a href="<?php echo home_url(); ?>/<?php echo $urole; ?>/?data=profile&by=progress-goals" menu-item="progress-goals">Progress/Goals</a></li>
					</ul>				
				<?php endif; ?>		
			</li>			
			<li><a class="<?php echo (strpos($r_uri, 'messages')) ? "active" : ""; ?>" href="<?php echo  home_url(); ?>/messages" menu-item="message">Messages</a></li>
			<li><a href="<?php echo  home_url(); ?>/<?php echo $urole; ?>/?data=notes" menu-item="notes">Notes</a></li>
			<li><a href="<?php echo  home_url(); ?>/<?php echo $urole; ?>/?data=logs" menu-item="logs">Logs</a></li>
			<?php if(checkSubscribed($uinfo)): ?>
				<li class="has-sub-drop"><a href="<?php echo  home_url(); ?>/membership-account/" menu-item="member">Member Subscription</a>
					<?php //if($temp_slug == "page-member-templates.php"): ?>
						<ul class="children sub-menu" style="display:none;">
							<li><a href="<?php echo home_url();  ?>/membership-account/membership-account/">Member Account</a></li>
							<li><a href="<?php echo home_url();  ?>/membership-account/membership-billing/">Member Billing</a></li>
							<li><a href="<?php echo home_url();  ?>/membership-account/membership-cancel/">Member Cancel</a></li>
							<!-- <li><a href="<?php echo home_url();  ?>/membership-account/membership-checkout/">Member Checkout</a></li> -->
							<li><a href="<?php echo home_url();  ?>/membership-account/membership-confirmation/">Member Confirmation</a></li>
							<li><a href="<?php echo home_url();  ?>/membership-account/membership-invoice/">Member Invoice</a></li>
							<!-- <li><a href="<?php echo home_url();  ?>/membership-account/membership-levels/">Member Levels</a></li> -->
						</ul>
					<?php //endif; ?>
				</li>					
			<?php endif; ?>
		</ul>		
		<?php if($op_train || $op_gym): ?>
			<div class="menu-divider"></div>

			<ul>
				<li><a class="<?php echo (strpos($r_uri, 'workouts')) ? "active" : ""; ?>" href="<?php echo  home_url(); ?>/<?php echo $urole; ?>/?data=workouts" menu-item="workouts">Programs</a></li>
				<li><a href="<?php echo  home_url(); ?>/<?php echo $urole; ?>/?data=exercises" menu-item="exercises">Exercises</a></li>
				<?php if($op_gym): ?>
					<!--li><a href="<?php echo  home_url(); ?>/<?php echo $urole; ?>/?data=trainers" menu-item="trainers">Trainers</a></li-->
				<?php endif; ?>
				<!--li><a href="<?php echo  home_url(); ?>/<?php echo $urole; ?>/?data=clients" menu-item="clients">Clients</a></li-->
			</ul>		
		<?php endif; ?>
	</div>
</div>
<script>
	(function( $ ) {
		$(document).ready(function(){
			$('#menu .mobile-menu').html($('.main-navigation').html());
		});
	})(jQuery);	
</script>