class RemoveInformationFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :information, :text
  end
end
