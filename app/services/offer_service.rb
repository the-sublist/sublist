class OfferService
  def initialize(teachers, request, school)
    @teachers = teachers
    @request = request
    @school = school
  end

  def call
    @teachers.each do |teacher|
      Offer.create!(teacher_id: teacher.id, request_id: @request.id)
      NotificationService.new(teacher, @request, @school).call
    end
  end
end
