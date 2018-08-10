angular.module('smApp')
    .controller('profileController', function(
        $scope,
        $http,
        $filter
    ) {
        var apiUrl = ROOTURL + '/wp-json/v1/client/upload';
        $scope.fileUrl = ROOTURL + '/sm-files/';
        $scope.currentUser = CURRENT_USER;
        $scope.loadingTemplate = ROOTURL + '/wp-content/themes/Divi-child/partials/loading.html';

        init();

        function init()
        {
            console.log('profile controller.js');
            console.log($scope.currentUser);
            $scope.stats = angular.copy($scope.currentUser.stats);
        }

        function encodeImageFileAsURL(cb)
        {
            return function(){
                var file = this.files[0];
                var reader  = new FileReader();
                reader.onloadend = function () {
                    cb(reader.result);
                };
                reader.readAsDataURL(file);
            }
        }

        function detectmob()
        {
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
            fd.append('health-doc', true);
            $http.post(
                apiUrl, fd, {headers: {'Content-Type': undefined, 'Process-Data':false}}
            ).then(function() {
                location.reload();
            });
        };
        
        /* trigger the input file for selecting an image */
        $('#idGymLandscape').change(encodeImageFileAsURL(function(base64Img){

            var blob = $filter('dataURLtoBlob')(base64Img);
            var fd = new FormData();
            fd.append("myFile", blob, "thumb.jpg");
            fd.append('userId', $scope.currentUser.id);
            fd.append('gym_profile_landscape', true);
            $scope.promise = $http.post(
                apiUrl, fd, {headers: {'Content-Type': undefined, 'Process-Data':false}}
            ).then(function(res) {
                console.log(res);
                if (res.data.data.errors.length <= 0) {
                    $scope.currentUser.gymPhotos = res.data.data.gymPhotos;
                    $('#idGymPhotoLandscapeResult').attr('src', base64Img);
                }
            });
        }));

        $('#idGymPortrait').change(encodeImageFileAsURL(function(base64Img){

            var blob = $filter('dataURLtoBlob')(base64Img);
            var fd = new FormData();
            fd.append("myFile", blob, "thumb.jpg");
            fd.append('userId', $scope.currentUser.id);
            fd.append('gym_profile_portrait', true);
            $scope.promise = $http.post(
                apiUrl, fd, {headers: {'Content-Type': undefined, 'Process-Data':false}}
            ).then(function(res) {
                console.log(res);
                if (res.data.data.errors.length <= 0) {
                    $scope.currentUser.gymPhotos = res.data.data.gymPhotos;
                    $('#idGymPhotoPortraitResult').attr('src', base64Img);
                }
            });
        }));

        $('#idTrainerProfile').change(encodeImageFileAsURL(function(base64Img){
            console.log('xxxxxx')
            var blob = $filter('dataURLtoBlob')(base64Img);
            $('#idTrainerProfilePhotoResult').attr('src', base64Img);

        }));

        $scope.gymRemoveLogo = function()
        {


        };

        $scope.gymUploadLogo = function(type)
        {
            if (type == 'landscape') {
                console.log('landscape');
                $("#idGymLandscape").click();
            } else {
                console.log('portrait');
                $("#idGymPortrait").click();
            }
        };

        $scope.trainerUploadPhoto = function() {

            var fd = new FormData();
            fd.append('myFile', $('#idTrainerProfile')[0].files[0]);
            fd.append('userId', $scope.currentUser.id);
            fd.append('trainer-profile', true);
            $scope.promise = $http.post(
                apiUrl, fd, {headers: {'Content-Type': undefined, 'Process-Data':false}}
            ).then(function(res) {
                
            });
        };

        $("#idStatsForm").submit(function (e) {

            console.log(JSON.stringify($scope.stats));

            $scope.stats.client_id = $scope.currentUser.id;
            delete $scope.stats.result;
            $('#idStatsFormData').val(JSON.stringify($scope.stats));
            return true;

        });
    });