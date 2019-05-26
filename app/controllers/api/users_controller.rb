class Api::UsersController < ApplicationController

  def index
    @users = User.all

    render json: @users.map { |user|
      if user.avatar.attached?
        UserSerializer.new(user).as_json.merge({ avatar: url_for(user.avatar)})
      else
        UserSerializer.new(user).as_json.merge({ image: "https://react.semantic-ui.com/images/avatar/large/matthew.png"})
      end
    }
  end

  def show
    @user = User.find_by(id: params[:id])
    render json: @user
  end


  def create
    user = User.new(
      username: params[:username],
      password: params[:password],
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email]
    )
    if user.save
      user.avatar.attach(params[:avatar])
      render json: user
    else
      render json: {errors: user.errors.full_messages}
    end
  end

  def createFollowing
    following = Following.new(user_id: params[:user_id], followed_user_id: params[:followed_user_id])
    user = User.find_by(id: params[:user_id])
    if following.save
    render json: user
    else
      render json: {errors: user.errors.full_messages}
    end
  end

  def deleteFollowing
    following = Following.find_by(user_id: params[:user_id], followed_user_id: params[:followed_user_id])
    user = User.find_by(id: params[:user_id])
    if following.destroy
    render json: user
    else
      render json: {errors: user.errors.full_messages}
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :avatar, :image_id, :password, :user_id, :followed_user_id)
  end

end
