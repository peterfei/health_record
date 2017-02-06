class UsersController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: [:check_medical_records, :check_item_records]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  add_breadcrumb '会员中心', :users_path

  # GET /users
  # GET /users.json
  def index
    @truename = params[:truename]
    @sex = params[:sex]
    @age = params[:age]
    @nation = params[:nation]
    @blood_type = params[:blood_type]
    @id_type = params[:id_type]
    @id_code = params[:id_code]
    @hobby = params[:hobby]
    @education = params[:education]
    @job = params[:job]
    @duty = params[:duty]
    @skill_level = params[:skill_level]
    @general_active = params[:general_active]
    @ex_where = "vip_mark=1"
    if params[:truename].present?
      @ex_where << " AND truename LIKE '%#{params[:truename]}%'"
    end
    if params[:sex].present?
      @ex_where << " AND sex = #{params[:sex]}"
    end
    if params[:age].present?
      @ex_where << " AND age = #{params[:age]}"
    end
    if params[:nation].present?
      @ex_where << " AND nation LIKE '%#{params[:nation]}%'"
    end
    if params[:blood_type].present?
      @ex_where << " AND blood_type = #{params[:blood_type]}"
    end
    if params[:id_type].present?
      @ex_where << " AND id_type = #{params[:id_type]}"
    end
    if params[:id_code].present?
      @ex_where << " AND id_code LIKE '%#{params[:id_code]}%'"
    end
    if params[:education].present?
      @ex_where << " AND education = #{params[:education]}"
    end
    if params[:duty].present?
      @ex_where << " AND duty LIKE '%#{params[:duty]}%'"
    end
    if params[:hobby].present? || params[:job].present? || params[:skill_level].present?
      @vip_users = User.where(@ex_where).tagged_with([params[:hobby], params[:job], params[:skill_level]], :any=> true, :wild => true).page(params[:vip_page])
    else
      @vip_users = User.where(@ex_where).page(params[:vip_page])
    end
    @general_users = User.where("vip_mark=0").page(params[:general_page])
  end

  # GET /users/1
  # GET /users/1.json
  def show
    add_breadcrumb "详情", :user_path
    @userfocu=UserFocu.where("user_id='#{params[:id]}'")
    @dates = MedicalRecordManagement.select(:created_at).where("user_id = ?", @user.id).
        group("DATE_FORMAT(created_at,'%Y-%m-%d')")
    @medical_record_managements = []
    if @dates.present?
      @dates.each do |d|
        @record = {}
        @date = d.created_at.strftime("%Y-%m-%d")
        @record[:record_date] = @date
        @record[:record_content] = MedicalRecordManagement.where("user_id = ? AND created_at LIKE ?", @user.id, "%#{@date}%")
        @medical_record_managements.push(@record)
      end
    end
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
      format.html { redirect_to users_url, notice: '删除成功' }
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
    @ex_where = "user_id = #{params[:user_id]}"
    if params[:start_at].present?
      @ex_where << " AND created_at > '#{params[:start_at]}'"
    end
    if params[:end_at].present?
      @ex_where << " AND created_at < '#{params[:end_at]}'"
    end
    if params[:category].present?
      @dates = MedicalRecordManagement.select(:created_at).where(@ex_where).
        group("DATE_FORMAT(created_at,'%Y-%m-%d')").
        tagged_with([params[:category]], :any=> true, :wild => true)
    else
      @dates = MedicalRecordManagement.select(:created_at).where(@ex_where).
        group("DATE_FORMAT(created_at,'%Y-%m-%d')")
    end
      # binding.pry
    @medical_record_managements = []
    if @dates.present?
      @dates.each do |d|
        @record = {}
        @date = d.created_at.strftime("%Y-%m-%d")
        @record[:record_date] = @date
        if params[:category].present?
          @record[:record_content] = MedicalRecordManagement.where("user_id = ? AND created_at LIKE ?", params[:user_id], "%#{@date}%").
            tagged_with([params[:category]], :any=> true, :wild => true)
        else
          @record[:record_content] = MedicalRecordManagement.where("user_id = ? AND created_at LIKE ?", params[:user_id], "%#{@date}%")
        end
        @medical_record_managements.push(@record)
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
    @ex_where = "1=1"
    if params[:start_at].present?
      @ex_where << " AND created_at > '#{params[:start_at]}'"
    end
    if params[:end_at].present?
      @ex_where << " AND created_at < '#{params[:end_at]}'"
    end
    if params[:health_item_id].present?
      @health_item = HealthItem.find(params[:health_item_id])
      @health_item_subs = @health_item.health_item_subs
      @health_item_records = @health_item.health_item_records.where(@ex_where)
      @result = { :health_item=> @health_item, :health_item_subs=> @health_item_subs, :health_item_records=> @health_item_records }
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
