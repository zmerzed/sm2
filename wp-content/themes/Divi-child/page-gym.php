<?php
/*
* Template Name: Gym
*/

global $current_user;
/* $userdata = get_currentuserinfo(); */
$uinfo = wp_get_current_user();

/** check if the user is logged-in **/
if( is_user_logged_in() ){

	/* $member_type = bp_get_member_type($uinfo->ID); */
	
	/* $pm_lvl = pmpro_getMembershipLevelForUser($uinfo->ID)->name; */
	$ppp = pmpro_getMembershipLevelForUser($uinfo->ID);
	$pm_lvl = "";
	
	if(!empty($ppp))
	$pm_lvl = $ppp->name;
	
	/** check if the user trying to access the page has a "client" member type **/
	
	/* if( in_array( 'gym', $uinfo->roles ) ){ */	
	if($pm_lvl == "Gym" || in_array( 'gym', $uinfo->roles )){

	require_once( get_stylesheet_directory() . '/accounts/inc/header-account.php' );
	require_once( get_stylesheet_directory() . '/accounts/inc/top-account.php' );
?>

<div class="main-section">
	<div class="container">
		<div class="row">
		
			<?php require_once( get_stylesheet_directory() . '/accounts/inc/side-account.php' ); ?>
			
			<div class="col-12 col-md-8 col-lg-9 col-xl-10">				
				<?php
					if(!checkUserOrParentStatus($uinfo)){
						echo "Subscription ended, please contact admin.";
					}else{
						
						$data_request = "";	
						if(isset($_GET['data']))
							$data_request = $_GET['data'];
						
						$data_request_by = "";
						if(isset($_GET['by']))
							$data_request_by = $_GET['by'];
					
						switch ($data_request) {
							case 'schedule':

								if( $data_request_by === 'monthly' ){
									get_template_part( 'accounts/gym/schedule-monthly', 'page' );
								}else{
									get_template_part( 'accounts/gym/schedule', 'page' );
								}
								
								break;

							case 'profile':

								get_template_part( 'accounts/gym/profile', 'page' );

								break;
							
							case 'message':
								get_template_part( 'accounts/gym/message', 'page' );
								break;

							case 'notes':
								get_template_part( 'accounts/gym/notes', 'page' );
								break;
							
							case 'logs':
								get_template_part( 'accounts/gym/logs', 'page' );
								break;

							case 'workouts':
								get_template_part( 'accounts/gym/workouts', 'page' );
								break;

							case 'add-workouts':
								get_template_part( 'accounts/gym/add-edit-workouts', 'page' );
								break;

							case 'edit-workout':
								get_template_part( 'accounts/gym/edit-workout-page', 'page' );
								break;

							case 'exercises':
								get_template_part( 'accounts/gym/exercises', 'page' );
								break;

							case 'clients':
								get_template_part( 'accounts/gym/clients', 'page' );
								break;
								
							case 'trainers':
								get_template_part( 'accounts/gym/trainers', 'page' );
								break;

							default:
								get_template_part( 'accounts/gym/dashboard', 'page' );
								break;
						}
					}

				?>
			</div>

		</div>
	</div>
</div>


<?php

require_once( get_stylesheet_directory() . '/accounts/inc/footer-account.php' );

}else{

	wp_redirect( site_url( '/' ) );
    exit();

}

}else{

	wp_redirect( site_url( '/wp-admin' ) );
    exit();

}

?>