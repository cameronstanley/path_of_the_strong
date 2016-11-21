class ProfileController < ApplicationController

  before_action :check_logged_in

  def index
    @profile = current_user
  end

  def update
    @profile = current_user

    if @profile.update(profile_params)
      flash[:success] = 'Profile was successfully updated.'
      redirect_to profile_path
    else
      flash.now[:error] = 'An error occurred. Please correct the issues on the form and resubmit.'
      render :index
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end
