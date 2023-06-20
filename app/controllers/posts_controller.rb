class PostsController < ApplicationController
  include PostsHelper

  def index
    @user = User.includes(posts: { comments: :author }).find_by(id: params[:user_id])
    redirect_to '/users/invalid_user' if @user.nil?
    @posts = @user.posts
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
    @post = @user.posts.includes(:comments, :author).find_by_id(params[:id])
    redirect_to '/users/invalid_user' if @post.nil? || @user.nil?
  end
end
