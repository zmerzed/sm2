<div class="main-content matchHeight">

	<div class="container-title">
        <h3>Current Status</h3>
    </div>
	
	<?php
		$status_arr = array(
			"weight" => array('gw'=>180,'sw'=>167, 'cw'=>168),
			"body fat" => array('gw'=>26,'sw'=>20, 'cw'=>26),
			"waist" => array('gw'=>34,'sw'=>32, 'cw'=>34),
			"chest" => array('gw'=>36,'sw'=>40, 'cw'=>39),
			"arms" => array('gw'=>34,'sw'=>32, 'cw'=>34),
			"forearms" => array('gw'=>34,'sw'=>32, 'cw'=>34),
			"shoulders" => array('gw'=>34,'sw'=>32, 'cw'=>34),
			"hips" => array('gw'=>34,'sw'=>32, 'cw'=>34),
			"thighs" => array('gw'=>24,'sw'=>28, 'cw'=>24),
			"calves" => array('gw'=>16,'sw'=>18, 'cw'=>16),
			"neck" => array('gw'=>12,'sw'=>14, 'cw'=>12),
			"height" => array('gw'=>177.8,'sw'=>177.8, 'cw'=>177.8)
		);		
	?>

	<div class="current-status">
		<div class="row">
			<div class="col-lg-6 col-md-6">
				<div class="status-bar">
					<table>						
						<?php						
							foreach($status_arr as $v=>$sa):
								$gw = $sa['gw'];//Goal Weight           
								$sw = $sa['sw'];//Start Weight           
								$cw = $sa['cw'];//Current Weight
								$pp = 0;
								$ea = 0;// Expected answer: 0 - negative; 1 - positive
								
								if($gw > $sw){//Gain
									
									if($cw > $sw){
										$pp = ( ($sw - $cw) / ($gw - $sw) ) * 100;
									}elseif($cw < $sw){
										$pp = 0;
									}else{
										$pp = 0;
									}
									
								}elseif($gw < $sw){//Loss
									if($cw < $sw){
										$pp = ( ($sw - $cw) / ($gw - $sw) ) * 100;
									}elseif($cw > $sw){
										$pp = 0;
									}else{
										$pp = 0;
									}
								}else{
									$pp = 0;
								}
								$pp = round(abs($pp));
						?>
							<tr>
								<!-- <td><?php echo "GW:" .$gw. ", SW:" .$sw .", CW:" .$cw . ", PP:". $pp; ?><hr></td> -->
								<td class="progress-title"><label><?php echo $v; ?></label></td>
								<td class="progress-status-bar">
									<div class="progress">
										<div class="progress-bar" style="width: <?php echo round(abs($pp)); ?>%;">
											<span class="indicator"><small><?php echo round(abs($pp)); ?>%</small></span>
										</div>
									</div>
								</td>
							</tr>
						<?php endforeach; ?>						
					</table>
				</div>
			</div>
			<div class="col-lg-6 col-md-6" ng-app="">
				<ul class="body-pictures-status" id="bodypic">
					<!-- <li>
						<img src="<?php echo get_stylesheet_directory_uri() .'/accounts/images/picture-01.png'; ?>">
						<span class="pictures-body-date">1/12/2017</span>
					</li>
					<li>
						<img src="<?php echo get_stylesheet_directory_uri() .'/accounts/images/picture-02.png'; ?>">
						<span class="pictures-body-date">1/12/2017</span>
					</li>
					<li>
						<img src="<?php echo get_stylesheet_directory_uri() .'/accounts/images/picture-03.png'; ?>">
						<span class="pictures-body-date">1/12/2017</span>
					</li>
					<li>
						<img src="<?php echo get_stylesheet_directory_uri() .'/accounts/images/picture-04.png'; ?>">
						<span class="pictures-body-date">1/12/2017</span>
					</li> -->
				</ul>

				<div class="chartContainer"></div>
			</div>
		</div>
	</div>

</div>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
<script>
	<?php
		require_once getcwd() . '/wp-customs/User.php';		
		$user = User::find(get_current_user_id());
		$currentUser = [
			'id' => $user->id,
			'files' => $user->getPhotos()
		];
		
		/* echo "<pre>";
		print_r($currentUser);
		echo "</pre>"; */
	?>
	
	var curUser = <?php echo json_encode($currentUser); ?>,
	homeUrl = "<?php echo home_url(); ?>",
	bodyPhotosHTML = "";
	if(curUser.length != 0){
		curUser['files'].forEach(function(e){
			
			var imgSrc = homeUrl +'/sm-files/'+ e['user_id']  +'/'+ e['file'];
			bodyPhotosHTML += '<li>';		
			bodyPhotosHTML += '<img src="'+imgSrc+'" class="img-responsive">';	
			bodyPhotosHTML += '<span class="pictures-body-date">'+e['uploaded_at']+'</span>';	
			bodyPhotosHTML += '</li>';		
		});
	}else{	
		bodyPhotosHTML += '<li>No Photos</li>';
	}
	
	document.getElementById('bodypic').innerHTML = bodyPhotosHTML;
	
</script>