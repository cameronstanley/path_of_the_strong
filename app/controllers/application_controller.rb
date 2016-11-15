class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def check_logged_in
    unless logged_in?
      redirect_to login_path
    end
  end
end
