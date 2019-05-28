class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.integer :user_id
      t.string :type
      t.integer :followed_user
      t.integer :album_created_id

      t.timestamps
    end
  end
end
