class Point < ApplicationRecord
    belongs_to :game_outcome
    belongs_to :awardee, polymorphic: true
end
