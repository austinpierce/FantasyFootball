class FantasyProjectionsController < ApplicationController
  
  def show
    @player = Player.find(params[:id])
    @projections = FantasyProjection.joins(:player).where(player_id: @player)
    
  end
  
end