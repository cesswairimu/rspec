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
  
  describe "POST create" do
    context "valid data" do
      let(:valid_data) { FactoryGirl.attributes_for(:public_achievement) }
      it " redirects to achievements#show" do
        post :create, achievement:  valid_data
        expect(response).to redirect_to(achievement_path(assigns[:achievement]))
      end

      it "creates a new achievement in database" do
        expect{
          post :create, achievement: valid_data
        }.to change(Achievement, :count).by(1)
      end
    end
    context "invalid data" do
      let(:invalid_data){  FactoryGirl.attributes_for(:public_achievement, title: ' ')
}
     it "renders new template" do
        post :create, achievement:   invalid_data  
          expect(response).to render_template(:new)
      end
      it "does not create new achievement" do
        expect{
        post :create, achievement: invalid_data
        }.not_to change(Achievement, :count)
      end

    end
    end

  end

