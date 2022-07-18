Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "photos#index"
  resources :photos, only: [:index, :new, :create]
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  get    'oauth/callback' => 'oauth#callback'
  post    'oauth/tweet' => 'oauth#tweet'
end
