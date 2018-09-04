Rails.application.routes.draw do
  root                           'main#index'
  get 'help'                  => 'main#help'
  get 'signup'                => 'users#new'
  get 'login'                 => 'sessions#new'
  post 'login'                => 'sessions#create'
  delete 'logout'             => 'sessions#destroy'
  get 'competitions'          => 'competitions#index'
  get '/competitions/(:id)'   => 'competitions#select_photos'
  get '/info/(:id)'           => 'competitions#show_info'
  get '/results/(:id)'        => 'competitions#results'

  resources :users do
    member do
      #get :following, :followers #users/1/following users/1/followers
      get 'following'
      get 'followers'
    end
  end

  resources :albums #обеспечивает автоматический вызов всех методов REST
  resources :photos
  resources :values
  resources :comments
  resources :relationships, only: [:create, :destroy]

# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end