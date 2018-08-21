Rails.application.routes.draw do

  resources :teams
  resources :fantasy_teams
  resources :fantasy_players, only: [:edit, :update]
  resources :fantasy_projections, only: [:show]
  root 'welcome#index'
  get 'players', to: 'players#index'
  get '/hello_world', to: 'welcome#hello_world'
  get '/load_draft_rankings', to: 'welcome#load_draft_rankings'
  get '/load_fantasy_players', to: 'welcome#load_fantasy_players'
  get '/load_fantasy_projections', to: 'welcome#load_fantasy_projections'
  get '/load_auction', to: 'welcome#load_auction'
  get '/code_red', to: 'welcome#code_red'
  
  
end
