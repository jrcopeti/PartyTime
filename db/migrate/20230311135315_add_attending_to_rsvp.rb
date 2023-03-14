class AddAttendingToRsvp < ActiveRecord::Migration[7.0]
  def change
    add_column :rsvps, :current_attending, :boolean, default: false
  end
end
