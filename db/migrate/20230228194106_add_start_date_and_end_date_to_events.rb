class AddStartDateAndEndDateToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :start_date, :date
    add_column :events, :end_date, :date
    add_column :events, :start_time, :time
    add_column :events, :end_time, :time
    remove_column :events, :date
    remove_column :events, :time
  end
end
