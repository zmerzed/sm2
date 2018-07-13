angular.module('smApp')
.controller('profileController', function(
    $scope,
    $http,
    $filter
) {
    var apiUrl = ROOTURL + '/wp-json/v1/client/upload';
   // var fileTypes = ['xls', 'pdf',  'doc'];
    $scope.currentUser = CURRENT_USER;

    console.log($scope.currentUser);

    function init()
    {
        // $scope.currentUser.files.forEach(function(file) {
        //
        // })
    }

    $scope.upload = function() {
        console.log($filter('dataURLtoBlob')(CAMERA_DATA_URL));
        console.log(USER_ID);
        var blob = $filter('dataURLtoBlob')(CAMERA_DATA_URL);
        var formData = new FormData();
        formData.append("myFile", blob, "thumb.jpg");
        formData.append("userId", USER_ID);
        $http.post(
            apiUrl, formData, {headers: {'Content-Type': undefined, 'Process-Data':false}}
        ).then(function() {
            location.reload();
        });
    };

    $scope.uploadFile = function()
    {
        var file = $scope.myFile;
        var fd = new FormData();
        fd.append('myFile', file);
        fd.append('userId', USER_ID);
        $http.post(
            apiUrl, fd, {headers: {'Content-Type': undefined, 'Process-Data':false}}
        ).then(function() {
            location.reload();
        });
    }
});