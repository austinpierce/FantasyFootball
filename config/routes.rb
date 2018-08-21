Rails.application.routes.draw do

  resources :teams
  resources :fantasy_teams
  resources :fantasy_players, only: [:edit, :update]
  resources :fantasy_projections, only: [:show]
  root 'welcome#index'
  get 'players', to: 'players#index'
  
end
