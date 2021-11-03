class Book < ApplicationRecord

  #user model relation
  belongs_to :user
  #book_comment model relation
  has_many :book_comments, dependent: :destroy

  #favorite model relation
  has_many :favorites, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  #favorited_by?メソッドを作成。このメソッドで、引数で渡されたユーザidがFavoritesテーブル内に存在（exists?）するかどうかを調べる。
  #存在していればtrue、存在していなければfalseを返すようにしている。すでにいいねしてるかしてないかってこと

  #book投稿バリテーション
  validates :title, presence: true
  validates :body, length: { minimum: 1, maximum: 200 }#文字数は、1文字から200文字まで

end
