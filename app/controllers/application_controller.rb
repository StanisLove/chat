class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_user_data

  private

    def not_authenticated
      redirect_to login_path, alert: "Please login first"
    end

    def set_user_data
      @ip = request.remote_ip
<<<<<<< HEAD
     # client = DeviceDetector.new(request.user_agent)
     # @device_name = client.device_name
     # @device_type = client.device_type
     # @device_brand = client.device_brand
=======
>>>>>>> 51b32c3bf407a9c20f0a0045b27704ab351719c0
    end
end
