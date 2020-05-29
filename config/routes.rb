Rails.application.routes.draw do
  devise_for :end_users , controllers: {
    registrations: "publics/registrations",
    sessions: "publics/sessions"
  }
  devise_for :admins , controllers: {
    sessions: "admins/sessions"
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "publics/items#top"
  get "/items" , to: "publics/items#index" , as: "public_items"
  get "/items/:id" , to: "publics/items#show" , as: "public_item"

  get "/end_users/mypage" , to: "publics/end_users#show"

  namespace :admins do
    root to: "top#top"
  end
end
