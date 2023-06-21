# frozen_string_literal: true

class CommentsController < ApplicationController
  def new
    @user = User.find_by_id(params[:user_id])
    @post = Post.find_by_id(params[:post_id])
  end

  def create
    @user = User.find_by_id(params[:user_id])
    @post = Post.find_by_id(params[:post_id])
    @comment = Comment.new
    @comment.Text = params[:comment][:Text]
    @comment.author = @current_user
    @comment.post = @post
    if @comment.save
      @comment.update_comments_counter
      redirect_to user_post_path(@user.id, @post.id)
    else
      render :new
    end
  end

  def destroy
    @user = User.find_by_id(params[:user_id])
    @post = Post.find_by_id(params[:post_id])
    @comment = Comment.find_by_id(params[:id])
    if can?(:destroy, @comment)
      @comment.destroy
      @post.update_comments_counter
      redirect_to user_post_path(@user.id, @post.id), notice: 'Comment was successfully deleted.'
    else
      redirect_to user_post_path(@user.id, @post.id), alert: 'You are not authorized to delete this comment.'
    end
  end
end
