class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :title
      t.string :description
      t.string :status
      t.string :category
      t.date :date
      t.time :time
      t.integer :capacity
      t.string :dresscode
      t.references :venues, null: false, foreign_key: true
      t.references :users, null: false, foreign_key: true

      t.timestamps
    end
  end
end
