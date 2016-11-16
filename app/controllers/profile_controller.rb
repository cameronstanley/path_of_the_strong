class ProfileController < ApplicationController

  before_action :check_logged_in

  def index
    @profile = current_user
  end

end
