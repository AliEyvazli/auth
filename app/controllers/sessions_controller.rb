class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user.nil?
      redirect_to login_path, flash: { error: "Invalid email or password" }
    elsif user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to posts_path, flash: { notice: "Logged in successfully" }
    else
      redirect_to login_path, flash: { error: "Invalid email or password" }
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, flash: { notice: "Logged out successfully" }
  end
end
