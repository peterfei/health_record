class WxCodesController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_action :set_wx_codes,only:[:download_qrcode,:show]
  wechat_api
  def index
    @wx_codes = WxCode.all.page(params[:page])
  end

  def show
  end

  def new
    @wx_code = WxCode.new
  end

  def create
    @wx_code = WxCode.new(wx_codes_params)
    if params[:wx_code][:code_type] == 'temporary'
      @wx_code.scence_id = params[:arg].to_i
    elsif params[:wx_code][:code_type] == 'permanent'
      if params[:scence] == 'num'
        @wx_code.scence_id = params[:arg].to_i
      elsif params[:scence] == 'string'
        @wx_code.scence_str = params[:arg]
      end
    end
    @wx_code.expire_time = params[:wx_code][:expire_time].to_time.to_i
    respond_to do |format|
      if @wx_code.save
        format.html { redirect_to wx_codes_path, notice: '添加成功' }
        format.json { render :show, status: :created, location: @wx_code }
      else
        format.html { render :new }
        format.json { render json: @wx_code.errors, status: :unprocessable_entity }
      end
    end

  end

  def update

  end

  def destroy

  end

  def create_qrcode
    result = {}
    if params[:code_type] == 'permanent'
      @code = WxCode.where(code_type: params[:code_type])
      code_exist = @code.where('scence_id = ? or scence_str = ?', params[:scence].to_i, params[:scence]).exists?
      if code_exist
        if params[:scence] == 'num'
          @code = @code.where(scence_id:params[:scence].to_i)
        elsif params[:scence] == 'string'
          @code = @code.where(scence_str:params[:scence])
        end
        result = {:status=> 0,result:{:ticket => @code.ticket, :url => @code.url, :qr_code_name=> @code.name,:qr_code_url =>  '/qr_code/' + @code.name}}
      else
        qr_code = wechat.qrcode_create_limit_scene(params[:arg])
        tmp_filename = download_mv(qr_code)
        result = {:status=> 1,result:{:ticket => qr_code['ticket'], :url => qr_code['url'], :qr_code_name=> tmp_filename, :qr_code_url => '/qr_code/' + tmp_filename}}
      end
    elsif params[:code_type] == 'temporary'
      expire_timestamp  = params[:expire_time].to_time.to_i
      time_now = Time.now.to_i
      qr_code = wechat.qrcode_create_scene(params[:arg].to_i,expire_timestamp - time_now)
      tmp_filename = download_mv(qr_code)
      result = {:status=> 1,result:{:ticket => qr_code['ticket'], :url => qr_code['url'], :qr_code_name=>tmp_filename , :qr_code_url => '/qr_code/' + tmp_filename}}
    end
    result[:result][:image_tag] = "<img src='#{'/qr_code/'+result[:result][:qr_code_name]}' width='200' height='200'>".html_safe
    respond_to do |format|
      format.json {render json: result}
    end
  end

  def download_qrcode
    if @wx_code.code_url.present?
      send_file("#{Rails.root}/public#{@wx_code.code_url}", type:'image/png', filename: "#{@wx_code.title}.png", disposition: 'attachment')
    end
  end

  private

  def set_wx_codes
    @wx_code = WxCode.find(params[:id])
  end

  def download_mv(qr_code)
    tmp_file = wechat.qrcode(qr_code['ticket'])
    FileUtils.mv(tmp_file.path, Rails.root.join('public','qr_code'))
    tmp_filename = File.basename(tmp_file.path)
  end

  def wx_codes_params
    params.fetch(:wx_code, {}).permit(:title,:code_type,:url,:expire_time,:ticket,:code_name,:code_url)
  end
  
end
