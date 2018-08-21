class WelcomeController < ApplicationController
  
  def index
    
  end
  
  def hello_world
    puts "asdjfalsdjflasjfdsl"
  end
  
  def load_draft_rankings
    # execute first
    Player.InitialDraftRankings  
  end
  
  def load_fantasy_players
    # execute second
    FantasyPlayer.InsertPlayers  
  end
  
  def load_fantasy_projections
    # execute third
    FantasyProjection.QB_InitialProjections  
    FantasyProjection.RB_InitialProjections
    FantasyProjection.WR_InitialProjections  
    FantasyProjection.TE_InitialProjections
    FantasyProjection.DEF_InitialProjections  
    FantasyProjection.K_InitialProjections
  end
  
  def load_auction
    # execute fourth
    Auction.InitialAuction
    Auction.UpdateProjectedPrice
  end
  
  def code_red
    # destroys everything
    Player.destroy_all
    FantasyPlayer.destroy_all
    FantasyProjection.destroy_all
    Auction.destroy_all
  end
  
end