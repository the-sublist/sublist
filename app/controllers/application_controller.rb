class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    if resource.is_a?(School)
      school_path
    elsif resource.is_a?(Teacher)
      teacher_path(current_teacher)
    end
  end
end
