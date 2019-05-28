class ChangeActivitiesColumnFollowedUser < ActiveRecord::Migration[5.2]
  def change
      rename_column :activities, :followed_user, :followed_user_id
      rename_column :activities, :user_id, :activity_owner_user_id
  end
end
