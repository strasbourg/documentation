class ApplicationController < ActionController::Base
  prepend_before_filter :protect_application!

  protected
  def protect_application!
    return true unless ENV['PROTECTION_PASSWORD']
    authenticate_or_request_with_http_basic do |username, password|
      password == ENV['PROTECTION_PASSWORD']
    end
  end

  def self.log_request(scope: nil)
    instance_eval do
      before_filter do |c|
        ApiRequest.create ip_address: request.remote_ip, params: params.permit(:id, :controller, :action)
      end
    end
  end
end
