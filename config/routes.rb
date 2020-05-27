Rails.application.routes.draw do
  devise_for :end_users , controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }
  devise_for :admins , controllers: {
    sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "public/items#top"
  get "/items" , to: "public/items#index" , as: "public_items"
  get "/items/:id" , to: "public/items#show" , as: "public_item"

  get "/end_users/mypage" , to: "public/end_users#show"

  namespace :admin do
    root to: "top#top"
  end
end
