class AddStartDateAndEndDateToEvents < ActiveRecord::Migration[7.0]
  def change
    remove_column :events, :start_date
    remove_column :events, :end_date
    remove_column :events, :start_time
    remove_column :events, :end_time
    add_column :events, :start_date, :datetime
    add_column :events, :end_date, :datetime
  end
end
