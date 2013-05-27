class ApplicationController < ActionController::Base
  protect_from_forgery

  def authenticate_active_admin_user!
  	authenticate_user!
  	unless current_user.admin?
  		flash[:alert] = "Unauthorized Access!"
  		redirect_to root_path
  	end
  end

  protected

	  def after_sign_in_path_for(resource)
	    congratulations_url
	  end

	  def after_sign_out_path_for(resource)
	    root_url
	  end
end
