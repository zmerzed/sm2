<?php					
	$uinfo = wp_get_current_user();		
	$scheData = getSchedData($uinfo);
	jabs($uinfo);
?>
<div class="modal fade" id="workoutModal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Your program(s)</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p></p>
      </div>
      <div class="modal-footer">        
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<!-- Optional JavaScript -->
  <script src='<?php echo get_stylesheet_directory_uri() .'/accounts/assets/js/moment.min.js';?>'></script>
  <!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <!-- <script type="text/javascript" src="<?php echo get_stylesheet_directory_uri(); ?>/accounts/assets/js/jquery-3.2.1.slim.min.js"></script> -->
<!--  <script src='--><?php //echo get_stylesheet_directory_uri() .'/accounts/assets/js/jquery-3.3.1.min.js';?><!--'></script>-->
  <script type="text/javascript" src="<?php echo get_stylesheet_directory_uri(); ?>/accounts/assets/js/responsive-calendar.min.js"></script>
  <script type="text/javascript" src="<?php echo get_stylesheet_directory_uri(); ?>/accounts/assets/js/popper.min.js"></script>
  <script type="text/javascript" src="<?php echo get_stylesheet_directory_uri(); ?>/accounts/assets/js/bootstrap.min.js"></script>
  <!-- <script type="text/javascript" src="<?php echo get_stylesheet_directory_uri(); ?>/accounts/assets/js/jquery.matchHeight-min.js"></script>  --> 
  <script type="text/javascript" src="<?php echo get_stylesheet_directory_uri(); ?>/accounts/assets/js/jquery.dataTables.min.js"></script>
  <script type="text/javascript" src="<?php echo get_stylesheet_directory_uri(); ?>/accounts/assets/js/dataTables.bootstrap.min.js"></script>
  <script type="text/javascript" src="<?php echo get_stylesheet_directory_uri(); ?>/js/spectrum.js"></script>

  <!-- <script type="text/javascript" src="<?php echo get_stylesheet_directory_uri() .'/accounts/assets/js/fullcalendar.min.js';?>"></script> -->
   

  <script type="text/javascript">
	$('input[name="myFile"]').on('change', function(){
		var fileP = this.value;
		fileSplit = fileP.split('\\');
		$('.upload-btn-wrapper small').show().html(fileSplit[fileSplit.length-1]);		
	});
	function clickFile(a){
		$('input[name="myFile"]').click();
	}
	if($('.basic').length != 0){
		$(".basic").spectrum({
			change: function(color) {
				
				window.location.href = "<?php echo $_SERVER['REQUEST_URI'] . '&ccolor='; ?>" + color.toHexString().replace('#','');
				
			},
			move: function(color){
				
				var scolor = color.toHexString(),
				stylecss = '.gym-page .red-btn,.gym-page .progress-bar,.gym-page .exercise-number,.gym-page .workout-tab-pane-wrapper,.gym-page .wi-blu,.gym-page .compose-message button, .gym-page .btn-add-workout button,.gym-page .message-wrapper,.gym-page .trainer-add-workout a,.gym-page .workoutclass,.gym-page #table-sorter_wrapper, .gym-page #table-sorter-logs_wrapper{background-color:'+scolor+';}.gym-page #message-nav-tab .nav-item.active{background-color:'+scolor+';border-color:'+scolor+';}.gym-page .trainer-profile-name,.gym-page .trainer-day-label,.gym-page .main-navigation ul li a.active,.gym-page .main-navigation h3{color:'+scolor+';}.gym-page .container-title h3,.gym-page .title-welcome-section .container,.gym-page .trainer-dashboard tr td:nth-child(1){border-color:'+scolor+'!important;}';
				
				$('.adjustcolor').html(stylecss);
			}
			
		});		
	}
	
   var workoutDates = <?php echo json_encode($scheData); ?>,
   themedir = "<?php echo get_stylesheet_directory_uri(); ?>";
   dateToday = "<?php echo date('Y-m-d'); ?>";
   function pullWorkout(date){
		var thisWork = workoutDates[date];		
		/* console.log(thisWork); */
		
		$('#workoutModal').modal();
		$('#workoutModal .modal-title').html('Program(s) for ' + date);
		htmlContent = '<ul class="workout-lists trainer-workouts-lists">';	  
		$.each(thisWork, function(i, v){			
			var wisDone = v[0]['wisdone'],
			vstatus = "",
			v0 = v[0];
			if(wisDone != 0){
				vstatus = "(Completed)";
			}				
			if(dateToday > date && wisDone == 0){
				vstatus = "(Not Completed)";
			}								
			if(dateToday < date && wisDone == 0){
				vstatus = "(Pending)";
			}				
			htmlContent += '<li class="workout-list-item"><div class="workout-wrapper"><span class="sm-workout-icon sm-icons"></span><span class="wdname">' + v0['wdname'] + ' - '+v0['wcnname']+' '+vstatus+'</span>';			
			if(dateToday == date && wisDone == 0){
				htmlContent += '&nbsp;<a href="'+v0['daylink']+'"><span class="sm-play-icon sm-icons"></span></a>';
			}			
			htmlContent += '<a href="javascript:void(0)" onclick="togglNote(this)"><img src="'+themedir+'/accounts/images/workout-note.png" style="display:none;"><span class="sm-icons sm-note-icon"></span></a></div><div class="wnote" style="display:none;">'+v0['wnote'][0]['detail']+'</div></li>';
		});
		htmlContent += '</ul>';
		$('#workoutModal .modal-body').html(htmlContent);
   }
	function togglNote(a){
		$(a).closest('li').find('.wnote').slideToggle();
	}

  jQuery('#table-sorter').DataTable({
    "lengthMenu": [[8, 16, 24, -1], [8, 16, 24, "All"]]
  });

  jQuery('#table-sorter-logs').DataTable({
	"paging": false,
	"info": false,
	"order": []
  });
  
  /* jQuery('.matchHeight').matchHeight(); */
  /* jQuery('.trainer-schedule-wrapper').matchHeight(); */
  
  
  // Assign active class in the navigation
  var sPageURL = window.location.search.substring(1);
  var sURLVariables = sPageURL.split('&');
  for (var i = 0; i < sURLVariables.length; i++){
      var sParameterName = sURLVariables[i].split('=');
      jQuery('.main-navigation ul li a').each(function () {
        if( jQuery(this).attr('menu-item') === sParameterName[1] ){
          jQuery(this).addClass('active');
        }
      });
  } 

	jQuery(document).ready(function () {
		if($("#myModal").length != 0){
			$("#myModal").on('hidden.bs.modal', function (e) {
				$("#myModal iframe").attr("src", "");
			});
		}
		function alz(num) {
			if (num < 10) {
				return "0" + num;
			} else {
				return "" + num;
			}
		}
		if($('.responsive-calendar').length != 0){
			$(".responsive-calendar").responsiveCalendar({
				onDayClick: function(events) {
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
						echo '"'.$k.'": {"number": '.count($v).',"badgeClass": "badge-primary", "url": ""}';
						echo ($ctrTemp == $nctr) ? "" : ","; 
					endforeach;
				?>
				}	
			});		
		}	
		    
	});
	
	<?php
	$jpage  = "";
	global $wp;
	$jpage = home_url( $wp->request );
	
	$jclient = strpos($jpage, 'client');
	$jgym = strpos($jpage, 'gym');
	$jtrain = strpos($jpage, 'train');
	
	$jbool = ($jclient || $jgym || $jtrain);
	
	if(triggerFirstLogin($uinfo) && $jbool):
	update_user_meta($uinfo->ID, 'prefix_first_login', '0');
	?>
		var jcontent = '<h3 style="text-align:center;margin-bottom:1em;">Welcome to your Dashboard!</h3>',
		curPage = window.location.href;
		jcontent += '<p>To edit profile click <a href="'+curPage+'?data=profile" class="red-btn">Profile</a></p>';
		<?php if ($jgym || $jtrain): ?>
			jcontent += '<p>To add program click <a href="'+curPage+'?data=add-workouts" class="red-btn">New program</a> in <strong>Programs</strong> page.</p>';			
			<?php if($jgym): ?>
				jcontent += '<p>To add Trainer click <a href="'+curPage+'?data=trainers&add=1" class="red-btn">Add Trainer</a> in <strong>Trainers</strong> page.</p>';			
			<?php endif; ?>
			jcontent += '<p>To add client click <a href="'+curPage+'?data=clients&add=1" class="red-btn">Add Client</a> in <strong>Clients</strong> page.</p>';	
		<?php endif; ?>		
		
		$('#workoutModal .modal-title').html('');
		$('#workoutModal .modal-body').html(jcontent);
		$('#workoutModal').modal();		
	<?php endif; ?>
	</script>	
  </body>
</html>