class NotificationsController < ApplicationController
  def incoming
    @phone_number = params[:From]
    @body = params[:Body]
    @teacher = Teacher.find_by(phone_number: @phone_number)

    output = process_message(@body)
    respond(output)
  end



  private

  def process_message(message, teacher)
      if message.downcase == 'yes'
        offer = Offer.where("teacher_id == ? AND available == ?", @teacher.id, false)
        request = Request.find(offer.request_id)
        output = "Great. The position pays #{request.payment.to_s} dollars and is for the hours #{request.start_time} to #{request.end_time}.\n Please reply confirm to lock this job."
        offer.update!(available: true)
      elsif message.downcase == 'confirm'
        # find offer, change confirmed to true.
        # Find request set to filled
        output = "Great, you're all set!"
      else
        output = "We're sorry, there's been an error. Please check your reply and try again."
      end
      output
    end


  def respond(message)
    response = Twilio::TwiML::Response.new do |r|
      r.Message message
    end
    render text: response.text
  end
end
