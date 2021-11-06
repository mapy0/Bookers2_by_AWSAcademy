Rails.application.routes.draw do

  #Top page Root
  root to: 'homes#top'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #About page Root
  get 'home/about' => 'homes#about'

  #投稿bookに対してコメントされるためbook_commentsは、booksにdoとendで親子に。
  resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update]do
    resource :favorites, only: [:create, :destroy]
    #resource(単数)に注目。単数にすると、そのコントローラのidがリクエストに含まれなくなる。いいねの詳細ページ(=favoritesのshowページ)が不要で、idの受け渡しも必要ないので、resourceとなる。
    resources :book_comments, only: [:create, :destroy]
    end
  #only:生成ルーティング限定
  resources :users, only: [:show, :edit, :update, :index]do #followにはuserのidが必要なためrelationshipsをネスト
      member do #resourcesは7つのルーティングを行ってるが、memberを用いて別のルーティングを追加。
          get :followeds, :followers #follow機能フォローユーザーとフォロワーを取れる(GET)。
      end
      resource :relationships, only: [:create, :destroy]
  end



end
