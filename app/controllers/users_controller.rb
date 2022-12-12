class UsersController < ApplicationController
  def index
    users = User.all
    render json: users
  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.signup_email(@user).deliver_later
      render json: {message: "User Created!"}
    else
      render json: @user.errors.messages, status: :unprocessable_entity
    end
  end

  def show
    @user = User.find_by(params[:id])
    render json: user
  end

  private

  def user_params
    params.require(:user).permit(:email, :password_digest)
  end
end
