class ConfirmationService
  def initialize(offer)
    @offer = offer[0]
    @client = Twilio::REST::Client.new Rails.application.secrets.twilio_sid, Rails.application.secrets.twilio_token
  end

  def call
    @client.messages.create(
      from: Rails.application.secrets.twilio_number,
      to: "+1" + @offer.teacher.phone_number,
      body: "You've been selected to fill opening "\
      "#{@offer.request.id}.\n\n"\
      "Please respond 'confirm #{@offer.request.id}' to this text if you are available."
    )
  end
end
