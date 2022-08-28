Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "lists#home"
  resources :movies, only: [:index, :show]

  resources :blogs, only: [:index, :show, :new, :create, :destroy]

  resources :lists, only: [:index, :show, :new, :create]
end
