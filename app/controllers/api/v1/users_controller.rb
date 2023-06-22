class Api::V1::UsersController < ApiController
  def index
    @users = User.all
    render json: @users
  end

  def show
    render json: User.find(params[:id])
  end
end
