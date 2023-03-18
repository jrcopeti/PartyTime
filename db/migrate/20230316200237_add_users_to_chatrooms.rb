class AddUsersToChatrooms < ActiveRecord::Migration[7.0]
  def change
    add_column :chatrooms, :users, :string, array: true, default:[]
  end
end
