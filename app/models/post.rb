class Post < ApplicationRecord
  belongs_to :author, class_name: :User
  has_many :comments
  has_many :likes

  #A method that updates the posts counter for a user.
  def update_posts_counter
    self.author.update(PostCounter: self.author.posts.count)
  end
end
