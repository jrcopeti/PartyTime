class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: %i[show profile follow unfollow accept decline cancel followers following]

  def index
    if params[:query].present?
      @users = User.all.global_search(params[:query])
    else
      @users = User.all.order(:full_name)
    end
    # respond_to do |format|
    #   format.html # Follow regular flow of Rails
    #   format.text { render partial: 'list', locals: { users: @users } }
    # end
  end

  def show
    # other users profiles
    @rsvps = @user.rsvps
  end

  def profile
    # current_user profile page
    @favorite_events = current_user.favorited_by_type("Event")
    @rsvps = current_user.rsvps
  end

  def dashboard
    @favorite_events = current_user.favorited_by_type("Event")
    @rsvps = current_user.rsvps
  end

  def follow
    current_user.send_follow_request_to(@user)
    redirect_to user_path(@user)
  end

  def unfollow
    current_user.unfollow(@user)
    @chatroom = Chatroom.find_by_users([current_user.id, @user.id]) || Chatroom.find_by_users([@user.id, current_user.id])
    if @chatroom.nil?
      redirect_to user_path(@user)
    else
      @chatroom.destroy
      redirect_to user_path(@user), status: :see_other, notice: "Chatroom with #{@user.nickname} was deleted."
    end
  end

  def accept
    current_user.accept_follow_request_of(@user)
    if current_user.mutual_following_with?(@user)
      @chatroom = Chatroom.new
      @chatroom.users = [current_user.id, @user.id]
      @chatroom.name = "#{current_user.nickname} and #{@user.nickname}'s chat"
      @chatroom.save!
      redirect_to profile_user_path(current_user)
    else
      redirect_to profile_user_path(current_user)
    end


    # ChatroomChannel.broadcast_to(
    #   {
    #     user: @user,
    #     type: 'chat_created',
    #     chatroom_id: @chatroom.id,
    #     chatroom_path: chatroom_path(@chatroom)
    #   },
    #   "chat created"
    # )
    #
    # ChatroomChannel.broadcast_to(
    #   {
    #     user: current_user,
    #     type: 'chat_created',
    #     chatroom_id: @chatroom.id,
    #     chatroom_path: chatroom_path(@chatroom)
    #   },
    #   "chat created"
    # )
    # redirect_to profile_path(current_user)
  end

  def decline
    current_user.decline_follow_request_of(@user)
    redirect_to profile_user_path(current_user)
  end

  def cancel
    current_user.remove_follow_request_for(@user)
    redirect_to user_path(@user)
  end

  def followers
    @followers = @user.followers
  end

  def following
    @following = @user.following
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to profile_user_path(current_user), notice: "Your profile has been updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:full_name, :nickname, :bio, :avatar_url, :address, :latitude, :longitude, :photo)
  end
end
