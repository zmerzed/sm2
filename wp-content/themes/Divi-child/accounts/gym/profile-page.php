<?php
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
<div class="main-content matchHeight">
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
				<img class="text-center" src="<?php echo get_stylesheet_directory_uri(); ?>/accounts/images/gym-upload-image.png"  />
				<br />
				<a href="#">Upload</a>
			</div>

			<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
				<div style="width:150px;margin:0 auto;">
					<img class="text-center"  src="<?php echo get_stylesheet_directory_uri(); ?>/accounts/images/gym-upload-image-2.png"  />
					<br />
					<a href="#">Upload</a>
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