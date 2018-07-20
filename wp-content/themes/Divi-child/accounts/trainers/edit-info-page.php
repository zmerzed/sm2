<?php
	$uinfo = wp_get_current_user();
	$uid = $uinfo->ID;
	$trainerInfo = getTrainerInfo($uinfo);
	
	if( $_SERVER['REQUEST_METHOD'] == 'POST' ){
		//Check trainer_bio
		$trainer_bio = $_POST['trainer_bio'];
		if($trainer_bio != ""){
			update_user_meta($uid, 'sm_bio', $trainer_bio);
		}
		//Check sm_education
		$trainer_education = $_POST['trainer_education'];
		if($trainer_education != ""){
			update_user_meta($uid, 'sm_education', $trainer_education);
		}
		//Check trainer_specialties
		$trainer_specialties = $_POST['trainer_specialties'];
		if($trainer_specialties != ""){
			update_user_meta($uid, 'sm_specialties', $trainer_specialties);			
		}
		//Check trainer_availability
		$trainer_availability = $_POST['trainer_availability'];
		if($trainer_availability != ""){
			update_user_meta($uid, 'sm_availability', $trainer_availability);			
		}
		//Check trainer_availability
		$trainer_experience = $_POST['trainer_experience'];
		if($trainer_experience != ""){
			update_user_meta($uid, 'sm_experience', $trainer_experience);			
		}
		echo '<div class="col-lg-12 col-md-12"><p style="width:100%;" class="alert alert-success">Information Updated!</p></div>';
		echo '<script>window.location.href="'.home_url().'/trainer/?data=profile"</script>';
	}	
?>
	<div class="col-lg-12 col-md-12">
		<form action="<?php echo $_SERVER['REQUEST_URI'];  ?>" method="post" name="my_form" enctype="multipart/form-data">
			<p>
				<label for="uploadfile">Photo:</label><br>
				<input name="uploadfile" id="file" type="file" />
				<input type="submit" name="BtnSubmit" value="upload file" />
			</p>
		</form>	
		<hr>
	</div>
	<div class="col-lg-12 col-md-12 trainer-edit-info">
		<form action="<?php echo $_SERVER['REQUEST_URI']; ?>" method="post">
			<p>
			<label>Trainer Bio</label><br>
			<textarea name="trainer_bio"><?php echo $trainerInfo['ubio']; ?></textarea>
			</p>
			<p>
			<label>Education/Certs.:</label><br>
			<textarea name="trainer_education"><?php echo $trainerInfo['uedu']; ?></textarea>
			</p>
			<p>
			<label>Specialties</label><br>
			<textarea name="trainer_specialties"><?php echo $trainerInfo['uspe']; ?></textarea>
			</p>
			<p>
			<label>Availability</label><br>
			<textarea name="trainer_availability"><?php echo $trainerInfo['uava']; ?></textarea>
			</p>
			<p>
			<label>Experience</label><br>
			<textarea name="trainer_experience"><?php echo $trainerInfo['uexp']; ?></textarea>
			</p>
			<input type="submit" value="Update" />
			<a href="<?php echo home_url(); ?>/trainer/?data=profile" class="red-btn">Cancel</a>
		</form>
	</div>