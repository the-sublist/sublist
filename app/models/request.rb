class Request < ActiveRecord::Base
  belongs_to :school

  has_many :offers
  has_many :teachers, through: :offers
end
