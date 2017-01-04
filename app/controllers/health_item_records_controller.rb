class HealthItemRecordsController < ApplicationController
  before_action :set_health_item_record, only: [:show, :edit, :update, :destroy]

  # GET /health_item_records
  # GET /health_item_records.json
  def index
    @health_item_records = HealthItemRecord.all
  end

  # GET /health_item_records/1
  # GET /health_item_records/1.json
  def show
  end

  # GET /health_item_records/new
  def new
    @health_item_record = HealthItemRecord.new
  end

  # GET /health_item_records/1/edit
  def edit
  end

  # POST /health_item_records
  # POST /health_item_records.json
  def create
    @health_item_record = HealthItemRecord.new(health_item_record_params)

    respond_to do |format|
      if @health_item_record.save
        format.html { redirect_to @health_item_record, notice: 'Health item record was successfully created.' }
        format.json { render :show, status: :created, location: @health_item_record }
      else
        format.html { render :new }
        format.json { render json: @health_item_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /health_item_records/1
  # PATCH/PUT /health_item_records/1.json
  def update
    respond_to do |format|
      if @health_item_record.update(health_item_record_params)
        format.html { redirect_to @health_item_record, notice: 'Health item record was successfully updated.' }
        format.json { render :show, status: :ok, location: @health_item_record }
      else
        format.html { render :edit }
        format.json { render json: @health_item_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /health_item_records/1
  # DELETE /health_item_records/1.json
  def destroy
    @health_item_record.destroy
    respond_to do |format|
      format.html { redirect_to health_item_records_url, notice: 'Health item record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_health_item_record
      @health_item_record = HealthItemRecord.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def health_item_record_params
      params.fetch(:health_item_record, {})
    end
end
