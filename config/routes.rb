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
  
  #admins
  namespace :admins do
    root to: "top#top"
    
    get "/end_users" , to: "end_users#index"
  end
end
