class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied, :with => :access_denied

  private

  def access_denied
    flash[:alert] = 'You are not authorized to visit this page'
    redirect_to root_path
  end

end
