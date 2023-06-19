require 'rails_helper'

RSpec.describe 'Post', type: :feature do
  before do
    # Create a user and log in before each test
    @user = User.create(Name: 'John Doe', Bio: 'John Doe is a bio', PostCounter: 0, Photo:'https://unsplash.com/photos/F_-0BxGuVvo')
  end

  it 'displays the correct content' do
    visit root_path
    expect(page).to have_content('You are logged in as: John Doe')
  end
end
