class CreateArtists < ActiveRecord::Migration[7.0]
  def change
    create_table :artists do |t|
      t.string :name
      t.string :about
      t.string :genre
      t.string :link

      t.timestamps
    end
  end
end
