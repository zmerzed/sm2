app.controller('editWorkoutController', function($scope, $http, global, $localStorage) {

    $scope.currentUser = CURRENT_USER;
    $scope.clientsBackup = angular.copy(CLIENTS);
    $scope.workout = WORKOUT;
    $scope.workoutMaxSet = 0;
    $scope.exerciseOptions = angular.copy(EXERCISE_OPTIONS);
    $scope.exerciseSQoptions = angular.copy(EXERCISE_SQ_OPTIONS);
    $scope.clientExerciseSets = [];
    $scope.reader = {selectedClient:false};
    $scope.workoutTemplate = ROOT_URL + '/wp-content/themes/Divi-child/partials/edit_workout.html';
    $scope.workoutSortExerTemplate = ROOT_URL + '/wp-content/themes/Divi-child/partials/modal.sorting_exercise.html';
    $localStorage.nCircuits = angular.copy($scope.workout.circuits);

    var urlApiClient = ROOT_URL + '/wp-json/v1';

    init();

    function init()
    {
        console.log('______________CURRENT USER_____________');
        console.log($scope.workout);

        $scope.workout.note = PROGRAM_NOTE;

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

            for (var y in day.clients) 
            {
                var client = day.clients[y];

                if (client.date_availability && client.time_availability) {
                    var mHMR = client.time_availability.split(":");
                    var mDate = new Date(client.date_availability);

                    mDate.setHours(mHMR[0]);
                    mDate.setMinutes(mHMR[1]);
                    mDate.setSeconds(mHMR[2]);

                    client.time_availability_temp = mDate;
                }
            }
        }

        if ($scope.workout.days.length > 0)
        {
            optimizeDays();
            selectDay($scope.workout.days[0]);
        }

    }

    $scope.newWorkOutDay = function ()
    {

        $http.get(urlApiClient + '/hash').then(function(res)
        {

            var newEx = generateNewExercise(res.data.hash);

            $scope.workout.days.push({exercises:[newEx], clients:[], hash: res.data.hash});

            optimizeDays();
            var countDays = $scope.workout.days.length;

            $scope.selectedClient = "Add Client";
            $scope.clients = angular.copy($scope.clientsBackup);

            selectDay($scope.workout.days[countDays - 1])
        });
    };

    $scope.onNamingExercise = function(exercise) {
        $('#idSortExerciseModal').modal('show');
        $scope.selectedExercise = exercise;
    };

    $scope.updateExerciseGroupBy = function() {
        console.log($scope.selectedExercise);

        if (!$scope.selectedExercise.group_by_letter) {
            $scope.selectedExercise.group_by_letter = '';
        }

        if (!$scope.selectedExercise.group_by_number) {
            $scope.selectedExercise.group_by_number = '';
        }

        $scope.selectedExercise.group_by = $scope.selectedExercise.group_by_letter + $scope.selectedExercise.group_by_number;
		$scope.onLeaveDay();
    };

    $scope.onChangeDayName = function() {

        $scope.onLeaveDay();
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

        var fd = new FormData();
        fd.append("program_id", $scope.workout.selectedDay.wday_workout_ID);
        fd.append("day_id", $scope.workout.selectedDay.wday_ID);
        fd.append("client_id", client.ID);
        fd.append("client_day_id", client.clientDayId);

        $http.post(
            urlApiClient + '/remove-workout-client', fd, {headers: {'Content-Type': undefined, 'Process-Data':false}}
        ).then(function(res) {});
    };

    $scope.onSelectDay = function(day) {
        optimizeSelectedDay();
        selectDay(day);
    };

    $scope.onLeaveDay = function() {

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

    $scope.isActive = function(day) {

        if ($scope.workout.selectedDay.wday_order == day.wday_order) {
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

    $scope.newExercise = function() {

        $http.get(urlApiClient + '/hash').then(function(res) {

            var newEx = generateNewExercise(res.data.hash);

            $scope.workout.selectedDay.exercises.push(newEx);
            optimizeSelectedDay();
            optimizeDays();
        });

    };

    $scope.selectClient = function(client) {

        $scope.workout.selectedDay.selectedClient = client;
        optimizeClientExercises();
    };

    $scope.$watch('reader.selectedClient', function(val)
    {
        console.log('reader.selectedClient');
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


    // $scope.$watch('workout.selectedDay.selectedClient', function(val)
    // {
    //     console.log('------------workout.selectedDay.selectedClient-------------------');
    //     console.log(val);
    //     console.log($scope.clients);
    //     if (val)
    //     {
    //         var found = false;
    //         for (var i in $scope.clients)
    //         {
    //             var client = $scope.clients[i];
    //
    //             if (client.ID == val.ID)
    //             {
    //
    //                 for (var x in $scope.workout.selectedDay.clients)
    //                 {
    //                     var xClient = $scope.workout.selectedDay.clients[x];
    //
    //                     if(xClient.ID == val.ID)
    //                     {
    //                         found = true;
    //                     }
    //                 }
    //
    //                 if (!found) {
    //                     $scope.workout.selectedDay.clients.push(client);
    //
    //                     $scope.selectClient(client);
    //                 }
    //
    //                 break;
    //             }
    //         }
    //         optimizeClientExercises();
    //         optimizeSelectedClients();
    //     }
    //
    // }, true);

    $scope.$watch(function() {

        console.log('/* get the largest set in a selected day */');
        $scope.workout.selectedDay.exercises = global.customSort($scope.workout.selectedDay.exercises);

        return $scope.workout.selectedDay.exercises;

    }, function(newValue, oldValue){

        if (!angular.equals(oldValue, newValue)) {
            optimizeClientExercises();
            findTheLargestSet();
        }
    },true);

    $scope.onChangeClientTime = function() {

        if($scope.$root.$$phase != '$apply' &&
            $scope.$root.$$phase != '$digest'
        ) {
            $scope.$apply();
        }
    };

    $scope.removeDay = function(day) {
        day.isDelete = true;

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

    $scope.removeExercise = function(exercise) {
        exercise.isDelete = true;
        optimizeSelectedDay();
        optimizeClientExercises();
        findTheLargestSet();
    };

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

    $scope.onCopy = function()
    {
        var newCopy = angular.copy($scope.workout.selectedDay);

        $scope.onLeaveDay();
        setTimeout(function()
        {
            $scope.$apply(function() {
                var newCopy = angular.copy($scope.workout.selectedDay);
                delete newCopy.wday_ID;

                console.log('copying workout day');
                console.log($scope.workout.selectedDay);

                var nOfExs = newCopy.exercises.length;
                $http.get(urlApiClient + '/hash?sets=' + nOfExs).then(function(res)
                {

                    var setOfHashes = res.data.set_of_hash;

                    newCopy.hash = setOfHashes[0];

                    newCopy.exercises.forEach(function(ex, i){
                        delete ex.exer_ID;
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

    $scope.onCopyExercise = function(exercise)
    {
		$('body').addClass('loading');
        console.log(exercise);
        var newExercise = angular.copy(exercise);

        delete newExercise.exer_ID;
        $http.get(urlApiClient + '/hash').then(function(res)
        {
            newExercise.hash = res.data.hash;
            $scope.workout.selectedDay.exercises.push(newExercise);
            optimizeClientExercises();
			console.log('test---------------');
			$('body').removeClass('loading');
        });

    };

    $scope.sendForm = function()
    {
        console.log('xxxxxxxxxxxxxxxxxx');

        if ($scope.currentUser.isGym) {
            var formUrl = '/gym/?data=edit-workout&workout=' + $scope.workout.workout_ID;
        } else {
            var formUrl = '/trainer/?data=add-workouts&workout=' + $scope.workout.workout_ID;
        }

        $('#idForm').attr('action', formUrl);

        var toSend = angular.copy($scope.workout);

        try {

            if (typeof toSend.selectedDay != 'undefined') {
                delete toSend.selectedDay;
            }

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
                        console.log('ttttttttttttttttttttttttttt');
                        console.log(client.time_availability);
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

            $('#idWorkoutForm').val(JSON.stringify(toSend));
            console.log(toSend);
            return true;
        }
        catch(err) {
            console.log('error');
            return false;
        }

        return false;
    };
    
    $scope.updateNote = function()
    {
        var fd = new FormData();
        fd.append('note', $scope.workout.note.detail);
        fd.append('workout_id', $scope.workout.workout_ID);
        fd.append('user_id', $scope.currentUser.id);
        $scope.promise = $http.post(
            urlApiClient + '/program-note', fd, {headers: {'Content-Type': undefined, 'Process-Data':false}}
        ).then(function(res) {
            $scope.workout.note = res.data.data;
        });
    };

    function nFormat(n){
        return n > 9 ? "" + n: "0" + n;
    }

    function optimizeCircuits() 
    {

        console.log('optimizeCircuits');
        console.log($scope.workout.selectedDay.circuits);
        console.log($localStorage.nCircuits);
        $scope.workout.selectedDay.circuits.forEach(function(circuit) 
        {

            var isFound = false;
            for (var i in $localStorage.nCircuits) 
            {
                var localCircuit = $localStorage.nCircuits[i];

                if (localCircuit.hash == circuit.hash && localCircuit.group_by_letter == circuit.group_by_letter) {
                    $localStorage.nCircuits[i].sets = angular.copy(circuit.sets);
                    $localStorage.nCircuits[i].reps = angular.copy(circuit.reps);
                    isFound = true;
                    break;
                } 
            }

            if (!isFound) {
                $localStorage.nCircuits.push(circuit);
            }
        })
    }

    function optimizeSelectedClients()
    {
        $scope.clients = angular.copy($scope.clientsBackup);       
        for (var i = 0; i < $scope.workout.selectedDay.clients.length; i++){			
			$scope.clients.forEach((v,index)=>{			
				if(v.ID == $scope.workout.selectedDay.clients[i].ID)
					$scope.clients.splice(index, 1);
			});
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

                if (mExercise.selectedPart.selectedType.implementation_options.indexOf(mExercise.exer_impl1) < 0 
                    && !mExercise.selectedPart.selectedType.selectedImplementation1 && mExercise.exer_impl1)
                {

                    mExercise.selectedPart.selectedType.implementation_options.push(mExercise.exer_impl1);
                    mExercise.selectedPart.selectedType.selectedImplementation1 = mExercise.exer_impl1;
                }

                if (mExercise.selectedPart.selectedType.selectedImplementation1 == 'custom') 
                {
                    mImpCustom = prompt("Please add a custom implementation");

                    if (mImpCustom != 'custom' && (mImpCustom && mImpCustom.length > 0)) 
                    {
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
                    } else {
                        delete mExercise.selectedPart.selectedType.selectedImplementation1  ; 

                    }
                }      
            }


            /* SQ selectedRep */

            if (mExercise.selectedSQ) 
            {

                /* check if custom is selected for rep */

                if (mExercise.selectedSQ.options.rep_options.indexOf(mExercise.exer_rep) < 0 
                    && !mExercise.selectedSQ.selectedRep && mExercise.exer_rep)
                {

                    mExercise.selectedSQ.options.rep_options.push(mExercise.exer_rep);
                    mExercise.selectedSQ.selectedRep = mExercise.exer_rep;
                }

                /* check if others is selected for rep */
                if (mExercise.selectedSQ.selectedRep == 'custom') 
                {

                    var mReps = [];
                    var mRep = prompt("Please add a custom reps");

                    if (mRep != 'custom'  && (mRep && mRep.length > 0)) 
                    {
                        for (var mI in mExercise.selectedSQ.options.rep_options)
                        {
                            var rep = mExercise.selectedSQ.options.rep_options[mI];

                            if (rep == 'custom') {
                                rep = angular.copy(mRep);
                            }

                            if (rep) {
                                mReps.push(rep);
                            }
                            
                        }
                        mReps.push('custom');
                        mExercise.selectedSQ.options.rep_options = mReps;
                        mExercise.selectedSQ.selectedRep = mRep;
                    } else {
                        delete mExercise.selectedSQ.selectedRep; 

                    }
                    
                    break;
                }

            }
           
            /* check if others is selected tempo */
            if (mExercise.selectedSQ && mExercise.exer_tempo && !mExercise.selectedSQ.selectedTempo) {
                mExercise.selectedSQ.selectedTempo = mExercise.exer_tempo;

                var mTempos = [];

                for (var mI in mExercise.selectedSQ.options.tempo)
                {
                    var tempo = mExercise.selectedSQ.options.tempo[mI];

                    if (tempo == 'custom') {
                        tempo = angular.copy(mExercise.exer_tempo);
                    }

                    if (tempo) {
                        mTempos.push(tempo);
                    }

                }

                mExercise.selectedSQ.options.tempo = mTempos;
            }

            if (mExercise.selectedSQ && mExercise.selectedSQ.selectedTempo == 'custom') {
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

                    if (tempo) {
                        mTempos.push(tempo);
                    }

                }

                mExercise.selectedSQ.options.tempo = mTempos;
                mExercise.selectedSQ.selectedTempo = mOtherName;
            }

            /* check if others is selected rest */
            if (mExercise.selectedSQ && mExercise.exer_rest && !mExercise.selectedSQ.exer_rest)
            {
                mExercise.selectedSQ.selectedRest = mExercise.exer_rest;

                var mRests = [];

                for (var mI in mExercise.selectedSQ.options.rest)
                {
                    var rest = mExercise.selectedSQ.options.rest[mI];

                    if (rest == 'custom') {
                        rest = angular.copy(mExercise.exer_rest);
                    }

                    if (rest) {
                        mRests.push(rest);
                    }

                }

                mExercise.selectedSQ.options.rest = mRests;
            }

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

                    if (rest) {
                        mRests.push(rest);
                    }

                }

                mExercise.selectedSQ.options.rest = mRests;
                mExercise.selectedSQ.selectedRest = mOtherName;
            }

            var exercise = angular.copy($scope.workout.selectedDay.exercises[i]);
        }

        $scope.workout.selectedDay.circuits = global.circuits(
            $scope.workout.selectedDay.exercises, 
            $scope.workout.selectedDay.hash,
            $localStorage.nCircuits
        );


        setTimeout(function() 
        {

            if ($scope.workout.selectedDay.exercises.length > 0)  {
                $scope.workout.selectedDay.exercises[0].test = 'test';
            }

            if($scope.$root.$$phase != '$apply' &&
                $scope.$root.$$phase != '$digest'
            ) {
                $scope.$apply();
            }
        }, 500);
        
      
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
        };
    }

    function selectDay(day)
    {
        $scope.workout.selectedDay = angular.copy(day);

        $scope.workout.selectedDay.circuits = [];

        if ($scope.workout.selectedDay.clients)
        {
            $scope.workout.selectedDay.selectedClient = $scope.workout.selectedDay.clients[0];

            optimizeSelectedClients();
            optimizeClientExercises();
            optimizeSelectedDay();
        }

        optimizeCircuits();
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
            $scope.workout.days[i].wday_order = count;
            count++;
        }
    }
});