module ApplicationHelper

  def phone_mask(number)
    if number
      "(#{number[0..2]}) #{number[3..5]}-#{number[6..9]}"
    end
  end
end
