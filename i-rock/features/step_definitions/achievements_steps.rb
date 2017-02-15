Given(/^I am a guest user$/) do
end

Given(/^There is a public achievement$/) do
  @achievement = FactoryGirl.create(:public_achievement, title: 'Just do it')
end

When(/^I go to the achievement's page$/) do
  visit(achievement_path(@achievement.id))
end

Then(/^I must see achievement's content$/) do
  expect(page).to have_content('Just do it')
end

