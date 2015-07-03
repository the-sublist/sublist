class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # before_filter :redirect_id_remembered

  def after_sign_in_path_for(resource)
    if resource.is_a?(School)
      school_path(current_school)
    elsif resource.is_a?(Teacher)
      teacher_path(current_teacher)
    end
  end

  def after_sign_up_path_for(resource)
    if resource.is_a?(School)
      root_path
    elsif resource.is_a?(Teacher)
      teacher_path(current_teacher)
    end
  end

  # private
  #
  #   def redirect_id_remembered
  #     if current_teacher
  #       redirect_to teacher_path(current_teacher)
  #     elsif current_school
  #       redirect_to school_path(current_school)
  #     end
  #   end
end
