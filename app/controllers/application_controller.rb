class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :basic_authenticate
  before_action :get_browser_info

  private

  def basic_authenticate
    return if Rails.env.test?

    authenticate_or_request_with_http_basic do |username, password|
      username == 'bake' && password == 'somecookies'
    end

  end

  def get_browser_info
    @browser = Browser.new request.user_agent
  end
end
