<!-- Print Type 2 -->
<?php
	$program_id = 0;
	if(isset($_GET['workout']))
		$program_id = $_GET['workout'];
	$client_id = 0;
	if(isset($_GET['workout_client_id']))
		$client_id = $_GET['workout_client_id'];
	
	global $wpdb;
	$program_workout_clients_query = 'SELECT * FROM  workout_day_clients_tbl WHERE workout_clientID = '. $client_id. ' AND workout_client_workout_ID = '. $program_id . ' ORDER BY workout_client_dayID ASC';	
	$program_workout_clients = $wpdb->get_results($program_workout_clients_query, OBJECT);	
	$program_query = 'SELECT * FROM workout_tbl WHERE workout_ID = '. $program_id;
	$program = $wpdb->get_results($program_query, OBJECT);
	
	$program_name = "";
	if($program)
		$program_name = $program[0]->workout_name;
	
	echo '<h3>' .$program_name . '</h3>';	
	
	if($program_workout_clients){		
		foreach($program_workout_clients as $workout){
			$workout_id = $workout->workout_client_dayID;
			$program_details = [];
			if(getProgramDeatils($program_id,$workout_id,$client_id))
				$program_details = getProgramDeatils($program_id,$workout_id,$client_id);
			$workout_details = [];
			if(!empty($program_details[$workout_id]))
				$workout_details = $program_details[$workout_id]['workout_detail'][0];
			$exercises = [];
			if(!empty($program_details[$workout_id]))
				$exercises = $program_details[$workout_id]['exercises'];
			
			$set_counter = 0;				
			foreach($exercises as $e){
				if(!empty($e)){
					$eset = $e->exer_sets;
					if($eset > $set_counter)
						$set_counter = $eset;							
				}						
			}
			if(!empty($workout_details)){
				echo '<h4>'.$workout_details->wday_name.'</h4>';
?>
			<table class="table table-bordered print-program-type-2">
				<tr>
					<th class="text-center">Circuit</th>
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
								<td class="text-center"><?php echo $e->group_by; ?></td>
								<td width="20%" class="text-center"><?php echo (getVideoID(getExerciseVideo($e->exer_body_part, $e->exer_type))) ? '<img src="https://i.ytimg.com/vi/' . getVideoID(getExerciseVideo($e->exer_body_part, $e->exer_type))[0] .'/maxresdefault.jpg" class="img-fluid img-vid" style="max-height:112px;" />' : "--"; ?></td>
								<td width="30%">
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
		}
	}else
		echo "No Workouts";
	/*End if &data=add-workouts*/