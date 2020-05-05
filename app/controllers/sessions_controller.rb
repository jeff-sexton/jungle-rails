class SessionsController < ApplicationController
  def new
    @message = nil
  end

  def create
    if user = User.authenticate_with_credentials(params[:email], params[:password])
      session[:user_id] = user.id
      redirect_to '/'
    else
      # If user's login doesn't work, send them back to the login form.
      @message = 'Sorry! Email and password do not match.'
      render 'sessions/new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end
