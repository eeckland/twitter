class ApplicationController < ActionController::Base
	def configure_permitted_parameter
		devise_parameter_sanitizer.permit(:sign_up, keys:[:username,:name,:bio,:location])
		devise_parameter_sanitizer.permit(:account_up, keys:[:username,:name,:bio,:location])

	end
end
