class PlayersController < ApplicationController
  
  def index
    @players = Player.all
    @fantasy_players = Player.joins(:fantasy_player)
  end
  
end