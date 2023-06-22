class PostsController < ApplicationController
  load_and_authorize_resource
  include PostsHelper

  def index
    @user = User.includes(posts: { comments: :author }).find_by(id: params[:user_id])
    redirect_to '/users/invalid_user' if @user.nil?
    @posts = @user.posts

    respond_to do |format|
      format.html
      format.json {render json: @posts}
    end
  end

  def new
    @user = User.find_by_id(params[:user_id])
  end

  def create
    @user = User.find_by_id(params[:user_id])
    @post = @user.posts.new(post_params)
    @post.CommentsCounter = 0
    @post.LikesCounter = 0

    if @post.save
      @post.update_posts_counter
      redirect_to user_posts_path(user_id: @user.id)
    else
      render :new
    end
  end

  def show
    @user = User.find_by_id(params[:user_id])
    @post = @user.posts.includes(:comments, :author).find_by_id(params[:id])
    redirect_to '/users/invalid_user' if @post.nil? || @user.nil?

  end

  def destroy
    @user = User.find_by_id(params[:user_id])
    @post = Post.find_by_id(params[:id])

    if can?(:destroy, @post) # Check if the current user is authorized to delete the post
      @post.likes.destroy_all
      @post.comments.destroy_all
      @post.destroy
      @user.update_posts_counter
      redirect_to user_posts_path(user_id: @user.id), notice: 'Post was successfully deleted.'
    else
      redirect_to user_post_path(user_id: @user.id, id: @post.id), alert: 'You are not authorized to delete this post.'
    end
  end

  private

  def post_params
    params.require(:post).permit(:Title, :Text)
  end
end
