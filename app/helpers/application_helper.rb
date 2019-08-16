module ApplicationHelper
    def current_player
        current_user.try(:player)
    end
end
