<link rel="stylesheet" media="print" href="<?php echo get_stylesheet_directory_uri(); ?>/accounts/assets/css/print-media.css" />
<!-- Print Type 1 -->
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

		if(!empty($pDet)){
			foreach($pDet as $pd=>$v){
				if($pd == "program_name"):
					echo "<h3>".$v."</h3>";
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
				/* if(!empty(getWorkoutMaxSet($wid)))
					$maxSet = getWorkoutMaxSet($wid)[0]->max_sets; */
?>
	<h4><?php echo $wd->wday_name; ?></h4>
	<table class="table table-bordered">
		<thead>
			<tr>
				<th style="text-center">Circuit</th>
				<th width="20%">Pic</th>
				<th width="30%">Exercise(Tempo)</th>
				<!--td>Sets</td-->
				<th width="62">Reps</th>
				<th width="60">Rest</th>
				<th>Circuit Reps</th>
				<th>Circuit Set</th>
				<th>Start Weight</th>
				<?php
					for ($x = 1; $x <= $maxSet; $x++)
						echo "<th>Set {$x}</th>";
				?>
			</tr>
		</thead>
		<tbody>
			<?php
				$jctr = 0;
				$group_letter_arr = [];			
				$group_letter_ctr = [];
				$n = "None";
				
				foreach($ed as $e){
					$gname = "";
					
					if($e->group_by != "")
						$gname = substr($e->group_by, 0, 1);
					else
						$gname = "null";
					
					if(!isset($group_letter_ctr[$gname]))
						$group_letter_ctr[$gname] = 1;
					else
						$group_letter_ctr[$gname]++;
				}
				
				foreach($ed as $e):
					$group_chk = 0;
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
						
						if($e->group_by != "")							
							$gname = substr($e->group_by, 0, 1);
						else
							$gname = "null";
						
						if(!in_array($gname, $group_letter_arr)){
							$group_letter_arr[] = $gname;
							$group_chk = 1;
						}
						
						if($vid != "")
							$vid = getVideoID($vid);
						
						$ciruitDetails = getCircuitDetails($wid, $gname);
			?>
				<tr>
					<td class="text-center"><?php echo $e->group_by; ?></td>
					<td width="20%" class="text-center">
						<?php
							if($vid)
								echo '<img src="https://i.ytimg.com/vi/'.$vid[0].'/maxresdefault.jpg" class="img-responsive img-vid" style="min-width:200px;" />';
							else {
								echo $n;
							}
						?>
					</td>
					<?php	
						echo '<td width="30%" style="min-width:200px;">';
							if($exercise){
								echo $exercise;
								echo ($eTempo) ? ' ('.$eTempo.')' : '';
							}else {
								echo $n;
							}
						echo '</td>';
						
						echo '<td>';
							if($eRep)
								echo $eRep;
							else {
								echo $n;
							}
						echo '</td>';

						echo '<td>';
							if($eRest)
								echo $eRest;
							else {
								echo $n;
							}
						echo '</td>';
						
					?>
					
					<?php if($group_chk == 1): ?>
						<td rowspan="<?php echo $group_letter_ctr[$gname]; ?>" style="vertical-align:middle;" class="text-center">
							<?php echo ($ciruitDetails) ? $ciruitDetails[0]->reps : $n; ?>
						</td>
						<td rowspan="<?php echo $group_letter_ctr[$gname]; ?>" style="vertical-align:middle;" class="text-center">
							<?php echo ($ciruitDetails) ? $ciruitDetails[0]->sets : $n; ?>
						</td>						
					<?php endif; ?>
					
					<?php

						echo '<td>';
								echo "";
						echo '</td>';

						foreach($e as $k=>$v){
							if(is_array($v)){								
								for ($x = 0; $x < $maxSet; $x++) {
						?>
							<td width="64" style="padding:0">
								<table class="tabl table-borderless" border="0">
									<tr style="background-color:transparent;">
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