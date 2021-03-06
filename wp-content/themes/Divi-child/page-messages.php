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
?>
<link rel="stylesheet" href="<?php echo get_stylesheet_directory_uri(); ?>/accounts/assets/css/bootstrap.min.css">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="<?php echo get_stylesheet_directory_uri(); ?>/accounts/bootstrap/css/account-style.css">
<?php if($pm_lvl == "gym"):
	require_once( get_stylesheet_directory() . '/accounts/inc/gym-color.php' );
?>
	<script>
		jQuery('body').addClass('gym-page');
	</script>
<?php endif;
require_once( get_stylesheet_directory() . '/accounts/inc/header-section-account.php' );
?>
<style>html.js{margin-top:0!important;}</style>
<div class="message-body">
	<?php require_once( get_stylesheet_directory() . '/accounts/inc/mobile-menu.php' ); ?>
	<?php require_once( get_stylesheet_directory() . '/accounts/inc/top-account.php' ); ?>
	<div class="main-section">
		<div class="container">
			<div class="row">
				<?php require_once( get_stylesheet_directory() . '/accounts/inc/side-account.php' ); ?>
				<div class="col-12 col-md-8 col-lg-9 col-xl-9">
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
	$sp_user = "";
	if(isset($_GET['msgto']))
		$sp_user = get_user_by('id',$_GET['msgto'])->data->user_login;
		
	if(empty($recipient))
		$recipient = array();

	$selopt = '<option value="">Select recipient</option>';
	foreach($recipient as $v=>$k){
		$sel_ = "";
		if($sp_user == $v){
			$sel_ = 'selected="selected"';
		}
		$selopt .= '<option '.$sel_.' value="'.$v.'">'.$v.' ('.$k.')</option>';
	}

?>
</div>
<script>
	(function($) {
		$(document).ready(function() {
			if($('#fep-message-top').length != 0){
				$('#fep-message-top').hide().after('<select onchange="selectRecipient(this)"><?php echo $selopt; ?></select>');
			}
			$('#fep-message-top').attr('value', "<?php echo $sp_user; ?>");
		});

		var uArr = [], ctr = 0;
		$('.fep-avatar-p img').each(function(){
			ctr++;
			uArr.push($(this).attr('title'));
			$(this).closest('div').addClass('avatar-'+ctr);
		});

		var jdata = {
			action: 'get_message_user_image',
			uArr: uArr
		};

		/*AJAX*/
		$.ajax({
			url:  '<?php echo home_url(); ?>/wp-admin/admin-ajax.php',
			method:'POST',
			data: jdata,
			dataType: 'json',
			success: function(res){
				var r = res.result;
				console.log(res);
				if(r){
					r.forEach(function(v,i){
						if(v!=""){
							$('.avatar-'+(i+1)).wrapInner('<div class="jtbl"><div class="jtbl-cell"></div></div>').addClass('round');
							$('.avatar-'+(i+1)+' img').attr('src', v);
						}
					});
				}

			},
			error: function(r,xhr, result){
				console.log(r + ' ' + xhr + ' ' + result);
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
