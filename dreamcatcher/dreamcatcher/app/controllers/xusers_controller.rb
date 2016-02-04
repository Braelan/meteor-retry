class XusersController < ApplicationController
  def create
    @xuser = Xuser.create({:zodiac =>params[:zodiac]})
    render :new
  end

  private


end
