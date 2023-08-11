
class AuthenticationController < ApplicationController
  skip_before_action :authenticate_request
  # before_action :authorize_request, except: :login

  def login
    @user =User.find_by_email(params[:email])
    if @user&.authenticate(params[:password])
      token = jwt_encode(user_id: @user.id)
      render json: { token: token }, status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized 
    end
  end
 

end

# eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxNywiZXhwIjoxNjkyMjY0MDc2fQ.DsJU2trszRK1XYmxZruMUakjyx9sXHGe4XBR2Et_eG8