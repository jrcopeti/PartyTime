class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :follow, :unfollow, :accept, :decline, :cancel]

  def index
    @users = User.all
  end

  def show
    @rsvps = @user.rsvps
  end

  def dashboard
    # current_user Profile page
    @user = current_user
    @rsvps = @user.rsvps
  end

  def follow
    current_user.send_follow_request_to(@user)
    redirect_to user_path(@user)
  end

  def unfollow
    current_user.unfollow(@user)
    redirect_to user_path(@user)
  end

  def accept
    current_user.accept_follow_request_of(@user)
    redirect_to user_dashboard_path(current_user)
  end

  def decline
    current_user.decline_follow_request_of(@user)
    redirect_to user_dashboard_path(current_user)
  end

  def cancel
    current_user.remove_follow_request_for(@user)
    redirect_to user_path(@user)
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_dashboard_path(current_user), notice: "Your profile has been updated."
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
