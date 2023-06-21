require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    it 'Returns a sucesfull response' do
      get user_posts_url(1, 1)
      expect(response).to be_successful
      expect(response).to have_http_status(200)
    end

    it 'Renders the index template' do
      get user_posts_url(1, 1)
      expect(response).to render_template(:index)
    end

    it 'Include correct placeholder text in response body' do
      get user_posts_url(1, 1)
      expect(response.body).to include('All the post of the user')
    end
  end

  describe 'GET /show' do
    it 'Returns a sucesfull response' do
      get user_post_url(1, 1)
      expect(response).to be_successful
      expect(response).to have_http_status(200)
    end

    it 'Renders the show template' do
      get user_post_url(1, 1)
      expect(response).to render_template(:show)
    end

    it 'Include correct placeholder text in response body' do
      get user_post_url(1, 1)
      expect(response.body).to include('All the details of a post from specified user ')
    end
  end
end
