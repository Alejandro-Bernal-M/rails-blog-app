class PostsController < ApplicationController
  include PostsHelper

  def index
    @user = User.find_by_id(params[:user_id])
    if @user.nil?
      redirect_to '/users/invalid_user'
    else
      @posts = @user.posts
    end
  end

  def new
    @user = User.find_by_id(params[:user_id])
  end

  def create
    @user = User.find_by_id(params[:user_id])
    @post = Post.new
    @post.Title = params[:post][:Title]
    @post.Text = params[:post][:Text]
    @post.author = @current_user
    @post.CommentsCounter = 0
    @post.LikesCounter = 0
    if @post.save
      @post.update_posts_counter
      redirect_to user_posts_path(@user.id)
    else
      render :new
    end
  end

  def show
    @user = User.find_by_id(params[:user_id])
    @post = Post.find_by_id(params[:id])
    redirect_to '/users/invalid_user' if @post.nil? || @user.nil?
  end
end
