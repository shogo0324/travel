Rails.application.routes.draw do
  devise_for :users
  get "blogs/index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :blogs do
    resources :likes, only: [:create, :destroy]
  end
  resources :mypage
  resources :users, only: [:show]
  root to: 'blogs#index'
  resources :blogs
get 'blogs/date/:date', to: 'blogs#table', as: 'blogs_table'
 # ← rootはどれか1つに決める
end
