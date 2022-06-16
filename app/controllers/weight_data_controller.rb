class WeightDataController < ApplicationController
  layout 'admin'
  before_action :set_weight_datum, only: %i[ show edit update destroy ]

  # GET /weight_data or /weight_data.json
  def index
    @weight_data = WeightDatum.all
  end

  # GET /weight_data/1 or /weight_data/1.json
  def show
  end

  # GET /weight_data/new
  def new
    @weight_datum = WeightDatum.new
  end

  # GET /weight_data/1/edit
  def edit
  end

  # POST /weight_data or /weight_data.json
  def create
    @weight_datum = WeightDatum.new(weight_datum_params)

    respond_to do |format|
      if @weight_datum.save
        format.html { redirect_to weight_datum_url(@weight_datum), notice: "Weight datum was successfully created." }
        format.json { render :show, status: :created, location: @weight_datum }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @weight_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /weight_data/1 or /weight_data/1.json
  def update
    respond_to do |format|
      if @weight_datum.update(weight_datum_params)
        format.html { redirect_to weight_datum_url(@weight_datum), notice: "Weight datum was successfully updated." }
        format.json { render :show, status: :ok, location: @weight_datum }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @weight_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /weight_data/1 or /weight_data/1.json
  def destroy
    @weight_datum.destroy

    respond_to do |format|
      format.html { redirect_to weight_data_url, notice: "Weight datum was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_weight_datum
      @weight_datum = WeightDatum.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def weight_datum_params
      params.fetch(:weight_datum, {})
    end
end
