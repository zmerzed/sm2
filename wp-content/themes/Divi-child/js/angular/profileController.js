angular.module('smApp')
.controller('profileController', function(
    $scope,
    $http,
    $filter
) {
    var apiUrl = ROOTURL + '/wp-json/v1/client/upload';
    $scope.currentUser = CURRENT_USER;

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

    $scope.takePicture = function()
    {

    };

    $scope.hasTaken = function()
    {
        if (CAMERA_DATA_URL.length > 0)
        {
            return false;
        }

        return true;
    };
});