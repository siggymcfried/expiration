# frozen_string_literal: true

Rails.application.routes.draw do
  root 'foods#index'
  get 'auth/:provider/callback', controller: :sessions, action: :create

  resource :sessions, only: %i[create destroy new]

  resources :eaten_foods, only: :update
  resources :trashed_foods, only: :update
  resources :foods, only: %i[index new create edit update]
  resources :users, only: %i[edit destroy]
end
