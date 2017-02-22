class AchievementsController < ApplicationController
  before_action :authenticate_user!, only: [ :new,:create, :edit, :update, :destroy ]
  before_action :owners_only, only:[ :edit, :update, :destroy ]
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
  end

  def update
    if @achievement.update_attributes(ach_params)
    redirect_to @achievement
    else
      render 'edit'
    end
  end

  def destroy
     @achievement.destroy
     redirect_to achievements_path
  end


  private
  def ach_params
    params.require(:achievement).permit( :title, :description, :featured, :cover_image, :privacy )
  end

  def owners_only
    @achievement = Achievement.find(params[:id])
    if current_user != @achievement.user
      redirect_to achievements_path
    end
  end
end
