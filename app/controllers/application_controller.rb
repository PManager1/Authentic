class ApplicationController < ActionController::Base
  protect_from_forgery

  def logged_in?
    cookies[:auth].present?
  end

  def authenticate
    unless logged_in?
      authenticate_or_request_with_http_basic do |login,password|
        if(login == "jai" && password == "pratik")
          cookies[:auth] = login
        end
      end
    end
  end
end

