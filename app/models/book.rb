class Book < ApplicationRecord
  
  #user model relation
  belongs_to :user
  
  #book投稿バリテーション
  validates :title, presence: true
  validates :body, presence: true
  
end
