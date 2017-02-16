require 'rails_helper'

RSpec.describe AchievementsController do
  describe 'GET new' do
    it "render new  template" do
      get :new
      expect(response).to render_template(:new)
    end
    it "assigns new achievement to @achievement" do
      get :new
      expect(assigns(:achievement)).to  be_a_new(Achievement)
    end

  end

  describe "GET show" do
    let(:achievement) { FactoryGirl.create(:public_achievement) }
    it "render show template" do
      get :show, params:{ id: achievement.id }
      expect(response).to render_template(:show)
    end

    it 'assigns requested achievement to @achievement' do
      get :show, params:{ id: achievement.id }
      expect(assigns(:achievement)).to eq(achievement)
    end
  end
end
