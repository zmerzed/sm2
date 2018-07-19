<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
<?php $uinfo = wp_get_current_user(); ?>
<?php
	require_once getcwd() . '/wp-customs/User.php';
	$user = User::find(get_current_user_id());
	$currentUser = [
		'id' => $user
	];


	if (isset($_GET['edit'])) {
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

			wp_redirect( get_site_url() . '/trainer/?data=clients&edit='. $_GET['edit']);
		}
	}
?>

<div ng-app="smApp" ng-controller="trainerStatsController">
	<div class="col-lg-8 col-md-8">
		<form id="idStatsForm" action="?data=clients&edit=<?php echo $_GET['edit']; ?>" method="POST">
		<div class="current-goal">
			<h3>Goal</h3>
				<table style="width: 100%;">
					<tbody><tr>
						<th></th>
						<th>Start #s</th>
						<th>Goal #s</th>
					</tr>

					<tr>
						<td><label>Weight</label></td>
						<td><input type="text" ng-model="stats.start.weight"></td>
						<td><input type="text" ng-model="stats.goal.weight"></td>
					</tr>
					<tr>
						<td><label>Body Fat (%)</label></td>
						<td><input type="text" ng-model="stats.start.body_fat"></td>
						<td><input type="text" ng-model="stats.goal.body_fat"></td>
					</tr>
					<tr>
						<td><label>Waist</label></td>
						<td><input type="text" ng-model="stats.start.waist"></td>
						<td><input type="text" ng-model="stats.goal.waist"></td>
					</tr>
					<tr>
						<td><label>chest</label></td>
						<td><input type="text" ng-model="stats.start.chest"></td>
						<td><input type="text" ng-model="stats.goal.chest"></td>
					</tr>
					<tr>
						<td><label>arms</label></td>
						<td><input type="text"ng-model="stats.start.arms"></td>
						<td><input type="text"ng-model="stats.goal.arms"></td>
					</tr>
					<tr>
						<td><label>forearms</label></td>
						<td><input type="text" ng-model="stats.start.forearms"></td>
						<td><input type="text" ng-model="stats.goal.forearms"></td>
					</tr>
					<tr>
						<td><label>shoulders</label></td>
						<td><input type="text" ng-model="stats.start.shoulders"></td>
						<td><input type="text" ng-model="stats.goal.shoulders"></td>
					</tr>
					<tr>
						<td><label>hips</label></td>
						<td><input type="text" ng-model="stats.start.hips"></td>
						<td><input type="text" ng-model="stats.goal.hips"></td>
					</tr>
					<tr>
						<td><label>thighs</label></td>
						<td><input type="text" ng-model="stats.start.thighs"></td>
						<td><input type="text" ng-model="stats.goal.thighs"></td>
					</tr>
					<tr>
						<td><label>calves</label></td>
						<td><input type="text" ng-model="stats.start.calves"></td>
						<td><input type="text" ng-model="stats.goal.calves"></td>
					</tr>
					<tr>
						<td><label>neck</label></td>
						<td><input type="text" ng-model="stats.start.neck"></td>
						<td><input type="text" ng-model="stats.goal.neck"></td>
					</tr>
					<tr>
						<td><label>height</label></td>
						<td><input type="text" ng-model="stats.start.height"></td>
						<td><input type="text" ng-model="stats.goal.height"></td>
					</tr>
					</tbody></table>
		</div>
	</div>
	<?php if(getMembershipLevel($uinfo) != "client"): ?>
		<div class="col-lg-4 col-md-4">
			<div class="current-goal">
				<h3>Today</h3>
				<table style="width: 100%;">
					<tbody><tr>
						<th>Current #s</th>
					</tr>
					<tr>
						<td><input type="text" ng-model="stats.result.weight"></td>
					</tr>
					<tr>
						<td><input type="text" ng-model="stats.result.body_fat"></td>
					</tr>
					<tr>
						<td><input type="text" ng-model="stats.result.waist"></td>
					</tr>
					<tr>
						<td><input type="text" ng-model="stats.result.chest"></td>
					</tr>
					<tr>
						<td><input type="text"ng-model="stats.result.arms"></td>
					</tr>
					<tr>
						<td><input type="text" ng-model="stats.result.forearms"></td>
					</tr>
					<tr>
						<td><input type="text" ng-model="stats.result.shoulders"></td>
					</tr>
					<tr>
						<td><input type="text" ng-model="stats.result.hips"></td>
					</tr>
					<tr>
						<td><input type="text" ng-model="stats.result.thighs"></td>
					</tr>
					<tr>
						<td><input type="text" ng-model="stats.result.calves"></td>
					</tr>
					<tr>
						<td><input type="text" ng-model="stats.result.neck"></td>
					</tr>
					<tr>
						<td><input type="text" ng-model="stats.result.height"></td>
					</tr>
					</tbody></table>
			</div>
			<div style="text-align:center;padding:10px 0;">
				<input type="hidden" name="statsFormData" id="idStatsFormData"/>
				<button type="submit" class="red-btn" ng-click="update()">Update</button>
			</div>
		</div>
		</form>
	<?php endif; ?>
</div>

<script>
	var ROOTURL = '<?php echo get_site_url(); ?>',
		USER_ID = '<?php echo get_current_user_id(); ?>',
		CURRENT_USER = JSON.parse('<?php echo json_encode($currentUser); ?>'),
		CLIENT = JSON.parse('<?php echo json_encode($client); ?>'),
		STAT = JSON.parse('<?php echo json_encode(User::getDefaultStat()); ?>');
</script>
<script type="text/javascript" src="<?php echo get_stylesheet_directory_uri() .'/js/angular/app.js'; ?>"></script>
<script type="text/javascript" src="<?php echo get_stylesheet_directory_uri() .'/js/angular/trainerStatsController.js'; ?>"></script>