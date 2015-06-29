class NotificationsController < ApplicationController
  def incoming
    @phone_number = params[:From]
    @response = params[:Body].gsub(/[^A-z]/, "")
    @request = Request.find(params[:Body].gsub(/[^0-9]/, ""))
    @teacher = Teacher.find_by(phone_number: @phone_number)
    @offer = Offer.where(teacher_id: @teacher.id, request_id: @request.id)

    output = process_message(@response)
    respond(output)
  end



  private

  def process_message(message)
      if message.downcase == 'yes'
        @offer.update_attribute(:available, true)
        @offer.save
        output =  "Great. The position pays #{@request.payment.to_s} "\
                  "dollars and is for the hours #{@request.start_time} "\
                  "to #{@request.end_time}.\n Please reply "\
                  "'confirm #{@request.id}' to lock this job."
      elsif message.downcase == 'confirm'
        # find offer, change confirmed to true.
        # Find request set to filled
        output = "You're all set, if you have any questions call (415) 555-5555."
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
