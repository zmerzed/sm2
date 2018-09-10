<div class="main-content matchHeight">
<?php if(isset($_GET['edit'])):?>
	<div class="current-status">
		<div class="row">
			<?php get_template_part( 'accounts/inc/edit-progress', 'page' ); ?>
		</div>
	</div>
<?php
elseif(isset($_GET['add'])):
		get_template_part( 'accounts/trainers/add-clients', 'page' );
else: ?>
	<div class="trainer-add-workout">
		<a href="<?php echo home_url(); ?>/trainer/?data=clients&add=1">+ Add Client</a>
	</div>
	<div class = "table-responsive list-table">
		<!-- <table id="table-sorter-logs" class="table table-striped table-bordered" style="width:100%"> -->
		<table id="" class="table table-striped table-bordered" style="width:100%">
		    <thead>
	        <tr>
	          <th>Photo</th>
	          <th>Name</th>
	          <th>Purpose</th>
	          <th>Last Activity</th>
	          <th style="min-width:120px;">Goal</th>
	          <th></th>
	        </tr>
		    </thead>
		    <tbody>
					<?php
						$clients = get_user_meta(wp_get_current_user()->ID, 'clients_of_trainer', true);
						if(!empty($clients)):
							foreach($clients as $client):
								$user = User::find($client);
								$currentUser = [
									'stats' => $user->getStats(),
									'photos' => $user->getPhotos()
								];		
								
								$eachBPStats = getGoalPerc($currentUser['stats']); //Bodypart %s
								$bppavg = getBPPercAvg($eachBPStats); //Bodypart %s Average
								
								$user_info = get_user_by('id', $client);
								$purpose =  get_user_meta($client, 'sm_accomtext', true);
								
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
											<td><?php echo $user_info->first_name . ' ' . $user_info->last_name;  ?></td>
											<td> <?php echo ($purpose) ? $purpose : "--"; ?> </td>
											<td>-- Days Ago</td>
											<td class = "w-50">
												<div class="progress client-goals-percentage">
													<div class="progress-bar" style="width: <?php echo $bppavg; ?>%;">
														<span class="indicator"><small><?php echo $bppavg; ?>%</small></span>
													</div>
												</div>
											</td>
											<td>
												<a href="<?php echo home_url(); ?>/trainer/?data=clients&edit=<?php echo $user_info->ID; ?>">Edit Progress</a>
											</td>
										</tr>
				<?php					
							endif;
						endforeach;
					endif;
				?>	
	    </tbody>
		</table>
	</div>
<?php endif; ?>
</div>