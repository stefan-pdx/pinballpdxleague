class Lineup < ApplicationRecord
    belongs_to :playable, polymorphic: true
    belongs_to :participant, polymophic: true
end