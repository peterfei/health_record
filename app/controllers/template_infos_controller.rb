class TemplateInfosController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_action :set_template_info, only: [:show, :edit, :update, :destroy]
  add_breadcrumb '欢迎消息管理', :template_infos_path

  # GET /template_infos
  # GET /template_infos.json
  def index
    @wx_messages = WxMessage.where(:message_type=>'news').page(params[:page])
    respond_to do |format|
      format.html
    end
  end

  # GET /template_infos/1
  # GET /template_infos/1.json
  def show
  end

  # GET /template_infos/new
  def new
    @wx_message = WxMessage.new
  end

  # GET /template_infos/1/edit
  def edit
  end

  # POST /template_infos
  # POST /template_infos.json
  def create
    @wx_message = WxMessage.new(template_info_params)
    @wx_message.message_type = 'news'
    respond_to do |format|
      if @wx_message.save
        format.html { redirect_to template_infos_path, notice: '添加成功' }
        format.json { render :show, status: :created, location: @wx_message }
      else
        format.html { render :new }
        format.json { render json: @wx_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /template_infos/1
  # PATCH/PUT /template_infos/1.json
  def update
    respond_to do |format|
      if @wx_message.update(template_info_params)
        format.html { redirect_to template_infos_path, notice: 'Template info was successfully updated.' }
        format.json { render :show, status: :ok, location: @wx_message }
      else
        format.html { render :edit }
        format.json { render json: @wx_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /template_infos/1
  # DELETE /template_infos/1.json
  def destroy
    @wx_message.destroy
    respond_to do |format|
      format.html { redirect_to template_infos_url, notice: 'Template info was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def select_message
    @wx_messages = WxMessage.where(:message_type=>'news').order('id asc')
  end

  def do_select_message
    @update_messages = WxMessage.where(:message_type=>'news',:id=>params[:diff])
    @update_messages.update(status:params[:updateValue])
    respond_to do |format|
      format.json { render json:{status:1}}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_template_info
      @wx_message = WxMessage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def template_info_params
      params.fetch(:wx_message, {}).permit(:title,:description,:url,:pic_url)
    end
end
