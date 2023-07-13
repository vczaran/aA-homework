Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api, defaults: { format: :json } do

    resources :guests, only: [:index, :show] do 
      resources :gifts, only: [:index]
    end

    resources :parties, only: [:index, :show]
    resources :gifts, only: [:show]

  end

end