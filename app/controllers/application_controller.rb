class ApplicationController < ActionController::Base
  include JsonWebToken
  include ApplicationHelper
  skip_before_action :verify_authenticity_token
  before_action :authenticate_request

  protect_from_forgery with: :exception
  
  def not_found
    render json: { error: 'not_found' }
end



  private
    def authenticate_request
      header = request.headers["Authorization"]
      header = header.split(" ").last if header
      decoded = jwt_decode(header)
      @current_user = User.find(decoded[:user_id])
    end


end
