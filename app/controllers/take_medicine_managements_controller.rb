class TakeMedicineManagementsController < ApplicationController
  before_action :set_take_medicine_management, only: [:show, :edit, :update, :destroy]

  # GET /take_medicine_managements
  # GET /take_medicine_managements.json
  def index
    @take_medicine_managements = TakeMedicineManagement.all
  end

  # GET /take_medicine_managements/1
  # GET /take_medicine_managements/1.json
  def show
  end

  # GET /take_medicine_managements/new
  def new
    @take_medicine_management = TakeMedicineManagement.new
  end

  # GET /take_medicine_managements/1/edit
  def edit
  end

  # POST /take_medicine_managements
  # POST /take_medicine_managements.json
  def create
    @take_medicine_management = TakeMedicineManagement.new(take_medicine_management_params)

    respond_to do |format|
      if @take_medicine_management.save
        format.html { redirect_to @take_medicine_management, notice: 'Take medicine management was successfully created.' }
        format.json { render :show, status: :created, location: @take_medicine_management }
      else
        format.html { render :new }
        format.json { render json: @take_medicine_management.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /take_medicine_managements/1
  # PATCH/PUT /take_medicine_managements/1.json
  def update
    respond_to do |format|
      if @take_medicine_management.update(take_medicine_management_params)
        format.html { redirect_to @take_medicine_management, notice: 'Take medicine management was successfully updated.' }
        format.json { render :show, status: :ok, location: @take_medicine_management }
      else
        format.html { render :edit }
        format.json { render json: @take_medicine_management.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /take_medicine_managements/1
  # DELETE /take_medicine_managements/1.json
  def destroy
    @take_medicine_management.destroy
    respond_to do |format|
      format.html { redirect_to take_medicine_managements_url, notice: 'Take medicine management was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_take_medicine_management
      @take_medicine_management = TakeMedicineManagement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def take_medicine_management_params
      params.fetch(:take_medicine_management, {})
    end
end
