class PostsController < ApplicationController
  include PostsHelper

  def index
    @user = User.find_by_id(params[:user_id])
    @posts = @user.posts
  end

  def new
    @user = User.find_by_id(params[:user_id])
  end

  def show
    @user = User.find_by_id(params[:user_id])
    @post = Post.find_by_id(params[:id])
  end
end
