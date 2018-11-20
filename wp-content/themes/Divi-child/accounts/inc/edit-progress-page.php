<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
<?php $uinfo = wp_get_current_user(); ?>
<?php
	require_once getcwd() . '/wp-customs/User.php';
	$user = User::find(get_current_user_id());
	$currentUser = [
		'id' => $user
	];


	if (isset($_GET['edit'])) {
		$client_ = get_user_by('id',$_GET['edit']);
		$client = User::find((int) $_GET['edit']);
		$client->stats = $client->getStats();
	} else {
		$client = User::find(get_current_user_id());
		$client->stats = $client->getStats();
	}

	if( $_SERVER['REQUEST_METHOD'] == 'POST' )
	{
		if ($client && isset($_POST['statsFormData']))
		{
			$states = htmlspecialchars_decode($_POST['statsFormData'], ENT_NOQUOTES);
			$states = preg_replace('/\\\"/',"\"", $states);
			$states = stripslashes($states);
			$states = json_decode($states, true);
			$result = $client->modifyStat($states, get_current_user_id());

			/* wp_redirect( get_site_url() . '/trainer/?data=clients&edit='. $_GET['edit']); */
			echo '<script>window.location.href="'.get_site_url() . '/trainer/?data=clients&edit='. $_GET['edit'].'";</script>';
		}elseif($client && isset($_GET['editprofile'])){
			
			//Check DOB
			$nudob = $_POST['udob'];
			if($nudob != "")
				update_user_meta($_GET['edit'], 'sm_dob', $nudob);
			
			//Check Gender
			$nugender = $_POST['ugender'];
			if($nugender != "")
				update_user_meta($_GET['edit'], 'sm_gender', $nugender);
			
			echo '<script>window.location.href="'.home_url('/trainer/?data=clients&edit=') . $_GET['edit'].'";</script>';
		}
	}
	
	$clients_of_trainer = get_user_meta(get_current_user_id(), 'clients_of_trainer');
	if(isset($_GET['editprofile']) && in_array($_GET['edit'],$clients_of_trainer[0])){	
		$umeta = get_user_meta($_GET['edit']);		
		$udob = "";
		$ugender = "";
		
		if(isset($umeta['sm_dob']))
			$udob = $umeta['sm_dob'][0];
		
		if(isset($umeta['sm_gender']))
			$ugender = $umeta['sm_gender'][0];
?>
<div class="col-lg-12 col-md-12" id="editinfo">	
	<p><h3 style="color:#ae1f23;text-transform:uppercase;font-weight:700;">Edit info</h3></p>
	<form action="<?php echo $_SERVER['REQUEST_URI']; ?>" method="post">
		<p>
			<label>DOB</label>
			<input type="date" name="udob" value="<?php echo $udob;  ?>" />
		</p>
		<p>
			<label>Gender</label>
			<select name="ugender">
				<option>-- Select gender --</option>
				<option value="male" <?php echo ($ugender == 'male') ? 'selected="selected"' : ''; ?> >Male</option>
				<option value="female" <?php echo ($ugender == 'female') ? 'selected="selected"' : ''; ?> >Female</option>
			</select>
		</p>
		<input type="hidden" name="submitted" value="1" />
		<input type="submit" value="update" />
		<a href="<?php echo home_url('/trainer/?data=clients&edit=') . $_GET['edit']; ?>" class="red-btn">Cancel</a>
	</form>
</div>
	<?php }else{ ?>

<div ng-app="smApp" ng-controller="trainerStatsController" class="trainerStatsController">
<form id="idStatsForm" action="?data=clients&edit=<?php echo $_GET['edit']; ?>" method="POST">
	<div class="col-lg-8 col-md-8 col-sm-12">
		
		<div class="current-goal">
			<h3>Goal</h3>
			<div class="bodyMeasures">
				<table style="width: 100%;">
					<tbody><tr>
						<th></th>
						<th>Start #s</th>
						<th>Goal #s</th>
					</tr>					
					<tr>
						<td><label>Height (in)</label></td>
						<td><input type="text" ng-model="stats.start.height"></td>
						<td><input type="text" ng-model="stats.goal.height"></td>
					</tr>
					<tr>
						<td><label>Weight (lbs)</label></td>
						<td><input type="text" ng-model="stats.start.weight"></td>
						<td><input type="text" ng-model="stats.goal.weight"></td>
					</tr>					
					<tr>
						<td><label>Waist (in)</label></td>
						<td><input type="text" ng-model="stats.start.waist"></td>
						<td><input type="text" ng-model="stats.goal.waist"></td>
					</tr>
					<tr>
						<td><label>Chest (in)</label></td>
						<td><input type="text" ng-model="stats.start.chest"></td>
						<td><input type="text" ng-model="stats.goal.chest"></td>
					</tr>
					<tr>
						<td><label>Arms (in)</label></td>
						<td><input type="text"ng-model="stats.start.arms"></td>
						<td><input type="text"ng-model="stats.goal.arms"></td>
					</tr>
					<tr>
						<td><label>Forearms (in)</label></td>
						<td><input type="text" ng-model="stats.start.forearms"></td>
						<td><input type="text" ng-model="stats.goal.forearms"></td>
					</tr>
					<tr>
						<td><label>Shoulders (in)</label></td>
						<td><input type="text" ng-model="stats.start.shoulders"></td>
						<td><input type="text" ng-model="stats.goal.shoulders"></td>
					</tr>
					<tr>
						<td><label>Hips (in)</label></td>
						<td><input type="text" ng-model="stats.start.hips"></td>
						<td><input type="text" ng-model="stats.goal.hips"></td>
					</tr>
					<tr>
						<td><label>Thighs (in)</label></td>
						<td><input type="text" ng-model="stats.start.thighs"></td>
						<td><input type="text" ng-model="stats.goal.thighs"></td>
					</tr>
					<tr>
						<td><label>Calves (in)</label></td>
						<td><input type="text" ng-model="stats.start.calves"></td>
						<td><input type="text" ng-model="stats.goal.calves"></td>
					</tr>
					<tr>
						<td><label>Neck (in)</label></td>
						<td><input type="text" ng-model="stats.start.neck"></td>
						<td><input type="text" ng-model="stats.goal.neck"></td>
					</tr>									
					</tbody>
				</table>
			</div>
			<div class="bodyFatContainer">
				<?php
					global $wp;
					$gender = "";
					$dob = 0;
					$age = -1;
					
					if($client_->sm_dob){
						$dob = $client_->sm_dob;

						$birthDate = explode("-", $dob);
						$age = (date("md", date("U", mktime(0, 0, 0, $birthDate[2], $birthDate[1], $birthDate[0]))) > date("md") ? ((date("Y") - $birthDate[0]) - 1)	: (date("Y") - $birthDate[0]));	
					}
					
					
					if($client_->sm_gender)
						$gender = $client_->sm_gender;
					
					echo ($age == -1) ? "Age is not set<br>" : "";
					echo ($gender == "") ? "Gender is not set<br>" : "";
					
					echo ($age == -1 || $gender == "") ? '<a href="'.home_url( $wp->request ).'/?data=clients&edit='.$client->ID.'&editprofile="">Click here to set</a>' : "";
						
				?>
				<table>
					<tbody>
						<tr>
							<td><label>Body Fat (%)</label></td>
							<td>
								<!-- <input type="text" ng-model="stats.start.body_fat" onclick="inputSevenSkinFolds(this);" bfp="start"> -->
								<input type="text" readonly class="bf_start"  bfp="start">
							</td>
							<td>
								<!-- <input type="text" ng-model="stats.goal.body_fat"> -->
								<input type="text" class="bf_goal" readonly>
							</td>
						</tr>
					</tbody>
				</table>
				<table class="skifoldTable">
					<thead>
						<tr>
							<th>&nbsp;</th>
							<th>Skinfolds(mm)</th>
							<th>Skinfolds(mm)</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><label>Chest</label></td>
							<td><input name="start_chest_skinfold" ng-model="stats.start.chest_skinfold" type="text" class="form-control" /></td>
							<td><input name="goal_chest_skinfold" ng-model="stats.goal.chest_skinfold" type="text" class="form-control" /></td>
						</tr>
						<tr>
							<td><label>Abdominal</label></td>
							<td><input name="start_abdominal" ng-model="stats.start.abdominal" type="text" class="form-control" /></td>
							<td><input name="goal_abdominal" ng-model="stats.goal.abdominal" type="text" class="form-control" /></td>
						</tr>
						<tr>
							<td><label>Thigh</label></td>
							<td><input name="start_thigh_skinfold" ng-model="stats.start.thigh_skinfold" type="text" class="form-control" /></td>
							<td><input name="goal_thigh_skinfold" ng-model="stats.goal.thigh_skinfold" type="text" class="form-control" /></td>
						</tr>	
						<tr>
							<td><label>Tricep</label></td>
							<td><input name="start_tricep" ng-model="stats.start.tricep" type="text" class="form-control" /></td>
							<td><input name="goal_tricep" ng-model="stats.goal.tricep" type="text" class="form-control" /></td>
						</tr>	
						<tr>
							<td><label>Subscalar</label></td>
							<td><input name="start_subscapular" ng-model="stats.start.subscalar" type="text" class="form-control" /></td>
							<td><input name="goal_subscapular" ng-model="stats.goal.subscalar" type="text" class="form-control"  /></td>
						</tr>	
						<tr>
							<td><label>Suprailiac</label></td>
							<td><input name="start_suprailiac" ng-model="stats.start.suprailiac" type="text" class="form-control" /></td>
							<td><input name="goal_suprailiac" ng-model="stats.goal.suprailiac" type="text" class="form-control" /></td>
						</tr>
						<tr>
							<td><label>Midaxillary</label></td>
							<td><input name="start_midaxillary" ng-model="stats.start.midaxillary" type="text" class="form-control" /></td>
							<td><input name="goal_midaxillary" ng-model="stats.goal.midaxillary" type="text" class="form-control" /></td>
						</tr>	
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<?php if(getMembershipLevel($uinfo) != "client"): ?>
		<div class="col-lg-4 col-md-4 col-sm-12">
			<div class="current-goal">
				<h3>Submit New Measurements</h3>
				<div class="bodyMeasures">
					<table style="width: 100%;">
						<tbody><tr>
							<th class="text-center">{{currentDate}}</th>
						</tr>
						<tr>
							<td>
								<input class="currentinput" type="text">
								<input type="text" style="display:none;" ng-model="stats.result.height">
							</td>
						</tr>
						<tr>
							<td>
								<input class="currentinput" type="text">
								<input type="text" style="display:none;" ng-model="stats.result.weight">
							</td>
						</tr>	
						<tr>
							<td>
								<input class="currentinput" type="text">
								<input type="text" style="display:none;" ng-model="stats.result.waist">
							</td>
						</tr>
						<tr>
							<td>
								<input class="currentinput" type="text">
								<input type="text" style="display:none;" ng-model="stats.result.chest">
							</td>
						</tr>
						<tr>
							<td>
								<input class="currentinput" type="text">
								<input type="text" style="display:none;" ng-model="stats.result.arms">
							</td>
						</tr>
						<tr>
							<td>
								<input class="currentinput" type="text">
								<input type="text" style="display:none;" ng-model="stats.result.forearms">
							</td>
						</tr>
						<tr>
							<td>
								<input class="currentinput" type="text">
								<input type="text" style="display:none;" ng-model="stats.result.shoulders">
							</td>
						</tr>
						<tr>
							<td>
								<input class="currentinput" type="text">
								<input type="text" style="display:none;" ng-model="stats.result.hips">
							</td>
						</tr>
						<tr>
							<td>
								<input class="currentinput" type="text">
								<input type="text" style="display:none;" ng-model="stats.result.thighs">
							</td>
						</tr>
						<tr>
							<td>
								<input class="currentinput" type="text">
								<input type="text" style="display:none;" ng-model="stats.result.calves">
							</td>
						</tr>
						<tr>
							<td>
								<input class="currentinput" type="text">
								<input type="text" style="display:none;" ng-model="stats.result.neck">
							</td>
						</tr>										
					</tbody></table>
				</div>
				<div class="bodyFatContainer">						
					<table>
						<tbody>
							<tr>
								<td>
									<input type="text" class="bf_result" readonly bfp="today">
									<!-- <input type="text" ng-model="stats.result.body_fat" onclick="inputSevenSkinFolds(this);" bfp="today">
									<a href="javascript:void(0);" class="btn red-btn" onclick="getResult('body_fat')"><i class="fa fa-history"></i></a> -->
								</td>
							</tr>
						</tbody>
					</table>
					<table class="skifoldTable">
						<thead>
							<tr>
								<th>Skinfolds(mm)</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>
									<input class="currentinput" type="text">
									<input style="display:none;" name="result_chest_skinfold" ng-model="stats.result.chest_skinfold" type="text" class="form-control" />
								</td>
							</tr>	
							<tr>
								<td>
									<input class="currentinput" type="text">
									<input style="display:none;" name="result_abdominal" ng-model="stats.result.abdominal" type="text" class="form-control" />
								</td>
							</tr>
							<tr>
								<td>
									<input class="currentinput" type="text">
									<input style="display:none;" name="result_thigh_skinfold" ng-model="stats.result.thigh_skinfold" type="text" class="form-control" />
								</td>
							</tr>	
							<tr>
								<td>
									<input class="currentinput" type="text">
									<input style="display:none;" name="result_tricep" ng-model="stats.result.tricep" type="text" class="form-control" />
								</td>
							</tr>	
							<tr>
								<td>
									<input class="currentinput" type="text">
									<input style="display:none;" name="result_subscapular" ng-model="stats.result.subscalar" type="text" class="form-control" />
								</td>
							</tr>	
							<tr>
								<td>
									<input class="currentinput" type="text">
									<input style="display:none;" name="result_suprailiac" ng-model="stats.result.suprailiac" type="text" class="form-control"/>
								</td>
							</tr>	
							<tr>
								<td>
									<input class="currentinput" type="text">
									<input style="display:none;" name="result_midaxillary" ng-model="stats.result.midaxillary" type="text" class="form-control" />
								</td>
							</tr>	
						</tbody>
					</table>
				</div>
				<input type="hidden" name="statsFormData" id="idStatsFormData"/>
				<button type="submit" class="red-btn mt-3" ng-click="update()">Submit</button>
			</div>			
		</div>		
		<?php endif; ?>
		<input type="hidden" name="skinfold_age" value="<?php echo $age; ?>" />
		<input type="hidden" name="skinfold_gender" value="<?php echo $gender; ?>" />
	</form>
</div>
<?php
$results = getGoalResults($client_);
//printVar(getGoalPerc($results));
?>
<div class="measurement-history">
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"><h3>Measurment History</h3></div>
	<?php if(empty($results)): ?>
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"><p>No Results</p></div>
	<?php else: ?>
		<div class="col-lg-8 col-md-8 col-sm-8 col-xs-12 history-dates">
			<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
				<div class="row">
				<?php
					$keyArr = array();
					foreach($results as $k=>$res){
						if($k == 0){
							foreach($res as $key=>$r){										
								if(!in_array($key, ['id','type','client_id','age','created_by','target_date','created_at','updated_at','updated_by']))
									$keyArr[] = $key;
							}										
						}
					}
					moveElement($keyArr,1,11);
					moveElement($keyArr,12,18);
					moveElement($keyArr,10,0);
				?>
					<table class="table table-striped freezed">
						<tbody>
							<tr>
								<th>&nbsp;</th>
							</tr>
							<?php foreach($keyArr as $ka){ ?>
								<tr>
									<td align="right"><?php echo str_replace('_skinfold','',$ka); ?></td>
								</tr>
							<?php } ?>
						</tbody>
					</table>
				</div>
			</div>
			<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
				<div class="row">
					<div class="table-responsive">
						<table class="table table-striped">
							<tbody>
								<tr>
									<?php foreach($results as $res){ ?>
										<th><?php echo date_format(date_create($res->updated_at), 'm/d/Y'); ?></th>
									<?php } ?>
								</tr>
								<?php foreach($keyArr as $ka){ ?>
									<tr>
										<?php
											foreach($results as $res2){
												if($ka != "body_fat")
													echo ($res2->$ka != "") ? '<td align="center">' . $res2->$ka . '</td>' : '<td align="center">0</td>';
												else
													echo '<td align="center">0%</td>';
											}								
										?>
									</tr>
								<?php } ?>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 history-progress">
			<table class="table">
				<tr>
					<th class="text-center">Progress</th>
				</tr>
				<?php foreach($keyArr as $ka){ ?>
					<tr>
						<td>
							<div class="progress client-goals-percentage">
								<div class="progress-bar" style="width: 50%;">
									<span class="indicator"><small>50%</small></span>
								</div>
							</div>
						</td>
					</tr>
				<?php } ?>
			</table>
		</div>
	<?php endif; ?>
</div>
<script>

	var ROOTURL = '<?php echo get_site_url(); ?>',
		USER_ID = '<?php echo get_current_user_id(); ?>',
		CURRENT_USER = JSON.parse('<?php echo json_encode($currentUser); ?>'),
		CLIENT = JSON.parse('<?php echo json_encode($client); ?>'),
		STAT = JSON.parse('<?php echo json_encode(User::getDefaultStat()); ?>'),
		CURRENT_DATE = '<?php echo current_time( 'mysql' ); ?>';
</script>
<script type="text/javascript" src="<?php echo get_stylesheet_directory_uri() .'/js/angular/app.js'; ?>"></script>
<script type="text/javascript" src="<?php echo get_stylesheet_directory_uri() .'/js/angular/trainerStatsController.js'; ?>"></script>

<script>
$(window).ready(function () {
	$('.sevenfolds div').appendTo($('#workoutModal .modal-body'));
	$('input[name="gender"]').change(function(){
		$(this).closest('.fatcalc').find('input[name="hgender"]').val($(this).val());
	});
	$('input[name="gender2"]').change(function(){
		$(this).closest('.fatcalc').find('input[name="hgender"]').val($(this).val());
	});
	$('.skifoldTable input').on('keyup',function(){
		updateSkinfold();
	});
	$('.currentinput').on('keyup',function(){
		$(this).closest('td').find('input:hidden').val($(this).val());
		$(this).closest('td').find('input:hidden').trigger('change').trigger('input');
	});
	
	updateSkinfold();
});

function updateSkinfold(){
	var bf_start = 0,
	bf_goal = 0,
	bf_result = 0.
	age = $('input[name="skinfold_age"]').val(),
	gender = $('input[name="skinfold_gender"]').val();
	
	bf_start = calc7Folds('start',gender,age);
	bf_goal = calc7Folds('goal',gender,age);
	bf_result = calc7Folds('result',gender,age);
	
	$('.bf_start').val(bf_start.toFixed(6)+"%");
	$('.bf_goal').val(bf_goal.toFixed(6)+"%");
	$('.bf_result').val(bf_result.toFixed(6)+"%");
	
}

function calc7Folds(tF,gender,age){
	
	if(tF != 'result'){
		var chest = parseInt($('input[name="'+tF+'_chest_skinfold"]').val()),
		abdominal = parseInt($('input[name="'+tF+'_abdominal"]').val()),
		thigh = parseInt($('input[name="'+tF+'_thigh_skinfold"]').val()),
		tricep = parseInt($('input[name="'+tF+'_tricep"]').val()),
		subscapular = parseInt($('input[name="'+tF+'_subscapular"]').val()),
		suprailiac = parseInt($('input[name="'+tF+'_suprailiac"]').val()),
		midaxillary = parseInt($('input[name="'+tF+'_midaxillary"]').val());			
	}else{
		var chest = parseInt($('input[name="'+tF+'_chest_skinfold"]').closest('td').find('.currentinput').val()),
		abdominal = parseInt($('input[name="'+tF+'_abdominal"]').closest('td').find('.currentinput').val()),
		thigh = parseInt($('input[name="'+tF+'_thigh_skinfold"]').closest('td').find('.currentinput').val()),
		tricep = parseInt($('input[name="'+tF+'_tricep"]').closest('td').find('.currentinput').val()),
		subscapular = parseInt($('input[name="'+tF+'_subscapular"]').closest('td').find('.currentinput').val()),
		suprailiac = parseInt($('input[name="'+tF+'_suprailiac"]').closest('td').find('.currentinput').val()),
		midaxillary = parseInt($('input[name="'+tF+'_midaxillary"]').closest('td').find('.currentinput').val());
	}	
	
	chest = chest ? chest : 0;
	abdominal = abdominal ? abdominal : 0;
	thigh = thigh ? thigh : 0;
	tricep = tricep ? tricep : 0;
	subscapular = subscapular ? subscapular : 0;
	suprailiac = suprailiac ? suprailiac : 0;
	midaxillary = midaxillary ? midaxillary : 0;
	
	s = chest + abdominal + thigh + tricep + subscapular + suprailiac + midaxillary;	
	
	if(s == 0)
		return 0;
	else{
		if (gender == "male")
			return 495 / (1.112 - (0.00043499 * s) + (0.00000055 * s * s) - (0.00028826 * age)) - 450;
		else if (gender == "female")
			return 495 / (1.097 - (0.00046971 * s) + (0.00000056 * s * s) - (0.00012828 * age)) - 450;
		else
			return 0;
	}
}
</script>
	<?php } //END IF ?>