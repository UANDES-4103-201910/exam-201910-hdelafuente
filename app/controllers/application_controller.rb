class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout proc { logged_in ? "logged_in" : "application" }

  def index
  end

  def logged_in
    if session["warden.user.user.key"] then true else false end
  end
end
