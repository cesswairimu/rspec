require 'rails_helper'

RSpec.describe AchievementsController do
  describe 'GET new' do
    it "render new  template" do
      get :new
      expect(response).to render_template(:new)
    end
  end
  it "assigns new achievement to @achievement" do
      get :new
expect(assigns(:achievement)).to  be_a_new(Achievement)


  end

end
