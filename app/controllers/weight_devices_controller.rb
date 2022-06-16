class WeightDevicesController < ApplicationController
  layout 'admin'
  before_action :set_weight_device, only: %i[ show edit update destroy ]

  # GET /weight_devices or /weight_devices.json
  def index
    @weight_devices = WeightDevice.all
    @outlets = Outlet.all
  end

  # GET /weight_devices/1 or /weight_devices/1.json
  def show
  end

  def dashboard
    @weight_devices = WeightDevice.all
    @outlets = Outlet.all
    @weight_data = WeightDatum.order('created_at DESC')
    @weight_data_1 = WeightDatum.all
  end
  # GET /weight_devices/new
  def new
    @weight_device = WeightDevice.new
  end

  # GET /weight_devices/1/edit
  def edit
  end

  # POST /weight_devices or /weight_devices.json
  def create
    @weight_device = WeightDevice.new(weight_device_params)

    respond_to do |format|
      if @weight_device.save
        format.html { redirect_to weight_device_url(@weight_device), notice: "Weight device was successfully created." }
        format.json { render :show, status: :created, location: @weight_device }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @weight_device.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /weight_devices/1 or /weight_devices/1.json
  def update
    respond_to do |format|
      if @weight_device.update(weight_device_params)
        format.html { redirect_to weight_device_url(@weight_device), notice: "Weight device was successfully updated." }
        format.json { respond_with_bip(@weight_device) }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { respond_with_bip(@weight_device) }
      end
    end
  end

  # DELETE /weight_devices/1 or /weight_devices/1.json
  def destroy
    @weight_device.destroy

    respond_to do |format|
      format.html { redirect_to weight_devices_url, notice: "Weight device was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_weight_device
      @weight_device = WeightDevice.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def weight_device_params
      params.require(:weight_device).permit(:id,:weight_device,:outlet_name)
    end
end
