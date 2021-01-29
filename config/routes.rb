Rails.application.routes.draw do
  resources :images
  devise_for :users
  get '/upload', to: 'images#new'
  root 'images#index'
  get "/search", to: "images#search"
  get '/@:username', to: 'users#show', as: :profile
  resources :images, only: [:index, :show, :create]

  delete 'images/:id(.:format)', :to => 'images#destroy'
end