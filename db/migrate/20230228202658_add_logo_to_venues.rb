class AddLogoToVenues < ActiveRecord::Migration[7.0]
  def change
    add_column :venues, :logo, :string
  end
end
