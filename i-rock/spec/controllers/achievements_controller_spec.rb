require 'rails_helper'

RSpec.describe AchievementsController do
  describe 'GET new' do
    it "render new  template" do
      get :new
      expect(response).to render_template(:new)
    end
  end
  it "assigns new achivement to @achievement" do



  end

end
