class MessagesController < ApplicationController
  before_action :cannot_transition, only: [:show, :create]

  def show
    @user = User.find(params[:id])
    rooms = current_user.room_users.pluck(:room_id)
    room_users = RoomUser.find_by(user_id: @user.id, room_id: rooms)
    unless room_users.nil?
      @room = room_users.room
    else
      @room = Room.new
      @room.save
      RoomUser.create(user_id: current_user.id, room_id: @room.id)
      RoomUser.create(user_id: @user.id, room_id: @room.id)
    end
    @messages = @room.messages
    @message = Message.new(room_id: @room.id)
  end

  def create
    # binding.pry
    @message = current_user.messages.new(message_params)
    if @message.save
      redirect_to request.referrer
    else
      redirect_to request.referrer
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :room_id)
  end

  def cannot_transition
    @message = Skill.find(params[:id])
    if @message.user.id == current_user.id
      redirect_to root_path
    end
  end
end
