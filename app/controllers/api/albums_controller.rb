class Api::AlbumsController < ApplicationController

  def index
    @albums = Album.all
    render json: @albums.map { |album|
      arrayOfImageLinks = []
      if album.images.attached?
        album.images.map { |img|
          arrayOfImageLinks.push(url_for(img))
        }
        album.as_json.merge({images: arrayOfImageLinks })
      end
    }
  end

  def show
    @album = Album.find_by(id: params[:id])
    render json: @album
  end

  def create
    album = Album.create(
      name: params[:name],
      date: params[:date],
      user_id: params[:user_id]
    )
    album.images.attach(params[:images])
    user = User.find_by(id: params[:user_id])
    newActivity = Activity.create(
      user_id: params[:user_id],
      activity_owner_username: user.username,
      activity_type: "newAlbum",
      album_created_id: album.id
    )
    render json: album
  end

  def current_album
    album_id = request.headers["Authorization"]
    album = Album.find(album_id)
    render json: album
  end

  def deleteImage
    image = ActiveStorage::Attachment.find(params[:image_id])
    album = Album.find(image.record_id)
    image.purge
    render json: album
  end

  def deleteAlbum
    album = Album.find_by(id: params[:album_id])
    album.destroy
    render json: album
  end

  private

  def album_params
    params.require(:album).permit(:name, :date, :images, :id)
  end

end
