Rails.application.routes.draw do

  namespace :admin do
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
    root to: "homes#top"
  end
  
  namespace :public do
    root to: "homes#top"
    get 'homes/about'
    resources :items, only: [:index, :show]
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    resources :orders, only: [:new, :comfirm, :complete, :create, :index, :show]
    
    resources :cart_items, only: [:index, :update, :destroy, :destroy_all, :create]
  end
  
  #管理者
  devise_for :admins
  #客
  devise_for :customers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
