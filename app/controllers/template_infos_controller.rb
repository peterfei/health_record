class TemplateInfosController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_action :set_template_info, only: [:show, :edit, :update, :destroy]
  add_breadcrumb '模板消息管理', :template_infos_path

  # GET /template_infos
  # GET /template_infos.json
  def index
    @template_info = Setting.template_info
    @template_img = Setting.template_img
  end

  # GET /template_infos/1
  # GET /template_infos/1.json
  def show
  end

  # GET /template_infos/new
  def new
    @template_info = TemplateInfo.new
  end

  # GET /template_infos/1/edit
  def edit
  end

  # POST /template_infos
  # POST /template_infos.json
  def create
    if Setting.template_info.present?
      Setting.destroy :template_info
    end
    if Setting.template_img.present?
      Setting.destroy :template_img
    end

    uploader = AvatarUploader.new
    uploader.store!(params[:template_img])
    Setting.template_info = params[:template_info]
    Setting.template_img = uploader.url

    redirect_to template_infos_path, notice: '修改成功'
    # @template_info = TemplateInfo.new(template_info_params)

    # respond_to do |format|
    #   if @template_info.save
    #     format.html { redirect_to @template_info, notice: 'Template info was successfully created.' }
    #     format.json { render :show, status: :created, location: @template_info }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @template_info.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /template_infos/1
  # PATCH/PUT /template_infos/1.json
  def update
    respond_to do |format|
      if @template_info.update(template_info_params)
        format.html { redirect_to @template_info, notice: 'Template info was successfully updated.' }
        format.json { render :show, status: :ok, location: @template_info }
      else
        format.html { render :edit }
        format.json { render json: @template_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /template_infos/1
  # DELETE /template_infos/1.json
  def destroy
    @template_info.destroy
    respond_to do |format|
      format.html { redirect_to template_infos_url, notice: 'Template info was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_template_info
      @template_info = TemplateInfo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def template_info_params
      params.fetch(:template_info, {})
    end
end
