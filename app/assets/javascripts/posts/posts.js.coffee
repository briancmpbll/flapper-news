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
    o.upvote = (post)->
      $http.put("/posts/#{post.id}/upvote.json").success( (data)->
        post.upvotes += 1
      )
    o
])
