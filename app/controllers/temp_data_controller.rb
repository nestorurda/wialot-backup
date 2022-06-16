class TempDataController < ApplicationController
  layout 'admin'
  before_action :set_temp_datum, only: %i[ show edit update destroy ]

  # GET /temp_data or /temp_data.json
  def index
    @data_temp = WialotDatum.where(device_type:'1')
  end

  # GET /temp_data/1 or /temp_data/1.json
  def show
  end

  # GET /temp_data/new
  def new
    @temp_datum = TempDatum.new
  end

  # GET /temp_data/1/edit
  def edit
  end

  # POST /temp_data or /temp_data.json
  def create
    @temp_datum = TempDatum.new(temp_datum_params)

    respond_to do |format|
      if @temp_datum.save
        format.html { redirect_to temp_datum_url(@temp_datum), notice: "Temp datum was successfully created." }
        format.json { render :show, status: :created, location: @temp_datum }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @temp_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /temp_data/1 or /temp_data/1.json
  def update
    respond_to do |format|
      if @temp_datum.update(temp_datum_params)
        format.html { redirect_to temp_datum_url(@temp_datum), notice: "Temp datum was successfully updated." }
        format.json { render :show, status: :ok, location: @temp_datum }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @temp_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /temp_data/1 or /temp_data/1.json
  def destroy
    @temp_datum.destroy

    respond_to do |format|
      format.html { redirect_to temp_data_url, notice: "Temp datum was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_temp_datum
      @temp_datum = TempDatum.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def temp_datum_params
      params.fetch(:temp_datum, {})
    end
end
