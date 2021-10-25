class Book < ApplicationRecord

  #user model relation
  belongs_to :user

  #book投稿バリテーション
  validates :title, presence: true
  validates :body, length: { minimum: 1, maximum: 200 }#文字数は、1文字から200文字まで

end
