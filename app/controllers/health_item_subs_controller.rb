class HealthItemSubsController < ApplicationController
  before_action :set_health_item_sub, only: [:show, :edit, :update, :destroy]
  add_breadcrumb '项目管理', :health_items_path

  # GET /health_item_subs
  # GET /health_item_subs.json
  def index
    add_breadcrumb '子项目列表', :health_item_subs_path
    @health_item = HealthItem.find(params[:health_item_id])
    @health_item_subs = HealthItem.find(params[:health_item_id]).health_item_subs
  end

  # GET /health_item_subs/1
  # GET /health_item_subs/1.json
  def show
  end

  # GET /health_item_subs/new
  def new
    @health_item_sub = HealthItemSub.new
  end

  # GET /health_item_subs/1/edit
  def edit
  end

  # POST /health_item_subs
  # POST /health_item_subs.json
  def create
    @health_item_sub = HealthItemSub.new(health_item_sub_params)
    
    respond_to do |format|
      if @health_item_sub.save
        format.html { redirect_to health_item_subs_url(health_item_id: params[:health_item_sub][:health_item_id]), notice: '添加成功' }
        format.json { render :show, status: :created, location: @health_item_sub }
      else
        format.html { redirect_to health_item_subs_url(health_item_id: params[:health_item_sub][:health_item_id]) }
        format.json { render json: @health_item_sub.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /health_item_subs/1
  # PATCH/PUT /health_item_subs/1.json
  def update
    respond_to do |format|
      if @health_item_sub.update(health_item_sub_params)
        format.html { redirect_to @health_item_sub, notice: 'Health item sub was successfully updated.' }
        format.json { render :show, status: :ok, location: @health_item_sub }
      else
        format.html { render :edit }
        format.json { render json: @health_item_sub.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /health_item_subs/1
  # DELETE /health_item_subs/1.json
  def destroy
    @health_item_sub.destroy
    respond_to do |format|
      format.html { redirect_to health_item_subs_url(health_item_id: params[:health_item_id]), notice: '删除成功' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_health_item_sub
      @health_item_sub = HealthItemSub.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def health_item_sub_params
      params.fetch(:health_item_sub, {}).permit(:name, :sub_unit, :sub_max, :sub_min, :sub_value_range, :health_item_id)
    end
end
