class SmsService
  def initialize(teacher, request, school)
    @teacher = teacher
    @request = request
    @school = school
    @client = Twilio::REST::Client.new Rails.application.secrets.twilio_sid, Rails.application.secrets.twilio_token
  end

  def call
    @client.messages.create(
      from: Rails.application.secrets.twilio_number,
      to: "+1" + @teacher.phone_number,
      body: "Hello, #{@teacher.full_name}.\n\n"\
      "#{@school.school_name} at #{@school.address} has an opening "\
      "to teach #{@request.format_grade} on #{@request.formatted_datetime}. "\
      "Compensation for this position is #{@request.payment} dollars.\n\n"\
      "This is request ID:#{@request.id}. "\
      "Please respond 'yes #{@request.id}' to this text if you are available."
    )
  end
end
