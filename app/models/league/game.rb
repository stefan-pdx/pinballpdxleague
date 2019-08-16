class League::Game << Game
    has_many :confirmations, as: :confirmable

    # A Game has to be confirmed by both teams
    # before it can be started.
    has_many :confirmed_teams,
        through: :confirmations,
        source: :confirmer,
        source_type: 'Team'

    # For singles.
    has_one :home_player, -> { players.where(order: 1) }
    has_one :away_player, -> { players.where(order: 2) }

    # For doubles.
    has_many :home_players, -> { players.where('order % 2 = 1') }
    has_many :away_players, -> { players.where('order % 2 = 0') }

    def confirmed_by_both_teams?
        confirmed_teams && match.teams == match.teams
    end

    def confirmed?(team)
        confirmed_teams.include?(team)
    end

    def confirm!(user, team)
        return if confirmed_teams.include?(team)

        # TODO: authorization
        confirmations << Confirmation.new(confirmer: team, confirmed_by: user)
    end

    def unconfirm!(team)
        # TODO: authorization
        unless confirmed?(team)
            confirmed_teams.delete(team)
        end
    end

private

    def lineup_count
        case match.round_type
        when :doubles
            2
        when :singles
            1
        end
    end
end