Rails.application.routes.draw do

  resources :teams
  root 'welcome#index'
  
end
