class BadgeNominationVote < ActiveRecord::Base
  belongs_to :badge_nomination
  belongs_to :status
end
