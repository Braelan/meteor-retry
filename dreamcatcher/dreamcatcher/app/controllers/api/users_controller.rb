class Api::UsersController < ApplicationController

  def create
    @user = User.new(user_params)

    if params[:user][:password_confirmation] && @user.save
      sign_in(@user)
      redirect_to "/"
    else
      if params[:user][:password_confirmation] != user_params[:password]
        flash.now[:errors] = ["**Passwords do not match**"]
      end
    end
      flash.now[:errors] = flash.now[:errors] ? flash.now[:errors] : @user.errors.full_messages

  end

  private

  def user_params
    params.require(:user).permit(:name, :password)
  end


end
