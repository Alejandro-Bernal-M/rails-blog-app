require 'rails_helper'

describe Comment, type: :model do
  user1 = User.create(Name: "John Doe", PostCounter: 0)
  post1 = Post.create(Title: "Title1", CommentsCounter: 0, LikesCounter: 0, author: user1)
  comment1 = Comment.create(Text: "Content1", post: post1, author: user1)

  it 'Update comments counter' do
    comment1.update_comments_counter
    expect(post1.CommentsCounter).to eq(1)
  end
end