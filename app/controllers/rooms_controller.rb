class RoomsController < ApplicationController
  def index
    @users = User.all
  end
end
