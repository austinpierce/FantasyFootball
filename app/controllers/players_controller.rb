class PlayersController < ApplicationController
  
  def index
    @players = Player.paginate(page: params[:page], per_page: 50)
    @fantasy_players = Player.joins(:fantasy_player).paginate(page: params[:page], per_page: 50)
  end
  
end