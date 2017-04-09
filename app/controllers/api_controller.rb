class ApiController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_default_format

  private

  def set_default_format
    request.format = :json
  end
end
