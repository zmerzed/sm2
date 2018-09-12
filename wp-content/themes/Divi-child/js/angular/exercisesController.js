app.controller('exercisesController', function($scope, $http, $filter) {

    $scope.currentUser = CURRENT_USER;
    $scope.exerciseTypes = EXERCISE_TYPES;
    $scope.workoutTemplate = ROOT_URL + '/wp-content/themes/Divi-child/partials/exercises.html';
	$scope.root_url = ROOT_URL;
	$scope.parts = [];
	$scope.query = {};

    init();

    function init ()
    {
        console.log('-------exercisesController----------');
        console.log($scope.exerciseTypes);
		for (x=0;x<$scope.exerciseTypes.length;x++)
		{
			if($scope.parts.indexOf($scope.exerciseTypes[x].part) < 0)
			{
				$scope.parts.push($scope.exerciseTypes[x].part);				
			}
		}

		setTimeout(function()
		{
			$("#idExerciseAdd").click(function() {

				var newExercise = {
					name: $('#idExerciseName').val(),
					part: $('#idExercisePart').val(),
                    var1: $('#idExerciseVar1').val(),
                    var2: $('#idExerciseVar2').val(),
                    imp: $('#idExerciseImp').val(),
					video_link: $('#idExerciseVidLink').val()
				};

				if (newExercise.part == 'new-part') {
					newExercise.part = $('#idExerciseNewPart').val();
				}

				console.log(newExercise);

				$http.post(ROOT_URL + '/wp-json/v1/add-exercise-option', newExercise).then(function(res) {

					if (res.data.newType) {
						$scope.exerciseTypes.unshift(res.data.newType);
                        $('#idExerciseName').val('');
						$('#idExercisePart').val('');
                        $('#idExerciseVar1').val('');
						$('#idExerciseVar2').val('');
						$('#idExerciseImp').val('');
                        $('#idExerciseVidLink').val('');
						$('#idModalCreateExercise').modal('hide');
					}
				});

			});
		}, 2000)
    }

    $scope.onSearch = function() {
        console.log($scope.query);
    };


	$scope.modalClick = function(){
		var vsrc = this.type.video;
		vsrc = getID(vsrc);		
		$('#idModalCreateExercise').modal('show');
		$('#idModalCreateExercise iframe').attr('src', 'https://www.youtube.com/embed/'+vsrc[0]+'?rel=0&autoplay=1').show();
		$('.add-exercise-form').hide();
	};
	
	$scope.getVideoID = function(v){						
		return getID(v);
	};
	
	function getID(v){
		var res = [];
		if(v != ""){
			if(v.indexOf('youtu.be') != -1)
				res.push(v.replace('https://youtu.be/',''));
			else
				res.push(v.split('v=')[1]);			
		}
		return res;
	}

    $scope.tasks = [];
    $scope.filtered = {};
    for(var i = 0; i < 100; i++){
        $scope.tasks[i] = { client_id: "" + (1 + (i % 3)), name : 'Task ' + i }
    }
    $scope.perPage = 10;
    $scope.maxSize = 10;
    $scope.setPage = function (pageNo) {
        $scope.currentPage = pageNo;
    };

    $scope.$watch('searchText', function (term) {
        var obj = term;
        $scope.filterList = $filter('filter')($scope.tasks, obj);
        $scope.currentPage = 1;
    });

});