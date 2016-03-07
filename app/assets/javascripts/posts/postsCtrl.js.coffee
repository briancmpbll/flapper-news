app = angular.module('flapperNews')
app.controller('PostsCtrl', ['$scope', 'posts', 'post'
  ($scope, posts, post)->
    $scope.post = post

    $scope.addComment = ->
      return unless $scope.body != ''
      posts.addComment(post.id,
        body: $scope.body
        author: 'user'
      ).success( (comment)->
        $scope.post.comments.push(comment)
      )
      $scope.body = ''

    $scope.incrementUpvotes = (comment)->
      posts.upvoteComment(post, comment)
])
