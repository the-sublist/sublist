class Offer < ActiveRecord::Base
  belongs_to :request
  belongs_to :teacher

  def make_available
    self.update(available: true)
    self.save
  end

  def status
    if self.confirmed == true
      "Teacher Confirmed"
    elsif self.available == false
      "Teacher Unavailable"
    elsif self.available == nil
      "Awaiting Response"
    elsif self.available == true
      "Teacher Available"
    elsif self.available == true && self.confirmation_sent == true && self.confirmed == false
      "Pending Confirmation"
    end
  end
end
