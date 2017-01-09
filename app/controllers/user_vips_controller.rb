class UserVipsController < ApplicationController
  before_action :set_user_vip, only: [:show, :edit, :update, :destroy]

  # GET /user_vips
  # GET /user_vips.json
  def index
    @user_vips = UserVip.all
  end

  # GET /user_vips/1
  # GET /user_vips/1.json
  def show
  end

  # GET /user_vips/new
  def new
    @user_vip = UserVip.new
  end

  # GET /user_vips/1/edit
  def edit
  end

  # POST /user_vips
  # POST /user_vips.json
  def create
    @user_vip = UserVip.new(user_vip_params)

    respond_to do |format|
      if @user_vip.save
        format.html { redirect_to @user_vip, notice: 'User vip was successfully created.' }
        format.json { render :show, status: :created, location: @user_vip }
      else
        format.html { render :new }
        format.json { render json: @user_vip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_vips/1
  # PATCH/PUT /user_vips/1.json
  def update
    respond_to do |format|
      if @user_vip.update(user_vip_params)
        format.html { redirect_to @user_vip, notice: 'User vip was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_vip }
      else
        format.html { render :edit }
        format.json { render json: @user_vip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_vips/1
  # DELETE /user_vips/1.json
  def destroy
    @user_vip.destroy
    respond_to do |format|
      format.html { redirect_to user_vips_url, notice: 'User vip was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_vip
      @user_vip = UserVip.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_vip_params
      params.fetch(:user_vip, {})
    end
end
