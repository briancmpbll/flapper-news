app = angular.module('flapperNews', ['ui.router', 'templates'])

app.config(['$stateProvider', '$urlRouterProvider',
  ($stateProvider, $urlRouterProvider)->
    $stateProvider
      .state('home'
        url: '/home',
        templateUrl: 'home/_home.html'
        controller: 'MainCtrl'
        resolve:
          postPromise: ['posts',
            (posts)->
              posts.getAll()
          ]
      )
      .state('posts'
        url: '/posts/{id}'
        templateUrl: 'posts/_posts.html'
        controller: 'PostsCtrl'
      )

    $urlRouterProvider.otherwise('home')
])
