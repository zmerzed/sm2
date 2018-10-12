<script>window.print();</script>
<link rel="stylesheet" media="print" href="<?php echo get_stylesheet_directory_uri(); ?>/accounts/assets/css/print-media.css" />
<!-- Print Type 3 -->
<?php
	$exercises = [];
	$client_id = $_GET['client_id'];
	$workout_id = $_GET['workout_id'];
	if(getWExercises($workout_id))
		$exercises = getWExercises($workout_id);
	$maxSet = 0;
	foreach($exercises as $e){
		if($e){
			$eset = $e->exer_sets;
			if($eset > $maxSet)
				$maxSet = $eset;							
		}						
	}
	
	/* if(!empty(getWorkoutMaxSet($workout_id)))
		$maxSet = getWorkoutMaxSet($workout_id)[0]->max_sets; */
?>
	<h4 class="text-center"><?php echo getWorkoutDayName($workout_id); ?></h4>
<table class="table-bordered table">
	<thead>
		<tr>
			<th class="text-center">Order</th>
			<th class="text-center" width="20%">Clip</th>
			<th width="30%">Exercise (Tempo)</th>
			<!-- <td>Sets</td> -->
			<th class="text-center" width="62">Reps</th>
			<th class="text-center" width="60">Rest Int</th>
			<th class="text-center">Circuit Set</th>
			<th class="text-center">Circuit Reps</th>			
			<th class="text-center">Start Weight</th>	
			<?php
				for ($x = 1; $x <= $maxSet; $x++)
					echo '<th class="text-center">'.($x==1 ? 'Set' : ''). ' ' .$x.'</th>';
			?>
		</tr>
	</thead>
	<tbody>		
		<?php
			$jctr = 0;
			$group_letter_arr = [];			
			$group_letter_ctr = [];
			$gname = "";
			
			foreach($exercises as $e){	
				if($e->group_by != "")
					$gname = substr($e->group_by, 0, 1);
				else
					$gname = "null";
				
				if(!isset($group_letter_ctr[$gname]))
					$group_letter_ctr[$gname] = 1;
				else
					$group_letter_ctr[$gname]++;
			}
			
			
			
			foreach($exercises as $e){
				$group_chk = 0;
				$jctr++;
					if(!empty($e)){
						$exercise = $e->exer_type;
						$eTempo = $e->exer_tempo;
						$eSet = $e->exer_sets;
						$eRep = $e->exer_rep;
						$eRest = $e->exer_rest;
						$ePart = "";
						$exer = "";
						foreach($e as $k=>$v){
							if($k == 'exer_body_part')
								$ePart = $v;
							if($k == 'exer_type')
								$exer = $v;
						}
						$vid = $e->exer_video;
						if($vid != "")
							$vid = getVideoID($vid);
						$n = "None";
						
						if($e->group_by != "")							
							$gname = substr($e->group_by, 0, 1);
						else
							$gname = "null";
						
						if(!in_array($gname, $group_letter_arr)){
							$group_letter_arr[] = $gname;
							$group_chk = 1;
						}
						$ciruitDetails = getCircuitDetails($workout_id, $gname);				
		?>
				<tr>
					<td class="text-center"><?php echo $e->group_by; ?></td>
					<td width="20%" class="text-center">
						<?php
							echo ($vid) ? '<img src="https://i.ytimg.com/vi/'.$vid[0].'/maxresdefault.jpg" class="img-responsive img-vid" style="min-width:200px;" />' : $n;
						?>
					</td>
					<td width="30%" style="min-width:200px;">
						<?php echo ($exercise) ? (($eTempo) ? $exercise.' ('.$eTempo.')' : $exercise)  : $n; ?>
					</td>
					<td class="text-center">
						<?php echo ($eRep) ? $eRep : $n; ?>
					</td>
					<td>
						<?php echo ($eRest) ? $eRest : $n; ?>
					</td>					
					<?php if($group_chk == 1): ?>
						<td bgcolor="#fefefe" rowspan="<?php echo $group_letter_ctr[$gname]; ?>" style="vertical-align:middle;" class="text-center circuits">
							<?php echo ($ciruitDetails[0]->reps != "") ? $ciruitDetails[0]->reps : $n; ?>
						</td>
						<td bgcolor="#fefefe" rowspan="<?php echo $group_letter_ctr[$gname]; ?>" style="vertical-align:middle;" class="text-center circuits">
							<?php echo ($ciruitDetails[0]->reps != "") ? $ciruitDetails[0]->sets : $n; ?>
						</td>						
					<?php endif; ?>
					<td class="text-center">
						<?php
							$weight = getAssignmentSets($e->exer_ID,$client_id)[0]->weight;
							echo ($weight) ? $weight : $n;
						?>
					</td>
					<?php for ($x = 0; $x < $maxSet; $x++) { ?>
						<td width="64" style="padding:0">
							<table class="tabl table-borderless" border="0">
								<tr border="0" style="background-color:transparent;">
									<td class="text-center" style="border:0;border-bottom:1px solid #ccc;height:60px;"><?php echo ($x==0) ? '<strong>WGT</strong>' : ''; ?></td>
								</tr>
								<tr border="0">
									<td class="text-center" style="border:0;border-top:1px solid #ccc;height:60px;"><?php echo ($x==0) ? '<strong>REPS</strong>' : ''; ?></td>
								</tr>
							</table>
						</td>
					<?php }	?>			
				</tr>
		<?php
				}
			}
		?>
	</tbody>
</table>
	