class AlbumSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :images, :name

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

  # def images
  #   @album = self.object
  #   arrayOfImages = []
  #   @album.images.map { |img|
  #     hashOfImages = Hash.new
  #     hashOfImages.store("image_url", url_for(img))
  #     hashOfImages.store("id",img.id)
  #     arrayOfImages.push(hashOfImages)
  #   }
  #   arrayOfImages
  # end

  # def images
  #   self.object.images
  # end

  def images
    self.object.map { |img|
    arrayOfImageLinks = []
    arrayOfImageLinks.push(url_for(img))
    }
    arrayOfImageLinks
  end
end
