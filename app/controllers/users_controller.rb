class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @user = User.find_by(params[:id])
    @currentUserRoomUser = RoomUser.where(user_id: current_user.id)
    @userRoomUser = RoomUser.where(user_id: @user.id)
    if @user.id == current_user.id
    else
      @currentUserRoomUser.each do |cu|
        @userRoomUser.each do |u|
          if cu.room_id == u.room_id
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end
      if @isRoom
      else
        @room = Room.new
        @room_user = room_user.new
      end
    end
  end

  def show
    user = User.find(params[:id])
    @user = user
    @skills = @user.skills.order("created_at DESC")
  end
end
