Rails.application.routes.draw do
    
  namespace :admin do
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
    root to: "homes#top"
  end
  
  namespace :public do
    root to: "homes#top"
    get 'homes/about'
    resources :items, only: [:index, :show]
  end
  
  devise_for :admins
  devise_for :costomers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
