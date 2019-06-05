class UserSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :first_name, :last_name, :username, :avatar, :photosUploaded, :newsFeed

  has_many :followers
  has_many :activities
  has_many :followed_users
  has_many :followings
  has_many :albums do
    object.albums.order(:id)
  end

  def photosUploaded
    numPhotos = 0
    self.object.albums.each do |album|
      numPhotos += album.images.count
    end
    numPhotos
  end

  def newsFeed
    activitiesArr = []
    self.object.followed_users.each do |user|
      activitiesArr.concat(user.activities)
    end
    activitiesArr.reverse
  end

  def followed_user_ids
    followedUserIds = []
    if self.object.followed_users
        self.object.followed_users.map { |user|
          followedUserIds.push(user.id)
        }
    end
    followedUserIds
  end

  def avatar
    self.object.avatar.service_url
  end

end
