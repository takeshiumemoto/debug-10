class ApplicationController < ActionController::Base
before_action :configure_permitted_parameters, if: :devise_controller?
before_action :authenticate_user!, except: [:top,:about]

  def after_sign_in_path_for(resource)
    user_path(resource)
  end 
  
  def after_sign_out_path_for(resource)
    root_path
  end
  
  
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:email])
  end
  
  def create
    if session[:user_id]
      flash[:notice] 
    else 
      render :root_to
    end   
  end   
  def handle_unauthenticated_user
    unless user_signed_in?
    redirect_to 'users/sign_in'
    end
  end
end 

  