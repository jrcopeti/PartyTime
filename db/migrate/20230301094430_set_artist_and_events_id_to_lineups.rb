class SetArtistAndEventsIdToLineups < ActiveRecord::Migration[7.0]
  def change
    rename_column :lineups, :artists_id, :artist_id
    rename_column :lineups, :events_id, :event_id
  end
end
