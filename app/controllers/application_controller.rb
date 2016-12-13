class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  add_flash_types :success, :info, :warning, :danger

  helper_method :current_user
  before_action :authorize!

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authorize!
  	render file: 'public/404', danger: "You are not authorized to view this page" unless authorized?
  end

  def authorized?
  	PermissionsService.new(current_user, params[:controller], params[:action]).allow?
  end


end
