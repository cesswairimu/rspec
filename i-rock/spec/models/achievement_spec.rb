require 'rails_helper'

RSpec.describe Achievement, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_uniqueness_of(:title).scoped_to(:user_id).with_message("You cant have it same title for achievement twice") }
    it { should validate_presence_of(:user) }
    it {should belong_to(:user)}
  end
  it "converts markdown to html" do
    achievement = Achievement.new(description: "Awesome **thing** I *actually* did")
    # expect(achievement.description).to include('<strong>thing</strong>')
    # expect(achievement.description).to include('<em>actually</em>')
     expect(achievement.description).to include('actually')
  end

 it 'has a silly title' do
   achievement = Achievement.new( title: "New achieve", user: FactoryGirl.create(:user, email: 'test@test.com') )
   expect(achievement.silly_title).to  eq('New achieve by test@test.com')
 end
  it "fetches an achievement which title starts with the provided letter" do
    user = FactoryGirl.create(:user)
    achieve1 = FactoryGirl.create(:public_achievement, title: "Read a book", user: user)
    achieve2 = FactoryGirl.create(:public_achievement, title: "I have a book", user: user)
    expect(Achievement.by_letter("R")).to eq([achieve1])
  end

  it "sorts achievements with user email"do
    cess = FactoryGirl.create(:user, email:"cess@test.test")
    malach  = FactoryGirl.create(:user, email:"malach@test.test")
    achieve2 = FactoryGirl.create(:public_achievement, title: "Rock a book", user: malach)
    achieve1 = FactoryGirl.create(:public_achievement, title: "Read a book", user: cess)
    expect(Achievement.by_letter("R")).to eq([achieve1,achieve2])
  end
end
