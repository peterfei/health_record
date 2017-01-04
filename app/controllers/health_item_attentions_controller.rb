class HealthItemAttentionsController < ApplicationController
  before_action :set_health_item_attention, only: [:show, :edit, :update, :destroy]

  # GET /health_item_attentions
  # GET /health_item_attentions.json
  def index
    @health_item_attentions = HealthItemAttention.all
  end

  # GET /health_item_attentions/1
  # GET /health_item_attentions/1.json
  def show
  end

  # GET /health_item_attentions/new
  def new
    @health_item_attention = HealthItemAttention.new
  end

  # GET /health_item_attentions/1/edit
  def edit
  end

  # POST /health_item_attentions
  # POST /health_item_attentions.json
  def create
    @health_item_attention = HealthItemAttention.new(health_item_attention_params)

    respond_to do |format|
      if @health_item_attention.save
        format.html { redirect_to @health_item_attention, notice: 'Health item attention was successfully created.' }
        format.json { render :show, status: :created, location: @health_item_attention }
      else
        format.html { render :new }
        format.json { render json: @health_item_attention.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /health_item_attentions/1
  # PATCH/PUT /health_item_attentions/1.json
  def update
    respond_to do |format|
      if @health_item_attention.update(health_item_attention_params)
        format.html { redirect_to @health_item_attention, notice: 'Health item attention was successfully updated.' }
        format.json { render :show, status: :ok, location: @health_item_attention }
      else
        format.html { render :edit }
        format.json { render json: @health_item_attention.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /health_item_attentions/1
  # DELETE /health_item_attentions/1.json
  def destroy
    @health_item_attention.destroy
    respond_to do |format|
      format.html { redirect_to health_item_attentions_url, notice: 'Health item attention was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_health_item_attention
      @health_item_attention = HealthItemAttention.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def health_item_attention_params
      params.fetch(:health_item_attention, {})
    end
end
