class Api::UsersController < ApplicationController

  def index
    @users = User.all.with_attached_avatar
    render json: @users.map { |user|
      if user.avatar.attached?
        user.as_json.merge({ image: url_for(user.avatar) })
      end
    }
  end

  def create
    user = User.find_or_create_by(
      username: params[:username],
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email]
    )
    user.avatar.attach(params[:avatar])
  end

  private

  def user_params
    params.require(:user).permit(:username, :avatar)
  end

end
