class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :set_time_zone, if: :user_signed_in?

  def index
  end

  private

  def set_time_zone
    Time.zone = current_user.time_zone
  end

end
