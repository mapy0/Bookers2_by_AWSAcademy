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

  #--------Followed---------------------------------------------
  #:following_relationships…モデルを架空で作成。
  #class_name: "Relationship" foreign_key: "followed_id" …Relationshipモデルのfollower_idを参考に、followed_relationshipsモデルへアクセスする
   has_many :followed_relationships, foreign_key: "followed_id", class_name: "Relationship",  dependent: :destroy

  #through: :followed_relationshipsで、中間テーブルにfollowed_relationshipsテーブルを指定。
  #結果、user.followedと打つと、userが中間テーブルfollowed_relationships を取得、その1つ1つのfollowing_idから「フォローしているUser達」を取得できるようになる。
   has_many :followeds, through: :followed_relationships, source: :followed
  #--------Followed---------------------------------------------

  #--------Follower---------------------------------------------
   has_many :follower_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
   has_many :followers, through: :follower_relationships, source: :follower
  #--------Follower---------------------------------------------

  #フォローしているかを確認するメソッド
  #followed_relationshipsテーブルのfollowed_idにuserのidが存在するか確認。あればtrueを返す。ここ違う？
  def followed?(user)
    followed_relationships.find_by(followed_id: user)
  end
  # こう？
  # def folloed?(user)
  #   followed_user.include?(user)
  # end

  #フォローするときのメソッド
  #このメソッドが呼び出されたときには、followed_idにuser.idを代入。
  def follow(user)
    followed_relationships.create!(following_id: user.id) #!の意味？
  end

  #フォローを外すときのメソッド
  #このメソッドが呼び出されたときには、followed_idのuser.idを削除。
  def unfollow(user) #(user_id)?
    followed_relationships.find_by(following_id: user.id).destroy
  end



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
