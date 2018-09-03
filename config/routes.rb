# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'menus#index'

  devise_for :users, controllers: { registrations: 'registrations' }

  resources :orders
  resources :items
  resources :menus
  resources :users
end
