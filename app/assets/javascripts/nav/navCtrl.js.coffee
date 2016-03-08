app = angular.module('flapperNews')
app.controller('NavCtrl', ['$scope', 'Auth',
  ($scope, Auth)->
    config =
      headers:
        'X-HTTP-Method-Override': 'DELETE'

    $scope.signedIn = Auth.isAuthenticated
    $scope.logout = ->
      Auth.logout(config)

    Auth.currentUser().then( (user)->
      $scope.user = user
    )

    $scope.$on('devise:new-registration', (e, user)->
      $scope.user = user
    )

    $scope.$on('devise:login', (e, user)->
      $scope.user = user
    )

    $scope.$on('devise:logout', (e, user)->
      $scope.user = {}
    )
])
