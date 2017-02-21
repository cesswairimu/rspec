class AchievementsController < ApplicationController
  def new
    @achievement = Achievement.new
  end

  def create
    @achievement = Achievement.new(ach_params)
    if @achievement.save
      redirect_to achievement_url(@achievement), notice: "Achievement has been created"
    else
      render 'new'
    end
  end

  def show
    @achievement = Achievement.find(params[:id])
  end

  def index
@achievements = Achievement.public_access
  end

  def edit
    @achievement = Achievement.find(params[:id])
  end

  def update
    @achievement = Achievement.find(params[:id])
    if @achievement.update_attributes(ach_params)
    redirect_to @achievement
    else
      render 'edit'
    end
  end

  private
  def ach_params
    params.require(:achievement).permit( :title, :description, :featured, :cover_image, :privacy )
  end
end
