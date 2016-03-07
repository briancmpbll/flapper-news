app = angular.module('flapperNews')
app.controller('PostsCtrl', ['$scope', '$stateParams', 'posts',
  ($scope, $stateParams, posts)->
    $scope.post = posts.posts[$stateParams.id]

    $scope.addComment = ->
      return unless $scope.body != ''
      $scope.post.comments.push(
        body: $scope.body
        author: 'user'
        upvotes: 0
      )
      $scope.body = ''

    $scope.incrementUpvotes = (comment)->
      comment.upvotes += 1
])
