class HomeController < ApplicationController
  before_action :access_user
  def index
    @weightDevice = WeightDevice.all()
  end

  private
  def access_user
    if user_signed_in?
      respond_to do |format|
        format.html { redirect_to '/admin/index/' }
      end
    end 
  end
end