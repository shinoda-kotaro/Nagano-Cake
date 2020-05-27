Rails.application.routes.draw do
  devise_for :admins
  devise_for :end_users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "public/items#top"
  get "/items" , to: "public/items#index" , as: "public_items"
  get "/items/:id" , to: "public/items#show" , as: "public_item"

  get "/end_users/mypage" , to: "public/end_users#show"
end
