<?php

require_once getcwd() . '/wp-customs/User.php';
$currentUser = User::find(get_current_user_id());
$currentUser->gymPhotos = $currentUser->getGymLogos();

$uinfo = wp_get_current_user();
if(isset($_GET['ccolor'])):
	update_user_meta($uinfo->ID, 'sm_gym_color', $_GET['ccolor']);
	echo '<div class="col-lg-12 col-md-12"><p style="width:100%;" class="alert alert-success">Gym Accent Color Updated!</p></div>';
	echo '<script>window.location.href="'.home_url().'/gym/?data=profile"</script>';
	die;
else:
	$gymInfo = getGymInfo($uinfo);
	$gym_about = "";
	$gym_color = "";
	if(isset($gymInfo['sm_gym_about']))
		$gym_about = $gymInfo['sm_gym_about'];
	if(isset($gymInfo['sm_gym_color']))
		$gym_color = $gymInfo['sm_gym_color'];
	?>
	<link rel="stylesheet" href="<?php echo get_stylesheet_directory_uri(); ?>/css/spectrum.css" />
	<style class="adjustcolor"></style>
	<div class="main-content matchHeight"
		 ng-app="smApp"
		 ng-controller="profileController"
		 cg-busy="{promise: promise, minDuration: 2000, templateUrl: loadingTemplate}"
	>
		<?php if(!isset($_GET['edit'])): ?>
			<div class="container trainer-profile">
				<div class="row">
					<div class="col-lg-12 col-md-12">
						<h2 class="trainer-profile-name">Gym Plus</h2>
					</div>
					<div class="col-lg-12 col-md-12">
						<h3>About Gym</h3>
						<?php if($gym_about != ""): ?>
							<!-- <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco.</p> -->
							<p><?php echo $gym_about; ?></p>
							<a href="<?php echo $_SERVER['REQUEST_URI'];  ?>&edit=1">edit</a>
						<?php else: ?>
							<a href="<?php echo $_SERVER['REQUEST_URI'];  ?>&edit=1">edit</a>
						<?php endif; ?>

					</div>
				</div>
			</div>
		<?php else:
			get_template_part( 'accounts/gym/edit-info', 'page' );
		endif; ?>

		<div class="container trainer-additional-box-info">
			<div class="row">
				<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
					<h3>GYM Logos:</h3>
					<small>Landscape</small>
					<input id="idGymLandscape" type="file" onchange="encodeImageFileAsURL();" accept="image/x-png,image/gif,image/jpeg" style="display:none"/>
					<img style="max-width:100%; height: 120px;" ng-if="currentUser.gymPhotos.landscape.length > 0" ng-src="{{ currentUser.gymPhotos.landscape }}">
					<img style="max-width:100%; height: 120px;" ng-if="currentUser.gymPhotos.landscape.length <= 0"  id="idGymPhotoLandscapeResult">
					<a href="javascript:void(0)" ng-click="gymUploadLogo('landscape')">Upload</a>
				</div>

				<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
					<div style="width:150px;margin:0 auto;">
						<small>Portrait</small>
						<input id="idGymPortrait" type="file" onchange="encodeImageFileAsURL();" accept="image/x-png,image/gif,image/jpeg" style="display:none"/>
						<img style="max-width:100%; height: 120px;" ng-if="currentUser.gymPhotos.portrait.length > 0" ng-src="{{ currentUser.gymPhotos.portrait }}">
						<img style="max-width:100%; height: 120px;" ng-if="currentUser.gymPhotos.portrait.length <= 0" id="idGymPhotoPortraitResult">
						<a href="javascript:void(0)" ng-click="gymUploadLogo('portrait')">Upload</a>
					</div>
				</div>

				<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
					<h3>Select Gym Accent Color:</h3>
					<!-- <img src="<?php echo get_stylesheet_directory_uri(); ?>/accounts/images/gym-select-color.png" /> -->
					<input type='text' class="basic" value="#<?php echo $gym_color; ?>" />
				</div>

			</div>
		</div>

	</div>
<?php endif; ?>
<script>
	var ROOTURL = '<?php echo get_site_url(); ?>';
	var CURRENT_USER = JSON.parse('<?php echo json_encode($currentUser); ?>');

	function encodeImageFileAsURL(cb)
	{
		return function(){
			var file = this.files[0];
			var reader  = new FileReader();
			reader.onloadend = function () {
				cb(reader.result);
			}
			reader.readAsDataURL(file);
		}
	}
</script>
<script type="text/javascript" src="<?php echo get_stylesheet_directory_uri() .'/js/angular/app.js'; ?>"></script>
<script type="text/javascript" src="<?php echo get_stylesheet_directory_uri() .'/js/angular/profileController.js'; ?>"></script>
