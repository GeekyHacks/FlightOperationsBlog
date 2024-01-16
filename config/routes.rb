Rails.application.routes.draw do
  # get 'users/:index'
  # get 'users/:show'
  resources :users, only: %i[index show]
  # Defines the root path route ("/")
  # root "posts#index"
end
