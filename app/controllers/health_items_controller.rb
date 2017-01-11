class HealthItemsController < ApplicationController
  before_action :set_health_item, only: [:show, :edit, :update, :destroy]
  add_breadcrumb '项目管理', :health_items_path

  # GET /health_items
  # GET /health_items.json
  def index
    @name = params[:q][:name_cont] if params[:q].present?
    @q=HealthItem.all.ransack(params[:q])
    @health_items = @q.result.page(params[:page])
  end

  # GET /health_items/1
  # GET /health_items/1.json
  def show
  end

  # GET /health_items/new
  def new
    add_breadcrumb "新增项目", :new_health_item_path
    @health_item = HealthItem.new
  end

  # GET /health_items/1/edit
  def edit
    add_breadcrumb "编辑", :edit_health_item_path
  end

  # POST /health_items
  # POST /health_items.json
  def create
    @health_item = HealthItem.new(health_item_params)

    respond_to do |format|
      if @health_item.save
        format.html { redirect_to health_items_path, notice: '新增成功！' }
        format.json { render :show, status: :created, location: @health_item }
      else
        format.html { render :new }
        format.json { render json: @health_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /health_items/1
  # PATCH/PUT /health_items/1.json
  def update
    respond_to do |format|
      if @health_item.update(health_item_params)
        format.html { redirect_to @health_item, notice: 'Health item was successfully updated.' }
        format.json { render :show, status: :ok, location: @health_item }
      else
        format.html { render :edit }
        format.json { render json: @health_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /health_items/1
  # DELETE /health_items/1.json
  def destroy
    @health_item.destroy
    respond_to do |format|
      format.html { redirect_to health_items_url, notice: '删除成功！' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_health_item
      @health_item = HealthItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def health_item_params
      params.fetch(:health_item, {}).permit(:name, :unit, :normal_min, :normal_max)
    end
end
