Rails.application.routes.draw do
    
  #Top page Root
  root to: 'homes#top'
  
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  
  #About page Root
  get 'about_page/about'

  resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update]
  resources :users, only: [:show, :edit, :update, :index]#only:生成ルーティング限定
end
