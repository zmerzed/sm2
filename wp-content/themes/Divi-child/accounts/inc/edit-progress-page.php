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

			/* wp_redirect( get_site_url() . '/trainer/?data=clients&edit='. $_GET['edit']); */
			echo '<script>window.location.href="'.get_site_url() . '/trainer/?data=clients&edit='. $_GET['edit'].'";</script>';
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
						<td><label>Weight (lbs)</label></td>
						<td><input type="text" ng-model="stats.start.weight"></td>
						<td><input type="text" ng-model="stats.goal.weight"></td>
					</tr>
					<tr>
						<td><label>Body Fat (%)</label></td>
						<td><input type="text" ng-model="stats.start.body_fat" onclick="inputSevenSkinFolds(this);" bfp="start"></td>
						<td><input type="text" ng-model="stats.goal.body_fat"></td>
					</tr>
					<tr>
						<td><label>Waist (cm)</label></td>
						<td><input type="text" ng-model="stats.start.waist"></td>
						<td><input type="text" ng-model="stats.goal.waist"></td>
					</tr>
					<tr>
						<td><label>Chest (cm)</label></td>
						<td><input type="text" ng-model="stats.start.chest"></td>
						<td><input type="text" ng-model="stats.goal.chest"></td>
					</tr>
					<tr>
						<td><label>Arms (cm)</label></td>
						<td><input type="text"ng-model="stats.start.arms"></td>
						<td><input type="text"ng-model="stats.goal.arms"></td>
					</tr>
					<tr>
						<td><label>Forearms (cm)</label></td>
						<td><input type="text" ng-model="stats.start.forearms"></td>
						<td><input type="text" ng-model="stats.goal.forearms"></td>
					</tr>
					<tr>
						<td><label>Shoulders (cm)</label></td>
						<td><input type="text" ng-model="stats.start.shoulders"></td>
						<td><input type="text" ng-model="stats.goal.shoulders"></td>
					</tr>
					<tr>
						<td><label>Hips (cm)</label></td>
						<td><input type="text" ng-model="stats.start.hips"></td>
						<td><input type="text" ng-model="stats.goal.hips"></td>
					</tr>
					<tr>
						<td><label>Thighs (cm)</label></td>
						<td><input type="text" ng-model="stats.start.thighs"></td>
						<td><input type="text" ng-model="stats.goal.thighs"></td>
					</tr>
					<tr>
						<td><label>Calves (cm)</label></td>
						<td><input type="text" ng-model="stats.start.calves"></td>
						<td><input type="text" ng-model="stats.goal.calves"></td>
					</tr>
					<tr>
						<td><label>Neck (cm)</label></td>
						<td><input type="text" ng-model="stats.start.neck"></td>
						<td><input type="text" ng-model="stats.goal.neck"></td>
					</tr>
					<tr>
						<td><label>Height (cm)</label></td>
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
						<td><input type="text" ng-model="stats.result.body_fat" onclick="inputSevenSkinFolds(this);" bfp="end"></td>
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
<div class="sevenfolds" style="display:none;">
	<div>
		<h4>Gender</h4>
		<label>
			<input type="radio" name="gender" value="M" /> Male
		</label>
		<label>
			<input type="radio" name="gender" value="F" /> Female
		</label>
		<input type="hidden" value="" name="hgender" />
		<hr>
		<input type="number" class="form-control" placeholder="Age" name="age" />
		<br>
		<input type="number" class="form-control" placeholder="Chest skinfold(mm)" name="chest" />
		<br>
		<input type="number" class="form-control" placeholder="Abdominal skinfold(mm)" name="abdominal" />
		<br>
		<input type="number" class="form-control" placeholder="Thigh skinfold(mm)" name="thigh" />
		<br>
		<input type="number" class="form-control" placeholder="Tricep skinfold(mm)" name="tricep" />
		<br>
		<input type="number" class="form-control" placeholder="Subscalar [back] skinfold(mm)" name="subscapular" />
		<br>
		<input type="number" class="form-control" placeholder="Suprailiac [side belly] skinfold(mm)" name="suprailiac" />
		<br>
		<input type="number" class="form-control" placeholder="Midaxillary (side torso) skinfold in mm" name="midaxillary" />
	</div>
</div>
<style>#workoutModal .modal-body{max-height:300px!important;overflow-y:scroll!important;}</style>
<script>
$(window).ready(function () {
	$('.sevenfolds div').appendTo($('#workoutModal .modal-body'));
	$('input[name="gender"]').change(function(){
		$('input[name="hgender"]').val($(this).val());
	});
});

function calcSevenFolds(a) {
	var bf = 0,
		age = parseInt($('input[name="age"]').val()),
		gender = $('input[name="hgender"]').val(),
		chest = parseInt($('input[name="chest"]').val()),
		abdominal = parseInt($('input[name="abdominal"]').val()),
		thigh = parseInt($('input[name="thigh"]').val()),
		tricep = parseInt($('input[name="tricep"]').val()),
		subscapular = parseInt($('input[name="subscapular"]').val()),
		suprailiac = parseInt($('input[name="suprailiac"]').val()),
		midaxillary = parseInt($('input[name="midaxillary"]').val());
	chest = chest ? chest : 0;
	abdominal = abdominal ? abdominal : 0;
	thigh = thigh ? thigh : 0;
	tricep = tricep ? tricep : 0;
	subscapular = subscapular ? subscapular : 0;
	suprailiac = suprailiac ? suprailiac : 0;
	midaxillary = midaxillary ? midaxillary : 0;
	s = chest + abdominal + thigh + tricep + subscapular + suprailiac + midaxillary;
	if (gender == "M"){bf = 495 / (1.112 - (0.00043499 * s) + (0.00000055 * s * s) - (0.00028826 * age)) - 450;
	}else if (gender == "F"){ bf = 495 / (1.097 - (0.00046971 * s) + (0.00000056 * s * s) - (0.00012828 * age)) - 450;}
	$('input[bfp="' + a + '"]').val(bf.toFixed(6)).trigger('change').trigger('input');
}

function inputSevenSkinFolds(a) {
	var thisBFP = $(a).attr('bfp');
	$('input[name="abdominal"]').focus();
	$('#workoutModal').modal();
	$('#workoutModal .modal-title').html('Calculate Body Fat Percentage');
	$('#workoutModal .modal-footer').html('<button data-dismiss="modal"  onclick=\'calcSevenFolds("' + thisBFP + '");\'>Calculate</button>');
}
</script>


<script>

	var ROOTURL = '<?php echo get_site_url(); ?>',
		USER_ID = '<?php echo get_current_user_id(); ?>',
		CURRENT_USER = JSON.parse('<?php echo json_encode($currentUser); ?>'),
		CLIENT = JSON.parse('<?php echo json_encode($client); ?>'),
		STAT = JSON.parse('<?php echo json_encode(User::getDefaultStat()); ?>');
</script>
<script type="text/javascript" src="<?php echo get_stylesheet_directory_uri() .'/js/angular/app.js'; ?>"></script>
<script type="text/javascript" src="<?php echo get_stylesheet_directory_uri() .'/js/angular/trainerStatsController.js'; ?>"></script>