app = angular.module('flapperNews')
app.factory('posts', ['$http'
  ($http)->
    o =
      posts: []

    o.getAll = ->
      $http.get('/posts.json').success( (data)->
        angular.copy(data, o.posts)
      )
    o.create = (post)->
      $http.post('/posts.json', post).success( (data)->
        o.posts.push(data)
      )
    o
])
