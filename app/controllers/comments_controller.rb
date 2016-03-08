# Controller for comments
class CommentsController < ApplicationController
  include Votable
  before_action :set_post
  before_action :set_comment, only: [:upvote]

  def create
    comment = @post.comments.create(comment_params)
    respond_with @post, comment
  end

  def upvote
    @comment.increment!(:upvotes)

    respond_with @post, @comment
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :author)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
