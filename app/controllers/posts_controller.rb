# Controller for posts
class PostsController < ApplicationController
  include Votable
  before_action :set_post, only: [:show, :upvote]

  def index
    respond_with Post.all
  end

  def create
    respond_with Post.create(post_params.merge(user_id: current_user.id))
  end

  def show
    respond_with @post
  end

  def upvote
    @post.increment!(:upvotes)

    respond_with @post
  end

  private

  def post_params
    params.require(:post).permit(:link, :title)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
