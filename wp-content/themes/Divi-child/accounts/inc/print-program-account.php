<?php
	$pid = $_GET['workout']; //Program ID
	$pDet = getProgramDeatils($pid);	//Program Details
	/* echo "<pre>";
	print_r($pDet);
	echo "</pre>"; */
	
	
	if(!empty($pDet)){
		foreach($pDet as $pd=>$v){
			if($pd == "program_name"):
				echo "<h3>Program - ".$v."</h3>";
			else:
				$wd = $v['workout_detail'][0]; //Workout Details
				$ed = $v['exercises']; //Exercise Details
				
?>
	<br><h4>Workout - <?php echo $wd->wday_name; ?></h4>
	<table class="table table-bordered">
		<thead>
			<tr>
				<td>Body Part</td>
				<td style="width:20%;">Exercise Name</td>
				<td>Type 1</td>
				<td>Type 2</td>
				<td>SQ</td>
				<td>Sets</td>
				<td>Reps</td>
				<td>Tempo</td>
				<td>Rest</td>
				<td>Implementation</td>
			</tr>
		</thead>
		<tbody>
			<?php
				foreach($ed as $e):
					if(!empty($e)){
			?>
				<tr>
					<?php
						$notIn = ['exer_ID','exer_day_ID','exer_workout_ID','hash'];
						foreach($e as $k=>$v){
							if(!in_array($k,$notIn)){
								if($v != "")
									echo '<td>'.$v.'</td>';
								else
									echo '<td>N/A</td>';
							}
						}
					?>	
				</tr>
			<?php
				}else{
					echo '<tr><td colspan="10">No Exercise</td></tr>';
				}
			endforeach; ?>
		</tbody>
	</table>
<?php
			endif;
		}
	}	
?>