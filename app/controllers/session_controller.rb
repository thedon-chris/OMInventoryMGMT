class SessionController < ApplicationController
  skip_before_action :authorize


  def new
  end

  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to root_path,
      notice: "Successfull Log In!"
    else
      redirect_to home_path,
      notice: "Log In Failed!"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path,
    notice: "You Have Signed out!"
  end

end
