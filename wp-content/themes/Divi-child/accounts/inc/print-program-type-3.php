<script>window.print();</script>
<?php
	echo "<!-- Print Type 3 -->";
	$exercises = [];
	if(getWExercises($_GET['workout_id']))
		$exercises = getWExercises($_GET['workout_id']);
	$maxSet = 0;
	foreach($exercises as $e){
		if($e){
			$eset = $e->exer_sets;
			if($eset > $maxSet)
				$maxSet = $eset;							
		}						
	}
?>

<table class="table-bordered table">
	<thead>
		<tr>
			<td>#</td>
			<td width="20%">Pic</td>
			<td width="30%">Exercise (Tempo)</td>
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
			foreach($exercises as $e){				
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
		?>
				<tr>
					<td><?php echo $jctr; ?></td>
					<td>
						<?php
							echo ($vid) ? '<img src="https://i.ytimg.com/vi/'.$vid[0].'/maxresdefault.jpg" class="img-responsive img-vid" style="min-width:200px;" />' : $n;
						?>
					</td>
					<td>
						<?php
							echo ($exercise) ? (($eTempo) ? $exercise.' (<span style="text-transform:uppercase;">'.$eTempo.'</span>)' : $exercise)  : $n;
						?>
					</td>
					<td>
						<?php echo ($eSet) ? $eRest : $n; ?>
					</td>
					<td>
						<?php echo ($eRep) ? $eSet : $n; ?>
					</td>
					<td>
						<?php echo ($eRest) ? $eRest : $n; ?>
					</td>
					<td></td>
					<?php for ($x = 0; $x < $maxSet; $x++) { ?>
						<td width="64" style="padding:0">
							<table class="tabl table-borderless">
								<tr>
									<td style="border:0;border-bottom:1px solid #ccc;height:60px;"><strong>WGT</strong></td>
								</tr>
								<tr>
									<td style="border:0;border-top:1px solid #ccc;height:60px;"><strong>REPS</strong></td>
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
	