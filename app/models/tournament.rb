class Tournament < ApplicationRecord
    UPCOMING_TIME_WINDOW = 4.weeks

    extend FriendlyId
    friendly_id :name, use: :slugged

    has_many :matches
    has_many :participants, as: :playable

    scope :active, -> {
        where('? BETWEEN start_date AND end_date', Date.today)
    }

    scope :upcoming, -> {
        where(start_date: Date.today..UPCOMING_TIME_WINDOW.weeks.from_now)
    }
end