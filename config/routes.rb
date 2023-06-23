# frozen_string_literal: true

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }

  namespace :api do
    namespace :v1 do
      post 'login', to: 'login#auth'
      resources :users, only: [:index, :show] do
        resources :posts, only: [:index] do
          resources :comments, only: [:index, :create]
        end
      end
    end
  end

  
  root 'users#index'
  get '/users', to: 'users#index', as: 'users'

  get '/users/:id', to: 'users#show', as: 'user'

  get '/users/:user_id/posts', to: 'posts#index', as: 'user_posts'
  get '/users/:user_id/posts/new', to: 'posts#new', as: 'new_user_post'
  post '/users/:user_id/posts', to: 'posts#create'
  get '/users/:user_id/posts/:id', to: 'posts#show', as: 'user_post'
  delete '/users/:user_id/posts/:id', to: 'posts#destroy', as: 'destroy_user_post'
  get '/users/:user_id/posts/:post_id/comments', to: 'comments#index', as: 'comments'
  get '/users/:user_id/posts/:post_id/new', to: 'comments#new', as: 'new_comment'
  post '/users/:user_id/posts/:post_id', to: 'comments#create', as: 'create_comment'
  delete '/users/:user_id/posts/:post_id/:id', to: 'comments#destroy', as: 'destroy_comment'

  post '/users/:user_id/posts/:post_id/likes', to: 'likes#create', as: 'create_like'
end
