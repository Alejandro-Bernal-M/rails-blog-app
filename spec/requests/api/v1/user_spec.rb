# spec/requests/api/v1/users_spec.rb
require 'swagger_helper'

RSpec.describe 'Users API', type: :request do
  path '/api/v1/users' do
    post 'Creates a user' do
      tags 'Users'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          email: { type: :string },
          password: { type: :string }
        },
        required: %w[name email password]
      }

      response '201', 'Created' do
        let(:user) { { name: 'John Doe', email: 'john@example.com', password: 'password' } }
        run_test!
      end

      response '422', 'Unprocessable Entity' do
        let(:user) { { name: 'John Doe', email: 'john@example.com', password: '' } }
        run_test!
      end
    end
  end

  path '/api/v1/users/{id}' do
    parameter name: :id, in: :path, type: :string
    let(:id) { User.create(name: 'John Doe', email: 'john@example.com', password: 'password').id }

    get 'Retrieves a user' do
      tags 'Users'
      produces 'application/json'

      response '200', 'OK' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 name: { type: :string },
                 email: { type: :string }
               },
               required: %w[id name email]

        run_test!
      end

      response '404', 'Not Found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end

  # Define more endpoints...

end
