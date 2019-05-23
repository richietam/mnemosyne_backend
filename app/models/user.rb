class User < ApplicationRecord
  has_one_attached :avatar
  has_many :albums

  has_many :followings
  has_many :followed_users, through: :followings

  has_many :followers, foreign_key: :followed_user_id, class_name: 'Following'
  has_many :follower_users, through: :followers, source: :user


  validates :username, uniqueness: true
  has_secure_password
end
