app.controller('notesController', function($scope, $http, $filter) {

    $scope.currentUser = CURRENT_USER;
    $scope.workoutTemplate = ROOT_URL + '/wp-content/themes/Divi-child/partials/notes.html';
    $scope.programs = [];
    init();

    function init ()
    {
        console.log('-------notes----------');
        console.log($scope.currentUser);

        if ($scope.currentUser.notes && $scope.currentUser.notes.length > 0) {
            $scope.programs = angular.copy($scope.currentUser.notes);
        }
    }


    $scope.filtered = {};

    $scope.perPage = 5;
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