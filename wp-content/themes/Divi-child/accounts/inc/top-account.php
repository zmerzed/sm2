<div class="title-welcome-section">
	<div class="container">
		<div class="row">
			<div class="col-lg-6 col-md-6">
				<h2>

					<?php
					$data_request = $_GET['data'];
					switch ($data_request) {
						case 'schedule':
							echo 'Schedule';
							break;

						case 'profile':
							echo 'Profile';
							break;
						
						case 'message':
							echo 'Message';
							break;

						case 'notes':
							echo 'Notes';
							break;
						
						case 'logs':
							echo 'Logs';
							break;

						case 'workouts':
							echo 'Workouts';
							break;

						case 'add-workouts':
							
							if(isset($_GET['workout'])) {
								$workout = workOutGet($_GET['workout']);
								echo 'Edit ' . $workout['workout_name'];
							} else {
								echo 'New/edit workout';
							}

							break;

						case 'exercises':
							echo 'Exercises';
							break;

						default:
							echo 'dashboard';
							break;
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