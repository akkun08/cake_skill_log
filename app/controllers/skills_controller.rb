class SkillsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy, :new, :create]
  before_action :find_params, only: [:show, :edit, :update]

  def index
    @skills = Skill.order("created_at DESC")
  end

  def new
    @skill = Skill.new
  end

  def create
    @skill = Skill.new(skill_params)
    if @skill.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @skill.update(skill_params)
      redirect_to skill_path
    else
      render :edit
    end
  end

  private

  def find_params
    @skill = Skill.find(params[:id])
  end

  def skill_params
    params.require(:skill).permit(:image, :name, :category_id, :formulation_text, :recipe_text).merge(user_id: current_user.id)
  end
end
