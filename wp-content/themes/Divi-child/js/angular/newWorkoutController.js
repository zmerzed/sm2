angular.module('smApp')

.controller('NewWorkoutController', function($scope, $http, global, $localStorage) {

    $scope.clients = CLIENTS;
    $scope.clientsBackUp = angular.copy(CLIENTS);
    $scope.exerciseOptions = EXERCISE_OPTIONS;
    $scope.exerciseSQoptions = EXERCISE_SQ_OPTIONS;
    $scope.clientExerciseSets = [];
    $scope.currentUser = CURRENT_USER;
    $scope.workoutMaxSet = 0;
    $scope.reader = {selectedClient:false};
    $scope.workoutTemplate = ROOT_URL + '/wp-content/themes/Divi-child/partials/new_workout.html';
    $scope.workoutSortExerTemplate = ROOT_URL + '/wp-content/themes/Divi-child/partials/modal.sorting_exercise.html';
    $localStorage.nCircuits = [];

    var urlApiClient = ROOT_URL + '/wp-json/v1';
     
    init();

    function init() {

        console.log('-----------INIT NewWorkoutController--------------');
        console.log($scope.exerciseSQoptions);
        console.log($scope.exerciseOptions);

        /* add others for exercise options tempo */
        $scope.timeData = global.time;
        $http.get(urlApiClient + '/hash').then(function(res)
        {
            $scope.workout = {
                days: [{name:'', seq:1, exercises:[generateNewExercise(res.data.hash)], clients:[], hash: Date.now() + ''}]
            };

            selectDay($scope.workout.days[0]);
        });

        console.log('-----------END INIT--------------');
    }

    $scope.newWorkOutDay = function () {

        $http.get(urlApiClient + '/hash').then(function(res) {

            var count = $scope.workout.days.length + 1;
            $scope.workout.days.push({seq:count, exercises:[generateNewExercise(res.data.hash)] , clients:[], hash: Date.now() + ''});

            var countDays = $scope.workout.days.length;
            $scope.workout.selectedDay = $scope.workout.days[countDays - 1];
            $scope.workout.selectedDay.hash = res.data.hash;
            $scope.selectedClient = "Add Client";
            selectDay($scope.workout.days[countDays - 1])
        });

    };

    $scope.onNamingExercise = function(exercise) {

        $('#idSortExerciseModal').modal('show');
        $scope.selectedExercise = exercise;
    };

    $scope.updateExerciseGroupBy = function() {

        console.log($scope.selectedExercise);
        $scope.selectedExercise.group_by = $scope.selectedExercise.group_by_letter + $scope.selectedExercise.group_by_number;
    };

    $scope.newExercise = function() {

        $http.get(urlApiClient + '/hash').then(function(res)
        {
            $scope.workout.selectedDay.exercises.push(generateNewExercise(res.data.hash));
            optimizeClientExercises();
            optimizeCircuits();
        });
    };

    $scope.onSelectDay = function(day) {
        selectDay(day);

        var noSet  = 0;
        $scope.workoutMaxSet = 0;

        for (var i in $scope.workout.selectedDay.circuits) {

            var circuit = $scope.workout.selectedDay.circuits[i];

            if (circuit.sets) {
                noSet = parseInt(circuit.sets);
            }

            if (noSet >= $scope.workoutMaxSet) {
                $scope.workoutMaxSet = noSet;
            }
        }
    };

    $scope.onChangeClientTime = function() {
        console.log('llf');
        if($scope.$root.$$phase != '$apply' &&
            $scope.$root.$$phase != '$digest'
        ) {
            $scope.$apply();
        }
    };

    $scope.onCopy = function() {

        $scope.onLeaveDay();

        setTimeout(function()
        {
            $scope.$apply(function() {

                var newCopy = angular.copy($scope.workout.selectedDay);

                console.log('copying workout day');
                console.log($scope.workout.selectedDay);

                var nOfExs = newCopy.exercises.length;
                $http.get(urlApiClient + '/hash?sets=' + nOfExs).then(function(res)
                {

                    var setOfHashes = res.data.set_of_hash;

                    newCopy.hash = setOfHashes[0];

                    newCopy.exercises.forEach(function(ex, i){
                        ex.hash = setOfHashes[i];
                    });

                    newCopy.clients.forEach(function(client)
                    {
                        client.exercises.forEach(function(exercise, i)
                        {
                            exercise.hash = setOfHashes[i];
                            exercise.assignment_sets.forEach(function(set)
                            {
                                set.weight = angular.copy("");
                            });
                            console.log(exercise);
                        });
                    });

                    console.log('after copying workout day');
                    console.log(newCopy);

                    newCopy.name = '';
                    $scope.workout.days.push(newCopy);

                    var countDays = $scope.workout.days.length;
                    optimizeDays();
                    selectDay($scope.workout.days[countDays - 1])

                });
            });
        }, 500)

    };

    $scope.onDelete = function(day) {

        if ($scope.workout.days.length > 1)
        {
            var idx = $scope.workout.days.indexOf(day);
            $scope.workout.days.splice(idx, 1);
            var countDays = $scope.workout.days.length;
            optimizeDays();
            selectDay($scope.workout.days[countDays - 1])
        }
    };

    $scope.onLeaveDay = function() {

        for (var i in $scope.workout.days)
        {
            var day = $scope.workout.days[i];

            if (day.seq == $scope.workout.selectedDay.seq)
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

    $scope.onCopyExercise = function(exercise) {

        var newExercise = angular.copy(exercise);

        $http.get(urlApiClient + '/hash').then(function(res)
        {
            newExercise.hash = res.data.hash;
            $scope.workout.selectedDay.exercises.push(newExercise);
            optimizeClientExercises();
        });

    };

    $scope.onRemoveExercise = function(exercise) {

        if ($scope.workout.selectedDay.exercises.length > 1)
        {
            var idx = $scope.workout.selectedDay.exercises.indexOf(exercise);
            $scope.workout.selectedDay.exercises.splice(idx,1);
        }
    };

    $scope.onRemoveSelectedClient = function(client) {

       var idx = $scope.workout.selectedDay.clients.indexOf(client);

       $scope.clients.push(angular.copy(client));
       $scope.workout.selectedDay.clients.splice(idx, 1);

        /* select the first client */
        if ($scope.workout.selectedDay.clients.length > 0) {
            $scope.selectClient($scope.workout.selectedDay.clients[0]);
        }

        optimizeClientExercises();
        optimizeSelectedClients();
    };

    $scope.selectClient = function(client) {

        $scope.workout.selectedDay.selectedClient = client;
    };

    $scope.isActive = function(day) {

        if ($scope.workout.selectedDay.seq == day.seq) {
            return true;
        }

        return false;
    };

    $scope.isClientActive = function(client) {

        if ($scope.workout.selectedDay.selectedClient && $scope.workout.selectedDay.selectedClient.ID == client.ID) {
            return true;
        }

        return false;
    };

    $scope.onChangeDayName = function() {

        $scope.onLeaveDay();
    };

    $scope.sendForm = function() {

        if ($scope.currentUser.isGym) {

            var formUrl = '/gym/?data=workouts';
        } else {

            var formUrl = '/trainer/?data=workouts';
        }

        $('#idForm').attr('action', formUrl);
        
        var toSend = angular.copy($scope.workout);

        delete toSend.selectedDay;

        for(var i in toSend.days)
        {
            var day = toSend.days[i];

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

                if (client.time_availability_temp) {

                    var mHour = nFormat(client.time_availability_temp.getHours());
                    var mMin = nFormat(client.time_availability_temp.getMinutes());
                    var mSec = nFormat(client.time_availability_temp.getSeconds());

                    client.time_availability = mHour + ":" + mMin + ":" + mSec;
                }

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

        toSend.user_id = CURRENT_USER_ID;
        console.log(toSend);
        $('#idWorkoutForm').val(JSON.stringify(toSend));

        return true;
    };

    $scope.$watch('reader.selectedClient', function(val)
    {
        console.log('selectedClient');
        console.log(val);

        if (val)
        {
            var found = false;
            for (var i in $scope.clients)
            {
                var client = $scope.clients[i];

                if (client.ID == val)
                {

                    for (var x in $scope.workout.selectedDay.clients)
                    {
                        var xClient = $scope.workout.selectedDay.clients[x];

                        if(xClient.ID == val)
                        {
                            found = true;
                        }
                    }

                    if (!found) {
                        $scope.workout.selectedDay.clients.push(client);
                        $scope.selectClient(client);
                    }

                    break;
                }
            }
            optimizeClientExercises();
            optimizeSelectedClients();
        }

    }, true);

    $scope.$watch('workout.selectedDay.exercises', function(val)
    {
        console.log('/* get the largest set in a selected day */');
        console.log(val);

        if (val) {
            findTheLargestSet();
            optimizeClientExercises();
            global.sortByKey($scope.workout.selectedDay.exercises, 'group_by');

            $scope.workout.selectedDay.exercises = global.customSort($scope.workout.selectedDay.exercises);
            /* check the exercises as the last to take the rest */
        }

    }, true);

    function nFormat(n){
        return n > 9 ? "" + n: "0" + n;
    }

    function optimizeSelectedClients()
    {
        $scope.clients = angular.copy($scope.clientsBackUp);
        for (var i = 0; i < $scope.workout.selectedDay.clients.length; i++) {
			$scope.clients.forEach((v,index)=>{			
				if(v.ID == $scope.workout.selectedDay.clients[i].ID)
					$scope.clients.splice(index, 1);
			});
        }
    }

    function generateNewExercise(hash)
    {
        return {
            hash:hash,
            exerciseOptions: angular.copy($scope.exerciseOptions),
            exerciseSQoptions: angular.copy($scope.exerciseSQoptions),
            group_by : '',
            group_by_letter: '',
            group_by_number: ''
            //assignment_sets: nAssignments
        };
    }

    function selectDay(day)
    {
        $scope.workout.selectedDay = angular.copy(day);
        optimizeSelectedClients();

    }

    function optimizeDays()
    {
        var count = 1;

        for(var i in $scope.workout.days)
        {
            var day = $scope.workout.days[i];

            $scope.workout.days[i].seq = count;
            count++;
        }
    }

    function optimizeClientExercises()
    {

        for (var i in $scope.workout.selectedDay.exercises)
        {
            var exercise = $scope.workout.selectedDay.exercises[i];
            var nAssignments = [];

            if (exercise.selectedSQ && exercise.selectedSQ.selectedRep)
            {

                for (var i=0; i<$scope.workoutMaxSet; i++) {
                    nAssignments.push({reps:exercise.selectedSQ.selectedRep, weight:''});
                }
            }

            exercise.assignment_sets = nAssignments;
        }

        for (var i in $scope.workout.selectedDay.clients)
        {
            var client = $scope.workout.selectedDay.clients[i];
            var mNewExercises = [];
            for (var m in $scope.workout.selectedDay.exercises)
            {
                var exercise = angular.copy($scope.workout.selectedDay.exercises[m]);

                for (var z in client.exercises) {

                    var zExer = client.exercises[z];

                    if (zExer.hash == exercise.hash)
                    {
                        exercise.assignment_sets = angular.copy(zExer.assignment_sets);

                    }
                }
                mNewExercises.push(exercise);
            }

            client.exercises = angular.copy(mNewExercises);
        }

        if($scope.$root.$$phase != '$apply' &&
            $scope.$root.$$phase != '$digest'
        ) {
            $scope.$apply();
        }
    }

    function findTheLargestSet()
    {
        /* get the max set */

        for (var i in $scope.workout.selectedDay.exercises)
        {
            var mExercise = $scope.workout.selectedDay.exercises[i];

            /* check for selected part and implementation */

            if (mExercise.selectedPart && mExercise.selectedPart.selectedType) 
            {
                console.log('check for selected part and implementation');
                if (mExercise.selectedPart.selectedType.selectedImplementation1 == 'custom') 
                {
                    mImpCustom = prompt("Please add a custom implementation");

                    while (mImpCustom == 'custom') {
                        mImpCustom = prompt("Please add a custom implementation");
                    }

                    var mImp1s = [];

                    for (var mI in mExercise.selectedPart.selectedType.implementation_options)
                    {
                        var imp = mExercise.selectedPart.selectedType.implementation_options[mI];

                        if (imp == 'custom') {
                            imp = angular.copy(mImpCustom);
                        }

                        if (imp) {
                            mImp1s.push(imp);
                        }
                    }

                    mImp1s.push('custom');
                    mExercise.selectedPart.selectedType.implementation_options = mImp1s;
                    mExercise.selectedPart.selectedType.selectedImplementation1 = mImpCustom;
                }      
            }


            /* check if others is selected for Tempo */
            if (mExercise.selectedSQ && mExercise.selectedSQ.selectedRep == 'custom') 
            {
                var mRep = prompt("Please add a custom reps");

                while (mRep == 'custom') {
                    mRep = prompt("Please add a custom reps");
                }

                var mReps = [];

                for (var mI in mExercise.selectedSQ.options.rep_options)
                {
                    var rep = mExercise.selectedSQ.options.rep_options[mI];

                    if (rep == 'custom') {
                        rep = angular.copy(mRep);
                    }

                    mReps.push(rep);
                }

                mReps.push('custom');
                mExercise.selectedSQ.options.rep_options = mReps;
                mExercise.selectedSQ.selectedRep = mRep;
            }

            /* check if others is selected for Tempo */
            if (mExercise.selectedSQ && mExercise.selectedSQ.selectedTempo == 'custom')
            {
                var mOtherName = prompt("Tempo");

                while (mOtherName == 'custom') {
                    mOtherName = prompt("Tempo");
                }

                var mTempos = [];

                for (var mI in mExercise.selectedSQ.options.tempo)
                {
                    var tempo = mExercise.selectedSQ.options.tempo[mI];

                    if (tempo == 'custom') {
                        tempo = angular.copy(mOtherName);
                    }

                    mTempos.push(tempo);
                }

                mExercise.selectedSQ.options.tempo = mTempos;
                mExercise.selectedSQ.selectedTempo = mOtherName;
            }

            /* check if others is selected for Rest */
            if (mExercise.selectedSQ && mExercise.selectedSQ.selectedRest == 'custom')
            {
                var mOtherName = prompt("Rest");

                while (mOtherName == 'custom') {
                    mOtherName = prompt("Rest");
                }

                var mRests = [];

                for (var mI in mExercise.selectedSQ.options.rest)
                {
                    var rest = mExercise.selectedSQ.options.rest[mI];

                    if (rest == 'custom') {
                        rest = angular.copy(mOtherName);
                    }

                    mRests.push(rest);
                }

                mExercise.selectedSQ.options.rest = mRests;
                mExercise.selectedSQ.selectedRest = mOtherName;
            }

            var exercise = angular.copy($scope.workout.selectedDay.exercises[i]);
            var noSet = 0;
            $scope.clientExerciseSets[i] = 0;

            if (exercise.exer_sets) 
            {
                noSet = parseInt(angular.copy(exercise.exer_sets));
                $scope.clientExerciseSets[i] = parseInt(angular.copy(exercise.exer_sets));
            }

            if (exercise.selectedSQ && exercise.selectedSQ.selectedSet) 
            {
                noSet = exercise.selectedSQ.selectedSet;
                $scope.clientExerciseSets[i] = exercise.selectedSQ.selectedSet;
            }
        }

        $scope.workout.selectedDay.circuits = global.circuits(
            $scope.workout.selectedDay.exercises, 
            $scope.workout.selectedDay.hash,
            $localStorage.nCircuits
        );

    }

    function optimizeCircuits() 
    {

        $scope.workout.selectedDay.circuits.forEach(function(circuit) 
        {

            var isFound = false;
            
            for (var i in $localStorage.nCircuits) 
            {
                var localCircuit = $localStorage.nCircuits[i];

                if (localCircuit.hash == circuit.hash && localCircuit.group_by_letter == circuit.group_by_letter) {
                    $localStorage.nCircuits[i].sets = circuit.sets;
                    $localStorage.nCircuits[i].reps = circuit.reps;

                    isFound = true;
                    break;
                } 
            }

            if (!isFound) {
                $localStorage.nCircuits.push(circuit);
            }
        })
    }

    $scope.onChangeCircuitSet = function() {

        var noSet  = 0;
        $scope.workoutMaxSet = 0;

        for (var i in $scope.workout.selectedDay.circuits) {

            var circuit = $scope.workout.selectedDay.circuits[i];

            if (circuit.sets) {
                noSet = parseInt(circuit.sets);
            }

            if (noSet >= $scope.workoutMaxSet) {
                $scope.workoutMaxSet = noSet;
            }
        }

        optimizeCircuits();
    };

    setTimeout(function() {
        $("#idSelectClient").change(function() {
            console.log($this.val());
        });
    }, 500);


    $("#idForm").submit(function (e)
    {

        e.preventDefault();

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
        $scope.workout.user_id = CURRENT_USER_ID;
        $('#idWorkoutForm').val(JSON.stringify($scope.workout));
        return true;

    });
});