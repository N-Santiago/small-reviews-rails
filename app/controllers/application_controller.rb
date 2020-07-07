class ApplicationController < ActionController::Base
    # include Pundit
    # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
    protect_from_forgery with: :exception
    before_action :authenticate_user!, except: [:home, :index, :show] 
    before_action :configure_permitted_parameters, if: :devise_controller?
    helper_method :current_user
    
  def logged_in?
    !!current_user
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  private 
  
    def user_not_authorized
      flash[:alert] = "Ooops sorry. You don't have access to this."
      redirect_to (request.referrer || root_path)
    end   

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
        devise_parameter_sanitizer.permit(:account_update, keys: [:username])
    end

end
