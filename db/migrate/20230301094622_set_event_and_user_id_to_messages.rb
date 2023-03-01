class SetEventAndUserIdToMessages < ActiveRecord::Migration[7.0]
  def change
    rename_column :messages, :events_id, :event_id
    rename_column :messages, :users_id, :user_id
  end
end
