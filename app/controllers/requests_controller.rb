class RequestsController < ApplicationController
  before_action :authenticate_school!

  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)

    if @request.save
      @teachers = Teacher.where("min_grade <= ? AND max_grade >= ?", request_params[:grade], request_params[:grade])

      # teachers.each do |t|
      #   CreateOfferService.new(t, @request).call
      # end
      redirect_to school_path(current_school)
    end
  end
  #
  # def show
  #   @offers = Offer.where(request_id: params[:id])
  # end
  #
  private
    def request_params
      params.require(:request).permit(:request_name, :date, :start_time, :end_time, :payment, :grade, :school_id)
    end
end
