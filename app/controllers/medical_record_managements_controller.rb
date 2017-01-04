class MedicalRecordManagementsController < ApplicationController
  before_action :set_medical_record_management, only: [:show, :edit, :update, :destroy]

  # GET /medical_record_managements
  # GET /medical_record_managements.json
  def index
    @medical_record_managements = MedicalRecordManagement.all
  end

  # GET /medical_record_managements/1
  # GET /medical_record_managements/1.json
  def show
  end

  # GET /medical_record_managements/new
  def new
    @medical_record_management = MedicalRecordManagement.new
  end

  # GET /medical_record_managements/1/edit
  def edit
  end

  # POST /medical_record_managements
  # POST /medical_record_managements.json
  def create
    @medical_record_management = MedicalRecordManagement.new(medical_record_management_params)

    respond_to do |format|
      if @medical_record_management.save
        format.html { redirect_to @medical_record_management, notice: 'Medical record management was successfully created.' }
        format.json { render :show, status: :created, location: @medical_record_management }
      else
        format.html { render :new }
        format.json { render json: @medical_record_management.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /medical_record_managements/1
  # PATCH/PUT /medical_record_managements/1.json
  def update
    respond_to do |format|
      if @medical_record_management.update(medical_record_management_params)
        format.html { redirect_to @medical_record_management, notice: 'Medical record management was successfully updated.' }
        format.json { render :show, status: :ok, location: @medical_record_management }
      else
        format.html { render :edit }
        format.json { render json: @medical_record_management.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medical_record_managements/1
  # DELETE /medical_record_managements/1.json
  def destroy
    @medical_record_management.destroy
    respond_to do |format|
      format.html { redirect_to medical_record_managements_url, notice: 'Medical record management was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medical_record_management
      @medical_record_management = MedicalRecordManagement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def medical_record_management_params
      params.fetch(:medical_record_management, {})
    end
end
