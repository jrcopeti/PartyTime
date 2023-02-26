class RemoveAttributesFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :first_name
    remove_column :users, :last_name
    remove_column :users, :nickname
    remove_column :users, :bio
  end
end
