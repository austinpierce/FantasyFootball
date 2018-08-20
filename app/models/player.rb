class Player < ApplicationRecord
  self.primary_key = :id
  
  has_one :fantasy_player
  has_one :fantasy_team, through: :fantasy_player
    
  filterrific(
   default_filter_params: { sorted_by: 'nerd_rank_asc' },
   available_filters: [
     :search_query,
     :filter_player_position,
     :filter_fantasy_team,
     :filter_watching,
     :sorted_by
   ]
 )

  scope :filter_player_position, lambda { |position|
    where(position: [*position])
  }
  
  scope :filter_fantasy_team, lambda { |team|
    where(fantasy_teams: { fantasy_team_name: team }).joins(:fantasy_team)
  }
  
  scope :filter_watching, lambda { |watching|
    where(fantasy_players: { watch: watching }).joins(:fantasy_player)
  }
  
  scope :search_query, lambda { |query|
  return nil  if query.blank?
  # condition query, parse into individual keywords
  terms = query.downcase.split(/\s+/)
  terms = terms.map { |e|
    (e.gsub('*', '%') + '%').gsub(/%+/, '%')
  }
  num_or_conds = 2
  where(
    terms.map { |term|
      "(LOWER(players.first_name) LIKE ? OR LOWER(players.last_name) LIKE ?)"
    }.join(' AND '),
    *terms.map { |e| [e] * num_or_conds }.flatten
  )
  }
  
  scope :sorted_by, lambda { |sort_option|
  # extract the sort direction from the param value.
  direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
  case sort_option.to_s
  when /^overall_rank_/
    order("players.overall_rank #{ direction }")
  when /^nerd_rank_/
    order("players.nerd_rank #{ direction }")
  when /^position_rank_/
    order("players.position_rank #{ direction }")
  when /^projected_price_/
    order("fantasy_players.auction_projected_price #{ direction }").includes(:fantasy_player).references(:fantasy_player)        
  when /^spend_price_/
    order("fantasy_players.auction_spend_price #{ direction }").includes(:fantasy_player).references(:fantasy_player)
  when /^sold_price_/
    order("fantasy_players.auction_sold_price #{ direction }").includes(:fantasy_player).references(:fantasy_player)

  else
    raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
  end
}
  
  def self.options_for_select
    Player.select(:position).distinct.map(&:position)
  end
  
  def self.options_for_fantasy_team
    FantasyTeam.select(:fantasy_team_name).distinct.map(&:fantasy_team_name)
  end
  
  def self.options_for_watch
    FantasyPlayer.select(:watch).distinct.map(&:watch)
  end
  
  def self.options_for_sorted_by
    [
      ['Nerd Rank', 'nerd_rank_asc'],
      ['Overall Rank', 'overall_rank_asc'],
      ['Position Rank', 'position_rank_asc'],
      ['Projected Price (High)', 'projected_price_desc'],
      ['Projected Price (Low)', 'projected_price_asc'],
      ['Spend Price (High)', 'spend_price_desc'],
      ['Spend Price (Low)', 'spend_price_asc'],
      ['Sold Price (High)', 'sold_price_desc'],
      ['Sold Price (Low)', 'sold_price_asc']
    ]
  end
  
#####################################################
  # Load Script
#####################################################
  
  def self.InitialDraftRankings
    players = HTTParty.get("https://www.fantasyfootballnerd.com/service/draft-rankings/json/test/1/")

    playerSize = players["DraftRankings"].size
    arrayPosition = 0

    until playerSize == 0
      
      player = players["DraftRankings"][arrayPosition]
      
      playerId = player["playerId"]
      playerPosition = player["position"]
      displayName = player["displayName"]
      firstName = player["fname"]
      lastName = player["lname"]
      team = player["team"]
      byeWeek = player["byeWeek"]
      nerdRank = player["nerdRank"]
      positionRank = player["positionRank"]
      overallRank = player["overallRank"]
      
      Player.create(id: "#{playerId}", position: "#{playerPosition}", display_name: "#{displayName}", 
                    first_name: "#{firstName}", last_name: "#{lastName}", team: "#{team}",
                    bye_week: "#{byeWeek}", nerd_rank: "#{nerdRank}", position_rank: "#{positionRank}",
                    overall_rank: "#{overallRank}")
      playerSize -= 1
      arrayPosition += 1
    end

  end

end
