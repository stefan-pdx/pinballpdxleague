class League::Tournament < Tournament
    has_many :teams,
        through: :participants,
        source: :participant,
        source_type: 'Team'
end