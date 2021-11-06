class Relationship < ApplicationRecord
    #自分をフォローしているユーザー
    belongs_to :follower, class_name: "User" #(follower=follower_id)
    #自分がフォローしているユーザー
    belongs_to :followed, class_name: "User" #(followed=followed_id)
    #class_name: "User" と補足設定することで、
    #followerクラス、followingクラスという存在しないクラスを参照することを防ぎ、
    #Userクラスであることを明示。

    #バリデーション
    validates :follower_id, presence: true
    validates :followed_id, presence: true
end
