app.controller('exercisesController', function($scope, $http, $filter) {

    $scope.currentUser = CURRENT_USER;
    $scope.exerciseTypes = EXERCISE_TYPES;
    $scope.workoutTemplate = ROOT_URL + '/wp-content/themes/Divi-child/partials/exercises.html';
	$scope.root_url = ROOT_URL;
	
    init();

    function init ()
    {
        console.log('-------exercisesController----------');
        console.log($scope.exerciseTypes);		
    }
	
	$scope.modalClick = function(){
		var vsrc = this.type.video;
		if(vsrc != ""){
			if(vsrc.indexOf('youtu.be') != -1){
				vsrc = vsrc.replace('https://youtu.be/','');
			}else{
				vsrc = vsrc.split('v=')[1];
			}
		}
		$('#myModal').modal('show');
		$('#myModal iframe').attr('src', 'https://www.youtube.com/embed/'+vsrc+'?rel=0&autoplay=1');
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