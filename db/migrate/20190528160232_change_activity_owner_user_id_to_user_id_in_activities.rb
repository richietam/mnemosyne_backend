class ChangeActivityOwnerUserIdToUserIdInActivities < ActiveRecord::Migration[5.2]
  def change
    rename_column :activities, :activity_owner_user_id, :user_id
  end
end
