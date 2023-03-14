class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    set_user
    @rsvps = @user.rsvps
  end

  def dashboard
    # current_user Profile page
    @user = current_user
    @rsvps = @user.rsvps
  end


  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path(current_user), notice: "Your profile has been updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end


  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:full_name, :nickname, :bio, :avatar_url, :photo)
  end
end
