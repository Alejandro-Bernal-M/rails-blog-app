class Api::V1::PostsController < ApiController
  def index
    @user = User.includes(:posts).find(params[:user_id])
    render json: @user.posts
  end
end
