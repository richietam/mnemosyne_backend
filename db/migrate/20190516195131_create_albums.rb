class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.string :user_id
      t.string :integer

      t.timestamps
    end
  end
end
