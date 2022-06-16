class AdminController < ApplicationController
  before_action :authenticate_user!
  layout 'admin'
  def index
    @weight_devices = WeightDevice.all
    @outlets = Outlet.all
    @weight_data = WeightDatum.order('created_at DESC')
    @weight_data_1 = WeightDatum.all
  end
end
