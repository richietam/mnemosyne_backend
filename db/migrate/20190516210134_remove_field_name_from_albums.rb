class RemoveFieldNameFromAlbums < ActiveRecord::Migration[5.2]
  def change
    remove_column :albums, :integer, :string
  end
end
