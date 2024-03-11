class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    existing_user = User.find_by(email: user_params[:email])

    if existing_user
      render json: { error: 'User with the email already exists' }, status: :unprocessable_entity
    else
      @user = User.new(user_params)

      if @user.save
        render json: @user, status: :created
      else
        render json: { error: @user.errors.full_messages.join(', ') }, status: :unprocessable_entity
      end
    end
  end

  private

  def user_params
    # Permit top-level keys directly
    params.permit(:username, :email, :password, :password_confirmation)
  end
end
