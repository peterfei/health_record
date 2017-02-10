#coding:utf-8
class SmsApi

  def initialize
    @sms_api = {
        account:Figaro.env.account,
        password:Figaro.env.password,
    }
  end

  #注册验证手机验证码
  def verify_code(phone)
    code = rand(999999)
    result = client_post(phone,"验证码为#{code}。#{Figaro.env.content_tag}")
    {result:result,code:code}
  end

  private
  def client_post(phone,content,wk:nil)
    begin
      @sms_api[:msgText] = content
      @sms_api[:destmobile] = phone
      response = Curl.post(Figaro.env.sms_api,@sms_api)
      return response
    rescue Exception => e
      L.debug "发送短信异常，发送短信的功能为#{wk}，手机号码#{phone},内容为#{content}，异常:#{e.to_json}"
    end

  end


end
