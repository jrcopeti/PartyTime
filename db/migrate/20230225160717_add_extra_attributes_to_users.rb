class AddExtraAttributesToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :first_name
    add_column :users, :last_name
    add_column :users, :nickname
    add_column :users, :bio
  end
end
