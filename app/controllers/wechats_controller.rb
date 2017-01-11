class WechatsController < ActionController::Base
  # For details on the DSL available within this file, see https://github.com/Eric-Guo/wechat#rails-responder-controller-dsl
  wechat_responder

  on :text do |request, content|
    request.reply.text "echo: #{content}" # Just echo
  end

  on :event, with: 'subscribe' do |request|
    user = OpenStruct.new(wechat.user request[:FromUserName])
    begin
      # binding.pry
      User.create! truename:user.nickname,sex:user.sex,wx_avatar:user.headimgurl,wx_id:user.openid,wx_name:user.nickname
    rescue Exception => e
      L.debug "微信关注用户获取失败#{e.to_json}"
    end
    request.reply.text "欢迎使用"
    # request.reply.text "User #{request[:FromUserName]} subscribe now"
    request.reply.text "欢迎使用,请先<a href='https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx53eb0519112c5efc&redirect_uri=#{URI::escape(root_url << 'app#/createName')}&response_type=code&scope=snsapi_base&state=123#wechat_redirect'>注册</a>成我们会员，尊享服务."
  end

  on :text, with: '张轩' do |request|
    request.reply.text "欢迎使用,请先<a href='https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx53eb0519112c5efc&redirect_uri=#{URI::escape(root_url << 'app#/createName')}&response_type=code&scope=snsapi_base&state=123#wechat_redirect'>注册</a>成我们会员，尊享服务." #回复帮助信息
  end


  # 当用户点击菜单时
  on :view, with: 'http://wechat.ittun.com/app' do |request, view|
    request.reply.text "#{request[:FromUserName]} view #{view}"
  end
end
