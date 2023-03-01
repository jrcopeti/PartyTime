class SetEventAndUserIdToReviews < ActiveRecord::Migration[7.0]
  def change
    rename_column :reviews, :events_id, :event_id
    rename_column :reviews, :users_id, :user_id
  end
end
