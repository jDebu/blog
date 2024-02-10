class AdminController < ActionController::API
  include JsonWebToken
  before_action :authentication_request

  def authentication_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    header ||= session[:admin_token]
    decoded = jwt_decode(header)
    if decoded == 'Token not found'
      render json: { error: 'Not authenticated' }, status: :unauthorized
    else
      begin
        @current_user = User.find(decoded[:id])
      rescue ActiveRecord::RecordNotFound
        render json: { errors: 'User token not match'}, status: :not_found
      end
    end
  end
end
