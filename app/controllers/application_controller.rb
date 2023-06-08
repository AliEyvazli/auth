class ApplicationController < ActionController::Base
  before_action :current_user

  def current_user
    puts "------------------ code before every request ------------------"
    # TODO: Set @current_user based on the logged-in user
  end

  helper_method :logged_in?

  def logged_in?
    current_user.present?
  end
end
