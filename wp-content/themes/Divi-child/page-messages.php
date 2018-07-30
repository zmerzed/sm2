<?php
/*
* Template Name: Message Template
*/

/*Redirections*/
if(isset($_GET['fepaction']) && ($_GET['fepaction'] == 'announcements' || $_GET['fepaction'] == "settings")){
	wp_redirect(home_url().'/messages');
	die();
}
get_header();
$uinfo = wp_get_current_user();
$pm_lvl = getMembershipLevel($uinfo);
$temp_slug = $post->post_name;
?>
<link rel="stylesheet" href="<?php echo get_stylesheet_directory_uri(); ?>/accounts/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="<?php echo get_stylesheet_directory_uri(); ?>/accounts/bootstrap/css/account-style.css">
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
</div>
<?php	
$recipient = array();
if($pm_lvl == 'trainer'){
	$pgym = get_user_meta($uinfo->ID, 'parent_gym', true);
	if($pgym != ""){ //Under a Gym
		$recipient = pushClientsToRecipient($uinfo);
		$recipient[] = get_user_by('id',$pgym)->user_login;			
	}else{ //Not Under a Gym
		pushClientsToRecipient($uinfo);
	}
}

function pushClientsToRecipient($u){
	$clients = getClientsOfTrainer($u);
	$r = array();
	if(empty($clients))
		$clients = array();
	foreach($clients as $client){
		$r[] = $client->user_login;			
	}
	return $r;
}

$selopt = '<option value="">Select recipient</option>';
foreach($recipient as $rec){
	$selopt .= '<option value="'.$rec.'">'.$rec.'</option>';
}
?>

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

</div> <!-- #main-content -->

<?php get_footer(); ?>