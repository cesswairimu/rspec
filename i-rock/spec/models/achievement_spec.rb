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

it "requires a user" do
  new = Achievement.new(title:"cess", user: nil)
  expect(new.valid?).to be_falsy
end

it "has belongs_to user association" do
  #approach 1
  user = FactoryGirl.create(:user)
  achievement = FactoryGirl.create(:public_achievement, user: user)
  expect(achievement.user).to eq(user)

  #approach 2
  u =Achievement.reflect_on_association(:user)
  expect(u.macro).to eq(:belongs_to)

end
  end

end
