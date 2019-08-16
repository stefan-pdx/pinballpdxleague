class League::RoundsController < ApplicationController
    before_action :set_tournament
    before_action :set_match
    before_action :set_round

    def show
    end

    def edit
    end

    def update
    end

    def set_round
        @round = @match.rounds.find_by(round_number: params[:round_id])
    end

    def set_tournament
        @tournament = Tournament.friendly.find(params[:league_id])
    end

    def set_match
        @match = @tournament.matches.find_by(match_number: params[:match_id])
    end
end