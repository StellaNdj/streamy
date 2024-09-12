Rails.application.routes.draw do
  devise_for :users

  root 'pages#home'

  # Search routes
  get 'search', to: 'search#index'
  get 'search/all', to: 'search#show_all'

  # Other routes
  get 'movies/genre/:genre', to: 'movies#genre_movies', as: 'genre_movies'
  get 'tv_shows/genre/:genre', to: 'tv_shows#genre_tv_shows', as: 'genre_tv_shows'

  resources :movies, only: [:index, :show]
  resources :tv_shows, only: [:index, :show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
