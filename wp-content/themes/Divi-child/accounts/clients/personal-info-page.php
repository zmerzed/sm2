<?php

	require_once getcwd() . '/wp-customs/User.php';
	global $current_user;

	/* $userdata = get_currentuserinfo(); */
	$uinfo = wp_get_current_user();
	$user = User::find(get_current_user_id());
	$currentUser = [
		'id' => $user->id,
		'files' => $user->getFiles()
	];
?>

<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>

<script>
	USER_ID = '<?php echo get_current_user_id(); ?>',
	CURRENT_USER = JSON.parse('<?php echo json_encode($currentUser); ?>');
</script>

<div class="main-content matchHeight" ng-app="smApp" ng-controller="profileController">

	<div class="container-title">
		<h3>Personal Information</h3>
	</div>

	<div class="current-status">
		<div class="row">
			<div class="col-lg-8 col-md-8">
				<div class="personal-data-information matchHeight">
					<div class="row">
						<?php
							$edit_req = "";	
							if(!isset($_GET['edit'])):								
						?>
						<div class="col-lg-12">
						<?php
							$ufname = $uinfo->first_name;
							$ulname = $uinfo->last_name;
							$displayname = "";
							if($ufname != ""){
								$displayname = $ufname.' '.$ulname;
							}else{
								$displayname = $uinfo->user_nicename;
							}
						?>
							<a href="<?php echo home_url(); ?>/client/?data=profile&by=personal-info&edit=1" style="float:right">edit</a>
							<h2><?php echo $displayname; ?></h2>							
						</div>
						<div class="col-lg-5 col-md-5">
							<div class="featured-image">
								<img src="<?php echo get_stylesheet_directory_uri() .'/accounts/images/personal-featured-image.jpg'; ?>">
							</div>
						</div>
						<div class="col-lg-7 col-md-7">
							<p>
								<label>EMAIL/LOGIN</label>
								<strong><?php echo $uinfo->user_email; ?></strong>
							<p>
							<p>
								<label>DOB</label>
								<strong><?php echo $uinfo->sm_dob; ?></strong>
							<p>
							<p>
								<label>GENDER</label>
								<strong><?php echo $uinfo->sm_gender; ?></strong>
							<p>
							<p>
								<label>PHONE #</label>
								<strong><?php echo $uinfo->sm_phone; ?></strong>
							<p>
						</div>
						<?php else:
							get_template_part( 'accounts/clients/edit-info', 'page' );
						endif; ?>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-4">
				<div class="personal-documents matchHeight">
					<h3>HEALTH DOCUMENTS</h3>
					<ul>
<!--						<li><a href="#"><span><img src="--><?php //echo get_stylesheet_directory_uri() .'/accounts/images/pdf.png'; ?><!--"></span>health-records.pdf</a></li>-->
<!--						<li><a href="#"><span><img src="--><?php //echo get_stylesheet_directory_uri() .'/accounts/images/doc.png'; ?><!--"></span>nutrition_plan.doc</a></li>-->
<!--						<li><a href="#"><span><img src="--><?php //echo get_stylesheet_directory_uri() .'/accounts/images/xls.png'; ?><!--"></span>past_progress.xls</a></li>-->
						<li ng-repeat="file in currentUser.files"><a href="<?php echo home_url(); ?>/sm-files/{{ file.user_id +'/'+ file.file }}" download><span><img ng-src="{{ file.file.indexOf('doc') != 0 && '<?php echo get_stylesheet_directory_uri() .'/accounts/images/doc.png'; ?>' }}"></span>{{ file.file }}</a></li>
					</ul>
					<input type="file" file-model="myFile"/>
					<button ng-click="uploadFile()">upload me</button>
				</div>
			</div>
		</div>
	</div>

</div>

<script>var ROOTURL = '<?php echo get_site_url(); ?>';</script>
<script type="text/javascript" src="<?php echo get_stylesheet_directory_uri() .'/js/angular/app.js'; ?>"></script>
<script type="text/javascript" src="<?php echo get_stylesheet_directory_uri() .'/js/angular/profileController.js'; ?>"></script>