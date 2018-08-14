Rails.application.routes.draw do

  resources :teams
  resources :fantasy_teams
  resources :fantasy_players, only: [:edit, :update]
  root 'welcome#index'
  get 'players', to: 'players#index'
  
end
