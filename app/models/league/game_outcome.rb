class League::GameOutcome << GameOutcome
    has_many :confirmations, as: :confirmable

    has_many :team_points,
        through: :points,
        source: :awardee,
        source_type: 'Team'

    # For a league game, each team has to confirm the
    # outcome of a game.
    has_many :confirmed_teams,
        through: :confirmations,
        source: :confirmer,
        source_type: 'Team'

    def set_winner!(team)
        raise "points have been awarded" unless team_points.empty?

        case match.format
        when :doubles
            team_points << Point.new(awardee: team, value: 2)
        when :singles
            team_points << Point.new(awardee: team, value: 1)
        end
    end

    def confirmed_by_both_teams?
        confirmed_teams && game.match.teams == game.match.teams
    end

    def confirmed?(team)
        confirmed_teams.include?(team)
    end

    def unconfirm!(team)
        confirmed_teams.delete(team)
    end

    def confirm!(team)
        unless confirmed?(team)
            confirmed_teams << team
        end
    end
end