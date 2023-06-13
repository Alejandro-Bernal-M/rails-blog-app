require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it 'Returns a sucesfull response' do
      get users_url
      expect(response).to be_successful
      expect(response).to have_http_status(200)
    end

    it 'Renders the index template' do
      get users_url
      expect(response).to render_template(:index)
    end

    it 'Include correct placeholder text in response body' do
      get users_url
      expect(response.body).to include('List of all users')
    end
  end

  describe 'GET /show' do
    it 'Returns a sucesfull response' do
      get user_url(1)
      expect(response).to be_successful
      expect(response).to have_http_status(200)
    end

    it 'Renders the show template' do
      get user_url(1)
      expect(response).to render_template(:show)
    end

    it 'Include correct placeholder text in response body' do
      get user_url(1)
      expect(response.body).to include('users details')
    end
  end
end
