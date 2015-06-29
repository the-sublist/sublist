class Offer < ActiveRecord::Base
  belongs_to :request
  belongs_to :teacher

  def make_available
    self.update(available: true)
    self.save
  end
end
