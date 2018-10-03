app.controller('logsController', function($scope, $http, $filter) {

    $scope.currentUser = CURRENT_USER;
    $scope.workoutTemplate = ROOT_URL + '/wp-content/themes/Divi-child/partials/logs.html';

    init();

    function init ()
    {
        console.log('-------logsController----------');
        console.log($scope.currentUser);
    }


    $scope.filtered = {};

    $scope.perPage = 10;
    $scope.maxSize = 5;
    $scope.setPage = function (pageNo) {
        $scope.currentPage = pageNo;
    };

    $scope.$watch('searchText', function (term) {
        var obj = term;
        $scope.filterList = $filter('filter')($scope.tasks, obj);
        $scope.currentPage = 1;
    });

});