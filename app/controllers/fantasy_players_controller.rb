class FantasyPlayersController < ApplicationController
  
  def edit
    @fantasy_player = Player.joins(:fantasy_player).find(params[:id])
  end
  
end