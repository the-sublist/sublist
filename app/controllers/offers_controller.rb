class OffersController < ApplicationController
  def send_confirmation
    @offer = Offer.where(id: params[:offer][:id]).includes(:teacher, :request)
    @offer[0].update_attribute(:confirmation_sent, true)
    ConfirmationService.new(@offer)
    render json: @offer
  end
end
