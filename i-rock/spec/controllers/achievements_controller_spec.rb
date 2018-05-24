require 'rails_helper'

RSpec.describe AchievementsController do

  shared_examples "public_access to achievements" do
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

    describe "get INDEX" do
      it "render index template" do
        get :index
        expect(response).to render_template(:index)
      end
      it "assigns only public achievement to template" do
        public_achievement = FactoryGirl.create(:public_achievement) 
        get :index
        expect(assigns(:achievements)).to match_array([public_achievement]) 
      end
    end

  end

  describe "guest user" do
    it_behaves_like "public_access to achievements"

        describe "GET new"do
      it "redirects to login page" do
        get :new
        expect(response).to redirect_to(new_user_session_url)
      end
    end
    describe "POST create" do
      it "redirects to login page" do
        post :create, achievement: FactoryGirl.attributes_for(:public_achievement)
        expect(response).to redirect_to(new_user_session_url)
      end
    end
    describe "GET edit" do
      it "redirects to login page" do
        get :edit
        expect(response).to redirect_to(new_user_session_url)
      end
    end
    describe "PUT update" do
      it "redirects to login page" do
        post :create, params:{ id: FactoryGirl.create(:public_achievement),
                               achievement: FactoryGirl.attributes_for(:public_achievement)}
        expect(response).to redirect_to(new_user_session_url)
      end
    end
    describe "DELETE destroy" do
      it "redirects to login page" do
        delete :destroy , params:{ id: FactoryGirl.create(:public_achievement) }
        expect(response).to redirect_to(new_user_session_url)
      end
    end
  end

  describe "authenticated user" do
    let(:user) { FactoryGirl.create(:user) }
    before do
      sign_in(user)
    end

    it_behaves_like "public_access to achievements"

    describe "get INDEX" do
      it "render :index template" do 
        get :index
        expect(response).to render_template(:index)
      end
      it "assigns only public achievement to template" do
        public_achievement = FactoryGirl.create(:public_achievement)
        private_achievement = FactoryGirl.create(:private_achievement) 
        get :index
        expect(assigns(:achievements)).to match_array([public_achievement]) 
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

    describe "POST create" do
      context "valid data" do
        let(:valid_data) { FactoryGirl.attributes_for(:public_achievement, user: user) }
        it " redirects to achievements#show" do
          skip
          post :create, params: { achievement:  valid_data
          }
          expect(response).to redirect_to achievement_path
        end

        it "creates a new achievement in database" do
          skip
          expect{
            post :create, params:{ achievement: valid_data
            }}.to change(Achievement, :count).by(1)
        end
      end
      context "invalid data" do
        let(:invalid_data){  FactoryGirl.attributes_for(:public_achievement, title: ' ')
        }
        it "renders new template" do
          post :create,params:{ achievement:   invalid_data } 
          expect(response).to render_template(:new)
        end
        it "does not create new achievement" do
          expect{
            post :create,params:{ achievement: invalid_data
            }}.not_to change(Achievement, :count)
        end

      end
    end
    context "user is not the owner of the achievement" do
      let(:achievement) { FactoryGirl.create(:public_achievement) }
      describe "GET edit" do
        it "redirects to achievements page" do
          get :edit, params: { id: achievement}
          expect(response).to redirect_to(achievements_path)
        end
      end
      describe "PUT update" do
        it "redirects to achievements page" do
          put :update, params: { id: achievement }
          expect(response).to redirect_to(achievements_path)
        end
      end
      describe "DELETE destroy" do
        it "redirects to achievements page" do
          delete :destroy , params:{ id: achievement }
          expect(response).to redirect_to(achievements_path)
        end
      end
    end
    context "user is the owner of the achievement" do
        let(:achievement) { FactoryGirl.create(:public_achievement, user: user) }

      describe "GET edit" do
        it "renders edit template"do
          get :edit, params:{ id:achievement }
          expect(response).to render_template(:edit)
        end
        it "assigns the requested achievement to template" do
          get :edit, params:{
            id: achievement
          }
          expect(assigns(:achievement)).to eq(achievement)
        end
      end
      describe "PUT update" do

        context "valid data" do
          let(:valid_data)  { FactoryGirl.attributes_for(:public_achievement, title: "Malach") }
          it "redirects to achievements#show" do
            put :update, params: {
              id: achievement, achievement: valid_data
            }
            expect(response).to redirect_to(achievement)
          end
          it "updates the database" do
            put :update, params: {
              id: achievement, achievement: valid_data
            }
            achievement.reload
            expect(achievement.title).to eq("Malach")
          end
        end

        context "invalid data" do
          let(:invalid_data)  { FactoryGirl.attributes_for(:public_achievement, title: " ", description: "cess" ) }
          it "renders edit template" do

            put :update, params: {
              id: achievement, achievement: invalid_data
            }
            expect(response).to render_template(:edit)
          end
          it "does not update database" do
            put :update, params: {
              id: achievement, achievement: invalid_data
            }
            expect(achievement.description).not_to eq('cess')
          end
        end
      end

      describe "DELETE destroy" do
        it "redirects to achievements#index" do
          delete :destroy, params:{ id: achievement }
          expect(response).to redirect_to(achievements_path)
        end
        it "removes achievement from db" do
          delete :destroy, params:{ id: achievement }
          expect(Achievement.exists?(:achievement_id)).to be_falsy
        end
      end


    end

  end


end 
