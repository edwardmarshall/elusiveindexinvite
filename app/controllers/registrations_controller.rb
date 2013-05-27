class RegistrationsController < Devise::RegistrationsController
	def new
		@body_class = "register"

		super
	end

	protected
		
		def after_inactive_sign_up_path_for(resource)
			reminder_path
		end
end