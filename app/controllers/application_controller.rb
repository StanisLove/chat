class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_user_data

  private

    def not_authenticated
      redirect_to login_path, alert: "Please login first"
    end

    def set_user_data
      @ip = request.remote_ip
    end
end
