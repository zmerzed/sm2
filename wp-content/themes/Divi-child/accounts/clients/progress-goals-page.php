<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
<?php
	$user = User::find(get_current_user_id());

	$currentUser = [
		'id' => $user->id,
		'photos' => $user->getPhotos(),
		'stats' => $user->getStats()
	];
	
	$umeta = get_user_meta($user->id);
	$accomtext = "";
	if(isset($umeta['sm_accomtext']))
		$accomtext = $umeta['sm_accomtext'][0];
	
	if( $_SERVER['REQUEST_METHOD'] == 'POST' )
	{
		$atext = "";
		if(isset($_POST['accomtext']))
			$atext = $_POST['accomtext'];
		
		if($atext != ""){
			update_user_meta($user->id, 'sm_accomtext', $atext);
			echo '<script>window.location.href="'.$_SERVER['REQUEST_URI'].'";</script>';		
		}

		if ($user && isset($_POST['statsFormData']))
		{
			$stats = htmlspecialchars_decode($_POST['statsFormData'], ENT_NOQUOTES);
			$stats = preg_replace('/\\\"/',"\"", $stats);
			$stats = stripslashes($stats);
			$stats = json_decode($stats, true);

			$result = $user->modifyStat($stats, $stats['start']['created_by']);

			/* wp_redirect( get_site_url() . '/client/?data=profile&by=progress-goals'. $_GET['edit']); */
			echo '<script>window.location.href="'.$_SERVER['REQUEST_URI'].'";</script>';
		}
	}
?>

<div ng-app="smApp" ng-controller="profileController">
	<div class="main-content matchHeight">
		<div class="container-title">
			<h3>Progress / Goals</h3>
		</div>
		<div class="current-status" style="max-width:80%;margin:0 auto;">
			<div class="row">
				<div class="col-lg-12 col-md-12">
					<div class="current-goal">
						<h3>Goal</h3>
						<form id="idStatsForm" action="/client/?data=profile&by=progress-goals" method="POST">
							<table style="width: 100%;">
								<tbody><tr>
									<th></th>
									<th>Start #s</th>
									<th>Goal #s</th>
								</tr>

								<tr>
									<td><label>Weight (lbs)</label></td>
									<td><input type="text" ng-model="stats.start.weight"></td>
									<td><input type="text" ng-model="stats.goal.weight"></td>
								</tr>
								<tr>
									<td><label>Body Fat (%)</label></td>
									<td><input type="text" ng-model="stats.start.body_fat"></td>
									<td><input type="text" ng-model="stats.goal.body_fat"></td>
								</tr>
								<tr>
									<td><label>Waist (cm)</label></td>
									<td><input type="text" ng-model="stats.start.waist"></td>
									<td><input type="text" ng-model="stats.goal.waist"></td>
								</tr>
								<tr>
									<td><label>chest (cm)</label></td>
									<td><input type="text" ng-model="stats.start.chest"></td>
									<td><input type="text" ng-model="stats.goal.chest"></td>
								</tr>
								<tr>
									<td><label>arms (cm)</label></td>
									<td><input type="text"ng-model="stats.start.arms"></td>
									<td><input type="text"ng-model="stats.goal.arms"></td>
								</tr>
								<tr>
									<td><label>forearms (cm)</label></td>
									<td><input type="text" ng-model="stats.start.forearms"></td>
									<td><input type="text" ng-model="stats.goal.forearms"></td>
								</tr>
								<tr>
									<td><label>shoulders (cm)</label></td>
									<td><input type="text" ng-model="stats.start.shoulders"></td>
									<td><input type="text" ng-model="stats.goal.shoulders"></td>
								</tr>
								<tr>
									<td><label>hips (cm)</label></td>
									<td><input type="text" ng-model="stats.start.hips"></td>
									<td><input type="text" ng-model="stats.goal.hips"></td>
								</tr>
								<tr>
									<td><label>thighs (cm)</label></td>
									<td><input type="text" ng-model="stats.start.thighs"></td>
									<td><input type="text" ng-model="stats.goal.thighs"></td>
								</tr>
								<tr>
									<td><label>calves (cm)</label></td>
									<td><input type="text" ng-model="stats.start.calves"></td>
									<td><input type="text" ng-model="stats.goal.calves"></td>
								</tr>
								<tr>
									<td><label>neck (cm)</label></td>
									<td><input type="text" ng-model="stats.start.neck"></td>
									<td><input type="text" ng-model="stats.goal.neck"></td>
								</tr>
								<tr>
									<td><label>height (cm)</label></td>
									<td><input type="text" ng-model="stats.start.height"></td>
									<td><input type="text" ng-model="stats.goal.height"></td>
								</tr>
								</tbody></table>
					</div>
					<div class="col-lg-12 col-md-12">
						<div style="text-align:center;padding:10px 0;">
							<input type="hidden" name="statsFormData" id="idStatsFormData"/>
							<button type="submit" class="red-btn">Update</button>
						</div>
					</div>
					</form>
					<div class="col-lg-12 col-md-12">
						<div class="progress-photos">
							<h3>progress photos</h3>

							<ul class="progress-slider-photos">
								<li ng-repeat="photo in currentUser.photos">
									<div class="snap-container"><img class="img-responsive" ng-src="/sm-files/{{ currentUser.id }}/{{ photo.file }}"></div>
									<span>{{ photo.uploaded_at }}</span>
								</li>
								<li>
									<div class="browser-upload-image" ng-click="takeNew()">
										<label class="btn btn-default btn-file">
											<img src="<?php echo get_stylesheet_directory_uri() .'/accounts/images/progress-btn-plus.png'; ?>">
										</label>
									</div>
									<span>Take New</span>
								</li>
							</ul>

							<div class="row" style="display:none">
								<input id="inputFileToLoad" type="file" onchange="encodeImageFileAsURL();" style="display:none"/>
								<div class="output">
									<img style="max-width:100%; height: 120px;">
								</div>
								<!-- <button class="btn btn-default" ng-click="upload()">UPLOAD</button> -->
							</div>
						</div>
						<form action="<?php echo $_SERVER['REQUEST_URI']; ?>" method="post">
							<div class="progress-notes">
								<p class="label">In details, explain what are your trying to accomplish</p>
								<textarea name="accomtext" class="progress-iframe" placeholder="EXAMPLE: FAT LOSS, SPORT PREPARATION, FLEXABILITY"><?php echo $accomtext; ?></textarea>
							</div>
							<div style="text-align:center;padding:10px 0;">
								<button type="submit" class="red-btn">Update</button>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div id="myModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
						</div>
						<div class="modal-body">
							<div class="container">
								<div class="app">
									<a href="#" id="start-camera" class="visible">Touch here to start the app.</a>
									<video id="camera-stream"></video>
									<img id="snap">

									<p id="error-message"></p>									
									<!-- Hidden canvas element. Used for taking snapshot of video. -->
									<canvas></canvas>
								</div>
								<div class="controls">										
									<a href="#" id="take-photo" title="Take Photo" class="btn btn-primary">Take Photo</a>
									<a href="#" id="delete-photo" title="Delete Photo" class="disabled btn btn-danger">Retake</a>
									<button class="btn btn-success" ng-click="upload()">Upload</button>
									<!-- <a href="#" id="download-photo" download="selfie.png" title="Save Photo" class="disabled"><i class="material-icons">file_download</i></a> -->
								</div>
								<!-- <button class="btn btn-default">CANCEL</button> -->
								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	// References to all the element we will need.
	var video = document.querySelector('#camera-stream'),
		image = document.querySelector('#snap'),
		start_camera = document.querySelector('#start-camera'),
		controls = document.querySelector('.controls'),
		take_photo_btn = document.querySelector('#take-photo'),
		delete_photo_btn = document.querySelector('#delete-photo'),
		download_photo_btn = document.querySelector('#download-photo'),
		error_message = document.querySelector('#error-message'),
		CAMERA_DATA_URL = '',
		USER_ID = '<?php echo get_current_user_id(); ?>',
		CURRENT_USER = JSON.parse('<?php echo json_encode($currentUser); ?>');
	// The getUserMedia interface is used for handling camera input.
	// Some browsers need a prefix so here we're covering all the options
	navigator.getMedia = ( navigator.getUserMedia ||
	navigator.webkitGetUserMedia ||
	navigator.mozGetUserMedia ||
	navigator.msGetUserMedia);


	if(!navigator.getMedia){
		displayErrorMessage("Your browser doesn't have support for the navigator.getUserMedia interface.");
	}

	// Mobile browsers cannot play video without user input,
	// so here we're using a button to start it manually.
	start_camera.addEventListener("click", function(e){

		e.preventDefault();

		// Start video playback manually.
		video.play();
		showVideo();

	});

	take_photo_btn.addEventListener("click", function(e){

		e.preventDefault();

		var snap = takeSnapshot();

		// Show image.
		image.setAttribute('src', snap);
		image.classList.add("visible");

		// Enable delete and save buttons
		delete_photo_btn.classList.remove("disabled");
		download_photo_btn.classList.remove("disabled");

		// Set the href attribute of the download button to the snap url.
		download_photo_btn.href = snap;

		// Pause video playback of stream.
		video.pause();

	});

	delete_photo_btn.addEventListener("click", function(e){

		e.preventDefault();

		// Hide image.
		image.setAttribute('src', "");
		image.classList.remove("visible");

		// Disable delete and save buttons
		delete_photo_btn.classList.add("disabled");
		download_photo_btn.classList.add("disabled");

		// Resume playback of stream.
		video.play();

	});

	function encodeImageFileAsURL(cb)
	{
		return function(){
			var file = this.files[0];
			var reader  = new FileReader();
			reader.onloadend = function () {
				cb(reader.result);
			}
			reader.readAsDataURL(file);
		}
	}

	function showVideo(){
		// Display the video stream and the controls.

		hideUI();
		video.classList.add("visible");
		controls.classList.add("visible");
	}

	function takeSnapshot(){
		// Here we're using a trick that involves a hidden canvas element.

		var hidden_canvas = document.querySelector('canvas'),
			context = hidden_canvas.getContext('2d');

		var width = video.videoWidth,
			height = video.videoHeight;

		if (width && height) {

			// Setup a canvas with the same dimensions as the video.
			hidden_canvas.width = width;
			hidden_canvas.height = height;

			// Make a copy of the current frame in the video on the canvas.
			context.drawImage(video, 0, 0, width, height);

			// Turn the canvas image into a dataURL that can be used as a src for our photo.

			CAMERA_DATA_URL = hidden_canvas.toDataURL('image/png');
			return hidden_canvas.toDataURL('image/png');
		}
	}

	function displayErrorMessage(error_msg, error){
		error = error || "";
		if(error){
			console.log(error);
		}

		error_message.innerText = error_msg;

		hideUI();
		error_message.classList.add("visible");
	}

	function hideUI(){
		// Helper function for clearing the app UI.

		controls.classList.remove("visible");
		start_camera.classList.remove("visible");
		video.classList.remove("visible");
		snap.classList.remove("visible");
		error_message.classList.remove("visible");
	}
	var localStream;

	setTimeout(function(){
		$('#myModal').on('hidden.bs.modal', function (e) {
			console.log('close camera...');
			video.pause();
			video.src = "";
			console.log(localStream)
			localStream.getTracks()[0].stop();
			CAMERA_DATA_URL = '';
			console.log("Vid off");
		});

		$('#myModal').on('show.bs.modal', function (e) {
			console.log('open camera...');
			// Request the camera.
			navigator.getMedia(
				{
					video: true
				},
				// Success Callback
				function(stream){

					// Create an object URL for the video stream and
					// set it as src of our HTLM video element.
					video.src = window.URL.createObjectURL(stream);
					localStream = stream;
					// Play the video element to start the stream.
					video.play();
					video.onplay = function() {
						showVideo();
					};

				},
				// Error Callback
				function(err){
					displayErrorMessage("There was an error with accessing the camera stream: " + err.name, err);
				}
			);
		});

	}, 500);

</script>
<script>var ROOTURL = '<?php echo get_site_url(); ?>';</script>
<script type="text/javascript" src="<?php echo get_stylesheet_directory_uri() .'/js/angular/app.js'; ?>"></script>
<script type="text/javascript" src="<?php echo get_stylesheet_directory_uri() .'/js/angular/profileController.js'; ?>"></script>