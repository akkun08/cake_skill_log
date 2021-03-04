class MessagesController < ApplicationController
  def index
  end

  def create
    # @user = User.find(params[:user_id])
    # binding.pry
    @message = Message.new(message_params)
    if @message.save
      redirect_to user_messages_path
    else
      render :index
    end
  end

  private

  def message_params
    params.permit(:text).merge(user_id: current_user.id)
  end
end
