<?php
/*
* Template Name: Client
*/

global $current_user;
/* $userdata = get_currentuserinfo(); */
$uinfo = wp_get_current_user();

/** check if the user is logged-in **/
if( is_user_logged_in() ){

	/* $member_type = bp_get_member_type($uinfo->ID); */

	/** check if the user trying to access the page has a "client" member type **/
	if( in_array( 'client', $uinfo->roles ) ){

		require_once( get_stylesheet_directory() . '/accounts/inc/header-account.php' );
		require_once( get_stylesheet_directory() . '/accounts/inc/top-account.php' );
		?>

		

		<div class="main-section">
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
										get_template_part( 'accounts/clients/schedule-monthly', 'page' );
									}else{
										get_template_part( 'accounts/clients/schedule', 'page' );
									}

									break;

								case 'profile':

									$data_request_by = $_GET['by'];

									if( $data_request_by === 'personal-info' ){
										get_template_part( 'accounts/clients/personal-info', 'page' );
									}
									elseif( $data_request_by === 'progress-goals' ){
										get_template_part( 'accounts/clients/progress-goals', 'page' );
									}else{
										get_template_part( 'accounts/clients/profile', 'page' );
									}

									break;

								case 'message':
									get_template_part( 'accounts/clients/message', 'page' );
									break;

								case 'notes':
									get_template_part( 'accounts/clients/notes', 'page' );
									break;

								case 'logs':
									get_template_part( 'accounts/clients/logs', 'page' );
									break;

								case 'workout':
									
									get_template_part( 'accounts/clients/workout', 'page' );
									break;

								default:
									get_template_part( 'accounts/clients/dashboard', 'page' );
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