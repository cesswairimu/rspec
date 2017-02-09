class AchievementsController < ApplicationController
  def new
    @achievement = Achievement.new
  end

  def create
    @achievement = Achievement.new(ach_params)
    if @achievement.save
      redirect_to root_url, notice: "Achievement has been created"
    end
  end

  private
  def ach_params
    params.require(:achievement).permit( :title, :description, :featured, :cover_image, :privacy )
  end
end
