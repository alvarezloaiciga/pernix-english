class Employee < ActiveRecord::Base
  has_many :charges
  has_many :nominations, class_name: BadgeNomination, foreign_key: :nominated_id

  default_scope -> { order(:name) }

  def charge!(ammount=100)
    unless charged_recently?
      charge(ammount)
      notify_charge(ammount)
    end
  end

  private
  def charged_recently?
    last_charged_at && (Time.now - last_charged_at) < 2.minutes
  end

  def charge(ammount)
    charges.create(ammount: ammount)
    self.total += ammount
    self.last_charged_at = Time.now
    save!
  end

  def notify_charge(ammount)
    ChargeMailer.employee_charged(self, ammount).deliver
  end
end
