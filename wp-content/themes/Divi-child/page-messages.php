<?php
/*
* Template Name: Message Template
*/
require_once getcwd() . '/wp-customs/Log.php';
require_once getcwd() . '/wp-customs/User.php';
require_once getcwd() . '/wp-customs/Program.php';
require_once getcwd() . '/wp-customs/Exercise.php';

if(!is_user_logged_in()):
	wp_redirect(wp_login_url());
	die();
else:
	/*Redirections*/
	if(isset($_GET['fepaction']) && ($_GET['fepaction'] == 'announcements' || $_GET['fepaction'] == "settings")){
		wp_redirect(home_url().'/messages');
		die();
	}
	get_header();
	$uinfo = wp_get_current_user();
	$pm_lvl = getMembershipLevel($uinfo);
	$temp_slug = $post->post_name;
	$gcolor = "";
	$gymInfo = getGymInfo($userdata);
	if(isset($gymInfo['sm_gym_color']))
		$gcolor = $gymInfo['sm_gym_color'];
?>
<link rel="stylesheet" href="<?php echo get_stylesheet_directory_uri(); ?>/accounts/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="<?php echo get_stylesheet_directory_uri(); ?>/accounts/bootstrap/css/account-style.css">
<?php if($pm_lvl == "gym" && $gcolor != ""):
	$rgb = 'rgba('.hexdec(substr($gcolor, 0, 2)).','.hexdec(substr($gcolor, 2, 2)).','.hexdec(substr($gcolor, 4, 2)).', 0.8)';		
?>
	<style><?php echo '.trainer-per-day-schedule-box.today li{background-color:'.$rgb.'}.gym-page.page-template-page-messages .fep-button, .gym-page.page-template-page-messages .fep-button:hover, .gym-page.page-template-page-messages .fep-button-active,.gym-page .responsive-calendar .day .badge,.gym-page .responsive-calendar .day.active.today a,.gym-page .responsive-calendar .day.active a:hover,.gym-page .responsive-calendar .btn,.gym-page .red-btn,.gym-page .progress-bar,.gym-page .exercise-number,.gym-page .workout-tab-pane-wrapper,.gym-page .wi-blu,.gym-page .compose-message button, .gym-page .btn-add-workout button,.gym-page .message-wrapper,.gym-page .trainer-add-workout a,.gym-page .workoutclass,.gym-page #table-sorter_wrapper, .gym-page #table-sorter-logs_wrapper,.gym-page .sm-icons{background-color:#'.$gcolor.';}.gym-page #message-nav-tab .nav-item.active{background-color:#'.$gcolor.';border-color:#'.$gcolor.';}.gym-page .trainer-profile-name,.gym-page .trainer-day-label,.gym-page .main-navigation ul li a.active,.gym-page .main-navigation h3,.gym-page a, .gym-page a:hover{color:#'.$gcolor.';}.gym-page .container-title h3,.gym-page .title-welcome-section .container,.gym-page .trainer-dashboard tr td:nth-child(1){border-color:#'.$gcolor.'!important;}'; ?>
	</style>
	<script>
		jQuery('body').addClass('gym-page');
	</script>	
<?php endif;
require_once( get_stylesheet_directory() . '/accounts/inc/header-section-account.php' );
?>
<style>html.js{margin-top:0!important;}</style>
<div class="message-body">
	<?php require_once( get_stylesheet_directory() . '/accounts/inc/top-account.php' ); ?>
	<div class="main-section">
		<div class="container">
			<div class="row">
				<?php require_once( get_stylesheet_directory() . '/accounts/inc/side-account.php' ); ?>
				<div class="col-lg-10 col-md-10">
					<?php
						while ( have_posts() ) : the_post();		
							the_content();		
						endwhile;
					?>
				</div>
			</div>
		</div>
	</div>
<?php	
	$recipient = getRecipients($uinfo);
	if(empty($recipient))
		$recipient = array();

	$selopt = '<option value="">Select recipient</option>';
	foreach($recipient as $v=>$k){
		$selopt .= '<option value="'.$v.'">'.$v.' ('.$k.')</option>';
	}
?>
</div>
<script>
	(function($) {
		$(document).ready(function() {
			if($('#fep-message-top').length != 0){
				$('#fep-message-top').hide().after('<select onchange="selectRecipient(this)"><?php echo $selopt; ?></select>');
			}
		});		
		
	})(jQuery);
	function selectRecipient(a){
		jQuery('#fep-message-top').attr('value', a.value);
	}
</script>
<?php
endif;
get_footer(); ?>