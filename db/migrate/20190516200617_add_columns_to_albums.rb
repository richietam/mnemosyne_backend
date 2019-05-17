class AddColumnsToAlbums < ActiveRecord::Migration[5.2]
  def change
    add_column :albums, :name, :string
    add_column :albums, :date, :date
  end
end
