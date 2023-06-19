require 'rails_helper'

RSpec.describe 'User post index page', type: :feature do
  before do
    # Create a user and posts before each test
    @user1 = User.create(Name: 'John Doe', Bio: 'John Doe is a bio', PostCounter: 3, Photo:'https://unsplash.com/photos/F_-0BxGuVvo')
   
    @post1 = Post.create(Title: 'Post 1', Text: 'This is the body of Post 1', CommentsCounter: 2, LikesCounter: 5, author: @user1)
    @post2 = Post.create(Title: 'Post 2', Text: 'This is the body of Post 2', CommentsCounter: 1, LikesCounter: 3, author: @user1)

    @comment1 = Comment.create(Text: 'This is the body of Comment 1', author: @user1, post: @post1)
    @comment2 = Comment.create(Text: 'This is the body of Comment 2', author: @user1, post: @post1)
    @comment3 = Comment.create(Text: 'This is the body of Comment 3', author: @user1, post: @post2)
  end

  it 'displays the user\'s profile picture' do
    visit user_posts_path(@user1)

    expect(page).to have_selector("img[src='https://unsplash.com/photos/F_-0BxGuVvo']")
  end

  it 'displays the user\'s username' do
    visit user_posts_path(@user1)

    expect(page).to have_content('You are logged in as: John Doe')
    expect(page).to have_content('You')
  end

  it 'displays the number of posts the user has written' do
    visit user_posts_path(@user1)

    expect(page).to have_content('Number of posts: 3')
  end

  it 'displays a post\'s title and body' do
    visit user_posts_path(@user1)

    expect(page).to have_content('Post 1')
    expect(page).to have_content('This is the body of Post 1')
    expect(page).to have_content('Post 2')
    expect(page).to have_content('This is the body of Post 2')
  end

  it 'displays the first comments on a post' do
    visit user_posts_path(@user1)

    expect(page).to have_content('This is the body of Comment 1')
    expect(page).to have_content('This is the body of Comment 2')
    expect(page).to have_content('This is the body of Comment 3')

  end

  it 'displays the number of comments a post has' do
    visit user_posts_path(@user1)

    expect(page).to have_content('Comments: 2')
    expect(page).to have_content('Comments: 1')
  end

  it 'displays the number of likes a post has' do
    visit user_posts_path(@user1)

    expect(page).to have_content('Likes: 5')
    expect(page).to have_content('Likes: 3')
  end

  it 'displays a section for pagination if there are more posts than fit on the view' do
    # Create additional posts to trigger pagination
    @post3 = Post.create(Title: 'Post 3', Text: 'This is the Text of Post 3', CommentsCounter: 0, LikesCounter: 0, author: @user1)
    @post4 = Post.create(Title: 'Post 4', Text: 'This is the body of Post 4', CommentsCounter: 0, LikesCounter: 0, author: @user1)
    @post5 = Post.create(Title: 'Post 5', Text: 'This is the body of Post 5', CommentsCounter: 0, LikesCounter: 0, author: @user1)

    visit user_posts_path(@user1)
    
    expect(page).to have_selector('.btnPosts')
  end
  
  it 'redirects to a post\'s show page when clicking on a post' do
    visit user_posts_path(@user1)
    click_link @post1.Title
    expect(page).to have_current_path("/users/#{@user1.id}/posts/#{@post1.id}")
    
    visit user_posts_path(@user1)
    click_link @post2.Title

    expect(page).to have_current_path("/users/#{@user1.id}/posts/#{@post2.id}")
  end
end
