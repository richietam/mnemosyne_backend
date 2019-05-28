class Following < ApplicationRecord
  belongs_to :user
  belongs_to :followed_user, class_name: 'User'
  validate :realism
  # include PublicActivity::Model
  # tracked

private

  def realism
    return unless user_id == followed_user_id
    errors.add :user, 'No can follow self!!'
  end
end
