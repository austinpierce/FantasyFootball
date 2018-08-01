Rails.application.routes.draw do

  resources :teams
  root 'welcome#index'
  get 'players', to: 'players#index'
  
end
