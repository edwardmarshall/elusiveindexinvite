class ConfirmationsController < Devise::ConfirmationsController

	def show
        self.resource = resource_class.confirm_by_token(params[:confirmation_token])

        if resource.errors.empty?
            set_flash_message(:notice, :confirmed) if is_navigational_format?
            sign_in(resource_name, resource)

            # Send the user a second email          
            UserMailer.congratulations_email(resource).deliver

            respond_with_navigational(resource){ redirect_to after_confirmation_path_for(resource_name, resource) }
        else
            respond_with_navigational(resource.errors, :status => :unprocessable_entity){ render :new }
        end
    end

	protected

		def after_confirmation_path_for(resource_name, resource)
			congratulations_path
		end

end