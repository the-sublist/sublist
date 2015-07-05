class Teacher < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :offers
  has_many :requests, through: :offers

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def credentials
    "#{self.degree} #{self.area_of_study}"
  end

  def age
    (Date.today - self.birthday).to_i / 365
  end
end
