class SessionController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to root_path
      puts "Success"
    else
      render :new
      puts "Fail"

    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end
