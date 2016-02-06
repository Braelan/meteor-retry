class SessionsController < ApplicationController
  before_action :require_signed_out!, only: [:new, :create]
  before_action :require_signed_in!, only: [:destroy]

  def create
     #raise env['omniauth.auth'].to_yaml
    @user = omni_or_native

    if @user
      sign_in(@user)
      redirect_to '/'

    else
      flash.now[:errors] = ["invalid username or password"]
     redirect_to '/'
    end
  end


# will always create a user given an omniauth
  def omni_or_native
    if env['omniauth.auth']
      @user = User.from_omniauth(env['omniauth.auth'])
    else
    @user = User.find_by_credentials(
    params[:user][:name],
    params[:user][:password]
    )
    end
    @user
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
