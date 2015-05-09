Rails.application.routes.draw do
  get 'sessions/login'
  post 'sessions/login_attempt'
  get 'sessions/logout'

  root 'food_items#index'

  resources :food_items, only: [:index, :new, :create] do
    post :finish_eating
    post :throw_out
  end
  resources :users, only: [:new, :create]
end
