class NotificationsController < ApplicationController
  def incoming
    @phone_number = params[:From]
    @body = params[:Body]
    @teacher = Teacher.find_by(phone_number: @phone_number)

    output = process_message(@body)
    respond(output)
  end



  private

  def process_message(message)
      if message.downcase == 'yes'
        # offer = Offer.where(teacher_id: @teacher.id, available: false)
        # request = Request.find(offer.request_id)
        # offer.update!(available: true)
        # output = "Great. The position pays #{request.payment.to_s} dollars and is for the hours #{request.start_time} to #{request.end_time}.\n Please reply confirm to lock this job."
        output = "Great. The position pays 100 dollars and is for the hours 6am to 4pm.\n Please reply confirm to lock this job."
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
