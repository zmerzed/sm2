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
    function encodeImageFileAsURL(cb) {
        return function(){
            var file = this.files[0];
            var reader  = new FileReader();
            reader.onloadend = function () {
                cb(reader.result);
            };
            reader.readAsDataURL(file);
        }
    }

    function detectmob() {
        if( navigator.userAgent.match(/Android/i)
            || navigator.userAgent.match(/webOS/i)
            || navigator.userAgent.match(/iPhone/i)
            || navigator.userAgent.match(/iPad/i)
            || navigator.userAgent.match(/iPod/i)
            || navigator.userAgent.match(/BlackBerry/i)
            || navigator.userAgent.match(/Windows Phone/i)
        ){
            return true;
        }
        else {
            return false;
        }
    }

    $('#inputFileToLoad').change(encodeImageFileAsURL(function(base64Img){
        CAMERA_DATA_URL = base64Img;
        $('.output')
            .find('textarea')
            .val(base64Img)
            .end()
            .find('a')
            .attr('href', base64Img)
            .text(base64Img)
            .end()
            .find('img')
            .attr('src', base64Img);
    }));

    $scope.takeNew = function() {
        if (detectmob()) {
            $("#inputFileToLoad").click();
        } else {
            $('#myModal').modal('show');
        }
    };

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
    };

});