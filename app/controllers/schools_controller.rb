class SchoolsController < ApplicationController
  before_action :authenticate_school!
  before_action :set_school, only: [:edit, :update, :destroy, :show]

  def index
  end

  def edit
  end

  def show
    @requests = Request.where(school_id: current_school.id)
  end

  def update
    if @school.update(school_params)
      redirect_to school_path(@school)
    else
      render :edit
    end
  end

  def destroy
    if @school.destroy
      redirect_to root_path, notice: "Successfully deleted profile"
    else
      render :show
    end
  end

  private

  def school_params
    params.require(:school).permit(
                                    :school_name,
                                    :contact_phone,
                                    :address
                                    )
  end

  def set_school
    @school = School.find(params[:id])
  end
end
