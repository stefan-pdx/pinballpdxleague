class HomeController < ApplicationController
    before_action :set_match, only: :index

    def index
    end

    def set_match
        if current_user
            @match = current_user.player.team.current_match
        end
    end

    def set_upcoming_tournaments

    end

    def set_upcoming_matches

    end

    def set_current_matches

    end
end
