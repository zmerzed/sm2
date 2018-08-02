<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
<?php	
$user = User::find(get_current_user_id());
$currentUser = [
	'id' => $user->id,
	'files' => $user->getPhotos(),
	'stats' => $user->getStats()
];
$userGoalStart = $currentUser['stats']['start'];
$userGoal = $currentUser['stats']['goal'];
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

				<div class="chartContainer" id="chartContainer"></div>
			</div>
		</div>
	</div>
	<pre>
	<?php
		$results = [];
		$not_inc = ['id', 'type', 'client_id', 'updated_by', 'created_by', 'target_date','created_at', 'updated_at'];
		$gResults = getGoalResults($user);		
		foreach($gResults as $v){
			$ndate = date_create($v->created_at);
			$ndate = date_format($ndate, 'M d,Y');
			$temp = [];
			foreach($v as $k=>$ki){
				if(!in_array($k,$not_inc))
				 $temp[$k] = $ki;				
			}			
			$results[$ndate] = $temp;				
		}
		$resPercs = [];
		foreach($results as $resK => $resV){
			$resPerc = [];
			$resPerc['start'] = $userGoalStart;
			$resPerc['goal'] = $userGoal;
			$resPerc['result'] = $resV;
			$resPercs[$resK] = getBPPercAvg(getGoalPerc($resPerc));
		}
		$resCount = count($resPercs);
		$tctr = 0;
	?>
	</pre>
</div>
<!-- <script type="text/javascript" src="<?php echo get_stylesheet_directory_uri(); ?>/accounts/assets/js/jquery.canvasjs.min.js"></script>  -->
<script type="text/javascript" src="<?php echo get_stylesheet_directory_uri(); ?>/js/canvasjs.min.js"></script> 
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
	window.onload = function() {
		var chart = new CanvasJS.Chart("chartContainer", {		
			title: {
				text: ""
			},
			data: [{
				lineColor: '#ae1f23',
				markerColor: '#ae1f23',
				lineThickness: 1,
				markerBorderThickness: 3,
				type: "line",
				toolTipContent: "{label}:  <b>{y}%</b>",				
				indexLabelFontSize: 12,
				indexLabel: "{y}%",
				dataPoints: [
					<?php
						if(!empty($resPercs)){
							foreach($resPercs as $rpK=>$rpV){
								$tctr++;
								echo '{ label: "'.$rpK.'",  y: '.$rpV.' }';							
								echo ($tctr == $resCount) ? "" : ",";
							}
						}else{
							echo '{ label: "0",  y: 0 }';
						}				
					?>						
				]
			}]
		});
		chart.render();
	}
	/* if(jQuery('.chartContainer').length != 0){
		jQuery(".chartContainer").CanvasJSChart({
			title: {
				text: ""
			},
			axisY: {
				title: "",
				includeZero: false
			},
			axisX: {
				interval: 10
			},
			data: [
				{
					type: "line", //try changing to column, area
					toolTipContent: "({label}) {y}%",
					dataPoints: [
						<?php							
							foreach($resPercs as $rpK=>$rpV){
								$tctr++;
								echo '{ label: "'.$rpK.'",  y: '.$rpV.' }';							
								echo ($tctr == $resCount) ? "" : ",";
							}
						?>						
					]
				}
			]
		});  		  
	}   */ 
</script>