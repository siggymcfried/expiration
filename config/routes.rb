# frozen_string_literal: true

Rails.application.routes.draw do
  root 'food_items#index'

  resources :sessions, only: [:create, :new] do
    collection do
      get :logout
      delete :destroy
    end
  end

  get 'auth/google_oauth2/callback', controller: :sessions, action: :create

  resources :food_items, only: [:index, :new, :create, :edit, :update] do
    post :finish_eating
    post :throw_out
  end
  resources :users, only: [:edit, :destroy]
end
