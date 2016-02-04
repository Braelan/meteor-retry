class SiteController < ApplicationController
  def root
    @user = current_user
  end
end
