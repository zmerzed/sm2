<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
<?php	
$user = User::find(get_current_user_id());
$currentUser = [
	'id' => $user->id,
	'files' => $user->getPhotos(),
	'stats' => $user->getStats()
];
?>

<div class="main-content matchHeight">

	<div class="container-title">
        <h3>Current Status</h3>
    </div>
	
	<?php	
		$status_arr = getGoalPerc($currentUser['stats']);
	?>

	<div class="current-status">
		<div class="row">
			<div class="col-lg-6 col-md-6">
				<div class="status-bar">
					<table>						
						<?php						
							foreach($status_arr as $v=>$sa):
								$gw = $sa['gw'];//Goal           
								$sw = $sa['sw'];//Start           
								$cw = $sa['cw'];//Current								
								
								$pp = round(abs(calcppbp($gw, $sw ,$cw)));//calculate Percentage per bodyparts
						?>
							<tr>
								<!-- <td><?php echo "GW:" .$gw. ", SW:" .$sw .", CW:" .$cw . ", PP:". $pp; ?><hr></td> -->
								<td class="progress-title"><label><?php echo $v; ?></label></td>
								<td class="progress-status-bar">
									<div class="progress">
										<div class="progress-bar" style="width: <?php echo $pp; ?>%;">
											<span class="indicator"><small><?php echo $pp; ?>%</small></span>
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
<script>	
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