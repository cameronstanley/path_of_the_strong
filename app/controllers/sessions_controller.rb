class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to dashboard_path
    else
      flash.now[:error] = 'Email/password invalid.'
      render :new
    end
  end

  def destroy
    log_out
    flash[:success] = 'Successfully logged out.'
    redirect_to root_path
  end

end
