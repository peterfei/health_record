class WechatsController < ActionController::Base
  # For details on the DSL available within this file, see https://github.com/Eric-Guo/wechat#rails-responder-controller-dsl
  wechat_responder

  on :text do |request, content|
    request.reply.text "echo: #{content}" # Just echo
  end

  on :event, with: 'subscribe' do |request|
    # binding.pry
    # request.reply.text "User #{request[:FromUserName]} subscribe now"
    request.reply.text "欢迎使用,请先<a href='https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxd20fe2e6dc888486&redirect_uri=#{URI::escape(root_url<<"app#/createName")}&response_type=code&scope=snsapi_base&state=123#wechat_redirect'>注册</a>成我们会员，尊享服务.".html_safe
  end

  on :text, with: '张轩' do |request|
    request.reply.text "<a href='http://www.baidu.com'>subsribe</a>" #回复帮助信息
  end


end
