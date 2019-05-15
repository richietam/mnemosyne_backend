class Api::UsersController < ApplicationController

  def index
    @users = User.all.with_attached_avatar
    render json: @users.map { |user|
      user.as_json.merge({ image: url_for(user.avatar) })
    }
  end

  def create
    user = User.find_or_create_by(username: params[:username])
    user.avatar.attach(params[:avatar])
  end

  private

  def user_params
    params.require(:user).permit(:username, :avatar)
  end

end
