class User < ApplicationRecord
  has_many :posts, foreign_key: :author_id
  has_many :comments, foreign_key: :author_id
  has_many :likes, foreign_key: :author_id

  # Validations
  validates :Name, presence: true, length: { minimun: 3, maximum: 20 }
  validates :PostCounter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  # A method that returns the 3 most recent posts for a given user.
  def return_three_most_recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
