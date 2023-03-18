class AddEventIdToChatroomsNull < ActiveRecord::Migration[7.0]
  def change
    change_column_null :chatrooms, :event_id, true
  end
end
