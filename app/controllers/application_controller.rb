class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate # if Rails.env == "production"

  def authenticate
    authenticate_or_request_with_http_basic do |user_name, password|
      # Change these to username and password required
      user_name == "shitlister" && password == "letmein"
    end
  end
end
