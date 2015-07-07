class ManagementController < ApplicationController
  def show
    @teachers = Teacher.all
    @schools = School.all
  end

  def destroy
    @teacher = Teacher.find(params[:teacher][:id])

    if @teacher.destroy
      redirect_to manage_path, notice: "Successfully deleted profile"
    else
      render :show
    end
  end
end
