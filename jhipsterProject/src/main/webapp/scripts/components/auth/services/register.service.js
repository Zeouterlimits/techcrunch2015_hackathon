'use strict';

angular.module('aolDubTechCrunch2015App')
    .factory('Register', function ($resource) {
        return $resource('api/register', {}, {
        });
    });


