class User < ApplicationRecord
  has_one_attached :avatar
  has_many :albums

  validates :username, uniqueness: true
  has_secure_password
end
