<?php if(isset($_GET['print'])):  ?>
	<link rel="stylesheet" href="<?php echo get_stylesheet_directory_uri(); ?>/accounts/assets/css/print.css" />
	<div class="main-content padding20 matchHeight">
		<?php get_template_part( 'accounts/inc/print-program-type-3', 'page'); ?>
	</div>
<?php else:
	$uinfo = wp_get_current_user();
	$scheData = getSchedData($uinfo);
?>

<script type="text/javascript" src="<?php echo get_stylesheet_directory_uri(); ?>/accounts/assets/js/responsive-calendar.min.js"></script>
<script>
function togglNote(a){
	var wnote = $(a).closest('li').find('.wnote');
	/* $(wnote).slideToggle(); */
	$('.wnote').each(function(){
		if(!$(this).is(wnote))
			$(this).hide();
		else
			$(this).slideToggle();
	});
	$('.wexer').hide();
}
function toggleExercise(a,b,c){
	var thisExer = $(b).closest('li').find('.wexer');	
	$('.wexer').each(function(){
		if(!$(this).is(thisExer))
			$(this).hide();
	});
	$('.wnote').hide();
	if($(thisExer).html() == ""){
		$.ajax({
			url:  '<?php echo home_url(); ?>/wp-admin/admin-ajax.php',
			method:'POST',
			data: {
				action: 'getWExercises_ajax',
				wid: a
			},
			dataType: 'json',
			success: function(res){
				var ctr = 0,
				 ml = "<?php echo $_SERVER['REQUEST_URI']; ?>&print=1&workout_id=" +a+ "&client_id=" + c,
				 scheds = '<div style="margin-top:10px;" class="table-responsive"><table class="table table-bordered"><tr style="font-weight:800">'
							+'<td>#</td>'
							+'<td>Exercise</td>'
							+'<td>Var 1</td>'
							+'<td>Var 2</td>'
							+'<td>Sets</td>'
							+'</tr>';
				 res.result.forEach(function(elem){					 
					 ctr++;
					 scheds += "<tr>";
					 scheds += "<td>"+ctr+"</td>";
					 scheds += "<td>"+(elem.exer_type != null ? elem.exer_type : "--")+"</td>";
					 scheds += "<td>"+(elem.exer_exercise_1 != null ? elem.exer_exercise_1 : "--")+"</td>";
					 scheds += "<td>"+(elem.exer_exercise_2 != null ? elem.exer_exercise_2 : "--")+"</td>";
					 scheds += "<td>"+(elem.exer_sets != null ? elem.exer_sets : "--")+"</td>";	 
					 scheds += "</tr>";
				 });
				 scheds += "</table></div>";
				 scheds += '<div class="float-right"><a target="_blank" href="'+ml+'" class="red-btn">Print</a></div>';
				$(thisExer).html(scheds).slideToggle();
			},
			error: function(r,xhr, result){
				console.log(r + ' ' + xhr + ' ' + result);
			}
		});
	}else{
		$(thisExer).slideToggle();
	}
}
function pullWorkout(date){
	var thisWork = workoutDates[date];		
	//console.log(thisWork);
	
	$('#workoutModal').modal();
	$('#workoutModal .modal-title').html('Program(s) for ' + date);
	htmlContent = '<ul class="workout-lists trainer-workouts-lists">';	  
	$.each(thisWork, function(i, v){			
		var wisDone = v[0]['wisdone'],
		vstatus = "",
		v0 = v[0],
		wnote = "No Note",
		wexercises = [];
		if(v0['wnote'].length != 0)
			wnote = v0['wnote'][0]['detail'];
			
		if(wisDone != 0){
			vstatus = "(Completed)";
		}				
		if(dateToday > date && wisDone == 0){
			vstatus = "(Not Completed)";
		}								
		if(dateToday < date && wisDone == 0){
			vstatus = "(Pending)";
		}	

		
		if(v0['wdname'] != ""){
			htmlContent += '<li class="workout-list-item"><div class="workout-wrapper"><span class="sm-workout-icon sm-icons"></span><span class="wdname">' + v0['wdname'] + ' - '+v0['wcnname']+' '+vstatus+'</span>';			
			if(dateToday == date && wisDone == 0){
				htmlContent += '&nbsp;<a href="'+v0['daylink']+'"><span class="sm-play-icon sm-icons"></span></a>';
			}			
			htmlContent += '<a href="javascript:void(0)" onclick="toggleExercise('+v0['wid']+',this,'+v0['wclient']+')"><span class="sm-icons sm-fa" style="text-align:center;"><i style="color:#fff;font-size:22px;" class="fa fa-eye"></i></span></a><a href="javascript:void(0)" onclick="togglNote(this)"><span class="sm-icons sm-note-icon"></span></a></div><div class="wexer" style="display:none;"></div><div class="wnote" style="display:none;">'+wnote+'</div></li>';
		}
	});
	htmlContent += '</ul>';
	$('#workoutModal .modal-body').html(htmlContent);
}
function alz(num) {
	if (num < 10) {
		return "0" + num;
	} else {
		return "" + num;
	}
}
$(document).ready(function(){	
	if($('.responsive-calendar').length != 0){
		$(".responsive-calendar").responsiveCalendar({
			onDayClick: function(events) {
				//console.log(events);
				var key = $(this).data('year')+'-'+alz( $(this).data('month') )+'-'+alz( $(this).data('day'));										
				if(events[key]){
					pullWorkout(key);
				}
			},
			events: {
			<?php
				$ctrTemp = 0;
				$nctr = count($scheData);
				foreach($scheData as $k=>$v):
					$ctrTemp++;
					$tempArr = [];						
					foreach($v as $w){
						if($w[0]['wdname'] != "")
							$tempArr[] = $w;
					}
					if(count($tempArr) > 0){
						echo '"'.$k.'": {"number": '.count($tempArr).',"badgeClass": "badge-primary", "url": ""}';
						echo ($ctrTemp == $nctr) ? "" : ",";
					}
				endforeach;
			?>
			}	
		});		
	}	
});
</script>
<?php endif; ?>