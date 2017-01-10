class UsersController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: [:check_medical_records, :check_item_records]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  add_breadcrumb '会员中心', :users_path

  # GET /users
  # GET /users.json
  def index
    if params[:q].present?
      @truename = params[:q][:truename_cont]
      @sex = params[:q][:sex_eq]
      @age = params[:q][:age_eq]
      @nation = params[:q][:nation_cont]
      @id_type = params[:q][:id_type_eq]
      @id_code = params[:q][:id_code_cont]
      @blood_type = params[:q][:blood_type_eq]
      @education = params[:q][:education_eq]
      @duty = params[:q][:duty_cont]
    end
    @q = User.all.ransack(params[:q])
    @users = @q.result.page(params[:page])
  end

  # GET /users/1
  # GET /users/1.json
  def show
    add_breadcrumb "详情", :user_path
    @userfocu=UserFocu.where("user_id='#{params[:id]}'")
  end

  # GET /users/new
  def new
    add_breadcrumb "新增", :new_user_path
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    add_breadcrumb "编辑", :edit_user_path
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # ########################################################
  # | Author: wangyang
  # | Time: 2017-01-05 09:35:02
  # | Description: 获取病历记录
  # | Args: user_id,start_at,end_at,category
  # ########################################################
  def check_medical_records
    if params[:category].present?
        @category = params[:category]
        @tag_ids = Tag.where("name LIKE ?", "%#{params[:category]}%").map{|m| m.id}.join(",") rescue nil
        if @tag_ids.present?
          @medical_record_management_ids = Tagging.where("taggable_type='MedicalRecordManagement' AND context='category' AND tag_id IN (?)", @tag_ids).map{|m| m.taggable_id}.join(",") rescue nil
          if @medical_record_management_ids.present?
            if params[:start_at].present? && !params[:end_at].present?
              @start_at = DateTime.parse(params[:start_at])
              @dates = MedicalRecordManagement.select(:created_at).
                where("id IN (?) AND user_id = ? AND created_at > ?", @medical_record_management_ids, params[:user_id], @start_at).
                group("DATE_FORMAT(created_at,'%Y-%m-%d')")
            elsif !params[:start_at].present? && params[:end_at].present?
              @end_at = DateTime.parse(params[:end_at])
              @dates = MedicalRecordManagement.select(:created_at).
                where("id IN (?) AND user_id = ? AND created_at < ?", @medical_record_management_ids, params[:user_id], @end_at).
                group("DATE_FORMAT(created_at,'%Y-%m-%d')")
            elsif params[:start_at].present? && params[:end_at].present?
              @start_at = DateTime.parse(params[:start_at])
              @end_at = DateTime.parse(params[:end_at])
              @dates = MedicalRecordManagement.select(:created_at).
                where("id IN (?) AND user_id = ? AND created_at > ? AND created_at < ?", @medical_record_management_ids, params[:user_id], @start_at, @end_at).
                group("DATE_FORMAT(created_at,'%Y-%m-%d')")
            else
              @dates = MedicalRecordManagement.select(:created_at).
                where("id IN (?) AND user_id = ?", @medical_record_management_ids, params[:user_id]).
                group("DATE_FORMAT(created_at,'%Y-%m-%d')")
            end
            @medical_record_managements = []
            if @dates.present?
              @dates.each do |d|
                @record = {}
                @date = d.created_at.strftime("%Y-%m-%d")
                @record[:record_date] = @date
                @record[:record_content] = MedicalRecordManagement.where("id IN (?) AND user_id = ? AND created_at LIKE ?", @medical_record_management_ids, params[:user_id], "%#{@date}%")
                @medical_record_managements.push(@record)
              end
            end
          end
        end
    else
      if params[:start_at].present? && !params[:end_at].present?
        @start_at = DateTime.parse(params[:start_at])
        @dates = MedicalRecordManagement.select(:created_at).
          where("user_id = ? AND created_at > ?", params[:user_id], @start_at).
          group("DATE_FORMAT(created_at,'%Y-%m-%d')")
      elsif !params[:start_at].present? && params[:end_at].present?
        @end_at = DateTime.parse(params[:end_at])
        @dates = MedicalRecordManagement.select(:created_at).
          where("user_id = ? AND created_at < ?", params[:user_id], @end_at).
          group("DATE_FORMAT(created_at,'%Y-%m-%d')")
      elsif params[:start_at].present? && params[:end_at].present?
        @start_at = DateTime.parse(params[:start_at])
        @end_at = DateTime.parse(params[:end_at])
        @dates = MedicalRecordManagement.select(:created_at).
          where("user_id = ? AND created_at > ? AND created_at < ?", params[:user_id], @start_at, @end_at).
          group("DATE_FORMAT(created_at,'%Y-%m-%d')")
      else
        @dates = MedicalRecordManagement.select(:created_at).
          where("user_id = ?", params[:user_id]).
          group("DATE_FORMAT(created_at,'%Y-%m-%d')")
      end
      @medical_record_managements = []
      if @dates.present?
        @dates.each do |d|
          @record = {}
          @date = d.created_at.strftime("%Y-%m-%d")
          @record[:record_date] = @date
          @record[:record_content] = MedicalRecordManagement.where("user_id = ? AND created_at LIKE ?", params[:user_id], "%#{@date}%")
          @medical_record_managements.push(@record)
        end
      end
    end

    render json: @medical_record_managements
  end

  # ########################################################
  # | Author: wangyang
  # | Time: 2017-01-05 18:07:52
  # | Description: 获取数据统计
  # | Args: user_id,start_at,end_at,health_item_id
  # ########################################################
  def check_item_records
    if params[:health_item_id].present?
      @health_item = HealthItem.find(params[:health_item_id])
      if params[:start_at].present? && !params[:end_at].present?
        @health_item_records = @health_item.health_item_records.
          where("created_at > ?", params[:start_at])
      elsif !params[:start_at].present? && params[:end_at].present?
        @health_item_records = @health_item.health_item_records.
          where("created_at < ?", params[:end_at])
      elsif params[:start_at].present? && params[:end_at].present?
        @health_item_records = @health_item.health_item_records.
          where("created_at BETWEEN ? AND ?", params[:start_at], params[:end_at])
      else
        @health_item_records = @health_item.health_item_records
      end
      @result = { :health_item=> @health_item, :health_item_records=> @health_item_records }
    end

    render json: @result
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.fetch(:user, {})
    end
end
