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
    arrayOfImages = []
    @album.images.map { |img|
      hashOfImages = Hash.new
      hashOfImages.store("image_url", url_for(img))
      hashOfImages.store("id",img.id)
      arrayOfImages.push(hashOfImages)
    }
    arrayOfImages
  end

  #make an image serializer
  #include attributes id or blob id
  #method on image model for image url





end
