class NotificationsController < ApplicationController
  def incoming
    @phone_number = params[:From]
    @body = params[:Body]

    output = process_message(@body)
    respond(output)
  end



  private

  def process_message(message)
      if message.downcase == 'yes'
        # Find the offer here. Change available to true
        output = "Great, we will let them know that you're available"
      elsif message.downcase == 'confirm'
        # find offer, change confirmed to true.
        # Find request set to filled
        output = "Great, you're all set!"
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
