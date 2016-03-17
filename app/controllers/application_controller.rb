class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include LocalSubdomain
    
    before_filter :configure_permitted_parameters, if: :devise_controller?
  
   protected
     def configure_permitted_parameters
       devise_parameter_sanitizer.for(:sign_up) << :name
       devise_parameter_sanitizer.for(:sign_up) << :phone
       devise_parameter_sanitizer.for(:account_update) << :name
       devise_parameter_sanitizer.for(:account_update) << :phone
       devise_parameter_sanitizer.for(:account_update) << :bio
       devise_parameter_sanitizer.for(:account_update) << :avatar 
   end

end
