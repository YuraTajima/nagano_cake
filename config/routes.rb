Rails.application.routes.draw do

  # 顧客用
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # 管理者用
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  
  namespace :admin do
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
    resources :customers, only: [:index, :show, :edit, :update]
    root to: "homes#top"
  end
  
  #homes
  root to: "public/homes#top"
  get "/about" => "public/homes#about"
  
  #items
  get "/items" => "public/items#index"
  get "/items/:id" => "public/items#show", as: "show_items"
  post "/items" => "public/items#create"
  
  #cart_items
  get "/cart_items" => "public/cart_items#index"
  post "/cart_items" => "public/cart_items#create"
  patch  "/cart_items/:id" => "public/cart_items#update", as: "update_cart_items"
  delete "/cart_items/destroy_all" => "public/cart_items#destroy_all"
  delete "/cart_items/:id" => "public/cart_items#destroy", as: "destroy_cart_items"
  
  #orders
  get "/orders/new" => "public/orders#new"
  post "/orders/comfirm" => "public/orders#comfirm"
  get "/orders/complete" => "public/orders#complete"
  post "/orders" => "public/orders#create"
  get "/orders" => "public/orders#index"
  get "/orders/:id" => "public/orders#show"
  
  #addresses
  get "/addresses" => "public/addresses#index"
  get "/addresses/:id/edit" => "public/addresses#edit", as: "edit_addresses"
  post "/addresses" => "public/addresses#create"
  patch "/addresses/:id" => "public/addresses#update", as: "update_addresses"
  delete "/addresses/:id" => "public/addresses#destroy", as: "destroy_addresses"
  
  #customers
  get "/customers/my_page" => "public/customers#show"
  get "/customers/information/edit" => "public/customers#edit"
  patch "/customers/information" => "public/customers#update"
  get "/customers/unsubscribe" => "public/customers#unsubscribe"
  patch "/customers/withdraw" => "public/customers#withdraw"
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
