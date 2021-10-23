Rails.application.routes.draw do
  
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #Top page Root
  root to: 'homes#top'
  
  #About page Root
  get 'about_page/about'

  resources :books, only: [:new, :create, :index, :show, :destroy]
  resources :users, only: [:show, :edit, :update, :index]#only:生成ルーティング限定
end
