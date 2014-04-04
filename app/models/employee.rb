class Employee < ActiveRecord::Base
  has_many :charges

  def charge!(ammount=100)
    charges.create(ammount: ammount)
    unless charged_recently?
      self.total += ammount
      self.last_charged_at = Time.now
      save!
    end
  end

  private
  def charged_recently?
    last_charged_at && (Time.now - last_charged_at) < 2.minutes
  end
end
