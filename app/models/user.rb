class User < ApplicationRecord
  has_one_attached :avatar
  has_many :albums
end
