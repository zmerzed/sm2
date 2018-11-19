angular.module('smApp')
.controller('trainerStatsController', function(
    $scope,
    $http,
    $filter
) {

    $scope.currentUser = CURRENT_USER;
    $scope.client = CLIENT;
    $scope.stats = {
        'start': angular.copy(STAT),
        'goal': angular.copy(STAT),
        'result': angular.copy(STAT)
    };

    init();

    function init()
    {
        console.log('trainerStatsController');
        console.log(STAT);
        console.log($scope.currentUser);
        console.log($scope.client);

        if ($scope.client.stats)
        {
            $scope.stats = angular.copy($scope.client.stats);
        }
		
		$scope.currentDate = formatDate(new Date(CURRENT_DATE));
		/* $scope.updatedDate = formatDate(new Date($scope.stats.result.updated_at));
		
		if($scope.updatedDate == $scope.currentDate){
			$('.currentinput').each(function(){			
				$(this).closest('td').find('input:hidden').show();
				$(this).hide();
			});
		} */
    }

    $scope.update = function()
    {

    }

    $("#idStatsForm").submit(function (e) {

        console.log(JSON.stringify($scope.stats));
        $scope.stats.client_id = $scope.client.id;
        $('#idStatsFormData').val(JSON.stringify($scope.stats));
        return true;

    });
	
	function formatDate(date) {
	  var day = date.getDate();
	  var monthIndex = date.getMonth();
	  var year = date.getFullYear();

	  return (monthIndex+1) + '/' + day + '/' + year;
	}

});