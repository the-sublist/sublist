class NotificationsController < ApplicationController
  def incoming
    @phone_number = params[:From][2..-1]
    @body = params[:Body]

    request_id = @body.gsub(/[^0-9]/, "")
    answer = @body.gsub(/[^A-z]/, "")

    @request = Request.find(request_id)
    @teacher = Teacher.find_by(phone_number: @phone_number)
    @offer = Offer.find_by_teacher_id_and_request_id(@teacher.id, @request.id)

    output = process_message(answer)
    respond(output)
  end



  private

  def process_message(message)
      if message.downcase == 'yes'
        @offer.update_attribute(:available, true)
        @offer.save
        output =  "Great. Sit tight, while we reach out to the school."




      elsif message.downcase == 'confirm'
        if @offer.available == true && @offer.confirmation_sent == true
          # find offer, change confirmed to true.
          @offer.update_attribute(:confirmed, true)
          @offer.save
          # Find request set to filled
          @request.update_attribute(:active, false)
          output = "You're all set, if you have any questions call (415) 555-5555."
        end



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
