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
?>

<div class="text-center btn-con">
	<button class="btn red-btn" onclick="printBtn();">Print</button>
</div>

<?php

		if(!empty($pDet)){
			$ctr__ = 0;
			foreach($pDet as $pd=>$v){
				if($pd == "program_name"):
					echo "<h3>".$v."</h3>";
				else:
					$ctr__++;
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
	<h4 class="text-center">Workout <?php echo $ctr__  .' - '. $wd->wday_name; ?></h4>
	<table class="table table-bordered">
		<thead>
			<tr>
				<th class="text-center">Order</th>
				<th class="text-center" width="20%">Clip</th>
				<th width="30%">Exercise(Tempo), Variations, Impl</th>
				<!--td>Sets</td-->
				<th width="62">Reps</th>
				<th width="60">Rest Int</th>
				<th>Circuit Set</th>
				<!--th>Circuit Reps</th-->
				<th style="max-width:100px;">Start Weight</th>
				<th>&nbsp;</th>
				<?php
					for ($x = 1; $x <= $maxSet; $x++)
						echo '<th class="text-center">'.($x==1 ? 'Set' : ''). ' ' .$x.'</th>';
				?>
				<!--th>Var 1</th>
				<th>Var 2</th>
				<th>Impl</th-->
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

						$ciruitDetails = getCircuitDetails($wd->wday_ID, $gname);
			?>
				<tr class="main-tr">
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
								echo ($e->exer_exercise_1 != "") ? ", ".$e->exer_exercise_1 : "";
								echo ($e->exer_exercise_2 != "") ? ", ".$e->exer_exercise_2 : "";
								echo ($e->exer_impl1 != "") ? ", ".$e->exer_impl1 : "";
							}else {
								echo $n;
							}
						echo '</td>';

						echo '<td class="text-center">';
							if($eRep)
								echo $eRep;
							else {
								echo $n;
							}
						echo '</td>';

						echo '<td class="text-center">';
							if($eRest)
								echo $eRest;
							else {
								echo $n;
							}
						echo '</td>';

					?>

					<?php if($group_chk == 1): ?>
						<td rowspan="<?php echo $group_letter_ctr[$gname]; ?>" style="vertical-align:middle;" class="text-center">
							<?php
								if($ciruitDetails)
									echo ($ciruitDetails[0]->sets != "") ? $ciruitDetails[0]->sets : $n;
								else
									echo $n;
							?>
						</td>
						<!--td rowspan="<?php echo $group_letter_ctr[$gname]; ?>" style="vertical-align:middle;" class="text-center">
							<?php //echo ($ciruitDetails[0]->reps != "") ? $ciruitDetails[0]->reps : $n; ?>
						</td-->
					<?php endif; ?>
					<td class="text-center align-middle">
						<?php
							$eset = "";
							if(count($e->sets) > 0)
								$eset = $e->sets[0]->weight;
							echo ($eset != "") ? $e->sets[0]->weight : $n;
						?>
						<!--input type="text" class="inputprint" style="max-width:100px;" /-->
					</td>
					<td style="padding:0" class="set-options">
						<table class="tabl table-borderless" border="0">
							<tr border="0" style="background-color:transparent;">
								<td class="text-center" style="vertical-align:middle;border:0;border-bottom:1px solid #ccc;padding:0;">
									WGT
								</td>
							</tr>
							<tr border="0">
								<td class="text-center" style="vertical-align:middle;border:0;padding:0;">
									REPS
								</td>
							</tr>
						</table>
					</td>
					<?php

						foreach($e as $k=>$v){
							if(is_array($v)){
								for ($x = 0; $x < $maxSet; $x++) {
						?>
							<td style="padding:0" class="set-options">
								<table class="tabl table-borderless" border="0">
									<tr border="0" style="background-color:transparent;">
										<td class="text-center" style="vertical-align:middle;border:0;border-bottom:1px solid #ccc;padding:0;">
											<?php
												if($ciruitDetails)
													echo ($x < $ciruitDetails[0]->sets && $ciruitDetails[0]->sets > 0) ? '<input type="text" class="set-input" />' : '--';
												else
													echo "--";
											?>

										</td>
									</tr>
									<tr border="0">
										<td class="text-center" style="vertical-align:middle;border:0;padding:0;">
											<?php
												if($ciruitDetails)
													echo ($x < $ciruitDetails[0]->sets && $ciruitDetails[0]->sets > 0) ? '<input type="text" class="set-input" />' : '--';
												else
													echo "--";
											?>
										</td>
									</tr>
								</table>
							</td>
					<?php
								}
							}
						}
					?>
					<!--td><?php //echo ($e->exer_exercise_1 != "") ? $e->exer_exercise_1 : "--"; ?></td>
					<td><?php //echo ($e->exer_exercise_2 != "") ? $e->exer_exercise_2 : "--"; ?></td>
					<td><?php //echo ($e->exer_impl1 != "") ? $e->exer_impl1 : "--"; ?></td-->
				</tr>
			<?php
				}else
					echo '<tr><td colspan="10">No Exercise</td></tr>';
			endforeach; ?>
		</tbody>
	</table>
	<script>
		function printBtn(){
			/* $('.btn-con').hide(); */
			window.print();
		}
		$(window).ready(function(){
			$('.main-tr').each(function(){
				var trheight = $(this).height() / 2;
				$(this).find('.set-options tr td').height(trheight);
				$(this).find('.set-options tr td input').height(trheight);
			});
			$('.inputprint').focus(function(){
				$(this).addClass('focused');
			}).focusout(function(){
				$(this).removeClass('focused');
			}).each(function(){
				$(this).height($(this).closest('td').height());
			});
		});
	</script>
<?php
				endif;
			}
		}
