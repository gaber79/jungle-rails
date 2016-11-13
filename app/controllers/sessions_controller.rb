class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    # if the user exists AND the password entered is correct
    if user && user.authenticate(params[:password])
      # Save the user id inside the browser cookie. This is how we keep the user
      # logged in when they navigate around our site.
      session[:user_id] = user.id
      redirect_to '/'
    else
      # If User's login doesn't work, send them back to login form.
      redirect_to '/signup'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/signup'
  end
end
