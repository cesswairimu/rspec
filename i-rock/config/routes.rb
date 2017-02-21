Rails.application.routes.draw do

  devise_for :users
  root 'welcome#index'
  resources :achievements
  get 'edit' => 'achievements#edit'
end
