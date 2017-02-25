require 'rails_helper'

RSpec.describe Achievement, type: :model do
  describe 'validations' do
    it 'requires title' do
      achievement = Achievement.new( title: " " )
      achievement.valid?
      expect(achievement.errors[:title]).not_to be_empty
    end

    it "requires title to be unique for a user" do
      user = FactoryGirl.create(:user)
      first_achievement = FactoryGirl.create(:public_achievement,title: "First", user: user)
      new_achievement =Achievement.new(title: "First", user: user)
      expect(new_achievement.valid?).to be_falsy
    end
 it "allows different users to have identical titles" do
    user = FactoryGirl.create(:user)
    user1 = FactoryGirl.create(:user)
      first_achievement = FactoryGirl.create(:public_achievement,title: "First", user: user)
      new_achievement =Achievement.new(title: "First", user: user1)
      expect(new_achievement.valid?).to be_truthy
 end
      
   
  end

end
