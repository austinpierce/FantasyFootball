Rails.application.routes.draw do

  resources :teams
  resources :fantasy_teams
  root 'welcome#index'
  get 'players', to: 'players#index'
  
end
