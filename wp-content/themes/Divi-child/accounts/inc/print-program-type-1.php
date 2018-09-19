<?php 
		echo "<!-- Print Type 1 -->";
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

		if(!empty($pDet)){
			foreach($pDet as $pd=>$v){
				if($pd == "program_name"):
					echo "<h2>".$v."</h2>";
				else:
					$wd = $v['workout_detail'][0]; //Workout Details
					$ed = $v['exercises']; //Exercise Details

					$maxSet = 0;
					foreach($ed as $e){
						if($e){
							$eset = $e->exer_sets;
							if($eset > $maxSet)
								$maxSet = $eset;							
						}						
					}
?>
	<h4><?php echo $wd->wday_name; ?></h4>
	<table class="table table-bordered">
		<thead>
			<tr>
				<td>#</td>
				<td width="20%">Pic</td>
				<td width="30%">Exercise(Tempo)</td>
				<td>Sets</td>
				<td width="62">Reps</td>
				<td width="60">Rest</td>
				<td>Start Weight</td>
				<?php
					for ($x = 1; $x <= $maxSet; $x++)
						echo "<td>Set {$x}</td>";
				?>
			</tr>
		</thead>
		<tbody>
			<?php
				$jctr = 0;
				foreach($ed as $e):
					$jctr++;
					if(!empty($e)){
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
			?>
				<tr>
					<td><?php echo $jctr; ?></td>
					<td>
						<?php
							if($vid)
								echo '<img src="https://i.ytimg.com/vi/'.$vid[0].'/maxresdefault.jpg" class="img-responsive img-vid" style="min-width:200px;" />';
							else {
								echo "None";
							}
						?>
					</td>
					<?php	
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
								echo "";
						echo '</td>';

						foreach($e as $k=>$v){
							if(is_array($v)){								
								for ($x = 0; $x < $maxSet; $x++) {
						?>
							<td width="64" style="padding:0">
								<table class="tabl table-borderless">
									<tr>
						<?php
									echo '<td style="border:0;border-bottom:1pxsolid #ccc;height:60px;"><strong>WGT</strong> ';
										if(!empty($v[$x]))
											$eW = $v[$x]->weight;
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
							}
						}
					?>
				</tr>
			<?php
				}else
					echo '<tr><td colspan="10">No Exercise</td></tr>';
			endforeach; ?>
		</tbody>
	</table>
	<script>window.print();</script>	
<?php
				endif;
			}
		}