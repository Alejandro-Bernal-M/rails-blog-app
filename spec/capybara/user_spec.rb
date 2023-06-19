require 'rails_helper'

RSpec.describe 'User management', type: :feature do
  before do
    # Create users and posts before each test
    @user1 = User.create(Name: 'John Doe', Bio: 'John Doe is a bio', PostCounter: 1, Photo:'https://unsplash.com/photos/F_-0BxGuVvo')
    @user2 = User.create(Name: 'Jane Doe', Bio: 'Jane Doe is a bio', PostCounter: 1, Photo:'https://unsplash.com/photos/F_-0BxGuVvo')
    @user3 = User.create(Name: 'Jack Doe', Bio: 'Jack Doe is a bio', PostCounter: 1, Photo:'https://unsplash.com/photos/F_-0BxGuVvo')
    
    @post1 = Post.create(Title: 'Post 1', Text: 'Post 1 is a text', CommentsCounter: 0, LikesCounter: 0, author: @user1)
    @post2 = Post.create(Title: 'Post 2', Text: 'Post 2 is a text', CommentsCounter: 0, LikesCounter: 0, author: @user2)
    @post3 = Post.create(Title: 'Post 3', Text: 'Post 3 is a text', CommentsCounter: 0, LikesCounter: 0, author: @user3)
    
  end

  describe 'User index page' do
    it 'displays the username of all users' do
      visit users_path

      expect(page).to have_content('You are logged in as: John Doe')
      expect(page).to have_content('You')
      expect(page).to have_content('Jane Doe')
      expect(page).to have_content('Jack Doe')
    end

    it 'displays the profile picture for each user' do
      visit users_path

      expect(page).to have_selector("img[src='https://unsplash.com/photos/F_-0BxGuVvo']")
      expect(page).to have_selector("img[src='https://unsplash.com/photos/F_-0BxGuVvo']")
      expect(page).to have_selector("img[src='https://unsplash.com/photos/F_-0BxGuVvo']")
    end

    it 'displays the number of posts for each user' do
      visit users_path

      expect(page).to have_content('Number of posts: 1')
      expect(page).to have_content('Number of posts: 1')
      expect(page).to have_content('Number of posts: 1')
    end

    it 'redirects to user show page when clicking on a user' do
      visit users_path

      click_link 'You'
      expect(current_path).to eq(user_path(@user1))

      click_link 'Jane Doe'
      expect(current_path).to eq(user_path(@user2))

      click_link 'Jack Doe'
      expect(current_path).to eq(user_path(@user3))
    end
  end
end
