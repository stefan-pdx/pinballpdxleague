class Match < ApplicationRecord
    belongs_to :tournament

    has_many :rounds

    def current_round
        rounds.order(:order, :desc).first
    end
end