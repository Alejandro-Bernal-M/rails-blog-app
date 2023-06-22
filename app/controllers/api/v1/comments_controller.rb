class Api::V1::CommentsController < ApiController
  before_action :authorize_request, only: [:create]

  def index
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])

    render json: @post.comments
  end

  def create
    @text = params[:Text]
    @new_comment = Comment.create(Text: @text, user_id: @current_user.id, post_id: params[:post_id])
    render json: @new_comment
  end
end
