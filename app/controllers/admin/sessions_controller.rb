class Admin::SessionsController < AdminController
  skip_before_action :authentication_request
  before_action :set_user

  def create
    if @user&.authenticate(params[:password])
      token = jwt_encode({
        id: @user.id,
        name: @user.name,
        email: @user.email
      }, 7.days.from_now.to_i)
      session[:admin_token] = token
      render json: { token: , name: @user.name}, status: :ok
    else
      render json: { error: 'Incorrect credentials' }, status: :unprocessable_entity
    end
  end

  def destroy
    session.delete(:admin_token)
    render json: { message: 'Session closed successfully' }, status: :ok
  end

  def set_user
    @user = User.find_by(email: params[:email])
  end
end