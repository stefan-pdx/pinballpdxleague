class League::MatchesController < ApplicationController
    before_action :set_tournament
    before_action :set_match, only: :show

    def index
    end

    def show
    end

    def set_tournament
        @tournament = Tournament.friendly.find(params[:league_id])
    end

    def set_match
        @match = @tournament.matches.find_by(match_number: params[:match_id])
    end

    attr_reader :tournament, :match
end