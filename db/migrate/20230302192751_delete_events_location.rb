class DeleteEventsLocation < ActiveRecord::Migration[7.0]
  def change
    remove_column :events, :latitude
    remove_column :events, :longitude
  end
end
