<?php
/*
* Template Name: Member Template
*/

if( is_user_logged_in() ){
	$uinfo = wp_get_current_user();
	$ppp = pmpro_getMembershipLevelForUser($uinfo->ID);
	$pm_lvl = "";
	if(!empty($ppp))
		$pm_lvl = $ppp->name;
	require_once( get_stylesheet_directory() . '/accounts/inc/header-account.php' );
	require_once( get_stylesheet_directory() . '/accounts/inc/top-account.php' );
?>
	<link rel="stylesheet" href="<?php echo home_url(); ?>/wp-content/plugins/paid-memberships-pro/css/frontend.css?ver=1.9.5.3" />
	<div class="main-section member-page">
		<div class="container">
			<div class="row">
			<?php require_once( get_stylesheet_directory() . '/accounts/inc/side-account.php' ); ?>
			<!-- .et_pb_column -->
			<div class="col-12 col-md-8 col-lg-9 col-xl-10">
				<div class="entry-content">
					<?php while ( have_posts() ) : the_post(); ?>
						<?php the_content(); ?>
					<?php endwhile; ?>
				</div>
			</div>
		  <!-- .et_pb_column -->
		   </div>
		</div>
	</div>
<?php
		require_once( get_stylesheet_directory() . '/accounts/inc/footer-account.php' );
	
}elseif(get_the_ID() == 321 || get_the_ID() == 318){
	get_header();
?>
	<div class="et_pb_section et_pb_section_1 et_pb_with_background et_section_regular">
	   <div class=" et_pb_row et_pb_row_2">		  
		  <!-- .et_pb_column -->
		  <div class="et_pb_column et_pb_column_2_3  et_pb_column_4 et_pb_css_mix_blend_mode_passthrough et-last-child">
			<div class="entry-content">
				<?php while ( have_posts() ) : the_post(); ?>
					<?php
						the_content();
					?>
				<?php endwhile; ?>
			</div>
		  </div>
		  <!-- .et_pb_column -->
	   </div>
	</div>
<?php
	get_footer();
}else{

	wp_redirect( site_url( '/wp-admin' ) );
	exit();

}