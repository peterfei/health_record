class MedicalRecordManagementsController < ApplicationController
  before_action :set_medical_record_management, only: [:show, :edit, :update, :destroy]
  add_breadcrumb '病历管理', :medical_record_managements_path

  # GET /medical_record_managements
  # GET /medical_record_managements.json
  def index
    if params[:category].present?
        @tag_ids = Tag.where("name LIKE ?", "%#{params[:category]}%").map{|m| m.id}.join(",") rescue nil
        if @tag_ids.present?
          @medical_record_management_ids = Tagging.where("taggable_type='MedicalRecordManagement' AND context='category' AND tag_id IN (?)", @tag_ids).map{|m| m.taggable_id}.join(",") rescue nil
          if @medical_record_management_ids.present?
            if params[:name].present?
              @user_ids = User.where("name LIKE ?", "%#{params[:name]}%").map{|m| m.id}.join(",") rescue nil
              if @user_ids.present?
                if params[:start_at].present? && !params[:end_at].present?
                  @start_at = DateTime.parse(params[:start_at])
                  @dates = MedicalRecordManagement.select(:created_at).
                    where("id IN (?) AND user_id IN (?) AND created_at > ?", @medical_record_management_ids, @user_ids, @start_at).
                    group("DATE_FORMAT(created_at,'%Y-%m-%d')")
                elsif !params[:start_at].present? && params[:end_at].present?
                  @end_at = DateTime.parse(params[:end_at])
                  @dates = MedicalRecordManagement.select(:created_at).
                    where("id IN (?) AND user_id IN (?) AND created_at < ?", @medical_record_management_ids, @user_ids, @end_at).
                    group("DATE_FORMAT(created_at,'%Y-%m-%d')")
                elsif params[:start_at].present? && params[:end_at].present?
                  @start_at = DateTime.parse(params[:start_at])
                  @end_at = DateTime.parse(params[:end_at])
                  @dates = MedicalRecordManagement.select(:created_at).
                    where("id IN (?) AND user_id IN (?) AND created_at > ? AND created_at < ?", @medical_record_management_ids, @user_ids, @start_at, @end_at).
                    group("DATE_FORMAT(created_at,'%Y-%m-%d')")
                else
                  @dates = MedicalRecordManagement.select(:created_at).
                    where("id IN (?) AND user_id IN (?)", @medical_record_management_ids, @user_ids).
                    group("DATE_FORMAT(created_at,'%Y-%m-%d')")
                end
                @medical_record_managements = []
                if @dates.present?
                  @dates.each do |d|
                    @record = {}
                    @date = d.created_at.strftime("%Y-%m-%d")
                    @record[:record_date] = @date
                    @record[:record_content] = MedicalRecordManagement.where("id IN (?) AND user_id IN (?) AND created_at LIKE ?", @medical_record_management_ids, @user_ids, "%#{@date}%")
                    @medical_record_managements.push(@record)
                  end
                end
              end
            else
              if params[:start_at].present? && !params[:end_at].present?
                @start_at = DateTime.parse(params[:start_at])
                @dates = MedicalRecordManagement.select(:created_at).
                  where("id IN (?) AND created_at > ?", @medical_record_management_ids, @start_at).
                  group("DATE_FORMAT(created_at,'%Y-%m-%d')")
              elsif !params[:start_at].present? && params[:end_at].present?
                @end_at = DateTime.parse(params[:end_at])
                @dates = MedicalRecordManagement.select(:created_at).
                  where("id IN (?) AND created_at < ?", @medical_record_management_ids, @end_at).
                  group("DATE_FORMAT(created_at,'%Y-%m-%d')")
              elsif params[:start_at].present? && params[:end_at].present?
                @start_at = DateTime.parse(params[:start_at])
                @end_at = DateTime.parse(params[:end_at])
                @dates = MedicalRecordManagement.select(:created_at).
                  where("id IN (?) AND created_at > ? AND created_at < ?", @medical_record_management_ids, @start_at, @end_at).
                  group("DATE_FORMAT(created_at,'%Y-%m-%d')")
              else
                @dates = MedicalRecordManagement.select(:created_at).
                  where("id IN (?)", @medical_record_management_ids).
                  group("DATE_FORMAT(created_at,'%Y-%m-%d')")
              end
              @medical_record_managements = []
              if @dates.present?
                @dates.each do |d|
                  @record = {}
                  @date = d.created_at.strftime("%Y-%m-%d")
                  @record[:record_date] = @date
                  @record[:record_content] = MedicalRecordManagement.where("id IN (?) AND created_at LIKE ?", @medical_record_management_ids, "%#{@date}%")
                  @medical_record_managements.push(@record)
                end
              end
            end
          end
        end
    else
      if params[:name].present?
        @user_ids = User.where("name LIKE ?", "%#{params[:name]}%").map{|m| m.id}.join(",") rescue nil
        if @user_ids.present?
          if params[:start_at].present? && !params[:end_at].present?
            @start_at = DateTime.parse(params[:start_at])
            @dates = MedicalRecordManagement.select(:created_at).
              where("user_id IN (?) AND created_at > ?", @user_ids, @start_at).
              group("DATE_FORMAT(created_at,'%Y-%m-%d')")
          elsif !params[:start_at].present? && params[:end_at].present?
            @end_at = DateTime.parse(params[:end_at])
            @dates = MedicalRecordManagement.select(:created_at).
              where("user_id IN (?) AND created_at < ?", @user_ids, @end_at).
              group("DATE_FORMAT(created_at,'%Y-%m-%d')")
          elsif params[:start_at].present? && params[:end_at].present?
            @start_at = DateTime.parse(params[:start_at])
            @end_at = DateTime.parse(params[:end_at])
            @dates = MedicalRecordManagement.select(:created_at).
              where("user_id IN (?) AND created_at > ? AND created_at < ?", @user_ids, @start_at, @end_at).
              group("DATE_FORMAT(created_at,'%Y-%m-%d')")
          else
            @dates = MedicalRecordManagement.select(:created_at).
              where("user_id IN (?)", @user_ids).
              group("DATE_FORMAT(created_at,'%Y-%m-%d')")
          end
          @medical_record_managements = []
          if @dates.present?
            @dates.each do |d|
              @record = {}
              @date = d.created_at.strftime("%Y-%m-%d")
              @record[:record_date] = @date
              @record[:record_content] = MedicalRecordManagement.where("user_id IN (?) AND created_at LIKE ?", @user_ids, "%#{@date}%")
              @medical_record_managements.push(@record)
            end
          end
        end
      else
        if params[:start_at].present? && !params[:end_at].present?
          @start_at = DateTime.parse(params[:start_at])
          @dates = MedicalRecordManagement.select(:created_at).
            where("created_at > ?", @start_at).
            group("DATE_FORMAT(created_at,'%Y-%m-%d')")
        elsif !params[:start_at].present? && params[:end_at].present?
          @end_at = DateTime.parse(params[:end_at])
          @dates = MedicalRecordManagement.select(:created_at).
            where("created_at < ?", @end_at).
            group("DATE_FORMAT(created_at,'%Y-%m-%d')")
        elsif params[:start_at].present? && params[:end_at].present?
          @start_at = DateTime.parse(params[:start_at])
          @end_at = DateTime.parse(params[:end_at])
          @dates = MedicalRecordManagement.select(:created_at).
            where("created_at > ? AND created_at < ?", @start_at, @end_at).
            group("DATE_FORMAT(created_at,'%Y-%m-%d')")
        else
          @dates = MedicalRecordManagement.select(:created_at).
            group("DATE_FORMAT(created_at,'%Y-%m-%d')")
        end
        @medical_record_managements = []
        if @dates.present?
          @dates.each do |d|
            @record = {}
            @date = d.created_at.strftime("%Y-%m-%d")
            @record[:record_date] = @date
            @record[:record_content] = MedicalRecordManagement.where("created_at LIKE ?", "%#{@date}%")
            @medical_record_managements.push(@record)
          end
        end
      end
    end
    # binding.pry
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
