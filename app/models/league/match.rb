class League::Match << Match
    has_many :teams,
        through: :lineups,
        source: :participant,
        source_type: 'Team'

    has_one :home_team, -> { teams.where(order: 1) }
    has_one :away_team, -> { teams.where(order: 2) }

    scope :upcoming, -> (range) { where(start_time: range) }

    def at_home?(team)
        team == home_team
    end

    def opposing_team(team)
        case team
        when home_team
            away_team
        when away_team
            home_team
        end
    end
end