<?php
/*
* Template Name: Trainer
*/

global $current_user;
/* $userdata = get_currentuserinfo(); */
$uinfo = wp_get_current_user();

/** check if the user is logged-in **/
if( is_user_logged_in() ){

	/* $member_type = bp_get_member_type($uinfo->ID); */
	$pm_lvl = pmpro_getMembershipLevelForUser($uinfo->ID)->name;
	
	/** check if the user trying to access the page has a "client" member type **/
	/* if( in_array( 'trainer', $uinfo->roles )){ */
	if( $pm_lvl == "Trainer"  || in_array( 'trainer', $uinfo->roles )){

	require_once( get_stylesheet_directory() . '/accounts/inc/header-account.php' );
	require_once( get_stylesheet_directory() . '/accounts/inc/top-account.php' );
?>


<div class="main-section trainers-dashboard">
	<div class="container">
		<div class="row">

			<?php require_once( get_stylesheet_directory() . '/accounts/inc/side-account.php' ); ?>

			<div class="col-lg-10 col-md-10">
				<?php							
					if(!checkUserOrParentStatus($uinfo)){						
						echo "Subscription ended, please contact admin.";					
					}else{						
						
						$data_request = $_GET['data'];
						switch ($data_request) {
							case 'schedule':

								$data_request_by = $_GET['by'];

								if( $data_request_by === 'monthly' ){
									get_template_part( 'accounts/trainers/schedule-monthly', 'page' );
								}else{
									get_template_part( 'accounts/trainers/schedule', 'page' );
								}
								
								break;

							case 'profile':

								get_template_part( 'accounts/trainers/profile', 'page' );

								break;
							
							case 'message':
								get_template_part( 'accounts/trainers/message', 'page' );
								break;

							case 'notes':
								get_template_part( 'accounts/trainers/notes', 'page' );
								break;
							
							case 'logs':
								get_template_part( 'accounts/trainers/logs', 'page' );
								break;

							case 'workout':
								get_template_part( 'accounts/trainers/workout', 'page' );
								break;
								
							case 'workouts':
								get_template_part( 'accounts/trainers/workouts', 'page' );
								break;

							case 'add-workouts':

								if(isset($_GET['workout'])) {
									get_template_part( 'accounts/trainers/edit-workouts', 'page' );
								} else {
									get_template_part( 'accounts/trainers/add-edit-workouts', 'page' );
								}

								break;

							case 'exercises':
								get_template_part( 'accounts/trainers/exercises', 'page' );
								break;

							case 'clients':
								get_template_part( 'accounts/trainers/clients', 'page' );
								break;

							default:
								get_template_part( 'accounts/trainers/dashboard', 'page' );
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