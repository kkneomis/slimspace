class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include LocalSubdomain
    
    before_filter :configure_permitted_parameters, if: :devise_controller?
  
   protected
     def configure_permitted_parameters
       devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
       devise_parameter_sanitizer.permit(:sign_up, keys: [:phone])
       devise_parameter_sanitizer.permit(:sign_up, keys: [:street])
       devise_parameter_sanitizer.permit(:sign_up, keys: [:city])
       devise_parameter_sanitizer.permit(:sign_up, keys: [:state])
       devise_parameter_sanitizer.permit(:sign_up, keys: [:zip])
       devise_parameter_sanitizer.permit(:account_update, keys: [:name])
       devise_parameter_sanitizer.permit(:account_update, keys: [:phone])
       devise_parameter_sanitizer.permit(:account_update, keys: [:bio])
       devise_parameter_sanitizer.permit(:account_update, keys: [:avatar])
       devise_parameter_sanitizer.permit(:account_update, keys: [:street])
       devise_parameter_sanitizer.permit(:account_update, keys: [:city])
       devise_parameter_sanitizer.permit(:account_update, keys: [:state])
       devise_parameter_sanitizer.permit(:account_update, keys: [:zip])
     end

end
