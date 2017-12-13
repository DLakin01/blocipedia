class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def modify_role (user)

    @user = User.find(user.id)
    if @user.role == 'standard'
      @user.assign_attributes(role: 1)
    elsif @user.role == 'premium'
      @user.assign_attributes(role: 0)
    end

    if @user.save
      flash[:notice] = "Your role and permissions have been updated."
      redirect_to @user
    else
      flash.now[:alert] = "Your role and permissions could not be updated. Please try again."
    end
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end
end
