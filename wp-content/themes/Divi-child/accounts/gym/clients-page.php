<div class="main-content matchHeight gym-trainer-page">
	<?php	
	if(isset($_GET['add'])):
		get_template_part( 'accounts/gym/add-clients', 'page' );
	else: ?>
	<div class="trainer-add-workout">
		<a href="<?php echo home_url(); ?>/gym/?data=clients&add=1" class="red-btn">+ Add Client</a>
	</div>
	<table id="table-sorter-logs" class="table table-striped table-bordered" style="width:100%">
	    <thead>
	        <tr>
	            <th>Photo</th>
	            <th>Name</th>
	            <th>Purpose</th>
	            <th>Trainer</th>
	            <th>Last Activity</th>
	            <th>Goal</th>
	        </tr>
	    </thead>
	    <tbody>
			<?php 
				$trainers = get_user_meta(wp_get_current_user()->ID, 'trainers_of_gym', true);
				if(empty($trainers))
					$trainers = array();
				$clientsArr = array();				
				foreach($trainers as $trainer){
					$clients = get_user_meta($trainer, 'clients_of_trainer', true);
					if(empty($clients))
						$clients = array();
					
					$tempArr = array();
					foreach($clients as $client){
						$tempArr[] = $client;						
					}
					
					$clientsArr[$trainer] = $tempArr;
				}
				
				foreach($clientsArr as $client_ => $value):							
					$trainerInfo = get_user_by('id', $client_);					
					foreach($value as $client__):
						$user = User::find($client__);
						$currentUser = [
							'stats' => $user->getStats(),
							'photos' => $user->getPhotos()
						];
						
						$eachBPStats = getGoalPerc($currentUser['stats']); //Bodypart %s
						$bppavg = getBPPercAvg($eachBPStats); //Bodypart %s Average
						
						$user_info = get_user_by('id', $client__);
						$purpose =  get_user_meta($client__, 'sm_accomtext', true);
						
						$uPho = array();
						$userPhoto = "";
						if(!empty($currentUser['photos'])){
							$uPho = $currentUser['photos'];
							$countPho = count($uPho) - 1;
							$latestPho = $uPho[$countPho];
							$userPhoto = home_url() . '/sm-files/' . $latestPho['user_id'] . '/' . $latestPho['file'];
						}
						if($user_info):
			?>
				<tr>
					<td>
						<?php
							if($userPhoto)
								echo '<img src="'.$userPhoto.'"  class="img-responsive" style="max-width:50px;" />';
							else
								echo '<img src="'.get_stylesheet_directory_uri().'/accounts/images/client-1.png" />';
						?>
					</td>
					<td><?php echo $user_info->first_name . ' ' . $user_info->last_name; ?></td>
					<td> <?php echo ($purpose) ? $purpose : "--"; ?> </td>
					<td><?php echo $trainerInfo->first_name . ' ' . $trainerInfo->last_name; ?></td>
					<td>-- Days Ago</td>
					<td>
						<div class="progress client-goals-percentage">
							<div class="progress-bar" style="width: <?php echo $bppavg; ?>%;">
								<span class="indicator"><small><?php echo $bppavg; ?>%</small></span>
							</div>
						</div>
					</td>
				</tr>
			<?php 
						endif;
					endforeach;
				endforeach;
			?>
	        <!-- <tr>
	            <td><img src="<?php echo get_stylesheet_directory_uri().'/accounts/images/client-2.png';?>"></td>
	            <td>Client Name #1</td>
	            <td>Fat Loss</td>
	            <td>4 Days Ago</td>
	            <td>
	            	<div class="progress client-goals-percentage">
						<div class="progress-bar" style="width: 80%;">
							<span class="indicator"><small>80%</small></span>
						</div>
					</div>
	            </td>
	        </tr>
			-->
	    </tbody>
	</table>
	<?php endif; ?>
</div>