# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'menus#index'

  devise_for :users

  resources :items
  resources :menus
  resources :users
end
