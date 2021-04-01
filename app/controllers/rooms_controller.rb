class RoomsController < ApplicationController
  def index
    @users = User.where(params[:id])
  end
end
