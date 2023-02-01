Rails.application.routes.draw do
    
  namespace :admin do
    resources :sessions, only: [:new, :create, :destroy]
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
