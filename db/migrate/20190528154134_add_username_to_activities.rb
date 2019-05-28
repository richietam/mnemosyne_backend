class AddUsernameToActivities < ActiveRecord::Migration[5.2]
  def change
    add_column :activities, :activity_owner_username, :string
    add_column :activities, :followed_user_username, :string
    add_column :activities, :album_created_username, :string
  end
end
