<?php
	$uinfo = wp_get_current_user();
	$pm_lvl = getMembershipLevel($uinfo);
	$gcolor = "";
	$gymInfo = getGymInfo($uinfo);

	if(isset($gymInfo['sm_gym_color']))
		$gcolor = $gymInfo['sm_gym_color'];

	if($pm_lvl == "gym" && $gcolor != ""){
		$rgba = 'rgba('.hexdec(substr($gcolor, 0, 2)).','.hexdec(substr($gcolor, 2, 2)).','.hexdec(substr($gcolor, 4, 2)).', 0.8)';
		$jrgb = [ // background-color rgba
		'.trainer-per-day-schedule-box.today li'
		];
		$jbgcolor = [ // background-color
		'.red-btn, form input[type="submit"], .trainer-add-workout a',
		'.list-table',
		'div[ng-controller="notesController"] div[src="workoutTemplate"]',
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
		echo "<style>";
		printCss($jrgb, 1, $rgba);
		printCss($jbgcolor, 2, $gcolor);
		printCss($jbbcolor, 3, $gcolor);
		printCss($jgcolor, 4, $gcolor);
		printCss($jbcolor, 5, $gcolor);
		echo "</style>";
	}