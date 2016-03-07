app = angular.module('flapperNews')
app.controller('MainCtrl', ['$scope', 'posts',
  ($scope, posts)->
    $scope.posts = posts.posts

    $scope.addPost = ->
      return unless $scope.title && $scope.title != ''
      posts.create(
        title: $scope.title
        link: $scope.link
      )
      $scope.title = ''
      $scope.link = ''

    $scope.incrementUpvotes = (post)->
      post.upvotes += 1
])
