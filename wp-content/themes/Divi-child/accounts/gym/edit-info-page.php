<?php
	$uinfo = wp_get_current_user();
	$uid = $uinfo->ID;
	$gymInfo = getGymInfo($uinfo);
	$sm_gym_about = "";
	if(isset($gymInfo['sm_gym_about']))
		$sm_gym_about = $gymInfo['sm_gym_about'];
	
	if( $_SERVER['REQUEST_METHOD'] == 'POST' ){
		//Check trainer_bio
		$sm_gym_about = $_POST['sm_gym_about'];		
			update_user_meta($uid, 'sm_gym_about', $sm_gym_about);
		//Check sm_education
		
		echo '<div class="col-lg-12 col-md-12"><p style="width:100%;" class="alert alert-success">Information Updated!</p></div>';
		echo '<script>window.location.href="'.home_url().'/gym/?data=profile"</script>';
		die;
	}	
?>
	<div class="col-lg-12 col-md-12 trainer-edit-info">
		<form action="<?php echo $_SERVER['REQUEST_URI']; ?>" method="post">
			<p>
			<label>About Gym</label><br>
			<textarea name="sm_gym_about"><?php echo $sm_gym_about; ?></textarea>
			</p>
			<input type="submit" value="Update"  class="red-btn" />
			<a href="<?php echo home_url(); ?>/gym/?data=profile" class="red-btn">Cancel</a>
		</form>
	</div>