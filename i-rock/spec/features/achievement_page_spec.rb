require 'rails_helper'

feature 'achievement page' do
 scenario 'achievement public page' do
   achievement = Achievement.create(title: 'Just do it')
   visit("/achievements/#{achievement.id}")
   expect(page).to have_content('Just do it')
 end

 scenario 'render markdown description' do
 achievement = Achievement.create(title:'title', description: 'That *was* hard')
   visit("/achievements/#{achievement.id}")
   expect(page).to have_content('<i>was</i>')
end
 
end
