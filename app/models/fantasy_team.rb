class FantasyTeam < ApplicationRecord
  
  has_many :fantasy_players
  
  def self.position_count(fantasy_team_id)
    players = FantasyPlayer.joins(:player).select("players.position as posti").where(fantasy_team_id: fantasy_team_id).map(&:posti)

    position_hash = Hash.new(0)

    players.each do |v|
      position_hash [v] += 1
    end

    position_hash.each do |k, v|
      puts "#{k}: #{v}"
    end    
  end
  
end
