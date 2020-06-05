class ApplicationController < ActionController::Base
		  before_action :configure_permitted_parameters, if: :devise_controller?
 after_action :store_action
  
  def store_action
    return unless request.get? 
    if (request.path != "/lecteurs/sign_in" &&
        request.path != "/lecteurs/sign_up" &&
        request.path != "/lecteurs/password/new" &&
        request.path != "/lecteurs/password/edit" &&
        request.path != "/lecteurs/confirmation" &&
        request.path != "/lecteurs/sign_out" &&
        !request.xhr?) # don't store ajax calls
      store_location_for(:lecteur, request.fullpath)
    end
  end
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :nom, :password, :password_confirmartion])
	  devise_parameter_sanitizer.permit(:account_update, keys: [:email, :nom, :avatar, :password, :password_confirmartion, :current_password])
  end
	
end
