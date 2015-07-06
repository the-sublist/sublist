class CancellationService
  def initialize(request)
    @request = request
    @client = Twilio::REST::Client.new Rails.application.secrets.twilio_sid, Rails.application.secrets.twilio_token
    @offers = Offer.where(request_id: request.id, confirmed: false).includes(:teacher)
  end

  def call
    @offers.each do |offer|
      @client.messages.create(
        from: Rails.application.secrets.twilio_number,
        to: "+1" + offer.teacher.phone_number,
        body: "Opening ID:#{@request.id} has been filled or cancelled. "\
        "We will let you know as more openings become available."
      )
    end
  end
end
