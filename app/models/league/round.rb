class League::Round << Round
    belongs_to :match
    has_many :games

    has_many :confirmations, as: :confirmable

    has_many :team_confirmations,
        through: :confirmations,
        source: :confirmer,
        source_type: 'Team'

    after_create do
        lineups.each do
            game_count.times do
                games << League::Game.new
            end
        end
    end

    def declares_lineup_first?(team)
        if round_number.odd?
            match.away_teams.include?(team)
        else
            match.home_teams.include?(team)
        end
    end

    def confirmed_lineup?(team)
        lineup_confirmations.include?(team)
    end

    def confirm_lineup!(team)
        lineup_confirmations << team
    end

    def game_count
        case round_format
        when :doubles
            2
        when :singles
            4
        end
    end

    def round_format
        case round_number
        when 1
            :doubles
        when 2
            :singles
        when 3
            :singles
        when 4
            :doubles
        else
            throw "Unsupport round number for Leage::Round"
        end
    end
end