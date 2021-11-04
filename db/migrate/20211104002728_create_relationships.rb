class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.integer :follower_id
      t.integer :followed_id

      #一度フォローしたユーザーを２度フォローしてしまわないようにするための一意の設定
      t.index [:follower_id, :followed_id], unique: true

      t.timestamps
    end
  end
end

