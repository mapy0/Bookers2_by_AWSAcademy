class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #book model relation
  has_many :books, dependent: :destroy
  #book_comment model relation
  has_many :book_comments, dependent: :destroy
  #favorite model relation
  has_many :favorites, dependent: :destroy

  #refile使用のため
  attachment :profile_image

  #バリテーションエラー
  validates :name, presence: true, uniqueness: true, length: {minimum:2, maximum: 20 }

  validates :introduction, length: {maximum: 50 }



end

#:database_authenticatable（パスワードの正確性を検証）
#:registerable（ユーザ登録や編集、削除）
#:recoverable（パスワードをリセット）
#:rememberable（ログイン情報を保存）
#:validatable（emailのフォーマットなどのバリデーション）
