class SessionsController < ApplicationController
  
  def new
  end

# If the user exists AND the password entered is correct.
def create
  user = User.find_by_email(params[:email])

  if user = User.authenticate_with_credentials(params[:email], params[:password])
    session[:user_id] = user.id
    redirect_to '/'
  else
    flash.now[:error] = "Invalid email/password"
    render 'new'
  end
end


  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end
