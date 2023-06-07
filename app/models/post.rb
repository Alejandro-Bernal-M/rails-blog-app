class Post < ApplicationRecord
  belongs_to :author, class_name: :User
  has_many :comments
  has_many :likes

  # A method that updates the posts counter for a user.
  def update_posts_counter
    author.update(PostCounter: author.posts.count)
  end

  # A method which returns the 5 most recent comments for a given post.
  def return_five_most_recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
