/**
 * Created by remz on 7/10/2018.
 */
var app = angular.module("smApp", ['cgBusy', 'ui.bootstrap', 'ngStorage']);
app.run(function() {
   console.log('sm app run....')
});
app.constant('global', {
    time: [
        { label: '1AM', value: 1},
        { label: '2AM', value: 2},
        { label: '3AM', value: 3},
        { label: '4AM', value: 4},
        { label: '5AM', value: 5},
        { label: '6AM', value: 6},
        { label: '7AM', value: 7},
        { label: '8AM', value: 8},
        { label: '9AM', value: 9},
        { label: '10AM', value: 10},
        { label: '11AM', value: 11},
        { label: '12PM', value: 12},
        { label: '1PM', value: 13},
        { label: '2PM', value: 14},
        { label: '3PM', value: 15},
        { label: '4PM', value: 16},
        { label: '5PM', value: 17},
        { label: '6PM', value: 18},
        { label: '7PM', value: 19},
        { label: '8PM', value: 20},
        { label: '9PM', value: 21},
        { label: '10PM', value: 22},
        { label: '11PM', value: 23},
        { label: '12AM', value: 24}
    ],
    sortByKey: function (array, key) {
        return array.sort(function (a, b) {
            var x = a[key],
                y = b[key];
            if (typeof x === 'string') {
                x = x.toLowerCase();
                y = y.toLowerCase();
                if (!isNaN(x) && !isNaN(y)) {
                    x = parseInt(x, 10);
                    y = parseInt(y, 10);
                }
            }
            return (x < y ? -1 : (x > y ? 1 : 0));
        });
    },

    circuits: function(arr, hash='', storageCircuits=[])
    {
        var group_to_values = arr.reduce(function (obj, item) {
            obj[item.group_by_letter] = obj[item.group_by_letter] || [];
            obj[item.group_by_letter].push(item);
            return obj;
        }, {});

        var groups = Object.keys(group_to_values).map(function (key) 
        {
            return {
                group_by_letter: key, 
                exercises: group_to_values[key], 
                hash: hash
            };
        }); 

        groups.forEach(function(g) 
        {

            for (var i in storageCircuits) {

                var sCircuit = storageCircuits[i];

                if (sCircuit.hash == g.hash && sCircuit.group_by_letter == g.group_by_letter) {
                    g.sets = angular.copy(sCircuit.sets);
                    g.reps = angular.copy(sCircuit.reps);
                    break;
                }
            }
        });

         console.log('wwwwwwwwwwwwwwwwwwwwwww');
        console.log(groups);
        return groups;
    },

    customSort: function(arr)
    {
        function dynamicSort(property)
        {
            var sortOrder = 1;
            if(property[0] === "-") {
                sortOrder = -1;
                property = property.substr(1);
            }
            return function (a,b) {
                var result = (a[property] < b[property]) ? -1 : (a[property] > b[property]) ? 1 : 0;
                return result * sortOrder;
            }
        }

        arr.sort(dynamicSort("group_by"));

        arr.sort(function(a, b) {

            return a.group_by.length - b.group_by.length;
        });

        arr.sort(function(a, b){

            var x = a.group_by.charAt(0);
            var y = b.group_by.charAt(0);

            return x > y;
        });

        var prevLetter = '';

        for (var n in arr) {

            if (arr[n].isLast) {
                delete arr[n].isLast;
            }

            if (arr[n].isFirst) {
                delete arr[n].isFirst;
            }

            if (parseInt(n) <= 0) {
                prevLetter = arr[n].group_by.charAt(0);
                arr[n].isFirst = true;
            }

            if (arr[n].group_by.charAt(0) != prevLetter) {
                // current customer id same as previous id

                arr[n - 1].isLast = true;
                arr[n].isFirst = true;
            }

            if (n == (arr.length - 1)) {
                arr[n].isLast = true;
            } else {
                prevLetter = arr[n].group_by.charAt(0);
            }

            arr[n].group_by_letter = arr[n].group_by.charAt(0);
        }

        return arr;
    },

    isObject : function isObject(val) {
        if (val === null) { return false;}
        return ( (typeof val === 'function') || (typeof val === 'object') );
    }
});
app.filter('dataURLtoBlob', function() {
    return function(dataurl) {
        var arr = dataurl.split(','), mime = arr[0].match(/:(.*?);/)[1],
            bstr = atob(arr[1]), n = bstr.length, u8arr = new Uint8Array(n);
        while(n--){
            u8arr[n] = bstr.charCodeAt(n);
        }
        return new Blob([u8arr], {type:mime});
    }
});
app.filter("range", function() {
    return function(input, total) {
        total = parseInt(total);
        for (var i = 0; i < total; i++) {
            input.push(i);
        }
        return input;
    };
});
app.filter('start', function () {
    return function (input, start) {
        if (!input || !input.length) { return; }
        start = +start;
        return input.slice(start);
    };
});
app.directive('fileModel', ['$parse', function ($parse) {
    return {
        restrict: 'A',
        link: function(scope, element, attrs) {
            var model = $parse(attrs.fileModel);
            var modelSetter = model.assign;

            element.bind('change', function(){
                scope.$apply(function(){
                    modelSetter(scope, element[0].files[0]);
                });
            });
        }
    };
}]);
app.directive("datepicker", function () {
    return {
        restrict: "A",
        link: function (scope, el, attr) {
            var dateToday = new Date();
            el.datepicker({
                minDate: dateToday,
                dateFormat: 'yy-mm-dd',
                timeFormat:  "hh:mm:ss"
            });
        }
    };
})
.directive('customDatepicker',function($compile){
    return {
        replace:true,
        templateUrl:'custom-datepicker.html',
        scope: {
            ngModel: '=',
            dateOptions: '='
        },
        link: function($scope, $element, $attrs, $controller){
            var $button = $element.find('button');
            var $input = $element.find('input');
            $button.on('click',function(){
                if($input.is(':focus')){
                    $input.trigger('blur');
                } else {
                    $input.trigger('focus');
                }
            });
        }
    };
})
.directive("submit", [function () {
    return {
        scope: {
            submit: "="
        },
        link: function (scope, element, attributes) {
            element.bind("submit", function (loadEvent) {
                return scope.submit(loadEvent);
            });
        }
    }
}]);
