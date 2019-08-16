class Confirmation < ApplicationRecord
  belongs_to :confirmable, polymorphic: true
  belongs_to :confirmer, polymorphic: true
  belongs_to :user
end
