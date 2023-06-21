# frozen_string_literal: true

require 'rails_helper'

describe User, type: :model do
  subject { User.new(Name: 'John Doe', PostCounter: 0) }

  before { subject.save }

  it 'has a valid Name' do
    expect(subject).to be_valid
  end

  it 'has an invalid Name' do
    subject.Name = nil
    expect(subject).to_not be_valid
  end

  it 'has a valid PostCounter' do
    expect(subject).to be_valid
  end

  it 'has an invalid PostCounter' do
    subject.PostCounter = nil
    expect(subject).to_not be_valid
  end
end

describe User, type: :model do
  user1 = User.create(Name: 'John Doe', PostCounter: 0)
  post1 = Post.create(Title: 'Title1', CommentsCounter: 0, LikesCounter: 0, author: user1)
  post2 = Post.create(Title: 'Title2', CommentsCounter: 0, LikesCounter: 0, author: user1)

  it 'returns the 3 most recent posts for a given user' do
    expect(user1.return_three_most_recent_posts).to eq([post2, post1])
  end
end
