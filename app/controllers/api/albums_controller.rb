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
    album = Album.create(name: params[:name], date: params[:date], user_id: params[:user_id])
    album.images.attach(params[:images])
    render json: album
  end

  def current_album
    album_id = request.headers["Authorization"]
    album = Album.find(album_id)
    render json: album
  end

  private

  def album_params
    params.require(:album).permit(:name, :date, :images, :id)
  end

end
