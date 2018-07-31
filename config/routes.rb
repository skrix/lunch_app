# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'users#index'

  devise_for :users

  resources :users

  namespace :api do
    namespace :v1 do
      resources :users, only: [:index]
    end
  end
end
