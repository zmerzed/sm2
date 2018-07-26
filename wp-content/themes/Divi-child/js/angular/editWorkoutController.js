app.controller('editWorkoutController', function($scope, $http) {

    $scope.currentUser = CURRENT_USER;
    $scope.clients = CLIENTS;
    $scope.clientsBackup = angular.copy(CLIENTS);
    $scope.workout = WORKOUT;
    $scope.workoutMaxSet = 0;
    $scope.exerciseOptions = EXERCISE_OPTIONS;
    $scope.exerciseSQoptions = EXERCISE_SQ_OPTIONS;
    $scope.clientExerciseSets = [];
    $scope.workoutTemplate = ROOT_URL + '/wp-content/themes/Divi-child/partials/edit_workout.html';

    var urlApiClient = ROOT_URL + '/wp-json/v1';
    var formUrl = ROOT_URL + '/gym/?data=edit-workout&workout=' + WORKOUT.workout_ID;
    init();

    function init()
    {
        console.log('______________CURRENT USER_____________');
        console.log($scope.currentUser);
        for(var i in $scope.workout.days)
        {
            var day = $scope.workout.days[i];

            for(var x in day.exercises)
            {
                var exercise = day.exercises[x];
                exercise.exerciseOptions = angular.copy($scope.exerciseOptions);
                exercise.exerciseSQoptions = angular.copy($scope.exerciseSQoptions);

                for(var y in exercise.exerciseOptions)
                {
                    var part = exercise.exerciseOptions[y];

                    if (part.part == exercise.exer_body_part)
                    {
                        exercise.selectedPart = part;

                        for(var t in part.options)
                        {
                            var option = part.options[t];

                            if (option['type'] == exercise.exer_type)
                            {
                                exercise.selectedPart.selectedType = option;

                                for (var o in option['exercise_1'])
                                {
                                    var ex1 = option['exercise_1'][o];

                                    if(exercise.exer_exercise_1 == ex1)
                                    {
                                        exercise.selectedPart.selectedType.selectedExercise1 = ex1;
                                        break;
                                    }
                                }

                                for (var o in option['exercise_2'])
                                {
                                    var ex2 = option['exercise_2'][o];

                                    if(exercise.exer_exercise_2 == ex2)
                                    {
                                        exercise.selectedPart.selectedType.selectedExercise2 = ex2;
                                        break;
                                    }
                                }

                                for (var o in option['implementation_options'])
                                {
                                    var imp1 = option['implementation_options'][o];

                                    if(exercise.exer_impl1 == imp1)
                                    {
                                        exercise.selectedPart.selectedType.selectedImplementation1 = imp1;
                                        break;
                                    }
                                }

                                break;
                            }
                        }
                        break;
                    }
                }

                for(var z in exercise.exerciseSQoptions)
                {
                    var sq = exercise.exerciseSQoptions[z];

                    if(exercise.exer_sq == sq.name)
                    {
                        exercise.selectedSQ = sq;

                        for(var o in sq.options.set_options)
                        {
                            var set = sq.options.set_options[o];

                            if(exercise.exer_sets == set)
                            {
                                exercise.selectedSQ.selectedSet = set;
                                break;
                            }
                        }

                        for(var o in sq.options.rep_options)
                        {
                            var rep = sq.options.rep_options[o];

                            if(exercise.exer_rep == rep)
                            {
                                exercise.selectedSQ.selectedRep = rep;
                                break;
                            }
                        }

                        for(var o in sq.options.tempo)
                        {
                            var tempo = sq.options.tempo[o];

                            if(exercise.exer_tempo == tempo)
                            {
                                exercise.selectedSQ.selectedTempo = tempo;
                                break;
                            }
                        }

                        for(var o in sq.options.rest)
                        {
                            var rest = sq.options.rest[o];

                            if(exercise.exer_rest == rest)
                            {
                                exercise.selectedSQ.selectedRest = rest;
                                break;
                            }
                        }

                        break;
                    }
                }


            }
        }

        console.log($scope.workout);

        if ($scope.workout.days.length > 0)
        {
            optimizeDays();
            selectDay($scope.workout.days[0]);

            /* get the largest set in a selected day */
            findTheLargestSet();
        }

    }

    $scope.newWorkOutDay = function ()
    {

        $http.get(urlApiClient + '/hash').then(function(res)
        {

            var newEx = generateNewExercise(res.data.hash);

            $scope.workout.days.push({exercises:[newEx], clients:[]});

            optimizeDays();
            var countDays = $scope.workout.days.length;

            $scope.selectedClient = "Add Client";
            $scope.clients = angular.copy($scope.clientsBackup);

            selectDay($scope.workout.days[countDays - 1])
        });
    };

    $scope.onChangeDayName = function()
    {
        $scope.onLeaveDay();
    };

    $scope.onSelectDay = function(day)
    {
        optimizeSelectedDay();
        selectDay(day);
    };

    $scope.onLeaveDay = function()
    {
        for (var i in $scope.workout.days)
        {
            var day = $scope.workout.days[i];

            if (day.wday_order == $scope.workout.selectedDay.wday_order)
            {
                $scope.workout.days[i] = angular.copy($scope.workout.selectedDay);

                for (var x in $scope.workout.days[i].clients)
                {
                    var client = $scope.workout.days[i].clients[x];

                    if ($scope.workout.selectedDay.selectedClient && client.ID == $scope.workout.selectedDay.selectedClient.id)
                    {
                        $scope.workout.days[i].clients[x] = $scope.workout.selectedDay.selectedClient;
                        break;
                    }
                }

                break;
            }
        }
    };

    $scope.isActive = function(day)
    {
        if ($scope.workout.selectedDay.wday_order == day.wday_order) {
            return true;
        }

        return false;
    };

    $scope.isClientActive = function(client)
    {

        if ($scope.workout.selectedDay.selectedClient && $scope.workout.selectedDay.selectedClient.ID == client.ID) {
            return true;
        }

        return false;
    };

    $scope.newExercise = function()
    {

        $http.get(urlApiClient + '/hash').then(function(res) {

            var newEx = generateNewExercise(res.data.hash);

            $scope.workout.selectedDay.exercises.push(newEx);
            optimizeSelectedDay();
            optimizeDays();
        });

    };

    $scope.selectClient = function(client)
    {
        $scope.workout.selectedDay.selectedClient = client;
        console.log($scope.workout.selectedDay.selectedClient);
        optimizeClientExercises();
    };

    $scope.$watch('selectedClient', function(val)
    {
        var found = false;
        for(var i in $scope.clients)
        {
            var client = $scope.clients[i];

            if(client.ID == val)
            {
                for(var x in $scope.workout.selectedDay.clients)
                {
                    var xClient = $scope.workout.selectedDay.clients[x];

                    if(xClient.ID == val)
                    {
                        found = true;
                    }
                }

                if(!found) {
                    $scope.workout.selectedDay.clients.push(client);
                    $scope.selectClient(client);
                }

                break;
            }
        }


        /* console.log('===========xxxxxxxxxxBEFORExxxxxxxxxxx=========');
         console.log($scope.workout.selectedDay.clients);
         console.log($scope.clients);
         console.log('===========xxxxxxxxxxBEFORExxxxxxxxxxx========='); */

        // match $scope.workout.selectedDay.clients to $scope.clients;
        optimizeSelectedClients();
        optimizeClientExercises();
    });

    $scope.$watch(function() {
        console.log('/* get the largest set in a selected day */');
        return $scope.workout.selectedDay.exercises;
    }, function(newValue, oldValue){

        if (!angular.equals(oldValue, newValue)) {
            console.log('--------------------------');
            optimizeClientExercises();
            findTheLargestSet();
        }
    },true);

    $scope.removeDay = function(day)
    {
        day.isDelete = true;

        console.log('uuuuuuuuuuuuuuuuu');
        console.log($scope.workout.days);

        delete day.selectedClient;
        delete day.exercises;
        delete day.clients;

        optimizeDays();
        $scope.onLeaveDay();

        if($scope.$root.$$phase != '$apply' &&
            $scope.$root.$$phase != '$digest'
        ) {
            $scope.$apply();
        }

        setTimeout(function() {

            console.log('xxxxxxxxxxxxxxxxxxxxxxxx');

            for (var i=$scope.workout.days.length - 1; i>=0; --i)
            {
                var day = $scope.workout.days[i];

                if (!day.isDelete) {
                    selectDay(day);
                    break;
                }
            }

        }, 200)
    };

    $scope.removeExercise = function(exercise)
    {
        exercise.isDelete = true;
        optimizeSelectedDay();
        optimizeClientExercises();
        findTheLargestSet();
    };

    $scope.onCopy = function()
    {
        var newCopy = angular.copy($scope.workout.selectedDay);

        delete newCopy.wday_ID;

        $http.get(urlApiClient + '/hash').then(function(res)
        {
            console.log(newCopy);
            newCopy.exercises.forEach(function(ex) {
                ex.hash = res.data.hash;
            });

            newCopy.wday_name = '';
            $scope.workout.days.push(newCopy);
            var countDays = $scope.workout.days.length;
            optimizeDays();
            selectDay($scope.workout.days[countDays - 1])

        });

    };

    $scope.onCopyExercise = function(exercise)
    {
        console.log(exercise);
        var newExercise = angular.copy(exercise);

        delete newExercise.exer_ID;
        $http.get(urlApiClient + '/hash').then(function(res)
        {
            newExercise.hash = res.data.hash;
            $scope.workout.selectedDay.exercises.push(newExercise);
            optimizeClientExercises();
        });

    };

    $scope.submitForm = function()
    {
        $('#idForm').attr('action', formUrl);

        delete $scope.workout.selectedDay;

        for(var i in $scope.workout.days)
        {
            var day = $scope.workout.days[i];

            delete day.selectedClient;
            for(var e in day.exercises)
            {
                var ex = day.exercises[e];
                delete ex.exerciseOptions;
                delete ex.exerciseSQoptions;
            }

            for (var x in day.clients)
            {
                var client  = day.clients[x];

                for (var m in client.exercises)
                {
                    var clientExercise = client.exercises[m];
                    delete clientExercise.exerciseOptions;
                    delete clientExercise.exerciseSQoptions;
                    delete clientExercise.selectedPart;
                    delete clientExercise.selectedSQ;
                }
            }
        }

        console.log($scope.workout);

        $('#idWorkoutForm').val(JSON.stringify($scope.workout));

        return true;
    };

    function optimizeSelectedClients()
    {
        $scope.clients = angular.copy($scope.clientsBackup);
        var listToDelete = [];

        for (var i = 0; i < $scope.workout.selectedDay.clients.length; i++) {
            listToDelete.push($scope.workout.selectedDay.clients[i].ID);
        }

        var lengthToDelete = listToDelete.length;

        for(var i = 0; i < $scope.clients.length; i++) {
            var obj = $scope.clients[i];

            if(listToDelete.indexOf(obj.ID) !== -1) {
                $scope.clients.splice(i, lengthToDelete);
            }
        }


        /* console.log('===========xxxxxxxxxxAFTERxxxxxxxxxxx=========');
         console.log($scope.workout.selectedDay.clients);
         console.log($scope.clients);
         console.log('===========xxxxxxxxxxAFTERxxxxxxxxxxx========='); */

    }

    function findTheLargestSet()
    {
        /* get the max set */
        $scope.workoutMaxSet = 0;

        for (var i in $scope.workout.selectedDay.exercises)
        {
            var exercise = angular.copy($scope.workout.selectedDay.exercises[i]);
            var noSet = 0;
            $scope.clientExerciseSets[i] = 0;

            if (exercise.exer_sets) {
                noSet = parseInt(angular.copy(exercise.exer_sets));
                $scope.clientExerciseSets[i] = parseInt(angular.copy(exercise.exer_sets));
            }

            if (exercise.selectedSQ && exercise.selectedSQ.selectedSet) {
                noSet = exercise.selectedSQ.selectedSet;
                $scope.clientExerciseSets[i] = exercise.selectedSQ.selectedSet;
            }

            if (typeof $scope.workoutMaxSet == 'undefined') {
                $scope.workoutMaxSet = 0;

                if(noSet >= $scope.workoutMaxSet) {
                    $scope.workoutMaxSet = noSet;
                }

            } else if(noSet >= $scope.workoutMaxSet) {
                $scope.workoutMaxSet = noSet;
            }
        }
    }

    function generateNewExercise(hash)
    {
        return {hash:hash, exerciseOptions: angular.copy($scope.exerciseOptions), exerciseSQoptions: angular.copy($scope.exerciseSQoptions)};
    }

    function selectDay(day)
    {
        $scope.workout.selectedDay = angular.copy(day);

        if ($scope.workout.selectedDay.clients)
        {
            $scope.workout.selectedDay.selectedClient = $scope.workout.selectedDay.clients[0];

            optimizeSelectedClients();
            optimizeClientExercises();
            optimizeSelectedDay();

        }
        findTheLargestSet();
    }

    function optimizeSelectedDay()
    {
        var count = 1;

        for(var i in $scope.workout.selectedDay.exercises)
        {
            var exercise = $scope.workout.selectedDay.exercises[i];

            if(exercise.isDelete) {
                continue;
            }

            $scope.workout.selectedDay.exercises[i]['seq'] = count;
            count++;
        }
    }

    function optimizeClientExercises()
    {

        for (var i in $scope.workout.selectedDay.clients)
        {
            var client = $scope.workout.selectedDay.clients[i];
            var mExercises = [];

            for (var x in $scope.workout.selectedDay.exercises)
            {
                var isExFound = false;
                var ex = $scope.workout.selectedDay.exercises[x];

                if (ex.isDelete) {
                    continue;
                }

                for (var z in client.exercises)
                {
                    var cEx = client.exercises[z];

                    if (ex.hash == cEx.hash)
                    {

                        var nEx = angular.copy(ex);
                        isExFound = true;

                        if (ex.selectedPart)
                        {
                            nEx.exer_body_part = ex.selectedPart.part;

                            if (ex.selectedPart.selectedType)
                            {
                                nEx.exer_type = ex.selectedPart.selectedType.type;
                            }
                        }

                        nEx.assignment_sets = angular.copy(cEx.assignment_sets);
                        mExercises.push(nEx);
                        break;
                    }
                }

                if (!isExFound)
                {
                    mExercises.push(ex);
                }
            }

            client.exercises = mExercises;
        }

        findTheLargestSet();

        if($scope.$root.$$phase != '$apply' &&
            $scope.$root.$$phase != '$digest'
        ) {
            $scope.$apply();
        }

    }

    function optimizeDays()
    {

        var count = 1;

        for(var i in $scope.workout.days)
        {
//				var day = $scope.workout.days[i];
//
//				if (!day.isDelete)
//				{
//
//				}
            $scope.workout.days[i].wday_order = count;
            count++;
        }
    }
});