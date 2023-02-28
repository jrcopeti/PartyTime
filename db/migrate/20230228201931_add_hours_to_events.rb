class AddHoursToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :starts_at, :date
    add_column :events, :ends_at, :date
    add_column :events, :start_time, :time
    add_column :events, :end_time, :time
  end
end
