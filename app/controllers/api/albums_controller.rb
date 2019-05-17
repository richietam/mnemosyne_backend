class Api::AlbumsController < ApplicationController

  def index
    @albums = Album.all.with_attached_images

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


  def create
    byebug
    album = Album.create(
      name: params[:name],
      date: params[:date],
      user_id: params[:user_id]
    )
    album.images.attach(params[:images])
  end

  private

  def album_params
    params.require(:album).permit(:name, :date, images: [])
  end

end
