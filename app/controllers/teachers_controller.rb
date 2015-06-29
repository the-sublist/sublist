class TeachersController < ApplicationController
  before_action :authenticate_teacher!
  before_action :set_teacher, only: [:edit, :update, :destroy, :show]

  def index
  end

  def edit
  end

  def show
  end

  def update
    if @teacher.update(teacher_params)
      redirect_to teacher_path(@teacher)
    else
      render :edit
    end
  end

  def destroy
    if @teacher.destroy
      redirect_to root_path, notice: "Successfully deleted profile"
    else
      render :show
    end
  end

  private

  def teacher_params
    params.require(:teacher).permit(
                                    :first_name,
                                    :last_name,
                                    :gender,
                                    :phone_number,
                                    :credentials,
                                    :age,
                                    :min_grade,
                                    :max_grade
                                    )
  end

  def set_teacher
    @teacher = Teacher.find(params[:id])
  end
end
