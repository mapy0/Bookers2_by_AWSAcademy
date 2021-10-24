class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  #book model relation       
  has_many :books, dependent: :destroy
  
  #refile使用のため
  attachment :profile_image
  
  #バリテーションエラー
  validates :name, uniqueness: true, length: {minimum:2, maximum: 20 }
  
  validates :introduction, length: {maximum: 50 }
  
  
  
end

#:database_authenticatable（パスワードの正確性を検証）
#:registerable（ユーザ登録や編集、削除）
#:recoverable（パスワードをリセット）
#:rememberable（ログイン情報を保存）
#:validatable（emailのフォーマットなどのバリデーション）
