class Game < ApplicationRecord
    belongs_to :round
    belongs_to :machine

    has_one :game_outcome

    has_many :lineups, as: :playable

    has_many :players,
        through: :lineups,
        source: :participant,
        source_type: 'Player'

    def finished?
        game_outcome.present?
    end
end