<?php
	$uinfo = wp_get_current_user();
	$uid = $uinfo->ID;
	$umeta = get_user_meta($uid);
	$udob = "";
	$ugender = "";
	$uphone = "";
	
	if(isset($umeta['sm_dob']))
		$udob = $umeta['sm_dob'][0];
	
	if(isset($umeta['sm_gender']))
		$ugender = $umeta['sm_gender'][0];
	
	if(isset($umeta['sm_phone']))
		$uphone = $umeta['sm_phone'][0];
	
	/* echo '<p style="color:#fff;">' .$ugender."<p>"; */	
	  
	if( $_SERVER['REQUEST_METHOD'] == 'POST' ){
		//Check DOB
		$nudob = $_POST['udob'];
		if($nudob != ""){
			update_user_meta($uid, 'sm_dob', $nudob);
		}
		//Check Gender
		$nugender = $_POST['ugender'];
		if($nugender != ""){
			update_user_meta($uid, 'sm_gender', $nugender);
		}
		//Check Phone
		$nuphone = $_POST['uphone'];
		if($nuphone != ""){
			update_user_meta($uid, 'sm_phone', $nuphone);
		}
		
		echo '<div class="col-lg-12 col-md-12"><p style="width:100%;" class="alert alert-success">Information Updated!<a href="'.home_url().'/client/?data=profile&by=personal-info" style="float:right">view info</a></p></div>
		<style>#editinfo{display:none;}</style>';
	}
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
		<p>
			<label>Phone #</label>
			<input type="text" name="uphone" value="<?php echo $uphone; ?>" />
		</p>
		<input type="hidden" name="submitted" value="1" />
		<input type="submit" value="update" />
		<a href="<?php echo home_url(); ?>/client/?data=profile&by=personal-info" class="red-btn">Cancel</a>
	</form>
</div>