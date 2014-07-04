class BadgeNomination < ActiveRecord::Base
  belongs_to :badge
  belongs_to :nominated_employee, class_name: Employee, foreign_key: :nominated_id
  belongs_to :nominator, class_name: Employee, foreign_key: :nominator_id
  has_many :badge_nomination_votes

  default_scope -> { order(:created_at) }
  scope :this_week, -> { where('created_at >= ?', DateTime.current.beginning_of_week(:sunday)) }

  def count_votes_with_status(status)
    badge_nomination_votes.joins(:status).where(statuses: { status: status }).count()
  end
end
