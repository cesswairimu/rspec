Rails.application.routes.draw do
  get 'achievements/new'

  root 'welcome#index'
  resources :achievements
end
