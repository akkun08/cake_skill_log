class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @user = user
    @skills = @user.skills.order("created_at DESC")
  end
end
