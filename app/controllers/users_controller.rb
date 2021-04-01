class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @skills = @user.skills.order("created_at DESC")
  end
end
