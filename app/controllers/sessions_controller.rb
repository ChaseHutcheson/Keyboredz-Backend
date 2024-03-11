class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      render json: user, status: :ok
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end

  def destroy
    if current_user
      session[:user_id] = nil
      render json: { message: 'Logout successful' }, status: :ok
    else
      render json: { error: 'Not logged in' }, status: :unprocessable_entity
    end
  end

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
end
