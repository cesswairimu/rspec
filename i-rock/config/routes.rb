Rails.application.routes.draw do

  root 'welcome#index'
  resources :achievements
  get 'edit' => 'achievements#edit'
end
