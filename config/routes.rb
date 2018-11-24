=begin
Rails.application.routes.draw do
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
  #get 'artists/show'
  #get 'categories/show'
  #get 'search/index'
  #get 'search/new'
  devise_for :users
  
  authenticated :user do
    root to: "dashboard#index", as: :authenticated_root
    resources :search, only: [:index, :new], as: :searches
    resources :categories, only: :show
    resources :artists, only: :show
  end
 
  unauthenticated :user do
    root to: "home#index"
  end
end