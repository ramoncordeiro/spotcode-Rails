=begin
Rails.application.routes.draw do
  get 'favorites/index'
  get 'favorites/create'
  get 'favorites/destroy'
  get 'albums/show'
  get 'artists/show'
  get 'categories/show'
  get 'search/index'
  get 'search/new'
  get 'dashboard/index'
  devise_for :users
  #get 'home/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
end
=end

Rails.application.routes.draw do
  #get 'favorites/index'
  #get 'favorites/create'
  #get 'favorites/destroy'
  #get 'albums/show'
  #get 'artists/show'
  #get 'categories/show'
  #get 'search/index'
  #get 'search/new'
  devise_for :users
  
  authenticated :user do
    resources :favorites, only: :index
    root to: "dashboard#index", as: :authenticated_root
    resources :search, only: [:index, :new], as: :searches
    resources :categories, only: :show
    resources :artists, only: :show
    resources :albums, only: :show
    resources :songs, only: [] do
      post "/favorite", to: "favorites#create", on: :member, defaults: { format: :js, favoritable_type: 'Song' }
      delete "/favorite", to: "favorites#destroy", on: :member, defaults: { format: :js, favoritable_type: 'Song' }
    end
  end
 
  unauthenticated :user do
    root to: "home#index"
  end
end