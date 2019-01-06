# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'menus#index'

  devise_for :users, controllers: { registrations: 'registrations' }

  resources :orders
  resources :items
  resources :menus
  resources :users

  namespace :api do
    namespace :v1 do
      resources :menus,  only: :show
      resources :orders, only: :index
    end
  end

  namespace :api do
    namespace :internal do
      resources :menus,  only: :show
    end
  end
end
