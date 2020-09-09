angular.module('sailpoint.plugin.updateViewAttributesPlugin',
  [
   'as.sortable'
  ]
).config(
        ['$locationProvider',
            function ($locationProvider) {
                $locationProvider.html5Mode({
                  enabled: true,
                  requireBase: false
                });
            }
        ]
);