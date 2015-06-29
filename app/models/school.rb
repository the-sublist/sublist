class School < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :requests

  def get_request_name
    count = Request.where(school_id: self.id).count
    "#{self.school_name}: Request ##{count + 1}"
  end
end
