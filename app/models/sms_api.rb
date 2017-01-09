#coding:utf-8
class SmsApi

  def initialize
    @sms_api = {
        account:Setting.sms_setting['account'],
        password:Setting.sms_setting['password'],
        sendDateTime:''
    }
  end

  #注册验证手机验证码
  def verify_code(phone)
    code = rand(999999)
    if phone.empty?
       result = {status:1,code:0,message:'手机号不能为空'}
    else
      result = client_post(phone,"验证码为#{code}")
    end
    result
  end
  
  private
  def client_post(phone,content,wk:nil)
    begin
      @sms_api[:msgText] = content
      @sms_api[:destmobile] = phone
      response = Curl.post(Setting.sms_setting['sms_url'],@sms_api)
    rescue Exception => e
      L.debug "发送短信异常，发送短信的功能为#{wk}，手机号码#{phone},内容为#{content}，异常:#{e.to_json}"
    end

  end


end
