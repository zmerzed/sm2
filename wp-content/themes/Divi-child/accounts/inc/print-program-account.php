<?php
	$current_url = explode("?", $_SERVER['REQUEST_URI']);
	if($_GET['data'] == "workout" || $_GET['data'] == "edit-workout"){
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
		
		/* printVar($pDet); */


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
								echo "";
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
	<script>window.print();</script>	
<?php
				endif;
			}
		}
		
	/*End if &data=workout*/
	}elseif($_GET['data'] == 'add-workouts'){
		$program_id = $_GET['workout'];
		$client_id = $_GET['workout_client_id'];
		
		global $wpdb;
		$program_workout_clients_query = 'SELECT * FROM  workout_day_clients_tbl WHERE workout_clientID = '. $client_id. ' AND workout_client_workout_ID = '. $program_id . ' ORDER BY workout_client_dayID ASC';
		
		$program_workout_clients = $wpdb->get_results($program_workout_clients_query, OBJECT);
		
		$program_query = 'SELECT * FROM workout_tbl WHERE workout_ID = '. $program_id;
		$program = $wpdb->get_results($program_query, OBJECT);
			
		$program_name = $program[0]->workout_name;
		
		echo '<h3>' .$program_name . '</h3>';
		
		if($program_workout_clients){		
			foreach($program_workout_clients as $workout){
				$workout_id = $workout->workout_client_dayID;
				$program_details = getProgramDeatils($program_id,$workout_id,$client_id);
				$workout_details = $program_details[$workout_id]['workout_detail'][0];
				$exercises = $program_details[$workout_id]['exercises'];
				
				$set_counter = 0;				
				foreach($exercises as $e){
					if(!empty($e)){
						$eset = $e->exer_sets;
						if($eset > $set_counter)
							$set_counter = $eset;							
					}						
				}
		?>
					<h4><?php echo $workout_details->wday_name; ?></h4>
					<table class="table table-bordered">
						<tr>
							<th>#</th>
							<th>Pic</th>
							<th>Exercise(Tempo)</th>
							<th>Sets</th>
							<th>Reps</th>
							<th width="70">Rest</th>
							<th>Start Weight</th>
							<?php
								for ($x = 1; $x <= $set_counter; $x++)
									echo "<th>Set {$x}</th>";
							?>
						</tr>
						<?php
							$exercise_counter = 0;
							foreach($exercises as $e){
								$exercise_counter++;							
								if($e){
						?>
									<tr>
										<td><?php echo ($exercise_counter); ?></td>
										<td class="text-center"><?php echo (getVideoID(getExerciseVideo($e->exer_body_part, $e->exer_type))) ? '<img src="https://i.ytimg.com/vi/' . getVideoID(getExerciseVideo($e->exer_body_part, $e->exer_type))[0] .'/maxresdefault.jpg" class="img-fluid img-vid" style="max-height:112px;" />' : "--"; ?></td>
										<td>
											<?php
												echo ($e->exer_type) ? $e->exer_type : "--";
												echo ($e->exer_tempo) ? " (" . $e->exer_tempo . ")" : "";
											?>
										</td>
										<td><?php echo ($e->exer_sets) ? $e->exer_sets : "--";  ?></td>
										<td><?php echo ($e->exer_rep) ? $e->exer_rep : "--"; ?></td>
										<td><?php echo ($e->exer_rest) ? $e->exer_rest : "--"; ?></td>
										<td><?php echo (count($e->sets) > 0) ? $e->sets[0]->weight : ""; ?></td>								
										<?php for ($x = 1; $x <= $set_counter; $x++){ ?>
											<td style="padding:0;">
												<table class="table table-borderless">
													<tr>
														<td style="border:0;border-bottom:1px solid #ccc;height:60px;"><strong>WGT</strong></td>
													</tr>
													<tr>
														<td style="border:0;border-top:1px solid #ccc;height:60px;"><strong>REPS</strong></td>
													</tr>
												</table>
											</td>
										<?php } ?>								
									</tr>
						<?php
								}else{
						?>
							<tr>
								<td colspan="<?php echo (7 + $set_counter); ?>">No Exercise</td>
							</tr>
						<?php
								}
							}
						?>
					</table>
		<script>window.print();</script>
		<?php
			}
		}else
			echo "No Workouts";
	/*End if &data=add-workouts*/
	}else{
		echo '<script>window.location.href = "'.$current_url[0] .'";</script>';
	}
?>
