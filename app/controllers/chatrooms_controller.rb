class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  def index
    @chatrooms = Chatroom.where("users @> ARRAY[?]::varchar[]", current_user.id.to_s)

  end
end