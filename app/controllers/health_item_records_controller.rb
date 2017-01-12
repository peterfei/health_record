class HealthItemRecordsController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: [:get_health_items]
  before_action :set_health_item_record, only: [:show, :edit, :update, :destroy]
  add_breadcrumb '数据统计', :health_item_records_path

  # GET /health_item_records
  # GET /health_item_records.json
  def index
    if params[:q]
      @health_item_id = params[:q][:health_item_id_eq]
      @health_item = HealthItem.find(@health_item_id)
      @user_id = params[:q][:health_item_user_id_eq]
      @start_at = DateTime.parse(params[:q][:created_at_gt]).strftime('%Y-%m-%d') if params[:q][:created_at_gt].present?
      @end_at = DateTime.parse(params[:q][:created_at_lt]).strftime('%Y-%m-%d') if params[:q][:created_at_lt].present?
      @q = HealthItemRecord.all.ransack(params[:q])
      @health_item_records = @q.result
    else
      @health_item = HealthItem.where("user_id IS NOT NULL AND is_check=1").first
      @health_item_id = @health_item.id rescue nil
      @user_id = @health_item.user_id rescue nil
      @q = HealthItemRecord.where("health_item_id = ?", @health_item_id).ransack(params[:q])
      @health_item_records = @q.result
    end
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

  # ########################################################
  # | Author: wangyang
  # | Time: 2017-01-06 17:58:47
  # | Description: 获取用户选择的健康项目
  # | Args: user_id
  # ########################################################
  def get_health_items
    @health_items = HealthItem.where("user_id = ? AND is_check=1", params[:user_id])
    render json: @health_items
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
