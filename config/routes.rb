Rails.application.routes.draw do
  resources :user_recipes, only: [:index]
  resources :ingredients
  resources :recipes, only: [:index, :create, :destroy]
  # custom url for recipe summary
  get '/recipe/summary', to:'recipes#summary'
  resources :users, only: [:index, :show, :update, :destroy, :create]
  resources :admins
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
