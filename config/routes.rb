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
  get "/items/:id" => "public/items#show"
  
  #cart_items
  get "/cart_items" => "public/cart_items#index"
  patch  "/cart_items/:id" => "public/cart_items#update"
  delete "/cart_items/:id" => "public/cart_items#destroy"
  delete "/cart_items/destroy_all" => "public/cart_items#destroy_all"
  post "/cart_items" => "public/cart_items#create"
  
  #orders
  get "/orders/new" => "public/orders#new"
  post "/orders/comfirm" => "public/orders#comfirm"
  get "/orders/complete" => "public/orders#complete"
  post "/orders" => "public/orders#create"
  get "/orders" => "public/orders#index"
  get "/orders/:id" => "public/orders#show"
  
  #addresses
  get "/addresses" => "public/addresses#index"
  get "/addresses/:id/edit" => "public/addresses#edit"
  post "/addresses" => "public/addresses#create"
  patch "/addresses/:id" => "public/addresses#update"
  delete "/addresses/:id" => "public/addresses#destroy"
  
  #customers
  get "/customers/my_page" => "public/customers#show"
  get "/customers/information/edit" => "public/customers#edit"
  patch "/customers/information" => "public/customers#update"
  get "/customers/unsubscribe" => "public/customers#unsubscribe"
  patch "/customers/withdraw" => "public/customers#withdraw"
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
