class NotificationsController < ApplicationController
  def incoming
    @phone_number = params[:From]
    @body = params[:Body]

    # output = process_message("WOOOO", )
    respond(output)
  end



  private

  def process_message(message, subscriber)
      if message == 'yes'
        output = "Great, we will let them know that you're available"
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
