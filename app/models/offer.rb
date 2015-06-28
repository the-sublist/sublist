class Offer < ActiveRecord::Base
  belongs_to :request
  belongs_to :teacher
end
