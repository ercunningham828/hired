class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  protect_from_forgery with: :exception

  rescue_from Pundit::NotAuthorizedError do |exception|
     redirect_to root_url, alert: "You are not allowed to access this."
   end

  def pundit_user
    current_admin
  end
end
