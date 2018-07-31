  <div class="header-section">
    <div class="container">
      <div class="row">
        <div class="col-lg-6 col-md-6">
			<a href="<?php echo home_url(); ?>">
			<?php 
				$logoSrc = home_url().'/wp-content/uploads/2018/02/sm-logov2-wht.svg';
				$pm_lvl = strtolower($pm_lvl);
				if($pm_lvl == "Gym"){
					$gymLogos = User::find($userdata->ID)->getGymLogos();							
					if(!empty($gymLogos['landscape'])){
						$logoSrc = $gymLogos['landscape'];
					}else{
						$logoSrc = get_stylesheet_directory_uri().'/accounts/images/gym-plus-logo.png';
					}
				}else{
					$logoSrc  = home_url().'/wp-content/uploads/2018/02/sm-logov2-wht.svg';
				}
			?>
				<img id="logo" src="<?php echo $logoSrc; ?>">
			</a>
        </div>
        <div class="col-lg-6 col-md-6">
          <a id="logout_btn" href="<?php echo wp_logout_url(); ?>">Logout</a>
        </div>
      </div>
    </div>
  </div>