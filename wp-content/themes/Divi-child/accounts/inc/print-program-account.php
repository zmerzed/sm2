<?php
	$pid = 0;
	$wid = 0;
	$cid = 0;
	if(isset($_GET['workout_client_id']))
		$cid = $_GET['workout_client_id'];
	if(isset($_GET['workout']))
		$pid = $_GET['workout']; //Program ID
	else
		$pid = $_GET['workoutId'];
	
	if(isset($_GET['dayId']))
		$wid = $_GET['dayId'];
			
	$pDet = getProgramDeatils($pid,$wid,$cid);	//Program Details
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
				
				$maxSet = 0;
				foreach($ed as $e){
					$eset = $e->exer_sets;
					if($eset > $maxSet)
						$maxSet = $eset;
				}
?>
	<br><h4>Workout - <?php echo $wd->wday_name; ?></h4>
	<table class="table table-bordered">
		<thead>
			<tr>
				<td>#</td>
				<td>Body Part</td>
				<td style="width:20%;">Exercise Name</td>
				<td>Type 1</td>
				<td>Type 2</td>
				<td>SQ</td>
				<td>Sets</td>
				<td width="62">Reps</td>
				<td>Tempo</td>
				<td width="60">Rest</td>
				<td>Implementation</td>
				<?php
					if($wid != 0){
						for ($x = 1; $x <= $maxSet; $x++)
							echo "<td>Set {$x}</td>";
					}
				?>
			</tr>
		</thead>
		<tbody>
			<?php
				$jctr = 0;
				foreach($ed as $e):
				$jctr++;
					if(!empty($e)){
			?>
				<tr>
					<td><?php echo $jctr; ?></td>
					<?php
						$notIn = ['exer_ID','exer_day_ID','exer_workout_ID','hash'];
						foreach($e as $k=>$v){
							
							if(!in_array($k,$notIn)){
								if(!is_array($v)){
									if($v != "")
								echo "<td>{$v}</td>";
									else
										echo '<td>None</td>';
								}else{
									if($wid != 0){
										for ($x = 0; $x < $maxSet; $x++) {
											echo '<td width="64">';
												if(!empty($v[$x])){
													$eW = $v[$x]->weight;
													echo ($eW != "") ? $eW . " lbs" : "0 lbs";
												}										
											echo "</td>";
										}
									}
								}						
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
	<script>//window.print();</script>
<?php
			endif;
		}
	}	
?>