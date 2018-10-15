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
		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/angular-busy/4.1.4/angular-busy.min.js" type="text/javascript"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/ngStorage/0.3.9/ngStorage.min.js"></script>
		<script src="https://angular-ui.github.io/bootstrap/ui-bootstrap-tpls-1.3.2.js" type="text/javascript"></script>
		<?php		
		$data_request = "";	
		if(isset($_GET['data']))
			$data_request = $_GET['data'];
		?>

		<?php if( $data_request === 'notes' || $data_request === 'logs' ||  $data_request === "" || $data_request === 'exercises' || $data_request === 'clients'){ ?>
			<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
		<?php } ?>
		<link href='<?php echo get_stylesheet_directory_uri() .'/accounts/assets/css/responsive-calendar.css'; ?>' rel='stylesheet' />  
		<link rel="stylesheet" type="text/css" href="<?php echo get_stylesheet_directory_uri() .'/accounts/bootstrap/css/account-style.css'; ?>">
		<link rel="stylesheet" type="text/css" href="<?php echo get_stylesheet_directory_uri() .'/css/jc-style.css'; ?>">
		<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">

		<?php require_once( get_stylesheet_directory() . '/accounts/inc/gym-color.php' ); ?>
		<title>My Account - <?php echo $userdata->user_login; ?></title>
	</head>
	<body class="<?php echo (getMembershipLevel($userdata) == "gym") ? 'gym-page' : ''; ?>">	
	<?php require_once( get_stylesheet_directory() . '/accounts/inc/mobile-menu.php' ); ?>
	<?php require_once( get_stylesheet_directory() . '/accounts/inc/header-section-account.php' ); ?>