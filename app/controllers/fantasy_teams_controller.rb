class FantasyTeamsController < ApplicationController
  
  def index
    @fantasyTeams = FantasyTeam.all
  end
  
  def new
    @fantasyTeam = FantasyTeam.new
  end
  
  def create 
    @fantasyTeam = FantasyTeam.new(ft_params)
    if @fantasyTeam.save
      flash[:success] = "Team was created"
      redirect_to fantasy_teams_path
    else
      render 'new'
    end
  end
  
  private
  
  def ft_params
    params.require(:fantasy_team).permit(:fantasy_team_name, :owner_name, :auction_cash)
  end
  
end