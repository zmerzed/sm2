<?php
	require_once getcwd() . '/wp-customs/Log.php';
	require_once getcwd() . '/wp-customs/User.php';
	require_once getcwd() . '/wp-customs/Program.php';
	require_once getcwd() . '/wp-customs/Exercise.php';

	global $current_user;
  	$userdata = wp_get_current_user();
  
	global $post;
	$temp_slug = get_page_template_slug($post->ID);	
?>
<!doctype html>
<html lang="en">
  <head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="<?php echo get_stylesheet_directory_uri(); ?>/accounts/assets/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,800,900" rel="stylesheet">
  <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
	<script src='<?php echo get_stylesheet_directory_uri() .'/accounts/assets/js/jquery-3.3.1.min.js';?>'></script>
	  <!--	  <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.0.js"></script>-->
	  <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
	  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
	  <script src="https://cdnjs.cloudflare.com/ajax/libs/angular-busy/4.1.4/angular-busy.min.js" type="text/javascript"></script>
	  <script src="https://angular-ui.github.io/bootstrap/ui-bootstrap-tpls-1.3.2.js" type="text/javascript"></script>
  <?php	
	/* $member_type = bp_get_member_type($userdata->ID); */
	/* $pm_lvl = pmpro_getMembershipLevelForUser($userdata->ID)->name; */
	/* $ppp = pmpro_getMembershipLevelForUser($userdata->ID); */
	$pm_lvl = getMembershipLevel($userdata);
	
	$gcolor = "";
	$gymInfo = getGymInfo($userdata);
	if(isset($gymInfo['sm_gym_color']))
		$gcolor = $gymInfo['sm_gym_color'];
	/* if(!empty($ppp))
		$pm_lvl = $ppp->name; */	

	$data_request = "";	
	if(isset($_GET['data']))
    $data_request = $_GET['data'];

    if( $data_request === 'notes' || $data_request === 'logs' ||  $data_request === "" || $data_request === 'exercises' || $data_request === 'clients'){
  ?>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <!-- <link href="<?php echo get_stylesheet_directory_uri(); ?>/accounts/assets/css/dataTables.bootstrap.min.css" rel="stylesheet"> -->
  <?php } ?>

  <link href='<?php echo get_stylesheet_directory_uri() .'/accounts/assets/css/responsive-calendar.css'; ?>' rel='stylesheet' />
  <?php /* <link href='<?php echo get_stylesheet_directory_uri() .'/accounts/assets/css/fullcalendar.min.css'; ?>' rel='stylesheet' />
  <link href='<?php echo get_stylesheet_directory_uri() .'/accounts/assets/css/fullcalendar.print.min.css'; ?>' rel='stylesheet' media='print' />*/ ?>
  
  <link rel="stylesheet" type="text/css" href="<?php echo get_stylesheet_directory_uri() .'/accounts/bootstrap/css/account-style.css'; ?>">
  <link rel="stylesheet" type="text/css" href="<?php echo get_stylesheet_directory_uri() .'/css/jc-style.css'; ?>">
  
	 <?php if($pm_lvl == "gym" && $gcolor != ""):
		$rgba = 'rgba('.hexdec(substr($gcolor, 0, 2)).','.hexdec(substr($gcolor, 2, 2)).','.hexdec(substr($gcolor, 4, 2)).', 0.8)';		
	 ?>
		<style>			
			<?php
			$jrgb = [ // background-color rgba
				'.trainer-per-day-schedule-box.today li'
			];
			$jbgcolor = [ // background-color
				'.responsive-calendar .day .badge',
				'.responsive-calendar .day.active.today a',
				'.responsive-calendar .day.active a:hover',
				'.responsive-calendar .btn', '.red-btn',
				'.progress-bar', '.exercise-number',
				'.workout-tab-pane-wrapper', '.wi-blu',
				'.compose-message button',
				'.btn-add-workout button',
				'.message-wrapper', '.trainer-add-workout a',
				'.workoutclass',
				'#table-sorter_wrapper',
				'#table-sorter-logs_wrapper',
				'.sm-icons',
				'div[ng-controller="exercisesController"] div[src="workoutTemplate"]',
				'div[ng-controller="logsController"] div[src="workoutTemplate"]'
			];
			$jbbcolor = [ // border-color && background-color
				'#message-nav-tab .nav-item.active',
				'.pagination>.active>a',
				'.pagination>.active>a:focus',
				'.pagination>.active>a:hover',
				'.pagination>.active>span',
				'.pagination>.active>span:focus',
				'.pagination>.active>span:hover'
			];
			$jgcolor = [ // color
				'.pagination>li>a',
				'.pagination>li>span',
				'.pagination>li>a:focus',
				'.pagination>li>a:hover',
				'.pagination>li>span:focus',
				'.pagination>li>span:hover',
				'.trainer-profile-name',
				'.trainer-day-label',
				'.main-navigation ul li a.active',
				'.main-navigation h3'
			];
			$jbcolor = [ //border-color
				'.container-title h3',
				'.title-welcome-section .container',
				'.trainer-dashboard tr td:nth-child(1)'
			];			
			printCss($jrgb, 1, $rgba);
			printCss($jbgcolor, 2, $gcolor);
			printCss($jbbcolor, 3, $gcolor);
			printCss($jgcolor, 4, $gcolor);
			printCss($jbcolor, 5, $gcolor);			
			?>
		</style>
	<?php endif; ?>
  
  
  <title>My Account - <?php echo $userdata->user_login; ?></title>

  </head>

  <body class="<?php echo ($pm_lvl == "gym") ? 'gym-page' : ''; ?>">	
<?php require_once( get_stylesheet_directory() . '/accounts/inc/header-section-account.php' ); ?>