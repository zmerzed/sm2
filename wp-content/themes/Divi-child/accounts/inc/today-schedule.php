<!-- <tr><td>today-schedule</td><td>today-schedule</td><td>today-schedule</td></tr> -->
<?php
	$uinfo = wp_get_current_user();
	$schedData = getSchedData($uinfo);	
	$today = date('Y-m-d');
	
	foreach($schedData as $k=>$v){
		if($k == $today){			
			foreach($v as $pd){
				echo "<tr><td>{$pd[0]['wtime']}</td><td>{$pd[0]['wcname']}</td><td>{$pd[0]['wname']}</td></tr>";				
			}
		}
	}
?>