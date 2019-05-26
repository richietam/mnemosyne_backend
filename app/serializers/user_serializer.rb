class UserSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :first_name, :last_name, :username, :avatar

  has_many :followers
  has_many :followed_users
  has_many :followings
  has_many :albums do
    object.albums.order(:id)
  end

  # def followed_user_ids
  #   followedUserIds = []
  #   if self.object.followed_users
  #       self.object.followed_users.map { |user|
  #         followedUserIds.push(user.id)
  #       }
  #   end
  #   followedUserIds
  # end

  def avatar
    if !self.object.avatar.attachment.nil?
      url_for(self.object.avatar)
    else
      "https://react.semantic-ui.com/images/avatar/large/matthew.png"
    end
  end

end
