Rails.application.routes.draw do
  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  resources :books do 
    collection do
      get 'top_rated_books'
      get 'top_selling_books'
      get 'search'
      get 'search_result'
    end
  end
  resources :authors do
    get 'crud', on: :collection
  end
  resources :reviews
  resources :sales_by_years
  root 'home#index'
end
