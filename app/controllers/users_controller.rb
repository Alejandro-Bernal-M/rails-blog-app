class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by_id(params[:id])
    if @user.nil?
      render :invalid_user
    else
      @recent_posts = @user.return_three_most_recent_posts
    end
  end

  def invalid_user
    render :invalid_user
  end
end
