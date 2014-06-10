class BadgeNomination < ActiveRecord::Base
  belongs_to :badge
  belongs_to :nominated_employee, class_name: Employee, foreign_key: :nominated_id
  belongs_to :nominator, class_name: Employee, foreign_key: :nominator_id
end
