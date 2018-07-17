<div class="title-welcome-section">
	<div class="container">
		<div class="row">
			<div class="col-lg-6 col-md-6">
				<h2>
					<?php	
						$dr = ""; //data_request	
						if(isset($_GET['data']))
							$dr = $_GET['data'];						
						
						if($dr == "schedule"){
							echo 'Schedule';
						}elseif($dr == "profile"){
							echo 'Profile';					
						}elseif($dr == "profile"){
							echo 'Profile';					
						}elseif($dr == "message"){
							echo 'Message';
						}elseif($dr == "notes"){
							echo 'Notes';					
						}elseif($dr == "logs"){
							echo 'Logs';					
						}elseif($dr == "workouts"){
							echo 'Workouts';					
						}elseif($temp_slug == "page-member-templates.php"){
							echo 'Member Subscription';
						}elseif($dr == "exercises"){
							echo 'Exercises';
						}elseif($dr == "add-workouts"){
							if(isset($_GET['workout'])) {
								$workout = workOutGet($_GET['workout']);
								echo 'Edit ' . $workout['workout_name'];
							} else {
								echo 'New/edit workout';
							}
						}else{
							echo 'Dashboard';
						}	
					?>
				</h2>
			</div>
			<div class="col-lg-6 col-md-6">
				<h4>Welcome back, <?php echo $uinfo->user_login; ?></h4>
			</div>
		</div>
	</div>
</div>