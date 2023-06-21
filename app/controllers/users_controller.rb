class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    if params[:id] == 'sign_out'
      sign_out(current_user)
    else
      @user = User.find_by_id(params[:id])
      render :invalid_user if @user.nil?
      @recent_posts = @user.return_three_most_recent_posts
    end
  end

  def invalid_user
    render :invalid_user
  end
end
