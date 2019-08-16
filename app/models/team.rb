class Team < ApplicationRecord
    has_many :participants, as: :playable

    has_many :players,
        through: :participants,
        source: :participant,
        source_type: 'Player'
end