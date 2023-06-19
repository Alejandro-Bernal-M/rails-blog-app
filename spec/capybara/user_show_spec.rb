require 'rails_helper'

RSpec.describe 'User show', type: :feature do
  before do
    # Create users and posts before each test
    @user1 = User.create(Name: 'John Doe', Bio: 'John Doe is a bio', PostCounter: 1, Photo:'https://unsplash.com/photos/F_-0BxGuVvo')
    @user2 = User.create(Name: 'Jane Doe', Bio: 'Jane Doe is a bio', PostCounter: 1, Photo:'https://unsplash.com/photos/F_-0BxGuVvo')
    @user3 = User.create(Name: 'Jack Doe', Bio: 'Jack Doe is a bio', PostCounter: 1, Photo:'https://unsplash.com/photos/F_-0BxGuVvo')
    
    @post1 = Post.create(Title: 'Post 1', Text: 'Post 1 is a text', CommentsCounter: 0, LikesCounter: 0, author: @user1)
    @post2 = Post.create(Title: 'Post 2', Text: 'Post 2 is a text', CommentsCounter: 0, LikesCounter: 0, author: @user2)
    @post3 = Post.create(Title: 'Post 3', Text: 'Post 3 is a text', CommentsCounter: 0, LikesCounter: 0, author: @user3)
    @post4 = Post.create(Title: 'Post 4', Text: 'Post 4 is a text', CommentsCounter: 0, LikesCounter: 0, author: @user1)
    @post5 = Post.create(Title: 'Post 5', Text: 'Post 5 is a text', CommentsCounter: 0, LikesCounter: 0, author: @user1)

  end

  scenario 'show user picture' do
    visit user_path(@user1.id)
    expect(page).to have_selector('img[src="https://unsplash.com/photos/F_-0BxGuVvo"]')
  end

  scenario 'show username' do
    visit user_path(@user1.id)
    expect(page).to have_content('You')
  end

  scenario 'show number of posts' do
    visit user_path(@user1.id)
    expect(page).to have_content('Post #1')
  end

  scenario 'show user bio' do
    visit user_path(@user1.id)
    expect(page).to have_content('John Doe is a bio')
  end

  scenario 'show last 3 user posts' do
    visit user_path(@user1.id)
    expect(page).to have_selector('.post-identifier', count: 3)
  end

  scenario 'show view all posts button' do
    visit user_path(@user1.id)
    expect(page).to have_selector('.btnPosts', text: 'See all posts')
  end

  scenario 'clicks on users post redirect to post show page' do
    visit user_path(@user1.id)
    click_link(href: "/users/#{@user1.id}/posts/#{@post1.id}")
    expect(page).to have_current_path("/users/#{@user1.id}/posts/#{@post1.id}")
  end

  scenario 'clicks on sell all posts redirect to posts index page' do
    visit user_path(@user1.id)
    click_button('See all posts')
    expect(page).to have_current_path("/users/#{@user1.id}/posts")
  end
end