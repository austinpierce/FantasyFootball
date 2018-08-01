class Team < ApplicationRecord
  
  include HTTParty
  
  def self.footballteams
       teams = HTTParty.get("https://www.fantasyfootballnerd.com/service/nfl-teams/json/test")
    
        teamSize = teams["NFLTeams"].size
        x = 0
    
          until teamSize == 0
            team = teams["NFLTeams"][x]
            teamCode = team["code"]
            teamFullName = team["fullName"]
            teamShortName = team["shortName"]
            puts "'#{teamCode}','#{teamFullName}','#{teamShortName}'" 
            Team.create(code: "#{teamCode}", fullName: "#{teamFullName}", shortName: "#{teamShortName}")
            teamSize -= 1
            x += 1
          end
    
  end
  
end
