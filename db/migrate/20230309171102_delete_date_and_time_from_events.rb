class DeleteDateAndTimeFromEvents < ActiveRecord::Migration[7.0]
  def change
    remove_column :events, :date
    remove_column :events, :time
  end
end
