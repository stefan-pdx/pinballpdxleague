class Player < ApplicationRecord
  belongs_to :user, optional: true

  has_one :team_membership, ->(player) { where(player_id: player.id) }, class_name: "TeamMembership"

  has_one :team, through: :team_membership

  def abbreviated_name
    "#{first_name} #{last_name.truncate(2, omission:'.')}"
  end

  def teammates
    team.players
  end
end