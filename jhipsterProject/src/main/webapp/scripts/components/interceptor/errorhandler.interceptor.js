'use strict';

angular.module('aolDubTechCrunch2015App')
    .factory('errorHandlerInterceptor', function ($q, $rootScope) {
        return {
            'responseError': function (response) {
                if (!(response.status == 401 && response.data.path.indexOf("/api/account") == 0 )){
	                $rootScope.$emit('aolDubTechCrunch2015App.httpError', response);
	            }
                return $q.reject(response);
            }
        };
    });