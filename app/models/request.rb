class Request < ActiveRecord::Base
  belongs_to :school

  has_many :offers
  has_many :teachers, through: :offers

  def format_grade
    if self.grade == "0"
      "Kindergarten"
    elsif self.grade == "1"
      "1st Grade"
    elsif self.grade == "2"
      "2nd Grade"
    elsif self.grade == "3"
      "3rd Grade"
    else
      self.grade + "th Grade"
    end
  end

  def format_date
    self.date.strftime("%A, %b %d")
  end

  def format_status
    if self.active == true
      "Pending"
    else
      "Closed"
    end
  end
end
