# frozen_string_literal: true

require 'rails_helper'
RSpec.describe 'Post show page', type: :feature do
  before do
    @user1 = User.create(Name: 'John Doe', Bio: 'John Doe is a bio', PostCounter: 3, Photo: 'https://unsplash.com/photos/F_-0BxGuVvo')
    @user2 = User.create(Name: 'Jane Doe', Bio: 'Jane Doe is a bio', PostCounter: 1, Photo: 'https://unsplash.com/photos/F_-0BxGuVvo')
    @user3 = User.create(Name: 'Jack Doe', Bio: 'Jack Doe is a bio', PostCounter: 1, Photo: 'https://unsplash.com/photos/F_-0BxGuVvo')
    @post = Post.create(Title: 'Post 1', Text: 'Post 1 is a text', CommentsCounter: 3, LikesCounter: 3, author: @user1)
    @comment1 = Comment.create(Text: 'Comment 1 is a text', author: @user1, post: @post)
    @comment2 = Comment.create(Text: 'Comment 2 is a text', author: @user2, post: @post)
    @comment3 = Comment.create(Text: 'Comment 3 is a text', author: @user3, post: @post)
  end
  describe 'Post show page' do
    before { visit user_post_path(@user1.id, @post.id) }
    it 'displays the post\'s title' do
      expect(page).to have_content(@post.Title)
    end
    it 'displays the user who wrote the post' do
      expect(page).to have_content(@user1.Name)
    end
    it 'displays the number of comments the post has' do
      expect(page).to have_content('Comments: 3')
    end
    it 'displays the number of likes the post has' do
      expect(page).to have_content('Likes: 3')
    end
    it 'displays the post body' do
      expect(page).to have_content(@post.Text)
    end
    it 'displays the username of each commentator' do
      expect(page).to have_content(@comment1.author.Name)
      expect(page).to have_content(@comment2.author.Name)
      expect(page).to have_content(@comment3.author.Name)
    end
    it 'displays the body of each comment' do
      expect(page).to have_content(@comment1.Text)
      expect(page).to have_content(@comment2.Text)
      expect(page).to have_content(@comment3.Text)
    end
  end
end
