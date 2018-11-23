=begin
Rails.application.routes.draw do
  get 'dashboard/index'
  devise_for :users
  #get 'home/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
end
=end

Rails.application.routes.draw do
  devise_for :users
  
  authenticated :user do
    root to: "dashboard#index", as: :authenticated_root
  end
 
  unauthenticated :user do
    root to: "home#index"
  end
end