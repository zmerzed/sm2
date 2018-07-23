<?php
	$uinfo = wp_get_current_user();
	$ufname = $uinfo->first_name;
	$ulname = $uinfo->last_name;
	$unname = "";
	
	if($ufname == ""){
		$unname = $uinfo->user_nicename;
	}else{
		$unname = $ufname . ' ' .$ulname;
	}
	
	$trainerInfo = getTrainerInfo($uinfo);
	$edit_txt = '<a href="'.$_SERVER['REQUEST_URI'].'&edit=1">edit</a>';
?>
<div class="main-content matchHeight">
	<?php if(!isset($_GET['edit'])): ?>
	<div class="container trainer-profile">
		<div class="row">
			<div class="col-lg-12 col-md-12">
				<a href="<?php echo $_SERVER['REQUEST_URI'];  ?>&edit=1" style="float:right">edit</a>
				<h2 class="trainer-profile-name"><?php echo $unname; ?></h2>
			</div>
			<div class="col-lg-2 col-md-2">
				<img src="<?php echo get_stylesheet_directory_uri().'/accounts/images/trainer-profile-image.png';?>">
			</div>
			<div class="col-lg-10 col-md-10">
				<h3>trainer bio</h3>
				<?php if($trainerInfo['ubio'] != ""): ?>
					<!-- <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco.</p> -->
					<p><?php echo $trainerInfo['ubio']; ?></p>
				<?php else: ?>
					<a href="<?php echo $_SERVER['REQUEST_URI'];  ?>&edit=1">edit</a>
				<?php endif; ?>
			</div>
		</div>
	</div>

	<div class="container trainer-additional-box-info">
		<div class="row">
			<div class="col-lg-3 col-md-3">
				<h3>education/certs.</h3>
				<?php if($trainerInfo['uedu'] != ""): ?>
					<!-- <p> Lorem ipsum dolor sit Consectetur adipiscing Sed do eiusmod tempo</p> -->
					<p><?php echo $trainerInfo['uedu']; ?></p>
				<?php else:
					echo $edit_txt;
				endif; ?>
			</div>

			<div class="col-lg-3 col-md-3">
				<h3>specialties</h3>
				<?php if($trainerInfo['uspe'] != ""): ?>
					<!-- <p>Sport-Specific Training <br/>Conditioning <br/>Functional Training <br/>Core Strength <br/>Proprioception</p> -->
					<p><?php echo $trainerInfo['uspe']; ?></p>
				<?php else:
					echo $edit_txt;
				endif; ?>
			</div>

			<div class="col-lg-3 col-md-3">
				<h3>availability</h3>
				<?php if($trainerInfo['uava'] != ""): ?>
					<!-- <p>Monday/Wednesday/Friday <br/>12:00 (Noon) – 8:00 p.m.</p>
					<p>Tuesday/Thursday <br/>7:00 a.m. – 8:00 p.m.</p> -->
					<p><?php echo $trainerInfo['uava']; ?></p>
				<?php else:
					echo $edit_txt;
				endif; ?>
			</div>

			<div class="col-lg-3 col-md-3">
				<h3>experience</h3>
				<?php if($trainerInfo['uexp'] != ""): ?>
					<!-- <p>18 Years - Personal Trainer <br/>3 Years - Bodybuilder</p> -->
					<p><?php echo $trainerInfo['uexp']; ?></p>
				<?php else:
					echo $edit_txt;
				endif; ?>
			</div>
		</div>
	</div>
	
	<?php else:
		get_template_part( 'accounts/trainers/edit-info', 'page' );
	endif; ?>
	

</div>