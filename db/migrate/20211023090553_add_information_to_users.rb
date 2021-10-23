class AddInformationToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :information, :text
  end
end
