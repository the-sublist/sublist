class HomeController < ApplicationController
  before_filter :redirect_if_remembered
  protected
  def redirect_if_remembered
    redirect_to teacher_path(current_teacher) if current_teacher
    redirect_to school_path(current_school) if current_school
  end
end
