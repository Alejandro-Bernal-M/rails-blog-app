# frozen_string_literal: true

require 'rails_helper'

describe Like, type: :model do
  user1 = User.create(Name: 'John Doe', PostCounter: 0)
  post1 = Post.create(Title: 'Title1', CommentsCounter: 0, LikesCounter: 0, author: user1)
  like1 = Like.create(post: post1, author: user1)

  it 'Updates the likes counter for a post' do
    like1.update_likes_counter
    expect(post1.LikesCounter).to eq(1)
  end
end
