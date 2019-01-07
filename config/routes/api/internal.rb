# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :internal do
      resources :menus,  only: :show
    end
  end
end
