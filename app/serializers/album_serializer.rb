class AlbumSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :images

  belongs_to :user

  # def images
  #   @album = self.object.images
  #
  #   arrayOfImageLinks = []
  #
  #   @album.map { |img|
  #         arrayOfImageLinks.push(rails_blob_path(img))
  #       }
  #       album.as_json.merge({images: arrayOfImageLinks })
  # end

  def images
    @album = self.object
    arrayOfImageLinks = []
    @album.images.map { |img|
      arrayOfImageLinks.push(url_for(img))
        }
    arrayOfImageLinks
  end





end
