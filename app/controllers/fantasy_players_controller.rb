class FantasyPlayersController < ApplicationController
  #before_action :find_fantasy_player
  
  def edit
    @fantasy_player = Player.joins(:fantasy_player).find(params[:id])
    @teams = FantasyTeam.all
  end
  
  def update
    @fantasy_player = FantasyPlayer.find(params[:id])
    if @fantasy_player.update(fantasy_player_params)
      flash[:notice] = "Updated"
      redirect_to players_path
    else
      render 'edit'
    end
  end
  
  private
 
    def find_fantasy_player
      @fantasy_player = Player.joins(:fantasy_player).find(params[:id])
    end
    
    def fantasy_player_params
      params.require(:fantasy_player).permit(:fantasy_team_id, :watch, :keeper, :auction_spend_price, :auction_sold_price, :rookie_asset)
    end
    
end