Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #Top page Root
  root to: 'homes#top'

  resources :books, only: [:new, :create, :index, :show, :destroy]
  #only:生成ルーティング限定
end
