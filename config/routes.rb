# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'users#index'
  get '/users', to: 'users#index', as: 'users'

  get '/users/:id', to: 'users#show', as: 'user'

  get '/users/:user_id/posts', to: 'posts#index', as: 'user_posts'
  get '/users/:user_id/posts/new', to: 'posts#new', as: 'new_user_post'
  post '/users/:user_id/posts', to: 'posts#create'
  get '/users/:user_id/posts/:id', to: 'posts#show', as: 'user_post'
  delete '/users/:user_id/posts/:id', to: 'posts#destroy', as: 'destroy_user_post'
  get '/users/:user_id/posts/:post_id/new', to: 'comments#new', as: 'new_comment'
  post '/users/:user_id/posts/:post_id', to: 'comments#create', as: 'create_comment'
  delete '/users/:user_id/posts/:post_id/:id', to: 'comments#destroy', as: 'destroy_comment'

  post '/users/:user_id/posts/:post_id/likes', to: 'likes#create', as: 'create_like'
  # get '/users/*path', to: 'users#invalid_user', constraints: { path: %r{[^/]+} }, as: 'invalid_user'
end
