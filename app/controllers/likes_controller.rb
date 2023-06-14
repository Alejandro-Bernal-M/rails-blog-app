class LikesController < ApplicationController
  def create
    @post = Post.find_by_id(params[:post_id])
    @like = Like.new()
    @like.post_id = @post.id
    @like.author_id = @current_user.id
    @like.save unless Like.where(author_id: @current_user.id, post_id: @post.id).exists?
    @like.update_likes_counter
    redirect_to user_post_path(@post.author.id, @post.id)
  end
end