 'use strict';

angular.module('aolDubTechCrunch2015App')
    .factory('notificationInterceptor', function ($q, AlertService) {
        return {
            response: function(response) {
                var alertKey = response.headers('X-aolDubTechCrunch2015App-alert');
                if (angular.isString(alertKey)) {
                    AlertService.success(alertKey, { param : response.headers('X-aolDubTechCrunch2015App-params')});
                }
                return response;
            }
        };
    });
