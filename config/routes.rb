require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => "/sidekiq" # mount Sidekiq::Web in your Rails app
  get 'subscriptions/new'
  post 'subscriptions/update'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
