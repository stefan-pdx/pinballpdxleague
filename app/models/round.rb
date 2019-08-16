class Round < ApplicationRecord
    belongs_to :match
    has_many :games

    def running?
        games.includes(:game_outcome).where(game_outcome: { id: nil })
    end

    def finished?
        # Eh.
        !running?  
    end
end