class XusersController < ApplicationController
  def create
    @xuser = Xuser.create({:zodiac =>params[:zodiac]})
    render :text "created an xuser"
  end

  private


end
