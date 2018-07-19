angular.module('smApp')
.controller('profileController', function(
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

});