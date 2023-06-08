require 'rails_helper'

describe Post, type: :model do
  user1 = User.create(Name: "John Doe", PostCounter: 0)
  post1 = Post.create(Title: "Title1", CommentsCounter: 0, LikesCounter: 0, author: user1)
  comment1 = Comment.create(Text: "Content1", post: post1, author: user1)
  comment2 = Comment.create(Text: "Content2", post: post1, author: user1)
  comment3 = Comment.create(Text: "Content3", post: post1, author: user1)
  comment4 = Comment.create(Text: "Content4", post: post1, author: user1)
  comment5 = Comment.create(Text: "Content5", post: post1, author: user1)
  comment6 = Comment.create(Text: "Content6", post: post1, author: user1)

  it 'has a valid Title' do
    expect(post1).to be_valid
  end

  it 'has an invalid Title' do
    post1.Title = nil
    expect(post1).to_not be_valid
    post1.Title = "Title1" 
  end

  it 'has a valid CommentsCounter' do
    expect(post1).to be_valid
  end

  it 'has an invalid CommentsCounter' do
    post1.CommentsCounter = nil
    expect(post1).to_not be_valid
    post1.CommentsCounter = 0
  end

  it 'has a valid LikesCounter' do
    expect(post1).to be_valid
  end

  it 'has an invalid LikesCounter' do
    post1.LikesCounter = nil
    expect(post1).to_not be_valid
  end

  it 'updates the posts counter for a user' do
    post1.update_posts_counter
    expect(user1.PostCounter).to eq(1)
  end

  it 'returns the 5 most recent comments for a given post' do
    expect(post1.return_five_most_recent_comments).to eq([comment6, comment5, comment4, comment3, comment2])
  end
end