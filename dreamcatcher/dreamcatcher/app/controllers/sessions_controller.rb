class SessionsController < ApplicationController
  before_action :require_signed_out!, only: [:new, :create]
  before_action :require_signed_in!, only: [:destroy]

  def create
    @user = User.find_by_credentials(
    params[:user][:name],
    params[:user][:password]
    )

    if @user
      sign_in(@user)
      redirect_to '/'

    else
      flash.now[:errors] = ["invalid username or password"]
     redirect_to '/'
    end
  end

  def destroy
    sign_out
    redirect_to '/'
  end

  def show
    @current_user = current_user
    if @current_user
      render "show.json"
    else render :json => {}.to_json
    end
  end

  private

  def session_params
    params.require(:user).permit(:name, :password)
  end
end
