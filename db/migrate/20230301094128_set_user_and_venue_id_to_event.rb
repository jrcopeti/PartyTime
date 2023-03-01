class SetUserAndVenueIdToEvent < ActiveRecord::Migration[7.0]
  def change
    rename_column :events, :users_id, :user_id
    rename_column :events, :venues_id, :venue_id
  end
end
