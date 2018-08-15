class Player < ApplicationRecord
  self.primary_key = :id
  
  has_one :fantasy_player
  has_one :fantasy_team, through: :fantasy_player
    
  filterrific(
   #default_filter_params: { filter_player_position: 0 },
   available_filters: [
     :search_query,
     :filter_player_position,
     :filter_fantasy_team
   ]
 )

  scope :filter_player_position, lambda { |position|
    where(position: [*position])
  }
  
  scope :filter_fantasy_team, lambda { |team|
    where(fantasy_teams: { fantasy_team_name: team }).joins(:fantasy_team)
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
  
  def self.options_for_select
    Player.select(:position).distinct.map(&:position)
  end
  
  def self.options_for_fantasy_team
    FantasyTeam.select(:fantasy_team_name).distinct.map(&:fantasy_team_name)
  end
  
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
