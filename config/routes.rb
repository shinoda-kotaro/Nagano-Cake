Rails.application.routes.draw do
  devise_for :end_users , controllers: {
    registrations: "publics/registrations",
    sessions: "publics/sessions",
    passwords: "publics/passwords"
  }
  devise_for :admins , controllers: {
    sessions: "admins/sessions"
  }
  devise_scope :end_user do
    get "/logout" , to: "publics/sessions#destroy" , as: "end_users_logout"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #publics
  #-root
  root to: "publics/items#top"
  #-items
  get "/items" , to: "publics/items#index" , as: "end_users_items"
  get "/items/:id" , to: "publics/items#show" , as: "end_users_item"
  #-end_users
  get "/end_users/mypage" , to: "publics/end_users#show"
  get "/end_users/check" , to: "publics/end_users#check"
  patch "/end_users/delete" , to: "publics/end_users#withdrawal"
  #-cart_items
  get "/cart_items" , to: "publics/cart_item#index"
  post "/cart_items" , to: "publics/cart_item#create"
  patch "/cart_items/:id" , to: "publics/cart_item#update" , as: "cart_item"
  delete "/cart_items/delete_all" , to: "publics/cart_item#all_destroy" , as: "cart_items_all_destroy"
  delete "/cart_items/:id" , to: "publics/cart_item#destroy"
  #-orders
  get "/orders/new" , to: "publics/orders#new"
  get "/orders" , to: "publics/orders#index"
  post "orders/check" , to:"publics/orders#check" , as: "check_order_path"
  post "/orders" , to: "publics/orders#create"
  #-addresses
  get "/addresses" , to: "publics/addresses#index"
  post "/addresses" , to: "publics/addresses#create"
  get "/addresses/:id/edit" , to: "publics/addresses#edit" , as: "edit_address"
  patch "/addresses/:id" , to: "publics/addresses#update" , as: "address"
  delete "/addresses/:id" , to: "publics/addresses#destroy"
  
  #admins
  namespace :admins do
    root to: "top#top"
    
    get "/end_users" , to: "end_users#index"
    resources :items, only: [:edit, :update, :show, :index, :new, :create]
    resources :genres, only: [:edit, :update, :index, :create]  
  end
end
