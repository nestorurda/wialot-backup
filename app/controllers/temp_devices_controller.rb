class TempDevicesController < ApplicationController
  layout 'admin'
  before_action :set_temp_device, only: %i[ show edit update destroy ]

  # GET /temp_devices or /temp_devices.json
  def index
    @temp_devices = WialotDevice.where(device_type:'1')
  end

  # GET /temp_devices/1 or /temp_devices/1.json
  def show
  end

  def dashboard
    @temp_devices = WialotDevice.where(device_type:'1')
    @data_temp = WialotDatum.where(device_type:'1').limit(7).order('create_at DESC')
  
    data_g = []
    WialotDatum.limit(10).order('create_at DESC').each do |temp|       
    data_g.push([temp.create_at, temp.measure]) 
    end         
    @data_grafica = data_g  
  end

  def update_grafico
    data_g = []
    WialotDatum.limit(10).order('create_at DESC').each do |temp|       
    data_g.push([temp.create_at, temp.measure]) 
    end
    @data_grafica = data_g
    render json: @data_grafica    
  end



  # GET /temp_devices/new
  def new
    @temp_device = WialotDevice.new
  end


  # GET /temp_devices/1/edit
  def edit
  end

  # POST /temp_devices or /temp_devices.json
  def create
    @temp_device = TempDevice.new(temp_device_params)

    respond_to do |format|
      if @temp_device.save
        format.html { redirect_to temp_device_url(@temp_device), notice: "Temp device was successfully created." }
        format.json { render :show, status: :created, location: @temp_device }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @temp_device.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /temp_devices/1 or /temp_devices/1.json
  def update
    respond_to do |format|
      if @temp_device.update(temp_device_params)
        format.html { redirect_to temp_device_url(@temp_device), notice: "Temp device was successfully updated." }
        format.json { render :show, status: :ok, location: @temp_device }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @temp_device.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /temp_devices/1 or /temp_devices/1.json
  def destroy
    @temp_device.destroy

    respond_to do |format|
      format.html { redirect_to temp_devices_url, notice: "Temp device was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_temp_device
      @temp_device = TempDevice.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def temp_device_params
      params.fetch(:temp_device, {})
    end
end
