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
				<td width="20%">Pic</td>
				<!-- <td>Body Part</td> -->
				<td width="30%">Exercise(Tempo)</td>
				<!-- <td>Variation 1</td>
				<td>Variation 2</td> -->
				<!-- <td>SQ</td> -->
				<td>Sets</td>
				<td width="62">Reps</td>
				<!-- <td>Tempo</td> -->
				<td width="60">Rest</td>
				<td>Start Weight</td>
				<?php
					// if($wid != 0){
						for ($x = 1; $x <= $maxSet; $x++)
							echo "<td>Set {$x}</td>";
					// }
				?>
			</tr>
		</thead>
		<tbody>
			<?php
				$jctr = 0;
				foreach($ed as $e):
					$jctr++;
					$exercise = $e->exer_type;
					$eTempo = $e->exer_tempo;
					$eSet = $e->exer_sets;
					$eRep = $e->exer_rep;
					$eSets = $e->sets;
					$eRest = $e->exer_rest;
					$eStartWeight = "None";
					if($eSets)
						$eStartWeight = $eSets[0]->weight;
					$ePart = "";
					$exer = "";
					foreach($e as $k=>$v){
						if($k == 'exer_body_part')
							$ePart = $v;
						if($k == 'exer_type')
							$exer = $v;
					}
					$vid = getExerciseVideo($ePart, $exer);
					if($vid != "")
						$vid = getVideoID($vid);


					if(!empty($e) && $eStartWeight != "None"){
			?>
				<tr>
					<td><?php echo $jctr; ?></td>
					<td>
						<?php
							if($vid)
								echo '<img src="https://i.ytimg.com/vi/'.$vid[0].'/maxresdefault.jpg" class="img-responsive img-vid" />';
							else {
								echo "None";
							}
						?>
					</td>
					<?php
						// $notIn = ['exer_ID','exer_day_ID','exer_workout_ID','hash'];
						// printVar($e);

						echo '<td>';
							if($exercise){
								echo $exercise;
								echo ($eTempo) ? ' ('.$eTempo.')' : '';
							}else {
								echo "None";
							}
						echo '</td>';

						echo '<td>';
							if($eSet)
								echo $eSet;
							else {
								echo 'None';
							}
						echo '</td>';

						echo '<td>';
							if($eRep)
								echo $eRep;
							else {
								echo 'None';
							}
						echo '</td>';

						echo '<td>';
							if($eRest)
								echo $eRest;
							else {
								echo 'None';
							}
						echo '</td>';

						echo '<td>';
								echo $eStartWeight;
						echo '</td>';


						foreach($e as $k=>$v){
							// if(!in_array($k,$notIn)){
								if(is_array($v)){
									// if($wid != 0){
										for ($x = 0; $x < $maxSet; $x++) {
						?>
							<td width="64" style="padding:0">
								<table class="tabl table-borderless">
									<tr>
						<?php
											echo '<td style="border:0;border-bottom:1pxsolid #ccc;height:60px;"><strong>WGT</strong> ';
												if(!empty($v[$x])){
													$eW = $v[$x]->weight;
													// echo ($eW != "") ? $eW . " lbs" : "0 lbs";
												}
											echo "</td>";
						?>

									</tr>
									<tr>
										<td style="border:0;border-top:1px solid #ccc;height:60px;">
											<strong>REPS</strong>
										</td>
									</tr>
								</table>
							</td>
						<?php
										}
									// }
								}
							// }
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
