class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      log_in user
      redirect_to dashboard_path
    else
      flash.now[:error] = 'Email/password invalid.'
      render :new
    end
  end

  def destroy
    log_out user
    redirect_to root_path
  end

end
