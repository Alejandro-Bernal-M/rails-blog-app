# frozen_string_literal: true

class Like < ApplicationRecord
  belongs_to :author, class_name: :User
  belongs_to :post

  # A method that updates the likes counter for a post.
  def update_likes_counter
    likes_count = Like.where(post_id: post.id).count
    post.update(LikesCounter: likes_count)
  end
end
